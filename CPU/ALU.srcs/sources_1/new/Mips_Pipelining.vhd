----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2020 09:48:56 PM
-- Design Name: 
-- Module Name: Mips_Pipelining - Behavioral
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

entity Mips_Pipelining is
Port (
        RST, CLk    : in std_logic 
    );
end Mips_Pipelining;

architecture Behavioral of Mips_Pipelining is
----------------------------------------------------------------------
--  CONTROL UNIT COMPONENT
----------------------------------------------------------------------
    component ContUnit
        Port (
                Opcode, Funct            : in std_logic_vector(5 downto 0);
                OverFlow, Zero, BGreat   : in std_logic; 
                BLess, NotEq             : in std_logic;
                ALUControl               : out std_logic_vector(5 downto 0);
                ALUScr                   : out std_logic_vector(1 downto 0);
                Data2Select, Jump        : out std_logic; 
                ImmALUCont, MemToReg     : out std_logic; 
                MemWrite, RegDest        : out std_logic; 
                We3, PCSrc               : out std_logic        
        );
    end component;
    
    ----------------------------------------------------------------------
    --  FETCH STAGE COMPONENTS
    ----------------------------------------------------------------------
    component MuxTwoIn
        generic(N: integer);
        port(
                In1, In2            : in std_logic_vector(N-1 downto 0);
                selector            : in std_logic;
                output              : out std_logic_vector(N-1 downto 0)
            );
    end component;
    
    component P_ProgramCount
        generic(N: integer := 32);
        Port (
                dataIn          : in std_logic_vector(N-1 downto 0);
                dataOut         : out std_logic_vector(N-1 downto 0);
                clk, rst, StallF        : in std_logic
            );
    end component;
    
    component InstrMemory
        port(
                Addr                       : in std_logic_vector(31 downto 0);
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
    
    component Comparator
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                EqualD, NotEq, BGreat, Bless        : out std_logic
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
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0)
        );
    end component;
    
----------------------------------------------------------------------
    --  EXECUTE STAGE COMPONENTS
