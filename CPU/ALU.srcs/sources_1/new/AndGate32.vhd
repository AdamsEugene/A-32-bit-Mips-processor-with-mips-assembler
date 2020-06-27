----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 01:04:42 PM
-- Design Name: 
-- Module Name: AndGate32 - Behavioral
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

entity AndGate32 is
Port (
        data1, data2        : in std_logic_vector(31 downto 0);
        sum                 : out std_logic_vector(31 downto 0)
    );
end AndGate32;

architecture Behavioral of AndGate32 is
    component AndGate32_Bit
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                sum                 : out std_logic_vector(31 downto 0)
            );
    end component;
 
begin
    AndGate32_Bits: AndGate32_Bit
        port map(
                    data1        => data1,
                    data2        => data2,
                    sum          => sum
                );
end Behavioral;

--NorGate
