----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 11:43:06 PM
-- Design Name: 
-- Module Name: M_StageReg - Behavioral
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

entity M_StageReg is
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
end M_StageReg;

architecture Behavioral of M_StageReg is

begin
    process(all)
    begin
        if (rising_edge(CLK)) then
            RegWriteM   <= RegWriteE;
            MemtoRegM   <= MemtoRegE;
            MemWriteM   <= MemWriteE;
            WeHM        <= WeHE;
            WeLM        <= WeLE;
            SignM       <= SignE;
            ALUOutM     <= ALUOutE;
            WriteDataM  <= WriteDataE;
            WriteRegM   <= WriteRegE;
            LUpImM      <= LUpImE;
            SignImmM    <= SignImmE;
            PCPlus4M    <= PCPlus4E;
            RsM         <= RsE;
        end if;
    end process;
end Behavioral;
