----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 12:07:05 AM
-- Design Name: 
-- Module Name: W - Behavioral
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

entity W is
Port (
                CLK, RegWriteM, WeLM, WeHM      : in std_logic;
                RegWriteW, WeLW, WeHW           : out std_logic; 
                MemtoRegM                       : in std_logic_vector(1 downto 0);
                MemtoRegW                       : out std_logic_vector(1 downto 0);
                RDM, LUpImM                     : in std_logic_vector(31 downto 0);
                ReadDataW, LUpImW               : out std_logic_vector(31 downto 0);
                ALUOutM, PCPlus4M               : in std_logic_vector(31 downto 0);
                ALUOutW, PCPlus4W               : out std_logic_vector(31 downto 0);
                WriteRegM                       : in std_logic_vector(4 downto 0);
                WriteRegW                       : out std_logic_vector(4 downto 0)
            );
end W;

architecture Behavioral of W is
    component W_StageReg
        Port (
                    CLK, RegWriteM, WeLM, WeHM      : in std_logic;
                    RegWriteW, WeLW, WeHW           : out std_logic; 
                    MemtoRegM                       : in std_logic_vector(1 downto 0);
                    MemtoRegW                       : out std_logic_vector(1 downto 0);
                    RDM, LUpImM                     : in std_logic_vector(31 downto 0);
                    ReadDataW, LUpImW               : out std_logic_vector(31 downto 0);
                    ALUOutM, PCPlus4M               : in std_logic_vector(31 downto 0);
                    ALUOutW, PCPlus4W               : out std_logic_vector(31 downto 0);
                    WriteRegM                       : in std_logic_vector(4 downto 0);
                    WriteRegW                       : out std_logic_vector(4 downto 0)
                );
    end component;
begin
    WS: W_StageReg
        port map(
                    CLK             => CLK,
                    RegWriteM       => RegWriteM,
                    MemtoRegM       => MemtoRegM,
                    RegWriteW       => RegWriteW,
                    MemtoRegW       => MemtoRegW,
                    WeHW            => WeHW,
                    WeLW            => WeLW,
                    WeHM            => WeHM,
                    WeLM            => WeLM,
                    RDM             => RDM,
                    ReadDataW       => ReadDataW,
                    ALUOutM         => ALUOutM,
                    ALUOutW         => ALUOutW,
                    PCPlus4M        => PCPlus4M,
                    PCPlus4W        => PCPlus4W,
                    WriteRegM       => WriteRegM,
                    WriteRegW       => WriteRegW,
                    LUpImM          => LUpImM,
                    LUpImW          => LUpImW
                );
end Behavioral;
