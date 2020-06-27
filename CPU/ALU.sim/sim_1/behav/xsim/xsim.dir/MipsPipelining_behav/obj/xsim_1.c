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
extern void execute_32(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_71(char*, char *);
extern void execute_72(char*, char *);
extern void execute_73(char*, char *);
extern void execute_74(char*, char *);
extern void execute_27(char*, char *);
extern void execute_29(char*, char *);
extern void execute_31(char*, char *);
extern void execute_35(char*, char *);
extern void execute_40(char*, char *);
extern void execute_41(char*, char *);
extern void execute_44(char*, char *);
extern void execute_46(char*, char *);
extern void execute_48(char*, char *);
extern void execute_49(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_61(char*, char *);
extern void execute_63(char*, char *);
extern void execute_65(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_70(char*, char *);
extern void execute_77(char*, char *);
extern void execute_79(char*, char *);
extern void execute_90(char*, char *);
extern void execute_93(char*, char *);
extern void execute_96(char*, char *);
extern void execute_99(char*, char *);
extern void execute_102(char*, char *);
extern void execute_105(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_110(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void execute_120(char*, char *);
extern void execute_123(char*, char *);
extern void execute_124(char*, char *);
extern void execute_125(char*, char *);
extern void execute_133(char*, char *);
extern void execute_134(char*, char *);
extern void execute_135(char*, char *);
extern void execute_136(char*, char *);
extern void execute_709(char*, char *);
extern void execute_805(char*, char *);
extern void execute_901(char*, char *);
extern void execute_997(char*, char *);
extern void execute_1092(char*, char *);
extern void execute_1141(char*, char *);
extern void execute_1232(char*, char *);
extern void execute_1235(char*, char *);
extern void execute_1238(char*, char *);
extern void execute_1241(char*, char *);
extern void execute_1242(char*, char *);
extern void execute_1243(char*, char *);
extern void execute_1244(char*, char *);
extern void execute_1246(char*, char *);
extern void execute_1250(char*, char *);
extern void execute_1257(char*, char *);
extern void execute_1261(char*, char *);
extern void execute_1264(char*, char *);
extern void execute_1268(char*, char *);
extern void execute_1269(char*, char *);
extern void execute_1270(char*, char *);
extern void execute_1271(char*, char *);
extern void execute_1272(char*, char *);
extern void execute_1273(char*, char *);
extern void execute_1274(char*, char *);
extern void execute_1275(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_97(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[81] = {(funcp)execute_32, (funcp)execute_36, (funcp)execute_37, (funcp)execute_38, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_27, (funcp)execute_29, (funcp)execute_31, (funcp)execute_35, (funcp)execute_40, (funcp)execute_41, (funcp)execute_44, (funcp)execute_46, (funcp)execute_48, (funcp)execute_49, (funcp)execute_55, (funcp)execute_56, (funcp)execute_57, (funcp)execute_58, (funcp)execute_61, (funcp)execute_63, (funcp)execute_65, (funcp)execute_67, (funcp)execute_68, (funcp)execute_70, (funcp)execute_77, (funcp)execute_79, (funcp)execute_90, (funcp)execute_93, (funcp)execute_96, (funcp)execute_99, (funcp)execute_102, (funcp)execute_105, (funcp)execute_108, (funcp)execute_109, (funcp)execute_110, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_118, (funcp)execute_119, (funcp)execute_120, (funcp)execute_123, (funcp)execute_124, (funcp)execute_125, (funcp)execute_133, (funcp)execute_134, (funcp)execute_135, (funcp)execute_136, (funcp)execute_709, (funcp)execute_805, (funcp)execute_901, (funcp)execute_997, (funcp)execute_1092, (funcp)execute_1141, (funcp)execute_1232, (funcp)execute_1235, (funcp)execute_1238, (funcp)execute_1241, (funcp)execute_1242, (funcp)execute_1243, (funcp)execute_1244, (funcp)execute_1246, (funcp)execute_1250, (funcp)execute_1257, (funcp)execute_1261, (funcp)execute_1264, (funcp)execute_1268, (funcp)execute_1269, (funcp)execute_1270, (funcp)execute_1271, (funcp)execute_1272, (funcp)execute_1273, (funcp)execute_1274, (funcp)execute_1275, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_97};
const int NumRelocateId= 81;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/MipsPipelining_behav/xsim.reloc",  (void **)funcTab, 81);
	iki_vhdl_file_variable_register(dp + 109816);
	iki_vhdl_file_variable_register(dp + 109872);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/MipsPipelining_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/MipsPipelining_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/MipsPipelining_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/MipsPipelining_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/MipsPipelining_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
