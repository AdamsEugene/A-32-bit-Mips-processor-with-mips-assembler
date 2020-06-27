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

entity ShiftLL32 is
Port (
        data1           : in std_logic_vector(31 downto 0);
        shiftAmount     : in std_logic_vector(4 downto 0);
        output          : out std_logic_vector(31 downto 0)
    );
end ShiftLL32;

architecture Behavioral of ShiftLL32 is

begin
    with shiftAmount select
        output <= data1                                                         when "00000",
                  data1(30 downto 0)  &  '0'                                    when "00001",
                  data1(29 downto 0)  &  "00"                                   when "00010",
                  data1(28 downto 0)  &  "000"                                  when "00011",
                  data1(27 downto 0)  &  "0000"                                 when "00100",
                  data1(26 downto 0)  &  "00000"                                when "00101",
                  data1(25 downto 0)  &  "000000"                               when "00110",
                  data1(24 downto 0)  &  "0000000"                              when "00111",
                  data1(23 downto 0)  &  "00000000"                             when "01000",
                  data1(22 downto 0)  &  "000000000"                            when "01001",
                  data1(21 downto 0)  &  "0000000000"                           when "01010",
                  data1(20 downto 0)  &  "00000000000"                          when "01011",
                  data1(19 downto 0)  &  "000000000000"                         when "01100",
                  data1(18 downto 0)  &  "0000000000000"                        when "01101",
                  data1(17 downto 0)  &  "00000000000000"                       when "01110",
                  data1(16 downto 0)  &  "000000000000000"                      when "01111",
                  data1(15 downto 0)  &  "0000000000000000"                     when "10000",
                  data1(14 downto 0)  &  "00000000000000000"                    when "10001",
                  data1(13 downto 0)  &  "000000000000000000"                   when "10010",
                  data1(12 downto 0)  &  "0000000000000000000"                  when "10011",
                  data1(11 downto 0)  &  "00000000000000000000"                 when "10100",
                  data1(10 downto 0)  &  "000000000000000000000"                when "10101",
                  data1(9 downto 0)   &  "0000000000000000000000"               when "10110",
                  data1(8 downto 0)   &  "00000000000000000000000"              when "10111",
                  data1(7 downto 0)   &  "000000000000000000000000"             when "11000",
                  data1(6 downto 0)   &  "0000000000000000000000000"            when "11001",
                  data1(5 downto 0)   &  "00000000000000000000000000"           when "11010",
                  data1(4 downto 0)   &  "000000000000000000000000000"          when "11011",
                  data1(3 downto 0)   &  "0000000000000000000000000000"         when "11100",
                  data1(2 downto 0)   &  "00000000000000000000000000000"        when "11101",
                  data1(1 downto 0)   &  "000000000000000000000000000000"       when "11110",
                   X"00000000" when others; 
end Behavioral;


--ShiftRL32