----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2019 02:04:13 PM
-- Design Name: 
-- Module Name: Mux5BitIn - Behavioral
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

entity Mux5BitIn is
Port (
        data1, data2            : in std_logic_vector(4 downto 0);
        selector                : in std_logic;
        output                  : out std_logic_vector(4 downto 0)
    );
end Mux5BitIn;

architecture Behavioral of Mux5BitIn is

begin
    output <= data1 when selector = '0' else data2;
end Behavioral;
