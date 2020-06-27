----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 04:46:09 PM
-- Design Name: 
-- Module Name: SLThenU - Behavioral
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

entity SLThenU is
Port (
        data1, data2            : in std_logic_vector(31 downto 0);
        output                  : out std_logic_vector(31 downto 0)
    );
end SLThenU;

architecture Behavioral of SLThenU is
    signal undata1, undata2, unoutput : unsigned(31 downto 0); 
begin
    undata1 <= unsigned(data1);
    undata2 <= unsigned(data2);
    unoutput <= X"00000001" when undata1 < undata2 else X"00000000";
    output <= std_logic_vector(unoutput);
end Behavioral;
