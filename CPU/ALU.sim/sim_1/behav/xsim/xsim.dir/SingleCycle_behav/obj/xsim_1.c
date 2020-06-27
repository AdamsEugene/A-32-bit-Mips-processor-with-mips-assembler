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
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_33(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_41(char*, char *);
extern void execute_43(char*, char *);
extern void execute_106(char*, char *);
extern void execute_201(char*, char *);
extern void execute_206(char*, char *);
extern void execute_209(char*, char *);
extern void execute_212(char*, char *);
extern void execute_215(char*, char *);
extern void execute_218(char*, char *);
extern void execute_221(char*, char *);
extern void execute_226(char*, char *);
extern void execute_229(char*, char *);
extern void execute_232(char*, char *);
extern void execute_235(char*, char *);
extern void execute_238(char*, char *);
extern void execute_241(char*, char *);
extern void execute_244(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_249(char*, char *);
extern void execute_250(char*, char *);
extern void execute_251(char*, char *);
extern void execute_254(char*, char *);
extern void execute_255(char*, char *);
extern void execute_256(char*, char *);
extern void execute_259(char*, char *);
extern void execute_260(char*, char *);
extern void execute_261(char*, char *);
extern void execute_269(char*, char *);
extern void execute_270(char*, char *);
extern void execute_271(char*, char *);
extern void execute_272(char*, char *);
extern void execute_456(char*, char *);
extern void execute_457(char*, char *);
extern void execute_458(char*, char *);
extern void execute_459(char*, char *);
extern void execute_462(char*, char *);
extern void execute_463(char*, char *);
extern void execute_464(char*, char *);
extern void execute_465(char*, char *);
extern void execute_569(char*, char *);
extern void execute_665(char*, char *);
extern void execute_761(char*, char *);
extern void execute_856(char*, char *);
extern void execute_905(char*, char *);
extern void execute_1002(char*, char *);
extern void execute_1005(char*, char *);
extern void execute_1006(char*, char *);
extern void execute_1007(char*, char *);
extern void execute_1008(char*, char *);
extern void execute_1019(char*, char *);
extern void execute_1022(char*, char *);
extern void execute_1025(char*, char *);
extern void execute_1026(char*, char *);
extern void execute_1027(char*, char *);
extern void execute_1028(char*, char *);
extern void execute_1029(char*, char *);
extern void execute_1030(char*, char *);
extern void execute_1033(char*, char *);
extern void execute_1034(char*, char *);
extern void execute_1035(char*, char *);
extern void execute_1038(char*, char *);
extern void execute_1039(char*, char *);
extern void execute_1040(char*, char *);
extern void execute_1041(char*, char *);
extern void execute_1044(char*, char *);
extern void execute_1045(char*, char *);
extern void execute_1054(char*, char *);
extern void execute_1059(char*, char *);
extern void execute_1062(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_42(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_43(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_44(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_45(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_46(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
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
funcp funcTab[110] = {(funcp)execute_16, (funcp)execute_17, (funcp)execute_18, (funcp)execute_33, (funcp)execute_36, (funcp)execute_37, (funcp)execute_41, (funcp)execute_43, (funcp)execute_106, (funcp)execute_201, (funcp)execute_206, (funcp)execute_209, (funcp)execute_212, (funcp)execute_215, (funcp)execute_218, (funcp)execute_221, (funcp)execute_226, (funcp)execute_229, (funcp)execute_232, (funcp)execute_235, (funcp)execute_238, (funcp)execute_241, (funcp)execute_244, (funcp)execute_245, (funcp)execute_246, (funcp)execute_249, (funcp)execute_250, (funcp)execute_251, (funcp)execute_254, (funcp)execute_255, (funcp)execute_256, (funcp)execute_259, (funcp)execute_260, (funcp)execute_261, (funcp)execute_269, (funcp)execute_270, (funcp)execute_271, (funcp)execute_272, (funcp)execute_456, (funcp)execute_457, (funcp)execute_458, (funcp)execute_459, (funcp)execute_462, (funcp)execute_463, (funcp)execute_464, (funcp)execute_465, (funcp)execute_569, (funcp)execute_665, (funcp)execute_761, (funcp)execute_856, (funcp)execute_905, (funcp)execute_1002, (funcp)execute_1005, (funcp)execute_1006, (funcp)execute_1007, (funcp)execute_1008, (funcp)execute_1019, (funcp)execute_1022, (funcp)execute_1025, (funcp)execute_1026, (funcp)execute_1027, (funcp)execute_1028, (funcp)execute_1029, (funcp)execute_1030, (funcp)execute_1033, (funcp)execute_1034, (funcp)execute_1035, (funcp)execute_1038, (funcp)execute_1039, (funcp)execute_1040, (funcp)execute_1041, (funcp)execute_1044, (funcp)execute_1045, (funcp)execute_1054, (funcp)execute_1059, (funcp)execute_1062, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_42, (funcp)transaction_43, (funcp)transaction_44, (funcp)transaction_45, (funcp)transaction_46, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_58, (funcp)transaction_59, (funcp)transaction_60, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_67, (funcp)transaction_68, (funcp)transaction_69, (funcp)transaction_70, (funcp)transaction_71, (funcp)transaction_72, (funcp)transaction_73};
const int NumRelocateId= 110;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/SingleCycle_behav/xsim.reloc",  (void **)funcTab, 110);
	iki_vhdl_file_variable_register(dp + 144000);
	iki_vhdl_file_variable_register(dp + 144056);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/SingleCycle_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/SingleCycle_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/SingleCycle_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/SingleCycle_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/SingleCycle_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
