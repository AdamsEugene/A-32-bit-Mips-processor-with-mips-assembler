----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2019 05:41:17 PM
-- Design Name: 
-- Module Name: ImmBy4 - Behavioral
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

entity ImmBy4 is
Port (
        dataIn              : in std_logic_vector(31 downto 0);
        output              : out std_logic_vector(31 downto 0)
    );
end ImmBy4;

architecture Behavioral of ImmBy4 is
    component Immediate4
        Port (
                dataIn              : in std_logic_vector(31 downto 0);
                output              : out std_logic_vector(31 downto 0)
            );
    end component;
begin
    ImmByFour: Immediate4
        port map(
                    dataIn          => dataIn,
                    output          => output
                );
end Behavioral;
