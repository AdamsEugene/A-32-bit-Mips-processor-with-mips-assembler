----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 11:02:52 AM
-- Design Name: 
-- Module Name: Adder32_Bit - Behavioral
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

entity Adder32_Bit is
Port (
        data1, data2        : in std_logic_vector(31 downto 0);
        cin                 : in std_logic;
        cout                : out std_logic;
        sum                 : out std_logic_vector(31 downto 0)
      );
end Adder32_Bit;

architecture Behavioral of Adder32_Bit is
    component Adder16_Bit
        Port (
                data1, data2        : in std_logic_vector(15 downto 0);
                cin                 : in std_logic;
                cout                : out std_logic;
                sum                 : out std_logic_vector(15 downto 0)
            );
    end component;
    signal preCout      : std_logic;
begin
    AddLow16: Adder16_Bit
        port map(
                    data1        => data1(15 downto 0),
                    data2        => data2(15 downto 0),
                    cin          => cin,
                    cout         => preCout,
                    sum          => sum(15 downto 0)
                );
                
    AddHigh16: Adder16_Bit
        port map(
                    data1        => data1(31 downto 16),
                    data2        => data2(31 downto 16),
                    cin          => preCout,
                    cout         => cout,
                    sum          => sum(31 downto 16)
                );
end Behavioral;

--UnAdder32_Bit
