----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2020 07:45:34 AM
-- Design Name: 
-- Module Name: Mips - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mips is
Port (
        clk, rst        : in std_logic
    );
end Mips;

architecture Behavioral of Mips is

----------------------------------------------------------------------
--  CONTROL UNIT COMPONENT
----------------------------------------------------------------------
    component ContUnit
        Port (                                                                          
                Opcode, Funct                   : in std_logic_vector(5 downto 0);      
                OverFlow, Zero, BGreat          : in std_logic;
                BLess, NotEq                    : in std_logic;               
                ALUControlD                     : out std_logic_vector(5 downto 0);
                JumpD                           : out std_logic_vector(1 downto 0);       
                ALUScrD, MemToRegD, RegDestD    : out std_logic_vector(1 downto 0); 
                Read1D, WHL                     : out std_logic_vector(1 downto 0);                                              
                MemWriteD, BranchDD             : out std_logic;                        
                We3D, BranchD, SignD            : out std_logic                         
        );               
    end component;

----------------------------------------------------------------------
    --  FETCH UNIT
    ----------------------------------------------------------------------
        component MuxTwoIn
            generic(N: integer);
            port(
                    In1, In2            : in std_logic_vector(N-1 downto 0);
                    selector            : in std_logic;
                    output              : out std_logic_vector(N-1 downto 0)
                );
        end component;
        
        component MUX3In
            generic(N: integer :=32);
                Port (
                        a, b, c : in std_logic_vector(N-1 downto 0);
                        o       : out std_logic_vector(N-1 downto 0);
                        s       : in std_logic_vector(1 downto 0) 
                    );
        end component;
        
        component Mux8In
            generic(N: integer :=32); 
                Port (
                        a, b, c, d, e, f, g, h  : in std_logic_vector(N-1 downto 0);
                        s                       : in std_logic_vector(2 downto 0);
                        o                       : out std_logic_vector(N-1 downto 0) 
                    );
        end component;
        
        component Mux4InBit
            Port (
                    in1, in2, in3, in4      : in std_logic_vector(31 downto 0);
                    output                  : out std_logic_vector(31 downto 0);
                    selector                : in std_logic_vector(1 downto 0)
                );
        end component; 
        
        component P_ProgramCount
            generic(N: integer := 32);
            Port (
                    dataIn          : in std_logic_vector(N-1 downto 0);
                    dataOut         : out std_logic_vector(N-1 downto 0);
                    clk, rst, StallF    : in std_logic
                );
        end component;
        
        component InstrMemory
            port(
                    Addr                       : in std_logic_vector(7 downto 2);
                    ReadData                   : out std_logic_vector(31 downto 0)
            );
        end component;
        
    ----------------------------------------------------------------------
        --  DECODE STAGE COMPONENTS
    ----------------------------------------------------------------------
        component D
            Port (
                    CLK, CLR, StallD        : in std_logic;
                    RD, PCPlus4F            : in std_logic_vector(31 downto 0);
                    InstrD, PCPlus4D        : out std_logic_vector(31 downto 0)
                );
        end component;
        
        component P_RegisterFile
            generic(N: integer :=32);
            Port (
                    clk,WE3              : in std_logic;
                    Addr1                : in std_logic_vector(4 downto 0);
                    Addr2                : in std_logic_vector(4 downto 0);
                    Addr3                : in std_logic_vector(4 downto 0);
                    WD3                  : in std_logic_vector(N-1 downto 0);
                    RD1                  : out std_logic_vector(N-1 downto 0);
                    RD2                  : out std_logic_vector(N-1 downto 0) 
                );
        end component;
        
        component HandLReg
            Port (
                    clk, weh, wel           : in std_logic;
                    Write                   : in std_logic_vector(31 downto 0);
                    ReadH, ReadL            : out std_logic_vector(31 downto 0) 
                );
        end component;
        
        component Comparator
            Port (
                    data1, data2        : in std_logic_vector(31 downto 0);
                    EqualD, NotEq, BGreat, Bless        : out std_logic;
                    lsb                 : in std_logic_vector(1 downto 0)
                 );
        end component;
        
        component SignExtension
            Port (
                    dataIn              : in std_logic_vector(15 downto 0);
                    dataout             : out std_logic_vector(31 downto 0) 
                );
        end component;
        
        component ZeroExt
            Port (
                    dataIn              : in std_logic_vector(15 downto 0);
                    dataout             : out std_logic_vector(31 downto 0) 
            );
        end component;
        
        component FillLow0
            Port (
                    dataIn          : in std_logic_vector(15 downto 0);
                    output          : out std_logic_vector(31 downto 0)
            );
        end component;
        
        component JumpInstr
            Port (
                    dataIn              : in std_logic_vector(25 downto 0);
                    output              : out std_logic_vector(27 downto 0) 
            );
        end component;    
        
        component Immediate4
            Port (
                    dataIn              : in std_logic_vector(29 downto 0);
                    output              : out std_logic_vector(31 downto 0)
            );
        end component;
        
    ----------------------------------------------------------------------
        --  EXECUTE STAGE COMPONENTS
    ----------------------------------------------------------------------
        component E
            Port (                                                                                                                                                                  
                                CLK, FlushE, MemWriteD, SignD, WeH      : in std_logic;                                                                                                         
                                RegWriteD, WeL                          : in std_logic;                                                                                                                                                                                                                                               
                                ALUControlD                             : in std_logic_vector(5 downto 0);                                                                                      
                                RsD, RtD, RdEIn, ShamtD                 : in std_logic_vector(4 downto 0);                                                                                      
                                RsE, RtE, RdE, ShamtE                   : out std_logic_vector(4 downto 0); 
                                ALUSrcD, RegDstD, MemtoRegD             : in std_logic_vector(1 downto 0);                                                                                  
                                ALUSrcE, RegDstE, MemtoRegE             : out std_logic_vector(1 downto 0);                                                                                     
                                MemWriteE, SignE, WeHE, WeLE            : out std_logic; 
                                RegWriteE                               : out std_logic;                                                                                                    
                                ALUControlE                             : out std_logic_vector(5 downto 0);                                                                                     
                                RD1In, RD2In, SignImmD, PCPlus4D        : in std_logic_vector(31 downto 0); 
                                ZeroImmD, LUpImD                        : in std_logic_vector(31 downto 0);                                                                                     
                                RD1, RD2, SignImmE, ZeroImmE, LUpImE    : out std_logic_vector(31 downto 0);
                                PCPlus4E                                : out std_logic_vector(31 downto 0)                                                        
                        );        
        end component;
        
        component P_FullALU
            Port ( 
                    data1, data2            : in std_logic_vector(31 downto 0);
                    funct                   : in std_logic_vector(5 downto 0);
                    Shamt, value            : in std_logic_vector(4 downto 0);
                    cout                    : out std_logic;
                    output                  : out std_logic_vector(31 downto 0)
                );
        end component;
        
        ----------------------------------------------------------------------
        --  MEMORY STAGE COMPONENTS
    ----------------------------------------------------------------------    
        component M
            Port (
                            CLK, RegWriteE, SignE                      : in std_logic; 
                            MemWriteE, WeHE, WeLE                      : in std_logic;
                            RegWriteM, SignM                           : out std_logic; 
                            MemWriteM, WeHM, WeLM                      : out std_logic;
                            MemtoRegE                                  : in std_logic_vector(1 downto 0);
                            MemtoRegM                                  : out std_logic_vector(1 downto 0);
                            ALUOutE, WriteDataE, LUpImE, SignImmE      : in std_logic_vector(31 downto 0);
                            ALUOutM, WriteDataM, LUpImM, SignImmM      : out std_logic_vector(31 downto 0);
                            PCPlus4E                                   : in std_logic_vector(31 downto 0);
                            PCPlus4M                                   : out std_logic_vector(31 downto 0);
                            WriteRegE, RsE                             : in std_logic_vector(4 downto 0);
                            WriteRegM, RsM                             : out std_logic_vector(4 downto 0)
                    );
        end component;
        
        component DataMem
            port(
                    clk, MemWrite, SignM        : in std_logic;
                    Addr                        : in std_logic_vector(7 downto 0); 
                    WriteData                   : in std_logic_vector(31 downto 0);
                    ReadData                    : out std_logic_vector(31 downto 0)
            );
        end component;
        
        ----------------------------------------------------------------------
        --  WRITEBACK STAGE COMPONENTS
    ----------------------------------------------------------------------    
        component W
           Port (
                           CLK, RegWriteM, WeLM, WeHM      : in std_logic;
                           RegWriteW, WeLW, WeHW           : out std_logic; 
                           MemtoRegM                       : in std_logic_vector(1 downto 0);
                           MemtoRegW                       : out std_logic_vector(1 downto 0);
                           RDM, LUpImM                     : in std_logic_vector(31 downto 0);
                           ReadDataW, LUpImW               : out std_logic_vector(31 downto 0);
                           ALUOutM, PCPlus4M               : in std_logic_vector(31 downto 0);
                           ALUOutW, PCPlus4W               : out std_logic_vector(31 downto 0);
                           WriteRegM                       : in std_logic_vector(4 downto 0);
                           WriteRegW                       : out std_logic_vector(4 downto 0)
                       );
        end component;
        
        ----------------------------------------------------------------------
        -- HAZARD UNIT
        ----------------------------------------------------------------------
        component HazardUnit
            Port (
                    SignImmM                            : in STD_LOGIC_vector(31 downto 0);
                    rsD, rtD, rsE, rtE, RsM             : in STD_LOGIC_vector(4 downto 0);
                    writeregE, writeregM, writeregW     : in STD_LOGIC_vector(4 downto 0);
                    memtoregW, memtoregM, memtoregE     : in std_logic_vector(1 downto 0);
                    forwardaD, forwardbD                : out std_logic_vector(1 downto 0);
                    regwriteE, regwriteM, regwriteW     : in std_logic;
                    memWriteM, MemWriteD, BranchDD      : in std_logic;
                    weHW                                : in std_logic;
                    weHM                                : in std_logic;
                    ForwardDataM                        : out std_logic;
                    forwardAE, ForwardBE, ForwardMA     : out std_logic_vector(1 downto 0);
                    ForwardPCF                          : out std_logic_vector(1 downto 0);
                    PCSrcF                              : in std_logic_vector(2 downto 0);
                    stallF, flushE                      : out std_logic;
                    ForwardLUA, ForwardLUB, CLRD        : out std_logic;
                    stallD                              : inout std_logic
                );
        end component;
        
        ----------------------------------------------------------------------
        --  SIGNALS
        ----------------------------------------------------------------------
        signal StallD, FlushE, StallF, CLRD, branchD, BranchDD : std_logic;
        signal branchDE, stallfE, clrdE                        : std_logic;
        signal RegWriteD, RegWriteE, RegWriteM, RegWriteW      : std_logic;
        signal MemWriteD, MemWriteE, MemWriteM                 : std_logic;        
        signal SignD, SignE, SignM, WeHW, WeLM, WeHM, WeLW     : std_logic;
        signal weH, weL, overFlowE, WeHE, WeLE                 : std_logic;
        signal EqualD, NotEq, BGreat, BLess                    : std_logic;
        signal ForwardDataM                                    : std_logic;
        signal ForwardLUA, ForwardLUB                          : std_logic;
        
        signal ForwardAD, ForwardBD                            : std_logic_vector(1 downto 0); 
        signal ForwardPCF, ForwardAE, ForwardBE,  ForwardMA    : std_logic_vector(1 downto 0);
        signal RegDstD, RegDstE, ALUSrcE, ALUSrcD              : std_logic_vector(1 downto 0);
        signal Read1D, WHL, JumpD, opcodelsb                   : std_logic_vector(1 downto 0);        
        signal MemtoRegD, MemtoRegE, MemtoRegM,  MemtoRegW     : std_logic_vector(1 downto 0);
        
        signal PCSrcF                                          : std_logic_vector(2 downto 0);
        
        signal WriteRegE, WriteRegM, WriteRegW                 : std_logic_vector(4 downto 0);
        signal RdE, RsD, RsE, RsM, RtE, RtD                    : std_logic_vector(4 downto 0);
        signal ShamtE, Addr1, Addr2                            : std_logic_vector(4 downto 0);
        
        signal ALUControlD, functE                             : std_logic_vector(5 downto 0);
        
        signal instrShifted                                    : std_logic_vector(27 downto 0);
        
        signal PCPrimeF1, PCPrimeF, PCF, PCPlus4F, PCPlus4D    : std_logic_vector(31 downto 0);
        signal PCPlus4E, PCPlus4M, PCPlus4W, RDF, InstrD       : std_logic_vector(31 downto 0);
        signal RD1, RD1InD, RD2InD, RD1E, RD2E                 : std_logic_vector(31 downto 0);
        signal ReadH, ReadL, DataM, toDataMem                  : std_logic_vector(31 downto 0);
        signal SrcAE, SrcBEPrimeE, SrcBE, A, B                 : std_logic_vector(31 downto 0);
        signal ALUOutE, ALUOutM, ALUOutW, WriteDataM           : std_logic_vector(31 downto 0);
        signal resuldW, RDM, ReadDataW, DataMemAddr            : std_logic_vector(31 downto 0);
        signal DataMAddrLUIAE, DataMAddrLUIBE                  : std_logic_vector(31 downto 0);
        signal SignImmD, SignImmE, SignImmM                    : std_logic_vector(31 downto 0);
        signal LUpImD, LUpImE, LUpImM, LUpImW                  : std_logic_vector(31 downto 0);
        signal ZeroImmD, ZeroImmE                              : std_logic_vector(31 downto 0);
        signal PCBranchD, PCBranchE, stfOut, JumpSrcD          : std_logic_vector(31 downto 0);
        
        signal unPCF, unPCPlus4                                : unsigned(31 downto 0);
        signal undata4, undata3, output1                       : unsigned(31 downto 0);
    
    -----------------------------------------------------------------------
    -- CODE
    -----------------------------------------------------------------------

