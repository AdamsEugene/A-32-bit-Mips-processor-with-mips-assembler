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
extern void execute_21(char*, char *);
extern void execute_24(char*, char *);
extern void execute_27(char*, char *);
extern void execute_30(char*, char *);
extern void execute_33(char*, char *);
extern void execute_36(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_620(char*, char *);
extern void execute_716(char*, char *);
extern void execute_812(char*, char *);
extern void execute_908(char*, char *);
extern void execute_1003(char*, char *);
extern void execute_1052(char*, char *);
extern void execute_1143(char*, char *);
extern void execute_1146(char*, char *);
extern void execute_1149(char*, char *);
extern void execute_1152(char*, char *);
extern void execute_1153(char*, char *);
extern void execute_1154(char*, char *);
extern void execute_1155(char*, char *);
extern void execute_1157(char*, char *);
extern void execute_1161(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[26] = {(funcp)execute_21, (funcp)execute_24, (funcp)execute_27, (funcp)execute_30, (funcp)execute_33, (funcp)execute_36, (funcp)execute_44, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_620, (funcp)execute_716, (funcp)execute_812, (funcp)execute_908, (funcp)execute_1003, (funcp)execute_1052, (funcp)execute_1143, (funcp)execute_1146, (funcp)execute_1149, (funcp)execute_1152, (funcp)execute_1153, (funcp)execute_1154, (funcp)execute_1155, (funcp)execute_1157, (funcp)execute_1161, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 26;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/P_FullALU_behav/xsim.reloc",  (void **)funcTab, 26);
	iki_vhdl_file_variable_register(dp + 83736);
	iki_vhdl_file_variable_register(dp + 83792);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/P_FullALU_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/P_FullALU_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/P_FullALU_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/P_FullALU_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/P_FullALU_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
