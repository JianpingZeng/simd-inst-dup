#ifndef VPLOADPROFILE_H
#define VPLOADPROFILE_H

namespace llvm{
  
  class ModulePass;
  class FunctionPass;
  class LoopPass;
  class range{
    public:
    range(int aLower, int aUpper){
      lowerRange = aLower;
      upperRange = aUpper;
      count = 0;
      fraction = 0;
      totalCount = 0;
    }
    int getLowerRange(){
      return lowerRange;
    }
    int getUpperRange(){
      return upperRange;
    }
    void setLowerRange(int aRange){
      lowerRange = aRange;
    } 
    void setUpperRange(int aRange){
      upperRange = aRange;
    }
    void setCount(int aCount){
      count = aCount;
    }
    int getCount(){
      return count;
    }
    void setFraction(double aFraction){
      fraction = aFraction;
    }
    double getFraction(){
      return fraction;
    }
    void setTotalCount(int aTotalCount){
      totalCount = aTotalCount;
    }
    int getTotalCount(){
      return totalCount;
    }
    private:
    int lowerRange;
    int upperRange;
    int count;
    double fraction;
    int totalCount;
  };

  /*LoopPass *createVPBuildLoopMapPass();*/
  ModulePass *createVPLoadProfilePass();
  typedef std::map<int, unsigned int> valueCountMap_t;
  typedef std::vector<range*> rangeCountVec_t;
  class VPLoadProfileBase {
  private:
    const char* vpFile;
    unsigned int vp_id;
  public:
    std::map<unsigned int, Instruction*> IdToInstMap;   // InstID -> Inst*
    std::map<Instruction*, unsigned int> InstToIdMap;   // Inst* -> InstID
    std::map<unsigned int, valueCountMap_t*> IdToValueCount; //InstID -> map of (value -> count)
    std::map<unsigned int, rangeCountVec_t*> IdToRangeCount; //InstID -> map of (range-> count)
    VPLoadProfileBase(const char* fileName){
      vp_id = -1;
      vpFile = fileName;
    }
    void parseFile(Module& M);
  };
  class VPLoadProfile : public ModulePass, public VPLoadProfileBase {
  public:
    static char ID;
    VPLoadProfile() : ModulePass (ID), VPLoadProfileBase("result.vp.out"){
    }
    virtual bool runOnModule (Module &M);
    virtual void getAnalysisUsage(AnalysisUsage &AU) const;
  };

  //A pass to load second value profile
  ModulePass *createVPLoadProfile2Pass();
  class VPLoadProfile2 : public ModulePass, public VPLoadProfileBase {
  public:
    static char ID;
    VPLoadProfile2() : ModulePass (ID), VPLoadProfileBase("result.vp2.out"){
    }
    virtual bool runOnModule (Module &M);
    virtual void getAnalysisUsage(AnalysisUsage &AU) const;
  };
}
#endif
