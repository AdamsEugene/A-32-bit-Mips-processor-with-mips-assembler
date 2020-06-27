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
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_35(char*, char *);
extern void execute_39(char*, char *);
extern void execute_43(char*, char *);
extern void execute_44(char*, char *);
extern void execute_59(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_26(char*, char *);
extern void execute_29(char*, char *);
extern void execute_32(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_42(char*, char *);
extern void execute_47(char*, char *);
extern void execute_48(char*, char *);
extern void execute_51(char*, char *);
extern void execute_53(char*, char *);
extern void execute_55(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_61(char*, char *);
extern void execute_70(char*, char *);
extern void execute_72(char*, char *);
extern void execute_83(char*, char *);
extern void execute_86(char*, char *);
extern void execute_89(char*, char *);
extern void execute_92(char*, char *);
extern void execute_95(char*, char *);
extern void execute_98(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_108(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_116(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_126(char*, char *);
extern void execute_127(char*, char *);
extern void execute_128(char*, char *);
extern void execute_129(char*, char *);
extern void execute_702(char*, char *);
extern void execute_798(char*, char *);
extern void execute_894(char*, char *);
extern void execute_990(char*, char *);
extern void execute_1085(char*, char *);
extern void execute_1134(char*, char *);
extern void execute_1225(char*, char *);
extern void execute_1228(char*, char *);
extern void execute_1231(char*, char *);
extern void execute_1234(char*, char *);
extern void execute_1235(char*, char *);
extern void execute_1236(char*, char *);
extern void execute_1237(char*, char *);
extern void execute_1239(char*, char *);
extern void execute_1243(char*, char *);
extern void execute_1250(char*, char *);
extern void execute_1252(char*, char *);
extern void execute_1258(char*, char *);
extern void execute_1261(char*, char *);
extern void execute_1265(char*, char *);
extern void execute_1266(char*, char *);
extern void execute_1267(char*, char *);
extern void execute_1268(char*, char *);
extern void execute_1269(char*, char *);
extern void execute_1270(char*, char *);
extern void execute_1271(char*, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[80] = {(funcp)execute_27, (funcp)execute_33, (funcp)execute_34, (funcp)execute_35, (funcp)execute_39, (funcp)execute_43, (funcp)execute_44, (funcp)execute_59, (funcp)execute_62, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_26, (funcp)execute_29, (funcp)execute_32, (funcp)execute_37, (funcp)execute_38, (funcp)execute_42, (funcp)execute_47, (funcp)execute_48, (funcp)execute_51, (funcp)execute_53, (funcp)execute_55, (funcp)execute_57, (funcp)execute_58, (funcp)execute_61, (funcp)execute_70, (funcp)execute_72, (funcp)execute_83, (funcp)execute_86, (funcp)execute_89, (funcp)execute_92, (funcp)execute_95, (funcp)execute_98, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_111, (funcp)execute_112, (funcp)execute_113, (funcp)execute_116, (funcp)execute_117, (funcp)execute_118, (funcp)execute_126, (funcp)execute_127, (funcp)execute_128, (funcp)execute_129, (funcp)execute_702, (funcp)execute_798, (funcp)execute_894, (funcp)execute_990, (funcp)execute_1085, (funcp)execute_1134, (funcp)execute_1225, (funcp)execute_1228, (funcp)execute_1231, (funcp)execute_1234, (funcp)execute_1235, (funcp)execute_1236, (funcp)execute_1237, (funcp)execute_1239, (funcp)execute_1243, (funcp)execute_1250, (funcp)execute_1252, (funcp)execute_1258, (funcp)execute_1261, (funcp)execute_1265, (funcp)execute_1266, (funcp)execute_1267, (funcp)execute_1268, (funcp)execute_1269, (funcp)execute_1270, (funcp)execute_1271, (funcp)transaction_1, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 80;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Mips_Pipelining_behav/xsim.reloc",  (void **)funcTab, 80);
	iki_vhdl_file_variable_register(dp + 110088);
	iki_vhdl_file_variable_register(dp + 110144);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Mips_Pipelining_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Mips_Pipelining_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/Mips_Pipelining_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Mips_Pipelining_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Mips_Pipelining_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
