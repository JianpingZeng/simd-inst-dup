#ifndef LAMP_HOOKS_H
#define LAMP_HOOKS_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <inttypes.h>
#include <time.h>

/***** function prototypes ******/

#ifdef __cplusplus
extern "C" {
#endif

//extern uint64_t LAMP_param1;
//extern uint64_t LAMP_param2;
//extern uint64_t LAMP_param3;
//extern uint64_t LAMP_param4;
//
//void LAMP_init_st(void);
//
//void LAMP_load1_st(void);
//void LAMP_load2_st(void);
//void LAMP_load4_st(void);
//void LAMP_load8_st(void);
//
//void LAMP_store_op_st(void);
//void LAMP_allocate_st(void);
//void LAMP_register_st(void);
//void LAMP_loop_iteration_begin_st(void);
//void LAMP_loop_iteration_end_st(void);
//void LAMP_loop_invocation_st(void);
//void LAMP_loop_exit_st(void);
//
void VP_init(uint32_t num_instrs);
//
//void LAMP_load1(const uint32_t instr, const uint64_t addr);
//void LAMP_load2(const uint32_t instr, const uint64_t addr);
//void LAMP_load4(const uint32_t instr, const uint64_t addr);
//void LAMP_load8(const uint32_t instr, const uint64_t addr);
//
//void LAMP_store1(const uint32_t instr, const uint64_t addr, const uint64_t value);
//void LAMP_store2(const uint32_t instr, const uint64_t addr, const uint64_t value);
//void LAMP_store4(const uint32_t instr, const uint64_t addr, const uint64_t value);
//void LAMP_store8(const uint32_t instr, const uint64_t addr, const uint64_t value);
//
void VP_finish(void);
//
//void LAMP_allocate(uint32_t lampId, const void *memory, size_t size);
//void LAMP_deallocate(uint32_t lampId, const void *memory, size_t size);
//
//void LAMP_register(uint32_t lampId);
//void LAMP_loop_iteration_begin(void);
//void LAMP_loop_iteration_end(void);
//void LAMP_loop_invocation(uint16_t loopId);
//void LAMP_loop_exit(void);
//
//void LAMP_external_load(const void * addr, const uint64_t size);
//void LAMP_external_store(const void * addr, const uint64_t size);
//
//void LAMP_external_allocate(const void *memory, size_t size);
//void LAMP_external_deallocate(const void *memory, size_t size);
void VP_val1(const uint32_t instr, const int value);


#ifdef __cplusplus
}
#endif

#endif /* LAMP_HOOKS_H */
