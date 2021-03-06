/*
 * Author: Zhi Chen zhic2@uci.edu
 */

#define DEBUG_TYPE "APPROX"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h" //command line options
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/APInt.h"
#include "llvm/Support/InstIterator.h"
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
#include "MyProfileInfoLoader.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
using namespace llvm;

cl::opt<bool> APVerbose("ap-verbose",
                        cl::desc("verbose"),
                        cl::init(false));
cl::opt<bool> APUseProfile("use-profile",
                        cl::desc("verbose"),
                        cl::init(true));
cl::opt<bool> APUseSecondProfile("ap-use-second-profile",
                        cl::desc("verbose"),
                        cl::init(true));
cl::opt<double> APValueThr("ap-value-threshold",                                                                                                                                            
                            cl::desc("Threshold for considering a range of values as frequently generated"),
                            cl::init(0.99));
cl::opt<double> APRangeThr("ap-range-thr",                                                                                                                                            
                            cl::desc("Threshold for considering a range of values as frequently generated"),
                            cl::init(.1));
cl::opt<bool> APExitBB("ap-insert-BB",
                            cl::desc("Insert exit BB for transfer of control"),
                            cl::init(true));
cl::opt<bool> APValues("ap-values",
                            cl::desc("Insert checks on values"),
                            cl::init(true));
cl::opt<bool> APValueRanges("ap-ranges",
                            cl::desc("Insert checks on value ranges"),
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
cl::opt<double> APExcludeThr("ap-exclude-thr",                                                                                                                                            
                            cl::desc("Threshold for excluding infrequently executed insts"),
                            cl::init(.01));

cl::opt<int> APHeightThr("ap-height-thr",                                                                                                                                            
                            cl::desc("Threshold for considering a single check for a range of values"),
                            cl::init(5));
cl::opt<bool> APDebug("ap-debug",
                            cl::desc("Do the debug stuff"),
                            cl::init(false));
cl::opt<bool> localStatsAP("ap-localstats",
                            cl::desc("print the statistic collected"),
                            cl::init(false));
cl::opt<bool> scalarToVec("scalar-vector-convert",
                            cl::desc("duplicate scalr instructions and generate the corresponding vector instruction"),
                            cl::init(true));

static cl::opt<std::string>
ProfileInfoFilename2("profile-info-file2", cl::init("llvmprof.out"),
                    cl::value_desc("filename"),
                    cl::desc("Profile file loaded by -profile-loader2"));
//extern cl::opt<std::string> ProfileInfoFilename;
//cl::opt<double> APAcptRange("ap-acpt-range",                                                                                                                                            
//cl::desc("Acceptable range for inserting a range check"),
//cl::init(512));
STATISTIC(counter, "The number of functions greeted");
STATISTIC(totalIR, "The number of total IR instructions");
//STATISTIC(totalIRDyn, "The number of total dynamic IR instructions");
STATISTIC(stateVars, "The number of total state variables");
//STATISTIC(stateVarsDyn, "The number of total dynamic state variables");
STATISTIC(duplicatedIR, "The number of dupliacted IR instructions");
//STATISTIC(duplicatedIRDyn, "The number of dupliacted dynamic IR instructions");
STATISTIC(expChecks, "The number of total expected value checks inserted");
//STATISTIC(expChecksDyn, "The number of total expected value dynamic instructions inserted");

STATISTIC(NumEdgesRead, "The # of edges read.");

namespace llvm{
  ModulePass *createProfileLoaderBPass();
  Pass *createProfileLoaderBPass(const std::string &Filename);
}

namespace {
  /*class LoaderPassB : public ModulePass, public MyProfileInfo {*/
  class LoaderPassB : public ModulePass, public ProfileInfo {
    std::string Filename;
    std::set<Edge> SpanningTree;
    std::set<const BasicBlock*> BBisUnvisited;
    unsigned ReadCount;
  public:
    static char ID; // Class identification, replacement for typeinfo
    explicit LoaderPassB(const std::string &filename = "");

    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.setPreservesAll();
    }

    virtual const char *getPassName() const {
      return "Profiling information loader2";
    }

    // recurseBasicBlock() - Calculates the edge weights for as much basic
    // blocks as possbile.
    virtual void recurseBasicBlock(const BasicBlock *BB);
    virtual void readEdgeOrRemember(Edge, Edge&, unsigned &, double &);
    virtual void readEdge(MyProfileInfo::Edge, std::vector<unsigned>&);

    /// getAdjustedAnalysisPointer - This method is used when a pass implements
    /// an analysis interface through multiple inheritance.  If needed, it
    /// should override this to adjust the this pointer as needed for the
    /// specified pass info.
    /*virtual void *getAdjustedAnalysisPointer(AnalysisID PI) {*/
    /*if (PI == &MyProfileInfo::ID)*/
    /*return (MyProfileInfo*)this;*/
    /*return this;*/
    /*}*/
    
    /// run - Load the profile information from the specified file.
    virtual bool runOnModule(Module &M);
  };
}  // End of anonymous namespace

char LoaderPassB::ID = 0;
//INITIALIZE_AG_PASS(LoaderPassB, ProfileInfo, "profile-loader2",
//"Load profile information from llvmprof.out", false, true, false)

//char &llvm::ProfileLoaderPassID = LoaderPassB::ID;
static RegisterPass<LoaderPassB> G("profile-loader2", "Load profile information from specified profileinfo file");
ModulePass *llvm::createProfileLoaderBPass() { return new LoaderPassB(); }

/// createProfileLoaderPass - This function returns a Pass that loads the
/// profiling information for the module from the specified filename, making it
/// available to the optimizers.
Pass *llvm::createProfileLoaderBPass(const std::string &Filename) {
  return new LoaderPassB(Filename);
}

LoaderPassB::LoaderPassB(const std::string &filename ) : ModulePass(ID), Filename(filename) {
  //initializeLoaderPassBPass(*PassRegistry::getPassRegistry());
  if (filename.empty()) Filename = ProfileInfoFilename2;
}

void LoaderPassB::readEdgeOrRemember(Edge edge, Edge &tocalc, 
                                    unsigned &uncalc, double &count) {
  double w;
  if ((w = getEdgeWeight(edge)) == MissingValue) {
    tocalc = edge;
    uncalc++;
  } else {
    count+=w;
  }
}

// recurseBasicBlock - Visits all neighbours of a block and then tries to
// calculate the missing edge values.
void LoaderPassB::recurseBasicBlock(const BasicBlock *BB) {

  // break recursion if already visited
  if (BBisUnvisited.find(BB) == BBisUnvisited.end()) return;
  BBisUnvisited.erase(BB);
  if (!BB) return;

  for (succ_const_iterator bbi = succ_begin(BB), bbe = succ_end(BB);
       bbi != bbe; ++bbi) {
    recurseBasicBlock(*bbi);
  }
  for (const_pred_iterator bbi = pred_begin(BB), bbe = pred_end(BB);
       bbi != bbe; ++bbi) {
    recurseBasicBlock(*bbi);
  }

  Edge tocalc;
  if (CalculateMissingEdge(BB, tocalc)) {
    SpanningTree.erase(tocalc);
  }
}

void LoaderPassB::readEdge(MyProfileInfo::Edge e,
                          std::vector<unsigned> &ECs) {
  if (ReadCount < ECs.size()) {
    double weight = ECs[ReadCount++];
    if (weight != MyProfileInfoLoader::Uncounted) {
      // Here the data realm changes from the unsigned of the file to the
      // double of the ProfileInfo. This conversion is save because we know
      // that everything thats representable in unsinged is also representable
      // in double.
      EdgeInformation[getFunction(e)][e] += (double)weight;

      DEBUG(dbgs() << "--Read Edge Counter for " << e
                   << " (# "<< (ReadCount-1) << "): "
                   << (unsigned)getEdgeWeight(e) << "\n");
    } else {
      // This happens only if reading optimal profiling information, not when
      // reading regular profiling information.
      SpanningTree.insert(e);
    }
  }
}

bool LoaderPassB::runOnModule(Module &M) {
  MyProfileInfoLoader PIL("profile-loader", Filename);
  EdgeInformation.clear();
  std::vector<unsigned> Counters = PIL.getRawEdgeCounts();
  if (Counters.size() > 0) {
    ReadCount = 0;
    for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F) {
      if (F->isDeclaration()) continue;
      DEBUG(dbgs() << "Working on " << F->getName() << "\n");
      readEdge(getEdge(0,&F->getEntryBlock()), Counters);
      for (Function::iterator BB = F->begin(), E = F->end(); BB != E; ++BB) {
        TerminatorInst *TI = BB->getTerminator();
        for (unsigned s = 0, e = TI->getNumSuccessors(); s != e; ++s) {
          readEdge(getEdge(BB,TI->getSuccessor(s)), Counters);
        }
      }
    }
    if (ReadCount != Counters.size()) {
      errs() << "WARNING: profile information is inconsistent with "
             << "the current program!\n";
    }
    NumEdgesRead = ReadCount;
  }

  Counters = PIL.getRawOptimalEdgeCounts();
  if (Counters.size() > 0) {
    ReadCount = 0;
    for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F) {
      if (F->isDeclaration()) continue;
      DEBUG(dbgs() << "Working on " << F->getName() << "\n");
      readEdge(getEdge(0,&F->getEntryBlock()), Counters);
      for (Function::iterator BB = F->begin(), E = F->end(); BB != E; ++BB) {
        TerminatorInst *TI = BB->getTerminator();
        if (TI->getNumSuccessors() == 0) {
          readEdge(getEdge(BB,0), Counters);
        }
        for (unsigned s = 0, e = TI->getNumSuccessors(); s != e; ++s) {
          readEdge(getEdge(BB,TI->getSuccessor(s)), Counters);
        }
      }
      while (SpanningTree.size() > 0) {

        unsigned size = SpanningTree.size();

        BBisUnvisited.clear();
        for (std::set<Edge>::iterator ei = SpanningTree.begin(),
             ee = SpanningTree.end(); ei != ee; ++ei) {
          BBisUnvisited.insert(ei->first);
          BBisUnvisited.insert(ei->second);
        }
        while (BBisUnvisited.size() > 0) {
          recurseBasicBlock(*BBisUnvisited.begin());
        }

        if (SpanningTree.size() == size) {
          DEBUG(dbgs()<<"{");
          for (std::set<Edge>::iterator ei = SpanningTree.begin(),
               ee = SpanningTree.end(); ei != ee; ++ei) {
            DEBUG(dbgs()<< *ei <<",");
          }
          assert(0 && "No edge calculated!");
        }

      }
    }
    if (ReadCount != Counters.size()) {
      errs() << "WARNING: profile information is inconsistent with "
             << "the current program!\n";
    }
    NumEdgesRead = ReadCount;
  }

  BlockInformation.clear();
  Counters = PIL.getRawBlockCounts();
  if (Counters.size() > 0) {
    ReadCount = 0;
    for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F) {
      if (F->isDeclaration()) continue;
      for (Function::iterator BB = F->begin(), E = F->end(); BB != E; ++BB)
        if (ReadCount < Counters.size())
          // Here the data realm changes from the unsigned of the file to the
          // double of the ProfileInfo. This conversion is save because we know
          // that everything thats representable in unsinged is also
          // representable in double.
          BlockInformation[F][BB] = (double)Counters[ReadCount++];
    }
    if (ReadCount != Counters.size()) {
      errs() << "WARNING: profile information is inconsistent with "
             << "the current program!\n";
    }
  }

  FunctionInformation.clear();
  Counters = PIL.getRawFunctionCounts();
  if (Counters.size() > 0) {
    ReadCount = 0;
    for (Module::iterator F = M.begin(), E = M.end(); F != E; ++F) {
      if (F->isDeclaration()) continue;
      if (ReadCount < Counters.size())
        // Here the data realm changes from the unsigned of the file to the
        // double of the ProfileInfo. This conversion is save because we know
        // that everything thats representable in unsinged is also
        // representable in double.
        FunctionInformation[F] = (double)Counters[ReadCount++];
    }
    if (ReadCount != Counters.size()) {
      errs() << "WARNING: profile information is inconsistent with "
             << "the current program!\n";
    }
  }
  return false;
}

