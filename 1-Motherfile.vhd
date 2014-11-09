-- @author: Aditya Sundararajan
-- www.github.com/1143stuff

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Motherfile is						 
  
  PORT(A,B:in std_logic_vector(3 downto 0);                  -- 'A' and 'B' are the inputs 
       								 
	  sel:in std_logic;		                         -- 'sel' is the select input 
	                                                                         -- used for selecting method 1 or method 2 
	  
	  output:out std_logic_vector(7 downto 0));    -- 'output' is the final output

end Motherfile;

architecture Behavioral of Motherfile is

signal X,Y: std_logic_vector(7 downto 0):="00000000";

component Four_bit_multiplier is		         -- Component of 1st method
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           S : out std_logic_vector(7 downto 0));
end Component;

component four_bit_multiplier2 is	                         -- Component of 2nd method
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           P : out std_logic_vector(7 downto 0));
end component;
begin
stage1:Four_bit_multiplier port map(A,B,X);                   -- Port mapping with 1st method
                                                                                         -- X is the Output of 1st method 

stage2:four_bit_multiplier2 port map(A,B,Y);	         -- Port mapping with 1st method
                                                                                         -- Y is the Output of 2nd method

output<= X when sel='0' else			         -- When sel='0', method 1 is selected
                                                                                         -- and its output(i.e. X) is assigned to 'output' 
         
	    Y when sel='1';			         -- When sel='1', method 2 is selected
                                                                                         -- and its output(i.e. Y) is assigned to 'output' 

end Behavioral;
