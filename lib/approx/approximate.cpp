/* 
 * Author: Zhi Chen zhic2@uci.edu
 * Changes in version v7:
 * 1. vectorize store
 * 2. branch (shuffle+movd+test+jump)
 * 3. add invoke instruction
 * 4. add primitive type test
 * 5. add lastUses for instruction deletion
 *
 * Changes in version V8
 * 1. handled invoke instruction differently by looking at its normal dest and unwind dest
 *
 * Changes in version V9
 * 1. handled AVX instructions by reducing them to SSE one and duplicating them in the ymm registers.
 * 2. changed shufflevector, extractelement, and insertelement
 * 3. fixed invoked instructions by adding a new basicblock
 * 4. fixed bug in deleteInstDFS function. Changed the implmentation of getLastUses
 *
 * Changeds in version V10
 * 1. Vectorize store again
 * 2. changed instruction deletion function for Call instrucitons
 */

#define DEBUG_TYPE "APPROX"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h" //command line options
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/APInt.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/Support/TimeValue.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/IR/IRBuilder.h"
#include <llvm/IR/Module.h>
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CFG.h"
#include "approximate.hxx"
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <algorithm>

using namespace llvm;

cl::opt<bool> APVerbose("ap-verbose",
                        cl::desc("verbose"),
                        cl::init(false));
cl::opt<bool> APUseProfile("use-profile",
                        cl::desc("verbose"),
                        cl::init(true));
cl::opt<bool> APExitBB("ap-insert-BB",
                            cl::desc("Insert exit BB for transfer of control"),
                            cl::init(true));
cl::opt<bool> APValues("ap-values",
                            cl::desc("Insert checks on values"),
                            cl::init(true));
cl::opt<bool> APDuplication("ap-dup",
                            cl::desc("Insert duplication for state variables"),
                            cl::init(true));
cl::opt<bool> APNop("ap-nop",
                            cl::desc("Insert nop intrinsic"),
                            cl::init(true));
cl::opt<bool> APVPCounter("ap-vp-counter",
                            cl::desc("Insert counter instead of a function call"),
                            cl::init(false));
cl::opt<bool> APExcludeInfreq("ap-exclude-infrequent",
                            cl::desc("Exclude infrequently executed"),
                            cl::init(false));
cl::opt<bool> APErrorChecking("ap-ecc",
                            cl::desc("Insert error checking on values"),
                            cl::init(true));
cl::opt<bool> CheckAll("ap-checkall",
                            cl::desc("Error checking for all instructions"),
                            cl::init(true));
cl::opt<bool> APDebug("ap-debug",
                            cl::desc("Do the debug stuff"),
                            cl::init(false));
cl::opt<bool> localStatsAP("ap-localstats",
                            cl::desc("print the statistic collected"),
                            cl::init(false));
cl::opt<bool> scalarToVec("scalar-vector-convert",
                            cl::desc("duplicate scalr instructions and generate the corresponding vector instruction"),
                            cl::init(true));

//Exit the application when ever an error is detected
cl::opt<bool> ExitApp("exit-app-with-error",
                            cl::desc("Exit the application when error an error is detected"),
                            cl::init(true));

static cl::opt<std::string>
ProfileInfoFilename2("profile-info-file2", cl::init("llvmprof.out"),
                    cl::value_desc("filename"),
                    cl::desc("Profile file loaded by -profile-loader2"));


const PointerType* C_POINTERTYPE = PointerType::get(IntegerType::get(llvm::getGlobalContext(), 8), 0);
const IntegerType* CHARTYPE = IntegerType::get(llvm::getGlobalContext(), 8);
const PointerType* C_STRINGTYPE = PointerType::getUnqual(IntegerType::get(llvm::getGlobalContext(), 8));

STATISTIC(counter, "The number of functions greeted");
STATISTIC(totalIR, "The number of total IR instructions");
STATISTIC(duplicatedIR, "The number of dupliacted IR instructions");
STATISTIC(numOfCheckers, "The number of inserted error checking code");

char Approx::ID = 0;
//unsigned long long Approx::totalIRDyn = 0;
//unsigned long long Approx::duplicatedIRDyn = 0;
unsigned long long Approx::totVars = 0;
//unsigned long long Approx::totFPVarsDyn = 0;
//unsigned long long Approx::totErrors = 0;
unsigned long long Approx::totVecInst = 0;
bool Approx::flag = false;
GlobalVariable* Approx::vpGlobal = NULL;

//!keep the statitics of the total number of soft errors
GlobalVariable* Approx::softErrorNumGobal = NULL;
GlobalVariable* Approx::errorThreshGlobal = NULL;


Instruction* Approx::lastWrongInstr = NULL;
Value* Approx::exitStr = NULL;
Value* Approx::exitDirectly = NULL;
Value* Approx::errorStr = NULL;
Value* Approx::printPC = NULL;

bool Approx::doFinalization(Module &M){
  if(localStatsAP){
//    errs() << totalIRDyn << " The number of total dynamic IR instructions" << "\n"; 
//    errs() << stateVarsDyn << " The number of total dynamic state variables" << "\n"; 
//    errs() << duplicatedIRDyn << " The number of dupliacted dynamic IR instructions" << "\n"; 
//    errs() << expChecksDyn << " The number of total expected value dynamic instructions inserted" << "\n";
    errs() << "----------------------------------" << "\n";
  }
  return true;
}

static RegisterPass<Approx> X("approx", "Insert checking for values");
void Approx::getAnalysisUsage(AnalysisUsage &AU) const{
  AU.addRequired<LoopInfo>();
  AU.addRequired<DataLayout>();
}

bool Approx::runOnFunction(Function &F){

  std::string funcName = F.getName().str();
  //if (funcName != "_ZNK10FullMatrixIdE5vmultIfEEvR6VectorIT_ERKS4_b")
  //  return false;
 
  errs() << "Analyzing function: " << funcName << "\n"; 

  TD = &getAnalysis<DataLayout>();
  ++counter;
  currF = &F;
  for(tInstrToInfoObj::iterator iter = instrToInfoObj.begin(); iter != instrToInfoObj.end(); iter++){
    delete ((*iter).second);
  }

  //initialization
  instrToInfoObj.clear();
  vcmpToCheckInst.clear();
  cmpInstInserted.clear();
  vcmpInstInserted.clear();
  valueCheckSet.clear();
  valueRangeCheckSet.clear();
  ptrCheckSet.clear();
  alreadySeen.clear();
  scalarToVectorMap.clear();
  argsScalarToVectorMap.clear();
  globalScalarToVectorMap.clear();
  instrVec.clear();
  tobeFixedPhiNodes.clear();
  extractedInst.clear();

  LI = &getAnalysis<LoopInfo>();

  for(inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I){
    Instruction *pInst = &*I;
    //errs() << "Instruction is " << *pInst << "\n";
    //getFrequentRange(VP->InstToIdMap[pInst]);
    //exit(1);
    instrInfo* infoObj = new instrInfo(pInst);
    instrToInfoObj[pInst] = infoObj;
    instrVec.push_back(pInst);

// ------------------- added by zhi for f.p. instruction duplication ---------------------
// isVectorTy should be handled differently because there are two possible solutions for it.
// 1. duplicate the whole instruction for vectorized instructions because there is no free slot in a SSE/AVX register
// 2. broadcast the high 128/64 bits to the low 128/64 bits depending on AVX/SSE. In this case the original instruction
//    and the duplicated instructions are packed in the same register. 
// We have a setFPVarVector method to check vector instructions. 
//  if ((pInst->getType())->isFPOrFPVectorTy() || 
//      pInst->getOpcode() == Instruction::Store ||
//      pInst->getOpcode() == Instruction::FCmp) {// || (pInst->getType())->isVectorTy()) {
	  if ((pInst->getType())->isVectorTy()) {
	    //errs()<< *pInst << " is a vector instruction."<<"\n";	
        bool isAvx = false;
        VectorType *vTy = dyn_cast<VectorType>(pInst->getType());
        int numOfBits = vTy->getBitWidth();
        int numOfElem = vTy->getNumElements();
        instrToInfoObj[pInst]->setVectorInst();

        for (User::op_iterator uit = pInst->op_begin(); uit != pInst->op_end(); ++uit) {
          Value *val = *uit;
          VectorType *opType = dyn_cast<VectorType>(val->getType());
         
          if (opType && (opType->getBitWidth() == 512)) {
            isAvx = true;
            break;
          }
        }
        
        if (pInst->getOpcode() != Instruction::ShuffleVector && (isAvx || numOfBits == 512)) {
        //if (isAvx || numOfBits > 256) {
          instrToInfoObj[pInst]->setAVXInst();
        }
        else if (numOfElem >= 2 && numOfBits > 0) {
          instrToInfoObj[pInst]->setSSEInst();
        }
        else {
          if (vTy->isPtrOrPtrVectorTy()) {
            int ptrSize = TD->getPointerTypeSizeInBits(vTy);
            int totalBits = numOfElem * ptrSize;

            if (totalBits == 512) {
              instrToInfoObj[pInst]->setAVXInst();
            }
            else if (numOfElem >= 2) {
              instrToInfoObj[pInst]->setSSEInst();
            }
          }
        }
        totVecInst++;
      }
	  instrToInfoObj[pInst]->setVar();
	  totVars++;
//  }
    totalIR++;
  }

  errs() << "\nInstruction scanning is done! Now performing instruction duplication......" << "\n\n";

  if(APDuplication){
    duplicateProducers();
  }
  
  errs() << "\nInstruction duplication is done! Now fixing the phi nodes and cleaning the instrumented scalar instructions....." << "\n\n";

  fixHolesInPhiNodes();
 
  errs() << "All phi nodes are refined! Now deleting the scalar instructions......" << "\n\n"; 
  if (scalarToVec) {
    deleteInstrumentedScalarInst();
  }

  errs() << "\nInstruction cleaning is done! Now splitting the basic blocks according to the inserted error checking code...." << "\n\n";

  if(APVPCounter){
    createGlobal("errorCount"); 
  }
  //split at inserted cmps and point to exit block
  if (APErrorChecking) {
    createExitBB();
    splitBBAndPointExitBlock();
  }

  errs() << "\nInstrumenation for Function " << funcName << " is done! You can generate code with LLC\n\n";

  flag = true;
  return true;
}

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupProducers"

int Approx::duplicateProducers(){
  int longestPath = 0;
//  DEBUG(dbgs() << "*** Duplicating producers of state variables in function " <<  currF->getName() << " ***" << "\n");
  DEBUG(dbgs() << "*** Duplicating producers of variables in function " <<  currF->getName() << " ***" << "\n");
  int SV_chain = 0;
  std::stringstream scalarDupName("S");
  std::stringstream vectorDupName("V");
  Instruction *dupInst = NULL;
  //for(std::map<Instruction*, instrInfo*>::iterator iter = instrToInfoObj.begin(); iter != instrToInfoObj.end(); iter++) { 
  for (std::vector<Instruction*>::iterator it = instrVec.begin(); it != instrVec.end(); it++) {

    instrInfo *currInstInfo = instrToInfoObj[*it];
  //  if (currInstInfo->isVar() && scalarToVectorMap.find(*it) == scalarToVectorMap.end()){
    Instruction *currInst = *it;
    BasicBlock::iterator instIt = currInst;
    instIt++;
    //errs() << "Current instr " << *currInst << " " << *currInst->getType() <<"  " << currInst->getOpcode() << "\n";

    if (scalarToVectorMap.find(currInst) == scalarToVectorMap.end() || currInst->getOpcode() == Instruction::PHI){
      if (handledByValue(currInst)) {
         DEBUG(dbgs() << "Handled by value (exact or range)" << "\n");
      }
      else {
        //DEBUG(errs() << "Current instr " << *currInst << " " << *currInst->getType() << "\n");
        std::stringstream chainName;
        std::stringstream checkingName;
        if(currInstInfo->isVectorInst() && currInstInfo->isAVXInst()){       // if the current instruction is already vectorized, we can only do scalar duplication
          chainName << vectorDupName.str() << SV_chain << "_D";
          checkingName << "EDCS" << chainName.str() ;

          dupInst = duplicateProdRec(currInst, chainName.str());
          if (dupInst != NULL && APErrorChecking) {
            //(errs() << "Duplicated instr " << *dupInst << "\n");
            DEBUG(dbgs() << "Duplicated instr " << *dupInst << "\n");

            if (needErrorChecking(instIt)) {
            //error checking
       	      insertCmp(currInst, dupInst, currInst, checkingName.str(), true);
              numOfCheckers++;
            }

          }
        }
        else {
          chainName << scalarDupName.str() << SV_chain << "_D";
          checkingName << "EDCV" << chainName.str();
          Instruction *vectorizedInst = duplicateScalarToVector(currInst, chainName.str()); 
          //errs() << "vectorizedInst " << *vectorizedInst << "\n";
            
          //error checking  
          if(APErrorChecking && vectorizedInst != NULL) {  // the current inst is arithmetic and convert
            /*if (currInst->getOpcode() != Instruction::BitCast || 
               (currInst->getOpcode() == Instruction::BitCast &&
                vectorizableBitcast(currInst))) {
              dupInst = createShuffleInst(vectorizedInst, chainName.str());
            }
            else {  //double check here
                dupInst = vectorizedInst;
                vectorizedInst = currInst;
            }*/
            
            if (CheckAll) {
                if (currInst->getOpcode () != Instruction::BitCast && currInst->getOpcode() != Instruction::Call) {
                  dupInst = createShuffleInst(vectorizedInst, chainName.str());
                  insertCmp(dupInst, dupInst, vectorizedInst, checkingName.str(), true);
                  numOfCheckers++;
                }
            } 
            else if (needErrorChecking(instIt)) {
              dupInst = createShuffleInst(vectorizedInst, chainName.str());
              insertCmp(dupInst, dupInst, vectorizedInst, checkingName.str(), true);
              numOfCheckers++;
            }
          }
        }
        SV_chain++;
      }
    }
    else {  // this instruction is instrumented before, we need to check if every operands is appropriately vectorized
      Instruction *dupCurInst = scalarToVectorMap[currInst]->replacedBy();
      // exclude phi instructions because the holes with undefval in them will be fixed in an additional pass  
      if (currInst->getOpcode() != dupCurInst->getOpcode() || currInst->getOpcode() == Instruction::PHI) { 
        //rebuild the instruction duplciated by shufflevector: %fadd = fadd <2xdouble> %1, <2xdouble> %2
        //to fadd = fadd <4xdouble> %1_d, <4xdouble> %2_d
        if (currInst->getOpcode() != Instruction::PHI) {
          scalarToVectorMap.erase(currInst);
          dupCurInst = duplicateScalarToVector(currInst, currInst->getName()); 
        }
        continue;
      }

      int i = 0;
      for (User::op_iterator uIt = currInst->op_begin(), dupIt = dupCurInst->op_begin(); uIt != currInst->op_end(); ++uIt, ++i) {
        if (Instruction *opInst = dyn_cast<Instruction>(uIt)) {
          Instruction *dupOpInst = scalarToVectorMap[opInst]->replacedBy();
          Instruction *curOpInst = dyn_cast<Instruction>(*dupIt);
          Value *opVal = dyn_cast<Value> (*dupIt);
          if ((!isa<Constant>(opVal)) && dupOpInst->getOpcode() != curOpInst->getOpcode()) {
          // the current vectorized operand is instrumented by insert and shuffle, but the scalar operand is vectorized with a better version
          // in this case, we need to change it to the better version. line 105-115 in mandelbrot.bc is an example for this case.
          //  errs() << "dupOpInst: " << *dupOpInst << "\n";
          //  errs() << "curOpInst: " << *curOpInst << "\n";
            dupCurInst->setOperand(i, dyn_cast<Value>(dupOpInst));
            dupIt++;
            if (opVal->getNumUses() == 0) {
              curOpInst->eraseFromParent();
            }
          }
          else {
           dupIt++;
          }
        }
      } //end for
    }//end else
  }
  return longestPath;
}

//check if an instruction is vectorizable
bool Approx::vectorizableBitcast(const Instruction *pInst) {
    Value *oprand = pInst->getOperand(0);
    if (oprand->getType()->isVectorTy() || pInst->getType()->isVectorTy())
      return false;
    return true;
}

bool Approx::needErrorChecking(Instruction *currInst) {
    BasicBlock::iterator pInst = currInst;
    if (!pInst)
        return false;

    if (pInst->getOpcode() == Instruction::GetElementPtr) {
        pInst++;
        if (pInst && (pInst->getOpcode() == Instruction::Store || pInst->getOpcode() == Instruction::Call))
            return true;
    }

    //if (pInst->getOpcode() == Instruction::Store || pInst->getOpcode() == Instruction::Call)
    //    return true;

    for (Value::use_iterator useIt = pInst->use_begin(), e = pInst->use_end(); useIt != e; ++useIt) {
        Instruction *useInst = dyn_cast<Instruction> (*useIt);
        if (useInst && (useInst->getOpcode() == Instruction::Store || useInst->getOpcode() == Instruction::Call))
            return true;
    }

    Instruction *extractedInst;
    if (scalarToVectorMap.find(currInst) != scalarToVectorMap.end() && scalarToVectorMap[pInst]->isInstrumented()) {
        extractedInst = scalarToVectorMap[pInst]->extractFrom();
        for (Value::use_iterator useIt = extractedInst->use_begin(), e = extractedInst->use_end(); useIt != e; ++useIt) {
            Instruction *useInst = dyn_cast<Instruction> (*useIt);
            if (useInst && (useInst->getOpcode() == Instruction::Store || useInst->getOpcode() == Instruction::Call))
                return true;
        }
    }

    return false;
}

