----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2019 05:50:37 PM
-- Design Name: 
-- Module Name: SCP_ControlUnit - Behavioral
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

entity SCP_ControlUnit is
Port (
        opcode, funct                       : in std_logic_vector(5 downto 0);
        branch, jump, regDst, 
        we3, data2select, im_ALUcontrol, 
        memwe, memtoreg                     : out std_logic;
        ALUScr                              : out std_logic_vector(1 downto 0);
        functOut                            : out std_logic_vector(5 downto 0)
    );
end SCP_ControlUnit;

architecture Behavioral of SCP_ControlUnit is
    component ControlUnits
        Port (
                opcode, funct                       : in std_logic_vector(5 downto 0);
                branch, jump, regDst, 
                we3, data2select, im_ALUcontrol, 
                memwe, memtoreg                     : out std_logic;
                ALUScr                              : out std_logic_vector(1 downto 0);
                functOut                            : out std_logic_vector(5 downto 0)
            );
    end component;
begin
    ControlUnit: ControlUnits
        port map(
                    opcode              => opcode,
                    funct               => funct,
                    branch              => branch,
                    jump                => jump,
                    regDst              => regDst,
                    we3                 => we3,
                    data2select         => data2select,
                    im_ALUcontrol       => im_ALUcontrol,
                    memwe               => memwe,
                    memtoreg            => memtoreg,
                    ALUScr              => ALUScr,
                    functOut            => functOut
                );
end Behavioral;
