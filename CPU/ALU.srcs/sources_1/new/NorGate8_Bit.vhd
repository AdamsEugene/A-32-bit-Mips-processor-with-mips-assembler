----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 11:56:05 AM
-- Design Name: 
-- Module Name: AndGate8_Bit - Behavioral
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

entity NorGate8_Bit is
Port (
       data1, data2        : in std_logic_vector(7 downto 0);
       sum                 : out std_logic_vector(7 downto 0)
     );
end NorGate8_Bit;

architecture Behavioral of NorGate8_Bit is
    component NorGate4_Bit
        Port (
                data1, data2        : in std_logic_vector(3 downto 0);
                sum                 : out std_logic_vector(3 downto 0)
            );
    end component;
begin
    AndLow4: NorGate4_Bit
        port map(
                    data1        => data1(3 downto 0),
                    data2        => data2(3 downto 0),
                    sum          => sum(3 downto 0)
                );
                
    AndHigh4: NorGate4_Bit
        port map(
                    data1        => data1(7 downto 4),
                    data2        => data2(7 downto 4),
                    sum          => sum(7 downto 4)
                );
end Behavioral;

--NorGate8_Bit
