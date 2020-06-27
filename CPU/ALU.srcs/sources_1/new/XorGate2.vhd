----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 09:04:11 PM
-- Design Name: 
-- Module Name: XorGate2 - Behavioral
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

entity XorGate2 is
 Port (                                                             
         data1, data2            : in std_logic_vector(1 downto 0); 
         output                  : out std_logic_vector(1 downto 0) 
     );                                                             
end XorGate2;

architecture Behavioral of XorGate2 is
    component XorGate1
        Port (
                data1, data2            : in std_logic;
                output                  : out std_logic
            );
    end component;
begin
    XorSmallPart: XorGate1
        port map(
                    data1       => data1(0),
                    data2       => data2(0),
                    output      => output(0)
                );
                
     XorBigPart: XorGate1
        port map(
                    data1       => data1(1),
                    data2       => data2(1),
                    output      => output(1)
                );
end Behavioral;
