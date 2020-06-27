----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 08:51:01 PM
-- Design Name: 
-- Module Name: XorGate - Behavioral
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

entity XorGate is
Port (
        data1, data2            : in std_logic_vector(31 downto 0);
        output                  : out std_logic_vector(31 downto 0)
     );
end XorGate;

architecture Behavioral of XorGate is
    component XorGate32
        Port (
                data1, data2            : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0)
            );
    end component;
begin
    XxorGate: XorGate32
        port map(
                    data1       => data1,
                    data2       => data2,
                    output      => output
                );
end Behavioral;
