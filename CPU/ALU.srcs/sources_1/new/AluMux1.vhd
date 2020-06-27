----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2019 01:09:46 PM
-- Design Name: 
-- Module Name: AluMux1 - Behavioral
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

entity AluMux32In is
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
end AluMux32In;

architecture Behavioral of AluMux32In is
    component Mux32In
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
    end component;
--    signal preOut       : std_logic_vector(31 downto 0);
begin
    Mux32: Mux32In
        port map(
                    data1        => data1(31 downto 0), 
                    data2        => data2(31 downto 0),
                    data3        => data3(31 downto 0),
                    data4        => data4(31 downto 0),
                    data5        => data5(31 downto 0), 
                    data6        => data6(31 downto 0),
                    data7        => data7(31 downto 0),
                    data8        => data8(31 downto 0),
                    data9        => data9(31 downto 0), 
                    data10       => data10(31 downto 0),
                    data11       => data11(31 downto 0),
                    data12       => data12(31 downto 0),
                    data13       => data13(31 downto 0), 
                    data14       => data14(31 downto 0),
                    data15       => data15(31 downto 0),
                    data16       => data16(31 downto 0),
                    data17       => data17(31 downto 0), 
                    data18       => data18(31 downto 0),
                    data19       => data19(31 downto 0),
                    data20       => data20(31 downto 0),
                    data21       => data21(31 downto 0), 
                    data22       => data22(31 downto 0),
                    data23       => data23(31 downto 0),
                    data24       => data24(31 downto 0),
                    data25       => data25(31 downto 0),
                    data26       => data26(31 downto 0), 
                    data27       => data27(31 downto 0),
                    data28       => data28(31 downto 0),
                    data29       => data29(31 downto 0),
                    data30       => data30(31 downto 0),
                    data31       => data31(31 downto 0), 
                    data32       => data32(31 downto 0),
                    data33       => data33(31 downto 0), 
                    data34       => data34(31 downto 0),
                    data35       => data35(31 downto 0),
                    data36       => data36(31 downto 0),
                    data37       => data37(31 downto 0), 
                    data38       => data38(31 downto 0),
                    data39       => data39(31 downto 0),
                    data40       => data40(31 downto 0),
                    data41       => data41(31 downto 0), 
                    data42       => data42(31 downto 0),
                    data43       => data43(31 downto 0),
                    data44       => data44(31 downto 0),
                    data45       => data45(31 downto 0), 
                    data46       => data46(31 downto 0),
                    data47       => data47(31 downto 0),
                    data48       => data48(31 downto 0),
                    data49       => data49(31 downto 0), 
                    data50       => data50(31 downto 0),
                    data51       => data51(31 downto 0),
                    data52       => data52(31 downto 0),
                    data53       => data53(31 downto 0), 
                    data54       => data54(31 downto 0),
                    data55       => data55(31 downto 0),
                    data56       => data56(31 downto 0),
                    data57       => data57(31 downto 0),
                    data58       => data58(31 downto 0), 
                    data59       => data59(31 downto 0),
                    data60       => data60(31 downto 0),
                    data61       => data61(31 downto 0),
                    data62       => data62(31 downto 0),
                    data63       => data63(31 downto 0), 
                    data64       => data64(31 downto 0),
                    selector     => selector(5 downto 0),
                    output       => output(31 downto 0)
                  );     
end Behavioral;