----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 06:46:29 PM
-- Design Name: 
-- Module Name: MuxHalf - Behavioral
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

entity MuxHalf is
Port (                                                          
         data1, data2, data3, data4              : in std_logic_vector(31 downto 0);
         data5, data6, data7, data8              : in std_logic_vector(31 downto 0); 
         data9, data10, data11, data12           : in std_logic_vector(31 downto 0);
         data13, data14, data15, data16          : in std_logic_vector(31 downto 0); 
         data17, data18, data19, data20          : in std_logic_vector(31 downto 0);
         data21, data22, data23, data24          : in std_logic_vector(31 downto 0);
         data25, data26, data27, data28          : in std_logic_vector(31 downto 0);
         data29, data30, data31, data32          : in std_logic_vector(31 downto 0);
         selector                                : in std_logic_vector(4 downto 0);                     
         output                                  : out std_logic_vector(31 downto 0)
    );                                                          
end MuxHalf;

architecture Behavioral of MuxHalf is

begin
    output <= data1  when selector = "00000" else 
              data2  when selector = "00001" else
              data3  when selector = "00010" else
              data4  when selector = "00011" else
              data5  when selector = "00100" else
              data6  when selector = "00101" else
              data7  when selector = "00110" else
              data8  when selector = "00111" else
              data9  when selector = "01000" else
              data10 when selector = "01001" else
              data11 when selector = "01010" else
              data12 when selector = "01011" else
              data13 when selector = "01100" else
              data14 when selector = "01101" else
              data15 when selector = "01110" else
              data16 when selector = "01111" else
              data17 when selector = "10000" else
              data18 when selector = "10001" else
              data19 when selector = "10010" else
              data20 when selector = "10011" else
              data21 when selector = "10100" else
              data22 when selector = "10101" else
              data23 when selector = "10110" else
              data24 when selector = "10111" else
              data25 when selector = "11000" else
              data26 when selector = "11001" else
              data27 when selector = "11010" else
              data28 when selector = "11011" else
              data29 when selector = "11100" else
              data30 when selector = "11101" else
              data31 when selector = "11110" else
              data32;
end Behavioral;
