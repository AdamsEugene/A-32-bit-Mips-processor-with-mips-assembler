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
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_34(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_42(char*, char *);
extern void execute_44(char*, char *);
extern void execute_107(char*, char *);
extern void execute_202(char*, char *);
extern void execute_207(char*, char *);
extern void execute_210(char*, char *);
extern void execute_213(char*, char *);
extern void execute_216(char*, char *);
extern void execute_219(char*, char *);
extern void execute_222(char*, char *);
extern void execute_227(char*, char *);
extern void execute_230(char*, char *);
extern void execute_233(char*, char *);
extern void execute_236(char*, char *);
extern void execute_239(char*, char *);
extern void execute_242(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_247(char*, char *);
extern void execute_250(char*, char *);
extern void execute_251(char*, char *);
extern void execute_252(char*, char *);
extern void execute_255(char*, char *);
extern void execute_256(char*, char *);
extern void execute_257(char*, char *);
extern void execute_260(char*, char *);
extern void execute_261(char*, char *);
extern void execute_262(char*, char *);
extern void execute_270(char*, char *);
extern void execute_271(char*, char *);
extern void execute_272(char*, char *);
extern void execute_273(char*, char *);
extern void execute_457(char*, char *);
extern void execute_458(char*, char *);
extern void execute_459(char*, char *);
extern void execute_460(char*, char *);
extern void execute_463(char*, char *);
extern void execute_464(char*, char *);
extern void execute_465(char*, char *);
extern void execute_466(char*, char *);
extern void execute_570(char*, char *);
extern void execute_666(char*, char *);
extern void execute_762(char*, char *);
extern void execute_857(char*, char *);
extern void execute_906(char*, char *);
extern void execute_1003(char*, char *);
extern void execute_1006(char*, char *);
extern void execute_1007(char*, char *);
extern void execute_1008(char*, char *);
extern void execute_1009(char*, char *);
extern void execute_1020(char*, char *);
extern void execute_1023(char*, char *);
extern void execute_1026(char*, char *);
extern void execute_1027(char*, char *);
extern void execute_1028(char*, char *);
extern void execute_1029(char*, char *);
extern void execute_1030(char*, char *);
extern void execute_1031(char*, char *);
extern void execute_1034(char*, char *);
extern void execute_1035(char*, char *);
extern void execute_1036(char*, char *);
extern void execute_1039(char*, char *);
extern void execute_1040(char*, char *);
extern void execute_1041(char*, char *);
extern void execute_1042(char*, char *);
extern void execute_1045(char*, char *);
extern void execute_1046(char*, char *);
extern void execute_1055(char*, char *);
extern void execute_1060(char*, char *);
extern void execute_1063(char*, char *);
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
funcp funcTab[110] = {(funcp)execute_17, (funcp)execute_18, (funcp)execute_19, (funcp)execute_34, (funcp)execute_37, (funcp)execute_38, (funcp)execute_42, (funcp)execute_44, (funcp)execute_107, (funcp)execute_202, (funcp)execute_207, (funcp)execute_210, (funcp)execute_213, (funcp)execute_216, (funcp)execute_219, (funcp)execute_222, (funcp)execute_227, (funcp)execute_230, (funcp)execute_233, (funcp)execute_236, (funcp)execute_239, (funcp)execute_242, (funcp)execute_245, (funcp)execute_246, (funcp)execute_247, (funcp)execute_250, (funcp)execute_251, (funcp)execute_252, (funcp)execute_255, (funcp)execute_256, (funcp)execute_257, (funcp)execute_260, (funcp)execute_261, (funcp)execute_262, (funcp)execute_270, (funcp)execute_271, (funcp)execute_272, (funcp)execute_273, (funcp)execute_457, (funcp)execute_458, (funcp)execute_459, (funcp)execute_460, (funcp)execute_463, (funcp)execute_464, (funcp)execute_465, (funcp)execute_466, (funcp)execute_570, (funcp)execute_666, (funcp)execute_762, (funcp)execute_857, (funcp)execute_906, (funcp)execute_1003, (funcp)execute_1006, (funcp)execute_1007, (funcp)execute_1008, (funcp)execute_1009, (funcp)execute_1020, (funcp)execute_1023, (funcp)execute_1026, (funcp)execute_1027, (funcp)execute_1028, (funcp)execute_1029, (funcp)execute_1030, (funcp)execute_1031, (funcp)execute_1034, (funcp)execute_1035, (funcp)execute_1036, (funcp)execute_1039, (funcp)execute_1040, (funcp)execute_1041, (funcp)execute_1042, (funcp)execute_1045, (funcp)execute_1046, (funcp)execute_1055, (funcp)execute_1060, (funcp)execute_1063, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_42, (funcp)transaction_43, (funcp)transaction_44, (funcp)transaction_45, (funcp)transaction_46, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_58, (funcp)transaction_59, (funcp)transaction_60, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_67, (funcp)transaction_68, (funcp)transaction_69, (funcp)transaction_70, (funcp)transaction_71, (funcp)transaction_72, (funcp)transaction_73};
const int NumRelocateId= 110;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/SSP_behav/xsim.reloc",  (void **)funcTab, 110);
	iki_vhdl_file_variable_register(dp + 144000);
	iki_vhdl_file_variable_register(dp + 144056);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/SSP_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/SSP_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/SSP_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/SSP_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/SSP_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
