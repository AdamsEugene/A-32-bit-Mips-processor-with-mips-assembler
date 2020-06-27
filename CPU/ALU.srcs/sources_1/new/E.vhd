----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 12:20:38 AM
-- Design Name: 
-- Module Name: E - Behavioral
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

entity E is
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
end E;

architecture Behavioral of E is
    component E_StageReg
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
begin
    ES: E_StageReg   
        port map(
                    CLK         => CLK,
                    FlushE      => FlushE,
                    WeH         => WeH,
                    WeL         => WeL,
                    WeHE        => WeHE,
                    WeLE        => WeLE,
                    MemWriteD   => MemWriteD,
                    SignD       => SignD,
                    SignE       => SignE,
                    RsD         => RsD,
                    RtD         => RtD,
                    ShamtD      => ShamtD,
                    ShamtE      => ShamtE,
                    ALUSrcD     => ALUSrcD,
                    RegWriteD   => RegWriteD,
                    RdEIn       => RdEIn,
                    RegDstD     => RegDstD,
                    MemtoRegD   => MemtoRegD,
                    ALUControlD => ALUControlD,
                    RsE         => RsE,
                    RtE         => RtE,
                    RegWriteE   => RegWriteE,
                    SignImmD    => SignImmD,
                    SignImmE    => SignImmE,
                    ZeroImmD    => ZeroImmD,
                    ZeroImmE    => ZeroImmE,
                    LUpImD      => LUpImD,
                    LUpImE      => LUpImE,
                    PCPlus4D    => PCPlus4D,
                    PCPlus4E    => PCPlus4E,
                    ALUSrcE     => ALUSrcE,
                    RdE         => RdE,
                    MemtoRegE   => MemtoRegE,
                    MemWriteE   => MemWriteE,
                    RegDstE     => RegDstE,
                    ALUControlE => ALUControlE,
                    RD1In       => RD1In,
                    RD2In       => RD2In,
                    RD1         => RD1,
                    RD2         => RD2
                );
end Behavioral;
