----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2020 02:18:16 PM
-- Design Name: 
-- Module Name: MUX3In - Behavioral
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

entity MUX3In is
generic(N: integer :=32);
Port (
        a, b, c : in std_logic_vector(N-1 downto 0);
        o       : out std_logic_vector(N-1 downto 0);
        s       : in std_logic_vector(1 downto 0) 
    );
end MUX3In;

architecture Behavioral of MUX3In is

begin
    o <= a when s = "00" else
         b when s = "01" else 
         c;
end Behavioral;
