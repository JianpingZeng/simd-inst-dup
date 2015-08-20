#define DEBUG_TYPE "VP"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IntrinsicInst.h"
#include "VP/VPProfiling.h"


#include "llvm/ADT/Statistic.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"

#include <iostream>
#include <set>

using namespace llvm;
using namespace std;

//This class counts the number of value generating instuctions. No modifications
STATISTIC(fpResTypeCount, "Number of instructions instrumented with fp result type");
STATISTIC(ptrResTypeCount, "Number of instructions instrumented with ptr result type");
STATISTIC(truncResTypeCount, "Number of instructions instrumented with result type truncated");
STATISTIC(zextResTypeCount, "Number of instructions instrumented with result type zero extended");
namespace {

  class InstCounter : public ModulePass {
  public:
    static char ID;
    static bool flag;
    bool runOnModule(Module &M);
    static uint64_t insts;
    InstCounter() : ModulePass(ID){
    }
    uint64_t getTotalInsts(){
      return insts;
    }
  };
}
char InstCounter::ID = 0;
//flag to insure we only count once
bool InstCounter::flag = false;
uint64_t InstCounter::insts = 0;

static RegisterPass<InstCounter> Y("vp-insts", 
                    "Count the number of value generating instructions");
ModulePass *llvm::createInstCounter(){
  return new InstCounter();
}

