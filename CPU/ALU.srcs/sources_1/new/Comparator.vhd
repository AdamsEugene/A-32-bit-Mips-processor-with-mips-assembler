----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2020 07:17:01 PM
-- Design Name: 
-- Module Name: Comparator - Behavioral
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

entity Comparator is
Port (
        data1, data2        : in std_logic_vector(31 downto 0);
        EqualD, NotEq, BGreat, Bless        : out std_logic;
        lsb                 : in std_logic_vector(1 downto 0)
    );
end Comparator;
   
architecture Behavioral of Comparator is

begin
    EqualD <= '1' when (data1 = data2) and (lsb = "00") else '0'; 
    NotEq <= '1' when (data1 /= data2) and (lsb = "01") else '0';   
    BGreat <= '1' when (data1 > data2) and (lsb = "11") else '0';
    Bless <= '1' when (data1 <= data2) and (lsb = "10") else '0'; 
end Behavioral;