begin
----------------------------------------------------------------------
    --  CONTROLS
----------------------------------------------------------------------
    Controls: ContUnit
        port map(
             Opcode        => InstrD(31 downto 26),
             Funct         => InstrD(5 downto 0),
             OverFlow      => OverFlowE,
             Zero          => EqualD,
             BGreat        => BGreat,
             BLess         => BLess,
             NotEq         => NotEq,
             ALUControlD   => ALUControlD,
             ALUScrD       => ALUSrcD,
             JumpD         => JumpD,
             MemToRegD     => MemToRegD,
             MemWriteD     => MemWriteD,
             RegDestD      => RegDstD,
             We3D          => RegWriteD,
             branchD       => branchD,
             SignD         => SignD,
             Read1D        => Read1D,
             WHL           => WHL,
             BranchDD      => BranchDD
        );

----------------------------------------------------------------------
   --  FETCH STAGE
----------------------------------------------------------------------
    
   PCSrcF <= JumpD & branchD;                
   PCSource: Mux8In
       generic map(32)
       port map(
                   a       => PCPlus4F,
                   b       => PCBranchD,
                   c       => JumpSrcD,
                   d       => PCBranchD,
                   e       => A,
                   f       => PCPlus4F,
                   g       => PCPlus4F,
                   h       => PCPlus4F,
                   s       => PCSrcF,
                   o       => PCPrimeF1
               );
   
   ForwardPCPlus4: Mux3In
       generic map(32)
       port map(
                   a       => PCPrimeF1,
                   b       => PCPlus4M,
                   c       => PCPlus4W,
                   s       => ForwardPCF,
                   o       => PCPrimeF
               );    
               
   PC: P_ProgramCount
       generic map(32)
       port map(
                   clk         => CLK,
                   rst         => RST,
                   StallF      => StallF,
                   dataIn      => PCPrimeF,
                   dataOut     => PCF
               );
   
   unPCF <= unsigned(PCF);
   unPCPlus4 <= unPCF + X"4";            
   PCPlus4F <= std_logic_vector(unPCPlus4);
  
   InstructionMemory: InstrMemory
       port map(
                   Addr        => PCF(7 downto 2),
                   ReadData    => RDF
               );  

