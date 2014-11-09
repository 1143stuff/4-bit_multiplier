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

entity Full_adder is
    Port ( x,y : in std_logic;			    -- 'x' and 'y' are the inputs
           cin : in std_logic;			    -- 'cin' is the carry input from previous adder 
           sum : out std_logic;			    -- 'sum' is the sum output of 'x','y' and 'cin'
           cout : out std_logic);	                                    -- 'cout' is the carry output of 'x','y' and 'cin'
end Full_adder;

architecture Behavioral of Full_adder is

begin

sum<=x xor y xor cin;			    -- This step calculates the sum of 'x','y' and 'cin'
cout<=(x and y) or (y and cin) or (cin and x);              -- This step calculates the sum of 'x','y' and 'cin'

end Behavioral;