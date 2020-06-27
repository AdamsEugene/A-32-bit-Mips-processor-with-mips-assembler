----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 07:33:34 PM
-- Design Name: 
-- Module Name: NotGate16 - Behavioral
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

entity NotGate16 is
Port (                                                 
        data2       : in std_logic_vector(15 downto 0);
        data2Bar    : out std_logic_vector(15 downto 0)
    );                                                 
end NotGate16;

architecture Behavioral of NotGate16 is
    component NotGate8
        Port (
                data2       : in std_logic_vector(7 downto 0);
                data2Bar    : out std_logic_vector(7 downto 0) 
            );
    end component;
begin
    NotSmallPart: NotGate8
        port map(
                    data2       => data2(7 downto 0),
                    data2Bar    => data2Bar(7 downto 0)
                );
                
    NotBigPart: NotGate8
        port map(
                    data2       => data2(15 downto 8),
                    data2Bar    => data2Bar(15 downto 8)
                );       
end Behavioral;