---------------------------------------------------------------------
   --  DECODE STAGE
---------------------------------------------------------------------                
   D_Stage: D
       port map(
                   clk         => clk,
                   clr         => ClrD,
                   StallD      => StallD,
                   RD          => RDF,
                   PCPlus4F    => PCPlus4F,
                   InstrD      => InstrD,
                   PCPlus4D    => PCPlus4D
               );               
   
   Addr1 <= InstrD(25 downto 21);
   Addr2 <= InstrD(20 downto 16); 
   opcodelsb <= InstrD(27 downto 26);              
   RegisterFile: P_RegisterFile
       generic map(32)
       port map(
                   clk     => clk,
                   we3     => RegWriteW,
                   addr1   => Addr1,
                   addr2   => Addr2,
                   addr3   => WriteRegW,
                   wd3     => resuldW,
                   rd1     => RD1,
                   rd2     => RD2InD
               );  
   
   weH <= WHL(1);
   weL <= WHL(0);            
   HandLRegisters: HandLReg
       port map(
                   clk         => clk,
                   weH         => weHW,
                   weL         => weLW,
                   Write       => resuldW,
                   ReadH       => ReadH,
                   ReadL       => ReadL
               );            
               
   ReadReg1: MUX3In
       generic map(32)
       port map(
                   a       => RD1,
                   b       => ReadH,
                   c       => ReadL,
                   s       => Read1D, 
                   o       => RD1InD
               );  

   CheckBranchA: MUX3In
       generic map(32)
       port map(
                   a       => RD1InD,
                   b       => ALUOutM,
                   c       => ALUOutE,
                   s       => ForwardAD, 
                   o       => A
               );                                                                      
   
   CheckBranchB: MUX3In
        generic map(32)
        port map(
                    a       => RD2InD,
                    b       => ALUOutM,
                    c       => ALUOutE,
                    s       => ForwardBD, 
                    o       => B
                );              
       
   Check: Comparator
       port map(
                   data1       => A,
                   data2       => B,
                   EqualD      => EqualD, 
                   NotEq       => NotEq, 
                   BGreat      => BGreat, 
                   Bless       => Bless,
                   lsb         => opcodelsb
               );
       
   SignExtend: SignExtension
       port map(
                   dataIn    => InstrD(15 downto 0),
                   dataout   => SignImmD
               );  
               
    ZeroExtend: ZeroExt
       port map(
                   dataIn    => InstrD(15 downto 0),
                   dataOut   => ZeroImmD
               ); 
               
   LoadUpImmediate: FillLow0
       port map(
                   dataIn    => InstrD(15 downto 0),
                   output    => LUpImD
               );
               
   JumpAddress: JumpInstr
       port map(
                   dataIn     => InstrD(25 downto 0),
                   output     => instrShifted
               );                     
               
   JumpSrcD <= PCPlus4D(31 downto 28) & instrShifted;                                 
               
   Immediate_By_Four: Immediate4
       port map(
                   dataIn    => SignImmD(29 downto 0),
                   output    => stfOut
               );  
               
   undata3 <= unsigned(stfOut); 
   undata4 <= unsigned(PCPlus4D);            
   output1 <= undata3 + undata4; 
   PCBranchD <= std_logic_vector(output1);        
   
   ----------------------------------------------------------------------
   --  EXECUTE STAGE