Instruction* Approx::createShuffleInst(Instruction *pInst, const std::string& instName) {
  Instruction *dupInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);
  Type* u32Ty = Type::getInt32Ty(currF->getContext());
  Value *Val = dyn_cast<Value> (pInst);

  VectorType *vecTy = dyn_cast<VectorType>(pInst->getType());
  unsigned numOfElem = vecTy->getNumElements();
  SmallVector<Constant*, 8> MaskVec(numOfElem);
  Value *undef = UndefValue::get(vecTy);
  Value *mask = NULL, *shuffleVal = NULL;

  if (numOfElem == 2) {
    MaskVec[0] = ConstantInt::get(u32Ty, 1); MaskVec[1] = ConstantInt::get(u32Ty, 0);
  }
  else if (numOfElem == 4) {
    MaskVec[0] = ConstantInt::get(u32Ty, 2); MaskVec[1] = ConstantInt::get(u32Ty, 3);
    MaskVec[2] = ConstantInt::get(u32Ty, 0); MaskVec[3] = ConstantInt::get(u32Ty, 1);
  }
  else if (numOfElem == 8) {
    MaskVec[0] = ConstantInt::get(u32Ty, 4); MaskVec[1] = ConstantInt::get(u32Ty, 5);
    MaskVec[2] = ConstantInt::get(u32Ty, 6); MaskVec[3] = ConstantInt::get(u32Ty, 7);
    MaskVec[4] = ConstantInt::get(u32Ty, 0); MaskVec[5] = ConstantInt::get(u32Ty, 1);
    MaskVec[6] = ConstantInt::get(u32Ty, 2); MaskVec[7] = ConstantInt::get(u32Ty, 3);
  }

  mask = ConstantVector::get(MaskVec);
  shuffleVal = builder.CreateShuffleVector(Val, undef, mask, "SF"+instName);
  dupInst  = dyn_cast<Instruction> (shuffleVal);

  //dupInst = pInst;
  DEBUG(errs() << "the shuffled instruction is: " << *dupInst << "\n");
  return dupInst;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupScalarToVector"
//duplicate the scalar instruction to vector mode
Instruction* Approx::duplicateScalarToVector(Instruction *pInst, const std::string &instName) { 
  Instruction *duplicatedInst = NULL;
  if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end() && pInst->getOpcode() != Instruction::PHI) {
    duplicatedInst = scalarToVectorMap[pInst]->replacedBy();
  }
  else {
    switch(pInst->getOpcode()) {
      //memory instructions
      case Instruction::GetElementPtr:
        duplicateScalarGEP1(pInst, instName);
        break;
      case Instruction::Load:
        duplicateScalarLoad(pInst, instName); 
        break;
      case Instruction::Store:
        duplicateScalarStore(pInst, instName);
        break;
      case Instruction::Alloca:
        break;

      //llvm terminators
      case Instruction::Ret:
        instrumentReturn(pInst, instName);
        break;
      case Instruction::Br:
        duplicateBranch(pInst, instName);
        break;
      case Instruction::Switch:
        //duplicateSwitch(pInst, instName);
        break;
      case Instruction::Invoke:
        duplicateScalarInvoke(pInst, instName);
        break;

      case Instruction::ExtractElement:
        duplicateExtractElement(pInst, instName);
        break;
      case Instruction::ExtractValue:
        duplicateExtractValue(pInst, instName);
        break;
      case Instruction::InsertElement:
        duplicateInsertElement(pInst, instName);
        break;
      case Instruction::ShuffleVector:
        duplicateShuffleVector(pInst, instName);
        break;

      case Instruction::PHI:
        //duplicatedInst = duplicatePhiNode(pInst, instName);
        duplicatePhiNodeVectorTy(pInst, instName);
        break;
      case Instruction::Select:
        duplicateSelect(pInst, instName);
        break;
      
      //standard arithmetic operations and comparisons
      case Instruction::FCmp: 
      case Instruction::ICmp: 
      case Instruction::FAdd: 
      case Instruction::Add:
      case Instruction::FSub:
      case Instruction::Sub:
      case Instruction::FMul:
      case Instruction::Mul:
      case Instruction::FDiv:
      case Instruction::UDiv:
      case Instruction::SDiv:
      case Instruction::FRem:
      case Instruction::URem:
      case Instruction::SRem:
      case Instruction::Shl:
      case Instruction::LShr:
      case Instruction::AShr:
      case Instruction::And:
      case Instruction::Or:
      case Instruction::Xor:
        duplicatedInst = duplicateScalarArithmetic(pInst, instName);
        break;

      case Instruction::Call: {
        CallInst *call = dyn_cast<CallInst> (pInst);
        //Type *retTy = call->getType();
        Function *func = call->getCalledFunction();
        std::string funName = "vcall"; // = func->getName().str();
        if (func != NULL) {
          funName = func->getName().str();
        }

        //errs() << "Return type of " << funName << " is: " << *retTy << "\n";

        if (funName == "sqrt" || funName == "fabs" || funName == "sin" ||
            funName == "cos" || funName == "exp" || funName == "log" || 
            funName == "log10" || funName == "log2" || funName == "floor" ||
            funName == "ceil" || funName == "trunc" || funName == "rint" ||
            funName == "round" || funName == "exp2")
          duplicatedInst = duplicateScalarArithmetic(pInst, instName, 1);    //mainly for sqrt, sin, cos....
        else if (funName == "maxnum" || funName == "minnum" || funName == "pow" || funName == "powi")
          duplicatedInst = duplicateScalarArithmetic(pInst, instName, 2);    //for functions with 2 parameters
        else if (funName == "fma")
          duplicatedInst = duplicateScalarArithmetic(pInst, instName, 3);    //for functions with 3 parameters
        else 
          duplicatedInst = duplicateCall(pInst, instName);
        break;
      }

      //convert instruction:
      case Instruction::FPTrunc:
      case Instruction::Trunc:
      case Instruction::FPExt:
      case Instruction::ZExt:
      case Instruction::SExt:
        duplicatedInst = duplicateFPTruncExt(pInst, instName);
        break;

      case Instruction::SIToFP:
      case Instruction::FPToSI:
      case Instruction::UIToFP:
      case Instruction::FPToUI:
      case Instruction::IntToPtr:
      case Instruction::PtrToInt:
      //case Instruction::AddrSpaceCast:
        duplicatedInst = duplicateTypeConvert(pInst, instName);
        break;

      case Instruction::BitCast: {      
      //FIXME. is <2 x doubl>* a vectorTy or pointerTy? No matter what it is, don't duplicate it
        Value *oprand = pInst->getOperand(0);
        if (oprand->getType()->isVectorTy() || pInst->getType()->isVectorTy()) {
            duplicateBitcast(pInst, instName);
        }
        else {
          duplicateScalarArithmetic(pInst, instName); 
        }
        break;
      }

      default:
        break;
    }
  }
  return duplicatedInst;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupScalarMemory"
//just create a vector for Invoke instruction
//Note that invoke is a termination instruction, therefore we cannot add the duplicated instr right after it. Instead
//we have to insert the duplciate right before the use instruction of it.
/*Instruction* Approx::duplicateScalarInvoke(Instruction* pInst, const std::string &instName) {
  Value *invokeVal = dyn_cast<Value> (pInst);
  Instruction *vInvoke = NULL;

  if (!isPrimitiveType(pInst) || invokeVal->getNumUses() == 0)
    return NULL;

  BasicBlock *curBB = pInst->getParent();
  InvokeInst *invokeInst = dyn_cast<InvokeInst> (pInst);
  BasicBlock *normalDest = invokeInst->getNormalDest();
  //BasicBlock *unwindDest = invokeInst->getUnwindDest();
  //insert the vectorized value at the beginning of the normal destination. FIXME: How to deal with phi nodes?
  Instruction *insertAtND = normalDest->getFirstNonPHI();
  //Instruction *insertAtUD = unwindDest->getFirstNonPHI();

  IRBuilder <> builder(&*insertAtND);

  Value *vInvokeVal;
  if (pInst->getType()->isVectorTy()) {
    Value *mask = createMask(pInst);
    vInvokeVal = builder.CreateShuffleVector(invokeVal, invokeVal, mask, "shuffle"+instName);
  }
  else {
    vInvokeVal = builder.CreateVectorSplat(VEC_LENGTH, invokeVal, "splat"+instName);
  }
  vInvoke = dyn_cast<Instruction> (vInvokeVal);
  instrInfo *pInstInfo = new instrInfo(vInvoke);
  pInstInfo->setReplacedBy(vInvoke);
  scalarToVectorMap[pInst] = pInstInfo;

  return vInvoke; 
}*/

Instruction* Approx::duplicateScalarInvoke(Instruction* pInst, const std::string &instName) {
  Value *invokeVal = dyn_cast<Value> (pInst);
  Instruction *vInvoke = NULL;

  if (!isPrimitiveType(pInst) || invokeVal->getNumUses() == 0)
    return NULL;

  BasicBlock *curBB = pInst->getParent();
  InvokeInst *invokeInst = dyn_cast<InvokeInst> (pInst);
  BasicBlock *normalDest = invokeInst->getNormalDest();

  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  
  IRBuilder <> builder(curBB);

  //errs() << "end" << *curBB->end() << "\n";

  Value *vInvokeVal;
  if (pInst->getType()->isVectorTy()) {
    Value *mask = createMask(pInst);
    vInvokeVal = builder.CreateShuffleVector(invokeVal, invokeVal, mask, "shuffle"+instName);
  }
  else {
    vInvokeVal = builder.CreateVectorSplat(VEC_LENGTH, invokeVal, "splat"+instName);
  }

  builder.CreateBr(normalDest);

  insertAt = pInst;
  insertAt++;
  BasicBlock *generatedBB = curBB->splitBasicBlock(insertAt);
  invokeInst->setNormalDest(generatedBB);
  insertAt = pInst;
  insertAt++;
  insertAt->eraseFromParent();

  vInvoke = dyn_cast<Instruction> (vInvokeVal);
  instrInfo *pInstInfo = new instrInfo(vInvoke);
  pInstInfo->setReplacedBy(vInvoke);
  scalarToVectorMap[pInst] = pInstInfo;

  return vInvoke; 
}

Instruction *Approx::insertUseOfInvoke(Instruction* pInst, Instruction *insertPtr, const std::string &instName) {
  Instruction *vInvoke = NULL;
  BasicBlock::iterator insertAt = insertPtr;
  IRBuilder<>builder(&*insertAt);

  //errs() << "InsertPtr: " << *insertPtr << "\n";
  Value *vInvokeVal = dyn_cast<Value> (pInst);
  Value *scalarToVector;
  if (pInst->getType()->isVectorTy()) {
    Value *mask = createMask(pInst);
    scalarToVector = builder.CreateShuffleVector(vInvokeVal, vInvokeVal, mask, "shuffle"+instName);
  }
  else {
    scalarToVector = builder.CreateVectorSplat(VEC_LENGTH, vInvokeVal, "splatInvoke"+instName);
  }
  vInvoke = dyn_cast<Instruction> (scalarToVector);

  DEBUG(errs() <<"vectorized Invoke instruction: "<< *vInvoke << "\n");
  return vInvoke;
}

//if a field in Alloca/GEP instruction is instrumented before, extract it
Instruction *Approx::duplicateScalarGEP(Instruction* pInst, const std::string &instName) {
  Instruction *vGepInst = NULL;
  Value *gepValue;

  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  Instruction *newGEP = pInst->clone();
  newGEP->setName(instName);
  newGEP->insertBefore(insertAt);
  bool needNewGEP = false;
  insertAt = newGEP;
  IRBuilder<> builder(&*insertAt);
  Type* u32Ty = Type::getInt32Ty(currF->getContext());
  Value *index =  ConstantInt::get(u32Ty, 1);
  unsigned i = 0;

  for(User::op_iterator it =  pInst->op_begin(), it_e = pInst->op_end(); it != it_e; ++it, ++i){
    Value* usedVal = *it;
    Instruction *curInst = dyn_cast<Instruction> (usedVal);
    if (curInst && scalarToVectorMap.find(curInst) != scalarToVectorMap.end()) { 
      needNewGEP = true;
      Value *extVal = NULL;
      if (curInst->getOpcode() == Instruction::Alloca ||
          curInst->getOpcode() == Instruction::Load ||
          curInst->getOpcode() == Instruction::ExtractElement ||
          curInst->getOpcode() == Instruction::GetElementPtr) {
        continue;
      }
      else if (scalarToVectorMap[curInst]->isInstrumented()) {
        extVal = scalarToVectorMap[curInst]->extractFrom();
      }
      else {
        BasicBlock::iterator tmp;
        Instruction *vecOp = scalarToVectorMap[curInst]->replacedBy();
        tmp = vecOp; 
        if (curInst->getOpcode() != Instruction::PHI && curInst->getOpcode() != Instruction::LandingPad) {
          tmp++;
        }
        else {
          while (tmp->getOpcode() == Instruction::PHI || tmp->getOpcode() == Instruction::LandingPad)
            tmp++;
        }
        IRBuilder<> b(&*tmp);

        extVal = b.CreateExtractElement(vecOp, index, "extract"+instName);
        scalarToVectorMap[curInst]->setInstrumented(dyn_cast<Instruction>(extVal));
        extractedInst.push_back(extVal);
      }
      newGEP->setOperand(i, extVal);
    }
    else {
        needNewGEP = false;
        break;
    }
  }
 
  if (!needNewGEP) {
    gepValue = dyn_cast<Value> (pInst);
  }
  else {
    gepValue = dyn_cast<Value> (newGEP);
  } 

  insertAt++;
  Value *scalarToVector;
  if (gepValue->getType()->isVectorTy()) {
    Value *mask = createMask(dyn_cast<Instruction>(gepValue));
    scalarToVector = builder.CreateShuffleVector(gepValue, gepValue, mask, "shuffleGEP"+instName);
  }
  else {
    scalarToVector = builder.CreateVectorSplat(VEC_LENGTH, gepValue, "splatGEP"+instName);
  }
    //errs() << *scalarToVector << "   " << scalarToVector->getType() << "\n";
  vGepInst = dyn_cast<Instruction> (scalarToVector);
   
  if (!needNewGEP) 
    newGEP->eraseFromParent(); 
  instrInfo *pInstInfo = new instrInfo(vGepInst);
  pInstInfo->setReplacedBy(vGepInst);
  scalarToVectorMap[pInst] = pInstInfo;
  DEBUG(errs() <<"vectorized GEP instruction: "<< *vGepInst << "\n");
 
  return vGepInst;
}

Instruction *Approx::duplicateScalarGEP1(Instruction* &pInst, const std::string &instName) {
  Instruction *vGepInst = NULL;

  BasicBlock::iterator tmp;
  unsigned i = 0;

  Type* u32Ty = Type::getInt32Ty(currF->getContext());
  Value *index =  ConstantInt::get(u32Ty, 1);
  for(User::op_iterator it =  pInst->op_begin(), it_e = pInst->op_end(); it != it_e; ++it, ++i){
    Value* usedVal = *it;
    Value *extVal = NULL; 
    Instruction *curInst = dyn_cast<Instruction> (usedVal);
    if (curInst && scalarToVectorMap.find(curInst) != scalarToVectorMap.end()) { 
      if (curInst->getOpcode() == Instruction::Alloca ||
          curInst->getOpcode() == Instruction::Load ||
          curInst->getOpcode() == Instruction::ExtractElement ||
          curInst->getOpcode() == Instruction::GetElementPtr) {
        continue;
      }
      else if (scalarToVectorMap[curInst]->isInstrumented()) {
        extVal = scalarToVectorMap[curInst]->extractFrom(); 
      }
      else {
        Instruction *vecOp = scalarToVectorMap[curInst]->replacedBy();
        tmp = vecOp; 
        if (curInst->getOpcode() != Instruction::PHI && curInst->getOpcode() != Instruction::LandingPad) {
          tmp++;
        }
        else {
          while (tmp->getOpcode() == Instruction::PHI || tmp->getOpcode() == Instruction::LandingPad)
            tmp++;
        }
        IRBuilder<> builder(&*tmp);
        extVal = builder.CreateExtractElement(vecOp, index, "extract"+instName);
        scalarToVectorMap[curInst]->setInstrumented(dyn_cast<Instruction>(extVal));
        extractedInst.push_back(extVal);
      }
      pInst->setOperand(i, extVal);
    }
  }
 
  DEBUG(errs() <<"vectorized GEP1 instruction: "<< *pInst << "\n");
  return vGepInst;
}

//duplicate extractlement instr. 
Instruction *Approx::duplicateExtractElement(Instruction *pInst, const std::string &instName) {
  Instruction *vExtract = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);
  Value *extractVal = dyn_cast<Value> (pInst);
  Value *vExtVal;

  if (pInst->getType()->isVectorTy()) {
    Value *mask = extractMask(pInst);
    vExtVal = builder.CreateShuffleVector(extractVal, extractVal, mask, "shufExtEV"+instName);
  }
  else {
    Value *vecVal = pInst->getOperand(0);
    if (vecVal->getType()->isVectorTy()) {  //if the operand is a vector
      Constant *indConst = dyn_cast<Constant>(pInst->getOperand(1));
      int index;
      if (ConstantDataSequential *CDS = dyn_cast<ConstantDataSequential> (indConst)) {
        index = CDS->getElementAsInteger(0);
      }
      else { 
        index = cast<ConstantInt>(indConst)->getSExtValue();
      }
      VectorType *vTy = dyn_cast<VectorType>(vecVal->getType());
      int numOfElem = vTy->getNumElements();
      SmallVector<Constant*, 8> MaskVec(2);
      //for (int i = 0; i < 2 * numOfElem; i++) {
      //  MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), index + i * numOfElem);
      //}
      MaskVec[0] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), index);
      MaskVec[1] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), index + numOfElem);
      Value *mask = ConstantVector::get(MaskVec);
      Value *vecValDup = insertScalarToVectorMap(dyn_cast<Instruction>(vecVal), instName);
      vExtVal = builder.CreateShuffleVector(vecValDup, vecValDup, mask, "shufExt"+instName);
    }
    else {
      vExtVal = builder.CreateVectorSplat(VEC_LENGTH, extractVal, "splatExtE"+instName);
    }
  }
  vExtract = dyn_cast<Instruction> (vExtVal);
  instrInfo *pInstInfo = new instrInfo(vExtract);
  pInstInfo->setReplacedBy(vExtract);
  scalarToVectorMap[pInst] = pInstInfo;

  //(errs() << "vectorized extractelement: " << *vExtract << "\n");    
  DEBUG(errs() << "vectorized extractelement: " << *vExtract << "\n");    
  return vExtract;
}

