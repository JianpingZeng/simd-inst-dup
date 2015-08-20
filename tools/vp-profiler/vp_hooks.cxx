#define __STDC_FORMAT_MACROS

#include "vp_hooks.hxx"
#include "../utils/vp.hxx"

#include <iostream>
#include <iomanip>
#include <fstream>
#include <map>
#include <vector>
#include <limits>

using namespace std;
using namespace VP;

bool VP_initalized = false;
typedef struct _vp_params_t {
  ofstream *vp_out;
} vp_params_t;

static vp_params_t vp_params;

static uint32_t total_insts;
static vector<VProfile*> vProfiler;

void VP_val1(const uint32_t instr, const int value) {
  if(!VP_initalized){
    cerr << "hooks call before initialization" << endl;
    return;
  }
  //cout << "inside VP_val1:" << instr << "=>" << value << endl; 
  vProfiler[instr]->increment(value);
  vProfiler[instr]->addToHistogram(value);
}

void VP_init(uint32_t num_instrs){
  vp_params.vp_out = new ofstream("result.vp.out");  
  //cout << "in init" << endl;

  total_insts = num_instrs;
  for(uint32_t i = 0; i < num_instrs; i++){
    //cout << "creating obj" << endl;
    VProfile *vProfileObj = new VProfile();
    //cout << "created obj" << endl;
    vProfiler.push_back(vProfileObj);
    //cout << "assigned obj" << endl;
  }

  VP_initalized = true;
  //cout << "initalized" << endl;
  atexit(VP_finish);
}

void VP_finish(){
  //cout << "finish called " << endl; 
  for(uint32_t i =0; i < total_insts; i++){
    vProfiler[i]->keep_top_half();
    vProfiler[i]->maintainSize();
    *(vp_params.vp_out) << *(vProfiler[i]) << endl;
    //*(vp_params.vp_out) << endl;
  }
}

/*
 * ########## deifinitions of class members from utils #############
 */
void VProfile::increment(const int value){
  exeCount++;
  //cout << "incrementing for " << value << endl;
  bool found = false;
  for(uint32_t i = 0; i < MAX_VALUES; i++){
    if(valueToExeCount[i]->value == value){
      if(valueToExeCount[i]->count != 0){
        valueToExeCount[i]->count++;
        found = true;
      }
    }
  }
  if(!found){
    for(uint32_t i = 0; i < MAX_VALUES; i++){
      if(valueToExeCount[i]->count == 0){
        valueToExeCount[i]->value = value;
        valueToExeCount[i]->count = 1;
        break;
      }
    }
  }
  //if(valueToExeCount.find(value) != valueToExeCount.end()){
  //  valueToExeCount[value]++;
  //}
  //else if(valueToExeCount.size() <= MAX_VALUES){
  //  valueToExeCount[value] = 1;
  //}
  if(exeCount >= CLR_INTERVAL){
    //clear the half of the map and set count
    exeCount = 0;
    keep_top_half();
    //cout << "calling top half" << endl;
  }
}
void VProfile::keep_top_half(){
  int half_size = HALFSIZE;
  uint32_t count_array[half_size];
  int value_array[half_size];
  uint32_t max_count = 0;
  //cout << "half size " << half_size << endl;
  //also set the CLR_INTERVAL
  uint32_t middle_entry_count = valueToExeCount[half_size]->count; 
  if(2*middle_entry_count > 2000){
    CLR_INTERVAL = 2*middle_entry_count;
  }
  for(int j = 0; j < half_size; j++){
    uint32_t index = 0;
    int max_value = 0;
    count_array[j] = 0;
    for(uint32_t i = 0; i < MAX_VALUES; i++){
      if(valueToExeCount[i]->count > max_count){
        max_count = valueToExeCount[i]->count;
        max_value = valueToExeCount[i]->value;
        index = i;
        //cout << "index " << i << "selected" << endl;
      }
    }
    if(max_count > 0){
      valueToExeCount[index]->count = 0;
      count_array[j] = max_count;
      value_array[j] = max_value;
    //  cout << "count " << max_count << "value " << max_value << endl;
      max_count = 0;
    }
  }
  for(int j = 0; j < half_size; j++){
   valueToExeCount[j]->value = value_array[j]; 
   valueToExeCount[j]->count = count_array[j]; 
  //  cout << "count " << count_array[j] << " value " << value_array[j] << endl;
  }
  for(uint32_t j = half_size; j < MAX_VALUES; j++){
    valueToExeCount[j]->count = 0;
  }
}
void VProfile::addToHistogram(const int value){
  bool binFound = false;
  set<histData*>::iterator it;
  for(it = histogram.begin(); it != histogram.end(); ++it){
    histData* elem = *it;
    if((value >= elem->getLowerRange()) && (value <= elem->getUpperRange())){
      elem->incrementCount();
      binFound = true;
    }
  }
  if(!binFound){
    //add a bin
    histData* elem = new histData();
    elem->setLowerRange(value);
    elem->setUpperRange(value);
    elem->incrementCount();
    histogram.insert(elem);
    /*
    if(histogram.size() < HISTSIZE + 1){
      histogram.insert(new histData());
    }
    for(it = histogram.begin(); it != histogram.end(); ++it){
      histData* elem = *it;
      if(elem->getCount() == 0){
        elem->setLowerRange(value);
        elem->setUpperRange(value);
        elem->incrementCount();
        break;
      }
    }*/
  }
  maintainSize();
}
void VProfile::maintainSize(){
  if(histogram.size() <= 1)
    //nothing to merge here
    return;
  if(histogram.size() < (HISTSIZE + 1))
    //and do not merge if the set is not exceeding its limits
    return;
  set<histData*>::iterator it;
  bool shouldMergeBins = histogram.size() == (HISTSIZE + 1);
  /*
  for(it = histogram.begin(); it != histogram.end(); ++it){
    histData* elem = *it;
    if(elem->getCount() == 0){
      shouldMergeBins = false;  
      break;
    }
  }*/
  histData* minData = NULL;
  int maxInt = numeric_limits<int>::max();
  int minValue = maxInt;
  if(shouldMergeBins){
    it = histogram.begin();
    histData* prevElem = *it;
    it++;
    for(; it != histogram.end(); ++it){
      histData* elem = *it;
      int diff = elem->getLowerRange() - prevElem->getLowerRange();
      if(diff < minValue){
        minData = prevElem;
        minValue = diff;
      }
      prevElem = elem;
    }
    //we need to merge minData and the next bin
    it = histogram.find(minData);
    if(it == histogram.end()){
      cerr << "could not find the element in histogram" << endl;
    }
    histData* elem = *it;
    histData* nextElem = *++it;
    elem->setUpperRange(nextElem->getUpperRange());
    elem->setCount(elem->getCount() + nextElem->getCount());
    //nextElem->setLowerRange(maxInt);
    //nextElem->setUpperRange(maxInt);
    //nextElem->setCount(0);
    histogram.erase(it);
  }
}
