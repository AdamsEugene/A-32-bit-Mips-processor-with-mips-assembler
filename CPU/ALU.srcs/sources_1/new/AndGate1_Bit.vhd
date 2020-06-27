----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 12:04:12 PM
-- Design Name: 
-- Module Name: AndGate1_Bit - Behavioral
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

entity AndGate1_Bit is
Port (
        data1, data2        : in std_logic;
        sum                 : out std_logic
      );
end AndGate1_Bit;

architecture Behavioral of AndGate1_Bit is

begin
    sum <= data1 and data2;
end Behavioral;

--NorGate1_Bit