//duplciate extractvalue instruction
Instruction *Approx::duplicateExtractValue(Instruction *pInst, const std::string &instName) {
  Instruction *vExtract = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);
  Value *extractVal = dyn_cast<Value> (pInst);
  Value *vExtVal;

  if (pInst->getType()->isVectorTy()) {
    Value *mask = createMask(pInst);
    vExtVal = builder.CreateShuffleVector(extractVal, extractVal, mask, "shufExtVV"+instName);
  }
  else {
    vExtVal = builder.CreateVectorSplat(VEC_LENGTH, extractVal, "splatExtV"+instName);
  }

  vExtract = dyn_cast<Instruction> (vExtVal);
  instrInfo *pInstInfo = new instrInfo(vExtract);
  pInstInfo->setReplacedBy(vExtract);
  scalarToVectorMap[pInst] = pInstInfo;
  
  scalarToVectorMap[pInst]->setInstrumented(pInst);

  //(errs() << "vectorized extractelement: " << *vExtract << "\n");    
  DEBUG(errs() << "vectorized extractelement: " << *vExtract << "\n");    
  return vExtract;
}
//<result> = insertelement <n x <ty>> <val>, <ty> <elt>, <ty2> <idx>    ; yields <n x <ty>>
//if we have the following insertelement instructions:
//%49 = insertelement <2 x double> undef, double %div, i32 0
//%50 = insertelement <2 x double> %49, double %div, i32 1
//check if %div in %49 is already defined, actually it has to
//if it is, then change %50 = vectorized %div and remove %49
//return NULL for insertelement because they are either removed or not duplicated
//note there are two cases for insertelement
//case1: insert N elements to a vector
//case2: insertelement followed by a shuffle instruction.
Instruction *Approx::duplicateInsertElement(Instruction *&pInst, const std::string &instName) {
  Instruction *vInsElem = NULL;
  Value *vInsElemVal = NULL;
  Value *pVal = dyn_cast<Value> (pInst);

  BasicBlock::iterator tmp = pInst;
  tmp++;
  Instruction *nextUse = dyn_cast<Instruction>(*(pVal->use_begin()));
  //only deal with the last insertelemnt instruction
  if (nextUse->getOpcode() == Instruction::InsertElement && nextUse->getOperand(0) == pVal)
    return NULL;
  else if (nextUse->getOpcode() == Instruction::ShuffleVector && 
          (nextUse->getOperand(0) == pVal || nextUse->getOperand(1) == pVal)) {
    return NULL; 
  }

  Value *insDst = pInst->getOperand(0);
  if (isa<UndefValue>(insDst)) { //not the last insert
    return NULL;        
  }

  int count = 1;
  Instruction *valTmp = dyn_cast<Instruction> (pInst->getOperand(0));

  while (valTmp->getOpcode() == Instruction::InsertElement) {
    count++;
    if (isa<UndefValue> (valTmp->getOperand(0)))
      break;
    valTmp = dyn_cast<Instruction> (valTmp->getOperand(0)); 
  }

  IRBuilder<> builder(&*tmp);
  BasicBlock::iterator val = pInst;
  Value *mask = NULL, *wholeMask = NULL;

  if (count == 1) {
    Value *valVec = insertScalarToVectorMap(val->getOperand(0), instName);
    Value *valSca = insertScalarToVectorMap(val->getOperand(1), instName);
    wholeMask = createMask(pInst); 
    Value *valSca1 = builder.CreateShuffleVector(valSca, valSca, wholeMask, "shufIns"+instName);
    Constant *indConst = dyn_cast<Constant>(val->getOperand(2));
    int index = cast<ConstantInt>(indConst)->getSExtValue();
    VectorType *vecTy = dyn_cast<VectorType> (pInst->getType());
    int numOfElem = vecTy->getNumElements();
    SmallVector<Constant*, 8> MaskVec(numOfElem * 2);
    for (int i = 0; i < numOfElem * 2; ++i) {
      if ((i != index) && (i != index + numOfElem)) {
        MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), i);
      }
      else {
        MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), numOfElem * 2);
      }
    }
    Value *mask = ConstantVector::get(MaskVec);
    vInsElemVal = builder.CreateShuffleVector(valVec, valSca1, mask, "shufIns"+instName);
  }
  else {
    Value *inst4 = val->getOperand(1);
    Value *val4 = insertScalarToVectorMap(inst4, instName);
    val = dyn_cast<Instruction> (val->getOperand(0));
    Value *inst3 = val->getOperand(1);
    Value *val3 = insertScalarToVectorMap(inst3, instName);
  
    //errs() << "val3 " << *val4 << "   " << *val3 << "      " << numOfInserts << "\n";
    if (count == 4 || count == 8) {    //float or i32 for avx
      val = dyn_cast<Instruction> (val->getOperand(0));
      Value *inst2 = val->getOperand(1);
      Value *val2 = insertScalarToVectorMap(inst2, instName);
      val = dyn_cast<Instruction> (val->getOperand(0));
      Value *inst1 = val->getOperand(1);
      Value *val1 = insertScalarToVectorMap(inst1, instName);
      if (count == 4) {
        mask = extractMask(pInst);
        Value *shuf1 = builder.CreateShuffleVector(val1, val2, mask, "shuf12"+instName);
        Value *shuf2 = builder.CreateShuffleVector(val3, val4, mask, "shuf34"+instName);
        wholeMask = createInsertElementMask(pInst, true);
        vInsElemVal = builder.CreateShuffleVector(shuf1, shuf2, wholeMask, "shuf1234"+instName);
      }
      else { //float or i32 for avx2
        //errs() << "val3 " << *val4 << "   " << *val3 << "      " << count << "\n";
        mask = extractHalfMask(pInst);
        Value *shuf12 = builder.CreateShuffleVector(val1, val2, mask, "shuf12"+instName);
        Value *shuf34 = builder.CreateShuffleVector(val3, val4, mask, "shuf34"+instName);
        wholeMask = createInsertElementMask(pInst, false);
        Value *shuf1234 = builder.CreateShuffleVector(shuf12, shuf34, wholeMask, "shuf1234"+instName);

        val = dyn_cast<Instruction> (val->getOperand(0));
        Value *inst_1 = val->getOperand(1);
        Value *val_1 = insertScalarToVectorMap(inst_1, instName);
        val = dyn_cast<Instruction> (val->getOperand(0));
        Value *inst_2 = val->getOperand(1);
        Value *val_2 = insertScalarToVectorMap(inst_2, instName);

        val = dyn_cast<Instruction> (val->getOperand(0));
        Value *inst_3 = val->getOperand(1);
        Value *val_3 = insertScalarToVectorMap(inst_3, instName);
        val = dyn_cast<Instruction> (val->getOperand(0));
        Value *inst_4 = val->getOperand(1);
        Value *val_4 = insertScalarToVectorMap(inst_4, instName);
      
        mask = extractHalfMask(pInst);
        Value *shuf56 = builder.CreateShuffleVector(val_1, val_2, mask, "shuf56"+instName);
        Value *shuf78 = builder.CreateShuffleVector(val_3, val_4, mask, "shuf78"+instName);
        wholeMask = createInsertElementMask(pInst, false);
        Value *shuf5678 = builder.CreateShuffleVector(shuf56, shuf78, wholeMask, "shuf5678"+instName);
        
        wholeMask = createInsertElementMask(pInst, true);
        vInsElemVal = builder.CreateShuffleVector(shuf1234, shuf5678, wholeMask, "shuf12345678"+instName);
      }
    }
    else if (count == 2) {   //double or i64
      wholeMask = createInsertElementMask(pInst, true); 
      vInsElemVal = builder.CreateShuffleVector(val3, val4, wholeMask, "shuf"+instName);
    }
  }

  vInsElem = dyn_cast<Instruction>(vInsElemVal);
  instrInfo *pInstInfo = new instrInfo(vInsElem);
  pInstInfo->setReplacedBy(vInsElem);
  scalarToVectorMap[pInst] = pInstInfo;

  //errs() << "Vectorized InsertElement: " << *vInsElem << "\n";
  duplicatedIR++;
  return vInsElem;
}

//vectorize shuffle instruction
Instruction *Approx::duplicateShuffleVector(Instruction *&pInst, const std::string &instName) {
  if (!instrToInfoObj[pInst]->isSSEInst())  //shuffle must work on a vector 
    return NULL;
  
  Instruction *vShufInst = NULL;
  Value *vShufVal = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);

  BasicBlock::iterator instIt = pInst;
  if (instIt != pInst->getParent()->front())
    instIt--;

  if (instIt->getOpcode() == Instruction::InsertElement && pInst->getOperand(0) == pInst->getOperand(1)) {
    Instruction *insertInst = dyn_cast<Instruction> (instIt->getOperand(1));
    Value *insertVal = insertScalarToVectorMap(insertInst, instName); 
    Value *mask = createMask(insertInst);
    vShufVal = builder.CreateShuffleVector(insertVal, insertVal, mask, "shufVec"+instName);
  }
  else {
    // get the shuffle mask <2 x i32> <x, y> => (x, y+2, x+2, y+4)
    //                      <4 x i32> <w, x, y, z> => ();
    ShuffleVectorInst *shufInst = dyn_cast<ShuffleVectorInst>(pInst);
    SmallVector<int, 16> shufMask = shufInst->getShuffleMask();
    int numOfElem = shufMask.size();

    SmallVector<Constant*, 16> MaskVec(numOfElem * 2);
    for (int i = 0; i < numOfElem; ++i) {
      if (shufMask[i] >= numOfElem) {
        MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), shufMask[i] + numOfElem);
        MaskVec[i+numOfElem] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), shufMask[i] + numOfElem * 2);
      }
      else if (shufMask[i] >= 0){
        MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), shufMask[i]);
        MaskVec[i+numOfElem] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), shufMask[i] + numOfElem);
      }
      else {   // FIXME <i32 1, i32 undef> where undef is -1 
        //MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), -1);
        //MaskVec[i+numOfElem] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), -1);
        MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), 0);
        MaskVec[i+numOfElem] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), 0);
      }
    }
    Value *mask = ConstantVector::get(MaskVec);
    //errs() << "masssssssssssssssssssssk  " << *mask << "\n";

    Instruction *inst1 = dyn_cast<Instruction> (pInst->getOperand(0));
    Instruction *inst2 = dyn_cast<Instruction> (pInst->getOperand(1));
    Value *shufVal1, *shufVal2;
    if (isa<UndefValue>(pInst->getOperand(0))) {
      shufVal2 = insertScalarToVectorMap(inst2, instName); 
      //shufVal1 = shufVal2;
      shufVal1 = UndefValue::get(dyn_cast<VectorType>(shufVal2->getType()));
    }
    else if (isa<UndefValue>(pInst->getOperand(1))) {
      shufVal1 = insertScalarToVectorMap(inst1, instName); 
      //shufVal2 = shufVal1;
      shufVal2 = UndefValue::get(dyn_cast<VectorType>(shufVal1->getType()));
    }
    else {
      shufVal1 = insertScalarToVectorMap(inst1, instName); 
      shufVal2 = insertScalarToVectorMap(inst2, instName); 
    }
    vShufVal = builder.CreateShuffleVector(shufVal1, shufVal2, mask, "shuVec"+instName);
  }

  vShufInst = dyn_cast<Instruction> (vShufVal);
  instrInfo *pInstInfo = new instrInfo(vShufInst);
  pInstInfo->setReplacedBy(vShufInst);
  scalarToVectorMap[pInst] = pInstInfo;

  //errs() << "vectorized shufflevector: " << *vShufInst << "\n";
  duplicatedIR++;
  return vShufInst;
}

//vectorize return instructions
Instruction *Approx::instrumentReturn(Instruction *&pInst, const std::string &instName) {
  ReturnInst *retInst = dyn_cast<ReturnInst> (pInst);
  Value *retVal = retInst->getReturnValue();
  if (retVal == NULL) {
    return NULL;
  }

  if (retVal->getType()->isVoidTy()) {
    return NULL;
  }

  Instruction *newRet = NULL;
  BasicBlock::iterator insertAt;

  if (dyn_cast<Constant> (retVal)) {
    return NULL;
  }
  Instruction *ret = dyn_cast<Instruction> (retVal);

  Value *newRetVal = NULL;
  if (scalarToVectorMap.find(ret) != scalarToVectorMap.end()) {
    if (scalarToVectorMap[ret]->isInstrumented()) {
      newRetVal = scalarToVectorMap[ret]->extractFrom(); 
    }
    else {
      Type* u32Ty = Type::getInt32Ty(currF->getContext());
      Value *index =  ConstantInt::get(u32Ty, 1);
      Instruction *vecOp = scalarToVectorMap[ret]->replacedBy();
      insertAt = vecOp;
      insertAt++;
      while (insertAt->getOpcode() == Instruction::PHI || insertAt->getOpcode() == Instruction::LandingPad)
        insertAt++;

      IRBuilder<> builder(&*insertAt);
      newRetVal = builder.CreateExtractElement(vecOp, index, "extract"+instName);
      scalarToVectorMap[ret]->setInstrumented(dyn_cast<Instruction>(newRetVal));
      extractedInst.push_back(newRetVal);
    }
    pInst->setOperand(0, newRetVal);
  } 
  return newRet; 
}

//vector the scalar load instruction
//the following method load two consecutive elements (_mm_load_pd). That not what we want
//we want _mm_load1_pd
/*Instruction *Approx::duplicateScalarLoad(Instruction* pInst, const std::string &instName) {
  Value *loadAddr = pInst->getOperand(1);
  //Instruction *operand = dyn_cast<Instruction>(loadValue);
  LoadInst *vectorizedLDInstr = NULL;
  VectorType *vecTy = NULL;
  Type *lvTy = loadValue->getType();
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);
 
  Value *scalarToVector = builder.CreateVectorSplat(VEC_LENGTH, loadAddr, "splat"+instName);
  //stick to the alignment of the original load
  vectorizedLDInstr = builder.CreateLoad(scalarToVector, "Ld"+instName);
  unsigned alignment = (dyn_cast<LoadInst> (pInst))->getAlignment();
  if (alignment >= 4) {
    vectorizedLDInstr->setAlignment(alignment);
  }
  instrInfo *pInstInfo = new instrInfo(vectorizedLDInstr);
  pInstInfo->setReplacedBy(vectorizedLDInstr);
  scalarToVectorMap[pInst] = pInstInfo;
  //pInst->eraseFromParent();
  errs() <<"vectorized load instruction: "<< *vectorizedLDInstr << "\n";
  //loadValue->replaceAllUsesWith(scalarToVector);   //FAIL: loadValue and scalarToVector are with different types
  return vectorizedLDInstr;
}*/

Instruction *Approx::duplicateScalarLoad(Instruction* pInst, const std::string &instName) {
  Value *loadValue = dyn_cast<Value> (pInst);
  //Instruction *operand = dyn_cast<Instruction>(loadValue);
  Instruction *vectorizedLDInstr = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);
  Value *scalarToVector;

  if (!isPrimitiveType(pInst)) {           //the type must be a primitive type
    return NULL;
  }

  //if the current load value is not vectorized, we need to vectorize the value first
  if ((loadValue->getType())->isVectorTy()) {
    Value *mask = createMask(pInst);
    scalarToVector = builder.CreateShuffleVector(loadValue, loadValue, mask, "shufLD"+instName);
  }
  else {
    scalarToVector = builder.CreateVectorSplat(VEC_LENGTH, loadValue, "splatLD"+instName);
  }
  vectorizedLDInstr = dyn_cast<Instruction> (scalarToVector);

  instrInfo *pInstInfo = new instrInfo(vectorizedLDInstr);
  pInstInfo->setReplacedBy(vectorizedLDInstr);
  scalarToVectorMap[pInst] = pInstInfo;
    //pInst->eraseFromParent();
  DEBUG(errs() <<"vectorized load instruction: "<< *vectorizedLDInstr << "\n");
    //loadValue->replaceAllUsesWith(scalarToVector);   //FAIL: loadValue and scalarToVector are with different types

  return vectorizedLDInstr;
}

