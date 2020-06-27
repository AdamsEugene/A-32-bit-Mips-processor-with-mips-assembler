----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 11:30:11 AM
-- Design Name: 
-- Module Name: Adder1_Bit - Behavioral
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

entity Adder1_Bit is
Port (
        data1, data2        : in std_logic;
        cin                 : in std_logic;
        cout                : out std_logic;
        sum                 : out std_logic
      );
end Adder1_Bit;

architecture Behavioral of Adder1_Bit is
    signal g, p     : std_logic;
begin
    g       <= data1 and data2;
    p       <= data1 xor data2;
    sum     <= p xor cin;
    cout    <= g or (p and cin);
end Behavioral;

--UnAdder1_Bit
