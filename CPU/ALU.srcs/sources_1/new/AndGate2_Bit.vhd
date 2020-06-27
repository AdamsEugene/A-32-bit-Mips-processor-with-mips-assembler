----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 12:01:19 PM
-- Design Name: 
-- Module Name: AndGate2_Bit - Behavioral
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

entity AndGate2_Bit is
Port (
        data1, data2        : in std_logic_vector(1 downto 0);
        sum                 : out std_logic_vector(1 downto 0)
      );
end AndGate2_Bit;

architecture Behavioral of AndGate2_Bit is
    component AndGate1_Bit
        Port (
                data1, data2        : in std_logic;
                sum                 : out std_logic
            );
    end component;
begin
     AndLow1: AndGate1_Bit
        port map(
                    data1        => data1(0),
                    data2        => data2(0),
                    sum          => sum(0)
                );
                
    AndHigh1: AndGate1_Bit
        port map(
                    data1        => data1(1),
                    data2        => data2(1),
                    sum          => sum(1)
                );
end Behavioral;

--NorGate2_Bit