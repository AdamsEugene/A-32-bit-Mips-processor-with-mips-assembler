----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2019 06:08:17 PM
-- Design Name: 
-- Module Name: RegFiles - Behavioral
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

entity RegFiles is
generic(N: integer :=32);
Port (
        clk ,WE3            : in std_logic;
        Addr1               : in std_logic_vector(4 downto 0);
        Addr2               : in std_logic_vector(4 downto 0);
        Addr3               : in std_logic_vector(4 downto 0);
        WD3                 : in std_logic_vector(N-1 downto 0);
        RD1                  : out std_logic_vector(N-1 downto 0);
        RD2                  : out std_logic_vector(N-1 downto 0) 
     );
end RegFiles;

architecture Behavioral of RegFiles is
    component Register_32Bit
        Port (
                load, clk           : in std_logic;
                data                : in std_logic_vector(N-1 downto 0);
                output              : out std_logic_vector(N-1 downto 0) 
            );
    end component;
    
    component Decoder
        Port (
                dataIn                      : in std_logic_vector(4 downto 0);
                dataOut                     : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component TristateBuffer
        Port (
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0);
                selector            : in std_logic
            );
    end component;
    
    component OrGate32_Inputs
        Port (
                A1,  A2,  A3,  A4,                                         
                A5,  A6,  A7,  A8,                                         
                A9,  A10, A11, A12,                                      
                A13, A14, A15, A16,                                     
                A17, A18, A19, A20,                                     
                A21, A22, A23, A24,                                     
                A25, A26, A27, A28,                                     
                A29, A30, A31, A32        : in std_logic_vector(31 downto 0);
                output                    : out std_logic_vector(31 downto 0)
            );
    end component;
    
    component Enable
        Port (
                data1, data2        : in std_logic;
                output              : out std_logic 
            );
    end component;
    
    signal load0, load1, load2, load3, load4, 
           load5, load6, load7, load8, 
           load9, load10, load11, load12, 
           load13, load14, load15, load16, 
           load17, load18, load19, load20, 
           load21, load22, load23, load24, 
           load25, load26, load27, load28, 
           load29, load30, load31          : std_logic;
           
    signal d1,  d2,  d3,  d4, 
           d5,  d6,  d7,  d8, 
           d9,  d10, d11, d12, 
           d13, d14, d15, d16, 
           d17, d18, d19, d20, 
           d21, d22, d23, d24, 
           d25, d26, d27, d28, 
           d29, d30, d31, d0      : std_logic;       
           
    signal SA32, SA1, SA2, SA3, SA4, 
           SA5, SA6, SA7, SA8, 
           SA9, SA10, SA11, SA12, 
           SA13, SA14, SA15, SA16, 
           SA17, SA18, SA19, SA20, 
           SA21, SA22, SA23, SA24, 
           SA25, SA26, SA27, SA28, 
           SA29, SA30, SA31          : std_logic; 
           
    signal S32, S1, S2, S3, S4, 
           S5, S6, S7, S8, 
           S9, S10, S11, S12, 
           S13, S14, S15, S16, 
           S17, S18, S19, S20, 
           S21, S22, S23, S24, 
           S25, S26, S27, S28, 
           S29, S30, S31          : std_logic;              
    
    signal preOut1, preOut2, preOut3, preOut4, 
           preOut5, preOut6, preOut7, preOut8, 
           preOut9, preOut10, preOut11, preOut12, 
           preOut13, preOut14, preOut15, preOut16, 
           preOut17, preOut18, preOut19, preOut20, 
           preOut21, preOut22, preOut23, preOut24, 
           preOut25, preOut26, preOut27, preOut28, 
           preOut29, preOut30, preOut31, preOut32      : std_logic_vector(31 downto 0);
    
    signal OutA1,  OutA2,  OutA3,  OutA4, 
           OutA5,  OutA6,  OutA7,  OutA8, 
           OutA9,  OutA10, OutA11, OutA12, 
           OutA13, OutA14, OutA15, OutA16, 
           OutA17, OutA18, OutA19, OutA20, 
           OutA21, OutA22, OutA23, OutA24, 
           OutA25, OutA26, OutA27, OutA28, 
           OutA29, OutA30, OutA31, OutA32      : std_logic_vector(31 downto 0);
    
    signal Out1,  Out2,  Out3,  Out4, 
           Out5,  Out6,  Out7,  Out8, 
           Out9,  Out10, Out11, Out12, 
           Out13, Out14, Out15, Out16, 
           Out17, Out18, Out19, Out20, 
           Out21, Out22, Out23, Out24, 
           Out25, Out26, Out27, Out28, 
           Out29, Out30, Out31, Out32      : std_logic_vector(31 downto 0);
    
