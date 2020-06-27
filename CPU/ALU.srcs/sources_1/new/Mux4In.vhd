----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2019 01:16:54 PM
-- Design Name: 
-- Module Name: Mux4In - Behavioral
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

entity Mux4In is
Port (
        in1, in2, in3, in4      : in std_logic_vector(31 downto 0);
        output                  : out std_logic_vector(31 downto 0);
        selector                : in std_logic_vector(1 downto 0)
    );
end Mux4In;

architecture Behavioral of Mux4In is
    component Mux4InBit
        Port (
                in1, in2, in3, in4      : in std_logic_vector(31 downto 0);
                output                  : out std_logic_vector(31 downto 0);
                selector                : in std_logic_vector(1 downto 0)
            );
    end component;
begin
    Mux4InBits: Mux4InBit
        port map(
                    in1         => in1,
                    in2         => in2,
                    in3         => in3,
                    in4         => in4,
                    selector    => selector,
                    output      => output
                );
end Behavioral;