---------------------------------------------------------------------
   RsD <= InstrD(25 downto 21);
   RtD <= InstrD(20 downto 16);
   E_Stage: E
       port map(
                   CLK         => CLK,
                   FlushE      => FlushE,
                   RsD         => RsD,
                   RtD         => RtD,
                   ALUSrcD     => ALUSrcD,
                   MemWriteD   => MemWriteD,
                   MemWriteE   => MemWriteE,
                   SignD       => SignD,
                   SignE       => SignE,
                   RegWriteD   => RegWriteD,
                   MemtoRegE   => MemtoRegE,
                   SignImmD    => SignImmD,
                   SignImmE    => SignImmE,
                   ZeroImmD    => ZeroImmD,
                   ZeroImmE    => ZeroImmE,
                   LUpImD      => LUpImD,
                   LUpImE      => LUpImE,
                   PCPlus4D    => PCPlus4D,
                   PCPlus4E    => PCPlus4E,
                   RdEIn       => InstrD(15 downto 11),
                   RegDstD     => RegDstD,
                   RegDstE     => RegDstE,
                   MemtoRegD   => MemtoRegD,
                   ALUControlD => ALUControlD,
                   RsE         => RsE,
                   RtE         => RtE,
                   RegWriteE   => RegWriteE,
                   ALUSrcE     => ALUSrcE,
                   RdE         => RdE,
                   ALUControlE => FunctE,
                   RD1In       => RD1InD,
                   RD2In       => RD2InD,
                   RD1         => RD1E,
                   RD2         => RD2E,
                   ShamtD      => InstrD(10 downto 6),
                   ShamtE      => ShamtE, 
                   WeH         => WeH,
                   WeL         => WeL,
                   WeHE        => WeHE,
                   WeLE        => WeLE   
               );
   
   RegisterDes: MUX3In
       generic map(5)
       port map(
                   a       => RtE,
                   b       => RdE,
                   c       => "11111",
                   s       => RegDstE,
                   o       => WriteRegE
               );
   
   ForwardLUIAE: MuxTwoIn
       generic map(32)
       port map(
                   In1         => DataMemAddr,
                   In2         => LUpImM,
                   selector    => ForwardLUA,
                   output      => DataMAddrLUIAE
               );
      
   ForwardA_Mux: Mux4InBit
       port map(
                   In1       => RD1E,
                   In2       => resuldW,
                   In3       => DataMAddrLUIAE,
                   In4       => DataM,
                   selector  => ForwardAE,
                   Output    => SrcAE
               );
               
   ForwardLUIBE: MuxTwoIn
       generic map(32)
       port map(
                   In1         => DataMemAddr,
                   In2         => LUpImM,
                   selector    => ForwardLUB,
                   output      => DataMAddrLUIBE
               );                                   
       
   ForwardB_Mux: Mux4InBit
       port map(
                   In1       => RD2E,
                   In2       => resuldW,
                   In3       => DataMAddrLUIBE,
                   In4       => DataM,
                   selector  => ForwardBE,
                   Output    => SrcBEPrimeE
               );                       
               
   ALUSourceB: MUX3In
       generic map(32)
       port map(
                   a       => SrcBEPrimeE,
                   b       => SignImmE,
                   c       => ZeroImmE,
                   s       => ALUSrcE,
                   o       => SrcBE     
               );                       
               
   ALU: P_FullALU
       port map(
                   data1         => SrcAE,
                   data2         => SrcBE,
                   funct         => functE,
                   Shamt         => ShamtE,
                   value         => SrcAE(4 downto 0),
                   cout          => overFlowE,
                   output        => ALUOutE
               );  
               
   ----------------------------------------------------------------------
 --  MEMORY STAGE
