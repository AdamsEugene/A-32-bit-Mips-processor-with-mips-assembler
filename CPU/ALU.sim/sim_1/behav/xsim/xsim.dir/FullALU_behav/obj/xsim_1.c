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
extern void execute_27(char*, char *);
extern void execute_30(char*, char *);
extern void execute_33(char*, char *);
extern void execute_36(char*, char *);
extern void execute_39(char*, char *);
extern void execute_42(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_50(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_72(char*, char *);
extern void execute_73(char*, char *);
extern void execute_257(char*, char *);
extern void execute_258(char*, char *);
extern void execute_259(char*, char *);
extern void execute_260(char*, char *);
extern void execute_262(char*, char *);
extern void execute_263(char*, char *);
extern void execute_462(char*, char *);
extern void execute_558(char*, char *);
extern void execute_654(char*, char *);
extern void execute_750(char*, char *);
extern void execute_845(char*, char *);
extern void execute_894(char*, char *);
extern void execute_985(char*, char *);
extern void execute_988(char*, char *);
extern void execute_991(char*, char *);
extern void execute_994(char*, char *);
extern void execute_995(char*, char *);
extern void execute_996(char*, char *);
extern void execute_997(char*, char *);
extern void execute_999(char*, char *);
extern void execute_1003(char*, char *);
extern void execute_1010(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[45] = {(funcp)execute_27, (funcp)execute_30, (funcp)execute_33, (funcp)execute_36, (funcp)execute_39, (funcp)execute_42, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_50, (funcp)execute_51, (funcp)execute_52, (funcp)execute_55, (funcp)execute_56, (funcp)execute_57, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_257, (funcp)execute_258, (funcp)execute_259, (funcp)execute_260, (funcp)execute_262, (funcp)execute_263, (funcp)execute_462, (funcp)execute_558, (funcp)execute_654, (funcp)execute_750, (funcp)execute_845, (funcp)execute_894, (funcp)execute_985, (funcp)execute_988, (funcp)execute_991, (funcp)execute_994, (funcp)execute_995, (funcp)execute_996, (funcp)execute_997, (funcp)execute_999, (funcp)execute_1003, (funcp)execute_1010, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 45;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/FullALU_behav/xsim.reloc",  (void **)funcTab, 45);
	iki_vhdl_file_variable_register(dp + 65848);
	iki_vhdl_file_variable_register(dp + 65904);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/FullALU_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/FullALU_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/FullALU_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/FullALU_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/FullALU_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
