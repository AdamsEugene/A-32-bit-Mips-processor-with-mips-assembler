----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2019 07:02:48 PM
-- Design Name: 
-- Module Name: InstructionMem - Behavioral
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

entity InstructionMem is
generic(N: integer := 32);
Port (
        fromPC          : in std_logic_vector(N-1 downto 0);
        instr           : out std_logic_vector(N-1 downto 0)
    );
end InstructionMem;

architecture Behavioral of InstructionMem is
    component InstrMemory
        Port (
                fromPC          : in std_logic_vector(N-1 downto 0);
                instr           : out std_logic_vector(N-1 downto 0)
            );
    end component;
begin
    InsMem: InstrMemory
        port map(
                    fromPC          => fromPC,
                    instr           => instr
                );
end Behavioral;

