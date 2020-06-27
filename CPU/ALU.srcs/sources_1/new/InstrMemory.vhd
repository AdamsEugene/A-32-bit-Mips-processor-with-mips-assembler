----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2019 07:17:28 PM
-- Design Name: 
-- Module Name: InstrMemory - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstrMemory is
port (
        Addr                    : in std_logic_vector(7 downto 2);
        ReadData                : out  std_logic_vector(31 downto 0)
    );
end InstrMemory;

architecture Behavioral of InstrMemory is
    signal rom_addr: std_logic_vector(5 downto 0);
    type ROM_type is array (0 to 63 ) of std_logic_vector(31 downto 0);
     constant rom_data: ROM_type:=(
       X"20080000", --  1
       X"200C0002", --  2
       X"2010000F", --  3
       X"20110000", --  4
       X"20120001", --  5
       X"20130000", --  6
       X"20160000", --  7
       X"20170004", --  8
       X"AED10000", --  9
       X"AEF20000", --  10
       X"1190004B", --  11
       X"0C00000D", --  12
       X"0800000A", --  13
       X"02329820", --  14
       X"02408820", --  15
       X"02609020", --  16
       X"000C4080", --  17
       X"02C84020", --  18
       X"AD130000", --  19
       X"218C0001", --  20
       X"03E00008", --  21
       X"11800045", --  22
       X"000C6880", --  23
       X"218CFFFF", --  24
       X"8DB40000", --  25
       X"08000015", --  26
       X"00000000", --  27
       X"00000000", --  28
       X"00000000", --  29
       X"00000000", --  30
       X"00000000", --  31
       X"00000000", --  32
       X"00000000", --  33
       X"00000000", --  34
       X"00000000", --  35
       X"00000000", --  36
       X"00000000", --  37
       X"00000000", --  38
       X"00000000", --  39
       X"00000000", --  40
       X"00000000", --  41
       X"00000000", --  42
       X"00000000", --  43
       X"00000000", --  44
       X"00000000", --  45
       X"00000000", --  46
       X"00000000", --  47
       X"00000000", --  48
       X"00000000", --  49
       X"00000000", --  50
       X"00000000", --  51
       X"00000000", --  52
       X"00000000", --  53
       X"00000000", --  54
       X"00000000", --  55
       X"00000000", --  56
       X"00000000", --  57
       X"00000000", --  58
       X"00000000", --  59
       X"00000000", --  60
       X"00000000", --  61
       X"00000000", --  62
       X"00000000", --  63
       X"00000000"  --  64
      );
    begin
    
     rom_addr <= Addr;
     ReadData <= rom_data(to_integer(unsigned(rom_addr)));
end Behavioral;