char Approx::ID = 0;
unsigned long long Approx::totStateVars = 0;
unsigned long long Approx::totStateVarsDyn = 0;
unsigned long long Approx::totalIRDyn = 0;
unsigned long long Approx::stateVarsDyn = 0;
unsigned long long Approx::duplicatedIRDyn = 0;
unsigned long long Approx::expChecksDyn = 0;
unsigned long long Approx::totFPVars = 0;
unsigned long long Approx::totFPVarsDyn = 0;
//unsigned long long Approx::totErrors = 0;
unsigned long long Approx::totFPVecInst = 0;
bool Approx::flag = false;
GlobalVariable* Approx::vpGlobal = NULL;

Value* Approx::exitStr = NULL;

bool Approx::doFinalization(Module &M){
  if(localStatsAP){
    errs() << totalIRDyn << " The number of total dynamic IR instructions" << "\n"; 
    errs() << stateVarsDyn << " The number of total dynamic state variables" << "\n"; 
    errs() << duplicatedIRDyn << " The number of dupliacted dynamic IR instructions" << "\n"; 
    errs() << expChecksDyn << " The number of total expected value dynamic instructions inserted" << "\n";
    errs() << "----------------------------------" << "\n";
  }
  return true;
}

static RegisterPass<Approx> X("approx", "Insert checking for values");
void Approx::getAnalysisUsage(AnalysisUsage &AU) const{
  AU.addRequired<LoopInfo>();
  if(APUseProfile){
    AU.addRequired<ProfileInfo>();
    AU.addRequired<LoaderPassB>();
    //AU.addRequired<MyProfileInfo>();
// ------------- commented by zhi ------------------
//    AU.addRequired<VPLoadProfile>();
//    AU.addRequired<VPLoadProfile2>();
// -------------- end of comment -------------------
  }
  AU.addRequired<DataLayout>();
}

bool Approx::runOnFunction(Function &F){
  //if(flag){
  //  return false;
  //}
  //if(TD == NULL)
  errs() << "Current function in analysis is: " << F.getName().str() << "\n"; 
  TD = &getAnalysis<DataLayout>();
  ++counter;
  currF = &F;
  //errs() << "function name: ";
  //errs().write_escaped(F.getName()) << '\n';
  //clean up from previous function
  for(tInstrToInfoObj::iterator iter = instrToInfoObj.begin(); iter != instrToInfoObj.end(); iter++){
    delete ((*iter).second);
  }
  instrToInfoObj.clear();
  vcmpToCheckInst.clear();
  cmpInstInserted.clear();
  vcmpInstInserted.clear();
  valueCheckSet.clear();
  valueRangeCheckSet.clear();
  ptrCheckSet.clear();
  alreadySeen.clear();
  scalarToVectorMap.clear();
  instrVec.clear();

  LI = &getAnalysis<LoopInfo>();

  if(APUseProfile){
    PI = &getAnalysis<ProfileInfo>();
    PI2 = &getAnalysis<LoaderPassB>();
    //errs() << F.getName() << ":" << PI->getExecutionCount(&F) << ":" <<  PI2->getExecutionCount(&F) << "\n";
  }

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
//    and the duplicated instructions are packed in the same register. This is harder to implemented
//    in LLVM.
// We probably need to have a setFPVarVector method to check vector instructions. 
  if ((pInst->getType())->isFPOrFPVectorTy() || 
      pInst->getOpcode() == Instruction::Store ||
      pInst->getOpcode() == Instruction::FCmp) {// || (pInst->getType())->isVectorTy()) {
	  if ((pInst->getType())->isVectorTy()) {
		  errs()<< *pInst << " is a vector instruction."<<"\n";	
      instrToInfoObj[pInst]->setFPVectorInst();
      totFPVecInst++;
	  }
	  instrToInfoObj[pInst]->setFPVar();
	  totFPVars++;
	  totFPVarsDyn += PI->getExecutionCount(pInst->getParent());
  }
// ------------------- end ---------------------------------------------------------------

    totalIR++;
    totalIRDyn += PI->getExecutionCount(pInst->getParent());
  }

  errs() << "\nInstruction scanning is done! Now performing instruction duplication......" << "\n\n";

  if(APDuplication){
    duplicateProducers();
  }
  
  errs() << "\nInstruction duplication is done! Now cleaning the instrumented scalar instructions....." << "\n\n";
  
  if (scalarToVec) {
    deleteInstrumentedScalarInst();
  }

  errs() << "\nInstruction cleaning is done! Now splitting the basic blocks according to the inserted error checking code...." << "\n\n";

  if(APVPCounter){
    createGlobal(); 
  }
  //split at inserted cmps and point to exit block
//  createExitBB();
//  splitBBAndPointExitBlock();

  errs() << "\nInstrumenation for Function " << F.getName().str() << " is done! You can generate code with LLC\n\n";

  flag = true;
  return true;
}

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupProducers"
int Approx::duplicateProducers(){
  int longestPath = 0;
//  DEBUG(dbgs() << "*** Duplicating producers of state variables in function " <<  currF->getName() << " ***" << "\n");
  DEBUG(dbgs() << "*** Duplicating producers of FP variables in function " <<  currF->getName() << " ***" << "\n");
  int SV_chain = 0, checkingCode = 0;
  std::stringstream scalarDupName("S");
  std::stringstream vectorDupName("V");
  //for(std::map<Instruction*, instrInfo*>::iterator iter = instrToInfoObj.begin(); iter != instrToInfoObj.end(); iter++) { 
  for (std::vector<Instruction*>::iterator it = instrVec.begin(); it != instrVec.end(); it++) {
    instrInfo *currInstInfo = instrToInfoObj[*it];
    if (currInstInfo->isFPVar() && scalarToVectorMap.find(*it) == scalarToVectorMap.end()){
      Instruction *currInst = *it;
      if (handledByValue(currInst)) {
         DEBUG(dbgs() << "Handled by value (exact or range)" << "\n");
      }
      else {
        DEBUG(dbgs() << "Current FP instr " << *currInst << "\n");
        std::stringstream chainName;
        std::stringstream checkingName;
        //if((*iter).second->isFPVectorInst()){       // if the current instruction is already vectorized, we can only do scalar duplication
        if(currInstInfo->isFPVectorInst()){       // if the current instruction is already vectorized, we can only do scalar duplication
          chainName << vectorDupName.str() << SV_chain << "_D";
          checkingName<< "EDCS" << checkingName ;

          Instruction* dupInst = duplicateProdRec(currInst, chainName.str());
          if (dupInst != NULL) {
            DEBUG(dbgs() << "Duplicated FP instr " << *dupInst << "\n");
       	    insertCmp(currInst, dupInst, currInst, checkingName.str(), true);
          }
        }
        else {
          //chainName << vectorDupName.str() << ((dyn_cast<Value> (currInst))->getName()).str();
          chainName << scalarDupName.str() << SV_chain << "_D";
          checkingName << "EDCV" << checkingName;
          Instruction *vectorizedInst = duplicateScalarToVector(currInst, chainName.str()); 
          //to be implemented
          //if(vectorizedInst != NULL)
          //shuffle
          //insertVCmp(vectorizedInst, shuffledInst, checkingName.str());
        }
        SV_chain++;
      }
    }
  }
  return longestPath;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupScalarToVector"
//duplicate the scalar instruction to vector mode
Instruction* Approx::duplicateScalarToVector(Instruction *pInst, const std::string &instName) { 
  Instruction *duplicatedInst = NULL;
  if (instrToInfoObj[pInst]->isDuplicated()) {
    duplicatedInst = instrToInfoObj[pInst]->duplicatedBy();
  }
  else {
    switch(pInst->getOpcode()) {
      //memory instructions
      case Instruction::Load:
        duplicatedInst = duplicateScalarLoad(pInst, instName); 
        break;
      case Instruction::Store:
        duplicatedInst = duplicateScalarStore(pInst, instName);
        break;
      case Instruction::Alloca:
        break;
      case Instruction:: Ret:
        break;
      case Instruction::Br:
        break;
      case Instruction::PHI:
        duplicatedInst = duplicatePhiNode(pInst, instName);
        //duplicatedInst = duplicatePhiNodeVectorTy(pInst, instName);
        break;
      
      //standard arithmetic operations and comparisons
      case Instruction::FCmp:
      case Instruction::FAdd:
      case Instruction::FSub:
      case Instruction::FMul:
      case Instruction::FDiv:
      case Instruction::FRem:
        duplicatedInst = duplicateScalarArithmetic(pInst, instName);
        break;
      case Instruction::Call: {
        Function *func = dyn_cast<CallInst>(pInst)->getCalledFunction();
        std::string funName = func->getName().str(); 

        if (funName == "sqrt" || funName == "fabs" || funName == "sin" ||
            funName == "cos" || funName == "exp" || funName == "log")
          duplicatedInst = duplicateScalarArithmetic(pInst, instName, 1);    //mainly for sqrt, sin, cos....
        else if (funName == "exp")
          duplicatedInst = duplicateScalarArithmetic(pInst, instName, 2);    //for functions with 2 parameters
        else
          duplicatedInst = duplicateCall(pInst, instName);
        break;
      }

      //convert instruction:
      case Instruction::FPTrunc:
      case Instruction::FPExt:
        duplicatedInst = duplicateFPTruncExt(pInst, instName);
        break;
      case Instruction::SIToFP:
      case Instruction::UIToFP:
        duplicatedInst = duplicateIntToFP(pInst, instName);
        break;
      default:
        break;
    }
  }
  return NULL;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupScalarMemory"
//vector the scalar load instruction
Instruction *Approx::duplicateScalarLoad(Instruction* pInst, const std::string &instName) {
  Value *loadValue = pInst->getOperand(0);
  //Instruction *operand = dyn_cast<Instruction>(loadValue);
  LoadInst *vectorizedLDInstr = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);
 
  //if the current load value is not vectorized, we need to vectorize the value first
  if (!(loadValue->getType())->isVectorTy()) {
    VectorType *vecTy;
    Type *lvTy = loadValue->getType();
    if (lvTy->isPointerTy()) {      //this is a pointer type
      if (lvTy->getPointerElementType()->isDoubleTy()) {  //double pointer type
        vecTy = VectorType::get(Type::getDoubleTy(currF->getContext()), VEC_LENGTH);
      }
      else if (lvTy->getPointerElementType()->isFloatTy()) {      //float pointer type
        vecTy = VectorType::get(Type::getFloatTy(currF->getContext()), VEC_LENGTH);
      }
    }
    else if (lvTy->isDoubleTy()) {
      vecTy = VectorType::get(Type::getDoubleTy(currF->getContext()), VEC_LENGTH);
    }
    else if (lvTy->isFloatTy()) {
      vecTy = VectorType::get(Type::getFloatTy(currF->getContext()), VEC_LENGTH);
    }

    Type *vecPtrTy = PointerType::getUnqual(vecTy);
    BitCastInst *scalarToVector = new BitCastInst(loadValue, vecPtrTy, "BC"+instName, insertAt);

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
  }
  
  return vectorizedLDInstr;
}

Instruction* Approx::duplicateScalarStore(Instruction *pInst, const std::string& instName) {
  Instruction *vecStInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);

  Value *oprand0 = pInst->getOperand(0);
  Value *stAddr = pInst->getOperand(1);    //address to store
  if (Constant *CI = dyn_cast<Constant> (oprand0))
  {
    vecStInst = pInst->clone();
    vecStInst->insertBefore(insertAt);
  }
  else {
    Instruction *stVal = dyn_cast<Instruction> (oprand0);
    //errs() << " rrrrrrrrrrrrrrr " << *pInst->getOperand(0)->getType() << "      " << *stVal << "\n";
    Type* u32Ty = Type::getInt32Ty(currF->getContext());
    Value *index =  ConstantInt::get(u32Ty, 1);

    Value *extract = NULL;
    if (scalarToVectorMap.find(stVal) != scalarToVectorMap.end()) {
      Instruction *vecOp0 = scalarToVectorMap[stVal]->replacedBy();
      extract = builder.CreateExtractElement(vecOp0, index, "extract"+instName);
    }
    else {
      extract = stVal; 
    }

    vecStInst = builder.CreateAlignedStore(extract, stAddr, (dyn_cast<StoreInst> (pInst))->getAlignment());
  }

  instrInfo *pInstInfo = new instrInfo(vecStInst);
  pInstInfo->setReplacedBy(vecStInst);
  scalarToVectorMap[pInst] = pInstInfo;
  errs() << "New generated store instruction is: " << *vecStInst << "\n";

  return vecStInst;
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

  //errs() << " insert point is --------------------- " << *insertAt << "\n";

  Value *oprand = pInst->getOperand(0);
  Instruction *opInst = dyn_cast<Instruction> (oprand);

  VectorType *dstTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  Value *src;
  Value *vecConvert;

  if (scalarToVectorMap.find(opInst) != scalarToVectorMap.end()) { //operand exists
    src = scalarToVectorMap[opInst]->replacedBy();    
  }
  else {  // is constant or from int instruction
    VectorType *vecTy = VectorType::get(oprand->getType(), VEC_LENGTH);
    Value *emptyVec = UndefValue::get(vecTy);
    Type* u32Ty = Type::getInt32Ty(currF->getContext());
    Value *index0 =  ConstantInt::get(u32Ty, 0);
    Value *index1 =  ConstantInt::get(u32Ty, 1);
  
    Value *val = builder.CreateInsertElement(emptyVec, oprand, index0, "in0"+instName);
    src = builder.CreateInsertElement(val, oprand, index1, "in1"+instName);
  }

  if (pInst->getOpcode() == Instruction::FPExt)
    vecConvert = builder.CreateFPExt(src, dstTy, "FPExt"+instName);
  else
    vecConvert = builder.CreateFPTrunc(src, dstTy, "FPTrunc"+instName);

  dupInst = dyn_cast<Instruction> (vecConvert);

  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  errs() << "Vectorized FPExtOrTrunc instruction is : " << *dupInst << "\n";

  return dupInst;
}

