----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2020 12:06:28 PM
-- Design Name: 
-- Module Name: Reg_File - Behavioral
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

entity P_Reg_File is
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
end P_Reg_File;

architecture Behavioral of P_Reg_File is
    type ramType is array(31 downto 0) of std_logic_vector(31 downto 0);
    signal Mem: ramType;
begin
    Write: process (clk)
    begin
        if (falling_edge(clk)) then
            if  (WE3 = '1') then
                Mem(to_integer(unsigned(Addr3))) <= WD3;
            end if;
        end if;
    end process;
    
    Read: process (all)
    begin     
        if (Addr1 = "00000") then 
            RD1 <= X"00000000";
        else
            RD1 <= Mem (to_integer(unsigned(Addr1)));    
        end if;
        if (Addr2 = "00000") then
            RD2 <= X"00000000";
        else
            RD2 <= Mem (to_integer(unsigned(Addr2)));    
        end if;
    end process;
end Behavioral;

--    RD1 <= X"00000000" when (Addr1 = "00000") else 
--           Mem (to_integer(unsigned(Addr1))); 
    
--    RD2 <= X"00000000" when (Addr2 = "00000") else
--           Mem (to_integer(unsigned(Addr2)));    