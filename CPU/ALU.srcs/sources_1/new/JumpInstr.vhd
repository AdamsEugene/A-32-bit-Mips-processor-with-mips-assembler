----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2019 03:49:47 PM
-- Design Name: 
-- Module Name: JumpInstr - Behavioral
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

entity JumpInstr is
Port (
        dataIn              : in std_logic_vector(25 downto 0);
        output              : out std_logic_vector(27 downto 0) 
    );
end JumpInstr;

architecture Behavioral of JumpInstr is
    signal data     : std_logic_vector(27 downto 0);
begin   
    data <= dataIn & "00";
    output <= data;
end Behavioral;
