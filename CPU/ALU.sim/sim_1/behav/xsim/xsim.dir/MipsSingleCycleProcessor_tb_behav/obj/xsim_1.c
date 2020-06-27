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
extern void execute_1253(char*, char *);
extern void execute_1254(char*, char *);
extern void execute_49(char*, char *);
extern void execute_1237(char*, char *);
extern void execute_1238(char*, char *);
extern void execute_1239(char*, char *);
extern void execute_27(char*, char *);
extern void execute_29(char*, char *);
extern void execute_33(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_41(char*, char *);
extern void execute_43(char*, char *);
extern void execute_45(char*, char *);
extern void execute_47(char*, char *);
extern void execute_48(char*, char *);
extern void execute_51(char*, char *);
extern void execute_53(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_58(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_69(char*, char *);
extern void execute_72(char*, char *);
extern void execute_75(char*, char *);
extern void execute_78(char*, char *);
extern void execute_81(char*, char *);
extern void execute_84(char*, char *);
extern void execute_87(char*, char *);
extern void execute_88(char*, char *);
extern void execute_89(char*, char *);
extern void execute_92(char*, char *);
extern void execute_93(char*, char *);
extern void execute_94(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_688(char*, char *);
extern void execute_784(char*, char *);
extern void execute_880(char*, char *);
extern void execute_976(char*, char *);
extern void execute_1071(char*, char *);
extern void execute_1120(char*, char *);
extern void execute_1211(char*, char *);
extern void execute_1214(char*, char *);
extern void execute_1217(char*, char *);
extern void execute_1220(char*, char *);
extern void execute_1221(char*, char *);
extern void execute_1222(char*, char *);
extern void execute_1223(char*, char *);
extern void execute_1225(char*, char *);
extern void execute_1229(char*, char *);
extern void execute_1236(char*, char *);
extern void execute_1246(char*, char *);
extern void execute_1249(char*, char *);
extern void execute_1250(char*, char *);
extern void execute_1252(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[69] = {(funcp)execute_1253, (funcp)execute_1254, (funcp)execute_49, (funcp)execute_1237, (funcp)execute_1238, (funcp)execute_1239, (funcp)execute_27, (funcp)execute_29, (funcp)execute_33, (funcp)execute_36, (funcp)execute_37, (funcp)execute_38, (funcp)execute_41, (funcp)execute_43, (funcp)execute_45, (funcp)execute_47, (funcp)execute_48, (funcp)execute_51, (funcp)execute_53, (funcp)execute_54, (funcp)execute_55, (funcp)execute_56, (funcp)execute_58, (funcp)execute_61, (funcp)execute_62, (funcp)execute_69, (funcp)execute_72, (funcp)execute_75, (funcp)execute_78, (funcp)execute_81, (funcp)execute_84, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_92, (funcp)execute_93, (funcp)execute_94, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_112, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_688, (funcp)execute_784, (funcp)execute_880, (funcp)execute_976, (funcp)execute_1071, (funcp)execute_1120, (funcp)execute_1211, (funcp)execute_1214, (funcp)execute_1217, (funcp)execute_1220, (funcp)execute_1221, (funcp)execute_1222, (funcp)execute_1223, (funcp)execute_1225, (funcp)execute_1229, (funcp)execute_1236, (funcp)execute_1246, (funcp)execute_1249, (funcp)execute_1250, (funcp)execute_1252, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 69;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/MipsSingleCycleProcessor_tb_behav/xsim.reloc",  (void **)funcTab, 69);
	iki_vhdl_file_variable_register(dp + 98160);
	iki_vhdl_file_variable_register(dp + 98216);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/MipsSingleCycleProcessor_tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/MipsSingleCycleProcessor_tb_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/MipsSingleCycleProcessor_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/MipsSingleCycleProcessor_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/MipsSingleCycleProcessor_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
