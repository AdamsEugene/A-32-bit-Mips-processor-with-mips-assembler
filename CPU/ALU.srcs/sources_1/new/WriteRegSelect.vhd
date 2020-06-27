----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2019 01:59:44 PM
-- Design Name: 
-- Module Name: WriteRegSelect - Behavioral
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

entity WriteRegSelect is
Port (
        data1, data2            : in std_logic_vector(4 downto 0);
        selector                : in std_logic;
        output                  : out std_logic_vector(4 downto 0)
    );
end WriteRegSelect;

architecture Behavioral of WriteRegSelect is
    component Mux5BitIn
        Port (
                data1, data2            : in std_logic_vector(4 downto 0);
                selector                : in std_logic;
                output                  : out std_logic_vector(4 downto 0)
            );
    end component;
begin
    Mux5Bit: Mux5BitIn
        port map(
                    data1           => data1,
                    data2           => data2,
                    selector        => selector,
                    output          => output
                );
end Behavioral;
