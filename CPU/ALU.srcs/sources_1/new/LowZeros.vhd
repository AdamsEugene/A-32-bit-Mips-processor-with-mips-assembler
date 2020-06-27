----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2019 04:47:57 PM
-- Design Name: 
-- Module Name: LowZeros - Behavioral
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

entity LowZeros is
Port (
        dataIn          : in std_logic_vector(15 downto 0);
        output          : out std_logic_vector(31 downto 0)
    );
end LowZeros;

architecture Behavioral of LowZeros is
    component FillLow0
        Port (
                dataIn          : in std_logic_vector(15 downto 0);
                output          : out std_logic_vector(31 downto 0)
            );
    end component;
begin
    LowZero: FillLow0
        port map(
                    dataIn          => dataIn,
                    output          => output
                );
end Behavioral;
