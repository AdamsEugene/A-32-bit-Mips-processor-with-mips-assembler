----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 11:55:32 PM
-- Design Name: 
-- Module Name: W_StageReg - Behavioral
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

entity W_StageReg is
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
end W_StageReg;

architecture Behavioral of W_StageReg is

begin
    process(all)
    begin
        if (rising_edge(CLK)) then
            RegWriteW   <= RegWriteM;
            MemtoRegW   <= MemtoRegM;
            WeLW        <= WeLM;
            WeHW        <= WeHM;
            ReadDataW   <= RDM;
            ALUOutW     <= ALUOutM;
            WriteRegW   <= WriteRegM;
            PCPlus4W    <= PCPlus4M;
            LUpImW      <= LUpImM;
        end if;
    end process;
end Behavioral;
