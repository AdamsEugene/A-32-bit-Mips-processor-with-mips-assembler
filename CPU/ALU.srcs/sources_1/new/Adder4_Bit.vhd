----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 11:24:29 AM
-- Design Name: 
-- Module Name: Adder4_Bit - Behavioral
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

entity Adder4_Bit is
Port (
        data1, data2        : in std_logic_vector(3 downto 0);
        cin                 : in std_logic;
        cout                : out std_logic;
        sum                 : out std_logic_vector(3 downto 0)
      );
end Adder4_Bit;

architecture Behavioral of Adder4_Bit is
    component Adder2_Bit
        Port (
                data1, data2        : in std_logic_vector(1 downto 0);
                cin                 : in std_logic;
                cout                : out std_logic;
                sum                 : out std_logic_vector(1 downto 0)
            );
    end component;
    signal preCout      : std_logic;
begin
    AddLow2: Adder2_Bit
        port map(
                    data1        => data1(1 downto 0),
                    data2        => data2(1 downto 0),
                    cin          => cin,
                    cout         => preCout,
                    sum          => sum(1 downto 0)
                );
                
    AddHigh2: Adder2_Bit
        port map(
                    data1        => data1(3 downto 2),
                    data2        => data2(3 downto 2),
                    cin          => preCout,
                    cout         => cout,
                    sum          => sum(3 downto 2)
                );
end Behavioral;

--UnAdder4_Bit
