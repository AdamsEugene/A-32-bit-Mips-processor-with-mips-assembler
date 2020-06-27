----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 08:00:54 PM
-- Design Name: 
-- Module Name: ContUnit - Behavioral
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

entity ContUnit is
Port (                                                                          
         Opcode, Funct                   : in std_logic_vector(5 downto 0);      
         OverFlow, Zero, BGreat          : in std_logic;
         BLess, NotEq                    : in std_logic;               
         ALUControlD                     : out std_logic_vector(5 downto 0);
         JumpD                           : out std_logic_vector(1 downto 0);       
         ALUScrD, MemToRegD, RegDestD    : out std_logic_vector(1 downto 0); 
         Read1D, WHL                     : out std_logic_vector(1 downto 0);                                              
         MemWriteD, BranchDD             : out std_logic;                        
         We3D, BranchD, SignD            : out std_logic                         
        );                                                                       
end ContUnit;

architecture Behavioral of ContUnit is
    component ControlUnit
        Port (                                                                          
                    Opcode, Funct                   : in std_logic_vector(5 downto 0);      
                    OverFlow, Zero, BGreat          : in std_logic;
                    BLess, NotEq                    : in std_logic;               
                    ALUControlD                     : out std_logic_vector(5 downto 0);
                    JumpD                           : out std_logic_vector(1 downto 0);       
                    ALUScrD, MemToRegD, RegDestD    : out std_logic_vector(1 downto 0); 
                    Read1D, WHL                     : out std_logic_vector(1 downto 0);                                              
                    MemWriteD, BranchDD             : out std_logic;                        
                    We3D, BranchD, SignD            : out std_logic                         
            );        
    end component;
begin
    Controls: ControlUnit
        port map(
                    Opcode      => Opcode,
                    Funct       => Funct,
                    OverFlow    => OverFlow,
                    Zero        => Zero,
                    NotEq       => NotEq,
                    BGreat      => BGreat,
                    BLess       => BLess,
                    ALUControlD  => ALUControlD,
                    ALUScrD      => ALUScrD,
                    JumpD        => JumpD,
                    MemToRegD    => MemToRegD,
                    MemWriteD    => MemWriteD,
                    RegDestD     => RegDestD,
                    We3D         => We3D,
                    SignD        => SignD,
                    BranchD      => BranchD,
                    Read1D        => Read1D,
                    WHL          => WHL,
                    BranchDD     => BranchDD
                );
end Behavioral;
