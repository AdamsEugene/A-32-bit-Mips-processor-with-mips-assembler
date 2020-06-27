----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/08/2020 12:50:45 PM
-- Design Name: 
-- Module Name: MuxTwoIn - Behavioral
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

entity MuxTwoIn is
generic(N: integer :=32);
Port (
        In1, In2            : in std_logic_vector(N-1 downto 0);
        selector            : in std_logic;
        output              : out std_logic_vector(N-1 downto 0)
    );
end MuxTwoIn;

architecture Behavioral of MuxTwoIn is

begin
    output <= In2 when selector = '1' else In1;
end Behavioral;
