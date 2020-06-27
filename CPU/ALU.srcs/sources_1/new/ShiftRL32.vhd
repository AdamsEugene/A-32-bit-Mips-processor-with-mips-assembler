----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2019 02:34:33 PM
-- Design Name: 
-- Module Name: ShiftLL32 - Behavioral
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

entity ShiftRL32 is
Port (
        data1           : in std_logic_vector(31 downto 0);
        shiftAmount     : in std_logic_vector(4 downto 0);
        output          : out std_logic_vector(31 downto 0)
    );
end ShiftRL32;

architecture Behavioral of ShiftRL32 is

begin
    with shiftAmount select
        output <= data1                                                           when "00000",
                    '0'                              &  data1(31 downto 1)        when "00001",
                    "00"                             &  data1(31 downto 2)        when "00010",
                    "000"                            &  data1(31 downto 3)        when "00011",
                    "0000"                           &  data1(31 downto 4)        when "00100",
                    "00000"                          &  data1(31 downto 5)        when "00101",
                    "000000"                         &  data1(31 downto 6)        when "00110",
                    "0000000"                        &  data1(31 downto 7)        when "00111",
                    "00000000"                       &  data1(31 downto 8)        when "01000",
                    "000000000"                      &  data1(31 downto 9)        when "01001",
                    "0000000000"                     &  data1(31 downto 10)       when "01010",
                    "00000000000"                    &  data1(31 downto 11)       when "01011",
                    "000000000000"                   &  data1(31 downto 12)       when "01100",
                    "0000000000000"                  &  data1(31 downto 13)       when "01101",
                    "00000000000000"                 &  data1(31 downto 14)       when "01110",
                    "000000000000000"                &  data1(31 downto 15)       when "01111",
                    "0000000000000000"               &  data1(31 downto 16)       when "10000",
                    "00000000000000000"              &  data1(31 downto 17)       when "10001",
                    "000000000000000000"             &  data1(31 downto 18)       when "10010",
                    "0000000000000000000"            &  data1(31 downto 19)       when "10011",
                    "00000000000000000000"           &  data1(31 downto 20)       when "10100",
                    "000000000000000000000"          &  data1(31 downto 21)       when "10101",
                    "0000000000000000000000"         &  data1(31 downto 22)       when "10110",
                    "00000000000000000000000"        &  data1(31 downto 23)       when "10111",
                    "000000000000000000000000"       &  data1(31 downto 24)       when "11000",
                    "0000000000000000000000000"      &  data1(31 downto 25)       when "11001",
                    "00000000000000000000000000"     &  data1(31 downto 26)       when "11010",
                    "000000000000000000000000000"    &  data1(31 downto 27)       when "11011",
                    "0000000000000000000000000000"   &  data1(31 downto 28)       when "11100",
                    "00000000000000000000000000000"  &  data1(31 downto 29)       when "11101",
                    "000000000000000000000000000000" &  data1(31 downto 30)       when "11110",
                   X"00000000" when others; 
end Behavioral;


--ShiftRA32