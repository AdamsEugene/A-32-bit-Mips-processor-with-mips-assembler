----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2019 04:51:08 PM
-- Design Name: 
-- Module Name: FillLow0 - Behavioral
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

entity FillLow0 is
Port (
        dataIn          : in std_logic_vector(15 downto 0);
        output          : out std_logic_vector(31 downto 0)
    );
end FillLow0;

architecture Behavioral of FillLow0 is

begin
    output <= dataIn & (15 downto 0 => '0');
end Behavioral;
