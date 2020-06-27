----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2020 08:16:20 PM
-- Design Name: 
-- Module Name: DataMem - Behavioral
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

entity DataMem is
port(                                                                    
        clk, MemWrite, SignM        : in std_logic;      
        Addr                        : in std_logic_vector(7 downto 0);                
        WriteData                   : in std_logic_vector(31 downto 0);  
        ReadData                    : out std_logic_vector(31 downto 0)  
    );                                                                       
end DataMem; 

architecture Behavioral of DataMem is
    signal B, H : std_logic_vector(1 downto 0);
    signal Prefetch : std_logic_vector(31 downto 0);
    type ramtype is array (0 to 63) of std_logic_vector(31 downto 0);
    signal Mem: ramtype;
begin
    B <= Addr(1 downto 0);
    H <= Addr(1 downto 0);
     Prefetch <= Mem(to_integer(unsigned(Addr(7 downto 2))));
    process(all)
        
--        variable check: std_logic_vector(1 downto 0);
    begin
--        check := Addr(1 downto 0);
--read or write memory
    --for i in ramtype'range loop 
       
        
        if (rising_edge(clk)) then
            if (MemWrite = '1') then
                if (B = "01") then 
                    Mem(to_integer(unsigned(Addr(7 downto 2)))) <= Prefetch(31 downto 8) & WriteData(7 downto 0);
                elsif (H = "10") then 
                    Mem(to_integer(unsigned(Addr(7 downto 2)))) <= Prefetch(31 downto 16) & WriteData(15 downto 0);
                else
                    Mem(to_integer(unsigned(Addr(7 downto 2)))) <= WriteData; 
                end if;
            end if;
        end if;
            
        if (SignM ='0') then 
            if (B = "01") then 
                ReadData <= (31 downto 8 => '0') & Prefetch(7 downto 0);
            elsif (H = "10") then 
                 ReadData <= (31 downto 16 => '0') & Prefetch(15 downto 0);
            else 
                ReadData <= Prefetch;
            end if;
        elsif (SignM = '1') then 
            if (B = "01") then 
                ReadData <= (31 downto 8 => '1') & Prefetch(7 downto 0);
            elsif (H = "10") then 
                 ReadData <= (31 downto 16 => '1') & Prefetch(15 downto 0);
            else 
                ReadData <= Prefetch;
            end if;        
        end if;
 
    --end loop;    
    end process;
end Behavioral;