//two possible solutions to instrument a store instruction
//1. make the store value scalar by extracting one element from the duplicated value
//2. vectorize the store address ptr by using bitcast 
Instruction* Approx::duplicateScalarStore(Instruction *pInst, const std::string& instName) {
  Instruction *vecStInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);

  Value *oprand0 = pInst->getOperand(0);
  Instruction *op0Inst = dyn_cast<Instruction>(oprand0);
  Value *stAddr = pInst->getOperand(1);    //address to store
  if (isa<Constant> (oprand0))
  {
    vecStInst = pInst->clone();
    vecStInst->insertBefore(insertAt);
  }
  else if (oprand0->getType()->isVectorTy() && instrToInfoObj[op0Inst]->isAVXInst()) {  //vector store
    Value *vecStVal = oprand0;
    if (scalarToVectorMap.find(op0Inst) != scalarToVectorMap.end()) {
      vecStVal = scalarToVectorMap[op0Inst]->replacedBy();
    }
    vecStInst = pInst->clone();
    vecStInst->insertBefore(insertAt);
    vecStInst->setOperand(0, vecStVal);
  }
  else {
    //errs() << " rrrrrrrrrrrrrrr " << *pInst->getOperand(0)->getType() << "      " << *op0Inst <<"  " << *oprand0<< "\n";
    Type* u32Ty = Type::getInt32Ty(currF->getContext());
    Value *index =  ConstantInt::get(u32Ty, 1);

    Value *extract = NULL;
    //extract = insertScalarToVectorMap(oprand0, instName);
    if (scalarToVectorMap.find(op0Inst) != scalarToVectorMap.end()) { //local variable
      if (scalarToVectorMap[op0Inst]->isInstrumented() && instrToInfoObj[op0Inst]->isSSEInst()) {
        extract = scalarToVectorMap[op0Inst]->extractFrom();
      }
      else {
        Instruction *vecOp0 = scalarToVectorMap[op0Inst]->replacedBy();
        BasicBlock::iterator tmp = vecOp0;
        tmp++;
        while (tmp->getOpcode() == Instruction::PHI || tmp->getOpcode() == Instruction::LandingPad)
          tmp++;
        IRBuilder<> b(&*tmp);
        if (instrToInfoObj[op0Inst]->isSSEInst()) {
          Value *mask = extractMask(op0Inst); 
          extract = b.CreateShuffleVector(vecOp0, vecOp0, mask, "shufST"+instName);
          scalarToVectorMap[op0Inst]->setInstrumented(dyn_cast<Instruction>(extract));
          extractedInst.push_back(extract);
        }
        else {
          extract = b.CreateExtractElement(vecOp0, index, "extract"+instName);
          /*unsigned width = op0Inst->getType()->getScalarSizeInBits(); 
          if (width / 64) {
            extract = vecOp0;
            Type *vecPtrTy = PointerType::getUnqual(VectorType::get(stAddr->getType()->getPointerElementType(), VEC_LENGTH));
            stAddr = builder.CreateBitCast(stAddr, vecPtrTy, "BC"+instName);
          }
          else {//FIXME. How to deal with the width < 64 bits so that the number of pextrq instructions can be reduced?
            //Type *vecTy = VectorType::get(op0Inst);
            extract = b.CreateExtractElement(vecOp0, index, "extract"+instName);
          }*/
        }
      }
    }
    else {
      extract = oprand0; 
    }
    vecStInst = builder.CreateAlignedStore(extract, stAddr, (dyn_cast<StoreInst> (pInst))->getAlignment());

    //Type *vecPtrTy = PointerType::getUnqual(VectorType::get(stAddr->getType()->getPointerElementType(), VEC_LENGTH));
    //Value *vecStAddr = builder.CreateBitCast(stAddr, vecPtrTy, "BC"+instName);
    //errs() << *extract << " " << *vecPtrTy<< " "<< *vecStAddr->getType() << "\n";
    //vecStInst = builder.CreateAlignedStore(extract, vecStAddr, (dyn_cast<StoreInst> (pInst))->getAlignment());
  }

  instrInfo *pInstInfo = new instrInfo(vecStInst);
  pInstInfo->setReplacedBy(vecStInst);
  scalarToVectorMap[pInst] = pInstInfo;
  DEBUG(errs() << "New generated store instruction is: " << *vecStInst << "\n");

  return vecStInst;
}

Instruction* Approx::duplicateSelect(Instruction *pInst, const std::string& instName) {
  Instruction *vecSelect = NULL;
  Value *dupVal = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);

  Value *cond = pInst->getOperand(0);
  //Instruction *condInst = dyn_cast<Instruction> (cond);
  //VectorType *condTy = VectorType::get(Type::getInt1Ty(ctxt), VEC_LENGTH);
  Value *condVec = insertScalarToVectorMap(cond, instName);


  Value *oprand1 = pInst->getOperand(1);
  Value *oprand2 = pInst->getOperand(2);
  //errs() <<" fffffffffffff " << *oprand1 << "   " << *oprand2 <<"\n";

  Value *trueVec = NULL, *falseVec = NULL;
  trueVec = insertScalarToVectorMap(oprand1, instName);
  falseVec = insertScalarToVectorMap(oprand2, instName);

  VectorType *vCondTy = dyn_cast<VectorType>(condVec->getType());
  VectorType *vOpTy = dyn_cast<VectorType>(trueVec->getType());
  if (vCondTy->getNumElements() < vOpTy->getNumElements()) {
  //  Value *mask = createMask(dyn_cast<Instruction> (trueVec));
  //  condVec = builder.CreateShuffleVector(condVec, condVec, mask, "shuffle" + instName);
    condVec = builder.CreateVectorSplat(vOpTy->getNumElements(), cond); //FIXME, this is buggy if cond is a vector
  }
  
  std::string name = pInst->getName().str();
  dupVal = builder.CreateSelect(condVec, trueVec, falseVec, name+instName);
  vecSelect = dyn_cast<Instruction> (dupVal);
  instrInfo *pInstInfo = new instrInfo(vecSelect);
  pInstInfo->setReplacedBy(vecSelect);
  scalarToVectorMap[pInst] = pInstInfo;

  DEBUG(errs() << "vectorized select instruction is: " << *vecSelect << "\n");

  duplicatedIR++;
  return vecSelect;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupOtherInst"
//Solution1:
//%16 = fcmp ogt <4 x float> %15, %cr 
//%17 = sext <4 x i1> %16 to <4 x i32> 
//%18 = bitcast <4 x i32> %17 to i128 
//%19 = icmp ne i128 %18, 0 
//br i1 %19, label %true1, label %false2 
//it generates one cmpps + one ptest + one br instruction
//Solution2:
//%16 = fcmp ogt <4 x float> %15, %cr 
//%17 = sext <4 x i1> %16 to <4 x i8> 
//%18 = bitcast <4 x i8> %17 to i32
//%19 = icmp ne i32 %18, 0 
//br i1 %19, label %true1, label %false2 
//it generates shuffle, movd, test, jump
//solution 3:
//%16 = fcmp ogt <4 x float> %15, %cr
//%17 = extractelement < 4 x float> %16, i32 0
//br i1 %17, lable %true, lable %false
Instruction* Approx::duplicateBranch(Instruction *pInst, const std::string& instName) {
  Instruction *newBr = NULL;
  IRBuilder<> builder(&*pInst);
  LLVMContext &ctxt = currF->getContext();
  BranchInst *branch = dyn_cast<BranchInst> (pInst);

  if (branch->isUnconditional()) {  //no need to instrument unconditional branch
    return newBr;
  }
 
  Value *condVal = branch->getCondition();
  if (isa<Constant>(condVal)) {
    return newBr;
  }
 
  //Instruction *condInst = dyn_cast<Instruction> (condVal);
  Value *vecCond = insertScalarToVectorMap(condVal, instName);

  //Type *uTy;
  //solution 1 
  /*if (VEC_LENGTH == 2) 
    uTy = Type::getInt64Ty(ctxt);
  else if (VEC_LENGTH == 4)
    uTy = Type::getInt32Ty(ctxt);

  //Value *mask = builder.CreateBitCast(vecCond, Type::getIntNTy(ctxt, VEC_LENGTH), "BC"+instName);
  //extend the sign to 128/VEC_LENGTH
  VectorType *dstTy = VectorType::get(uTy, VEC_LENGTH);
  Value *sext = builder.CreateSExt(vecCond, dstTy, "zext"+instName);
  Value *mask = builder.CreateBitCast(sext, Type::getIntNTy(ctxt, 128), "BC"+instName);
  //Value *constZero = ConstantInt::get(Type::getIntNTy(ctxt, VEC_LENGTH), 0);
  Value *constZero = ConstantInt::get(Type::getIntNTy(ctxt, 128), 0);
  Value *oneBitMask = builder.CreateICmpNE(mask, constZero, "msk" + instName);
  */

  //solution 2
  /*if (VEC_LENGTH == 2) 
    uTy = Type::getInt16Ty(ctxt);
  else if (VEC_LENGTH == 4)
    uTy = Type::getInt8Ty(ctxt);

  //Value *mask = builder.CreateBitCast(vecCond, Type::getIntNTy(ctxt, VEC_LENGTH), "BC"+instName);
  //extend the sign to 32/VEC_LENGTH
  VectorType *dstTy = VectorType::get(uTy, VEC_LENGTH);
  Value *sext = builder.CreateSExt(vecCond, dstTy, "zext"+instName);
  Value *mask = builder.CreateBitCast(sext, Type::getInt32Ty(ctxt), "BC"+instName);
  //Value *constZero = ConstantInt::get(Type::getIntNTy(ctxt, VEC_LENGTH), 0);
  Value *constZero = ConstantInt::get(Type::getInt32Ty(ctxt), 0);
  Value *oneBitMask = builder.CreateICmpNE(mask, constZero, "msk" + instName);
  */

  Type* u32Ty = Type::getInt32Ty(ctxt);
  Value* index = ConstantInt::get(u32Ty, 0);
  Value* oneBitMask = builder.CreateExtractElement(vecCond, index, "extCmp"+instName);

  (dyn_cast<BranchInst> (pInst))->setCondition(oneBitMask);
  duplicatedIR++;
  return newBr;
}

//vectorize switch instructions. Note that the condition of switch is always an intty
//no problem, switch will be handled in the instruction deletion pass
Instruction* Approx::duplicateSwitch(Instruction *pInst, const std::string& instName) {
  Instruction *vSwitch = NULL;

  SwitchInst *switchInst = dyn_cast<SwitchInst> (pInst);
  Value *condVal = switchInst->getCondition();
  if (isa<Constant>(condVal)) {
    return NULL;
  }
 
  //Instruction *condInst = dyn_cast<Instruction> (condVal);
  Value *newCond = insertScalarToVectorMap(condVal, instName);
  //Value *extractedCond = build...extract(condVal);

  switchInst->setCondition(newCond);
 
  return vSwitch;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupTruncExt"
// this function needs to be tested
Instruction* Approx::duplicateFPTruncExt(Instruction *pInst, const std::string& instName) {
  Instruction *dupInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);

  bool avxOprand = false;
  Value *oprand = pInst->getOperand(0);
   
  if (oprand->getType()->isVectorTy()) {

    VectorType *avxTy = dyn_cast<VectorType> (oprand->getType());
    if (avxTy->getBitWidth() == 256) {
      avxOprand = true;
    }
  }
  
  VectorType *dstTy; 
  if (pInst->getType()->isVectorTy()) {

    VectorType *sseTy = dyn_cast<VectorType> (pInst->getType());
    if (avxOprand) {
      dstTy = VectorType::get(sseTy->getElementType(), sseTy->getNumElements());
    }
    else {
      dstTy = VectorType::get(sseTy->getElementType(), sseTy->getNumElements() * 2);
    }

  }
  else {
    dstTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  }

  Value *vecConvert;
 
  //FIXME. There is a bug if the oprand is <4 x double/i64> because the duplicate of it would be <8 x double/i64> 
  Value *src;
  if (avxOprand) {
    src = oprand;
  }
  else {
    src = insertScalarToVectorMap(oprand, instName);
  }

  std::string name = pInst->getName().str();
  switch (pInst->getOpcode()) {
    case Instruction::FPExt:
      vecConvert = builder.CreateFPExt(src, dstTy, name+instName);
      break;
    case Instruction::FPTrunc:
      vecConvert = builder.CreateFPTrunc(src, dstTy, name+instName);
      break;
    case Instruction::Trunc:
      vecConvert = builder.CreateTrunc(src, dstTy, name+instName);
      break;
    case Instruction::ZExt:
      vecConvert = builder.CreateZExt(src, dstTy, name+instName);
      break;
    case Instruction::SExt:
      vecConvert = builder.CreateSExt(src, dstTy, name+instName);
      break;
  }

  if (avxOprand) {
    Value *mask = createMask(pInst);
    vecConvert = builder.CreateShuffleVector(vecConvert, vecConvert, mask, "shufTrunc" + instName);
  }
  dupInst = dyn_cast<Instruction> (vecConvert);

  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  DEBUG(errs() << "Vectorized ExtOrTrunc instruction is : " << *dupInst << "\n");

  duplicatedIR++;
  return dupInst;
}

//vector the scalar integer to FP conversion instructions
Instruction* Approx::duplicateTypeConvert(Instruction *pInst, const std::string& instName) {
  Instruction *dupInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);

  bool avxOprand = false;
  Value *oprand = pInst->getOperand(0);
  if (oprand->getType()->isVectorTy()) {
    VectorType *avxTy = dyn_cast<VectorType> (oprand->getType());
    if (avxTy->getBitWidth() == 256) {
      avxOprand = true;
    }
  }
  
  std::string name = pInst->getName().str();
  //Instruction *opInst = dyn_cast<Instruction> (oprand);
  VectorType *dstTy; 
  if (pInst->getType()->isVectorTy()) {
    VectorType *sseTy = dyn_cast<VectorType> (pInst->getType());
    if (avxOprand) {
      dstTy = VectorType::get(sseTy->getElementType(), sseTy->getNumElements());
    }
    else {
      dstTy = VectorType::get(sseTy->getElementType(), sseTy->getNumElements() * 2);
    }
  }
  else {
    dstTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  }

  Value *src, *vecConvert;

  if (avxOprand) {
    src = oprand;
  }
  else {
    src = insertScalarToVectorMap(oprand, instName);
  }

  switch(pInst->getOpcode()) {
    case Instruction::UIToFP:
      vecConvert = builder.CreateUIToFP(src, dstTy, name+instName);
      break;
    case Instruction::SIToFP:
      vecConvert = builder.CreateSIToFP(src, dstTy, name+instName);
      break;
    case Instruction::FPToUI:
      vecConvert = builder.CreateFPToUI(src, dstTy, name+instName);
      break;
    case Instruction::FPToSI:
      vecConvert = builder.CreateFPToSI(src, dstTy, name+instName);
      break;
    case Instruction::IntToPtr:
      vecConvert = builder.CreateIntToPtr(src, dstTy, name+instName);
      break;
    case Instruction::PtrToInt:
      vecConvert = builder.CreatePtrToInt(src, dstTy, name+instName);
      break;
    default:
      return NULL;
  }
  if (avxOprand) {
    Value *mask = createMask(pInst);
    vecConvert = builder.CreateShuffleVector(vecConvert, vecConvert, mask, "shufConv" + instName);
  }
  dupInst = dyn_cast<Instruction> (vecConvert);

  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  DEBUG(errs() << "Vectorized conversion instruction: " << *dupInst << "\n");
 
  duplicatedIR++;
  return dupInst;
}

//vectorize bitcast
//if one of the operands for bitcast instruction is a vector, we cannot vectorize it
Instruction* Approx::duplicateBitcast(Instruction *pInst, const std::string& instName) {
  Instruction *dupInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);

  Value *oprand = pInst->getOperand(0);
  
  if (oprand->getType()->isVectorTy() || pInst->getType()->isVectorTy()) {
    dupInst = pInst->clone();
    dupInst->setName(instName);
    dupInst->insertBefore(insertAt); 
    Value *bcVal = dyn_cast<Value>(pInst);
    Value *vBCVal = builder.CreateVectorSplat(VEC_LENGTH, bcVal, "splatBC"+instName);
    Instruction *bcInst = dyn_cast<Instruction> (vBCVal);
    instrInfo *pInstInfo = new instrInfo(bcInst);
    pInstInfo->setReplacedBy(bcInst);
    scalarToVectorMap[pInst] = pInstInfo;
  }
      
  DEBUG(errs() << "Vectorized bitcast : " << *dupInst << "\n");
  
  return dupInst;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupPhiNode"
//%phi1 = phi double [0.0, %if.then1] [1.0, %if.else2]
//%phi2 = phi double [1.0, %if.then2] [1.0, %if.else3]
//duplicate of %phi1
//duplicate of %phi2
//
Instruction* Approx::duplicatePhiNode(Instruction *pInst, const std::string &instName) {
  Instruction *dupInst = NULL;
  //IRBuilder<> builder(&*pInst);
  BasicBlock::iterator insertAt = pInst;

  //find a valid insert point for the duplicated instruction.
  //consider the situation where multiple phi nodes are sitting at the top of the current basic block.
  //we cannot insert the duplicate between phi nodes becase all phi nodes have to be grouped at the top
  //of the basic block.

  BasicBlock *pbb = pInst->getParent();

  //if the phi node is the first phi node, insert the duplicate value after the last phi node
  //otherwise, insert the current duplicate after the duplicate of the previous phi node
  if (&(pbb->front()) == pInst) {   //check if the phi node is the first node 
    while (insertAt->getOpcode() == Instruction::PHI || insertAt->getOpcode() == Instruction::LandingPad)
      insertAt++;
  }
  else { 
    Instruction *lastInst = --insertAt;
    if (lastInst && pInst->getOpcode() == lastInst->getOpcode()) {
      insertAt = scalarToVectorMap[lastInst]->replacedBy();
    }
    else {
      insertAt++;
    }
    insertAt++;
  }
  

  IRBuilder<> builder(&*insertAt);
  Value *phiNodeVal = dyn_cast<Value>(pInst);
  Value *Val;
  if (pInst->getType()->isVectorTy()) {
    Value *mask = createMask(pInst);
    Val = builder.CreateShuffleVector(phiNodeVal, phiNodeVal, mask, "shufPHI"+instName); 
  }
  else {
    Val = builder.CreateVectorSplat(VEC_LENGTH, phiNodeVal, "splatPHI"+instName);
  }
  dupInst= dyn_cast<Instruction> (Val);

  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  DEBUG(errs() << "Vectorized phi node: " << *dupInst << "\n");
      
  return dupInst;
}

