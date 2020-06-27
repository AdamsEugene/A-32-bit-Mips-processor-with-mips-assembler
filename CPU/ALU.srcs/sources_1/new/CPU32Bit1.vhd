----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2019 05:36:51 AM
-- Design Name: 
-- Module Name: SingleCycle - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SingleCycle is
Port (
        Clock, Rst         : in std_logic 
    );
end SingleCycle;

architecture Behavioral of SingleCycle is
    component ProgramCounter
        generic(N: integer := 32);
        Port (
                dataIn          : in std_logic_vector(N-1 downto 0);
                dataOut         : out std_logic_vector(N-1 downto 0);
                clk, rst             : in std_logic
            );
    end component;
    
    component InstructionMem
        generic(N: integer := 32);
        Port (
                fromPC          : in std_logic_vector(N-1 downto 0);
                instr           : out std_logic_vector(N-1 downto 0)
            );
    end component;
    
    component RegisterFile
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
    
    component SignExtension
        Port (
                dataIn              : in std_logic_vector(15 downto 0);
                dataout             : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component FullALU
        Port ( 
                data1, data2            : in std_logic_vector(31 downto 0);
                data2Selector           : in std_logic; 
                funct                   : in std_logic_vector(5 downto 0);
                Shamt, value            : in std_logic_vector(4 downto 0);
                cout                    : out std_logic;
                zero                    : out std_logic;
                output                  : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component DataMemory
        Port (
                addr, WD            : in std_logic_vector(31 downto 0);
                clk, WE             : in std_logic;
                RD                  : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component Adder32
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                cin                 : in std_logic;
                cout                : out std_logic;
                sum                 : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component TwoInMux
        Port (                                                          
                data1, data2         : in std_logic_vector(31 downto 0);
                selector             : in std_logic;                    
                output               : out std_logic_vector(31 downto 0)
            ); 
    end component;
    
    component WriteRegSelect
        Port (                                                          
                data1, data2         : in std_logic_vector(4 downto 0);
                selector             : in std_logic;                    
                output               : out std_logic_vector(4 downto 0)
            ); 
    end component;
    
     component ShiftLL
        Port (                                                          
                data1                : in std_logic_vector(31 downto 0);
                shiftAmount          : in std_logic_vector(4 downto 0);                    
                output               : out std_logic_vector(31 downto 0)
            ); 
    end component;
    
--    component OneBitAnd
--        Port (
--                data1, data2            : in std_logic;
--                output                  : out std_logic
--            );
--    end component;
    
    component LowZeros
        Port (
                dataIn          : in std_logic_vector(15 downto 0);
                output          : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component Mux4In
        Port (
                in1, in2, in3, in4      : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0);
                selector                : in std_logic_vector(1 downto 0)
            );
    end component;
    
    component ZeroExtend
        Port (
                dataIn              : in std_logic_vector(15 downto 0);
                dataout             : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component ImmBy4
        Port (
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component Add4
        Port (
                dataIn          : in std_logic_vector(31 downto 0);
                output          : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component Add2In
        Port (
                data1, data2          : in std_logic_vector(31 downto 0);
                output                : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component JumpTo
        Port (
                dataIn              : in std_logic_vector(25 downto 0);
                output              : out std_logic_vector(27 downto 0) 
            );
    end component;
    
--    component CompOut
--        Port (
--                in1, in2, in3, in4, in5, in6, a, b, c, d, e, f   : in std_logic;
--                flag                                                 : out std_logic
--            );
--    end component;
    
    component SCP_ControlUnit
        Port (
                opcode, funct                       : in std_logic_vector(5 downto 0);
                branch, jump, regDst, 
                we3, data2select, im_ALUcontrol, 
                memwe, memtoreg                     : out std_logic;
                ALUScr                              : out std_logic_vector(1 downto 0);
                functOut                            : out std_logic_vector(5 downto 0)
            );
    end component;
    
    signal FromMem, outOfPC, outOfInstr,
           toWD3, SrcA, outOfRD2,  
           SrcB, outOfALU, storeData,
           memOut, outOfPCPlus4, signEnt, 
           result, signBy4, PCBranch, PCresult,
           Low0, toDataAddr, zeroEnt, toPc,
           jumpOutPlus  : std_logic_vector(31 downto 0);
    signal toAddr2, toAddr1, toAddr3, value     : std_logic_vector(4 downto 0);
    signal functOut    : std_logic_vector(5 downto 0);
    signal ALUScr    : std_logic_vector(1 downto 0);
    signal JumpOut    : std_logic_vector(27 downto 0);
    signal regWrite, notData2, c_out, memWrite, memtoReg, regDst, PCScr,
           Im_AluOut, jump, branch, zero           : std_logic;
                                 
    
begin
    toAddr2 <= outOfInstr(20 downto 16);
    toAddr1 <= outOfInstr(25 downto 21);
    jumpOutPlus <= outOfPCPlus4(31 downto 28) & JumpOut;
    PC: ProgramCounter
        port map(
                    dataIn              => toPc,
                    clk                 => Clock,
                    dataOut             => outOfPC,
                    rst                 => Rst
                );
                
    InsMem: InstructionMem
        port map(
                    fromPC              => outOfPC,
                    instr               => outOfInstr
                );
                
    RegFile32Bit: RegisterFile
        port map(
                    addr1               => toAddr1,
                    addr2               => toAddr2,
                    addr3               => toAddr3,
                    WD3                 => result,
                    clk                 => Clock,
                    WE3                 => regWrite,
                    RD1                 => SrcA,
                    RD2                 => outOfRD2
                );
                
    SignExtend: SignExtension
        port map(
                    dataIn              => outOfInstr(15 downto 0),
                    dataOut             => signEnt
                );
                
    ZerosExtend: ZeroExtend
        port map(
                    dataIn              => outOfInstr(15 downto 0),
                    dataOut             => zeroEnt
                );            
                
    SourceBSelect: Mux4In
        port map(
                    in1           => outOfRD2,
                    in2           => signEnt,
                    in3           => zeroEnt,
                    in4           => zeroEnt,
                    selector      => ALUScr,
                    output        => SrcB
                );
                
    ALUResults: TwoInMux
        port map(
                    data1           => outOfALU,
                    data2           => memOut,
                    selector        => memtoReg,
                    output          => result
                );
                
     regDestination: WriteRegSelect
        port map(
                    data1           => toAddr2,
                    data2           => outOfInstr(15 downto 11),
                    selector        => regDst,
                    output          => toAddr3
                );            
                
    ALU32: FullALU
        port map(
                    data1               => SrcA,
                    data2               => SrcB,
                    data2Selector       => notData2,
                    funct               => functOut,
                    Shamt               => outOfInstr(10 downto 6),
                    cout                => c_out,
                    output              => outOfALU,
                    value               => SrcA(4 downto 0),
                    zero                => zero
                );
                
    ImmediateBy4: ImmBy4
        port map(
                    datain               => signEnt,
                    output               => signBy4
                );
                
    Data_Memory: DataMemory
        port map(
                    addr                => toDataAddr,
                    WD                  => outOfRD2,
                    clk                 => Clock,
                    WE                  => memWrite,
                    RD                  => memOut
                );
                
    PCPlus4: Add4
        port map(
                    dataIn               => outOfPC,
                    output               => outOfPCPlus4
                );
                
    PC_Branch: Add2In
        port map(
                    data1               => signBy4,
                    data2               => outOfPCPlus4,
                    output              => PCBranch
                );
                
    Jumps: JumpTo
        port map(
                    dataIn          => outOfInstr(25 downto 0),
                    output          => JumpOut
                );            
                
    PCInput: TwoInMux
        port map(
                    data1           => outOfPCPlus4,
                    data2           => PCBranch,
                    selector        => PCScr,
                    output          => PCresult
                );
                
    JumpSelect: TwoInMux
        port map(
                    data1           => PCresult,
                    data2           => jumpOutPlus,
                    selector        => jump,
                    output          => toPc
                );            
                
    ImmLowZeors: LowZeros
        port map(
                    dataIn          => outOfInstr(15 downto 0),
                    output          => Low0
                );             
                
    DataMemAddrSlt: TwoInMux 
        port map(
                    data1           => outOfALU,
                    data2           => Low0,
                    selector        => Im_AluOut,
                    output          => toDataAddr
                ); 
                
--    Flags: CompOut
--        port map(
--                    in1             => equOut,  
--                    in2             => nquOut,  
--                    in3             => lessOut, 
--                    in4             => grtOut,  
--                    in5             => lesegOut,
--                    in6             => grteqOut, 
--                    a               => outOfInstr(31),
--                    b               => outOfInstr(30),
--                    c               => outOfInstr(29),
--                    d               => outOfInstr(28),
--                    e               => outOfInstr(27),
--                    f               => outOfInstr(26),
--                    flag            => forBranch
--                );                      
                
--    PCSelector: OneBitAnd
--        port map(
--                    data1           => zero,
--                    data2           => branch,
--                    output          => PCScr
--                );
                
    PCScr <= zero and branch;           
                
    ControlUnit: SCP_ControlUnit
        port map(
                    opcode              => outOfInstr(31 downto 26),
                    funct               => outOfInstr(5 downto 0),   
                    branch              => branch,    
                    jump                => jump,
                    regDst              => regDst,
                    we3                 => regWrite,
                    data2select         => notData2,
                    im_ALUcontrol       => Im_AluOut,
                    memwe               => memWrite,
                    memtoreg            => memtoreg,                
                    ALUScr              => ALUScr,           
                    functOut            => functOut                       
                );            
end Behavioral;
