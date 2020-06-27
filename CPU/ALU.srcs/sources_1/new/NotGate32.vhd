----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 07:30:44 PM
-- Design Name: 
-- Module Name: NotGate32 - Behavioral
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

entity NotGate32 is
Port (                                                 
        data2       : in std_logic_vector(31 downto 0);
        data2Bar    : out std_logic_vector(31 downto 0)
    );                                                 
end NotGate32;

architecture Behavioral of NotGate32 is
    component NotGate16
        Port (
                data2       : in std_logic_vector(15 downto 0);
                data2Bar    : out std_logic_vector(15 downto 0) 
            );
    end component;
begin
    NotSmallPart: NotGate16
        port map(
                    data2       => data2(15 downto 0),
                    data2Bar    => data2Bar(15 downto 0)
                );
                
    NotBigPart: NotGate16
        port map(
                    data2       => data2(31 downto 16),
                    data2Bar    => data2Bar(31 downto 16)
                );            
end Behavioral;