//vector the scalar integer to FP conversion instructions
Instruction* Approx::duplicateIntToFP(Instruction *pInst, const std::string& instName) {
  Instruction *dupInst = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++;
  IRBuilder<> builder(&*insertAt);
  //errs() << " insert point is --------------------- " << *insertAt << "\n";

  Value *oprand = pInst->getOperand(0);
  Instruction *opInst = dyn_cast<Instruction> (oprand);
  Value *src;
  VectorType *dstTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  Value *vecConvert;

  if (scalarToVectorMap.find(opInst) != scalarToVectorMap.end()) {
    src = scalarToVectorMap[opInst]->replacedBy(); 
  }
  else {
    VectorType *vecTy = VectorType::get(oprand->getType(), VEC_LENGTH);
    Value *emptyVec = UndefValue::get(vecTy);
    Type* u32Ty = Type::getInt32Ty(currF->getContext());
    Value *index0 =  ConstantInt::get(u32Ty, 0);
    Value *index1 =  ConstantInt::get(u32Ty, 1);
  
    Value *src0 = builder.CreateInsertElement(emptyVec, oprand, index0, "in0"+instName);
    src = builder.CreateInsertElement(src0, oprand, index1, "in1"+instName);
  }
  if (pInst->getOpcode() == Instruction::UIToFP)
    vecConvert = builder.CreateUIToFP(src, dstTy, "UIToFP"+instName);
  else
    vecConvert = builder.CreateSIToFP(src, dstTy, "UIToFP"+instName);

  dupInst = dyn_cast<Instruction> (vecConvert);

  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  errs() << "Vectorized int to FP: " << *dupInst << "\n";
 
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
    while (insertAt->getOpcode() == Instruction::PHI)
      insertAt++;
  }
  else { 
    Instruction *lastInst = --insertAt;
    if (pInst->getType() == lastInst->getType()) {
      insertAt = scalarToVectorMap[lastInst]->replacedBy();
    }
    else {
      insertAt++;
    }
    insertAt++;
  }
  
  //errs() << " insert point is --------------------- " << *insertAt << "\n";

  Value *phiNodeVal = dyn_cast<Value>(pInst);
  VectorType *vecTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  Value *emptyVec = UndefValue::get(vecTy);
  Type* u32Ty = Type::getInt32Ty(currF->getContext());
  Value *index0 =  ConstantInt::get(u32Ty, 0);
  Value *index1 =  ConstantInt::get(u32Ty, 1);
   
  //Instruction *InsertVal0 = InsertElementInst::Create(emptyVec, phiNodeVal, index0, "insert0"+instName);
  //Instruction *vecPhiInst = InsertElementInst::Create(InsertVal0, phiNodeVal, index1, "insert1"+instName); 
  IRBuilder<> builder(&*insertAt);
  Value *Val0 = builder.CreateInsertElement(emptyVec, phiNodeVal, index0, "insert0"+instName);
  Value *Val1 = builder.CreateInsertElement(Val0, phiNodeVal, index1, "insert1"+instName);
  Instruction *InsertVal0 = dyn_cast<Instruction> (Val0);
  dupInst= dyn_cast<Instruction> (Val1);

  //errs() << "aaaaaaaaaaaaaaaaaa " << *InsertVal0 << "  " << *vecPhiInst << "\n";
  //InsertVal0->insertAfter(pInst);
  //vecPhiInst->insertAfter(InsertVal0);

  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  errs() << "Vectorized phi node: " << *dupInst << "\n";
      
  return dupInst;
}

Instruction* Approx::duplicatePhiNodeVectorTy(Instruction *pInst, const std::string &instName) {
  Instruction *dupInst = NULL;

  if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end()) {// this instruction has already been instrumented
    return dupInst;
  }

  BasicBlock::iterator insertAt = pInst;
  insertAt++; 
  IRBuilder<> builder(&*insertAt);
  LLVMContext &ctxt = currF->getContext();

  PHINode *scalarPhi = dyn_cast<PHINode> (pInst);
  unsigned numIncomingValues = scalarPhi->getNumIncomingValues();
  Type  *retTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  //PHINode *vectorPhi = builder.CreatePHI(retTy, numIncomingValues, "VPhi"+instName);
  PHINode *vectorPhi = builder.CreatePHI(retTy, 0, "VPhi"+instName);
  Value *valueToSet;

  for (int i = 0; i < numIncomingValues; i++) {
    Value *incomingVal = scalarPhi->getIncomingValue(i);
    errs() << "the value of the " << i << "th field of the PHI node is " << *incomingVal << "\n";
    BasicBlock *incomingBB = scalarPhi->getIncomingBlock(i);
    //if current value is a constant, we need to create a vector constant in the orginal bb
    //the reason why we cannot create the constant vector in the current bb is because we have
    //to keep phi nodes are grouped at the top of the current bb.
    Instruction *incomingInst = dyn_cast<Instruction> (incomingVal);
    if (scalarToVectorMap.find(incomingInst) != scalarToVectorMap.end()) {
      valueToSet = scalarToVectorMap[incomingInst]->replacedBy();
    }
    else {
      VectorType *vecTy = VectorType::get(incomingVal->getType(), VEC_LENGTH);
      Value *emptyVec = UndefValue::get(vecTy);
      Type* u32Ty = Type::getInt32Ty(currF->getContext());
      Value *index0 =  ConstantInt::get(u32Ty, 0);
      Value *index1 =  ConstantInt::get(u32Ty, 1);
 
      Instruction *termInst = incomingBB->getFirstInsertionPt(); 
      IRBuilder<> bbBuilder(&*(termInst));
      Value *src0 = bbBuilder.CreateInsertElement(emptyVec, incomingVal, index0, "in0"+instName);
      valueToSet = bbBuilder.CreateInsertElement(src0, incomingVal, index1, "in1"+instName);
    }
    //vectorPhi->setIncomingValue(i, valueToSet);
    //vectorPhi->setIncomingBlock(i, incomingBB);
    vectorPhi->addIncoming(valueToSet, incomingBB);
  }

  dupInst = dyn_cast<Instruction> (vectorPhi);
  instrInfo *pInstInfo = new instrInfo(dupInst);
  pInstInfo->setReplacedBy(dupInst);
  scalarToVectorMap[pInst] = pInstInfo;

  errs() << "The vectorized Phi node is " << *dupInst << "\n";
  return dupInst;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "DupScalarArith"
