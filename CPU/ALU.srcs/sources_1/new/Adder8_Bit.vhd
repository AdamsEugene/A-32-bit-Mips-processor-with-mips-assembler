----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 11:20:10 AM
-- Design Name: 
-- Module Name: Adder8_Bit - Behavioral
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

entity Adder8_Bit is
Port (
        data1, data2        : in std_logic_vector(7 downto 0);
        cin                 : in std_logic;
        cout                : out std_logic;
        sum                 : out std_logic_vector(7 downto 0)
      );
end Adder8_Bit;

architecture Behavioral of Adder8_Bit is
    component Adder4_Bit
        Port (
                data1, data2        : in std_logic_vector(3 downto 0);
                cin                 : in std_logic;
                cout                : out std_logic;
                sum                 : out std_logic_vector(3 downto 0)
            );
    end component;
    signal preCout      : std_logic;
begin
    AddLow4: Adder4_Bit
        port map(
                    data1        => data1(3 downto 0),
                    data2        => data2(3 downto 0),
                    cin          => cin,
                    cout         => preCout,
                    sum          => sum(3 downto 0)
                );
                
    AddHigh4: Adder4_Bit
        port map(
                    data1        => data1(7 downto 4),
                    data2        => data2(7 downto 4),
                    cin          => preCout,
                    cout         => cout,
                    sum          => sum(7 downto 4)
                );
end Behavioral;

--UnAdder8_Bit