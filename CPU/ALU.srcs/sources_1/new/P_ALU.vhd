----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2020 06:12:38 PM
-- Design Name: 
-- Module Name: P_ALU - Behavioral
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

entity P_ALU is
Port ( 
            data1, data2                : in std_logic_vector(31 downto 0);
            funct                       : in std_logic_vector(5 downto 0);
            Shamt, value                : in std_logic_vector(4 downto 0);
            cout                        : out std_logic;
            output                      : out std_logic_vector(31 downto 0)  
        );
end P_ALU;

architecture Behavioral of P_ALU is
    ---------------------------------------------------------------------------
--  COMPONENTS DEFF
---------------------------------------------------------------------------
    component Adder32
        port(
                data1, data2        : in std_logic_vector(31 downto 0);
                cin                 : in std_logic;
                cout                : out std_logic;
                sum                 : out std_logic_vector(31 downto 0)
            );
    end component;

    component AndGate32
        port(
            data1, data2        : in std_logic_vector(31 downto 0);
            sum                 : out std_logic_vector(31 downto 0)
        );
    end component;
    
    component AluMux32In
        port(
               data1, data2, data3, data4              : in std_logic_vector(31 downto 0);
               data5, data6, data7, data8              : in std_logic_vector(31 downto 0); 
               data9, data10, data11, data12           : in std_logic_vector(31 downto 0);
               data13, data14, data15, data16          : in std_logic_vector(31 downto 0); 
               data17, data18, data19, data20          : in std_logic_vector(31 downto 0);
               data21, data22, data23, data24          : in std_logic_vector(31 downto 0);
               data25, data26, data27, data28          : in std_logic_vector(31 downto 0);
               data29, data30, data31, data32          : in std_logic_vector(31 downto 0);
               data33, data34, data35, data36          : in std_logic_vector(31 downto 0);
               data37, data38, data39, data40          : in std_logic_vector(31 downto 0); 
               data41, data42, data43, data44          : in std_logic_vector(31 downto 0);
               data45, data46, data47, data48          : in std_logic_vector(31 downto 0); 
               data49, data50, data51, data52          : in std_logic_vector(31 downto 0);
               data53, data54, data55, data56          : in std_logic_vector(31 downto 0);
               data57, data58, data59, data60          : in std_logic_vector(31 downto 0);
               data61, data62, data63, data64          : in std_logic_vector(31 downto 0);    
               selector                                : in std_logic_vector(5 downto 0);
               output                                  : out std_logic_vector(31 downto 0)
        );
    end component;
    
    component OrGate
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component NotGate
        Port (
                data2               : in std_logic_vector(31 downto 0);
                data2Bar            : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component TwoInMux
        Port (  
                data1, data2         : in std_logic_vector(31 downto 0); 
                selector             : in std_logic;                     
                output               : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component XorGate
        Port (
                data1, data2            : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component NandGate
        Port (
                data1, data2            : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component ShiftLL
        Port (
                data1           : in std_logic_vector(31 downto 0);
                shiftAmount     : in std_logic_vector(4 downto 0);
                output          : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component ShiftRL
        Port (
                data1           : in std_logic_vector(31 downto 0);
                shiftAmount     : in std_logic_vector(4 downto 0);
                output          : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component ShiftRA
        Port (
                data1           : in std_logic_vector(31 downto 0);
                shiftAmount     : in std_logic_vector(4 downto 0);
                output          : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component ShiftRAV
        Port (
                data1           : in std_logic_vector(31 downto 0);
                value           : in std_logic_vector(4 downto 0);
                output          : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component ShiftLLV
        Port (
                data1           : in std_logic_vector(31 downto 0);
                value           : in std_logic_vector(4 downto 0);
                output          : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component ShiftRLV
        Port (
                data1           : in std_logic_vector(31 downto 0);
                value           : in std_logic_vector(4 downto 0);
                output          : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component MoveFromHi
        Port (
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component MoveToHigh
        Port (
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component MoveFromLow
        Port (
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component MoveToLow
        Port (
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component UnAdder
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                cin                 : in std_logic;
                sum                 : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component UnSub
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                sum                 : out std_logic_vector(31 downto 0);
                cin                 : in std_logic
            );
    end component;
    
    component SetLessThen
        Port (
                data1, data2            : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component SetLessThenU
        Port (
                data1, data2            : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component SetGrtThen
        Port (
                data1, data2            : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component WriteRegSelect
        Port (
                data1, data2            : in std_logic_vector(4 downto 0);
                selector                : in std_logic;
                output                  : out std_logic_vector(4 downto 0)
            );
    end component;
    
    component NorGate
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                sum                 : out std_logic_vector(31 downto 0)
            );
    end component;
    
--    component Comparator
--        Port (
--                data1, data2                               : in    std_logic_vector(31 downto 0);
--                equ, neq, less, grt, leseq, grteq          : out std_logic
--            );
--    end component;
    
--    component ZeroFlag
--        Port (
--                dataIn              : in std_logic_vector(31 downto 0);
--                output              : out std_logic 
--            );
--    end component;
    
------------------------------------------------------------------------------
--  SIGNALS
-------------------------------------------------------------------------------

    signal addSubOut, andOut, 
           orOut, notOut, 
           bPartOfadder, xorOut, 
           nandOut, sllOut, sllvOut, 
           srlOut, sraOut, ground, 
           norOut, sravOut, srlvOut,
           UnAddOut,
           SLTOut, uSLTOut, UnSubOut, SGTOut       : std_logic_vector(31 downto 0);
    
    signal distance : std_logic_vector(4 downto 0);  
    
    
-------------------------------------------------------------------------------
--  PORT MAPS
--------------------------------------------------------------------------------
begin
--    ground <= X"00000000";
-------------------------------------------------------------------------------
--  SHIFT WITH SHIFT AMOUNT
--------------------------------------------------------------------------------
    ShiftLiftL: ShiftLL
        port map(
                    data1           => data2, 
                    shiftAmount     => distance,
                    output          => sllOut
                );   
                
    ShiftRightL: ShiftRL
        port map(
                    data1           => data2, 
                    shiftAmount     => distance,
                    output          => srlOut
                );               
                
    ShiftRightA: ShiftRA
        port map(
                    data1           => data2, 
                    shiftAmount     => distance,
                    output          => sraOut
                );
                
-------------------------------------------------------------------------------
--  SHIFT WITH VARIABLE
--------------------------------------------------------------------------------                
    ShiftLiftLV: ShiftLLV
        port map(
                    data1           => data2, 
                    value           => distance,
                    output          => sllvOut
                );    
                
    ShiftRightLV: ShiftRLV
        port map(
                    data1           => data2, 
                    value           => distance,
                    output          => srlvOut
                );                              
                
    ShiftRightAV: ShiftRAV
        port map(
                    data1           => data2, 
                    value           => distance,
                    output          => sravOut
                );                                               

-------------------------------------------------------------------------------
--  ADDER/SUBTRACT   SIGNED 
--------------------------------------------------------------------------------
    AddSub: Adder32
        port map(
                    data1       => data1, 
                    data2       => bPartOfadder,
                    cin         => funct(1),
                    cout        => cout,
                    sum         => addSubOut
                );           

-------------------------------------------------------------------------------
--  ADDER/SUBTRACT    UNSIGNED
--------------------------------------------------------------------------------
    unAdd: UnAdder
        port map(
                    data1       => data1, 
                    data2       => bPartOfadder,
                    cin         => funct(1),
                    sum         => UnAddOut
                );  
                
    unSubtract: UnSub
        port map(
                    data1       => data1, 
                    data2       => bPartOfadder,
                    sum         => UnSubOut,
                    cin         => funct(1)
                );                                 

-------------------------------------------------------------------------------
--  AND 
--------------------------------------------------------------------------------                
    AndGate: AndGate32
        port map(
                    data1       => data1, 
                    data2       => bPartOfadder,
                    sum         => andOut
                );   

-------------------------------------------------------------------------------
--  OR
--------------------------------------------------------------------------------               
    OrrGate: OrGate
        port map(
                    data1       => data1, 
                    data2       => bPartOfadder,
                    output      => orOut
                );

-------------------------------------------------------------------------------
--  NOR
--------------------------------------------------------------------------------              
    NorrGate: NorGate
        port map(
                    data1       => data1,
                    data2       => bPartOfadder, 
                    sum        => norOut
                );    
 
 -------------------------------------------------------------------------------
--  XOR
--------------------------------------------------------------------------------               
    XxorGate: XorGate
        port map(
                    data1       => data1, 
                    data2       => bPartOfadder,
                    output      => xorOut
                );   

-------------------------------------------------------------------------------
--  NAND
--------------------------------------------------------------------------------                
    NanndGate: NandGate
        port map(
                    data1       => data1, 
                    data2       => bPartOfadder,
                    output      => nandOut
                );   

-------------------------------------------------------------------------------
--  NOT
--------------------------------------------------------------------------------                
    NottGate: NotGate
        port map(
                    data2       => data2, 
                    data2Bar    => notOut
                ); 

-------------------------------------------------------------------------------
--  DATA2 SELECTOR
--------------------------------------------------------------------------------                
    Data2Select: TwoInMux
        port map(
                    data1       => data2,
                    data2       => notOut,
                    selector    => funct(1),
                    output      => bPartOfadder
                );
                
-------------------------------------------------------------------------------
--  SHAMT & VARIABLE SELECTOR
--------------------------------------------------------------------------------                
    SandVselector: WriteRegSelect
        port map(
                    data1       => Shamt,
                    data2       => value,
                    selector    => funct(2),
                    output      => distance
                );
                 
                
-------------------------------------------------------------------------------
--  SET LESS THEN
--------------------------------------------------------------------------------
    SLT: SetLessThen
        port map(
                    data1           => data1,
                    data2           => data2,
                    output          => SLTOut
                );                       

-------------------------------------------------------------------------------
--  SET LESS THEN UNSIGNED
--------------------------------------------------------------------------------
    uSLT: SetLessThenU
        port map(
                    data1           => data1,
                    data2           => data2,
                    output          => uSLTOut
                ); 
                
    SGT: SetGrtThen
        port map(
                    data1           => data1,
                    data2           => data2,
                    output          => SGTOut
                );                                  

-------------------------------------------------------------------------------
--  ALU FUNCTION SELECTOR
--------------------------------------------------------------------------------    
    Functions: AluMux32In
        port map(
                    data1        => sllOut, 
                    data2        => nandOut,
                    data3        => srlOut, 
                    data4        => sraOut,
                    data5        => sllvOut, 
                    data6        => nandOut,
                    data7        => srlvOut, 
                    data8        => sravOut,
                    data9        => data1, 
                    data10       => data1,
                    data11       => nandOut, 
                    data12       => nandOut,
                    data13       => nandOut, 
                    data14       => nandOut,
                    data15       => nandOut, 
                    data16       => nandOut,
                    data17       => data1, 
                    data18       => data1,
                    data19       => data1, 
                    data20       => data1,
                    data21       => nandOut, 
                    data22       => nandOut,
                    data23       => nandOut, 
                    data24       => nandOut,
                    data25       => nandOut, 
                    data26       => nandOut,
                    data27       => nandOut, 
                    data28       => nandOut,
                    data29       => nandOut, 
                    data30       => nandOut,
                    data31       => nandOut, 
                    data32       => nandOut,
                    data33       => addSubOut, 
                    data34       => UnAddOut,
                    data35       => addSubOut, 
                    data36       => UnSubOut,
                    data37       => andOut, 
                    data38       => OrOut,
                    data39       => xorOut, 
                    data40       => norOut,
                    data41       => nandOut, 
                    data42       => SGTOut,
                    data43       => SLTOut, 
                    data44       => uSLTOut,
                    data45       => nandOut, 
                    data46       => nandOut,
                    data47       => nandOut, 
                    data48       => nandOut,
                    data49       => nandOut, 
                    data50       => nandOut,
                    data51       => nandOut, 
                    data52       => nandOut,
                    data53       => nandOut, 
                    data54       => nandOut,
                    data55       => nandOut, 
                    data56       => nandOut,
                    data57       => nandOut, 
                    data58       => nandOut,
                    data59       => nandOut, 
                    data60       => nandOut,
                    data61       => nandOut,
                    data62       => nandOut,
                    data63       => nandOut,
                    data64       => nandOut,
                    selector    => funct,
                    output      => output
                );

-------------------------------------------------------------------------------
--  ZERO FLAG
--------------------------------------------------------------------------------    
--    ALUFlags: Comparator
--        port map(
--                    data1            => data1,
--                    data2            => bPartOfadder,
--                    equ              => equO, 
--                    neq              => nquO, 
--                    less             => lessO, 
--                    grt              => grtO, 
--                    leseq            => lesegO, 
--                    grteq            => grteqO
--                );
                
end Behavioral;
