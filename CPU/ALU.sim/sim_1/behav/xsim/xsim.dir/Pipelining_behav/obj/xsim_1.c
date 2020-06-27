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
extern void execute_35(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_41(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_77(char*, char *);
extern void execute_80(char*, char *);
extern void execute_81(char*, char *);
extern void execute_82(char*, char *);
extern void execute_83(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_26(char*, char *);
extern void execute_29(char*, char *);
extern void execute_31(char*, char *);
extern void execute_34(char*, char *);
extern void execute_39(char*, char *);
extern void execute_40(char*, char *);
extern void execute_44(char*, char *);
extern void execute_49(char*, char *);
extern void execute_50(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_59(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_69(char*, char *);
extern void execute_71(char*, char *);
extern void execute_73(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_79(char*, char *);
extern void execute_88(char*, char *);
extern void execute_90(char*, char *);
extern void execute_101(char*, char *);
extern void execute_104(char*, char *);
extern void execute_107(char*, char *);
extern void execute_110(char*, char *);
extern void execute_113(char*, char *);
extern void execute_116(char*, char *);
extern void execute_119(char*, char *);
extern void execute_120(char*, char *);
extern void execute_121(char*, char *);
extern void execute_124(char*, char *);
extern void execute_125(char*, char *);
extern void execute_126(char*, char *);
extern void execute_129(char*, char *);
extern void execute_130(char*, char *);
extern void execute_131(char*, char *);
extern void execute_134(char*, char *);
extern void execute_135(char*, char *);
extern void execute_136(char*, char *);
extern void execute_144(char*, char *);
extern void execute_145(char*, char *);
extern void execute_146(char*, char *);
extern void execute_147(char*, char *);
extern void execute_720(char*, char *);
extern void execute_816(char*, char *);
extern void execute_912(char*, char *);
extern void execute_1008(char*, char *);
extern void execute_1103(char*, char *);
extern void execute_1152(char*, char *);
extern void execute_1243(char*, char *);
extern void execute_1246(char*, char *);
extern void execute_1249(char*, char *);
extern void execute_1252(char*, char *);
extern void execute_1253(char*, char *);
extern void execute_1254(char*, char *);
extern void execute_1255(char*, char *);
extern void execute_1257(char*, char *);
extern void execute_1261(char*, char *);
extern void execute_1268(char*, char *);
extern void execute_1274(char*, char *);
extern void execute_1275(char*, char *);
extern void execute_1276(char*, char *);
extern void execute_1279(char*, char *);
extern void execute_1281(char*, char *);
extern void execute_1283(char*, char *);
extern void execute_1284(char*, char *);
extern void execute_1285(char*, char *);
extern void execute_1286(char*, char *);
extern void execute_1287(char*, char *);
extern void execute_1288(char*, char *);
extern void execute_1289(char*, char *);
extern void execute_1290(char*, char *);
extern void execute_1291(char*, char *);
extern void execute_1292(char*, char *);
extern void execute_1293(char*, char *);
extern void execute_1294(char*, char *);
extern void execute_1295(char*, char *);
extern void execute_1296(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[99] = {(funcp)execute_27, (funcp)execute_35, (funcp)execute_36, (funcp)execute_37, (funcp)execute_41, (funcp)execute_45, (funcp)execute_46, (funcp)execute_51, (funcp)execute_52, (funcp)execute_77, (funcp)execute_80, (funcp)execute_81, (funcp)execute_82, (funcp)execute_83, (funcp)execute_84, (funcp)execute_85, (funcp)execute_26, (funcp)execute_29, (funcp)execute_31, (funcp)execute_34, (funcp)execute_39, (funcp)execute_40, (funcp)execute_44, (funcp)execute_49, (funcp)execute_50, (funcp)execute_54, (funcp)execute_55, (funcp)execute_59, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_69, (funcp)execute_71, (funcp)execute_73, (funcp)execute_75, (funcp)execute_76, (funcp)execute_79, (funcp)execute_88, (funcp)execute_90, (funcp)execute_101, (funcp)execute_104, (funcp)execute_107, (funcp)execute_110, (funcp)execute_113, (funcp)execute_116, (funcp)execute_119, (funcp)execute_120, (funcp)execute_121, (funcp)execute_124, (funcp)execute_125, (funcp)execute_126, (funcp)execute_129, (funcp)execute_130, (funcp)execute_131, (funcp)execute_134, (funcp)execute_135, (funcp)execute_136, (funcp)execute_144, (funcp)execute_145, (funcp)execute_146, (funcp)execute_147, (funcp)execute_720, (funcp)execute_816, (funcp)execute_912, (funcp)execute_1008, (funcp)execute_1103, (funcp)execute_1152, (funcp)execute_1243, (funcp)execute_1246, (funcp)execute_1249, (funcp)execute_1252, (funcp)execute_1253, (funcp)execute_1254, (funcp)execute_1255, (funcp)execute_1257, (funcp)execute_1261, (funcp)execute_1268, (funcp)execute_1274, (funcp)execute_1275, (funcp)execute_1276, (funcp)execute_1279, (funcp)execute_1281, (funcp)execute_1283, (funcp)execute_1284, (funcp)execute_1285, (funcp)execute_1286, (funcp)execute_1287, (funcp)execute_1288, (funcp)execute_1289, (funcp)execute_1290, (funcp)execute_1291, (funcp)execute_1292, (funcp)execute_1293, (funcp)execute_1294, (funcp)execute_1295, (funcp)execute_1296, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 99;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Pipelining_behav/xsim.reloc",  (void **)funcTab, 99);
	iki_vhdl_file_variable_register(dp + 114432);
	iki_vhdl_file_variable_register(dp + 114488);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Pipelining_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Pipelining_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/Pipelining_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Pipelining_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Pipelining_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
