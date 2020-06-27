----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 03:52:50 PM
-- Design Name: 
-- Module Name: Mux32In - Behavioral
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

entity Mux32In is
Port (  
        data1, data2, data3, data4              : in std_logic_vector(31 downto 0);
        data5, data6, data7, data8              : in std_logic_vector(31 downto 0); 
        data9, data10, data11, data12           : in std_logic_vector(31 downto 0);
        data13, data14, data15, data16          : in std_logic_vector(31 downto 0); 
        data17, data18, data19, data20          : in std_logic_vector(31 downto 0);
        data21, data22, data23, data24          : in std_logic_vector(31 downto 0);
        data25, data26, data27, data28          : in std_logic_vector(31 downto 0);
        data29, data30, data31, data32          : in std_logic_vector(31 downto 0);
        data33, data34, data35, data36          : in std_logic_vector(31 downto 0);
        data37, data38, data39, data40          : in std_logic_vector(31 downto 0); 
        data41, data42, data43, data44          : in std_logic_vector(31 downto 0);
        data45, data46, data47, data48          : in std_logic_vector(31 downto 0); 
        data49, data50, data51, data52          : in std_logic_vector(31 downto 0);
        data53, data54, data55, data56          : in std_logic_vector(31 downto 0);
        data57, data58, data59, data60          : in std_logic_vector(31 downto 0);
        data61, data62, data63, data64          : in std_logic_vector(31 downto 0); 
        selector                                : in std_logic_vector(5 downto 0);
        output                                  : out std_logic_vector(31 downto 0)
      );
end Mux32In;

architecture Behavioral of Mux32In is
    component MuxHalf
        Port (  
                data1, data2, data3, data4              : in std_logic_vector(31 downto 0);
                data5, data6, data7, data8              : in std_logic_vector(31 downto 0); 
                data9, data10, data11, data12           : in std_logic_vector(31 downto 0);
                data13, data14, data15, data16          : in std_logic_vector(31 downto 0); 
                data17, data18, data19, data20          : in std_logic_vector(31 downto 0);
                data21, data22, data23, data24          : in std_logic_vector(31 downto 0);
                data25, data26, data27, data28          : in std_logic_vector(31 downto 0);
                data29, data30, data31, data32          : in std_logic_vector(31 downto 0);
                selector                                : in std_logic_vector(4 downto 0);                     
                output                                  : out std_logic_vector(31 downto 0) 
            );
    end component;
    
    component Final
        port (
                data1, data2        : in std_logic_vector(31 downto 0);
                selector           : in std_logic;
                output              :  out std_logic_vector(31 downto 0)
            );
    end component;
    
    signal PreOut1, preOut2     : std_logic_vector(31 downto 0);
    
begin 
    SmallPart: MuxHalf
        port map(
                    data1        => data1,
                    data2        => data2,
                    data3        => data3,
                    data4        => data4,
                    data5        => data5,
                    data6        => data6,
                    data7        => data7,
                    data8        => data8,
                    data9        => data9,
                    data10       => data10,
                    data11       => data11,
                    data12       => data12,
                    data13       => data13,
                    data14       => data14,
                    data15       => data15,
                    data16       => data16,
                    data17       => data17,
                    data18       => data18,
                    data19       => data19,
                    data20       => data20,
                    data21       => data21,
                    data22       => data22,
                    data23       => data23,
                    data24       => data24,
                    data25       => data25,
                    data26       => data26,
                    data27       => data27,
                    data28       => data28,
                    data29       => data29,
                    data30       => data30,
                    data31       => data31,
                    data32       => data32,
                    selector    => selector(4 downto 0),
                    output      => PreOut1
                );
                
    BigPart: MuxHalf
        port map(
                    data1        => data33,
                    data2        => data34,
                    data3        => data35,
                    data4        => data36,
                    data5        => data37,
                    data6        => data38,
                    data7        => data39,
                    data8        => data40,
                    data9        => data41,
                    data10       => data42,
                    data11       => data43,
                    data12       => data44,
                    data13       => data45,
                    data14       => data46,
                    data15       => data47,
                    data16       => data48,
                    data17       => data49,
                    data18       => data50,
                    data19       => data51,
                    data20       => data52,
                    data21       => data53,
                    data22       => data54,
                    data23       => data55,
                    data24       => data56,
                    data25       => data57,
                    data26       => data58,
                    data27       => data59,
                    data28       => data60,
                    data29       => data61,
                    data30       => data62,
                    data31       => data63,
                    data32       => data64,
                    selector    => selector(4 downto 0),
                    output      => PreOut2
                );
                
    FinalPart: Final
        port map(
                    data1       => PreOut1,
                    data2       => PreOut2,
                    selector    => selector(5),
                    output      => output
                );
end Behavioral;