Instruction *Approx::duplicateScalarArithmetic(Instruction *pInst, const std::string &chainPrefix, const int &numOperands) {
  Instruction *replacedInst = NULL;

  if (scalarToVectorMap.find(pInst) != scalarToVectorMap.end()) {
    replacedInst = scalarToVectorMap[pInst]->replacedBy(); 
    //errs() << " replacedReturn " << *replacedInst << "\n";
    return replacedInst;
  }

  Value *dupVal = NULL;
  BasicBlock::iterator insertAt = pInst;
  insertAt++; 
  LLVMContext &ctxt = currF->getContext();
  IRBuilder<> builder(&*insertAt);
  Value *oprnd = pInst->getOperand(0);
  Type *vecTy = VectorType::get(oprnd->getType(), VEC_LENGTH);
  Type  *dstTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  Value *emptyVec = UndefValue::get(vecTy);
  Type* u32Ty = Type::getInt32Ty(ctxt);
  Value *index0 =  ConstantInt::get(u32Ty, 0);
  Value *index1 =  ConstantInt::get(u32Ty, 1);
   
  //Value *oprnd1 = pInst->getOperand(1);
  Instruction *InsertVal0 = InsertElementInst::Create(emptyVec, oprnd, index0, "insert0" + chainPrefix, insertAt);
  Instruction *InsertVal1 = InsertElementInst::Create(InsertVal0, oprnd, index1, "insert1" + chainPrefix, insertAt); 

  errs() << "HERERERERERE " << *InsertVal1 << "         " << pInst->getOpcodeName(pInst->getOpcode()) << "    " << pInst->getNumOperands() <<"\n";

  std::string instName = pInst->getName().str() + chainPrefix;
  switch(pInst->getOpcode()) {
    case Instruction::FAdd:
      dupVal = builder.CreateFAdd(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FSub:
      dupVal = builder.CreateFSub(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FMul:
      dupVal = builder.CreateFMul(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FDiv:
      dupVal = builder.CreateFDiv(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FRem:
      dupVal = builder.CreateFRem(InsertVal1, InsertVal1, instName);
      break;
    case Instruction::FCmp: {
      dupVal= builder.CreateFCmp((dyn_cast<FCmpInst>(pInst))->getPredicate(), InsertVal1, InsertVal1, instName);
      //need a move mask here
      // cannot use movmsk directly because LLVM returns <2 x i1> not <2 x double> for FCMP instructions.
      //std::string Name = "vmovmsk" + chainPrefix;
      //dupVal =  CreateVMovmsk_pd(builder, dupVal, Name);
      unsigned numOfElem = dyn_cast<VectorType>(vecTy)->getNumElements();
      //dupVal = builder.CreateBitCast(dupVal, Type::getIntNTy(ctxt, numOfElem), "BC"+instName);
      Value *mask = builder.CreateBitCast(dupVal, Type::getIntNTy(ctxt, numOfElem), "BC"+instName);
      Value *constZero = ConstantInt::get(Type::getIntNTy(ctxt, numOfElem), 0);
      Value *oneBitMask = builder.CreateICmpUGT(mask, constZero, "msk" + instName);
      pInst->replaceAllUsesWith(oneBitMask); //before doing this, change mask for nbits to 1 bit  
      break;
    }
    case Instruction::Call: {           // the implementation is too tedious, this could be improved by using a function and fucntionCall table
      Function *func = dyn_cast<CallInst>(pInst)->getCalledFunction();
      std::string funName = func->getName().str(); 
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
        else {                              //more intrinsic functions to be added
          InsertVal1->eraseFromParent();
          InsertVal0->eraseFromParent();
          return replacedInst;
        }
      }
      else if (numOperands == 2) {
        if (funName == "pow") {
          dupVal = CreateVPow(builder, InsertVal1, InsertVal1, Name); //FIXME the second parameter should be <2 x int> for powi
        }
        else {
          InsertVal1->eraseFromParent();
          InsertVal0->eraseFromParent();
          return replacedInst;
        }
      }
      else {
        InsertVal1->eraseFromParent();
        InsertVal0->eraseFromParent();
        return replacedInst;
      }
      break;
    }
    case Instruction::SIToFP:
      dupVal = builder.CreateSIToFP(InsertVal1, dstTy, "UIToFP"+instName);
      break; 
    case Instruction::UIToFP:
      dupVal = builder.CreateUIToFP(InsertVal1, dstTy, "UIToFP"+instName);
      break;
    case Instruction::PHI: {
      replacedInst = duplicatePhiNode(pInst, instName);
      //replacedInst = duplicatePhiNodeVectorTy(pInst, instName);
      InsertVal1->eraseFromParent();
      InsertVal0->eraseFromParent();
      InsertVal1 = NULL; InsertVal0 = NULL;
      errs() << *replacedInst << "\n"; 
      return replacedInst;
    }
    default:
      assert("Instruction is not supported!");
      break;
  } 

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
    if (Constant *CI = dyn_cast<Constant>(usedVal)) {
      Constant *constVec = ConstantVector::getSplat(VEC_LENGTH, CI); 
      replacedInst->setOperand(oprndCount, constVec);
    //  errs() << "replaced instruction " << *replacedInst << "\n";
    }
    else if(Instruction *usedInstr = dyn_cast<Instruction>(usedVal)){   //the instruction is defined before
      DEBUG(dbgs() << "used Instruction " << *usedInstr << "\n");
      if(!breakRecDuplication(pInst, usedInstr)){
        //recursive call
        Instruction *dupUser = duplicateScalarArithmetic(usedInstr, chainPrefix);
        if(replacedInst && dupUser){
          errs() << ",,,,,,,,,,,,,,,,, " << *replacedInst << "\n" << "................... " <<dupUser->getOpcodeName() << "    " << *dupUser << "\n";
          replacedInst->setOperand(oprndCount, dupUser);
          errs() << "replaced instruction " << *replacedInst << "\n";
        }
      }
    }
    else {    //the instructino is new, i.e., %mul = fmul double %f, 1.2 ;where %f is not generated in the current BB but passed from a caller
      insertAt = replacedInst;
      Value *vecVal = UndefValue::get(vecTy);
      Instruction *Val0 = InsertElementInst::Create(vecVal, usedVal, index0, "in0" + chainPrefix, insertAt);
      Instruction *Val1 = InsertElementInst::Create(Val0, usedVal, index1, "in1" + chainPrefix, insertAt);
      replacedInst->setOperand(oprndCount, dyn_cast<Value> (Val1)); 
      errs() << " ;;;;;;;;;;;;;; replacedInst" << *replacedInst << "\n";
    }
    oprndCount++;
  }
  if (InsertVal1 && InsertVal0) {
    InsertVal1->eraseFromParent();  //erase them in the reversed order. There would be an error if we erase insertVal0 first because InsertVal1 wants to use it
    InsertVal0->eraseFromParent();
  }
  duplicatedIR++;
  duplicatedIRDyn += PI->getExecutionCount(pInst->getParent());
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

  //errs() << " insert point is --------------------- " << *insertAt << "\n";

  Value *phiNodeVal = dyn_cast<Value>(pInst);
  VectorType *vecTy = VectorType::get(pInst->getType(), VEC_LENGTH);
  Value *emptyVec = UndefValue::get(vecTy);
  Type* u32Ty = Type::getInt32Ty(currF->getContext());
  Value *index0 =  ConstantInt::get(u32Ty, 0);
  Value *index1 =  ConstantInt::get(u32Ty, 1);
   
  IRBuilder<> builder(&*insertAt);
  Value *Val0 = builder.CreateInsertElement(emptyVec, phiNodeVal, index0, "insert0"+instName);
  Value *Val1 = builder.CreateInsertElement(Val0, phiNodeVal, index1, "insert1"+instName);
  Instruction *InsertVal0 = dyn_cast<Instruction> (Val0);
  Instruction *vecPhiInst = dyn_cast<Instruction> (Val1);

  //errs() << "aaaaaaaaaaaaaaaaaa " << *InsertVal0 << "  " << *vecPhiInst << "\n";

  instrInfo *pInstInfo = new instrInfo(vecPhiInst);
  pInstInfo->setReplacedBy(vecPhiInst);
  scalarToVectorMap[pInst] = pInstInfo;
      
  errs() << "Vectorized call: " << *vecPhiInst << "\n";
      
  return dupInst;
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
  bool isProfitable = false;
  //FIXME
  if(instrToInfoObj[pInst]->isDuplicated()){
    duplicatedInst = instrToInfoObj[pInst]->duplicatedBy();
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
               pInst->getOpcode() == Instruction::Ret){	// added by zhi
        //do not duplicate alloca instruction, as this allocated memory
        //do not duplicate return instruction, 
        //do not duplicate call instruction, its operand would be taken
        //care of by HV inst
        DEBUG(dbgs() << "not duplicating alloca/call/ret: " << *pInst << "\n");
      }
      else if (pInst->getOpcode() == Instruction::FCmp ||
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
          LLVMContext &ctxt = currF->getContext();
          dupInst->insertBefore(pInst);
          instrToInfoObj[pInst]->setDuplicated(dupInst);
          duplicatedInst = dupInst;
          //DEBUG(dbgs() << "parent: " << dupInst->getParent() << "\n");

          //annotateDuplicate(dupInst);

          //iterate over operands
          unsigned oprndCount = 0;
          for(User::op_iterator itr =  pInst->op_begin(), itr_e = pInst->op_end(); itr != itr_e; ++itr){
            Value* usedVal = *itr;
            if(Instruction *usedInstr = dyn_cast<Instruction>(usedVal)){
                DEBUG(dbgs() << "used Instruction " << *usedInstr << "\n");
              if(!breakRecDuplication(pInst, usedInstr)){
                //recursive call
                Instruction* dupUser = duplicateProdRec(usedInstr, chainPrefix);
                if(duplicatedInst && dupUser){
                  duplicatedInst->setOperand(oprndCount, dupUser);
                }
              }
            }
            oprndCount++;
          }
          duplicatedIR++;
          duplicatedIRDyn += PI->getExecutionCount(pInst->getParent());
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
//the following code is implemented in DFS way to delete the use first 
bool Approx::deleteInstrumentedScalarInst() {
  bool ret = true;

  //delete the instruction according to the use-def chain
  //always delete the use before the def

//  for (tInstrToInfoObj::iterator it = scalarToVectorMap.begin(), end = scalarToVectorMap.end(); it != end; it++) {
//    Instruction *deleteInst = (*it).first;
  for (std::vector<Instruction*>::reverse_iterator it = instrVec.rbegin(), end = instrVec.rend(); it != end; it++) {
    Instruction *deleteInst = *it;
    if (scalarToVectorMap.find(deleteInst) != scalarToVectorMap.end() &&
        deleteInst->getOpcode() != Instruction::PHI) {
      //traverse the def-use chain to delete
      //errs() << "The deleting instruction is " << *deleteInst << "\n";
      deleteInstrDFS(deleteInst);
    } 
  }

  return ret;
}

void Approx::deleteInstrDFS(Instruction *pInst) {

  if (pInst == NULL)
    return;

  Value *instVal = dyn_cast<Value> (pInst);
  //errs() << " 88888888888888888888888888888888 " << "\n";
  if (instVal->getNumUses() == 0) { //this is the last instruction, it can be erased safely
    //errs() << "deleting: " << *pInst << "\n";
    pInst->eraseFromParent();
    return;  
  }

  for (Value::use_iterator useIt = pInst->use_begin(), e = pInst->use_end(); useIt != e; useIt++) {
    Instruction *curInst = dyn_cast<Instruction> (*useIt);
    if (curInst && curInst->getType()->isFPOrFPVectorTy() &&
        scalarToVectorMap.find(curInst) != scalarToVectorMap.end()) {  //we only delete the instrumented FP instructions currently
      if (curInst->getOpcode() != Instruction::PHI) { //phi nodes are preserved 
        deleteInstrDFS(curInst); 
      }
    }
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
  if(dupInst){
    Instruction* cmpInst = NULL;
    //adjust dynDupCount
    //we are inserting two extra (cmp and br) for every high value comparision.
    //dynDupCount += 2*(PI->getExecutionCount(origInst->getParent()));
    if((origInst->getType())->isIntOrIntVectorTy() || 
        (origInst->getType())->isPointerTy()){
      cmpInst = new ICmpInst(insertAt, ICmpInst::ICMP_NE, origInst, dupInst, instName); 
      errs() << "Integer comparison "<< *cmpInst<<"\n";
      cmpInstInserted.insert(cmpInst);
    }
    else if((origInst->getType())->isFPOrFPVectorTy()){
      if ((origInst->getType())->isVectorTy()) {
      // in this case we cannot pack the origanl instruction and the duplicated instruction in the same SIMD register,
      // generate a new instruction for the orignal one, e.g., a = b + c, => a' = b' + c', compare(a, a')
        cmpInst = new FCmpInst(insertAt, FCmpInst::FCMP_ONE, origInst, dupInst, instName); 
        errs() << "FP comparison here "<< *cmpInst << " number of operands: " << cmpInst->getNumOperands() << "\n";
        cmpInstInserted.insert(cmpInst);
      }
      else {
        //scalar FP instructions, we need to pack them 
        cmpInst = new FCmpInst(insertAt, FCmpInst::FCMP_ONE, origInst, dupInst, instName); 
        errs() << "FP comparison "<< *cmpInst<<"\n";
        cmpInstInserted.insert(cmpInst);
      }
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
    FunctionType* ft = FunctionType::get(voidTp, params, false);
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
//      BasicBlock::iterator splitIt = cmpInst;
//      splitIt++;
//      errs() << *splitIt << " is the instruction after inserted comparison" << "\n";
      BasicBlock* oldBB = cmpInst->getParent();
      BasicBlock* newBB = SplitBlock(oldBB, splitIt, this);
      Instruction* termInst = oldBB->getTerminator();
      errs() << newBB->front() << " is the first instruction in the newly inserted comparison" << "\n";
      errs() << *newBB->getTerminator() << " is the terminator in new BB" << "\n";
      errs() << *cmpInst<< " inserted comparison" << "\n"; 
      // ----------------------- commented by zhi ---------------------------------- 
      // FIX ME: condBr is never used. It is nevered required since SplitBlock will call splitBasicblock which creates
      // a branch from the old BB to the new BB automatically. However, we still need to consider the circumenstance
// when an error is detected. In this case, we would like to branch to a new basic block (e.g. print the error
// and exit). This is what the createExitBB does essentially. In this case, we need to create a branch from the
// old BB to the relExitBB (error handling code).

      // if the conditional value is a vector type, e.g. <2 x i1>, we cannot create the branch instruction directly using 
      // branchinst::create, because it will fail during the type checking: 
      // getCondition()->getType()->isIntegerTy(1) && "May only branch on boolean predicates!
      // In this case, we have to combine the returned results in cmpInst to make it as an "i1" (bool) type.
      
      //errs() << "xxxxxxxxxxxxxxxxxxxxxx" << relExitBB->front() << "\n" << newBB->front() << "\n" << *cmpInst << "\n" << oldBB->front() << "\n";
      //errs() << " ....................." << *(cmpInst->getType()) << "\n";
      if (cmpInst->getType()->isVectorTy()) {
        //FIXME set the mask according to the return value of cmpInst<2 x double>, <4 x float>, <4 x double>.....
        Value *oprnd = cmpInst->getOperand(0);
        Instruction *operand = dyn_cast<Instruction>(oprnd);
        VectorType *vecTy = (VectorType *) operand->getType();
        //use number of elements and the width of each element in the vector type to determined if SSE/AVX is used for ps/pd
        unsigned numOfElem = vecTy->getNumElements();
        unsigned eltBits = vecTy->getElementType()->getPrimitiveSizeInBits();
                        
        Value *mask = ConstantInt::get(Type::getIntNTy(ctxt, numOfElem), 0);
        BitCastInst *nbits = new BitCastInst(cmpInst, Type::getIntNTy(currF->getContext(), numOfElem), "", termInst);
        Instruction *tmp = new ICmpInst(termInst, ICmpInst::ICMP_NE, nbits, mask);
        BranchInst* condBr = BranchInst::Create(relExitBB, newBB, tmp, oldBB);
        errs() << "conditional branch: " << *condBr << "\n";
      }
      else {
        BranchInst* condBr = BranchInst::Create(relExitBB, newBB, cmpInst, oldBB);
        errs() << "conditional branch: " << *condBr << "number of operands: " << condBr->getNumOperands() << "\n";
        //remove the original uncond branch
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
    Value* retVal = NULL;
    //Constant* funcName = ConstantArray::get(F.getContext(), "myFunc");
    IRBuilder<> builder(relExitBB);
    //exitString << "Reliability CMP failed in function \%s" << currF->getNameStr() << "\n";
    if(!exitStr){
      std::stringstream exitString;
      exitString << "Reliability CMP failed in function, exit directly %s" << "\n";
      exitStr = builder.CreateGlobalStringPtr(exitString.str().c_str(), "relFun");
    }
    Value* funcName = getOrCreateGlobalName();

    std::vector<Type*> params;
    const Type* ret_t; //FIXME: Never used
    FunctionType* ft;
    LLVMContext &ctxt = currF->getContext();
    Type* intTp = Type::getInt32Ty(ctxt);
    Type* voidTp = Type::getVoidTy(ctxt);
    Type* ptr8Type = Type::getInt8PtrTy(ctxt);
    Module *M = currF->getParent();

    //insert the printf call
    params.push_back(ptr8Type);
    ft  = FunctionType::get(intTp, params, true);
    Constant* printFun = M->getOrInsertFunction("printf", ft);
    builder.CreateCall2((Value*)printFun, exitStr, funcName);
    //insert the exit function
    params.clear();
    params.push_back(Type::getInt32Ty(currF->getContext()));
    ft  = FunctionType::get(voidTp, params, false);
    Value *constOne = ConstantInt::get(intTp, 1);
    Constant *exitFunc = M->getOrInsertFunction("exit", ft);
    //insert the exit function call
    builder.CreateCall((Value*)exitFunc, constOne);

    //This doesn't seem to be right way to do it: FIXME
    //What shoud be the terminator of block containing 
    //exit instruction?
    if(!(currF->getReturnType()->isVoidTy())){
      retVal = Constant::getNullValue(currF->getReturnType());
    }

    ReturnInst* retInst = ReturnInst::Create(currF->getContext(), retVal, relExitBB);
  }
  return;
}

//added by zhi to handle errors
void Approx::createIncRetBB() {
    if(APExitBB){
	    relExitBB = BasicBlock::Create(currF->getContext(), "relExit", currF);
    	Value* retVal = NULL;
    	//Constant* funcName = ConstantArray::get(F.getContext(), "myFunc");
    	IRBuilder<> builder(relExitBB);
        //exitString << "Reliability CMP failed in function \%s" << currF->getNameStr() << "\n";
   	    if(!exitStr){
    	    std::stringstream exitString;
            exitString << "Reliability CMP failed in function, increment the error count by 1 %s" << "\n";
            exitStr = builder.CreateGlobalStringPtr(exitString.str().c_str(), "relFun");
        }
        

    }
    return;
}

void Approx::createEDCECCBB() {
  return;
}

bool Approx::breakRecDuplication(Instruction* cInst, Instruction* opnd){
  bool retVal = false;
  return retVal;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "STATEVARS"
void Approx::findVarsWithState(){
  //if(currF->getName() == "adpcm_coder"){
  //return;
  //}
  assert(LI && "LoopInfo is not available");
  for(LoopInfo::iterator I = LI->begin(), E = LI->end(); I != E; ++I){
    Loop *L = *I;
    findVarsWithState(L);
  }
}

void Approx::findVarsWithState(Loop* L){
  BasicBlock* headerBB = L->getHeader();
  for(BasicBlock::iterator It = headerBB->begin(), Et = headerBB->end(); It != Et; ++It){
    Instruction* pInst = &*It;
    if(isa<PHINode>(It)){
      for(User::op_iterator itr =  pInst->op_begin(), itr_e = pInst->op_end(); itr != itr_e; ++itr){
        Value *V = *itr;
        if(Instruction* inst = dyn_cast<Instruction>(V)){
            if(L->contains(inst) && !isa<PHINode>(inst)){
              if(instrToInfoObj.find(inst) != instrToInfoObj.end()){
                instrToInfoObj[inst]->setStateVar();
                stateVars++;
                stateVarsDyn += PI->getExecutionCount(inst->getParent());
                DEBUG(dbgs() << "\tstate variable: " << *inst << "\n");
              }
              else{
                errs() << "instruction not found in info objects\n";
              }
            }
        }
      }
    }
  }
  for(Loop::iterator LoopItr = L->begin(), LoopItrE = L->end(); LoopItr != LoopItrE; ++LoopItr) {
    Loop *InnerL = *LoopItr;
    findVarsWithState(InnerL);
  }
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "HighValues"
void Approx::walkHighValues(){
  alreadySeen.clear();
  for(std::map<Instruction*, instrInfo*>::iterator iter = instrToInfoObj.begin(); iter != instrToInfoObj.end(); iter++) { 
    Instruction *currInst = (*iter).first;
    instrInfo* infoObj = iter->second;
    //if(infoObj->isHighValue()){
    if(infoObj->isStateVar()){
      DEBUG(dbgs() << "high value:" << *currInst << "\n");
      instVec_t* chainVec = new instVec_t();
      instToProdChain[currInst] = chainVec;
      walkHighValuesRec(currInst, currInst, 0);
    }
  }
  for(instToProdChain_t::iterator iter = instToProdChain.begin(); iter != instToProdChain.end(); iter++){
    Instruction* chainSt = iter->first;
    instVec_t* chain = iter->second;
    DEBUG(dbgs() << "In function: " << currF->getName() << "\n");
    DEBUG(dbgs() << "\tHigh Value: " << *chainSt << "\n");
    for(instVec_t::iterator it = chain->begin(); it != chain->end(); it++){
      instHeight instH = *it;
      DEBUG(dbgs() << "\t\tchain(" << instH.height << "):" << *(instH.inst) << "\n");
    }
  }
}
void Approx::walkHighValuesRec(Instruction* pInst, Instruction* currChainInst, int height){
  Instruction* seenInst = NULL;
  if(alreadySeen.find(pInst) != alreadySeen.end()){
    //seenInst = alreadySeen[
  }
  else{
    if(pInst->getOpcode() == Instruction::Load){
      Value* loadAddr = pInst->getOperand(0);
      if(Instruction* loadAddrInst = dyn_cast<Instruction>(loadAddr)){
        //break at load for this purpose
        //walkHighValuesRec(loadAddrInst);
      }
    }
    else if (pInst->getOpcode() == Instruction::Alloca || 
             pInst->getOpcode() == Instruction::Call){
      //Nothing to be done for these
    }
    else{
      alreadySeen.insert(pInst);
      height++;
      for(User::op_iterator itr =  pInst->op_begin(), itr_e = pInst->op_end(); itr != itr_e; ++itr){
        Value* usedVal = *itr;
        if(Instruction *usedInstr = dyn_cast<Instruction>(usedVal)){
          if(instToProdChain.find(currChainInst) != instToProdChain.end()){
            instVec_t* instVec = instToProdChain[currChainInst];
            instHeight instH;
            instH.inst = usedInstr;
            instH.height = height;
            instVec->push_back(instH);
          }
          else{
            errs() << "entry not found in map \n";
          }
          walkHighValuesRec(usedInstr, currChainInst, height);
        }

      }
    }
  }
}
void Approx::markInvalidForValueCmps(Instruction* pInst, int height){
  if(alreadySeen.find(pInst) != alreadySeen.end()){
  }
  else{
    if(pInst->getOpcode() == Instruction::Load){
      Value* loadAddr = pInst->getOperand(0);
      if(Instruction* loadAddrInst = dyn_cast<Instruction>(loadAddr)){
        //break at load for this purpose
        //walkHighValuesRec(loadAddrInst);
      }
    }
    else if (pInst->getOpcode() == Instruction::Alloca || 
             pInst->getOpcode() == Instruction::Call){
      //Nothing to be done for these
    }
    else if (height <= APHeightThr){
      alreadySeen.insert(pInst);
      height++;
      for(User::op_iterator itr =  pInst->op_begin(), itr_e = pInst->op_end(); itr != itr_e; ++itr){
        Value* usedVal = *itr;
        if(Instruction *usedInstr = dyn_cast<Instruction>(usedVal)){
          instrToInfoObj[usedInstr]->setNoValueCheck();
          markInvalidForValueCmps(usedInstr, height);
        }

      }
    }
  }
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "FreqValue"
void Approx::insertValueCmps(){
  DEBUG(dbgs() << "In function:" << currF->getName() << "\n");
  for(std::map<Instruction*, instrInfo*>::reverse_iterator iter = instrToInfoObj.rbegin(); iter != instrToInfoObj.rend(); iter++) { 
    Instruction *currInst = (*iter).first;
    if(shouldExcludeFromVP(currInst)){
      continue;
    }
    if(fewNotChangingGeneratedValues(currInst)){
      if(!instrToInfoObj[currInst]->isNoValueCheck()){
        insertFreqValueCmp(currInst);
        DEBUG(dbgs() << "\tinserting value check (ID=" << VP->InstToIdMap[currInst] << "):" << *currInst << "\n");
      }
      else{
        //DEBUG(dbgs() << "\tnot inserting value check because similar checks:" << *currInst << "\n");
      }
      markInvalidForValueCmps(currInst, 0);
    }
    else if(APValueRanges){
      range* rng = shouldInsertRangeCheck(currInst); 
      if(rng != NULL){
        if(!instrToInfoObj[currInst]->isNoValueCheck()){
          insertFreqRangeCmp(currInst, rng);
          DEBUG(dbgs() << "\tinserting value range check (ID=" << VP->InstToIdMap[currInst] << ") :" << *currInst << "\n");
          markInvalidForValueCmps(currInst, 0);
        }
        else{
          //DEBUG(dbgs() << "\tnot inserting check because similar checks:" << *currInst << "\n");
        }
      }
    }
  }
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "FreqRange"
range* Approx::getFrequentRange(VPLoadProfileBase* VPin, ProfileInfo * PIin, unsigned int id){
  //rangelength specifies the range we are willing to use
  //The aim is to calculate the smallest combination of bins with
  //maximum frequency such that upper-lower range of combined bin stays within specified 
  //rangeLength
  //Algorithm:
  //1. Start with the bin having highest frequency
  //2. Extend the bin in either direction while staying the given rangeLength

  rangeCountVec_t::iterator rangeCountIter;
  rangeCountVec_t::iterator maxFreqIter;
  double maxFrac = -1;
  Instruction* cInst = VPin->IdToInstMap[id];
  unsigned int execCount = PIin->getExecutionCount(cInst->getParent());
  for(rangeCountIter = VPin->IdToRangeCount[id]->begin(); rangeCountIter != VPin->IdToRangeCount[id]->end(); rangeCountIter++){
    range* rng = *rangeCountIter;
    unsigned int count = rng->getCount();
    double fractionOfTotal = (double)count/execCount;
    if(fractionOfTotal > maxFrac){
      maxFrac = fractionOfTotal;
      maxFreqIter = rangeCountIter;
    }
  }
  if(maxFrac < 0){
    return NULL;
  }
  //now we know the maximum generated range. grow it on both sides.
  rangeCountVec_t::iterator iterLeft;
  rangeCountVec_t::iterator iterRight;
  rangeCountVec_t::iterator iterTmp;
  iterLeft = maxFreqIter;
  iterRight = maxFreqIter;
  range* maxRange = *maxFreqIter;
  range* totalRange = new range(maxRange->getLowerRange(), maxRange->getUpperRange());
  unsigned int totalCount = maxRange->getCount();
  bool exitCond = false;
  bool  firstElementConsidered = (maxFreqIter == VPin->IdToRangeCount[id]->begin());
  iterTmp = maxFreqIter;
  iterTmp++;
  bool  lastElementConsidered = (iterTmp == VPin->IdToRangeCount[id]->end());
  do{
    if(iterLeft != VPin->IdToRangeCount[id]->begin()){
      iterLeft--;
    }
    iterTmp = iterRight;
    iterTmp++;
    if(iterTmp != VPin->IdToRangeCount[id]->end()){
      iterRight++;
    }
    range* rngL = *iterLeft;
    unsigned int countL = rngL->getCount();
    range* rngR = *iterRight;
    unsigned int countR = rngR->getCount();
    bool didWeExtendL = false;
    bool didWeExtendR = false;
    if(((countL >= countR) || lastElementConsidered) && !firstElementConsidered){
      int newTotalRange = totalRange->getUpperRange() - rngL->getLowerRange();
      //if(rngL->lowerRange >= 0){
      //totalRange += rngL->lowerRange;
      //}
      //else{
      //totalRange -= rngL->lowerRange;
      //}
      if(acceptRange(cInst, newTotalRange)){
        totalRange->setLowerRange(rngL->getLowerRange());
        totalCount += countL;
        didWeExtendL = true;
      }
    } 
    if(((countL < countR) || !didWeExtendL) && !lastElementConsidered){
      int newTotalRange = rngR->getUpperRange() - totalRange->getLowerRange();
      //if(rngR->upperRange >= 0){
      //newTotalRange += rngR->upperRange;
      //}
      //else{
      //newTotalRange -= rngR->upperRange;
      //}
      if(acceptRange(cInst, newTotalRange)){
        totalCount += countR;
        totalRange->setUpperRange(rngR->getUpperRange());
        didWeExtendR = true;
      }
    }
    if(iterLeft == VPin->IdToRangeCount[id]->begin() && didWeExtendL){
      firstElementConsidered = true;
    }
    iterTmp = iterRight;
    iterTmp++;
    if(iterTmp == VPin->IdToRangeCount[id]->end() && didWeExtendR){
      lastElementConsidered = true;
    }
    bool condExit1 = (iterLeft == VPin->IdToRangeCount[id]->begin()) && !(didWeExtendL || didWeExtendR);
    iterTmp = iterRight;
    iterTmp++;
    bool condExit2 = (iterTmp == VPin->IdToRangeCount[id]->end()) && !(didWeExtendL || didWeExtendR);
    exitCond = condExit1 || condExit2;
  }
  while(!exitCond);
  double rangeFraction = (double)totalCount/execCount;
  DEBUG(dbgs() << "For inst id " << id << ": maximum frequency range is (" << totalRange->getLowerRange() << \
        ", " << totalRange->getUpperRange() << ") with " << rangeFraction << " % executions\n");
  totalRange->setFraction(rangeFraction);
  totalRange->setTotalCount(totalCount);
  return totalRange;
}

#undef DEBUG_TYPE
#define DEBUG_TYPE "RANGE"
range* Approx::shouldInsertRangeCheck(Instruction* inst){
  if(VP->InstToIdMap.find(inst) !=  VP->InstToIdMap.end()){
    unsigned int instID = VP->InstToIdMap[inst];
    range* rng1 = getFrequentRange(VP, PI, instID); 
    if(APUseSecondProfile){
      range* rng2 = getFrequentRange(VP2, PI2, instID); 
      if(rng1 && rng2){
        if((rng1->getLowerRange() != rng2->getLowerRange()) || (rng1->getUpperRange() != rng2->getUpperRange())){
          DEBUG(dbgs() << "Range is not same for instID:" << instID << ", :" << *inst << "\n");
          DEBUG(dbgs() << "\trng1:(" << rng1->getLowerRange() << ", " << rng1->getUpperRange() << ") rng2:(" << rng2->getLowerRange() << ", " << rng2->getUpperRange() << ")\n");
          return NULL;
        }
      }
      else{
        return NULL;
      }
    }
    //A range check should only be inserted if
    //1. The execution count in the range is greater than the threshold value.
    //2. The range should be a relatively small range.
    //3. A value check is already not inserted.
    if(rng1 && (rng1->getFraction() >= APValueThr) && isThisATightRange(inst, rng1) && (valueCheckSet.find(inst) == valueCheckSet.end())){
      if(APExcludeInfreq){
        double fraction = (double)rng1->getTotalCount()/PI->getExecutionCount(inst->getParent()->getParent());
        if(fraction <= APExcludeThr){
          return NULL;
        }
        else{
          return rng1;
        }
      }
      else{
        return rng1;
      }
    }
  }
  return NULL;
}
bool Approx::isThisATightRange(Instruction* inst, range* rng){
  uint64_t totalRange = rng->getUpperRange() - rng->getLowerRange();
  return acceptRange(inst, totalRange);
}
#undef DEBUG_TYPE 
#define DEBUG_TYPE "BOOLS"
bool Approx::doesOnlyGeneratesBoolValues(Instruction* inst){
  bool retVal = false;
  if(APUseProfile){
    if(VP->InstToIdMap.find(inst) !=  VP->InstToIdMap.end()){
      unsigned int instID = VP->InstToIdMap[inst];
      if(VP->IdToValueCount[instID]->size() == 2){
        if(VP->IdToValueCount[instID]->find(0) != VP->IdToValueCount[instID]->end() && 
           VP->IdToValueCount[instID]->find(1) != VP->IdToValueCount[instID]->end())
        {
          retVal = true;
          DEBUG(dbgs() << "excluding:" << *inst << "\n");
        }
      }
    }
  }
  return retVal;
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "STABLEVALUES"
bool Approx::fewNotChangingGeneratedValues(Instruction* inst){
  bool retVal = false;
  if(APUseProfile){
    if(VP->InstToIdMap.find(inst) !=  VP->InstToIdMap.end()){
      unsigned int instID = VP->InstToIdMap[inst];
      if(APUseSecondProfile){
        if(VP2->InstToIdMap.find(inst) !=  VP2->InstToIdMap.end()){
          //size should be same in both value profiles
          if(((VP->IdToValueCount[instID]->size() == 1) && (VP2->IdToValueCount[instID]->size() == 1))
              || ((VP->IdToValueCount[instID]->size() == 2) && (VP2->IdToValueCount[instID]->size() == 2))){
              //values should also be same in both value profiles
              retVal = areMapsSame(VP->IdToValueCount[instID], VP2->IdToValueCount[instID]);
          }
        }
      }
      else{
          if((VP->IdToValueCount[instID]->size() == 1) || (VP->IdToValueCount[instID]->size() == 2)){
            retVal = true;
          }
      }
      if(retVal && APExcludeInfreq){
        unsigned long exeCount = PI->getExecutionCount(inst->getParent()->getParent()); 
        unsigned int count = 0;
        valueCountMap_t::iterator valCountIter;
        for(valCountIter = VP->IdToValueCount[instID]->begin(); valCountIter != VP->IdToValueCount[instID]->end(); valCountIter++){
          count += valCountIter->second;
        }
        double fractionOfTotal = (double)count/exeCount;
        if(fractionOfTotal <= APExcludeThr){
          retVal = false;
        }
      }
      if(retVal){
        DEBUG(dbgs() << "same values for instID:" << instID << ", " << *inst << "\n");
      }
    }
  }
    
  return retVal;
}
bool Approx::areMapsSame(valueCountMap_t* map1, valueCountMap_t* map2){
  if(map1->size() != map2->size()){
    return false;
  }
  else{
    valueCountMap_t::iterator valCountIter1;
    valueCountMap_t::iterator valCountIter2;
    bool same = true;
    for(valCountIter1 = map1->begin(), valCountIter2 = map2->begin(); valCountIter1 != map1->end(), valCountIter2 != map2->end(); valCountIter1++, valCountIter2++){
      if(valCountIter1->first != valCountIter2->first){
        same = false;
      }
    }
    return same;
  }
}

#undef DEBUG_TYPE
#define DEBUG_TYPE "FreqValueCmp"
bool Approx::insertFreqValueCmp(Instruction* cInst){
  Value* finalCheck = NULL;
  freqValues constValues = getFreqValues(cInst);
  if(constValues.count){
    //We are considering value profling only for integer values.
    if((cInst->getType())->isIntOrIntVectorTy()){ 
        LLVMContext &ctxt = currF->getContext();
        llvm::Type *instType = cInst->getType();
        std::string instName = "Vcmp";
        std::string xorName = "VXor";
        std::string notName = "Vnot";
        BasicBlock::iterator it(cInst);
        it++;
        IRBuilder<> builder(&*it);
        Value  *V = ConstantInt::get(instType, constValues.value1);
        //Instruction* cmpInst1 = new ICmpInst(&*it, ICmpInst::ICMP_NE, cInst, V, instName); 
        Value* cmpInst1 = builder.CreateICmpNE(cInst, V, instName);
        finalCheck = cmpInst1;
      if(constValues.count == 2){
        Value  *V2 = ConstantInt::get(instType, constValues.value2);
        //it++;
        //Instruction* cmpInst2 = new ICmpInst(&*it, ICmpInst::ICMP_NE, cInst, V2, instName); 
        Value* cmpInst2 = builder.CreateICmpNE(cInst, V2, instName);
        //it++;
        Value* binOp = builder.CreateBinOp(BinaryOperator::Xor, cmpInst1, cmpInst2, xorName);
        Value* notOp = builder.CreateNot(binOp, notName);
        finalCheck = notOp;
      }
      vcmpInstInserted.insert(finalCheck);
      vcmpToCheckInst[finalCheck] = cInst;
      valueCheckSet.insert(cInst);
      if(constValues.count == 1){
        DEBUG(dbgs() << *cInst << " :" << constValues.value1 << "\n");
        expChecksDyn += PI->getExecutionCount(cInst->getParent());
      }
      else{
        DEBUG(dbgs() << *cInst << " :" << constValues.value1 << " and " << constValues.value2 << "\n");
        expChecksDyn += 3*(PI->getExecutionCount(cInst->getParent()));
      }
      expChecks++;
    }
    else{
      errs() << "Warning(VP): Type " << *(cInst->getType()) << " is not handled\n"; 
    }
  }
}

#undef DEBUG_TYPE
#define DEBUG_TYPE "FreqRangeCmp"
bool Approx::insertFreqRangeCmp(Instruction* cInst, range* rng){
  Value* finalCheck = NULL;
  if((cInst->getType())->isIntOrIntVectorTy()){ 
    LLVMContext &ctxt = currF->getContext();
    llvm::Type *instType = cInst->getType();
    std::string instName = "Vcmp";
    std::string orName = "Vor";
    BasicBlock::iterator it(cInst);
    it++;
    IRBuilder<> builder(&*it);
    Value  *V = ConstantInt::get(instType, rng->getLowerRange());
    Value* cmpInst1 = builder.CreateICmpSLT(cInst, V, instName);
    Value  *V2 = ConstantInt::get(instType, rng->getUpperRange());
    Value* cmpInst2 = builder.CreateICmpSGT(cInst, V2, instName);
    Value* binOp = builder.CreateBinOp(BinaryOperator::Or, cmpInst1, cmpInst2, orName);
    finalCheck = binOp;
    vcmpInstInserted.insert(finalCheck);
    vcmpToCheckInst[finalCheck] = cInst;
    valueRangeCheckSet.insert(cInst);
    DEBUG(dbgs() << *cInst << " :range " << rng->getLowerRange() << " and " << rng->getUpperRange() << "\n");
    expChecks++;
    expChecksDyn += 3*(PI->getExecutionCount(cInst->getParent()));
  }
  else{
    errs() << "Warning(VP): Type " << *(cInst->getType()) << " is not handled\n"; 
  }
}

void Approx::insertValueMsg(){
  Module *M = currF->getParent();
  for(std::set<Value*>::iterator I = vcmpInstInserted.begin(), E = vcmpInstInserted.end(); I != E; ++I){
     LLVMContext &ctxt = currF->getContext();
     std::vector<Type*> params;
     Type* voidTp = Type::getVoidTy(ctxt);
     Type* intTp = Type::getInt32Ty(ctxt);
     Value *V = *I;
     Instruction* cmpInst = dyn_cast<Instruction>(V);
     if(APDebug){
       BasicBlock::iterator It = cmpInst;
       It++;
       IRBuilder<> builder(&*It);
       params.push_back(Type::getInt1Ty(ctxt));
       PointerType* PointerTy_2 = PointerType::get(IntegerType::get(ctxt, 8), 0);
       params.push_back(PointerTy_2);
       params.push_back(intTp);
       params.push_back(intTp);
       FunctionType* ftD  = FunctionType::get(voidTp, params, false);
       Value* funcName = getOrCreateGlobalName(cmpInst->getParent());
       //Value *constOne = ConstantInt::get(intTp, 1);
       Constant *exitFuncD = currF->getParent()->getOrInsertFunction("printValueMsgD", ftD);
       Value* expected = cmpInst->getOperand(1);
       Value* observed = cmpInst->getOperand(0);
       IntegerType* intTy = Type::getInt32Ty(ctxt);
       Value* observed32 = builder.CreateZExtOrTrunc(observed, intTy);
       Value* expected32 = builder.CreateZExtOrTrunc(expected, intTy);
       builder.CreateCall4((Value*)exitFuncD, cmpInst, funcName, expected32, observed32);
     }
     else{
       if(APNop){
         BasicBlock::iterator splitIt = cmpInst;
         splitIt++;
         IRBuilder<> builder(&*splitIt);
         Value *constOne = ConstantInt::get(intTp, 1);

// ------------- commented by zhi --------------------------------------
//         Function *vpIntrin = Intrinsic::getDeclaration(currF->getParent(), Intrinsic::vp);
//         Function *vpIntrin = Intrinsic::getDeclaration(currF->getParent(), Intrinsic::vp);
//         IntegerType* intTy = Type::getInt32Ty(ctxt);
//         Value* cmp32 = builder.CreateZExtOrTrunc(cmpInst, intTy);
//         builder.CreateCall((Value*)vpIntrin, cmp32);
       }
       else{
         BasicBlock* valueMsgBB = BasicBlock::Create(currF->getContext(), "valMsg", currF);
         IRBuilder<> builder(valueMsgBB);
         if(APVPCounter){
           LoadInst* G = builder.CreateLoad(vpGlobal);
           Value *constOne = ConstantInt::get(intTp, 1);
           Value* addInst = builder.CreateAdd(G, constOne); 
           StoreInst* stInst = builder.CreateStore(addInst, vpGlobal);
         }
         else{
           params.push_back(intTp);
           FunctionType* ft = FunctionType::get(voidTp, params, false);
           Constant *valMsgFun = M->getOrInsertFunction("printValueMsg", ft);
           Instruction* vpInst = dyn_cast<Instruction>(vcmpToCheckInst[V]);
           Value *constOne = ConstantInt::get(intTp, VP->InstToIdMap[vpInst]);
           builder.CreateCall((Value*)valMsgFun, constOne);
         }
         BasicBlock::iterator splitIt = cmpInst;
         splitIt++;
         BasicBlock* oldBB = cmpInst->getParent();
         BasicBlock* newBB = SplitBlock(oldBB, splitIt, this);
         Instruction* termInst = oldBB->getTerminator();
         BranchInst* unCondBr = BranchInst::Create(newBB, valueMsgBB);
         BranchInst* condBr = BranchInst::Create(valueMsgBB, newBB, cmpInst, oldBB);
         //remove the original uncond branch
         termInst->eraseFromParent();
       }
     }
  }
  return;
}
void Approx::insertVPMsgInMain(){
  if(currF->getName() == "main"){
    Module *M = currF->getParent();
    //find the exit block and insert a function call
    for(Function::iterator bb_iter = currF->begin(); bb_iter != currF->end(); ++bb_iter){
      BasicBlock* bb = &(*bb_iter);
      Instruction* termInst = bb->getTerminator();
      bool insertFun =false;
      IRBuilder<> builder(termInst);
      if(ReturnInst* retInst = dyn_cast<ReturnInst>(termInst)){
        insertFun = true;
      }
      else if(UnreachableInst* unReachInst = dyn_cast<UnreachableInst>(termInst)){
          BasicBlock::iterator unIt = unReachInst;
          unIt--;
          builder.SetInsertPoint(&*unIt);
          insertFun = true;
      }
      if(insertFun){
        LLVMContext &ctxt = currF->getContext();
        std::vector<Type*> params;
        Type* voidTp = Type::getVoidTy(ctxt);
        Type* intTp = Type::getInt32Ty(ctxt);
        params.push_back(intTp);
        FunctionType* ft = FunctionType::get(voidTp, params, false);
        LoadInst* G = builder.CreateLoad(vpGlobal);
        Constant *valMsgFun = M->getOrInsertFunction("printFinalValueMsg", ft);
        builder.CreateCall((Value*)valMsgFun, G);
      }
    }
  }
}
Value* Approx::getOrCreateGlobalName(){                                                                                                                                                  
  if(FunctionToGlobalName.find(currF) != FunctionToGlobalName.end()){
    return FunctionToGlobalName[currF];
  }
  else{
    IRBuilder<> Builder(&currF->getEntryBlock());
    Value* bbName = Builder.CreateGlobalStringPtr(currF->getName(), "func");
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

freqValues Approx::getFreqValues(Instruction* cInst){
   
  freqValues retVal; 
  retVal.count = 0;
  if(VP->InstToIdMap.find(cInst) !=  VP->InstToIdMap.end()){
    unsigned int instID = VP->InstToIdMap[cInst];
    valueCountMap_t::iterator valCountIter;
    for(valCountIter = VP->IdToValueCount[instID]->begin(); valCountIter != VP->IdToValueCount[instID]->end(); valCountIter++){
      if(retVal.count == 0){
        retVal.value1 = valCountIter->first;
      }
      if(retVal.count == 1){
        retVal.value2 = valCountIter->first;
      }
      retVal.count++;
    }
  }
  return retVal;
}
bool Approx::handledByValue(Instruction* inst){
  bool isInValueSet = (valueCheckSet.find(inst) != valueCheckSet.end());
  bool isInValueRangeSet = (valueRangeCheckSet.find(inst) != valueRangeCheckSet.end());
  return (isInValueSet || isInValueRangeSet);
}
bool Approx::acceptRange(Instruction* inst, uint64_t rng){
  Type* resultType = inst->getType();
  int size = getSize(resultType);
  //uint64_t maxVal = pow(2, size); 
  //if(((double)rng/maxVal) <= APRangeThr){
  if(rng <= getAcceptableRangeForSize(size)){
    return true;
  }
  else{
    return false;
  }
}
int Approx::getAcceptableRangeForSize(int size){
  switch(size){
    case 1:
      return 1;
      break;
    case 8:
      return 64;
      break;
    case 16:
      return 512;
      break;
    case 32:
      return 1024;
      break;
    default:
      return 1024;
  }
}
void Approx::createGlobal(){
  if(vpGlobal == NULL){
    Module *M = currF->getParent();
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
}

#undef DEBUG_TYPE
#define DEBUG_TYPE "ExcludeVP"
bool Approx::shouldExcludeFromVP(Instruction* cInst){
  bool retVal = false;
  ptrCheckSet.clear();
  //library calls such as "open" give file descriptors which can vary from run to run.
  if(CallInst* callInst = dyn_cast<CallInst>(cInst)){
    if((callInst->getCalledFunction() == NULL) || callInst->getCalledFunction()->isDeclaration()){
      retVal = true;
    }
  }
  //There is no point inserting if the instruction is invoved in ptrtoint or inttoptr
  //in it's input or ouput chains
  if(cInst->getType()->isPointerTy()){
    return true;
  }
  //retVal = retVal || isInvolvedInPointerConversion(cInst);
  retVal = retVal || isInvolvedInPointerConversionFwRec(cInst);
  retVal = retVal || isInvolvedInPointerConversionBwRec(cInst);
  if(retVal){
    DEBUG(dbgs() << "includes pointer conversion: " << *cInst << "\n");
  }
  retVal = retVal || doesOnlyGeneratesBoolValues(cInst);
  return retVal;
}
bool Approx::isInvolvedInPointerConversion(Instruction* cInst){
 bool retVal = false;
  if(PtrToIntInst* ptrInst = dyn_cast<PtrToIntInst>(cInst)){
    return true;
  }
  if(IntToPtrInst* ptrInst = dyn_cast<IntToPtrInst>(cInst)){
    return true;
  }
  return retVal;
}
bool Approx::isInvolvedInPointerConversionFwRec(Instruction* cInst){
  bool retVal = false;
  retVal = isInvolvedInPointerConversion(cInst);
  ptrCheckSet.insert(cInst);
  for(Value::use_iterator i = cInst->use_begin(), e = cInst->use_end(); i != e; ++i){
    if (Instruction *Inst = dyn_cast<Instruction>(*i)){
      bool notInCheckSet = (ptrCheckSet.find(Inst) == ptrCheckSet.end());
      if(notInCheckSet){
        retVal = retVal || isInvolvedInPointerConversionFwRec(Inst);
      }
      else{
        return retVal;
      }
    }
  }
  return retVal;
}
bool Approx::isInvolvedInPointerConversionBwRec(Instruction* cInst){
  bool retVal = false;
  retVal = isInvolvedInPointerConversion(cInst);
  ptrCheckSet.insert(cInst);
  for(User::op_iterator itr =  cInst->op_begin(), itr_e = cInst->op_end(); itr != itr_e; ++itr){
    Value* usedVal = *itr;
    if(Instruction *usedInstr = dyn_cast<Instruction>(usedVal)){
      bool notInCheckSet = (ptrCheckSet.find(usedInstr) == ptrCheckSet.end());
      if(notInCheckSet){
        retVal = retVal || isInvolvedInPointerConversionBwRec(usedInstr);
      }
      else{
        return retVal;
      }
    }
  }
  return retVal;
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

void Approx::insertIntrinsic(){
  if(currF->getName() == "main"){
    Module *M = currF->getParent();
    //find the exit block and insert a function call
    for(Function::iterator bb_iter = currF->begin(); bb_iter != currF->end(); ++bb_iter){
      BasicBlock* bb = &(*bb_iter);
      Instruction* termInst = bb->getTerminator();
      bool insertFun =false;
      IRBuilder<> builder(termInst);
      if(ReturnInst* retInst = dyn_cast<ReturnInst>(termInst)){
        insertFun = true;
      }
      else if(UnreachableInst* unReachInst = dyn_cast<UnreachableInst>(termInst)){
          BasicBlock::iterator unIt = unReachInst;
          unIt--;
          builder.SetInsertPoint(&*unIt);
          insertFun = true;
      }
      if(insertFun){
        LLVMContext &ctxt = currF->getContext();
        std::vector<Type*> params;
        Type* voidTp = Type::getVoidTy(ctxt);
        Type* intTp = Type::getInt32Ty(ctxt);
        params.push_back(intTp);
        FunctionType* ft = FunctionType::get(voidTp, params, false);
        LoadInst* G = builder.CreateLoad(vpGlobal);
        //Constant *valMsgFun = M->getOrInsertFunction("printFinalValueMsg", ft);
        Value *constOne = ConstantInt::get(intTp, 1);

// ------------------ commented by zhi --------------
// FIX the following function method to get the declaration, see getDeclaration function in Intrinsics.h
//        Function *vpIntrin = Intrinsic::getDeclaration(bb->getParent()->getParent(), Intrinsic::vp);
//        builder.CreateCall((Value*)vpIntrin, constOne);
// ------------------ end comment --------------------
      }
    }
  }
}
#undef DEBUG_TYPE
#define DEBUG_TYPE "APPROX"

#undef DEBUG_TYPE
#define DEBUG_TYPE "SQRT"
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
  SmallVector<Type*, 2> tys;    //three arguments
  tys.push_back(index->getType());
  tys.push_back(exp->getType());
  Module *M = currF->getParent();

  Value *vpow;
  if (exp->getType()->isFPOrFPVectorTy())
    vpow = Intrinsic::getDeclaration(M, Intrinsic::pow, tys);
  else
    vpow = Intrinsic::getDeclaration(M, Intrinsic::powi, tys);

  Value *CI = builder.CreateCall2(vpow, index, exp, Name);
  //return builder.CreateRet(dyn_cast<Value> (CI));
  return CI;
}

Value *Approx::CreateVExp(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vexp = Intrinsic::getDeclaration(M, Intrinsic::fabs, tys);
  Value *CI = builder.CreateCall(vexp, v, Name);
  //return builder.CreateRet(dyn_cast<Value> (CI));
  return CI;
}

Value *Approx::CreateVExp2(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vexp2 = Intrinsic::getDeclaration(M, Intrinsic::fabs, tys);
  Value *CI = builder.CreateCall(vexp2, v, Name);
  //return builder.CreateRet(dyn_cast<Value> (CI));
  return CI;
}

Value *Approx::CreateVSin(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vsqrt = Intrinsic::getDeclaration(M, Intrinsic::sin, tys);
  Value *CI = builder.CreateCall(vsqrt, v, Name);
  //return builder.CreateRet(dyn_cast<Value> (CI));
  return CI;
}

Value *Approx::CreateVCos(IRBuilder<> &builder, Value *v, const std::string& Name) {
  Type *tys[] = {v->getType()};
  Module *M = currF->getParent();

  Value *vsqrt = Intrinsic::getDeclaration(M, Intrinsic::cos, tys);
  Value *CI = builder.CreateCall(vsqrt, v, Name);
  //return builder.CreateRet(dyn_cast<Value> (CI));
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
#undef DEBUG_TYPE


