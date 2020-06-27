----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2019 09:19:44 AM
-- Design Name: 
-- Module Name: SignExtension - Behavioral
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

entity SignExtension is
Port (
        dataIn              : in std_logic_vector(15 downto 0);
        dataout             : out std_logic_vector(31 downto 0) 
    );
end SignExtension;

architecture Behavioral of SignExtension is
    component SignExt
        Port (
                dataIn              : in std_logic_vector(15 downto 0);
                dataout             : out std_logic_vector(31 downto 0) 
            );
    end component;
begin
    SignExtend: SignExt
        port map(
                    dataIn          => dataIn,
                    dataOut         => dataOut
                );
end Behavioral;

--ZeroExtend
