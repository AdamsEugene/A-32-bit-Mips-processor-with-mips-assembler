----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 07:25:19 PM
-- Design Name: 
-- Module Name: NotGate - Behavioral
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

entity NotGate is
Port (
        data2       : in std_logic_vector(31 downto 0);
        data2Bar    : out std_logic_vector(31 downto 0) 
    );
end NotGate;

architecture Behavioral of NotGate is
    component NotGate32
        Port (
                data2       : in std_logic_vector(31 downto 0);
                data2Bar    : out std_logic_vector(31 downto 0) 
            );
    end component;
begin
    NotGate32_Bit: NotGate32
        port map(
                    data2       => data2,
                    data2Bar    => data2Bar
                );
end Behavioral;
