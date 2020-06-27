----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 04:27:54 PM
-- Design Name: 
-- Module Name: SLThen - Behavioral
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

entity SetGrtThen is
Port (
        data1, data2            : in std_logic_vector(31 downto 0);
        output                  : out std_logic_vector(31 downto 0)
    );
end SetGrtThen;

architecture Behavioral of SetGrtThen is

begin
    output <= X"00000001" when 
            (data1 > data2) 
                else 
                    X"00000000";
end Behavioral;
