----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 07:43:38 PM
-- Design Name: 
-- Module Name: TwoInMux - Behavioral
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

entity TwoInMux is
Port (                                                          
        data1, data2         : in std_logic_vector(31 downto 0);
        selector             : in std_logic;                    
        output               : out std_logic_vector(31 downto 0)
    ); 
end TwoInMux;

architecture Behavioral of TwoInMux is
    component FInal
        Port (  
                data1, data2         : in std_logic_vector(31 downto 0); 
                selector             : in std_logic;                     
                output               : out std_logic_vector(31 downto 0) 
            );
    end component;
begin
    TwoIn: FInal
        port map(
                    data1       => data1,
                    data2       => data2,
                    selector    => selector,
                    output      => output
                );
end Behavioral;
