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

entity NorGate is
Port (
        data1, data2        : in std_logic_vector(31 downto 0);
        sum                 : out std_logic_vector(31 downto 0)
    );
end NorGate;

architecture Behavioral of NorGate is
    component NorGate32_Bit
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                sum                 : out std_logic_vector(31 downto 0)
            );
    end component;
 
begin
    NorGate32_Bits: NorGate32_Bit
        port map(
                    data1        => data1,
                    data2        => data2,
                    sum          => sum
                );
end Behavioral;

--NorGate
