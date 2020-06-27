----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 07:39:19 PM
-- Design Name: 
-- Module Name: NotGate2 - Behavioral
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

entity NotGate2 is
Port (                                                
        data2       : in std_logic_vector(1 downto 0);
        data2Bar    : out std_logic_vector(1 downto 0)
    );                                                
end NotGate2;

architecture Behavioral of NotGate2 is
    component NotGate1
        Port (
                data2       : in std_logic;
                data2Bar    : out std_logic 
            );
    end component;
begin
    NotSmallPart: NotGate1
        port map(
                    data2       => data2(0),
                    data2Bar    => data2Bar(0)
                );
                
    NotBigPart: NotGate1
        port map(
                    data2       => data2(1),
                    data2Bar    => data2Bar(1)
                );   
end Behavioral;