begin
    RD1Out1: TristateBuffer
        port map(
                    dataIn          => preOut1,
                    selector        => SA1,
                    output          => OutA1
                ); 
                
    RD2Out1: TristateBuffer
        port map(
                    dataIn          => preOut1,
                    selector        => S1,
                    output          => Out1
                );                
                
    RD1Out2: TristateBuffer
        port map(
                    dataIn          => preOut2,
                    selector        => SA2,
                    output          => OutA2
                ); 
                
    RD2Out2: TristateBuffer
        port map(
                    dataIn          => preOut2,
                    selector        => S2,
                    output          => Out2
                );          
                
    RD1Out3: TristateBuffer
        port map(
                    dataIn          => preOut3,
                    selector        => SA3,
                    output          => OutA3
                ); 
                
    RD2Out3: TristateBuffer
        port map(
                    dataIn          => preOut3,
                    selector        => S3,
                    output          => Out3
                );          
                
    RD1Out4: TristateBuffer
        port map(
                    dataIn          => preOut4,
                    selector        => SA4,
                    output          => OutA4
                ); 
                
    RD2Out4: TristateBuffer
        port map(
                    dataIn          => preOut4,
                    selector        => S4,
                    output          => Out4
                );                                              
                
    RD1Out5: TristateBuffer
        port map(
                    dataIn          => preOut5,
                    selector        => SA5,
                    output          => OutA5
                ); 
                
    RD2Out5: TristateBuffer
        port map(
                    dataIn          => preOut5,
                    selector        => S5,
                    output          => Out5
                );          
                
    RD1Out6: TristateBuffer
        port map(
                    dataIn          => preOut6,
                    selector        => SA6,
                    output          => OutA6
                ); 
                
    RD2Out6: TristateBuffer
        port map(
                    dataIn          => preOut6,
                    selector        => S6,
                    output          => Out6
                );          
                
    RD1Out7: TristateBuffer
        port map(
                    dataIn          => preOut7,
                    selector        => SA7,
                    output          => OutA7
                ); 
                
    RD2Out7: TristateBuffer
        port map(
                    dataIn          => preOut7,
                    selector        => S7,
                    output          => Out7
                );                                              
                
    RD1Out8: TristateBuffer
        port map(
                    dataIn          => preOut8,
                    selector        => SA8,
                    output          => OutA8
                ); 
                
    RD2Out8: TristateBuffer
        port map(
                    dataIn          => preOut8,
                    selector        => S8,
                    output          => Out8
                );                
                
    RD1Out9: TristateBuffer
        port map(
                    dataIn          => preOut9,
                    selector        => SA9,
                    output          => OutA9
                ); 
                
    RD2Out9: TristateBuffer
        port map(
                    dataIn          => preOut9,
                    selector        => S9,
                    output          => Out9
                );          
                
    RD1Out10: TristateBuffer
        port map(
                    dataIn          => preOut10,
                    selector        => SA10,
                    output          => OutA10
                ); 
                
    RD2Out10: TristateBuffer
        port map(
                    dataIn          => preOut10,
                    selector        => S10,
                    output          => Out10
                );          
                
    RD1Out11: TristateBuffer
        port map(
                    dataIn          => preOut11,
                    selector        => SA11,
                    output          => OutA11
                ); 
                
    RD2Out11: TristateBuffer
        port map(
                    dataIn          => preOut11,
                    selector        => S11,
                    output          => Out11
                );                                              
                
    RD1Out12: TristateBuffer
        port map(
                    dataIn          => preOut12,
                    selector        => SA12,
                    output          => OutA12
                ); 
                
    RD2Out12: TristateBuffer
        port map(
                    dataIn          => preOut12,
                    selector        => S12,
                    output          => Out12
                );          
                
    RD1Out13: TristateBuffer
        port map(
                    dataIn          => preOut13,
                    selector        => SA13,
                    output          => OutA13
                ); 
                
    RD2Out13: TristateBuffer
        port map(
                    dataIn          => preOut13,
                    selector        => S13,
                    output          => Out13
                );          
                
    RD1Out14: TristateBuffer
        port map(
                    dataIn          => preOut14,
                    selector        => SA14,
                    output          => OutA14
                ); 
                
    RD2Out14: TristateBuffer
        port map(
                    dataIn          => preOut14,
                    selector        => S14,
                    output          => Out14
                );       
                
    RD1Out15: TristateBuffer
        port map(
                    dataIn          => preOut15,
                    selector        => SA15,
                    output          => OutA15
                ); 
                
    RD2Out15: TristateBuffer
        port map(
                    dataIn          => preOut15,
                    selector        => S15,
                    output          => Out15
                );                
                
    RD1Out16: TristateBuffer
        port map(
                    dataIn          => preOut16,
                    selector        => SA16,
                    output          => OutA16
                ); 
                
    RD2Out16: TristateBuffer
        port map(
                    dataIn          => preOut16,
                    selector        => S16,
                    output          => Out16
                );          
                
    RD1Out17: TristateBuffer
        port map(
                    dataIn          => preOut17,
                    selector        => SA17,
                    output          => OutA17
                ); 
                
    RD2Out17: TristateBuffer
        port map(
                    dataIn          => preOut17,
                    selector        => S17,
                    output          => Out17
                );          
                
    RD1Out18: TristateBuffer
        port map(
                    dataIn          => preOut18,
                    selector        => SA18,
                    output          => OutA18
                ); 
                
    RD2Out18: TristateBuffer
        port map(
                    dataIn          => preOut18,
                    selector        => S18,
                    output          => Out18
                );                                              
                
    RD1Out19: TristateBuffer
        port map(
                    dataIn          => preOut19,
                    selector        => SA19,
                    output          => OutA19
                ); 
                
    RD2Out19: TristateBuffer
        port map(
                    dataIn          => preOut19,
                    selector        => S19,
                    output          => Out19
                );          
                
    RD1Out20: TristateBuffer
        port map(
                    dataIn          => preOut20,
                    selector        => SA20,
                    output          => OutA20
                ); 
                
    RD2Out20: TristateBuffer
        port map(
                    dataIn          => preOut20,
                    selector        => S20,
                    output          => Out20
                );          
                
    RD1Out21: TristateBuffer
        port map(
                    dataIn          => preOut21,
                    selector        => SA21,
                    output          => OutA21
                ); 
                
    RD2Out21: TristateBuffer
        port map(
                    dataIn          => preOut21,
                    selector        => S21,
                    output          => Out21
                );       
                
    RD1Out22: TristateBuffer
        port map(
                    dataIn          => preOut22,
                    selector        => SA22,
                    output          => OutA22
                ); 
                
    RD2Out22: TristateBuffer
        port map(
                    dataIn          => preOut22,
                    selector        => S22,
                    output          => Out22
                );                
                
    RD1Out23: TristateBuffer
        port map(
                    dataIn          => preOut23,
                    selector        => SA23,
                    output          => OutA23
                ); 
                
    RD2Out23: TristateBuffer
        port map(
                    dataIn          => preOut23,
                    selector        => S23,
                    output          => Out23
                );          
                
    RD1Out24: TristateBuffer
        port map(
                    dataIn          => preOut24,
                    selector        => SA24,
                    output          => OutA24
                ); 
                
    RD2Out24: TristateBuffer
        port map(
                    dataIn          => preOut24,
                    selector        => S24,
                    output          => Out24
                );          
                
    RD1Out25: TristateBuffer
        port map(
                    dataIn          => preOut25,
                    selector        => SA25,
                    output          => OutA25
                ); 
                
    RD2Out25: TristateBuffer
        port map(
                    dataIn          => preOut25,
                    selector        => S25,
                    output          => Out25
                );                                              
                
    RD1Out26: TristateBuffer
        port map(
                    dataIn          => preOut26,
                    selector        => SA26,
                    output          => OutA26
                ); 
                
    RD2Out26: TristateBuffer
        port map(
                    dataIn          => preOut26,
                    selector        => S26,
                    output          => Out26
                );          
                
    RD1Out27: TristateBuffer
        port map(
                    dataIn          => preOut27,
                    selector        => SA27,
                    output          => OutA27
                ); 
                
    RD2Out27: TristateBuffer
        port map(
                    dataIn          => preOut27,
                    selector        => S27,
                    output          => Out27
                );          
                
    RD1Out28: TristateBuffer
        port map(
                    dataIn          => preOut28,
                    selector        => SA28,
                    output          => OutA28
                ); 
                
    RD2Out28: TristateBuffer
        port map(
                    dataIn          => preOut28,
                    selector        => S28,
                    output          => Out28
                );                      
       
    RD1Out29: TristateBuffer
        port map(
                    dataIn          => preOut29,
                    selector        => SA29,
                    output          => OutA29
                ); 
                
    RD2Out29: TristateBuffer
        port map(
                    dataIn          => preOut29,
                    selector        => S29,
                    output          => Out29
                );          
                
    RD1Out30: TristateBuffer
        port map(
                    dataIn          => preOut30,
                    selector        => SA30,
                    output          => OutA30
                ); 
                
    RD2Out30: TristateBuffer
        port map(
                    dataIn          => preOut30,
                    selector        => S30,
                    output          => Out30
                );                      
                
    RD1Out31: TristateBuffer
        port map(
                    dataIn          => preOut31,
                    selector        => SA31,
                    output          => OutA31
                ); 
                
    RD2Out31: TristateBuffer
        port map(
                    dataIn          => preOut31,
                    selector        => S31,
                    output          => Out31
                );          
                
    RD1Out32: TristateBuffer
        port map(
                    dataIn          => preOut32,
                    selector        => SA32,
                    output          => OutA32
                ); 
                
    RD2Out32: TristateBuffer
        port map(
                    dataIn          => preOut32,
                    selector        => S32,
                    output          => Out32
                );                                                                   
                
    Zero: Register_32Bit
        port map(
                    load        => d0,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut1
                );
    
    AssTemp: Register_32Bit
        port map(
                    load        => d1,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut2
                );
                
    FuncRV1: Register_32Bit
        port map(
                    load        => d2,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut3
                );
                
    FuncRV2: Register_32Bit
        port map(
                    load        => d3,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut4
                );
                
    FuncAgg1: Register_32Bit
        port map(
                    load        => d4,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut5
                );
                
    FuncAgg2: Register_32Bit
        port map(
                    load        => d5,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut6
                );
                
    FuncAgg3: Register_32Bit
        port map(
                    load        => d6,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut7
                );
                
    FuncAgg4: Register_32Bit
        port map(
                    load        => d7,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut8
                );            
                
    TempV1: Register_32Bit
        port map(
                    load        => d8,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut9
                );
                
    TempV2: Register_32Bit
        port map(
                    load        => d9,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut10
                );
                
    TempV3: Register_32Bit
        port map(
                    load        => d10,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut11
                );
                
    TempV4: Register_32Bit
        port map(
                    load        => d11,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut12
                );
                
    TempV5: Register_32Bit
        port map(
                    load        => d12,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut13
                );
                
    TempV6: Register_32Bit
        port map(
                    load        => d13,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut14
                );
                
    TempV7: Register_32Bit
        port map(
                    load        => d14,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut15
                );
                
    TempV8: Register_32Bit
        port map(
                    load        => d15,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut16
                );            
                
    SaveV1: Register_32Bit
        port map(
                    load        => d16,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut17
                );
                
    SaveV2: Register_32Bit
        port map(
                    load        => d17,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut18
                );
                
    SaveV3: Register_32Bit
        port map(
                    load        => d18,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut19
                );
                
    SaveV4: Register_32Bit
        port map(
                    load        => d19,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut20
                );
                
    SaveV5: Register_32Bit
        port map(
                    load        => d20,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut21
                );
                
    SaveV6: Register_32Bit
        port map(
                    load        => d21,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut22
                );
                
    SaveV7: Register_32Bit
        port map(
                    load        => d22,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut23
                );
                
    SaveV8: Register_32Bit
        port map(
                    load        => d23,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut24
                );
                
    TempV9: Register_32Bit
        port map(
                    load        => d24,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut25
                );
                
    TempV10: Register_32Bit
        port map(
                    load        => d25,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut26
                );
                
    OSTemp1: Register_32Bit
        port map(
                    load        => d26,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut27
                );
                
    OSTemp2: Register_32Bit
        port map(
                    load        => d27,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut28
                );
                
    GPointer: Register_32Bit
        port map(
                    load        => d28,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut29
                );
                
    SPointer: Register_32Bit
        port map(
                    load        => d29,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut30
                );
                
    FPointer: Register_32Bit
        port map(
                    load        => d30,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut31
                );
                
    FuncRA: Register_32Bit
        port map(
                    load        => d31,
                    clk         => clk,
                    data        => WD3,
                    output      => preOut32
                );
                
    Ena0: Enable
        port map(
                    data1       => WE3,
                    data2       => load0,
                    output      => d0
                );                  
                
    Ena1: Enable
        port map(
                    data1       => WE3,
                    data2       => load1,
                    output      => d1
                );
    
    Ena2: Enable
        port map(
                    data1       => WE3,
                    data2       => load2,
                    output      => d2
                );
                
    Ena3: Enable
        port map(
                    data1       => WE3,
                    data2       => load3,
                    output      => d3
                );
                
    Ena4: Enable
        port map(
                    data1       => WE3,
                    data2       => load4,
                    output      => d4
                );
                
    Ena5: Enable
        port map(
                    data1       => WE3,
                    data2       => load5,
                    output      => d5
                );
                
    Ena6: Enable
        port map(
                    data1       => WE3,
                    data2       => load6,
                    output      => d6
                );
                
    Ena7: Enable
        port map(
                    data1       => WE3,
                    data2       => load7,
                    output      => d7
                );
                
    Ena8: Enable
        port map(
                    data1       => WE3,
                    data2       => load8,
                    output      => d8
                );
                
    Ena9: Enable
        port map(
                    data1       => WE3,
                    data2       => load9,
                    output      => d9
                );
                
    Ena10: Enable
        port map(
                    data1       => WE3,
                    data2       => load10,
                    output      => d10
                );
                
    Ena11: Enable
        port map(
                    data1       => WE3,
                    data2       => load11,
                    output      => d11
                );
    
    Ena12: Enable
        port map(
                    data1       => WE3,
                    data2       => load12,
                    output      => d12
                );
                
    Ena13: Enable
        port map(
                    data1       => WE3,
                    data2       => load13,
                    output      => d13
                );
                
    Ena14: Enable
        port map(
                    data1       => WE3,
                    data2       => load14,
                    output      => d14
                );
                
    Ena15: Enable
        port map(
                    data1       => WE3,
                    data2       => load15,
                    output      => d15
                );
                
    Ena16: Enable
        port map(
                    data1       => WE3,
                    data2       => load16,
                    output      => d16
                );
                
    Ena17: Enable
        port map(
                    data1       => WE3,
                    data2       => load17,
                    output      => d17
                );
                
    Ena18: Enable
        port map(
                    data1       => WE3,
                    data2       => load18,
                    output      => d18
                );
                
    Ena19: Enable
        port map(
                    data1       => WE3,
                    data2       => load19,
                    output      => d19
                );
                
    Ena20: Enable
        port map(
                    data1       => WE3,
                    data2       => load20,
                    output      => d20
                );            
                
    Ena21: Enable
        port map(
                    data1       => WE3,
                    data2       => load21,
                    output      => d21
                );
    
    Ena22: Enable
        port map(
                    data1       => WE3,
                    data2       => load22,
                    output      => d22
                );
                
    Ena23: Enable
        port map(
                    data1       => WE3,
                    data2       => load23,
                    output      => d23
                );
                
    Ena24: Enable
        port map(
                    data1       => WE3,
                    data2       => load24,
                    output      => d24
                );
                
    Ena25: Enable
        port map(
                    data1       => WE3,
                    data2       => load25,
                    output      => d25
                );
                
    Ena26: Enable
        port map(
                    data1       => WE3,
                    data2       => load26,
                    output      => d26
                );
                
    Ena27: Enable
        port map(
                    data1       => WE3,
                    data2       => load27,
                    output      => d27
                );
                
    Ena28: Enable
        port map(
                    data1       => WE3,
                    data2       => load28,
                    output      => d28
                );
                
    Ena29: Enable
        port map(
                    data1       => WE3,
                    data2       => load29,
                    output      => d29
                );
                
    Ena30: Enable
        port map(
                    data1       => WE3,
                    data2       => load30,
                    output      => d30
                );            
                
    Ena31: Enable
        port map(
                    data1       => WE3,
                    data2       => load31,
                    output      => d31
                );
                
    AddressDecode1: Decoder
        port map(
                    dataIn              => Addr1,
                    dataOut(0)          => load0,
                    dataOut(1)          => load1, 
                    dataOut(2)          => load2,
                    dataOut(3)          => load3,
                    dataOut(4)          => load4,
                    dataOut(5)          => load5,
                    dataOut(6)          => load6,
                    dataOut(7)          => load7,
                    dataOut(8)          => load8,
                    dataOut(9)          => load9,
                    dataOut(10)         => load10,
                    dataOut(11)         => load11,
                    dataOut(12)         => load12,
                    dataOut(13)         => load13,
                    dataOut(14)         => load14,
                    dataOut(15)         => load15,
                    dataOut(16)         => load16,
                    dataOut(17)         => load17,
                    dataOut(18)         => load18,
                    dataOut(19)         => load19,
                    dataOut(20)         => load20,
                    dataOut(21)         => load21,
                    dataOut(22)         => load22,
                    dataOut(23)         => load23,
                    dataOut(24)         => load24,
                    dataOut(25)         => load25,
                    dataOut(26)         => load26,
                    dataOut(27)         => load27,
                    dataOut(28)         => load28,
                    dataOut(29)         => load29,
                    dataOut(30)         => load30,
                    dataOut(31)         => load31
                );
                
    AddressDecode2: Decoder
        port map(
                    dataIn              => Addr2,
                    dataOut(0)          => load0,
                    dataOut(1)          => load1, 
                    dataOut(2)          => load2,
                    dataOut(3)          => load3,
                    dataOut(4)          => load4,
                    dataOut(5)          => load5,
                    dataOut(6)          => load6,
                    dataOut(7)          => load7,
                    dataOut(8)          => load8,
                    dataOut(9)          => load9,
                    dataOut(10)         => load10,
                    dataOut(11)         => load11,
                    dataOut(12)         => load12,
                    dataOut(13)         => load13,
                    dataOut(14)         => load14,
                    dataOut(15)         => load15,
                    dataOut(16)         => load16,
                    dataOut(17)         => load17,
                    dataOut(18)         => load18,
                    dataOut(19)         => load19,
                    dataOut(20)         => load20,
                    dataOut(21)         => load21,
                    dataOut(22)         => load22,
                    dataOut(23)         => load23,
                    dataOut(24)         => load24,
                    dataOut(25)         => load25,
                    dataOut(26)         => load26,
                    dataOut(27)         => load27,
                    dataOut(28)         => load28,
                    dataOut(29)         => load29,
                    dataOut(30)         => load30,
                    dataOut(31)         => load31
                );
                
    AddressDecode3: Decoder
        port map(
                    dataIn              => Addr3,
                    dataOut(0)          => load0,
                    dataOut(1)          => load1, 
                    dataOut(2)          => load2,
                    dataOut(3)          => load3,
                    dataOut(4)          => load4,
                    dataOut(5)          => load5,
                    dataOut(6)          => load6,
                    dataOut(7)          => load7,
                    dataOut(8)          => load8,
                    dataOut(9)          => load9,
                    dataOut(10)         => load10,
                    dataOut(11)         => load11,
                    dataOut(12)         => load12,
                    dataOut(13)         => load13,
                    dataOut(14)         => load14,
                    dataOut(15)         => load15,
                    dataOut(16)         => load16,
                    dataOut(17)         => load17,
                    dataOut(18)         => load18,
                    dataOut(19)         => load19,
                    dataOut(20)         => load20,
                    dataOut(21)         => load21,
                    dataOut(22)         => load22,
                    dataOut(23)         => load23,
                    dataOut(24)         => load24,
                    dataOut(25)         => load25,
                    dataOut(26)         => load26,
                    dataOut(27)         => load27,
                    dataOut(28)         => load28,
                    dataOut(29)         => load29,
                    dataOut(30)         => load30,
                    dataOut(31)         => load31
                );        
                
    RD1OutDecode: Decoder
        port map(
                    dataIn              => Addr1,
                    dataOut(0)          => SA1,
                    dataOut(1)          => SA2, 
                    dataOut(2)          => SA3,
                    dataOut(3)          => SA4,
                    dataOut(4)          => SA5,
                    dataOut(5)          => SA6,
                    dataOut(6)          => SA7,
                    dataOut(7)          => SA8,
                    dataOut(8)          => SA9,
                    dataOut(9)          => SA10,
                    dataOut(10)         => SA11,
                    dataOut(11)         => SA12,
                    dataOut(12)         => SA13,
                    dataOut(13)         => SA14,
                    dataOut(14)         => SA15,
                    dataOut(15)         => SA16,
                    dataOut(16)         => SA17,
                    dataOut(17)         => SA18,
                    dataOut(18)         => SA19,
                    dataOut(19)         => SA20,
                    dataOut(20)         => SA21,
                    dataOut(21)         => SA22,
                    dataOut(22)         => SA23,
                    dataOut(23)         => SA24,
                    dataOut(24)         => SA25,
                    dataOut(25)         => SA26,
                    dataOut(26)         => SA27,
                    dataOut(27)         => SA28,
                    dataOut(28)         => SA29,
                    dataOut(29)         => SA30,
                    dataOut(30)         => SA31,
                    dataOut(31)         => SA32
                );     
                
    RD2OutDecode: Decoder
        port map(
                    dataIn              => Addr2,
                    dataOut(0)          => S1,
                    dataOut(1)          => S2, 
                    dataOut(2)          => S3,
                    dataOut(3)          => S4,
                    dataOut(4)          => S5,
                    dataOut(5)          => S6,
                    dataOut(6)          => S7,
                    dataOut(7)          => S8,
                    dataOut(8)          => S9,
                    dataOut(9)          => S10,
                    dataOut(10)         => S11,
                    dataOut(11)         => S12,
                    dataOut(12)         => S13,
                    dataOut(13)         => S14,
                    dataOut(14)         => S15,
                    dataOut(15)         => S16,
                    dataOut(16)         => S17,
                    dataOut(17)         => S18,
                    dataOut(18)         => S19,
                    dataOut(19)         => S20,
                    dataOut(20)         => S21,
                    dataOut(21)         => S22,
                    dataOut(22)         => S23,
                    dataOut(23)         => S24,
                    dataOut(24)         => S25,
                    dataOut(25)         => S26,
                    dataOut(26)         => S27,
                    dataOut(27)         => S28,
                    dataOut(28)         => S29,
                    dataOut(29)         => S30,
                    dataOut(30)         => S31,
                    dataOut(31)         => S32
                );  
                
    RD1Out: OrGate32_Inputs
        port map(
                    A1           => OutA1,
                    A2           => OutA2,
                    A3           => OutA3,
                    A4           => OutA4,
                    A5           => OutA5,
                    A6           => OutA6,
                    A7           => OutA7,
                    A8           => OutA8,
                    A9           => OutA9,
                    A10          => OutA10,
                    A11          => OutA11,
                    A12          => OutA12,
                    A13          => OutA13,
                    A14          => OutA14,
                    A15          => OutA15,
                    A16          => OutA16,
                    A17          => OutA17,
                    A18          => OutA18,
                    A19          => OutA19,
                    A20          => OutA20,
                    A21          => OutA21,
                    A22          => OutA22,
                    A23          => OutA23,
                    A24          => OutA24,
                    A25          => OutA25,
                    A26          => OutA26,
                    A27          => OutA27,
                    A28          => OutA28,
                    A29          => OutA29,
                    A30          => OutA30,
                    A31          => OutA31,
                    A32          => OutA32,
                    output      => RD1
                );          
                
    RD2Out: OrGate32_Inputs
        port map(
                    A1           => Out1,
                    A2           => Out2,
                    A3           => Out3,
                    A4           => Out4,
                    A5           => Out5,
                    A6           => Out6,
                    A7           => Out7,
                    A8           => Out8,
                    A9           => Out9,
                    A10          => Out10,
                    A11          => Out11,
                    A12          => Out12,
                    A13          => Out13,
                    A14          => Out14,
                    A15          => Out15,
                    A16          => Out16,
                    A17          => Out17,
                    A18          => Out18,
                    A19          => Out19,
                    A20          => Out20,
                    A21          => Out21,
                    A22          => Out22,
                    A23          => Out23,
                    A24          => Out24,
                    A25          => Out25,
                    A26          => Out26,
                    A27          => Out27,
                    A28          => Out28,
                    A29          => Out29,
                    A30          => Out30,
                    A31          => Out31,
                    A32          => Out32,
                    output       => RD2
                );                            
end Behavioral;
