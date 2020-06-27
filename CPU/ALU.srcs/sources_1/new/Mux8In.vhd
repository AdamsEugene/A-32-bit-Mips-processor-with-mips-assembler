----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2020 10:15:21 PM
-- Design Name: 
-- Module Name: Mux8In - Behavioral
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

entity Mux8In is
generic(N: integer :=32); 
Port (
        a, b, c, d, e, f, g, h  : in std_logic_vector(N-1 downto 0);
        s                       : in std_logic_vector(2 downto 0);
        o                       : out std_logic_vector(N-1 downto 0) 
    );
end Mux8In;

architecture Behavioral of Mux8In is

begin
    o <= a when s = "000" else 
         b when s = "001" else 
         c when s = "010" else 
         d when s = "011" else 
         e when s = "100" else 
         f when s = "101" else 
         g when s = "110" else 
         h ;
end Behavioral;
