----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2020 06:10:35 PM
-- Design Name: 
-- Module Name: P_FullALU - Behavioral
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

entity P_FullALU is
Port ( 
            data1, data2                : in std_logic_vector(31 downto 0); 
            funct                       : in std_logic_vector(5 downto 0);
            Shamt, value                : in std_logic_vector(4 downto 0);
            cout                        : out std_logic;
            output                      : out std_logic_vector(31 downto 0)  
        );
end P_FullALU;

architecture Behavioral of P_FullALU is
    component P_ALU
        Port ( 
                data1, data2            : in std_logic_vector(31 downto 0); 
                funct                   : in std_logic_vector(5 downto 0);
                Shamt, value            : in std_logic_vector(4 downto 0);
                cout                    : out std_logic;
                output                  : out std_logic_vector(31 downto 0)
        );
    end component;
begin
    ALU32: P_ALU
        port map(
                    data1           => data1,     
                    data2           => data2,      
                    funct           => funct,
                    value           => value,
                    Shamt           => Shamt,  
                    cout            => cout,     
                    output          => output
                 );
end Behavioral;
