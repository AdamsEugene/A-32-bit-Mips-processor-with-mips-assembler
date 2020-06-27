/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_48(char*, char *);
extern void execute_1236(char*, char *);
extern void execute_1237(char*, char *);
extern void execute_1238(char*, char *);
extern void execute_18(char*, char *);
extern void execute_20(char*, char *);
extern void execute_32(char*, char *);
extern void execute_35(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_40(char*, char *);
extern void execute_42(char*, char *);
extern void execute_44(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_50(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_57(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_68(char*, char *);
extern void execute_71(char*, char *);
extern void execute_74(char*, char *);
extern void execute_77(char*, char *);
extern void execute_80(char*, char *);
extern void execute_83(char*, char *);
extern void execute_86(char*, char *);
extern void execute_87(char*, char *);
extern void execute_88(char*, char *);
extern void execute_91(char*, char *);
extern void execute_92(char*, char *);
extern void execute_93(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_687(char*, char *);
extern void execute_783(char*, char *);
extern void execute_879(char*, char *);
extern void execute_975(char*, char *);
extern void execute_1070(char*, char *);
extern void execute_1119(char*, char *);
extern void execute_1210(char*, char *);
extern void execute_1213(char*, char *);
extern void execute_1216(char*, char *);
extern void execute_1219(char*, char *);
extern void execute_1220(char*, char *);
extern void execute_1221(char*, char *);
extern void execute_1222(char*, char *);
extern void execute_1224(char*, char *);
extern void execute_1228(char*, char *);
extern void execute_1235(char*, char *);
extern void execute_1245(char*, char *);
extern void execute_1248(char*, char *);
extern void execute_1249(char*, char *);
extern void execute_1251(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[67] = {(funcp)execute_48, (funcp)execute_1236, (funcp)execute_1237, (funcp)execute_1238, (funcp)execute_18, (funcp)execute_20, (funcp)execute_32, (funcp)execute_35, (funcp)execute_36, (funcp)execute_37, (funcp)execute_40, (funcp)execute_42, (funcp)execute_44, (funcp)execute_46, (funcp)execute_47, (funcp)execute_50, (funcp)execute_52, (funcp)execute_53, (funcp)execute_54, (funcp)execute_55, (funcp)execute_57, (funcp)execute_60, (funcp)execute_61, (funcp)execute_68, (funcp)execute_71, (funcp)execute_74, (funcp)execute_77, (funcp)execute_80, (funcp)execute_83, (funcp)execute_86, (funcp)execute_87, (funcp)execute_88, (funcp)execute_91, (funcp)execute_92, (funcp)execute_93, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_111, (funcp)execute_112, (funcp)execute_113, (funcp)execute_114, (funcp)execute_687, (funcp)execute_783, (funcp)execute_879, (funcp)execute_975, (funcp)execute_1070, (funcp)execute_1119, (funcp)execute_1210, (funcp)execute_1213, (funcp)execute_1216, (funcp)execute_1219, (funcp)execute_1220, (funcp)execute_1221, (funcp)execute_1222, (funcp)execute_1224, (funcp)execute_1228, (funcp)execute_1235, (funcp)execute_1245, (funcp)execute_1248, (funcp)execute_1249, (funcp)execute_1251, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 67;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/MipsSingleCycleProcessor_behav/xsim.reloc",  (void **)funcTab, 67);
	iki_vhdl_file_variable_register(dp + 98064);
	iki_vhdl_file_variable_register(dp + 98120);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/MipsSingleCycleProcessor_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/MipsSingleCycleProcessor_behav/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/MipsSingleCycleProcessor_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/MipsSingleCycleProcessor_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/MipsSingleCycleProcessor_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
