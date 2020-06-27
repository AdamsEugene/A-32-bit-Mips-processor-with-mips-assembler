----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 10:51:12 AM
-- Design Name: 
-- Module Name: Adder - Behavioral
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
-- 32- BIT ADDER
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

entity Adder32 is
Port (
        data1, data2        : in std_logic_vector(31 downto 0);
        cin                 : in std_logic;
        cout                : out std_logic;
        sum                 : out std_logic_vector(31 downto 0)
    );
end Adder32;

architecture Behavioral of Adder32 is
    component Adder32_Bit
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);
                cin                 : in std_logic;
                cout                : out std_logic;
                sum                 : out std_logic_vector(31 downto 0)
            );
    end component;
 
begin
    Adder32_Bits: Adder32_Bit
        port map(
                    data1        => data1,
                    data2        => data2,
                    cin          => cin,
                    cout         => cout,
                    sum          => sum
                );
end Behavioral;