---------------------------------------------------------------------
   M_Stage: M
       port map(
                   CLK         => CLK,
                   RegWriteE   => RegWriteE,
                   MemtoRegE   => MemtoRegE,
                   MemWriteE   => MemWriteE,
                   SignE       => SignE,
                   SignM       => SignM,
                   RegWriteM   => RegWriteM,
                   MemtoRegM   => MemtoRegM,
                   MemWriteM   => MemWriteM,
                   ALUOutE     => ALUOutE,
                   WriteDataE  => SrcBEPrimeE,
                   ALUOutM     => ALUOutM,
                   WriteDataM  => WriteDataM,
                   WriteRegE   => WriteRegE,
                   WriteRegM   => WriteRegM,
                   LUpImE      => LUpImE,
                   LUpImM      => LUpImM, 
                   SignImmE    => SignImmE,
                   SignImmM    => SignImmM,
                   PCPlus4E    => PCPlus4E,
                   PCPlus4M    => PCPlus4M,
                   RsE         => RsE,
                   RsM         => RsM,
                   WeHE        => WeHE,
                   WeLE        => WeLE,
                   WeHM        => WeHM,
                   WeLM        => WeLM
               );         
               
   ForwardLoadAddr: MUX3In
       generic map(32)
       port map(
                   a       => ALUOutM,
                   b       => SignImmM,
                   c       => resuldW,
                   s       => ForwardMA,
                   o       => DataMemAddr     
               ); 
               
   ForwardWrit: MuxTwoIn
       generic map(32)
       port map(
                   In1         => WriteDataM,
                   In2         => resuldW,
                   selector    => ForwardDataM,
                   output      => DataM
               );                     
               
   DataMemoy: DataMem
       port map(
                   clk         => clk,
                   MemWrite    => MemWriteM,
                   SignM       => SignM,
                   Addr        => DataMemAddr(7 downto 0),
                   WriteData   => DataM,
                   ReadData    => RDM
               );            
               
