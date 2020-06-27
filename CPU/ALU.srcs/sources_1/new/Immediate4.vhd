----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2019 02:23:05 PM
-- Design Name: 
-- Module Name: Immediate4 - Behavioral
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

entity Immediate4 is
Port (
        dataIn              : in std_logic_vector(29 downto 0);
        output              : out std_logic_vector(31 downto 0)
    );
end Immediate4;

architecture Behavioral of Immediate4 is
begin
    output <= dataIn(29 downto 0)  &  "00";
end Behavioral;
