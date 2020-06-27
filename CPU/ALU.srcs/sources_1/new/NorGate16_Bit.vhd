----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 11:52:05 AM
-- Design Name: 
-- Module Name: AndGate16_Bit - Behavioral
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

entity NorGate16_Bit is
Port (
        data1, data2        : in std_logic_vector(15 downto 0);
        sum                 : out std_logic_vector(15 downto 0)
      );
end NorGate16_Bit;

architecture Behavioral of NorGate16_Bit is
    component NorGate8_Bit
        Port (
                data1, data2        : in std_logic_vector(7 downto 0);
                sum                 : out std_logic_vector(7 downto 0)
            );
    end component;
begin
    AndLow8: NorGate8_Bit
        port map(
                    data1        => data1(7 downto 0),
                    data2        => data2(7 downto 0),
                    sum          => sum(7 downto 0)
                );
                
    AndHigh8: NorGate8_Bit
        port map(
                    data1        => data1(15 downto 8),
                    data2        => data2(15 downto 8),
                    sum          => sum(15 downto 8)
                );
end Behavioral;

--NorGate16_Bit