---------------------------------------------------------------------
--  WRITEBACK STAGE
---------------------------------------------------------------------
   WRITEBACK_STAGE: W
       port map(
                   CLK         => CLK,
                   RegWriteM   => RegWriteM,
                   MemtoRegM   => MemtoRegM,
                   RegWriteW   => RegWriteW,
                   MemtoRegW   => MemtoRegW,
                   RDM         => RDM,
                   ReadDataW   => ReadDataW,
                   ALUOutM     => DataMemAddr,
                   ALUOutW     => ALUOutW,
                   PCPlus4M    => PCPlus4M,
                   PCPlus4W    => PCPlus4W,
                   WriteRegM   => WriteRegM,
                   WriteRegW   => WriteRegW,
                   LUpImM      => LUpImM,
                   LUpImW      => LUpImW,
                   WeLM        => WeLM,
                   WeHM        => WeHM,
                   WeLW        => WeLW,
                   WeHW        => WeHW
               );
   
   Write_Source: Mux4InBit
       port map(
                   In1       => ALUOutW,
                   In2       => ReadDataW,
                   In3       => PCPlus4W,
                   In4       => LUpImW,
                   selector  => MemtoRegW,
                   Output    => resuldW
               );         
   
   Hazard_Unit: HazardUnit
       port map(
                   SignImmM    => SignImmM,
                   RsE         => RsE,
                   RtE         => RtE,
                   RsM         => RsM,
                   RsD         => InstrD(25 downto 21),
                   RtD         => InstrD(20 downto 16),
                   WriteRegM   => WriteRegM,
                   WriteRegW   => WriteRegW,
                   RegWriteM   => RegWriteM,
                   RegWriteW   => RegWriteW,
                   ForwardAE   => ForwardAE,
                   ForwardBE   => ForwardBE,
                   MemtoRegE   => MemtoRegE,
                   StallF      => StallF,
                   StallD      => StallD,
                   FlushE      => FlushE,
                   CLRD        => CLRD,
                   ForwardAD   => ForwardAD,
                   ForwardBD   => ForwardBD,
                   WriteRegE   => WriteRegE,
                   BranchDD     => BranchDD,
                   MemtoRegM   => MemtoRegM,
                   RegWriteE   => RegWriteE,
                   ForwardMA   => ForwardMA,
                   MemWriteD   => MemWriteD,
                   memWriteM   => memWriteM,
                   memtoregW   => memtoregW,
                   ForwardPCF  => ForwardPCF,
                   ForwardDataM    => ForwardDataM,
                   ForwardLUA   => ForwardLUA,
                   ForwardLUB   => ForwardLUB,
                   PCSrcF       => PCSrcF, 
                   weHM         => weHM,
                   weHW         => weHW
               );                                                                                                                                                                            

end Behavioral;