----------------------------------------------------------------------
    component E
        Port (                                                                                                                               
                CLK, FlushE, MemWriteD                  : in std_logic;                                                                      
                RegWriteD, ImOrAluD                     : in std_logic;                                                                      
                RegDstD, MemtoRegD, data2SelectorD      : in std_logic;                                                                      
                ALUControlD                             : in std_logic_vector(5 downto 0);                                                   
                RsD, RtD, RdEIn, ShamtD                 : in std_logic_vector(4 downto 0);                                                   
                RsE, RtE, RdE, ShamtE                   : out std_logic_vector(4 downto 0); 
                ALUSrcD                                 : in std_logic_vector(1 downto 0);                                                 
                ALUSrcE                                 : out std_logic_vector(1 downto 0);                                                  
                MemtoRegE, MemWriteE, RegDstE           : out std_logic; 
                RegWriteE, ImOrAluE, data2SelectorE     : out std_logic;                                                                   
                ALUControlE                             : out std_logic_vector(5 downto 0);                                                  
                RD1In, RD2In, SignImmD                  : in std_logic_vector(31 downto 0); 
                ZeroImmD, LUpImD                        : in std_logic_vector(31 downto 0);                                                  
                RD1, RD2, SignImmE, ZeroImmE, LUpImE    : out std_logic_vector(31 downto 0)                                                  
        );        
    end component;
    
    component Mux4InBit
            Port (
                    In1, In2, In3, In4      : in std_logic_vector(31 downto 0);
                    selector                : in std_logic_vector(1 downto 0);
                    output                  : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component P_FullALU
        Port ( 
                data1, data2            : in std_logic_vector(31 downto 0);
                data2Selector           : in std_logic; 
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
                CLK, RegWriteE, MemtoRegE                  : in std_logic; 
                MemWriteE, ImOrAluE                        : in std_logic;
                RegWriteM, MemtoRegM                       : out std_logic; 
                MemWriteM, ImOrAluM                        : out std_logic;
                ALUOutE, WriteDataE, LUpImE, SignImmE      : in std_logic_vector(31 downto 0);
                ALUOutM, WriteDataM, LUpImM, SignImmM      : out std_logic_vector(31 downto 0);
                WriteRegE, RsE                             : in std_logic_vector(4 downto 0);
                WriteRegM, RsM                             : out std_logic_vector(4 downto 0)
        );
    end component;
    
    component DataMem
        port(
                clk, MemWrite               : in std_logic;
                Addr, WriteData             : in std_logic_vector(31 downto 0);
                ReadData                    : out std_logic_vector(31 downto 0)
        );
    end component;
    
    ----------------------------------------------------------------------
    --  WRITEBACK STAGE COMPONENTS
----------------------------------------------------------------------    
    component W
        Port (
                CLK, RegWriteM, MemtoRegM       : in std_logic;
                RegWriteW, MemtoRegW            : out std_logic; 
                RDM                             : in std_logic_vector(31 downto 0);
                ReadDataW                       : out std_logic_vector(31 downto 0);
                ALUOutM                         : in std_logic_vector(31 downto 0);
                ALUOutW                         : out std_logic_vector(31 downto 0);
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
                ALUSrcD, ALUSrcE                    : in std_logic_vector(1 downto 0);
                regwriteE, regwriteM, regwriteW     : in std_logic;
                memtoregE, memtoregM, branchD       : in std_logic;
                memWriteM, memtoregW                : in std_logic;
                forwardaD, forwardbD, ForwardDataM  : out std_logic;
                forwardaE, forwardbE, ForwardMA     : out std_logic_vector(1 downto 0);
                stallF, flushE                      : out std_logic;
                stallD                              : inout std_logic
            );
    end component;
    
    ----------------------------------------------------------------------
    --  SIGNALS
    ----------------------------------------------------------------------
    signal StallD, FlushE, MemWriteD, RegDstD, MemtoRegD: std_logic;
    signal RegWriteD, BGreat, BLess, CLRD               : std_logic;
    signal MemtoRegM, MemWriteM, NotEq, ImmALUContD     : std_logic;        
    signal ImOrAluE, StallF, data2SelectorE             : std_logic;
    signal MemtoRegE, MemWriteE, RegWriteM              : std_logic;
    signal RegDstE, ForwardAD, ForwardBD                : std_logic;
    signal RegWriteE, data2SelectorD, ForwardDataM      : std_logic;
    signal RegWriteW, MemtoRegW, overFlow, PCSrc        : std_logic;
    signal EqualD, ImOrAluM, JumpD                      : std_logic;
    signal ForwardAE, ForwardBE, ForwardMA              : std_logic_vector(1 downto 0);
    signal ALUSrcE, ALUSrcD, PCSrcF                     : std_logic_vector(1 downto 0);
    signal WriteRegE, WriteRegM, WriteRegW              : std_logic_vector(4 downto 0);
    signal RdE, RsE, RsM, Addr1, Addr2                  : std_logic_vector(4 downto 0);
    signal RtE, ShamtE, RsD, RtD                        : std_logic_vector(4 downto 0);
    signal ALUControlD, funct                           : std_logic_vector(5 downto 0);
    signal instrShifted                                 : std_logic_vector(27 downto 0);
    signal PCPlus4D, InstrD, RD, PCPlus4F               : std_logic_vector(31 downto 0);
    signal RD1In, RD2In, stfOut, resuldW                : std_logic_vector(31 downto 0);
    signal RD1, RD2, ALUOutE, DataM                     : std_logic_vector(31 downto 0);
    signal  WriteDataM, ALUOutM, SignImmE, toDataMem    : std_logic_vector(31 downto 0);
    signal RDM, ReadDataW, ALUOutW, PCPrime, DataMemAddr: std_logic_vector(31 downto 0);
    signal PCF, PCBranchD, SignImmD, LUpImD, SignImmM   : std_logic_vector(31 downto 0);
    signal SrcAE, SrcBE, SrcBEPrime, A, B, ZeroImmD     : std_logic_vector(31 downto 0);
    signal ZeroImmE, LUpImE, LUpImM, JumpSrcD           : std_logic_vector(31 downto 0);
    signal undata1, outputs                             : unsigned(31 downto 0);
    signal undata4, undata3, output1                    : unsigned(31 downto 0);
    
begin
 ----------------------------------------------------------------------
    --  CODES
 ----------------------------------------------------------------------
 
 ----------------------------------------------------------------------
    --  CONTROLS
 ----------------------------------------------------------------------
    Controls: ContUnit
        port map(
                    Opcode        => InstrD(31 downto 26),
                    Funct         => InstrD(5 downto 0),
                    OverFlow      => OverFlow,
                    Zero          => EqualD,
                    BGreat        => BGreat,
                    BLess         => BLess,
                    NotEq         => NotEq,
                    ALUControl    => ALUControlD,
                    ALUScr        => ALUSrcD,
                    Jump          => JumpD,
                    data2Select   => data2SelectorD,
                    ImmALUCont    => ImmALUContD,
                    MemToReg      => MemToRegD,
                    MemWrite      => MemWriteD,
                    RegDest       => RegDstD,
                    We3           => RegWriteD,
                    PCSrc         => PCSrc
                );

 ----------------------------------------------------------------------
    --  FETCH STAGE
 ----------------------------------------------------------------------
    PCSrcF <= JumpD & PCSrc;
    
    PC_Source: Mux4InBit
        port map(
                    In1         => PCPlus4F,
                    In2         => PCBranchD,
                    In3         => JumpSrcD, 
                    In4         => RD1In,
                    selector    => PCSrcF,
                    output      => PCPrime
                );
    P_C: P_ProgramCount
        port map(   
                    clk        => clk,
                    rst        => rst,
                    StallF     => StallF,
                    dataIn     => PCPrime,
                    dataOut    => PCF
                );
                
    undata1 <= unsigned(PCF);
    outputs <= undata1 + X"4";            
    PCPlus4F <= std_logic_vector(outputs);            
    
    InstrMem: InstrMemory
        port map(
                    addr            => PCF,
                    ReadData        => RD
                );            
                
----------------------------------------------------------------------
    --  DECODE STAGE
----------------------------------------------------------------------
    CLRD <= PCSrcF(0) or PCSrcF(1);
    
    DECODE_STAGE: D
        port map(
                    CLK         => CLK,
                    CLR         => CLRD,
                    StallD      => StallD,
                    RD          => RD,
                    PCPlus4F    => PCPlus4F,
                    InstrD      => InstrD,
                    PCPlus4D    => PCPlus4D
                );
    Addr1 <= InstrD(25 downto 21);
    Addr2 <= InstrD(20 downto 16);          
    Register_File: P_RegisterFile
        port map(
                    clk       => clk,
                    WE3       => RegWriteW,
                    Addr1     => Addr1,
                    Addr2     => Addr2,
                    Addr3     => WriteRegW,
                    WD3       => resuldW,
                    RD1       => RD1In,
                    RD2       => RD2In
                );  
                
--     Eq_SourceA: MuxTwoIn
--        generic map(32)
--        port map(
--                    In1             => RD1In,
--                    In2             => DataMemIn,
--                    selector        => ForwardAD,
--                    output          => A
--                );      
                
--    Eq_SourceB: MuxTwoIn
--        generic map(32)
--        port map(
--                    In1             => RD2In,
--                    In2             => DataMemIn,
--                    selector        => ForwardBD,
--                    output          => B
--                );
                
--     Comparators: Comparator
--        port map(
--                    data1       => A,
--                    data2       => B,
--                    EqualD      => EqualD,
--                    NotEq       => NotEq,
--                    BGreat      => BGreat,
--                    Bless       => Bless
--                );                            
                
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
                    dataIn    => SignImmD,
                    output    => stfOut
                );  
                
    undata3 <= unsigned(stfOut); 
    undata4 <= unsigned(PCPlus4D);            
    output1 <= undata3 + undata4; 
    PCBranchD <= std_logic_vector(output1);                
                
