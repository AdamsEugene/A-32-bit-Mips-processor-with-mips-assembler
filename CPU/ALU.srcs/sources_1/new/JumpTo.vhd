----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2019 06:32:36 PM
-- Design Name: 
-- Module Name: JumpTo - Behavioral
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

entity JumpTo is
Port (
        dataIn              : in std_logic_vector(25 downto 0);
        output              : out std_logic_vector(27 downto 0) 
    );
end JumpTo;

architecture Behavioral of JumpTo is
    component JumpInstr
        Port (
                dataIn              : in std_logic_vector(25 downto 0);
                output              : out std_logic_vector(27 downto 0) 
            );
    end component;
begin
    Jump: JumpInstr
        port map(
                    dataIn          => dataIn,
                    output          => output
                );
end Behavioral;
