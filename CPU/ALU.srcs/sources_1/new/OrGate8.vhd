----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 06:08:19 PM
-- Design Name: 
-- Module Name: OrGate8 - Behavioral
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

entity OrGate8 is
Port (                                                           
        data1, data2        : in std_logic_vector(7 downto 0);   
        output              : out std_logic_vector(7 downto 0)   
    );                                                           
end OrGate8;

architecture Behavioral of OrGate8 is
    component OrGate4
        Port (
                data1, data2        : in std_logic_vector(3 downto 0);
                output              : out std_logic_vector(3 downto 0) 
            );
    end component;
begin
    OrSmallPart: OrGate4
        port map(
                    data1       => data1(3 downto 0), 
                    data2       => data2(3 downto 0),
                    output      => output(3 downto 0)
                );   
                
    OrBigPart: OrGate4
        port map(
                    data1       => data1(7 downto 4), 
                    data2       => data2(7 downto 4),
                    output      => output(7 downto 4)
                );   
end Behavioral;
