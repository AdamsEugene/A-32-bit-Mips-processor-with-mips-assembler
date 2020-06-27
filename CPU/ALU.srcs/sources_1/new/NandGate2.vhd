----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 10:41:53 PM
-- Design Name: 
-- Module Name: NandGate2 - Behavioral
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

entity NandGate2 is
Port (                                                             
        data1, data2            : in std_logic_vector(1 downto 0); 
        output                  : out std_logic_vector(1 downto 0) 
    );                                                             
end NandGate2;

architecture Behavioral of NandGate2 is
     component NandGate1
        Port (
                data1, data2            : in std_logic;
                output                  : out std_logic 
            );
    end component;
begin
    output <= data1 nand data2;
end Behavioral;
