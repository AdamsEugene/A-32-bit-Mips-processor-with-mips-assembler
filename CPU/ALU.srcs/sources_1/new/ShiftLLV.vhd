----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2019 02:14:23 PM
-- Design Name: 
-- Module Name: ShiftLL - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShiftLLV is
Port (
        data1           : in std_logic_vector(31 downto 0);
        value           : in std_logic_vector(4 downto 0);
        output          : out std_logic_vector(31 downto 0)
    );
end ShiftLLV;

architecture Behavioral of ShiftLLV is
    component ShiftLLV32
        Port (
                data1           : in std_logic_vector(31 downto 0);
                value           : in std_logic_vector(4 downto 0);
                output          : out std_logic_vector(31 downto 0)
            );
    end component;
begin
    ShiftLiftLV: ShiftLLV32
        port map(
                    data1           => data1,
                    value           => value,
                    output          => output
                );
end Behavioral;
