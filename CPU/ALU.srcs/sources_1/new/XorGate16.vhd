----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 08:58:49 PM
-- Design Name: 
-- Module Name: XorGate16 - Behavioral
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

entity XorGate16 is
Port (                                                                
        data1, data2            : in std_logic_vector(15 downto 0);   
        output                  : out std_logic_vector(15 downto 0)   
    );                                                                
end XorGate16;

architecture Behavioral of XorGate16 is
    component XorGate8
        Port (
                data1, data2            : in std_logic_vector(7 downto 0);
                output                  : out std_logic_vector(7 downto 0)
            );
    end component;
begin
     XorSmallPart: XorGate8
        port map(
                    data1       => data1(7 downto 0),
                    data2       => data2(7 downto 0),
                    output      => output(7 downto 0)
                );
                
     XorBigPart: XorGate8
        port map(
                    data1       => data1(15 downto 8),
                    data2       => data2(15 downto 8),
                    output      => output(15 downto 8)
                );
end Behavioral;
