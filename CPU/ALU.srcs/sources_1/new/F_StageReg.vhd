----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2020 10:59:06 PM
-- Design Name: 
-- Module Name: F_StageReg - Behavioral
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

entity D_StageReg is
Port (
        CLK, CLR, StallD        : in std_logic;
        RD, PCPlus4F            : in std_logic_vector(31 downto 0);
        InstrD, PCPlus4D        : out std_logic_vector(31 downto 0)
    );
end D_StageReg;

architecture Behavioral of D_StageReg is

begin
--    process(all)
--    begin
--        if (CLR = '1') then
--            InstrD   <= X"--------";
--            PCPlus4D<= X"--------";
--        elsif (rising_edge(CLK)) then 
--            if (StallD = '0') then
--                InstrD   <= RD;
--                PCPlus4D <= PCPlus4F;
--            end if;
--        end if;
--    end process;
    process (all)
    begin 
        if (rising_edge(CLK)) then 
            if (CLR = '1') then
                InstrD   <= X"00000000";
--                PCPlus4D<= X"00000000";
            elsif (StallD = '0') then 
                InstrD   <= RD;      
                PCPlus4D <= PCPlus4F;
            end if;
        end if;
    end process;
    
--     process (all)
--       begin 
--           if (rising_edge(CLK)) then 
--               if (CLR = '1' and StallD = '1') then
--                   InstrD   <= RD;      
--                   PCPlus4D <= X"00000000";
--               elsif (CLR = '1') then 
--                   InstrD   <= X"00000000";      
--                   PCPlus4D <= X"00000000";
--               elsif (StallD = '0') then 
--                   InstrD   <= RD;      
--                   PCPlus4D <= PCPlus4F;
--               end if;
--           end if;
--       end process;
end Behavioral;
