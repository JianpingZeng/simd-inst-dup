/*
 * Author: Zhi Chen (zhic2@uci.edu)
 */
#ifndef APPROX_H
#define APPROX_H

#include "llvm/Pass.h" 
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/LoopInfo.h"
#include "VP/VPLoadProfile.h"
#include "VP/VPProfiling.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/IRBuilder.h"
#include "MyProfileInfo.h"
#include <vector>
#include <string>
#include <set>
#include <queue>

using namespace llvm;

#define ERROR_THRESH 8
#define VEC_LENGTH 2

class instrInfo;
namespace {
  //class LoaderPass2;
struct freqValues {
  /* data */
  int value1;
  int value2;
  int count;
}; 

struct instHeight{
  Instruction* inst;
  int height;
};

class Approx : public FunctionPass{
public:
  typedef std::map<Instruction*, instrInfo*> tInstrToInfoObj;
  typedef std::map<Function*, Value*> FunctionToGlobalName_t;
  typedef std::map<BasicBlock*, Value*> BBToGlobalName_t;
  typedef std::vector<instHeight> instVec_t;
  typedef std::map<Instruction*, instVec_t*> instToProdChain_t;
  typedef std::map<Value*, Value*> tValueToValueMap;
  static char ID;
  Approx() : FunctionPass(ID) {}
  virtual bool runOnFunction(Function &F);
  virtual void getAnalysisUsage(AnalysisUsage &AU) const;
  virtual bool doFinalization(Module &M);
private:

// ----------- added by zhi for f.p. inst. dup. --------------
  static unsigned long long totVars;
  static unsigned long long totVecInst;
  //static unsigned long long totErrors;
// ----------- end -------------------------------------------
  static bool flag;
  static GlobalVariable* vpGlobal;
  static GlobalVariable* softErrorNumGobal;
  static GlobalVariable* errorThreshGlobal;
  DataLayout* TD;
  Function* currF;
  LoopInfo* LI;

  //! record the last instruction has flipped bit
  static Instruction *lastWrongInstr;

  //! Error handling block
  BasicBlock* relExitBB;
  BasicBlock* exitAppBB;
  BasicBlock* errorHandlerBB;
  BasicBlock* nextNormalBB;
  static Value *exitStr;
  static Value *exitDirectly;
  static Value *errorStr;
  static Value *printPC;

  //data structures
  //vector<Instruction*> stateVars;
  std::set<Instruction*> workList;
  tInstrToInfoObj scalarToVectorMap;
  tInstrToInfoObj instrToInfoObj;
  std::vector<Instruction*> instrVec;
  std::set<Instruction*> cmpInstInserted;
  std::set<Value*> vcmpInstInserted;
  //map of final value check to the instruction for which values are checked
  std::map<Value*, Value*> vcmpToCheckInst;
  std::map<Value*, Value*> argsScalarToVectorMap;    //passed in arguments
  std::map<Value*, Value*> globalScalarToVectorMap;    //global variables
  std::set<Instruction*> valueRangeCheckSet; 
  std::set<Instruction*> valueCheckSet;
  std::set<Instruction*> ptrCheckSet;
  std::set<Instruction*> alreadySeen;
  std::set<Instruction*> alreadyVisited;
  std::set<Instruction*> tobeFixedPhiNodes;
  std::vector<Value*> extractedInst;   //used to mark erasable instructions
  FunctionToGlobalName_t FunctionToGlobalName;
  BBToGlobalName_t BBToGlobalName;
  instToProdChain_t instToProdChain;

  int duplicateProducers();
  Instruction* duplicateProdRec(Instruction *pInst, const std::string &chainPrefix);
  Instruction* duplicateScalarToVector(Instruction *pInst, const std::string &InstName);
  Instruction* createShuffleInst(Instruction *pInst, const std::string &instName);
  bool fixHolesInPhiNodes();
  bool deleteInstrumentedScalarInst();
  void deleteInstrDFS(Instruction *pInst);
  Value* getScalarValueFromInstr(Instruction *srcInst);
  void myReplaceUsesOfWith(Value *oldVal, Instruction *dupInst, Value *newVal);
  void sweepMarkedInstr();
  void insertCmp(Instruction* insertPt, Instruction* dupInst, Instruction* origInst, const std::string &instName, bool insertAfter=false);
  Value* insertScalarToVectorMap(Value *key, const std::string &instName);
  bool extractableVectorValue(Instruction *pInst);
  bool isPrimitiveType(const Instruction *pInst);
  bool breakRecDuplication(Instruction* cInst, Instruction* opnd);
  Value *createMask(const Instruction *pInst);
  Value *createInsertElementMask(const Instruction *pInst, bool doubleSize);
  Value *extractMask(const Instruction *pInst);
  Value *extractHalfMask(const Instruction *pInst);
  Value *createConstantVector(Value *val);
  Value *createInstDuplicationMask(const Instruction *pInst);