Instruction* Approx::duplicatePhiNodeVectorTy(Instruction *pInst, const std::string &instName) {
  Instruction *dupInst = NULL;
  bool replaceAllUses = false;
  Value *dupVectorPhiVal = NULL;

  if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end()) {// this instruction has already been instrumented
    Instruction *dupVectorPhi = scalarToVectorMap[pInst]->replacedBy();
    if (dupVectorPhi->getOpcode() != Instruction::PHI) {
      dupVectorPhiVal = dyn_cast<Value>(dupVectorPhi);
      replaceAllUses = true;
    }
    else
      return dupInst;
  }


  BasicBlock::iterator insertAt = pInst;
  insertAt++; 
  IRBuilder<> builder(&*insertAt);
  //LLVMContext &ctxt = currF->getContext();

  if (!isPrimitiveType(pInst)) {           //the type must be a primitive type
    return NULL;
  }

  PHINode *scalarPhi = dyn_cast<PHINode> (pInst);
  unsigned numIncomingValues = scalarPhi->getNumIncomingValues();
  VectorType *retTy; 
  if (pInst->getType()->isVectorTy()) {
    VectorType *sseTy = dyn_cast<VectorType> (pInst->getType());
    retTy = VectorType::get(sseTy->getElementType(), sseTy->getNumElements() * 2);
  }
  else {
    retTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  }
  //Type  *retTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  //PHINode *vectorPhi = builder.CreatePHI(retTy, numIncomingValues, "VPhi"+instName);
  PHINode *vectorPhi = builder.CreatePHI(retTy, 0, "VPhi"+instName);
  Value *valueToSet;
  bool tobeFixed = false;

  for (unsigned i = 0; i < numIncomingValues; i++) {
    Value *incomingVal = scalarPhi->getIncomingValue(i);
    //errs() << "the value of the " << i << "th field of the PHI node is " << *incomingVal << "\n";
    BasicBlock *incomingBB = scalarPhi->getIncomingBlock(i);
    //if current value is a constant, we need to create a vector constant in the orginal bb
    //the reason why we cannot create the constant vector in the current bb is because we have
    //to keep phi nodes are grouped at the top of the current bb.
    Instruction *incomingInst = dyn_cast<Instruction> (incomingVal);
    if (incomingInst && incomingInst->getOpcode() == Instruction::Invoke) {
    //redirect the label of the entry if it depends on the value produced by an invoke operation
      if (incomingBB == incomingInst->getParent()) {// || incomingBB->getTerminator()->getOpcode() == Instruction::Invoke) {
        incomingBB = ((InvokeInst *)incomingInst)->getNormalDest();
      }
    }
    
    if (scalarToVectorMap.find(incomingInst) != scalarToVectorMap.end()) {
      valueToSet = scalarToVectorMap[incomingInst]->replacedBy();
    }
    else if (argsScalarToVectorMap.find(incomingVal) != argsScalarToVectorMap.end()) {
      valueToSet = argsScalarToVectorMap[incomingVal];
    }
    else if (globalScalarToVectorMap.find(incomingVal) != globalScalarToVectorMap.end()) {
      valueToSet = globalScalarToVectorMap[incomingVal];
    }
    else {
      //VectorType *vecTy = VectorType::get(incomingVal->getType(), VEC_LENGTH);
      VectorType *vecTy; 
      if (incomingVal->getType()->isVectorTy()) {
        VectorType *sseTy = dyn_cast<VectorType> (incomingVal->getType());
        vecTy = VectorType::get(sseTy->getElementType(), sseTy->getNumElements() * 2);
      }
      else {
        vecTy = VectorType::get(incomingVal->getType(), VEC_LENGTH);
      }

      Value *emptyVec = UndefValue::get(vecTy);
      
      if (isa<Constant> (incomingVal)) {    //if the field is constant
        valueToSet = createConstantVector(incomingVal);
      }
      else {        //if the current value is defined later or from other sources, e.g., caller, global
        valueToSet = emptyVec; 
        tobeFixed = true;
      }
    }
    //vectorPhi->setIncomingValue(i, valueToSet);
    //vectorPhi->setIncomingBlock(i, incomingBB);
    //errs() << "vvvvvvvvvvvvvvv " << *valueToSet << "  " << *incomingVal << "\n" << *pInst << "\n";
    vectorPhi->addIncoming(valueToSet, incomingBB);
  }

  if (tobeFixed) { //if all value are constant or defined before usage, there is no need to deal with it
    tobeFixedPhiNodes.insert(pInst);
  }

  if (replaceAllUses) {
    dupVectorPhiVal->replaceAllUsesWith(vectorPhi); 
  }
  dupInst = dyn_cast<Instruction> (vectorPhi);
  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;

  //(errs() << "The original Phi node is " << *pInst << "\n");
  //(errs() << "The vectorized Phi node is " << *dupInst << "\n");
  DEBUG(errs() << "The vectorized Phi node is " << *dupInst << "\n");
  duplicatedIR++;
  return dupInst;
}

