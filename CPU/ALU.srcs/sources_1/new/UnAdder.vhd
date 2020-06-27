----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2019 08:52:28 AM
-- Design Name: 
-- Module Name: Adder32 - Behavioral
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

entity UnAdder is
Port (
        data1, data2        : in std_logic_vector(31 downto 0);
        cin                 : in std_logic;
        sum                 : out std_logic_vector(31 downto 0)
      );
end UnAdder;

architecture Behavioral of UnAdder is
    component Adder32_Bit
        Port (
                data1, data2        : in std_logic_vector(31 downto 0);   
                cin                 : in std_logic;     
                cout                : out std_logic;
                sum                 : out std_logic_vector(31 downto 0)   
              );                 
    end component;
signal  cout    : std_logic;
begin
    Adder32Bit: Adder32_Bit
        port map(
                    data1           => data1,
                    data2           => data2,
                    cin             => cin,
                    cout            => cout,
                    sum             => sum
                );
end Behavioral;

--UnSubtractor