  Instruction* instrumentReturn(Instruction *&pInst, const std::string &instName);
  Instruction* duplicateScalarGEP(Instruction *pInst, const std::string &instName);
  Instruction* duplicateScalarGEP1(Instruction *&pInst, const std::string &instName);
  //bool duplicateScalarInvoke(Instruction *pInst, const std::string &instName);
  Instruction* duplicateScalarInvoke(Instruction *pInst, const std::string &instName);
  Instruction* insertUseOfInvoke(Instruction *pInst, Instruction *insertPtr, const std::string &instName);
  Instruction* duplicateScalarLoad(Instruction *pInst, const std::string &instName);
  Instruction* duplicateScalarStore(Instruction *pInst, const std::string &instName);
  Instruction* duplicateScalarArithmetic(Instruction *pInst, const std::string &instName, const int &operation = 0);  
  Instruction* duplicateCall(Instruction *pInst, const std::string &InstName);
  Instruction* duplicatePhiNode(Instruction *pInst, const std::string &InstName);
  Instruction* duplicatePhiNodeVectorTy(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateTypeConvert(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateBitcast(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateFPTruncExt(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateSelect(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateBranch(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateSwitch(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateExtractElement(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateExtractValue(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateInsertElement(Instruction *&pInst, const std::string &InstName);
  Instruction* duplicateShuffleVector(Instruction *&pInst, const std::string &InstName);
  bool vectorizableBitcast(const Instruction *pInst);
  bool needErrorChecking(Instruction *currInst);

  //create vector intrinsic functions
  Value *CreateVFSqrt(IRBuilder<> &builder, Value *v, const std::string& Name="");
  Value *CreateVFabs(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVPow(IRBuilder<> &builder, Value *index, Value *exp, const std::string& Name);
  Value *CreateVExp(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVExp2(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVSin(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVCos(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVFloor(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVCeil(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVRound(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVLog(IRBuilder<> &builder, Value *v, const std::string& Name, const int &index = 0);
  Value *CreateVFma(IRBuilder<> &builder, Value *a, Value *b, Value *c, const std::string& Name);
  Value *CreateVMovmsk_pd(IRBuilder<> &builder, Value *v, const std::string& Name="");
  Value *CreateVMovmsk_ps(IRBuilder<> &builder, Value *v, const std::string& Name="");
  Value *CreatePtestSSE(IRBuilder<> &builder, Value *lhs, Value *rhs, const std::string& Name="");
  Value *CreatePtestAVX(IRBuilder<> &builder, Value *lhs, Value *rhs, const std::string& Name="");


  void splitBBAndPointExitBlock();
  Value* getOrCreateGlobalName();                                                                                                                                                           
  Value* getOrCreateGlobalName(BasicBlock* bb);
  Value* getOrCreateGlobalVariable(std::string name);

  void increaseErrorCnt(IRBuilder<>& builder);

  void createExitBB();
  void createExitAppBB();
  void createErrorHandlerBB();
  void createEDCECCBB();

  Value *getErrorInstruction(IRBuilder<> &builder);
  int getProcessorID();
  Value *getPC(IRBuilder<>& builder);

  std::string getTimeStamp();
  Value* readCycleCounterReg(IRBuilder<>&builder);

  bool handledByValue(Instruction* inst);
  void createGlobal(const std::string name);
  int getSize(Type* ty);
};

}//namespace
class instrInfo {
  Instruction *minstr;
  bool misDuplicated;     //for vector instructions, they are always duplicated by other ones
  bool misReplaced;       //for scalar instructions, they are always replaced by other ones
  Instruction* mduplicatedBy;
  Instruction* mreplacedBy;
  Instruction* mextracted;

  bool misVar;
  bool misVecInst;
  bool misInstrumented;
  bool misSSEInst;
  bool misAVXInst;

  //lastUses is used to count how many uses the current instruction involves, we can delete the
  //instruction only and if only pInst->getNumUses() == 0 and pInst->lastUses <= 1;
  //The variable is used to avoid the following case when we are performing inst. deletion:
  //%1 = %2, %3
  //  -- ...
  //  -- %4 = %1, %5,
  //  -- ...
  //  -- %a = %1, %b
  //  --
  //when we use the DFS way to delete the instruction %4 = %1, %5, we might meet the following situation:
  //%4 = %1, %5
  //  -- ...
  //  -- %c = %a, %d
  //  -- ...
  //  In this case %a might be deleted before we backtrack to the original uses, therefore resulting in 
  //  segmetation fault.
  unsigned lastUses;

// ------------------- end ---------------------------------------------
  public:
    instrInfo(Instruction* cInstr) ;
    bool isDuplicated(){
        return misDuplicated;
    }

    Instruction* duplicatedBy(){
        return mduplicatedBy;
    }

    void setDuplicated(Instruction* pinst){
        misDuplicated = true;  
        mduplicatedBy = pinst;
    }

    bool isReplaced() {
        return misReplaced;
    }

    Instruction *replacedBy() {
        return mreplacedBy;
    }

    void setReplacedBy(Instruction *pinst) {
        misReplaced = true;
        mreplacedBy = pinst;
    }

    void setVar() {
	    misVar = true;
    }

    bool isVar() {
	    return misVar;
    } 

    void setVectorInst() {
        misVecInst = true;
    }

    bool isVectorInst() {
        return misVecInst;
    }

    bool isSSEInst() {
        return misSSEInst;
    }

    void setSSEInst() {
        misSSEInst = true;
    }

    bool isAVXInst() {
        return misAVXInst;
    }

    void setAVXInst() {
        misAVXInst = true;
    }

    void setInstrumented(Instruction *pInst) {
      mextracted = pInst;
      misInstrumented = true;
    }

    bool isInstrumented() {
      return misInstrumented;
    } 

    Instruction *extractFrom() {
      return mextracted;
    }

    unsigned getLastUses() {
      return lastUses;
    }

    void setLastUses(int n) {
      lastUses = n;
    }

    void incrementLastUses() {
      lastUses++;
    }

    void decrementLastUses() {
      lastUses--;
    }
};

#endif
