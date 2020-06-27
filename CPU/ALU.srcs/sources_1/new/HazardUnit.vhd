----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2020 03:45:06 PM
-- Design Name: 
-- Module Name: HazardUnit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- -
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

entity HazardUnit is
Port (
                SignImmM                            : in STD_LOGIC_vector(31 downto 0);
                rsD, rtD, rsE, rtE, RsM             : in STD_LOGIC_vector(4 downto 0);
                writeregE, writeregM, writeregW     : in STD_LOGIC_vector(4 downto 0);
                memtoregW, memtoregM, memtoregE     : in std_logic_vector(1 downto 0);
                regwriteE, regwriteM, regwriteW     : in std_logic;
                memWriteM, MemWriteD, weHM, weHW    : in std_logic;
                BranchDD                            : in std_logic;
                ForwardDataM                        : out std_logic;
                ForwardAD, ForwardBD                : out std_logic_vector(1 downto 0);
                ForwardAE, ForwardBE, ForwardMA     : out std_logic_vector(1 downto 0);
                ForwardPCF                          : out std_logic_vector(1 downto 0);
                PCSrcF                              : in std_logic_vector(2 downto 0);
                stallF, flushE                      : out std_logic;
                ForwardLUA, ForwardLUB, CLRD        : out std_logic;
                stallD                              : inout std_logic
            );
end HazardUnit;

architecture Behavioral of HazardUnit is
    signal lwstallD, branchstallD, JD, JAL, BD: std_logic;
begin
    JD <= PCSrcF(1);
    JAL <= PCSrcF(2);
    BD <= PCSrcF(0);
--     forwarding sources to D stage (branch equality)
--    ForwardBranch <= '1' when (branchDE = '1') and (stallfE = '1') and (clrdE = '1')
--                else '0';
    
    process(all)
    begin 
        if (branchstallD ='1') then 
            CLRD <= '0';
        else 
            CLRD <= JD or JAL or BD;
        end if;
    end process;
                
--    flushD <= '1' when (branchDE = '1') and (stallfE = '1') and (clrdE = '1')
--         else '0';            


    forwardAD <= "01" when ((rsD /= "00000") and (rsD = writeregM) and (regwriteM = '1')) else   
                 "10" when ((rsD /= "00000") and (rsD = writeregM) and (memtoregM = "11"))
            else "00";
    forwardBD <= "01" when ((rtD /= "00000") and (rtD = writeregM) and (regwriteM = '1')) else  
                 "10" when ((rtD /= "00000") and (rtD = writeregM) and (memtoregM = "11"))
            else "00";
    
    
    ForwardLUA <= '1' when (memtoregM = "11") and (RsE = writeRegM) and (regWriteM = '1') and (RsE /= "00000")
             else '0';
    
    ForwardLUB <= '1'  when (memtoregM = "11") and (RtE = writeRegM) and (regWriteM = '1') and (RtE /= "00000")
             else '0';
     
                                
--     forwarding sources to E stage (ALU)
    process(all)
    begin
        if (RsE /= "00000") then
            if ((RsE = writeRegM) and ((regWriteM = '1') or (weHM = '1'))) then
                ForwardAE <= "10";
            elsif ((RsE = writeRegW) and ((regWriteW = '1') or (weHW = '1'))) then
                ForwardAE <= "01";
            elsif ((memWriteM = '1') and (RsE = writeRegM)) then   
                ForwardAE <= "11";  
            else 
                ForwardAE <= "00";        
            end if;
        else 
            forwardAE <= "00";
        end if;
        if (RtE /= "00000") then
            if ((RtE = writeRegM) and (regWriteM = '1')) then
                ForwardBE <= "10";
            elsif ((RtE = writeRegW) and (regWriteW = '1')) then
                ForwardBE <= "01";
            elsif ((memWriteM = '1') and (RtE = writeRegM)) then   
                ForwardBE <= "11";     
            else 
                ForwardBE <= "00";        
            end if;
        else 
            ForwardBE <= "00";         
        end if;
    end process;              
            
    -- stalls
    lwstallD <= '1' when ((memtoregE = "01") and ((rtE = rsD) or (rtE = rtD)) and (MemWriteD = '0'))
           else '0';
    branchstallD <= '1' when (((BranchDD = '1') or ((JAL = '1') and 
                    (WriteRegM /= "11111") and 
                    (WriteRegW /= "11111"))) and
                    (((regwriteE = '1') and
                    ((writeregE = rsD) or (writeregE = rtD))) or
                    ((memtoregM = "01") and
                    ((writeregM = rsD) or (writeregM = rtD)))))
                else '0';
    stallD <= (lwstallD or branchstallD);
    stallF <= stallD; -- stalling D stalls all previous stages
    flushE <= stallD and (not MemWriteD); -- stalling D flushes next stage
    -- not necessary to stall D stage on store if source comes from load;
    -- instead, another bypass network could be added from W to M
    
    -- forwarding sources to M stage (DataMemory address)
    -- forwarding signImm to M stage (DataMemory address)
    ForwardMA <= "01" when ((memWriteM = '1') and RsM = "00000")else
                 "10" when ((memWriteM = '1') and (SignImmM = X"00000000") and (writeRegW = writeRegM)) else 
                 "00";
        
    -- Forwarding ALU resultW to Datamemory Data In
    ForwardDataM <= '1' when ((memtoregW = "01") and (writeRegW = writeRegM) and (memWriteM = '1')) else
                    '0';
                    
    ForwardPCF <= "01" when (WriteRegM = "11111") and (rsD = "11111") and (JAL = '1') else 
                  "10" when (WriteRegW = "11111") and (rsD = "11111") and (JAL = '1')
             else "00";                
end Behavioral;