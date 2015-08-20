#define DEBUG_TYPE "VPLoad"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/ADT/IndexedMap.h"
#include <map>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <sys/stat.h>
#include "VP/VPLoadProfile.h"

using namespace llvm;
inline int str_to_int(std::string& s){
	std::istringstream iss(s);
	int t;
	iss >> t;
	return t;	
}
//IMP::The code of Instcounter pass should be same as in VPProfiling
namespace {
class InstCounter : public ModulePass {
  public:
    static char ID;
    static bool flag;
    bool runOnModule(Module &M);
    static uint64_t insts;
    void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.setPreservesAll();
    }
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

static RegisterPass<InstCounter> Y("vp-load-insts",
                    "Count the number of value generating instructions");

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
#define DEBUG_TYPE "VPLoad"
//unsigned int VPLoadProfileBase::vp_id = -1;
void VPLoadProfileBase::parseFile(Module &M){
  //generate ids again
  for(Module::iterator I = M.begin(), E = M.end(); I != E; I++){
    if(!I->isDeclaration()){
      //iterate over all instructions in the function
      Function &F = *I;
      for(inst_iterator Iter = inst_begin(F), End = inst_end(F); Iter != End; ++Iter){
        Instruction *pInst = &*Iter;
        //CallInst* CI = dyn_cast<CallInst>(pInst);
        if(pInst->use_empty() || isa<PHINode>(pInst) || (pInst->getType()->isAggregateType())){
          //DEBUG(dbgs() << "\tThere is no use for (or phi node)" << pInst->getNameStr() << "\n");
        }
        else{
          IdToInstMap[++vp_id] = pInst;
          InstToIdMap[pInst] = vp_id;
        }
      }
    }
  }
  //load the data from profile file
  std::ifstream ifsValue(vpFile);
  std::string line;
  uint32_t lineCount = 0; //This will act as instruction ID
  if(ifsValue.is_open()){
    while(ifsValue.good()){
      std::getline(ifsValue, line);
      DEBUG(dbgs() << "line read from file " << line << "\n");
      std::string s;
      std::istringstream iLine(line); 
      std::string values; 
      std::getline(iLine, values, ',');
      std::istringstream ss(values);
      valueCountMap_t* valueCountMap = new valueCountMap_t();
      std::string count_s;
      std::string value_s;
      uint32_t pair_count = 0;
      while(ss >> s){
        DEBUG(dbgs() << "\tdata from line " << s << "\n");
        if(pair_count % 2){
          count_s = s;
          uint32_t count = str_to_int(count_s);
          int value = str_to_int(value_s);
          valueCountMap->insert(std::pair<int, unsigned int>(value, count));
          //valueCountMap[value] = count;
        }
        else{
          value_s = s;
        }
        pair_count++;
      }
      IdToValueCount[lineCount] = valueCountMap;
      std::string valueRanges;
      std::getline(iLine, valueRanges, ',');
      std::istringstream ss1(valueRanges);
      DEBUG(dbgs() << "\tvalues ranges are" << valueRanges << "\n");
      rangeCountVec_t* rangeCountVec = new rangeCountVec_t();
      uint32_t triple_count = 0;
      std::string upper_s;
      std::string lower_s;
      //std::string count_s;
      while( ss1 >> s){
        DEBUG(dbgs() << "\tdata from range " << s << "\n");
        if(triple_count % 3 == 0){
          //lower range
          lower_s = s;
        }
        else if(triple_count % 3 == 1){
          //upper rane
          upper_s = s;
        }
        else{
          //range count
          count_s = s;
          uint32_t count = str_to_int(count_s);
          int lower = str_to_int(lower_s);
          int upper = str_to_int(upper_s);
          range* rangObj = new range(lower, upper);
            rangObj->setCount(count);
          rangeCountVec->push_back(rangObj);
        }
        triple_count++;
      }
      IdToRangeCount[lineCount] = rangeCountVec;
      lineCount++;
    }
    DEBUG(dbgs() << "Number of lines read:" << lineCount << 
        " IdToValueCount size:" << IdToValueCount.size() <<  " IdToRangeCount size:" << IdToRangeCount.size () << "\n");
  }
  else{
		std::cerr << "Could not open file " << vpFile << "\n";
		return;
  }
}

ModulePass * llvm::createVPLoadProfilePass(){
  //std::cerr << "creating pass\n";
  return new VPLoadProfile();
}
void VPLoadProfile::getAnalysisUsage(AnalysisUsage &AU) const {
  AU.setPreservesAll();
  AU.addRequired<InstCounter>();
}
char VPLoadProfile::ID = 0;
//unsigned int VPLoadProfile::vp_id = -1;
static RegisterPass<VPLoadProfile> Z("vp-load-profile","Load back value profile data");
bool VPLoadProfile::runOnModule(Module& M){
  parseFile(M);
  return false;
}

#undef DEBUG_TYPE
#define DEBUG_TYPE "VPLoad2"

void VPLoadProfile2::getAnalysisUsage(AnalysisUsage &AU) const {
  AU.setPreservesAll();
  AU.addRequired<InstCounter>();
}
char VPLoadProfile2::ID = 0;
//unsigned int VPLoadProfile2::vp_id = -1;
static RegisterPass<VPLoadProfile2> P("vp-load-profile2","Load back value profile data");
bool VPLoadProfile2::runOnModule(Module& M){
  parseFile(M);
  return false;
}
