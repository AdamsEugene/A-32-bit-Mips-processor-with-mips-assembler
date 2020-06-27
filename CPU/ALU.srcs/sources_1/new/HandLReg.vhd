----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2020 12:48:07 PM
-- Design Name: 
-- Module Name: HandLReg - Behavioral
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

entity HandLReg is
Port (
        clk, weh, wel           : in std_logic;
        Write                   : in std_logic_vector(31 downto 0);
        ReadH, ReadL            : out std_logic_vector(31 downto 0) 
    );
end HandLReg;

architecture Behavioral of HandLReg is
begin
    Write_Hi: process (all)
    begin 
        if (falling_edge(clk)) then 
            if (weh = '1') then
                ReadH <= Write;
            end if;
        end if;
    end process;
    Write_Low: process (all)
    begin 
        if (falling_edge(clk)) then 
            if (wel = '1') then
                ReadL <= Write;
            end if;
        end if;
    end process;
end Behavioral;
