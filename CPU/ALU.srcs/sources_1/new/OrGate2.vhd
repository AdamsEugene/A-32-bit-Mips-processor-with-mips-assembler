----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 06:12:47 PM
-- Design Name: 
-- Module Name: OrGate2 - Behavioral
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

entity OrGate2 is
Port (                                                         
        data1, data2        : in std_logic_vector(1 downto 0); 
        output              : out std_logic_vector(1 downto 0) 
    );                                                         
end OrGate2;

architecture Behavioral of OrGate2 is
    component OrGate1
        Port (
                data1, data2        : in std_logic;
                output              : out std_logic 
            );
    end component;
begin
     OrSmallPart: OrGate1
        port map(
                    data1       => data1(0), 
                    data2       => data2(0),
                    output      => output(0)
                );   
                
    OrBigPart: OrGate1
        port map(
                    data1       => data1(1), 
                    data2       => data2(1),
                    output      => output(1)
                );   
end Behavioral;
