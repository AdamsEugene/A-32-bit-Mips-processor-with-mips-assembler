----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 12:30:04 AM
-- Design Name: 
-- Module Name: D - Behavioral
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

entity D is
Port (
        CLK, CLR, StallD     : in std_logic;
        RD, PCPlus4F         : in std_logic_vector(31 downto 0);
        InstrD, PCPlus4D     : out std_logic_vector(31 downto 0)
    );
end D;

architecture Behavioral of D is
    component D_StageReg
        Port (
                CLK, CLR, StallD     : in std_logic;
                RD, PCPlus4F         : in std_logic_vector(31 downto 0);
                InstrD, PCPlus4D     : out std_logic_vector(31 downto 0)
            );
    end component;
begin
    DS: D_StageReg
        port map(
                    CLK         => CLK,
                    CLR         => CLR,
                    StallD      => StallD,
                    RD          => RD,
                    PCPlus4F    => PCPlus4F,
                    InstrD      => InstrD,
                    PCPlus4D    => PCPlus4D
                );
end Behavioral;
