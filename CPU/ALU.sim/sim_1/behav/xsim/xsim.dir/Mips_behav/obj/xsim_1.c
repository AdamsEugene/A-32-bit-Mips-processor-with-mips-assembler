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
extern void execute_28(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_78(char*, char *);
extern void execute_81(char*, char *);
extern void execute_82(char*, char *);
extern void execute_83(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_86(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_30(char*, char *);
extern void execute_32(char*, char *);
extern void execute_35(char*, char *);
extern void execute_40(char*, char *);
extern void execute_41(char*, char *);
extern void execute_44(char*, char *);
extern void execute_50(char*, char *);
extern void execute_51(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_70(char*, char *);
extern void execute_72(char*, char *);
extern void execute_74(char*, char *);
extern void execute_76(char*, char *);
extern void execute_77(char*, char *);
extern void execute_80(char*, char *);
extern void execute_89(char*, char *);
extern void execute_91(char*, char *);
extern void execute_93(char*, char *);
extern void execute_95(char*, char *);
extern void execute_106(char*, char *);
extern void execute_109(char*, char *);
extern void execute_112(char*, char *);
extern void execute_115(char*, char *);
extern void execute_118(char*, char *);
extern void execute_121(char*, char *);
extern void execute_129(char*, char *);
extern void execute_130(char*, char *);
extern void execute_131(char*, char *);
extern void execute_132(char*, char *);
extern void execute_705(char*, char *);
extern void execute_801(char*, char *);
extern void execute_897(char*, char *);
extern void execute_993(char*, char *);
extern void execute_1088(char*, char *);
extern void execute_1137(char*, char *);
extern void execute_1228(char*, char *);
extern void execute_1231(char*, char *);
extern void execute_1234(char*, char *);
extern void execute_1237(char*, char *);
extern void execute_1238(char*, char *);
extern void execute_1239(char*, char *);
extern void execute_1240(char*, char *);
extern void execute_1242(char*, char *);
extern void execute_1246(char*, char *);
extern void execute_1253(char*, char *);
extern void execute_1259(char*, char *);
extern void execute_1260(char*, char *);
extern void execute_1261(char*, char *);
extern void execute_1262(char*, char *);
extern void execute_1265(char*, char *);
extern void execute_1269(char*, char *);
extern void execute_1270(char*, char *);
extern void execute_1271(char*, char *);
extern void execute_1272(char*, char *);
extern void execute_1273(char*, char *);
extern void execute_1274(char*, char *);
extern void execute_1275(char*, char *);
extern void execute_1276(char*, char *);
extern void execute_1277(char*, char *);
extern void execute_1278(char*, char *);
extern void execute_1279(char*, char *);
extern void execute_1280(char*, char *);
extern void execute_1281(char*, char *);
extern void execute_1282(char*, char *);
extern void execute_1283(char*, char *);
extern void execute_1284(char*, char *);
extern void execute_1285(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[92] = {(funcp)execute_28, (funcp)execute_36, (funcp)execute_37, (funcp)execute_38, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_52, (funcp)execute_53, (funcp)execute_78, (funcp)execute_81, (funcp)execute_82, (funcp)execute_83, (funcp)execute_84, (funcp)execute_85, (funcp)execute_86, (funcp)execute_26, (funcp)execute_27, (funcp)execute_30, (funcp)execute_32, (funcp)execute_35, (funcp)execute_40, (funcp)execute_41, (funcp)execute_44, (funcp)execute_50, (funcp)execute_51, (funcp)execute_55, (funcp)execute_56, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_70, (funcp)execute_72, (funcp)execute_74, (funcp)execute_76, (funcp)execute_77, (funcp)execute_80, (funcp)execute_89, (funcp)execute_91, (funcp)execute_93, (funcp)execute_95, (funcp)execute_106, (funcp)execute_109, (funcp)execute_112, (funcp)execute_115, (funcp)execute_118, (funcp)execute_121, (funcp)execute_129, (funcp)execute_130, (funcp)execute_131, (funcp)execute_132, (funcp)execute_705, (funcp)execute_801, (funcp)execute_897, (funcp)execute_993, (funcp)execute_1088, (funcp)execute_1137, (funcp)execute_1228, (funcp)execute_1231, (funcp)execute_1234, (funcp)execute_1237, (funcp)execute_1238, (funcp)execute_1239, (funcp)execute_1240, (funcp)execute_1242, (funcp)execute_1246, (funcp)execute_1253, (funcp)execute_1259, (funcp)execute_1260, (funcp)execute_1261, (funcp)execute_1262, (funcp)execute_1265, (funcp)execute_1269, (funcp)execute_1270, (funcp)execute_1271, (funcp)execute_1272, (funcp)execute_1273, (funcp)execute_1274, (funcp)execute_1275, (funcp)execute_1276, (funcp)execute_1277, (funcp)execute_1278, (funcp)execute_1279, (funcp)execute_1280, (funcp)execute_1281, (funcp)execute_1282, (funcp)execute_1283, (funcp)execute_1284, (funcp)execute_1285, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 92;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Mips_behav/xsim.reloc",  (void **)funcTab, 92);
	iki_vhdl_file_variable_register(dp + 119120);
	iki_vhdl_file_variable_register(dp + 119176);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Mips_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Mips_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/Mips_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Mips_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Mips_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
