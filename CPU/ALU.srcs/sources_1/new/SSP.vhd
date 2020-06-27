----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 06:18:35 PM
-- Design Name: 
-- Module Name: SSP - Behavioral
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

entity SSP is
Port (
        Clock, Rst         : in std_logic 
    );
end SSP;

architecture Behavioral of SSP is
    component SingleCycle
        Port (
                Clock, Rst         : in std_logic 
            );
    end component;
begin
    SCPro: SingleCycle
        port map(
                    Clock       => Clock,
                    Rst         => Rst
                );
end Behavioral;