----------------------------------------------------------------------
    --  EXECUTE STAGE
----------------------------------------------------------------------
    RsD <= InstrD(25 downto 21);
    RtD <= InstrD(20 downto 16);
    EXECUTE_STAGE: E
        port map(
                    CLK         => CLK,
                    FlushE      => FlushE,
                    RsD         => RsD,
                    RtD         => RtD,
                    ALUSrcD     => ALUSrcD,
                    MemWriteD   => MemWriteD,
                    MemWriteE   => MemWriteE,
                    RegWriteD   => RegWriteD,
                    MemtoRegE   => MemtoRegE,
                    SignImmD    => SignImmD,
                    SignImmE    => SignImmE,
                    ZeroImmD    => ZeroImmD,
                    ZeroImmE    => ZeroImmE,
                    LUpImD      => LUpImD,
                    LUpImE      => LUpImE,
                    ImOrAluD    => ImmALUContD,
                    ImOrAluE    => ImOrAluE,
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
                    ALUControlE => Funct,
                    RD1In       => RD1In,
                    RD2In       => RD2In,
                    RD1         => RD1,
                    RD2         => RD2,
                    ShamtD      => InstrD(10 downto 6),
                    data2SelectorE => data2SelectorE,
                    data2SelectorD => data2SelectorD,
                    ShamtE      => ShamtE   
                );
                
    RegisterDes: MuxTwoIn
        generic map(5)
        port map(
                    In1             => RtE,
                    In2             => RdE,
                    selector        => RegDstE,
                    output          => WriteRegE
                );              
                
    ForwardA_Mux: Mux4InBit
        port map(
                    In1         => RD1,
                    In2         => resuldW,
                    In3         => DataMemAddr,
                    In4         => DataMemAddr,
                    selector    => ForwardAE,
                    output      => SrcAE     
                );            

    ForwardB_Mux: Mux4InBit
        port map(
                    In1         => RD2,
                    In2         => resuldW,
                    In3         => DataMemAddr,
                    In4         => DataMemAddr,
                    selector    => ForwardBE,
                    output      => SrcBEPrime     
                ); 
                
    ALUSourceB: Mux4InBit
        port map(
                    In1             => SrcBEPrime,
                    In2             => SignImmE,
                    In3             => ZeroImmE,
                    In4             => ZeroImmE,
                    selector        => ALUSrcE,
                    output          => SrcBE
                );                         
                
    ALU: P_FullALU
        port map(
                    data1         => SrcAE,
                    data2         => SrcBE,
                    data2Selector => data2SelectorE,
                    funct         => funct,
                    Shamt         => ShamtE,
                    value         => SrcAE(4 downto 0),
                    cout          => overFlow,
                    output        => ALUOutE
                );        
                
