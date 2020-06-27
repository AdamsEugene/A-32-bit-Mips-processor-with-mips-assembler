----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2019 10:07:16 PM
-- Design Name: 
-- Module Name: ProgramCount - Behavioral
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
use IEEE.NUMERIC_STD_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P_ProgramCount is
generic(N: integer := 32);
Port (
        dataIn          : in std_logic_vector(N-1 downto 0);
        dataOut         : out std_logic_vector(N-1 downto 0);
        clk, rst, StallF        : in std_logic
    );
end P_ProgramCount;

architecture Behavioral of P_ProgramCount is
   
begin
    process(clk, rst)
--    variable indata : std_logic_vector(N-1 downto 0) := (others => '0');
        begin
            if (rst = '1') then           
                dataOut <= (N-1 downto 0 => '0');
            elsif (rising_edge(clk)) then
                if (StallF = '0') then
                     dataOut <= dataIn ;
                end if;
            end if;
    end process;
end Behavioral;
