----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 12:14:50 AM
-- Design Name: 
-- Module Name: M - Behavioral
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

entity M is
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
end M;

architecture Behavioral of M is
    component M_StageReg
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
begin
    MS: M_StageReg
        port map(
                    CLK             => CLK,
                    RegWriteE       => RegWriteE,
                    MemtoRegE       => MemtoRegE,
                    MemWriteE       => MemWriteE,
                    SignE           => SignE,
                    WeHE            => WeHE,
                    WeLE            => WeLE,
                    WeHM            => WeHM,
                    WeLM            => WeLM,
                    RegWriteM       => RegWriteM,
                    MemtoRegM       => MemtoRegM,
                    MemWriteM       => MemWriteM,
                    SignM           => SignM,
                    ALUOutE         => ALUOutE,
                    WriteDataE      => WriteDataE,
                    ALUOutM         => ALUOutM,
                    WriteDataM      => WriteDataM,
                    WriteRegE       => WriteRegE,
                    WriteRegM       => WriteRegM,
                    LUpImE          => LUpImE,
                    LUpImM          => LUpImM,
                    SignImmM        => SignImmM,
                    SignImmE        => SignImmE,
                    PCPlus4E        => PCPlus4E,
                    PCPlus4M        => PCPlus4M,
                    RsE             => RsE,
                    RsM             => RsM
                );
end Behavioral;
