/*
 * Author: Daya S Khudia (dskhudia@umich.edu)
 */
#ifndef APPROX_H
#define APPROX_H

#include "llvm/Pass.h" 
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ProfileInfo.h"
//#include "ProfileInfoLoaderPass.h"
#include "VP/VPLoadProfile.h"
#include "VP/VPProfiling.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/IRBuilder.h"
#include "MyProfileInfo.h"
#include <vector>
#include <string>
#include <set>

#define ERROR_THRESH 1000000
#define VEC_LENGTH 2

using namespace llvm;
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
  //statistic variables
  static unsigned long long totStateVars;
  static unsigned long long totStateVarsDyn;
  static unsigned long long totalIRDyn;
  static unsigned long long stateVarsDyn;
  static unsigned long long duplicatedIRDyn;
  static unsigned long long expChecksDyn;

// ----------- added by zhi for f.p. inst. dup. --------------
  static unsigned long long totFPVars;
  static unsigned long long totFPVarsDyn;
  static unsigned long long totFPVecInst;
  //static unsigned long long totErrors;
// ----------- end -------------------------------------------
  static bool flag;
  static GlobalVariable* vpGlobal;
  DataLayout* TD;
  Function* currF;
  LoopInfo* LI;
  ProfileInfo *PI;
  ProfileInfo *PI2;
  //MyProfileInfo *MyPI;

//for value prediction
  VPLoadProfile *VP;
  VPLoadProfile2 *VP2;

  BasicBlock* relExitBB;
  static Value *exitStr;

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
  std::set<Instruction*> valueRangeCheckSet; 
  std::set<Instruction*> valueCheckSet;
  std::set<Instruction*> ptrCheckSet;
  std::set<Instruction*> alreadySeen;
  std::set<Instruction*> alreadyVisited;
  FunctionToGlobalName_t FunctionToGlobalName;
  BBToGlobalName_t BBToGlobalName;
  instToProdChain_t instToProdChain;

  void findVarsWithState();
  void findVarsWithState(Loop* L);
  void walkHighValues();
  void walkHighValuesRec(Instruction* pInst, Instruction* currChainInst, int height);

  int duplicateProducers();
  Instruction* duplicateProdRec(Instruction *pInst, const std::string &chainPrefix);
  Instruction* duplicateScalarToVector(Instruction *pInst, const std::string &InstName);
  bool deleteInstrumentedScalarInst();
  void deleteInstrDFS(Instruction *pInst);
  bool breakRecDuplication(Instruction* cInst, Instruction* opnd);
  void insertCmp(Instruction* insertPt, Instruction* dupInst, Instruction* origInst, const std::string &instName, bool insertAfter=false);

  Instruction* duplicateScalarLoad(Instruction *pInst, const std::string &instName);
  Instruction* duplicateScalarStore(Instruction *pInst, const std::string &instName);
  Instruction* duplicateScalarArithmetic(Instruction *pInst, const std::string &instName, const int &operation = 0);  
  Instruction* duplicateCall(Instruction *pInst, const std::string &InstName);
  Instruction* duplicatePhiNode(Instruction *pInst, const std::string &InstName);
  Instruction* duplicatePhiNodeVectorTy(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateIntToFP(Instruction *pInst, const std::string &InstName);
  Instruction* duplicateFPTruncExt(Instruction *pInst, const std::string &InstName);

  //create vector intrinsic functions
  Value *CreateVFSqrt(IRBuilder<> &builder, Value *v, const std::string& Name="");
  Value *CreateVFabs(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVPow(IRBuilder<> &builder, Value *index, Value *exp, const std::string& Name);
  Value *CreateVExp(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVExp2(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVSin(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVCos(IRBuilder<> &builder, Value *v, const std::string& Name);
  Value *CreateVMovmsk_pd(IRBuilder<> &builder, Value *v, const std::string& Name="");
  Value *CreateVMovmsk_ps(IRBuilder<> &builder, Value *v, const std::string& Name="");


  void splitBBAndPointExitBlock();
  Value* getOrCreateGlobalName();                                                                                                                                                           
  Value* getOrCreateGlobalName(BasicBlock* bb);
  void createExitBB();
  void createIncRetBB();
  void createEDCECCBB();

  range* getFrequentRange(VPLoadProfileBase* VPin, ProfileInfo* PIin, unsigned int id);
  bool fewNotChangingGeneratedValues(Instruction* inst);
  bool areMapsSame(valueCountMap_t* map1, valueCountMap_t* map2);
  bool isThisATightRange(Instruction* inst, range* rng);
  void markInvalidForValueCmps(Instruction* pInst, int height);
  void insertValueCmps();
  bool insertFreqValueCmp(Instruction* cInst);
  bool insertFreqRangeCmp(Instruction* cInst, range* rng);
  range* shouldInsertRangeCheck(Instruction* inst);
  void insertValueMsg();
  freqValues getFreqValues(Instruction* cInst);
  bool handledByValue(Instruction* inst);
  void insertVPMsgInMain();
  void createGlobal();
  bool shouldExcludeFromVP(Instruction* cInst);
  bool doesOnlyGeneratesBoolValues(Instruction* cInst);
  bool isInvolvedInPointerConversion(Instruction* cInst);
  bool isInvolvedInPointerConversionFwRec(Instruction* cInst);
  bool isInvolvedInPointerConversionBwRec(Instruction* cInst);
  int getSize(Type* ty);
  bool acceptRange(Instruction* inst, uint64_t rng);
  int getAcceptableRangeForSize(int size);
  void insertIntrinsic();

};

}//namespace
class instrInfo {
  Instruction *minstr;
  bool misDuplicated;     //for vector instructions, they are always duplicated by other ones
  bool misReplaced;       //for scalar instructions, they are always replaced by other ones
  Instruction* mduplicatedBy;
  Instruction* mreplacedBy;
  bool misStateVar;
  bool misHighValue;
  bool noValueCheck;

// ------------------- added by zhi for f.p. instruction duplication -----
  bool misFPVar;
  bool misFPVecInst;
  bool misInstrumented;

// ------------------- end ---------------------------------------------
  public:
    instrInfo(Instruction* cInstr) ;
    bool isDuplicated(){
        return misDuplicated;
    }

    Instruction* duplicatedBy(){
        return mduplicatedBy;
    }

    bool isStateVar(){
        return misStateVar;
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

    void setStateVar(){
        misStateVar = true;
    }

    void setHighValue();

    bool isHighValue(){
        return misHighValue;
    }

    void setNoValueCheck(){
        noValueCheck = true;
    }

    bool isNoValueCheck(){
        return noValueCheck;
    }

// ----------------------- added by zhi for f.p. instruction duplciation ----
    void setFPVar() {
	    misFPVar = true;
    }

    bool isFPVar() {
	    return misFPVar;
    } 

    void setFPVectorInst() {
        misFPVecInst = true;
    }

    bool isFPVectorInst() {
        return misFPVecInst;
    }

    void setInstrumented() {
      misInstrumented = true;
    }

    bool isInstrumented() {
      return misInstrumented;
    } 
// ----------------------- end ----------------------------------------------
};

#endif