----------------------------------------------------------------------
  --  MEMORY STAGE
----------------------------------------------------------------------
    MEMORY_STAGE: M
        port map(
                    CLK         => CLK,
                    RegWriteE   => RegWriteE,
                    MemtoRegE   => MemtoRegE,
                    MemWriteE   => MemWriteE,
                    RegWriteM   => RegWriteM,
                    MemtoRegM   => MemtoRegM,
                    MemWriteM   => MemWriteM,
                    ALUOutE     => ALUOutE,
                    WriteDataE  => SrcBEPrime,
                    ALUOutM     => ALUOutM,
                    WriteDataM  => WriteDataM,
                    WriteRegE   => WriteRegE,
                    WriteRegM   => WriteRegM,
                    LUpImE      => LUpImE,
                    LUpImM      => LUpImM,
                    ImOrAluE    => ImOrAluE,
                    ImOrAluM    => ImOrAluM, 
                    SignImmE    => SignImmE,
                    SignImmM    => SignImmM,
                    RsE         => RsE,
                    RsM         => RsM
                );
                
    MemAddrSource: MuxTwoIn
        generic map(32)
        port map(
                    In1         => ALUOutM,
                    In2         => LUpImM,
                    selector    => ImOrAluM,
                    output      => toDataMem
                );    
                
    ForwardLoadAddr: Mux4InBit
        port map(
                    In1         => toDataMem,
                    In2         => SignImmM,
                    In3         => resuldW,
                    In4         => resuldW,
                    selector    => ForwardMA,
                    output      => DataMemAddr     
                );         
                
    ForwardLoadResult: MuxTwoIn
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
                    Addr        => DataMemAddr,
                    WriteData   => DataM,
                    ReadData    => RDM
                );            
                
----------------------------------------------------------------------
 --  WRITEBACK STAGE
----------------------------------------------------------------------
    WRITEBACK_STAGE: W
        port map(
                    CLK         => CLK,
                    RegWriteM   => RegWriteM,
                    MemtoRegM   => MemtoRegM,
                    RegWriteW   => RegWriteW,
                    MemtoRegW   => MemtoRegW,
                    RDM         => RDM,
                    ReadDataW   => ReadDataW,
                    ALUOutM     => ALUOutM,
                    ALUOutW     => ALUOutW,
                    WriteRegM   => WriteRegM,
                    WriteRegW   => WriteRegW
                );
                
    Write_Source: MuxTwoIn
        generic map(32)
        port map(
                    In1         => ALUOutW,
                    In2         => ReadDataW,
                    selector    => MemtoRegW,
                    output      => resuldW
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
                    ForwardAD   => ForwardAD,
                    ForwardBD   => ForwardBD,
                    WriteRegE   => WriteRegE,
                    BranchD     => PCSrc,
                    MemtoRegM   => MemtoRegM,
                    RegWriteE   => RegWriteE,
                    ForwardMA   => ForwardMA,
                    memWriteM   => memWriteM,
                    memtoregW   => memtoregW,
                    ALUSrcD     => ALUSrcD,
                    ALUSrcE     => ALUSrcE,
                    ForwardDataM    => ForwardDataM
                );                           
end Behavioral;