bool InstCounter::runOnModule(Module &M){
  if(flag == true){
    return false;
  }
  for(Module::iterator I = M.begin(), E = M.end(); I != E; I++){
    if(!I->isDeclaration()){
      //iterate over all instructions in the function
      Function &F = *I;
      DEBUG(dbgs() << "Instructions in the function: " << F.getName() << " are\n");
      for(inst_iterator Iter = inst_begin(F), End = inst_end(F); Iter != End; ++Iter){
        Instruction *pInst = &*Iter;
        DEBUG(dbgs() << *pInst << "\n");
        DEBUG(dbgs() << "usage:\n");
        //If there is usage of an instruction then it generates an output
        //Count that in the number of instruction generating output
        //CallInst* CI = dyn_cast<CallInst>(pInst);
        if(pInst->use_empty() || isa<PHINode>(pInst) || (pInst->getType()->isAggregateType())){
          DEBUG(dbgs() << "\tThere is no use for (or phi node)" << pInst->getName() << "\n");
        }
        else{
          insts++;
          DEBUG(dbgs() << "\tdestination is " << pInst->getName() << "\n");
        }
        //for(Value::use_iterator useIt = pInst->use_begin(), useIt_e = pInst->use_end(); 
        //    useIt != useIt_e; ++useIt){
        //  if(Instruction *useInst = dyn_cast<Instruction>(*useIt)){
        //    DEBUG(dbgs() << "\t" << *useInst << "\n");
        //  }
        //}
      }
    }
  }
  flag = true;
  return false;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "VPProfiler"
char VPProfiler::ID = 0;
uint64_t VPProfiler::instr_id = -1;
DataLayout* VPProfiler::TD = NULL;

static RegisterPass<VPProfiler>
X("insert-vp-profiling", "Insert instrumentation for VP profiling");

FunctionPass *llvm::createVPProfilerPass(){
  return new VPProfiler();
}
int VPProfiler::getSize(Type* ty){
  int i = TD->getTypeSizeInBits(ty);
  switch(i){
    case 1:
      return 1;
    case 8:
      return 8;
    case 16:
      return 16;
    case 32:
      return 32;
    case 64:
      return 64;
    default:
      errs() << "getSize:" << i << " this is not handled\n";
      return -1;
  }
}

void VPProfiler::createVPDeclarations(Module &M){
  string fNames[] = {"VP_val1", "VP_val8", "VP_val16", "VP_val32"};
  LLVMContext &ctxt = M.getContext(); 
  for(int i = 0; i < 1; i++){
    vpFuncs[i] = M.getOrInsertFunction(fNames[i], Type::getVoidTy(ctxt), Type::getInt32Ty(ctxt),
               Type::getInt32Ty(ctxt), (Type *)0);
  }
}
bool VPProfiler::runOnFunction(Function &F){
  if(TD == NULL)
    TD = &getAnalysis<DataLayout>();

  if(vpFuncs[0] == NULL){
    Module &M = *(F.getParent());
    createVPDeclarations(M);
  }
  //if(F.getName() == "DeblockMb"){
  //return true;
  //}
  LLVMContext &ctxt = F.getContext();
  for(Function::iterator IF = F.begin(), IE = F.end(); IF != IE; ++IF){
    BasicBlock &BB = *IF;
    IRBuilder<> builder(&BB);
    //DEBUG(dbgs() << "CurrBB: \n");
    //DEBUG(dbgs() << BB);
    for(BasicBlock::iterator I = BB.begin(), E = BB.end(); I != E; ++I){
      //if the current instruction generated value, instrument it.
      Instruction &curInst = *I;
      //CallInst* CI = dyn_cast<CallInst>(&curInst);
      if(!curInst.use_empty() && !isa<PHINode>(&curInst) && !(curInst.getType()->isAggregateType())){
        //DEBUG(dbgs() << "currInst: " << curInst << "\n");
        //get the generated value type and instrument for that type
        Type* resultType = curInst.getType();
        int index = getSize(resultType);
        BasicBlock::iterator insrtPt = curInst;
        insrtPt++;
        builder.SetInsertPoint(insrtPt);
        vector<Value*> Args(2);
        Args[0] = ConstantInt::get(Type::getInt32Ty(ctxt), ++instr_id);
        //fp (cast to int32)
        if(resultType->getTypeID() == Type::FloatTyID || resultType->getTypeID() == Type::DoubleTyID){
          Args[1] = new FPToSIInst(&curInst, Type::getInt32Ty(ctxt), "resultFL", &(*insrtPt));
          DEBUG(dbgs() << "floating point instr: " << curInst << "\n");
          fpResTypeCount++;
          I++;
        }
        // ptr (cast to int32)
        else if(resultType->getTypeID() == Type::PointerTyID){
          Args[1] = new PtrToIntInst(&curInst, Type::getInt32Ty(ctxt), "resultPtr", &(*insrtPt));
          ptrResTypeCount++;
          I++;
        }
        //greater than 32
        //HACK tail call somehow don't work
        else if(TD->getTypeSizeInBits(resultType) > 32){
          DEBUG(dbgs() << curInst << " Daya\n");
          Args[1] = new TruncInst(&curInst, Type::getInt32Ty(ctxt), "resultTrunc", &(*insrtPt));
          truncResTypeCount++;
          I++;
        }
        //int32
        else if(TD->getTypeSizeInBits(resultType) == 32){
          Args[1] = &curInst;
        }
        //int (zero extend to int64)
        else{
          Args[1] = new ZExtInst(&curInst, Type::getInt32Ty(ctxt), "resultZExt", &(*insrtPt));
          zextResTypeCount++;
          I++;
        }
        builder.CreateCall2(vpFuncs[0], Args[0], Args[1], "");
          

        /*
        if(index < 0){
          DEBUG(dbgs() << curInst << "\n");
        }
        else{
          DEBUG(dbgs() << "type index is:" << index << "\n");
          BasicBlock::iterator insrtPt = curInst;
          insrtPt++;
          builder.SetInsertPoint(insrtPt);
          vector<Value*> Args(2);
          Args[0] = ConstantInt::get(Type::getInt32Ty(ctxt), ++instr_id);
          //Args[1] = ConstantInt::get(Type::getInt32Ty(ctxt), ++instr_id);
          if(index != 32){
            Args[1] = new ZExtInst(&curInst, Type::getInt32Ty(ctxt), "vpCast", &(*insrtPt));
          }
          else{
            Args[1] = &curInst;
          }
          DEBUG(dbgs() << "type: " << TD->getTypeSizeInBits(curInst.getType()) << "\n");
          builder.CreateCall2(vpFuncs[0], Args[0], Args[1], "");
          I++;

          //CallInst::Create(vpFuncs[0], Args.begin(), Args.end(), "", I+1);
        }*/
      }
    }

  }
  return true;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "VP_init"
//The data from the class InstCounter is used is this
namespace {
  class VPInit : public ModulePass{
    bool runOnModule(Module &M);

    public:
      virtual void getAnalysisUsage(AnalysisUsage &AU) const{
        AU.addRequired<InstCounter>();
      }
      static char ID;
      VPInit() : ModulePass(ID){
      }
  };
}
char VPInit::ID = 0;
static RegisterPass<VPInit>
V("insert-vp-init", "Insert initialization for VP profling");

ModulePass *createVPInitPass(){
  return new VPInit();
}
bool VPInit::runOnModule(Module &M){
  for(Module::iterator IF = M.begin(), E = M.end(); IF !=E; ++IF){
    Function& F = *IF;
    if(F.getName() == "main"){
      const char* FnName = "VP_init";
      LLVMContext &ctxt = M.getContext(); 
      InstCounter& instCnt = getAnalysis<InstCounter>();
      uint64_t cnt = instCnt.getTotalInsts();

      Constant *InitFn = M.getOrInsertFunction(FnName, Type::getVoidTy(ctxt), Type::getInt32Ty(ctxt), (Type *)0);
      BasicBlock& entry = F.getEntryBlock();
      BasicBlock::iterator InsertPos = entry.begin();
      while (isa<AllocaInst>(InsertPos)) ++InsertPos;

      std::vector<Value*> Args(1);
      Args[0] = ConstantInt::get(Type::getInt32Ty(ctxt), cnt, false);
      CallInst::Create(InitFn, Args, "", InsertPos);
      return true;

    }
  }
  return false;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "VP"
