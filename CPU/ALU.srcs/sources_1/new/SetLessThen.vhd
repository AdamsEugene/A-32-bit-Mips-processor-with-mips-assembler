----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 04:23:54 PM
-- Design Name: 
-- Module Name: SetLessThen - Behavioral
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

entity SetLessThen is
Port (
        data1, data2            : in std_logic_vector(31 downto 0);
        output                  : out std_logic_vector(31 downto 0)
    );
end SetLessThen;

architecture Behavioral of SetLessThen is
    component SLThen
        Port (
                data1, data2            : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0)
            );
    end component;
begin
    SetLess: SLThen
        port map(
                    data1           => data1,
                    data2           => data2,
                    output          => output
                );
end Behavioral;
