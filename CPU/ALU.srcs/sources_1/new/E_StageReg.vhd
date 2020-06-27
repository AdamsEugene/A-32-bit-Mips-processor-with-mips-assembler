----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 11:12:07 PM
-- Design Name: 
-- Module Name: E_StageReg - Behavioral
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

entity E_StageReg is
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
end E_StageReg;

architecture Behavioral of E_StageReg is

begin
    process(all)
    begin
        if (rising_edge(CLK)) then
            if (FlushE = '1') then 
                RD1         <= X"00000000";
                RD2         <= X"00000000";
                ALUControlE <= "000000";
                SignImmE    <= X"00000000";
                ZeroImmE    <= X"00000000";
                LUpImE      <= X"00000000";
                ShamtE      <= "00000";
                PCPlus4E    <= X"00000000";
                RegWriteE   <= '0';
                ALUSrcE     <= "00";
                MemWriteE   <= '0';
                SignE       <= '0';
                RegDstE     <= "00";
                MemtoRegE   <= "00";
                RsE         <= "00000";
                RtE         <= "00000";
                RdE         <= "00000";
                WeHE        <= '0';
                WeLE        <= '0';
            else
                RD1         <= RD1In;
                RD2         <= RD2In;
                WeHE        <= WeH;
                WeLE        <= WeL;
                SignImmE    <= SignImmD;
                ZeroImmE    <= ZeroImmD;
                LUpImE      <= LUpImD;
                PCPlus4E    <= PCPlus4D;
                RsE         <= RsD;
                RtE         <= RtD;
                RdE         <= RdEIn;
                RegWriteE   <= RegWriteD;
                ALUSrcE     <= ALUSrcD;
                MemtoRegE   <= MemtoRegD;
                MemWriteE   <= MemWriteD;
                SignE       <= SignD;
                RegDstE     <= RegDstD;
                ALUControlE <= ALUControlD;
                ShamtE      <= ShamtD;
            end if; 
        end if;
    end process;
end Behavioral;
