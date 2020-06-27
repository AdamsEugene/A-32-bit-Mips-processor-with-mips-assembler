----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2019 01:21:53 PM
-- Design Name: 
-- Module Name: Mux4InBit - Behavioral
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

entity Mux4InBit is
Port (
        in1, in2, in3, in4      : in std_logic_vector(31 downto 0);
        output                  : out std_logic_vector(31 downto 0);
        selector                : in std_logic_vector(1 downto 0)
    );
end Mux4InBit;

architecture Behavioral of Mux4InBit is

begin
    output <= in1 when selector = "00" else
              in2 when selector = "01" else
              in3 when selector = "10" else
              in4;
end Behavioral;
