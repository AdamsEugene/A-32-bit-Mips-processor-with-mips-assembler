----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2020 10:14:11 PM
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
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
end ControlUnit;
    
architecture Behavioral of ControlUnit is
    signal Branch   : std_logic;
begin
process(all)
begin 
    case Opcode is
        when "000000" => -- R TYPE
            if (Funct = "000000") then --shift left logical
                ALUScrD       <= "00";
                Branch        <= '0';                        
                Read1D        <= "00";
                WHL           <= "00";    
                JumpD         <= "00"; 
                MemToRegD     <= "00";
                MemWriteD     <= '0';
                SignD         <= '0';
                RegDestD      <= "01";
                We3D          <= '1';
                ALUControlD   <= Funct;
            
            elsif (Funct = "000010") then -- shift right logical
                ALUScrD       <= "00";
                Branch        <= '0';                        
                Read1D        <= "00";
                WHL           <= "00";    
                JumpD         <= "00"; 
                MemToRegD     <= "00";
                MemWriteD     <= '0';
                SignD         <= '0';
                RegDestD      <= "01";
                We3D          <= '1';
                ALUControlD   <= Funct;
                
            elsif (Funct = "000011") then -- shift right arithmetic 
                ALUScrD       <= "00";
                Branch        <= '0';                        
                Read1D        <= "00";
                WHL           <= "00";    
                JumpD         <= "00"; 
                MemToRegD     <= "00";
                MemWriteD     <= '0';
                SignD         <= '0';
                RegDestD      <= "01";
                We3D          <= '1';
                ALUControlD   <= Funct;
                
            elsif (Funct = "000100") then -- shift left logical variable
                ALUScrD       <= "00";
                Branch        <= '0';                        
                Read1D        <= "00";
                WHL           <= "00";    
                JumpD         <= "00"; 
                MemToRegD     <= "00";
                MemWriteD     <= '0';
                SignD         <= '0';
                RegDestD      <= "01";
                We3D          <= '1';
                ALUControlD   <= Funct;  
                
            elsif (Funct = "000110") then -- shift right logical variable
                ALUScrD       <= "00";
                Branch        <= '0';                        
                Read1D        <= "00";
                WHL           <= "00";    
                JumpD         <= "00"; 
                MemToRegD     <= "00";
                MemWriteD     <= '0';
                SignD         <= '0';
                RegDestD      <= "01";
                We3D          <= '1';
                ALUControlD   <= Funct; 
                
            elsif (Funct = "000111") then -- shift right arithmetic variable
                ALUScrD       <= "00";
                Branch        <= '0';                        
                Read1D        <= "00";
                WHL           <= "00";    
                JumpD         <= "00"; 
                MemToRegD     <= "00";
                MemWriteD     <= '0';
                SignD         <= '0';
                RegDestD      <= "01";
                We3D          <= '1';
                ALUControlD   <= Funct;
                
            elsif (Funct = "001000") then -- jump register         
                ALUScrD       <= "00";                                                
                Branch        <= '0';                                                 
                Read1D        <= "00";                                                
                WHL           <= "00";                                                
                JumpD         <= "10";                                                
                MemToRegD     <= "00";                                                
                MemWriteD     <= '0';                                                 
                SignD         <= '0';                                                 
                RegDestD      <= "01";                                                
                We3D          <= '0';                                                 
                ALUControlD   <= Funct;                                               
            
            elsif (Funct = "001001") then -- jump and link register       
                ALUScrD       <= "00";                           
                Branch        <= '0';                            
                Read1D        <= "00";                           
                WHL           <= "00";                           
                JumpD         <= "10";                           
                MemToRegD     <= "10";                           
                MemWriteD     <= '0';                            
                SignD         <= '0';                            
                RegDestD      <= "01";                           
                We3D          <= '1';                            
                ALUControlD   <= Funct;                          
            
            elsif (Funct = "001100") then -- system call    
                ALUScrD       <= "00";                                 
                Branch        <= '0';                                  
                Read1D        <= "00";                                 
                WHL           <= "00";                                 
                JumpD         <= "00";                                 
                MemToRegD     <= "00";                                 
                MemWriteD     <= '0';                                  
                SignD         <= '0';                                  
                RegDestD      <= "00";                                 
                We3D          <= '0';                                  
                ALUControlD   <= Funct;                                
            
            elsif (Funct = "001101") then -- break
                ALUScrD       <= "00";                  
                Branch        <= '0';                   
                Read1D        <= "00";                  
                WHL           <= "00";                  
                JumpD         <= "00";                  
                MemToRegD     <= "00";                  
                MemWriteD     <= '0';                   
                SignD         <= '0';                   
                RegDestD      <= "00";                  
                We3D          <= '0';                   
                ALUControlD   <= Funct;                 
            
            elsif (Funct = "010000") then -- move from hi        
                ALUScrD       <= "00";                    
                Branch        <= '0';                     
                Read1D        <= "01";                    
                WHL           <= "00";                    
                JumpD         <= "00";                    
                MemToRegD     <= "00";                    
                MemWriteD     <= '0';                     
                SignD         <= '0';                     
                RegDestD      <= "01";                    
                We3D          <= '1';                     
                ALUControlD   <= Funct;                   
            
            elsif (Funct = "010001") then -- move to hi 
                ALUScrD       <= "00";                    
                Branch        <= '0';                     
                Read1D        <= "00";                    
                WHL           <= "10";                    
                JumpD         <= "00";                    
                MemToRegD     <= "00";                    
                MemWriteD     <= '0';                     
                SignD         <= '0';                     
                RegDestD      <= "01";                    
                We3D          <= '0';                     
                ALUControlD   <= Funct;                   
            
            elsif (Funct = "010010") then -- move from lo     
                ALUScrD       <= "00";                       
                Branch        <= '0';                        
                Read1D        <= "10";                       
                WHL           <= "00";                       
                JumpD         <= "00";                       
                MemToRegD     <= "00";                       
                MemWriteD     <= '0';                        
                SignD         <= '0';                        
                RegDestD      <= "01";                       
                We3D          <= '1';                        
                ALUControlD   <= Funct;                      
            
            elsif (Funct = "010011") then -- move to lo 
                ALUScrD       <= "00";                     
                Branch        <= '0';                      
                Read1D        <= "00";                     
                WHL           <= "01";                     
                JumpD         <= "00";                     
                MemToRegD     <= "00";                     
                MemWriteD     <= '0';                      
                SignD         <= '0';                      
                RegDestD      <= "01";                     
                We3D          <= '0';                      
                ALUControlD   <= Funct;                    
            
            elsif (Funct = "100000") then -- add  
                ALUScrD       <= "00";                   
                Branch        <= '0';                    
                Read1D        <= "00";                   
                WHL           <= "00";                   
                JumpD         <= "00";                   
                MemToRegD     <= "00";                   
                MemWriteD     <= '0';                    
                SignD         <= '0';                    
                RegDestD      <= "01";                   
                We3D          <= '1';                    
                ALUControlD   <= Funct;                  
            
            elsif (Funct = "100001") then -- add unsigned
                ALUScrD       <= "00";            
                Branch        <= '0';             
                Read1D        <= "00";            
                WHL           <= "00";            
                JumpD         <= "00";            
                MemToRegD     <= "00";            
                MemWriteD     <= '0';             
                SignD         <= '0';             
                RegDestD      <= "01";            
                We3D          <= '1';             
                ALUControlD   <= Funct;           
                  
            elsif (Funct = "100010") then -- subtract         
                ALUScrD       <= "00";                            
                Branch        <= '0';                             
                Read1D        <= "00";                            
                WHL           <= "00";                            
                JumpD         <= "00";                            
                MemToRegD     <= "00";                            
                MemWriteD     <= '0';                             
                SignD         <= '0';                             
                RegDestD      <= "01";                            
                We3D          <= '1';                             
                ALUControlD   <= Funct;                           
                  
            elsif (Funct = "100011") then -- subtract unsigned       
                ALUScrD       <= "00";                       
                Branch        <= '0';                        
                Read1D        <= "00";                       
                WHL           <= "00";                       
                JumpD         <= "00";                       
                MemToRegD     <= "00";                       
                MemWriteD     <= '0';                        
                SignD         <= '0';                        
                RegDestD      <= "01";                       
                We3D          <= '1';                        
                ALUControlD   <= Funct;                      
                  
            elsif (Funct = "100100") then -- and        
                ALUScrD       <= "00";                                 
                Branch        <= '0';                                  
                Read1D        <= "00";                                 
                WHL           <= "00";                                 
                JumpD         <= "00";                                 
                MemToRegD     <= "00";                                 
                MemWriteD     <= '0';                                  
                SignD         <= '0';                                  
                RegDestD      <= "01";                                 
                We3D          <= '1';                                  
                ALUControlD   <= Funct; 
                
            elsif (Funct = "100101") then -- or         
                ALUScrD       <= "00";                   
                Branch        <= '0';                    
                Read1D        <= "00";                   
                WHL           <= "00";                   
                JumpD         <= "00";                   
                MemToRegD     <= "00";                   
                MemWriteD     <= '0';                    
                SignD         <= '0';                    
                RegDestD      <= "01";                   
                We3D          <= '1';                    
                ALUControlD   <= Funct;                  
                
            elsif (Funct = "100110") then -- xor       
                ALUScrD       <= "00";                
                Branch        <= '0';                 
                Read1D        <= "00";                
                WHL           <= "00";                
                JumpD         <= "00";                
                MemToRegD     <= "00";                
                MemWriteD     <= '0';                 
                SignD         <= '0';                 
                RegDestD      <= "01";                
                We3D          <= '1';                 
                ALUControlD   <= Funct;               
                
            elsif (Funct = "100111") then -- nor        
                ALUScrD       <= "00";                  
                Branch        <= '0';                   
                Read1D        <= "00";                  
                WHL           <= "00";                  
                JumpD         <= "00";                  
                MemToRegD     <= "00";                  
                MemWriteD     <= '0';                   
                SignD         <= '0';                   
                RegDestD      <= "01";                  
                We3D          <= '1';                   
                ALUControlD   <= Funct;                 
                
            elsif (Funct = "101010") then -- set less than       
                ALUScrD       <= "00";                 
                Branch        <= '0';                  
                Read1D        <= "00";                 
                WHL           <= "00";                 
                JumpD         <= "00";                 
                MemToRegD     <= "00";                 
                MemWriteD     <= '0';                  
                SignD         <= '0';                  
                RegDestD      <= "01";                 
                We3D          <= '1';                  
                ALUControlD   <= Funct;                
                
            elsif (Funct = "101011") then -- set less than unsigned    
                ALUScrD       <= "00";                         
                Branch        <= '0';                          
                Read1D        <= "00";                         
                WHL           <= "00";                         
                JumpD         <= "00";                         
                MemToRegD     <= "00";                         
                MemWriteD     <= '0';                          
                SignD         <= '0';                          
                RegDestD      <= "01";                         
                We3D          <= '1';                          
                ALUControlD   <= Funct;                        
               
            else                            -- else           
                ALUScrD       <= "00";                                        
                Branch        <= '0';                                         
                Read1D        <= "00";                                        
                WHL           <= "00";                                        
                JumpD         <= "00";                                        
                MemToRegD     <= "00";                                        
                MemWriteD     <= '0';                                         
                SignD         <= '0';                                         
                RegDestD      <= "00";                                        
                We3D          <= '0';                                         
                ALUControlD   <= Funct;                                       
            end if;
            
        when "000001" => -- Branch and Link
            ALUScrD       <= "00";
            Branch        <= '1';                           
            Read1D        <= "00";
            WHL           <= "00";                       
            JumpD         <= "01"; 
            MemToRegD     <= "10";
            MemWriteD     <= '0';
            SignD         <= '0';
            RegDestD      <= "10";
            We3D          <= '1';
            ALUControlD   <= "001000";      
            
        when "000010" => -- jump    
            ALUScrD       <= "00";             
            Branch        <= '0';              
            Read1D        <= "00";             
            WHL           <= "00";             
            JumpD         <= "01";             
            MemToRegD     <= "00";             
            MemWriteD     <= '0';              
            SignD         <= '0';              
            RegDestD      <= "00";             
            We3D          <= '0';              
            ALUControlD   <= "001000";         
        
        when "000011" => -- jump and link           
            ALUScrD       <= "00";         
            Branch        <= '0';          
            Read1D        <= "00";         
            WHL           <= "00";         
            JumpD         <= "01";         
            MemToRegD     <= "10";         
            MemWriteD     <= '0';          
            SignD         <= '0';          
            RegDestD      <= "10";         
            We3D          <= '1';          
            ALUControlD   <= "001000";     
        
        when "000100" => -- branch if equal  
            ALUScrD       <= "00";         
            Branch        <= '1';          
            Read1D        <= "00";         
            WHL           <= "00";         
            JumpD         <= "00";         
            MemToRegD     <= "00";         
            MemWriteD     <= '0';          
            SignD         <= '0';          
            RegDestD      <= "00";         
            We3D          <= '0';          
            ALUControlD   <= "100010";     
        
        when "000101" => -- branch if not equal 
            ALUScrD       <= "00";           
            Branch        <= '1';            
            Read1D        <= "00";           
            WHL           <= "00";           
            JumpD         <= "00";           
            MemToRegD     <= "00";           
            MemWriteD     <= '0';            
            SignD         <= '0';            
            RegDestD      <= "00";           
            We3D          <= '0';            
            ALUControlD   <= "101010";       
        
        when "000110" => -- branch if less than or equal to zero
            ALUScrD       <= "00";               
            Branch        <= '1';                
            Read1D        <= "00";               
            WHL           <= "00";               
            JumpD         <= "00";               
            MemToRegD     <= "00";               
            MemWriteD     <= '0';                
            SignD         <= '0';                
            RegDestD      <= "00";               
            We3D          <= '0';                
            ALUControlD   <= "101010";           
        
        when "000111" => -- branch if greater than zero
            ALUScrD       <= "00";                               
            Branch        <= '1';                                
            Read1D        <= "00";                               
            WHL           <= "00";                               
            JumpD         <= "00";                               
            MemToRegD     <= "00";                               
            MemWriteD     <= '0';                                
            SignD         <= '0';                                
            RegDestD      <= "00";                               
            We3D          <= '0';                                
            ALUControlD   <= "101010";                           
        
        when "001000" => -- add immediate   
            ALUScrD       <= "01";                         
            Branch        <= '0';                          
            Read1D        <= "00";                         
            WHL           <= "00";                         
            JumpD         <= "00";                         
            MemToRegD     <= "00";                         
            MemWriteD     <= '0';                          
            SignD         <= '0';                          
            RegDestD      <= "00";                         
            We3D          <= '1';                          
            ALUControlD   <= "100000";                     
        
        when "001001" => -- add immediate unsigned   
            ALUScrD       <= "01";           
            Branch        <= '0';            
            Read1D        <= "00";           
            WHL           <= "00";           
            JumpD         <= "00";           
            MemToRegD     <= "00";           
            MemWriteD     <= '0';            
            SignD         <= '0';            
            RegDestD      <= "00";           
            We3D          <= '1';            
            ALUControlD   <= "100001";       
        
        when "001010" => -- set less than immediate   
            ALUScrD       <= "01";                   
            Branch        <= '0';                    
            Read1D        <= "00";                   
            WHL           <= "00";                   
            JumpD         <= "00";                   
            MemToRegD     <= "00";                   
            MemWriteD     <= '0';                    
            SignD         <= '0';                    
            RegDestD      <= "00";                   
            We3D          <= '1';                    
            ALUControlD   <= "101010";               
        
        when "001011" => -- set less than immediate unsigned  
            ALUScrD       <= "01";                    
            Branch        <= '0';                     
            Read1D        <= "00";                    
            WHL           <= "00";                    
            JumpD         <= "00";                    
            MemToRegD     <= "00";                    
            MemWriteD     <= '0';                     
            SignD         <= '0';                     
            RegDestD      <= "00";                    
            We3D          <= '1';                     
            ALUControlD   <= "101011";                
        
        when "001100" => -- and immediate
            ALUScrD       <= "10";                           
            Branch        <= '0';                            
            Read1D        <= "00";                           
            WHL           <= "00";                           
            JumpD         <= "00";                           
            MemToRegD     <= "00";                           
            MemWriteD     <= '0';                            
            SignD         <= '0';                            
            RegDestD      <= "00";                           
            We3D          <= '1';                            
            ALUControlD   <= "100100";                       
        
        when "001101" => -- or immediate      
            ALUScrD       <= "10";             
            Branch        <= '0';              
            Read1D        <= "00";             
            WHL           <= "00";             
            JumpD         <= "00";             
            MemToRegD     <= "00";             
            MemWriteD     <= '0';              
            SignD         <= '0';              
            RegDestD      <= "00";             
            We3D          <= '1';              
            ALUControlD   <= "100101";         
        
        when "001110" => -- xor immediate   
                ALUScrD       <= "10";         
                Branch        <= '0';          
                Read1D        <= "00";         
                WHL           <= "00";         
                JumpD         <= "00";         
                MemToRegD     <= "00";         
                MemWriteD     <= '0';          
                SignD         <= '0';          
                RegDestD      <= "00";         
                We3D          <= '1';          
                ALUControlD   <= "100110";     
        
        when "001111" => -- load upper immediate          
                ALUScrD       <= "00";             
                Branch        <= '0';              
                Read1D        <= "00";             
                WHL           <= "00";             
                JumpD         <= "00";             
                MemToRegD     <= "11";             
                MemWriteD     <= '0';              
                SignD         <= '0';              
                RegDestD      <= "00";             
                We3D          <= '1';              
                ALUControlD   <= "000000";         
        
        when "100000" => -- load byte  
                ALUScrD       <= "01";            
                Branch        <= '0';             
                Read1D        <= "00";            
                WHL           <= "00";            
                JumpD         <= "00";            
                MemToRegD     <= "01";            
                MemWriteD     <= '0';             
                SignD         <= '1';             
                RegDestD      <= "00";            
                We3D          <= '1';             
                ALUControlD   <= "100000";        
        
        when "100001" => -- load halfword       
                ALUScrD       <= "01";      
                Branch        <= '0';       
                Read1D        <= "00";      
                WHL           <= "00";      
                JumpD         <= "00";      
                MemToRegD     <= "01";      
                MemWriteD     <= '0';       
                SignD         <= '1';       
                RegDestD      <= "00";      
                We3D          <= '1';       
                ALUControlD   <= "100000";  
        
        when "100011" => -- load word   
                ALUScrD       <= "01";       
                Branch        <= '0';        
                Read1D        <= "00";       
                WHL           <= "00";       
                JumpD         <= "00";       
                MemToRegD     <= "01";       
                MemWriteD     <= '0';        
                SignD         <= '0';        
                RegDestD      <= "00";       
                We3D          <= '1';        
                ALUControlD   <= "100000";   
        
        when "100100" => -- load byte unsigned          
                ALUScrD       <= "01";          
                Branch        <= '0';           
                Read1D        <= "00";          
                WHL           <= "00";          
                JumpD         <= "00";          
                MemToRegD     <= "01";          
                MemWriteD     <= '0';           
                SignD         <= '0';           
                RegDestD      <= "00";          
                We3D          <= '1';           
                ALUControlD   <= "100000";      
        
        when "100101" => -- load halfword unsigned 
                ALUScrD       <= "01";          
                Branch        <= '0';           
                Read1D        <= "00";          
                WHL           <= "00";          
                JumpD         <= "00";          
                MemToRegD     <= "01";          
                MemWriteD     <= '0';           
                SignD         <= '0';           
                RegDestD      <= "00";          
                We3D          <= '1';           
                ALUControlD   <= "100000";      
        
        when "101000" => -- store byte     
                ALUScrD       <= "01";                  
                Branch        <= '0';                   
                Read1D        <= "00";                  
                WHL           <= "00";                  
                JumpD         <= "00";                  
                MemToRegD     <= "00";                  
                MemWriteD     <= '1';                   
                SignD         <= '0';                   
                RegDestD      <= "00";                  
                We3D          <= '0';                   
                ALUControlD   <= "100000";              
        
        when "101001" => -- store halfword    
                ALUScrD       <= "01";    
                Branch        <= '0';     
                Read1D        <= "00";    
                WHL           <= "00";    
                JumpD         <= "00";    
                MemToRegD     <= "00";    
                MemWriteD     <= '1';     
                SignD         <= '0';     
                RegDestD      <= "00";    
                We3D          <= '0';     
                ALUControlD   <= "100000";
        
        when "101011" => -- store word    
                ALUScrD       <= "01";        
                Branch        <= '0';         
                Read1D        <= "00";        
                WHL           <= "00";        
                JumpD         <= "00";        
                MemToRegD     <= "00";        
                MemWriteD     <= '1';         
                SignD         <= '0';         
                RegDestD      <= "00";        
                We3D          <= '0';         
                ALUControlD   <= "100000";    
         
         when others =>
                ALUScrD       <= "00";
                Branch        <= '0';                           
                Read1D        <= "00";
                WHL           <= "00";                        
                JumpD         <= "00"; 
                MemToRegD     <= "00";
                MemWriteD     <= '0';
                SignD         <= OverFlow;
                RegDestD      <= "00";
                We3D          <= '0';
                ALUControlD   <= "------";
    end case;
end process;
process (all)
begin 
    case opcode is 
        when "000100" => 
            BranchD <= Branch and zero;
        when "000111" => 
            BranchD <= Branch and BGreat;
        when "000110" => 
            BranchD <= Branch and (BLess or zero);
        when "000101" => 
            BranchD <= Branch and NotEq;
        when "000001" => 
              BranchD <= Branch and (BGreat or zero);     
        when others =>
            BranchD <= '0';            
    end case;      
    BranchDD <= Branch;  
end process;
end Behavioral;