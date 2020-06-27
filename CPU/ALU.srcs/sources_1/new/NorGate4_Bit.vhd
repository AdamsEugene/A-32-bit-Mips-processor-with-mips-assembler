----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 11:59:02 AM
-- Design Name: 
-- Module Name: AndGate4_Bit - Behavioral
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

entity NorGate4_Bit is
Port (
        data1, data2        : in std_logic_vector(3 downto 0);
        sum                 : out std_logic_vector(3 downto 0)
      );
end NorGate4_Bit;

architecture Behavioral of NorGate4_Bit is
    component NorGate2_Bit
        Port (
                data1, data2        : in std_logic_vector(1 downto 0);
                sum                 : out std_logic_vector(1 downto 0)
            );
    end component;
begin
    AndLow2: NorGate2_Bit
        port map(
                    data1        => data1(1 downto 0),
                    data2        => data2(1 downto 0),
                    sum          => sum(1 downto 0)
                );
                
    AndHigh2: NorGate2_Bit
        port map(
                    data1        => data1(3 downto 2),
                    data2        => data2(3 downto 2),
                    sum          => sum(3 downto 2)
                );
end Behavioral;

--NorGate4_Bit
