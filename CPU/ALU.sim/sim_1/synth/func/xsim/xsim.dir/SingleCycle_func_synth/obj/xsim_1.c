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
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_29(char*, char *);
extern void execute_32(char*, char *);
extern void execute_33(char*, char *);
extern void execute_37(char*, char *);
extern void execute_39(char*, char *);
extern void execute_102(char*, char *);
extern void execute_197(char*, char *);
extern void execute_202(char*, char *);
extern void execute_205(char*, char *);
extern void execute_208(char*, char *);
extern void execute_211(char*, char *);
extern void execute_214(char*, char *);
extern void execute_217(char*, char *);
extern void execute_220(char*, char *);
extern void execute_223(char*, char *);
extern void execute_226(char*, char *);
extern void execute_229(char*, char *);
extern void execute_232(char*, char *);
extern void execute_235(char*, char *);
extern void execute_238(char*, char *);
extern void execute_241(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_246(char*, char *);
extern void execute_247(char*, char *);
extern void execute_248(char*, char *);
extern void execute_251(char*, char *);
extern void execute_252(char*, char *);
extern void execute_253(char*, char *);
extern void execute_256(char*, char *);
extern void execute_257(char*, char *);
extern void execute_258(char*, char *);
extern void execute_266(char*, char *);
extern void execute_267(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_453(char*, char *);
extern void execute_454(char*, char *);
extern void execute_455(char*, char *);
extern void execute_456(char*, char *);
extern void execute_457(char*, char *);
extern void execute_561(char*, char *);
extern void execute_657(char*, char *);
extern void execute_753(char*, char *);
extern void execute_848(char*, char *);
extern void execute_897(char*, char *);
extern void execute_994(char*, char *);
extern void execute_997(char*, char *);
extern void execute_998(char*, char *);
extern void execute_999(char*, char *);
extern void execute_1000(char*, char *);
extern void execute_1011(char*, char *);
extern void execute_1012(char*, char *);
extern void execute_1013(char*, char *);
extern void execute_1014(char*, char *);
extern void execute_1015(char*, char *);
extern void execute_1016(char*, char *);
extern void execute_1019(char*, char *);
extern void execute_1022(char*, char *);
extern void execute_1023(char*, char *);
extern void execute_1024(char*, char *);
extern void execute_1025(char*, char *);
extern void execute_1026(char*, char *);
extern void execute_1027(char*, char *);
extern void execute_1030(char*, char *);
extern void execute_1031(char*, char *);
extern void execute_1032(char*, char *);
extern void execute_1035(char*, char *);
extern void execute_1036(char*, char *);
extern void execute_1037(char*, char *);
extern void execute_1038(char*, char *);
extern void execute_1041(char*, char *);
extern void execute_1042(char*, char *);
extern void execute_1051(char*, char *);
extern void execute_1057(char*, char *);
extern void execute_1058(char*, char *);
extern void execute_1059(char*, char *);
extern void execute_1060(char*, char *);
extern void execute_1061(char*, char *);
extern void execute_1062(char*, char *);
extern void execute_1063(char*, char *);
extern void execute_1066(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_58(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_63(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_67(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_68(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_69(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_70(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_71(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_73(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_74(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_75(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_76(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_77(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_78(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_79(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[119] = {(funcp)execute_15, (funcp)execute_16, (funcp)execute_17, (funcp)execute_29, (funcp)execute_32, (funcp)execute_33, (funcp)execute_37, (funcp)execute_39, (funcp)execute_102, (funcp)execute_197, (funcp)execute_202, (funcp)execute_205, (funcp)execute_208, (funcp)execute_211, (funcp)execute_214, (funcp)execute_217, (funcp)execute_220, (funcp)execute_223, (funcp)execute_226, (funcp)execute_229, (funcp)execute_232, (funcp)execute_235, (funcp)execute_238, (funcp)execute_241, (funcp)execute_242, (funcp)execute_243, (funcp)execute_246, (funcp)execute_247, (funcp)execute_248, (funcp)execute_251, (funcp)execute_252, (funcp)execute_253, (funcp)execute_256, (funcp)execute_257, (funcp)execute_258, (funcp)execute_266, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_453, (funcp)execute_454, (funcp)execute_455, (funcp)execute_456, (funcp)execute_457, (funcp)execute_561, (funcp)execute_657, (funcp)execute_753, (funcp)execute_848, (funcp)execute_897, (funcp)execute_994, (funcp)execute_997, (funcp)execute_998, (funcp)execute_999, (funcp)execute_1000, (funcp)execute_1011, (funcp)execute_1012, (funcp)execute_1013, (funcp)execute_1014, (funcp)execute_1015, (funcp)execute_1016, (funcp)execute_1019, (funcp)execute_1022, (funcp)execute_1023, (funcp)execute_1024, (funcp)execute_1025, (funcp)execute_1026, (funcp)execute_1027, (funcp)execute_1030, (funcp)execute_1031, (funcp)execute_1032, (funcp)execute_1035, (funcp)execute_1036, (funcp)execute_1037, (funcp)execute_1038, (funcp)execute_1041, (funcp)execute_1042, (funcp)execute_1051, (funcp)execute_1057, (funcp)execute_1058, (funcp)execute_1059, (funcp)execute_1060, (funcp)execute_1061, (funcp)execute_1062, (funcp)execute_1063, (funcp)execute_1066, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_58, (funcp)transaction_59, (funcp)transaction_60, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_67, (funcp)transaction_68, (funcp)transaction_69, (funcp)transaction_70, (funcp)transaction_71, (funcp)transaction_72, (funcp)transaction_73, (funcp)transaction_74, (funcp)transaction_75, (funcp)transaction_76, (funcp)transaction_77, (funcp)transaction_78, (funcp)transaction_79, (funcp)transaction_80};
const int NumRelocateId= 119;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/SingleCycle_func_synth/xsim.reloc",  (void **)funcTab, 119);
	iki_vhdl_file_variable_register(dp + 145520);
	iki_vhdl_file_variable_register(dp + 145576);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/SingleCycle_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/SingleCycle_func_synth/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/SingleCycle_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/SingleCycle_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/SingleCycle_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
