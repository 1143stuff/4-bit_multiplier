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

entity myblock is
     port(x,y,cin,a:in std_logic;				                  -- 'x', 'y', 'cin' and 'a' are the inputs
          sumout,cout:out std_logic);			                  -- 'sumout' and 'cout' are the outputs
end myblock;

architecture Behavioral of myblock is
signal b:std_logic;
begin

 b<=x and y;					                 -- This step 'ands' the value of 'a' and 'b'
                                                                                                                 -- This is assigned to 'b'

 sumout<=a xor b xor cin;			 		 -- This step calculates the sum of 'a', 'b' and                                                                               -- 'cin'
 							 -- This is assigned to 'sumout'

 cout<=(a and b) or	(b and cin) or (cin and a);	                                 -- This step calculates the carry of 'a', 'b' and 'cin'
							 -- This is assigned to 'cout'

end Behavioral;	 