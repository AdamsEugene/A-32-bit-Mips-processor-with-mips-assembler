----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2019 04:19:55 AM
-- Design Name: 
-- Module Name: DataMemory - Behavioral
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

entity DataMemory is
port (
        clk: in std_logic;
        addr: in std_logic_Vector(31 downto 0);
        WD: in std_logic_Vector(31 downto 0);
        WE:in std_logic;
        RD: out std_logic_Vector(31 downto 0)
);
end DataMemory;

architecture Behavioral of DataMemory is
    component Data_Memory
        port (
                clk: in std_logic;
                addr: in std_logic_Vector(31 downto 0);
                WD: in std_logic_Vector(31 downto 0);
                WE:in std_logic;
                RD: out std_logic_Vector(31 downto 0)
        );
    end component;
begin
    DataMemory: Data_Memory
        port map(
                    addr            => addr,
                    WD              => WD,
                    clk             => clk,
                    WE              => WE,
                    RD              => RD
                );
end Behavioral;
