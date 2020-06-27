----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2019 05:27:37 PM
-- Design Name: 
-- Module Name: RegFile - Behavioral
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

entity RegFile is
generic(N: integer :=32);
Port (
        clk,WE3              : in std_logic;
        Addr1                : in std_logic_vector(4 downto 0);
        Addr2                : in std_logic_vector(4 downto 0);
        Addr3                : in std_logic_vector(4 downto 0);
        WD3                  : in std_logic_vector(N-1 downto 0);
        RD1                  : out std_logic_vector(N-1 downto 0);
        RD2                  : out std_logic_vector(N-1 downto 0) 
     );
end RegFile;

architecture Behavioral of RegFile is
    component RegFiles
        Port (
                clk,WE3              : in std_logic;
                Addr1                : in std_logic_vector(4 downto 0);
                Addr2                : in std_logic_vector(4 downto 0);
                Addr3                : in std_logic_vector(4 downto 0);
                WD3                  : in std_logic_vector(N-1 downto 0);
                RD1                  : out std_logic_vector(N-1 downto 0);
                RD2                  : out std_logic_vector(N-1 downto 0) 
            );
    end component;
begin   
    RegFile32: RegFiles
        port map(
                    clk          => clk,
                    WE3          => WE3,
                    Addr1        => Addr1,
                    Addr2        => Addr2,
                    Addr3        => Addr3,
                    WD3          => WD3,
                    RD1          => RD1,
                    RD2          => RD2
                );
end Behavioral;