//there are probably holes in the phi nodes in the one pass scan because the use of some
//values in the phi nodes could be before the def of them. In this case, we cannot vectorize
//the use first, but only filling them with undefined values. In the second pass, we visit
//the phi nodes with holes and fix them.
bool Approx::fixHolesInPhiNodes() {
  bool success = true;
  for (std::set<Instruction*>::iterator it = tobeFixedPhiNodes.begin(), \
      end = tobeFixedPhiNodes.end(); it != end; it++ ) {
    PHINode *scalarPhi = dyn_cast<PHINode> (*it);
    PHINode *tobeFixed = dyn_cast<PHINode> (scalarToVectorMap[*it]->replacedBy());
    unsigned numIncomingValues = tobeFixed->getNumIncomingValues();
    for (unsigned i = 0; i < numIncomingValues; i++) {
      Value *vecIncomingVal = tobeFixed->getIncomingValue(i); 
      Value *scaIncomingVal = scalarPhi->getIncomingValue(i);
      //Instruction *scalarInst = dyn_cast<Instruction> (scaIncomingVal);
      Value *realValue = NULL;

      if (vecIncomingVal->getValueID() == Value::UndefValueVal) {  //the value needs to be fixed
        //errs() << *scalarPhi << " " << *tobeFixed << "\n" << *scaIncomingVal << "\n";
        realValue = insertScalarToVectorMap(scaIncomingVal, "args");
        tobeFixed->setOperand(i, realValue);
        //errs() << "after fix " << *tobeFixed << "\n";
      }
    }
  }
  return success;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupScalarArith"
Instruction *Approx::duplicateScalarArithmetic(Instruction *pInst, const std::string &chainPrefix, const int &numOperands) {
  Instruction *replacedInst = NULL;

  if (!isPrimitiveType(pInst)) {
    return NULL;
  }

  if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end()) {
    replacedInst = scalarToVectorMap[pInst]->replacedBy(); 
    //errs() << " replaced local Return " << *replacedInst << "\n";
    return replacedInst;
  }
  
  if (argsScalarToVectorMap.find(dyn_cast<Value>(pInst)) != argsScalarToVectorMap.end()) {
    replacedInst = dyn_cast<Instruction>(argsScalarToVectorMap[dyn_cast<Value>(pInst)]); 
    //errs() << " replaced argument Return " << *replacedInst << "\n";
    return replacedInst;
  }

  if (globalScalarToVectorMap.find(dyn_cast<Value>(pInst)) != globalScalarToVectorMap.end()) {
    replacedInst = dyn_cast<Instruction>(globalScalarToVectorMap[dyn_cast<Value>(pInst)]); 
    //errs() << " replaced global Return " << *replacedInst << "\n";
    return replacedInst;
  }

  Value *dupVal = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++; 
  LLVMContext &ctxt = currF->getContext();
  IRBuilder<> builder(&*insertAt);
  Value *oprnd = pInst->getOperand(0);
  Instruction *oprndInst = dyn_cast<Instruction> (oprnd);
  Type *vecTy, *dstTy;

  if (pInst->getType()->isVectorTy()) {
    VectorType *scalarType = dyn_cast<VectorType>(pInst->getType());
    dstTy = VectorType::get(scalarType->getElementType(), scalarType->getNumElements() * 2);
    //dstTy = pInst->getType();
  }
  else {
    dstTy = VectorType::get(pInst->getType(), VEC_LENGTH); 
  }

   
  Type* u32Ty = Type::getInt32Ty(ctxt);
  Value *index0 =  ConstantInt::get(u32Ty, 0);
  Value *index1 =  ConstantInt::get(u32Ty, 1);
  //Value *oprnd1 = pInst->getOperand(1);
  Instruction *InsertVal0 = NULL;
  Instruction *InsertVal1 = NULL;
   
  if (oprnd->getType()->isVectorTy()) {
    //InsertVal1 = oprndInst->clone();
    //InsertVal1->insertBefore(insertAt);
    if (Constant *C = dyn_cast<Constant>(oprnd)) {
      VectorType *vTy = dyn_cast<VectorType>(C->getType());
      unsigned numElems = vTy->getNumElements();
      vecTy = VectorType::get(C->getAggregateElement(1)->getType(), numElems * 2);
      Value *emptyVec = UndefValue::get(vecTy);
      InsertVal1 = InsertElementInst::Create(emptyVec, C->getAggregateElement(1), index0, "insert1" + chainPrefix, insertAt); 
    }
    else {
      Value *mask = createMask(oprndInst);
      Value *Val1 = builder.CreateShuffleVector(oprnd, oprnd, mask, "shuffle" + chainPrefix);
      InsertVal1 = dyn_cast<Instruction>(Val1);
    }
  }
  else {
    vecTy = VectorType::get(oprnd->getType(), VEC_LENGTH);
    Value *emptyVec = UndefValue::get(vecTy);
    InsertVal0 = InsertElementInst::Create(emptyVec, oprnd, index0, "insert0" + chainPrefix, insertAt);
    InsertVal1 = InsertElementInst::Create(InsertVal0, oprnd, index1, "insert1" + chainPrefix, insertAt); 
  }
  //builder.CreateVectorSplat(VEC_LENGTH, oprnd, "splat" + chainPrefix);
  //errs() << "HERERERERERE " << *InsertVal1 << "         " << pInst->getOpcodeName(pInst->getOpcode()) << "    " << pInst->getNumOperands() <<"\n";
  
  std::string instName = pInst->getName().str() + chainPrefix;
  switch(pInst->getOpcode()) {
    case Instruction::FAdd:
      dupVal = builder.CreateFAdd(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::Add:
      dupVal = builder.CreateAdd(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FSub:
      dupVal = builder.CreateFSub(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::Sub:
      dupVal = builder.CreateSub(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FMul:
      dupVal = builder.CreateFMul(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::Mul:
      dupVal = builder.CreateMul(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FDiv:
      dupVal = builder.CreateFDiv(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::UDiv:
      dupVal = builder.CreateUDiv(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::SDiv:
      dupVal = builder.CreateSDiv(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FRem:
      dupVal = builder.CreateFRem(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::URem:
      dupVal = builder.CreateURem(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::SRem:
      dupVal = builder.CreateSRem(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::Shl:
      dupVal = builder.CreateShl(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::AShr:
      dupVal = builder.CreateAShr(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::LShr:
      dupVal = builder.CreateLShr(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::And:
      dupVal = builder.CreateAnd(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::Or:
      dupVal = builder.CreateOr(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::Xor:
      dupVal = builder.CreateXor(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FCmp: {
      dupVal = builder.CreateFCmp((dyn_cast<FCmpInst>(pInst))->getPredicate(), InsertVal1, InsertVal1, instName);
      break;
    }
    case Instruction::ICmp: {
      dupVal = builder.CreateICmp((dyn_cast<ICmpInst>(pInst))->getPredicate(), InsertVal1, InsertVal1, instName);
      break;
    }
    case Instruction::Call: {           // the implementation is too tedious, this could be improved by using a function and fucntionCall table
      Function *func = dyn_cast<CallInst>(pInst)->getCalledFunction();
      std::string funName = "call";

      if (func != NULL)
        funName = func->getName().str(); 

      std::string Name = "v"+ funName;
      Name += chainPrefix;
      if (numOperands == 1) {     //sqrt
        if (funName == "sqrt") {
          dupVal = CreateVFSqrt(builder, InsertVal1, Name);
        }
        else if (funName == "fabs") {
          dupVal = CreateVFabs(builder, InsertVal1, Name);
        }
        else if (funName == "sin") {
          dupVal = CreateVSin(builder, InsertVal1, Name);
        }
        else if (funName == "cos") {
          dupVal = CreateVCos(builder, InsertVal1, Name);
        }
        else if (funName == "floor") {
          dupVal = CreateVFloor(builder, InsertVal1, Name);
        }
        else if (funName == "exp") {
          dupVal = CreateVExp(builder, InsertVal1, Name);
        }
        else if (funName == "exp2") {
          dupVal = CreateVExp2(builder, InsertVal1, Name);
        }
        else if (funName == "log") {
          dupVal = CreateVLog(builder, InsertVal1, Name);
        }
        else if (funName == "log2") {
          dupVal = CreateVLog(builder, InsertVal1, Name, 2);
        }
        else if (funName == "log10") {
          dupVal = CreateVLog(builder, InsertVal1, Name, 10);
        }
        else {                              //more intrinsic functions to be added
          replacedInst = duplicateCall(pInst, instName);
          InsertVal1->eraseFromParent();
          InsertVal0->eraseFromParent();
          return replacedInst;
        }
      }
      else if (numOperands == 2) {
        if (funName == "pow" || funName == "powi") {
          dupVal = CreateVPow(builder, InsertVal1, InsertVal1, Name); //FIXME the second parameter should be <2 x int> for powi
        }
        else {
          InsertVal1->eraseFromParent();
          InsertVal0->eraseFromParent();
          return replacedInst;
        }
      }
      else if (numOperands == 3)  {
        if (funName == "fma") {
          dupVal = CreateVFma(builder, InsertVal1, InsertVal1, InsertVal1, Name); //FIXME the second parameter should be <2 x int> for powi
        }
        else {
          InsertVal1->eraseFromParent();
          InsertVal0->eraseFromParent();
          return replacedInst;
        }
      }
      else {
        replacedInst = duplicateCall(pInst, instName);
        InsertVal1->eraseFromParent();
        InsertVal0->eraseFromParent();
        return replacedInst;
      }
      break;
    }
    case Instruction::SIToFP:
    case Instruction::FPToSI:
    case Instruction::UIToFP:
    case Instruction::FPToUI:
    case Instruction::IntToPtr:
    case Instruction::PtrToInt: {
      //case Instruction::AddrSpaceCast:
      replacedInst = duplicateTypeConvert(pInst, instName);
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      //errs() << *replacedInst << "\n"; 
      return replacedInst;
    }
    case Instruction::BitCast: {
      Value *oprand = pInst->getOperand(0);
      if (oprand->getType()->isVectorTy() || pInst->getType()->isVectorTy()) {
        replacedInst = duplicateBitcast(pInst, instName);
        InsertVal1->eraseFromParent();
        InsertVal0->eraseFromParent();
        InsertVal1 = NULL; InsertVal0 = NULL;
        //errs() << *replacedInst << "\n"; 
        return replacedInst;
      }
      else {
        dupVal = builder.CreateBitCast(InsertVal1, dstTy, "bitcast"+instName);
      }
      break;
    }
    case Instruction::ExtractElement: {
      replacedInst = duplicateExtractElement(pInst, instName);
      InsertVal1->eraseFromParent();
      if (InsertVal0)
        InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      return replacedInst;
    }
    case Instruction::ExtractValue:{
      replacedInst = duplicateExtractValue(pInst, instName);
      InsertVal1->eraseFromParent();
      if (InsertVal0)
        InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      return replacedInst;
    }

    case Instruction::ShuffleVector: {
      replacedInst = duplicateShuffleVector(pInst, instName);
      InsertVal1->eraseFromParent();
      if (InsertVal0)
        InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      return replacedInst;
    }
    case Instruction::Select: {
      replacedInst = duplicateSelect(pInst, instName);
      InsertVal1->eraseFromParent();
      if (InsertVal0)
        InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      return replacedInst;
    }
    case Instruction::FPTrunc:
    case Instruction::Trunc:
    case Instruction::FPExt:
    case Instruction::ZExt:
    case Instruction::SExt: {
      replacedInst = duplicateFPTruncExt(pInst, instName);
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      //errs() << *replacedInst << "\n"; 
      return replacedInst;
    }
    case Instruction::PHI: {
      //replacedInst = duplicatePhiNode(pInst, instName);
      replacedInst = duplicatePhiNodeVectorTy(pInst, instName);
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      //errs() << *replacedInst << "\n"; 
      return replacedInst;
    }
    case Instruction::Alloca: 
    case Instruction::GetElementPtr: {
      replacedInst = duplicateScalarGEP(pInst, instName);
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      //errs() << *replacedInst << "\n"; 
      return replacedInst;
    }
    case Instruction::Load: {
      replacedInst = duplicateScalarLoad(pInst, instName);
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      //errs() << *replacedInst << "\n"; 
      return replacedInst;
    }

     case Instruction::Invoke: {
      replacedInst = duplicateScalarInvoke(pInst, instName);
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      //errs() << *replacedInst << "\n"; 
      return replacedInst;
    }

   default: {
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      //assert("Instruction is not supported!");
      return replacedInst;
    }
  } 

  //errs() << "ddddddddddddddddddddd " <<*pInst << "     " << *dupVal << "\n";

  replacedInst = dyn_cast<Instruction>(dupVal);
  instrInfo *pInstInfo = new instrInfo(replacedInst);
  pInstInfo->setReplacedBy(replacedInst);
  scalarToVectorMap[pInst] = pInstInfo;
  
  //iterate over operands
  int oprndCount = 0;
  for(User::op_iterator itr =  pInst->op_begin(), itr_e = pInst->op_end(); itr != itr_e; ++itr){
    if (numOperands > 0 && oprndCount >= numOperands)
      break;
    Value* usedVal = *itr;
    if (isa<Constant>(usedVal)) {
      //Constant *constVec = ConstantVector::getSplat(VEC_LENGTH, CI); 
      Value *constVec = createConstantVector(usedVal);
      replacedInst->setOperand(oprndCount, constVec);
      //errs() << "replaced instruction " << *replacedInst << "\n";
    }
    else if(Instruction *usedInstr = dyn_cast<Instruction>(usedVal)){   //the instruction is defined before
      //DEBUG(dbgs() << "used Instruction " << *usedInstr << "\n");
      //errs() << "used Instruction " << *usedInstr << "\n";
      if(!breakRecDuplication(pInst, usedInstr)){
        Instruction *dupUser;
        if (usedInstr->getOpcode() == Instruction::Invoke) {
          dupUser = duplicateScalarInvoke(usedInstr, "invoke");
        }
        else {
          dupUser = duplicateScalarArithmetic(usedInstr, chainPrefix);
          //errs() << "------------------ " << *dupUser << "\n";
        }
        if(replacedInst && dupUser){
          //errs() << ",,,,,,,,,,,,,,,,, " << *replacedInst << "\n" << "................... " <<dupUser->getOpcodeName() << "    " << *dupUser << "\n";
          replacedInst->setOperand(oprndCount, dupUser);
          //errs() << "replaced instruction " << *replacedInst << "\n";
        }
      }
    }
    else {    //the instructino is new, i.e., %mul = fmul double %f, 1.2 ;where %f is not generated in the current BB but passed from a caller
      Value *val1 = insertScalarToVectorMap(usedVal, chainPrefix);
      replacedInst->setOperand(oprndCount, val1); 
      //errs() << "replacedInst" << *replacedInst << "\n";
    }
    oprndCount++;
  }
  if (InsertVal1) {
    InsertVal1->eraseFromParent();  //erase them in the reversed order. There would be an error if we erase insertVal0 first because InsertVal1 wants to use it
  }
  if (InsertVal0) {
    InsertVal0->eraseFromParent();
  }
  duplicatedIR++;
  return replacedInst;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupCall"
Instruction *Approx::duplicateCall(Instruction *pInst, const std::string& instName) {
  Instruction *dupInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  Value *vCall = dyn_cast<Value>(pInst);

  CallInst *call = dyn_cast<CallInst> (pInst);
  Function *func = call->getCalledFunction();
  std::string funName = "vcall"; // = func->getName().str();
  if (func != NULL) {
    funName = func->getName().str();
  }

  //don't duplicate the current call if it has no uses, e.g., free(..), delete()
  if (vCall->getNumUses() == 0 || !isPrimitiveType(pInst)) {
    if (funName == "llvm.lifetime.start" || funName == "llvm.lifetime.end") {
      unsigned i = 0;
      for (User::op_iterator it = pInst->op_begin(), end = pInst->op_end(); it != end; ++it, ++i) {
        Instruction *oprand = dyn_cast<Instruction> (*it);
        if (scalarToVectorMap.find(oprand) != scalarToVectorMap.end()) {
          pInst->eraseFromParent();
        }
      }
    }
    return NULL;
  }

  //errs() << " insert point is --------------------- " << *insertAt << "\n";
   
  IRBuilder<> builder(&*insertAt);
  Value *Val;
  if (instrToInfoObj[pInst]->isSSEInst()) {
    Value *mask = createMask(pInst);
    Val = builder.CreateShuffleVector(vCall, vCall, mask, "splatCall" + instName);
  }
  else {
    Val = builder.CreateVectorSplat(VEC_LENGTH, vCall, "splatCall" + instName);
  }

  Instruction *vecCallInst = dyn_cast<Instruction> (Val);

  instrInfo *pInstInfo = new instrInfo(vecCallInst);
  pInstInfo->setReplacedBy(vecCallInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  DEBUG(errs() << "Vectorized call: " << *vecCallInst << "\n");
      
  return dupInst = vecCallInst;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"
//recursively duplicate producers until one of the following is
//encountered
// 1. instructions is safe
// 2. instructions is already duplicated
//
// Returns the duplicated instruction
#undef DEBUG_TYPE
#define DEBUG_TYPE "DupProducersRec"
Instruction* Approx::duplicateProdRec(Instruction *pInst, const std::string &chainPrefix){
  //clone and insert if not already duplicated && (if
  //the instruction is not safe || dupall option is given)
  //if(!instrToInfoObj[pInst]->isHighValue()){
  //check the instructions at: http://llvm.org/docs/doxygen/html/Instruction_8cpp_source.html
  Instruction* duplicatedInst = NULL;
  //FIXME
  if(instrToInfoObj[pInst]->isDuplicated()){
    duplicatedInst = instrToInfoObj[pInst]->duplicatedBy();
  }
  else if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end()) {
    //duplicatedInst = scalarToVectorMap[pInst]->replacedBy();
    duplicatedInst = pInst;
  }
  else{
    //if((!instrToInfoObj[pInst]->isStateVar())){
      bool breakAtFreqValue = false;
      if(breakAtFreqValue){
        //if we inserted a freq value comparision here then we don
        //t need to consider for further recursive duplication.
        DEBUG(dbgs() << "producer chain terminated. VP\n");
      }
      //duplicate load the address chain of a load and insert comparision
      else if(pInst->getOpcode() == Instruction::Load ||
	      pInst->getOpcode() == Instruction::Store ||
	      pInst->getOpcode() == Instruction::AtomicCmpXchg ||
	      pInst->getOpcode() == Instruction::Fence ||
	      pInst->getOpcode() == Instruction::GetElementPtr) {
        //duplicatedInst = pInst;
        DEBUG(dbgs() << "not duplicating memory instructions" << *pInst << "\n");
        /*
        Value* loadAddr = pInst->getOperand(0);
        if(Instruction* loadAddrInst = dyn_cast<Instruction>(loadAddr)){
          DEBUG(dbgs() << "address is " << *loadAddrInst << "\n");
          if(!breakRecDuplication(pInst, loadAddrInst)){
            if(!handledByValue(pInst)){
              Instruction* dupInst = duplicateProdRec(loadAddrInst, chainPrefix);
              insertCmp(pInst, dupInst, loadAddrInst, "LDCmp");
            }
            else{
              DEBUG(dbgs() << "Handled by value (exact or range)" << "\n");
            }
          }
        }
        */
      }
      else if (pInst->getOpcode() == Instruction::Alloca || 
               pInst->getOpcode() == Instruction::Call ||
               pInst->getOpcode() == Instruction::Switch ||
               pInst->getOpcode() == Instruction::Invoke ||
               pInst->getOpcode() == Instruction::Resume ||
               pInst->getOpcode() == Instruction::Ret){	
        //do not duplicate alloca instruction, as this allocated memory
        //do not duplicate return instruction, 
        //do not duplicate call instruction, its operand would be taken
        //care of by HV inst
        DEBUG(dbgs() << "not duplicating alloca/call/ret/revoke/resume: " << *pInst << "\n");
      }
      else if (//pInst->getOpcode() == Instruction::FCmp ||
	       //pInst->getOpcode() == Instruction::ICmp ||
	       pInst->getOpcode() == Instruction::PHI ||
               pInst->getOpcode() == Instruction::Br) {
	    DEBUG(dbgs() << "Cmp inst and Phi nodes will be handled later: " << *pInst << "\n");
      }
      else{
        //overhead of duplicated instructions.
        //if(RelUseProfile){
        //dynDupCount += PI->getExecutionCount(pInst->getParent());
        //annotateDuplicated(pInst);
        //}
        if(!handledByValue(pInst)){
          Instruction *dupInst = pInst->clone();
          dupInst->setName(chainPrefix);
          dupInst->insertBefore(pInst);
          instrToInfoObj[pInst]->setDuplicated(dupInst);
          instrInfo *pInstInfo = new instrInfo(dupInst);
          pInstInfo->setReplacedBy(dupInst);
          scalarToVectorMap[pInst] = pInstInfo;
          duplicatedInst = dupInst;
          //DEBUG(dbgs() << "parent: " << dupInst->getParent() << "\n");

          //annotateDuplicate(dupInst);
          DEBUG(dbgs() << "used Instruction " << *duplicatedInst<< "\n");

          //iterate over operands
          unsigned oprndCount = 0;
          for(User::op_iterator itr =  pInst->op_begin(), itr_e = pInst->op_end(); itr != itr_e; ++itr){
            Value* usedVal = *itr;
            if(Instruction *usedInstr = dyn_cast<Instruction>(usedVal)){
              if(!breakRecDuplication(pInst, usedInstr)){
                //recursive call
                Instruction* dupUser = duplicateProdRec(usedInstr, chainPrefix);
                if(duplicatedInst && dupUser){
                  Value *dupVal = dyn_cast<Value> (dupUser);
                  if (duplicatedInst->getOpcode() == Instruction::InsertElement) {
                    if (itr != pInst->op_begin() && dupUser->getType()->isVectorTy()) {
                      BasicBlock::iterator insertAt = dupUser;
                      insertAt++;
                      while(insertAt->getOpcode() == Instruction::PHI) 
                        insertAt++;
                      IRBuilder<> builder(&*insertAt);
                      Type* u32Ty = Type::getInt32Ty(currF->getContext());
                      Value *index =  ConstantInt::get(u32Ty, 0);
                      dupVal = builder.CreateExtractElement(dyn_cast<Value>(dupUser), index, "extScalar");
                    }
                  }
                  duplicatedInst->setOperand(oprndCount, dupVal);
                }
              }
            }
            oprndCount++;
          }
          duplicatedIR++;
        }
        else{
//          duplicatedInst = pInst;
          DEBUG(dbgs() << "Handled by value (exact or range)" << "\n");
        }
      }
      //}
  }
  return duplicatedInst;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DeleteScalar"
//delete is from the end to the begining to make sure that use is deleted before def
//the following code is implemented in a DFS way by traversing all the use-def chains
bool Approx::deleteInstrumentedScalarInst() {
  bool ret = true;

  //LLVMContext &ctxt = currF->getContext();
  //Type* u32Ty = Type::getInt32Ty(ctxt);
  //Value *index =  ConstantInt::get(u32Ty, 0);
  BasicBlock::iterator tmp;
  //Value *scalarPhiVal;
  //delete the instruction according to the use-def chain

  for (std::vector<Instruction*>::reverse_iterator it = instrVec.rbegin(), end = instrVec.rend(); it != end; ++it) {
    Instruction *deleteInst = *it;
    if (deleteInst && scalarToVectorMap.find(deleteInst) != scalarToVectorMap.end()) {
      //errs() << "????????????????? " << *deleteInst << "\n";
      deleteInstrDFS(deleteInst);
    }
  }

  for (std::vector<Value*>::iterator vit = extractedInst.begin(); vit != extractedInst.end(); ++vit) {
    Value *val = *vit;
    if (val->getNumUses() == 0) {
      Instruction *removeExt = dyn_cast<Instruction> (val);
      removeExt->eraseFromParent();
    } 
  }
  DEBUG(errs() << "deletion is done" << "\n");
  return ret;
}

void Approx::deleteInstrDFS(Instruction *pInst) {

  if (pInst == NULL || scalarToVectorMap.find(pInst) == scalarToVectorMap.end())
    return;

  Value *instVal = dyn_cast<Value> (pInst);
  if (instVal->getNumUses() == 0) { //this is the last instruction, it can be erased safely
   /* for (User::op_iterator oit = pInst->op_begin(); oit != pInst->op_end(); ++oit) {
      Instruction *opInst = dyn_cast<Instruction>(*oit);
      if (opInst && scalarToVectorMap.find(opInst) != scalarToVectorMap.end()) {
        scalarToVectorMap[opInst]->decrementLastUses();
      }
    }

    if (pInst->getOpcode() == Instruction::Call) {
      if (scalarToVectorMap[pInst]->replacedBy()->getOpcode() != Instruction::Call)
         return;
    }
    else if (scalarToVectorMap[pInst]->getLastUses() > 1) {
      //scalarToVectorMap[pInst]->decrementLastUses();
      return;
    }*/
    pInst->eraseFromParent();
    if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end()) {
      std::vector<Instruction*>::iterator it = find(instrVec.begin(), instrVec.end(), pInst);
      instrVec.erase(it);
      scalarToVectorMap.erase(pInst);
    }
    return;  
  }
  
  //errs() << "current instr to be delete !!!!!!!!!!!!!!: " << *pInst << "\n";
  Value *scalarInstVal = pInst;
  //for (Value::use_iterator useIt = pInst->use_begin(), e = pInst->use_end(); useIt != e; ++useIt) {
  //  errs() << "Use Instruction is: " << *dyn_cast<Instruction> (*useIt) << "\n";
  //}

  //replace all the operands in a phi node with undef because we will finally delete the phi node anyway
  if (pInst->getOpcode() == Instruction::PHI) {
    int i = 0;
    for (User::op_iterator uIt = pInst->op_begin(); uIt != pInst->op_end(); ++uIt, ++i) {
      if (isa<Instruction>(*uIt)) {
        Value *undef = UndefValue::get((*uIt)->getType());
        pInst->setOperand(i, undef);
      }
    }
  }

  if (extractableVectorValue(pInst) && pInst->getOpcode() != Instruction::InsertElement) {
    if (scalarToVectorMap[pInst]->isInstrumented()) {
      //errs() << "already instrumented: " << *scalarToVectorMap[pInst]->extractFrom() << "\n";
      scalarInstVal =  dyn_cast<Value>(scalarToVectorMap[pInst]->extractFrom());
    }
    else {
      scalarInstVal = getScalarValueFromInstr(pInst);
    }
      Instruction *dupInst = scalarToVectorMap[pInst]->replacedBy();
      myReplaceUsesOfWith(dyn_cast<Value>(pInst), dupInst, scalarInstVal);
  }

  for (Value::use_iterator useIt = scalarInstVal->use_begin(), e = scalarInstVal->use_end(); useIt != e; ++useIt) {
    //errs() << "Use Instruction is1111111111 : " << *dyn_cast<Instruction> (*useIt) << "\n";
    Instruction *useInst = dyn_cast<Instruction> (*useIt);
    if (useInst && scalarToVectorMap.find(useInst) != scalarToVectorMap.end()) {
      scalarToVectorMap[useInst]->incrementLastUses();
    }
  }

  Value::use_iterator useIt = scalarInstVal->use_begin(), e = scalarInstVal->use_end(), next;
  while (useIt != e) {
    next = useIt;
    next++;
    while (next != e) {
      if (*next == *useIt) { //for %2 = add %1, %1, %2 = add %1, %1 next needs to move to an instr which is not equal to %2
        next++;
        continue;
      }
      //deal with the following case 483.sphnix3 and 447.dealII
      //%2 = fadd %1, %0
      //  %3 = %2, %a
      //  %4 = %2, %b
      //  %5 = %4, %c
      //  ...
      //  In this case, we cannot delete %5 = %4, %c when the current instruction is %4 = %2, %b.
      //  Otherwise, next ptr in the following code will be null 
      for (User::op_iterator oit = next->op_begin(); oit != next->op_end(); ++oit) {
        if (dyn_cast<Value> (*oit) == dyn_cast<Value>(*useIt)) {
          next++;
          break;
        }
      }
      break;
    }
    Instruction *curInst = dyn_cast<Instruction> (*useIt);
    //errs() << "current Instruction is: " << **useIt << "\n" << *curInst << "\n";
    if (curInst) {  //the instruction to be deleted cannot be a terminator
      deleteInstrDFS(curInst);
      //errs() << "current delete is done!!" << "\n"; 
    }
    useIt = next;
  } //end for
}

Value *Approx::getScalarValueFromInstr(Instruction *srcInst) {

  Value *scalarInstVal = NULL;
  Instruction *dupInst = scalarToVectorMap[srcInst]->replacedBy();
  Value *vecInstVal = dyn_cast<Value> (dupInst);

  if (isa<Constant> (vecInstVal))
    return NULL;

  if (!vecInstVal->getType()->isVectorTy())
    return vecInstVal;

  VectorType *vTy = dyn_cast<VectorType>(vecInstVal->getType());
  LLVMContext &ctxt = currF->getContext();
  Type* u32Ty = Type::getInt32Ty(ctxt);
  Value *index =  ConstantInt::get(u32Ty, 1);

  BasicBlock::iterator tmp = dupInst;
  if (srcInst->getOpcode() != Instruction::PHI && srcInst->getOpcode() != Instruction::LandingPad) { 
    tmp++;
  }
  else {    
    //otherwise replace the use of phi node with the scalar value extracted from the corresponding vector reg.
    //FIXME. however this is buggy, a phi node might be used by a scalar call... %call = call @srand48(%phi)
    //or it is still removable if we extract the scalar operand of the call from its vector counterpart.
    //in this case, the phi node is not removable.
    while (tmp->getOpcode() == Instruction::PHI || tmp->getOpcode() == Instruction::LandingPad)
      tmp++;
  }
  IRBuilder<> builder(&*tmp);
  std::string InstName = "ext";
  if(vecInstVal->hasName()) 
    InstName += vecInstVal->getName();

  //errs() << "srcInst: " << *srcInst << "\n"; 
  if (vTy->getNumElements() >= VEC_LENGTH * 2) {
    Value *mask = extractMask(srcInst);
    scalarInstVal = builder.CreateShuffleVector(vecInstVal, vecInstVal, mask, InstName);
  }
  else { 
    scalarInstVal = builder.CreateExtractElement(vecInstVal, index, InstName);
  }

  scalarToVectorMap[srcInst]->setInstrumented(dyn_cast<Instruction>(scalarInstVal));
  extractedInst.push_back(scalarInstVal);
  return scalarInstVal; 
}

//don't replace the instruction, inst_i, if:
//it is used by an instruction, inst_j,  on the def-use chain of inst and
//inst_j is going to be used by the duplicate of inst_i
//for example, 
//%1 = bit <2xdouble> %2, %3
//%1_tmp = insertelement <2xdouble>, %1, i32 0
//%1_dup = shufflevector <2xdouble>, %1_tmp, ...
//if we replace %1_tmp with one element in 1_dup, it won't work because
//we are going to have a use before def
void Approx::myReplaceUsesOfWith(Value *oldVal, Instruction *dupInst, Value *newVal) {
  Value::use_iterator userIt = oldVal->use_begin(), e = oldVal->use_end(), next; 

  while (userIt != e) {
    User *curUser = *userIt;
    next = userIt;
    next++;
    Instruction *useInst = dyn_cast<Instruction> (curUser);
    Value *useVal = dyn_cast<Value> (useInst);
    bool replace = true;
    //check if dupInst is using useVal
    for (User::op_iterator uIt = dupInst->op_begin(); uIt != dupInst->op_end(); ++uIt) {
      if (dyn_cast<Value>(*uIt) == useVal) { //if it is used later, don't replace it
        replace = false;
        break;
      }
    }

    if (replace) {
      curUser->replaceUsesOfWith(oldVal, newVal);
    //  errs() << "after replace: " << *useInst << "\n";
    }
    userIt = next;
  }
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

void Approx::insertCmp(Instruction* insertPt, Instruction* dupInst, Instruction* origInst, 
                        const std::string &instName, bool insertAfter){
  //if we duplicated the instruction
  //create a comparision between duplicated operand and original instruction.
  //e.g. 
  //
  //%2 = getelementptr inbounds [100 x i32]* %a, i64 0, i64 %1
  //store i32 0, i32* %2, align 4
  //===>
  //%HV3_ = getelementptr inbounds [100 x i32]* %a, i64 0, i64 %HV3_2
  //%2 = getelementptr inbounds [100 x i32]* %a, i64 0, i64 %1
  //<Comparision here>
  //store i32 0, i32* %2, align 4
  //for the mini example, %HV3_ is dupInst and origInst is %2
  //FIXME: Are we inserting duplicate comparisions???
  BasicBlock::iterator insertAt = insertPt;
  if(insertAfter)
    insertAt++;

  IRBuilder<> builder(&*insertAt);
  if(dupInst){
    Value *cmpVal = NULL;
    Instruction* cmpInst = NULL;
    //adjust dynDupCount
    //we are inserting two extra (cmp and br) for every high value comparision.
    //dynDupCount += 2*(PI->getExecutionCount(origInst->getParent()));
    if((origInst->getType())->isIntOrIntVectorTy() || 
        (origInst->getType())->isPointerTy()){
      /*
      if (origInst->getType()->isVectorTy()) {
        LLVMContext &ctxt = currF->getContext();
        VectorType *vecTy = dyn_cast<VectorType> (origInst->getType());
        unsigned numOfElem = vecTy->getNumElements();
        unsigned numOfBits = vecTy->getElementType()->getPrimitiveSizeInBits();
        unsigned totalBits = vecTy->getBitWidth();
        VectorType *dstTy = VectorType::get(Type::getIntNTy(ctxt, totalBits/numOfElem), numOfElem);
        Value *mask = ConstantInt::get(Type::getIntNTy(ctxt, totalBits), 0);
      
      } */

      cmpVal = builder.CreateICmpNE(origInst, dupInst, instName);
      cmpInst = dyn_cast<Instruction> (cmpVal);
      //cmpInst = new ICmpInst(insertAt, ICmpInst::ICMP_NE, origInst, dupInst, instName); 
      //DEBUG(errs() << "Integer comparison "<< *cmpInst<<"\n");
      cmpInstInserted.insert(cmpInst);
    }
    else if((origInst->getType())->isFPOrFPVectorTy()){
      cmpVal = builder.CreateFCmpONE(origInst, dupInst, instName);
      cmpInst = dyn_cast<Instruction> (cmpVal);
      //cmpInst = new FCmpInst(insertAt, FCmpInst::FCMP_ONE, origInst, dupInst, instName); 
      //DEBUG(errs() << "FP comparison here "<< *cmpInst << " number of operands: " << cmpInst->getNumOperands()) << "\n";
      cmpInstInserted.insert(cmpInst);
    }
    else{
      errs() << "Warning: This type is not handled\n"; 
    }
  }  
}

// split the basic block inserted with a comparison instruction. All the instructions before the comparison
// instruction (including itself) stay in the old basic block. Every instruction starting after the inserted 
// comparision moves to the new basic block
// read the tutorial from llvm http://llvm.org/releases/2.6/docs/tutorial/JITTutorial2.html
void Approx::splitBBAndPointExitBlock(){
  for(std::set<Instruction*>::iterator I = cmpInstInserted.begin(), E = cmpInstInserted.end(); I != E; ++I){
    //if the RelBB option is given split the basic block to
    //use the result of cmp instruction to divert control flow
    //relExit BB.
    Instruction* cmpInst = *I;
    LLVMContext &ctxt = currF->getContext();
    std::vector<Type*> params;
    Type* voidTp = Type::getVoidTy(ctxt);
    Type* intTp = Type::getInt32Ty(ctxt);
    //FunctionType* ft = FunctionType::get(voidTp, params, false);
    BasicBlock::iterator splitIt = cmpInst;
    splitIt++;
    IRBuilder<> builder(&*splitIt);
    if(APDebug){
      params.push_back(Type::getInt1Ty(ctxt));
      PointerType* PointerTy_2 = PointerType::get(IntegerType::get(ctxt, 8), 0);
      params.push_back(PointerTy_2);
      params.push_back(intTp);
      params.push_back(intTp);
      FunctionType* ftD  = FunctionType::get(voidTp, params, false);
      Value* funcName = getOrCreateGlobalName(cmpInst->getParent());
      Value *constOne = ConstantInt::get(intTp, 1);
      Constant *exitFuncD = currF->getParent()->getOrInsertFunction("printRelExitMsgD", ftD);
      builder.CreateCall4((Value*)exitFuncD, cmpInst, funcName, constOne, constOne);
    }
    else if(APExitBB){
      //errs() << *cmpInst << " is the inserted comparison instruction." << "\n";
      //errs() << *splitIt << " is the split instruction after inserted comparison" << "\n";
      BasicBlock* oldBB = cmpInst->getParent();
      BasicBlock* newBB = SplitBlock(oldBB, splitIt, this);
      Instruction* termInst = oldBB->getTerminator();
      //errs() << newBB->front() << " is the first instruction in the newly inserted comparison" << "\n";
      //errs() << *newBB->getTerminator() << " is the terminator in new BB" << "\n";
      //errs() << *cmpInst<< " inserted comparison" << "\n"; 
      // if the conditional value is a vector type, e.g. <2 x i1>, we cannot create the branch instruction directly using 
      // branchinst::create, because it will fail during the type checking: 
      // getCondition()->getType()->isIntegerTy(1) && "May only branch on boolean predicates!
      // In this case, we have to combine the returned results in cmpInst to make it as an "i1" (bool) type.
      
      if (cmpInst->getType()->isVectorTy()) {
        Value *oprnd = cmpInst->getOperand(0);
        Instruction *operand = dyn_cast<Instruction>(oprnd);
        
        //save the instruction
        lastWrongInstr = operand;

        VectorType *vecTy = (VectorType *) operand->getType();
        //use number of elements and the width of each element in the vector type to determined if SSE/AVX is used for ps/pd
        unsigned numOfElem = vecTy->getNumElements();
        //unsigned numOfBits = vecTy->getElementType()->getPrimitiveSizeInBits();
        unsigned totalBits = vecTy->getBitWidth();

        //TODO: determine if it is sse/AVX instruction
        if (totalBits <= 128)
            totalBits = 128;
        else
            totalBits = 256;

        VectorType *dstTy = VectorType::get(Type::getIntNTy(ctxt, totalBits/numOfElem), numOfElem);
        Value *mask = ConstantInt::get(Type::getIntNTy(ctxt, totalBits), 0);

        //scalar comparison
        //BitCastInst *nbits = new BitCastInst(cmpInst, Type::getIntNTy(ctxt, numOfElem), "", termInst);
        //Value *sext = new SExtInst(dyn_cast<Value>(nbits), Type::getIntNTy(ctxt, 128), "", termInst);
        //Instruction *tmp = new ICmpInst(termInst, ICmpInst::ICMP_NE, sext, mask);
        //use ptest+jne

        Value *sext;
        //if (numOfBits != 1) {
          sext = new SExtInst(dyn_cast<Value>(cmpInst), dstTy, "", termInst);
        //}
        //else {
        //  sext = dyn_cast<Value> (cmpInst);
        //}

        BitCastInst *nbits = new BitCastInst(sext, Type::getIntNTy(ctxt, totalBits), "", termInst);

        Instruction *tmp = new ICmpInst(termInst, ICmpInst::ICMP_NE, nbits, mask);
        BranchInst* condBr = BranchInst::Create(relExitBB, newBB, tmp, oldBB);

        DEBUG(errs() << "conditional branch: " << *condBr << "\n");
      }
      else {
        nextNormalBB = newBB;
        BranchInst* condBr = BranchInst::Create(relExitBB, newBB, cmpInst, oldBB);
        DEBUG(errs() << "conditional branch: " << *condBr<< "\n");
      }
      termInst->eraseFromParent();
    }
  }      
  return;
}

//create an exit basic block
//this basic block would be transferred control if any of the checkers fail.
//this function could be modified to handle soft errors in the following way:
//1. Exit directly (this is what we are implementing in the following function.
//2. Increment the error count by 1
//3. Recovery
//4. .....
void Approx::createExitBB(){
  if(APExitBB){
    relExitBB = BasicBlock::Create(currF->getContext(), "relExit", currF);

    //!create the error threshhold variable
    createGlobal("errorThreshHold");

    //Constant* funcName = ConstantArray::get(F.getContext(), "myFunc");
    IRBuilder<> builder(relExitBB);

    FunctionType* ft;
    LLVMContext &ctxt = currF->getContext();
    Type* intTp = Type::getInt32Ty(ctxt);
    Type* voidTp = Type::getVoidTy(ctxt);
    Type* ptr8Type = Type::getInt8PtrTy(ctxt);
    Module *M = currF->getParent();

    //insert the printf call
    std::vector<Type*> params;
    params.push_back(ptr8Type);
    ft  = FunctionType::get(intTp, params, true);
    Constant* printFun = M->getOrInsertFunction("printf", ft);
    std::stringstream errorString;


    if (ExitApp) {          //!exit the application directly
      if(!exitDirectly){
        std::stringstream exitString;
        exitString << "Reliability CMP failed in function, exit directly %s" << "\n";
        exitDirectly = builder.CreateGlobalStringPtr(exitString.str().c_str(), "relFun");
      }

      Value* funcName = getOrCreateGlobalName();
      builder.CreateCall2((Value*)printFun, exitDirectly, funcName);
     
      //insert the exit function
      params.clear();
      params.push_back(Type::getInt32Ty(currF->getContext()));
      ft  = FunctionType::get(voidTp, params, false);
      Value *constOne = ConstantInt::get(intTp, 1);
      Constant *exitFunc = M->getOrInsertFunction("exit", ft);
      //insert the exit function call
      builder.CreateCall((Value*)exitFunc, constOne);
      Value* retVal = NULL;
      if(!(currF->getReturnType()->isVoidTy())){
        retVal = Constant::getNullValue(currF->getReturnType());
        builder.CreateRet(retVal);
      }
      else {
          builder.CreateRetVoid();
      }
          
    }
    else {                
      createErrorHandlerBB();
      createExitAppBB();
    
      //!increment the error counter
      increaseErrorCnt(builder);
      
      // !check if the number of errors is >= ERROR_THRESH
      Value* equal = builder.CreateICmpEQ(dyn_cast<Value>(softErrorNumGobal), dyn_cast<Value>(errorThreshGlobal));
      builder.CreateCondBr(equal, exitAppBB, errorHandlerBB);
    }

  }
  return;
}

//!Dump out the error instruction
Value* Approx::getErrorInstruction(IRBuilder<> &builder) {

    std::string errorInfo;
    raw_string_ostream rso(errorInfo);
    lastWrongInstr->print(rso);
    Value* errorVal =  builder.CreateGlobalStringPtr(errorInfo.c_str(), "WrongInst");

    return errorVal;
}

//! Get the processor ID where the error happened
int Approx::getProcessorID() {
    int procID;

    return procID;
}

//!Get the time stamp when the error happened
std::string Approx::getTimeStamp() {
    std::string timeStamp;
    
    sys::TimeValue now = sys::TimeValue().now();
    timeStamp = now.str();

    return timeStamp;
}

//!Get the PC for the error instruction
Value* Approx::getPC(IRBuilder<>& builder) {
    
    Module *M = currF->getParent();
    LLVMContext& ctxt = currF->getContext();
    Type* i8Ty = Type::getInt8Ty(ctxt);
    Type* i32Ty = Type::getInt32Ty(ctxt);
    Value *constZero = ConstantInt::get(i32Ty, 0);

    Function* llvm_returnAddr = Function::Create(
       FunctionType::get(i8Ty, false),
       GlobalValue::ExternalLinkage,
       "llvm.returnaddress",
       M);

    Value* pc = builder.CreateCall(llvm_returnAddr, constZero);
    
    return pc;
}

//!Access to the cycle counter register
Value* Approx::readCycleCounterReg(IRBuilder<>& builder) {

    Module *M = currF->getParent();
    LLVMContext& ctxt = currF->getContext();
    Type* i64Ty = Type::getInt64Ty(ctxt);

    Function* llvm_readCycleCnt = Function::Create(
       FunctionType::get(i64Ty, false),
       GlobalValue::ExternalLinkage,
       "llvm.readcyclecounter",
       M);

    Value* readCycCnt = builder.CreateCall(llvm_readCycleCnt);
    
    return readCycCnt;
}

void Approx::increaseErrorCnt(IRBuilder<>& builder) {
    
    LLVMContext& ctxt = currF->getContext();
    Type* i32Ty = Type::getInt32Ty(ctxt);
    Value *constOne = ConstantInt::get(i32Ty, 1);
   
    Value* soft_error_cnt = getOrCreateGlobalVariable("errorCount");
    soft_error_cnt = builder.CreateAdd(soft_error_cnt, constOne, "incrementErrorCnt"); 

    softErrorNumGobal = dyn_cast<GlobalVariable>(soft_error_cnt);
}

void Approx::createErrorHandlerBB() {
    errorHandlerBB = BasicBlock::Create(currF->getContext(), "errorHandler", currF);
    IRBuilder<> builder(errorHandlerBB);
        
    FunctionType* ft;
    LLVMContext &ctxt = currF->getContext();
    Type* intTp = Type::getInt32Ty(ctxt);
    Type* ptr8Type = Type::getInt8PtrTy(ctxt);
    
    Module *M = currF->getParent();
    std::vector<Type*> params;
    params.push_back(ptr8Type);
    ft  = FunctionType::get(intTp, params, true);
    Constant* printFun = M->getOrInsertFunction("printf", ft);
    std::stringstream errorString;

    //!get time stamp
    std::string timeStr = "time: " + getTimeStamp();
    Value* timeStamp = builder.CreateGlobalStringPtr(timeStr, "timeStamp");
    builder.CreateCall((Value*)printFun, timeStamp);

    //dump the instruction info
    Value* errorVal = getErrorInstruction(builder);
    if(!errorStr){
      errorString << "A soft error is detection in instruction: %s" << "\n";
      errorStr = builder.CreateGlobalStringPtr(errorString.str().c_str(), "printWrongInst");
    }
    builder.CreateCall2((Value*)printFun, errorStr, errorVal);

    //! get the pc
    Value* errorPC = getPC(builder);
    if (!printPC) {
      errorString << "Current PC: %s" << "\n";
      printPC = builder.CreateGlobalStringPtr(errorString.str().c_str(), "printPC");
    }
    builder.CreateCall2((Value*)printFun, printPC, errorPC);

    //continue executioin
    builder.CreateBr(nextNormalBB); 

    return;
}

//!exit the whole program
void Approx::createExitAppBB() {

    exitAppBB = BasicBlock::Create(currF->getContext(), "exitApplication", currF);
    IRBuilder<>builder(exitAppBB);
    
    Value* funcName = getOrCreateGlobalName();

    FunctionType* ft;
    LLVMContext &ctxt = currF->getContext();
    Type* intTp = Type::getInt32Ty(ctxt);
    Type* voidTp = Type::getVoidTy(ctxt);
    Type* ptr8Type = Type::getInt8PtrTy(ctxt);
    
    Module *M = currF->getParent();
    std::vector<Type*> params;
    params.push_back(ptr8Type);
    ft  = FunctionType::get(intTp, params, true);
    Constant* printFun = M->getOrInsertFunction("printf", ft);
    std::stringstream errorString;

    if(!exitStr){
      std::stringstream exitString;
      exitString << "Reliability CMP failed in function, exit directly %s" << "\n";
      exitStr = builder.CreateGlobalStringPtr(exitString.str().c_str(), "relFun");
    }

    builder.CreateCall2((Value*)printFun, exitStr, funcName);
     
    //insert the exit function
    params.clear();
    params.push_back(Type::getInt32Ty(currF->getContext()));
    ft  = FunctionType::get(voidTp, params, false);
    Value *constOne = ConstantInt::get(intTp, 1);
    Constant *exitFunc = M->getOrInsertFunction("exit", ft);
    //insert the exit function call
    builder.CreateCall((Value*)exitFunc, constOne);

    //!create terminator
    //FIXME This doesn't seem to be the right way to do it
    //What shoud be the terminator of block containing 
    //exit instruction?
    Value* retVal = NULL;
    if(!(currF->getReturnType()->isVoidTy())){
      retVal = Constant::getNullValue(currF->getReturnType());
      builder.CreateRet(retVal);
    }
    else {
      builder.CreateRetVoid();
    }
}

void Approx::createEDCECCBB() {
  return;
}

Value* Approx::getOrCreateGlobalName(){                                                                                                                                                  
  if(FunctionToGlobalName.find(currF) != FunctionToGlobalName.end()){
    return FunctionToGlobalName[currF];
  }
  else{
    IRBuilder<> Builder(&currF->getEntryBlock());
    Value* bbName = Builder.CreateGlobalStringPtr(currF->getName(), "ErrorHandler");
    FunctionToGlobalName[currF] = bbName;
    return bbName;
  }
}

Value* Approx::getOrCreateGlobalName(BasicBlock* bb){
  if(BBToGlobalName.find(bb) != BBToGlobalName.end()){
    return BBToGlobalName[bb];
  }
  else{
    IRBuilder<> Builder(&currF->getEntryBlock());
    std::string name = bb->getParent()->getName().str() + "__" + bb->getName().str();
    Value* bbName = Builder.CreateGlobalStringPtr(name.c_str(), "func");
    BBToGlobalName[bb] = bbName;                                                                                                                                                              
    return bbName;
  }
}

Value* Approx::getOrCreateGlobalVariable(std::string name) {
    createGlobal(name);
    return softErrorNumGobal;
}

bool Approx::breakRecDuplication(Instruction* cInst, Instruction* opnd){
    bool retVal = false;
    return retVal;
}

bool Approx::handledByValue(Instruction* inst){
  bool isInValueSet = (valueCheckSet.find(inst) != valueCheckSet.end());
  bool isInValueRangeSet = (valueRangeCheckSet.find(inst) != valueRangeCheckSet.end());
  return (isInValueSet || isInValueRangeSet);
}

void Approx::createGlobal(const std::string name){

  Module *M = currF->getParent();
 
  if(name  == "vpCount" && vpGlobal == NULL){
    GlobalVariable* sigVar = new GlobalVariable(*M,
               IntegerType::get(M->getContext(), 32),
               false,
               GlobalValue::ExternalLinkage,
               0,
               "gVPCount");
    ConstantInt* const_int32_8 = ConstantInt::get(M->getContext(), APInt(32, StringRef("0"), 10));
    sigVar->setInitializer(const_int32_8);
    vpGlobal = sigVar;
  }
  
  else if (name == "errorCount" && softErrorNumGobal == NULL) {
     GlobalVariable* seErrVar = new GlobalVariable(*M,
               IntegerType::get(M->getContext(), 32),
               false,
               GlobalValue::ExternalLinkage,
               0,
               "soft_Error_Count");
    ConstantInt* const_int32_8 = ConstantInt::get(M->getContext(), APInt(32, StringRef("0"), 10));
    seErrVar->setInitializer(const_int32_8);
    softErrorNumGobal = seErrVar;
  }
  else if (name == "errorThreshHold" && errorThreshGlobal == NULL) {
     GlobalVariable* errorThresh = new GlobalVariable(*M,
               IntegerType::get(M->getContext(), 32),
               false,
               GlobalValue::ExternalLinkage,
               0,
               "soft_error_thresh");
    ConstantInt* const_int32 = ConstantInt::get(IntegerType::get(llvm::getGlobalContext(), 32), ERROR_THRESH);
    errorThresh->setInitializer(const_int32);
    errorThreshGlobal = errorThresh;
  }

}

int Approx::getSize(Type* ty){                                                                                                                                                             
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

#undef DEBUG_TYPE
#define DEBUG_TYPE "INTRINSICCALL"
//the following functions vectorize the fuction calls.
Value *Approx::CreateVFSqrt(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module* M = currF->getParent();

  //Value* sqrtv = Intrinsic::getDeclaration(M, Intrinsic::x86_sse2_sqrt_pd, tys);
  Value* sqrtv = Intrinsic::getDeclaration(M, Intrinsic::sqrt, tys);
  Value *CI = builder.CreateCall(sqrtv, v, Name); 
  
  return CI; 
}

Value *Approx::CreateVFabs(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module* M = currF->getParent();

  //Value* sqrtv = Intrinsic::getDeclaration(M, Intrinsic::x86_sse2_sqrt_pd, tys);
  Value* sqrtv = Intrinsic::getDeclaration(M, Intrinsic::fabs, tys);
  Value *CI = builder.CreateCall(sqrtv, v, Name); 
  
  return CI; 
}

Value *Approx::CreateVPow(IRBuilder<> &builder, Value *index, Value *exp, const std::string& Name) {
  SmallVector<Type*, 2> tys;    //two arguments
  tys.push_back(index->getType());
//  tys.push_back(exp->getType());
  Module *M = currF->getParent();

  Value *vpow;
  if (exp->getType()->isFPOrFPVectorTy())
    vpow = Intrinsic::getDeclaration(M, Intrinsic::pow, tys);
  else
    vpow = Intrinsic::getDeclaration(M, Intrinsic::powi, tys);

  Value *CI = builder.CreateCall2(vpow, index, exp, Name);

  return CI;
}

Value *Approx::CreateVExp(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vexp = Intrinsic::getDeclaration(M, Intrinsic::fabs, tys);
  Value *CI = builder.CreateCall(vexp, v, Name);
 
  return CI;
}

Value *Approx::CreateVExp2(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vexp2 = Intrinsic::getDeclaration(M, Intrinsic::fabs, tys);
  Value *CI = builder.CreateCall(vexp2, v, Name);
  
  return CI;
}

Value *Approx::CreateVSin(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vsqrt = Intrinsic::getDeclaration(M, Intrinsic::sin, tys);
  Value *CI = builder.CreateCall(vsqrt, v, Name);
  
  return CI;
}

Value *Approx::CreateVCos(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vsqrt = Intrinsic::getDeclaration(M, Intrinsic::cos, tys);
  Value *CI = builder.CreateCall(vsqrt, v, Name);
  
  return CI;
}

Value *Approx::CreateVFloor(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vfloor = Intrinsic::getDeclaration(M, Intrinsic::floor, tys);
  Value *CI = builder.CreateCall(vfloor, v, Name);
  
  return CI;
}

Value *Approx::CreateVCeil(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vceil = Intrinsic::getDeclaration(M, Intrinsic::ceil, tys);
  Value *CI = builder.CreateCall(vceil, v, Name);
  
  return CI;
}

Value *Approx::CreateVLog(IRBuilder<> &builder, Value *v, const std::string& Name, const int& index) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vlog;
  switch(index) {
    case 0:
      vlog = Intrinsic::getDeclaration(M, Intrinsic::log, tys);
    break;
    case 2:
      vlog = Intrinsic::getDeclaration(M, Intrinsic::log2, tys);
      break;
    case 10:
      vlog = Intrinsic::getDeclaration(M, Intrinsic::log10, tys);
      break;
  }
  Value *CI = builder.CreateCall(vlog, v, Name);
  
  return CI;
}

Value *Approx::CreateVFma(IRBuilder<> &builder, Value *a, Value *b, Value *c, const std::string& Name) {
  SmallVector<Type*, 3> tys;    //three arguments
  tys.push_back(a->getType());
  tys.push_back(b->getType());
  tys.push_back(c->getType());
  Module *M = currF->getParent();

  Value *vfma;
  vfma= Intrinsic::getDeclaration(M, Intrinsic::fma, tys);

  Value *CI = builder.CreateCall3(vfma, a, b, c, Name);
  
  return CI;
}

Value *Approx::CreateVMovmsk_pd(IRBuilder<> &builder, Value *v, const std::string& Name) {
  SmallVector<Type*, 1> tys;
  tys.push_back(v->getType());

  Module *M = currF->getParent();
  Value *vmovmsk = Intrinsic::getDeclaration(M, Intrinsic::x86_sse2_movmsk_pd, tys);
  Value *CI = builder.CreateCall(vmovmsk, v, Name);

  return CI;
}

Value *Approx::CreateVMovmsk_ps(IRBuilder<> &builder, Value *v, const std::string& Name) {
  SmallVector<Type*, 1> tys;
  tys.push_back(v->getType());

  Module *M = currF->getParent();
  Value *vmovmsk = Intrinsic::getDeclaration(M, Intrinsic::x86_sse_movmsk_ps, tys);
  Value *CI = builder.CreateCall(vmovmsk, v, Name);

  return CI;
}

Value *Approx::CreatePtestSSE(IRBuilder<> &builder, Value *lhs, Value *rhs, const std::string& Name) {
  SmallVector<Type*, 2> tys;
  tys.push_back(lhs->getType());
  tys.push_back(rhs->getType());

  Module *M = currF->getParent();
  Value *ptest = Intrinsic::getDeclaration(M, Intrinsic::x86_sse41_ptestz, tys);
  Value *CI = builder.CreateCall2(ptest, lhs, rhs, Name);

  return CI;
}

Value *Approx::CreatePtestAVX(IRBuilder<> &builder, Value *lhs, Value *rhs, const std::string& Name) {
  SmallVector<Type*, 2> tys;
  tys.push_back(lhs->getType());
  tys.push_back(rhs->getType());

  Module *M = currF->getParent();
  Value *ptest = Intrinsic::getDeclaration(M, Intrinsic::x86_avx_ptestz_256, tys);
  Value *CI = builder.CreateCall2(ptest, lhs, rhs, Name);

  return CI;
}
#undef DEBUG_TYPE

//vectorize a scalar value and insert to the local variable map, argument map, or the global variable map
Value* Approx::insertScalarToVectorMap(Value *key, const std::string &instName) {
  if (isa<Constant> (key)) {
    return createConstantVector(key);
  }

  Instruction *keyInst = dyn_cast<Instruction> (key);
  if (scalarToVectorMap.find(keyInst) != scalarToVectorMap.end()) {
    return (dyn_cast<Value>(scalarToVectorMap[keyInst]->replacedBy()));    
  }
  else if (argsScalarToVectorMap.find(key) != argsScalarToVectorMap.end()) {
    return argsScalarToVectorMap[key];
  }
  else if (globalScalarToVectorMap.find(key) != globalScalarToVectorMap.end()) {
    return globalScalarToVectorMap[key];
  }

  BasicBlock::iterator insertAt;
  //we insert the value at the first feasible position of the entry basicblock if it is an argument or global value
  if (key->getValueID() == Value::ArgumentVal || key->getValueID() == Value::GlobalVariableVal) {
    BasicBlock &entryBB = currF->getEntryBlock(); 
    insertAt = entryBB.getFirstNonPHI();
  }
  else {
    insertAt = keyInst;
    insertAt++;
    while (insertAt->getOpcode() == Instruction::PHI || insertAt->getOpcode() == Instruction::LandingPad)
        insertAt++;
  }
  IRBuilder<> builder(&*insertAt);
  Value *newKey = key;

  //FIXME. Create a SIMD vector for 32-bit values needs to take several instruction for packing and unpacking
  //if (key->getType()->isIntegerTy()) {
  //  if (key->getType()->getIntegerBitWidth() < 64) {
  //    newKey = builder.CreateSExt(key, Type::getInt64Ty(currF->getContext()), "sext"+instName);
  //  }
  //}
  Value *val;

  //errs() << "key: " << *key << "\n";
  if (keyInst && instrToInfoObj[keyInst]->isSSEInst()) {
    Value *mask = createMask(keyInst);
    val = builder.CreateShuffleVector(newKey, newKey, mask, "shufInsMap"+instName);
  }
  else {
    val = builder.CreateVectorSplat(VEC_LENGTH, newKey, "splatInsMap"+instName);
  }

  switch (key->getValueID()) {
    case Value::ArgumentVal:
      argsScalarToVectorMap[key] = val;
      break;
    case Value::GlobalVariableVal:
      globalScalarToVectorMap[key] = val;
      break;
    default: {
      Instruction *tmpInst = dyn_cast<Instruction> (val);
      instrInfo *pInstInfo = new instrInfo(tmpInst);
      pInstInfo->setReplacedBy(tmpInst);
      scalarToVectorMap[keyInst] = pInstInfo;
      break;
    }
  }

  //errs() << "scalarToVector " << *val << "\n";
  return val;
}

//determine if we need to extract a value from it vectorized version
bool Approx::extractableVectorValue(Instruction *pInst) {
  if (pInst->getOpcode() == Instruction::Load ||
      pInst->getOpcode() == Instruction::Alloca ||
      pInst->getOpcode() == Instruction::GetElementPtr) 
    return false;

  if (pInst->getOpcode() == Instruction::Call) {
    Instruction *dupCall = NULL; 
    if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end()) {
      dupCall = scalarToVectorMap[pInst]->replacedBy();
      if (dupCall->getOpcode() != Instruction::Call) {//the call is duplicated by insert and shuffle instructions
        scalarToVectorMap[pInst]->setLastUses(1);
        return false;
      }
      else
        return true;
    }
    else 
      return false;
  }

  return true;
}

//check if the type of an instruction is a primitive type
bool Approx::isPrimitiveType(const Instruction *pInst) {
  if (pInst->getType()->isIntegerTy() ||          
     (pInst->getType()->isFloatingPointTy()) ||
     (pInst->getType()->isPointerTy()) ||
     (pInst->getType()->isVectorTy())) {
    return true;
  }

  return false;
}

//create a mask for shufflevector
Value* Approx::createMask(const Instruction *pInst) {
  VectorType *vecTy = dyn_cast<VectorType> (pInst->getType());
  unsigned numOfElem = vecTy->getNumElements() * VEC_LENGTH;
  SmallVector<Constant*, 16> MaskVec(numOfElem);
  for (unsigned i = 0; i < numOfElem; ++i) {
    MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), i);
  }
  Value *mask = ConstantVector::get(MaskVec);
  return mask;
}

//create a mask to extract the values from a vector
Value* Approx::extractMask(const Instruction *pInst) {
  VectorType *vecTy = dyn_cast<VectorType> (pInst->getType());
  unsigned numOfElem = vecTy->getNumElements();
  SmallVector<Constant*, 8> MaskVec(numOfElem);
  for (unsigned i = 0; i < numOfElem; ++i) {
    MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), i);
  }
  Value *mask = ConstantVector::get(MaskVec);
  return mask;
}

Value* Approx::extractHalfMask(const Instruction *pInst) {
  VectorType *vecTy = dyn_cast<VectorType> (pInst->getType());
  unsigned numOfElem = vecTy->getNumElements()/2;
  SmallVector<Constant*, 8> MaskVec(numOfElem);
  for (unsigned i = 0; i < numOfElem; ++i) {
    MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), i);
  }
  Value *mask = ConstantVector::get(MaskVec);
  return mask;
}


//create a vector with 2 * numofelems in val
Value* Approx::createConstantVector(Value *val) {
  Constant *CI = dyn_cast<Constant> (val);
  if (CI == NULL)
    return NULL;

  if (val->getType()->isVectorTy()) {
    VectorType *vTy = dyn_cast<VectorType>(val->getType());
    unsigned numElems = vTy->getNumElements();
    if (Constant *SV = CI->getSplatValue()) {
      return (dyn_cast<Value> (ConstantVector::getSplat(numElems*2, SV))); 
    }

    std::vector<Constant*> elts;
    for (unsigned i = 0; i < numElems; ++i) {
      elts.push_back(CI->getAggregateElement(i));
    }
    
    for (unsigned i = 0; i < numElems; ++i) {
      elts.push_back(CI->getAggregateElement(i));
    }

    return (dyn_cast<Value> (ConstantVector::get(elts)));
  }
  else
    return (dyn_cast<Value> (ConstantVector::getSplat(VEC_LENGTH, CI))); 

}

Value *Approx::createInsertElementMask(const Instruction *pInst, bool doubleSize) {
  VectorType *vecTy = dyn_cast<VectorType> (pInst->getType());
  unsigned numOfElem = vecTy->getNumElements();
  unsigned halfElem = doubleSize ? numOfElem : numOfElem/2;
  if (doubleSize) {
    numOfElem *= 2;
  }
  SmallVector<Constant*, 16> MaskVec(numOfElem);
  for (unsigned i = 0; i < halfElem; ++i) {
    MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), 2 * i);
  }
  for (unsigned i = 0; i < halfElem; ++i) {
    MaskVec[halfElem+i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), 2 * i + 1);
  }
  Value *mask = ConstantVector::get(MaskVec);
  return mask;
}

Value *Approx::createInstDuplicationMask(const Instruction *pInst) {
  VectorType *vecTy = dyn_cast<VectorType> (pInst->getType());
  unsigned numOfElem = vecTy->getNumElements();
  SmallVector<Constant*, 16> MaskVec(numOfElem);
  for (unsigned i = 0; i < numOfElem; ++i) {
    if (i < numOfElem) {
      MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), i);
    }
    else {
      MaskVec[i] = ConstantInt::get(Type::getInt32Ty(currF->getContext()), i + numOfElem);
    }
  }
  Value *mask = ConstantVector::get(MaskVec);
  return mask;
}
