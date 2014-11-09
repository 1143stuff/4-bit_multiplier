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

entity Four_bit_multiplier is
    Port ( A,B : in std_logic_vector(3 downto 0); 	                                      -- 'A' and 'B' are the inputs
           
           S : out std_logic_vector(7 downto 0));		                      -- 'S' is the output

end Four_bit_multiplier;

architecture Behavioral of Four_bit_multiplier is
   signal w,x,y,z:std_logic_vector(3 downto 0);
   signal fas,fac:std_logic_vector(1 to 12);
   
   component full_adder is				                     -- Component of 'full_adder' program 
       Port ( x : in std_logic;
              y : in std_logic;
              cin : in std_logic;
              sum : out std_logic;
              cout : out std_logic);
   end component;
begin
Process(A,B)						     -- Process with sensitive inputs 'A' and 'B'
begin
   for i in 0 to 3 loop				                                     -- This for loop is used for assigning the 'and' values of each and every bit
   w(i)<=A(i) and B(0);
   x(i)<=A(i) and B(1);
   y(i)<=A(i) and B(2);
   z(i)<=A(i) and B(3);
   end loop;
end process;
S(0)<=w(0);						    -- This assigns 'w(0)' to 'S(0)' bit

-- The following steps from 'stage1' to 'stage12' is used for
-- port mapping the entities and signals with the 'full_adder' program.
 
stage1: full_adder port map(w(1),x(0),'0',S(1),fac(1));
stage2: full_adder port map(x(1),y(0),'0',fas(2),fac(2));
stage3: full_adder port map(y(1),z(0),'0',fas(3),fac(3));
stage4: full_adder port map(y(2),z(1),fac(3),fas(4),fac(4));
stage5: full_adder port map(w(2),fas(2),fac(1),S(2),fac(5));
stage6: full_adder port map(x(2),fas(3),fac(2),fas(6),fac(6));
stage7: full_adder port map(x(3),fas(4),fac(6),fas(7),fac(7));
stage8: full_adder port map(y(3),z(2),fac(4),fas(8),fac(8));
stage9: full_adder port map(w(3),fas(6),fac(5),S(3),fac(9));
stage10: full_adder port map(fas(7),fac(9),'0',S(4),fac(10));
stage11: full_adder port map(fas(8),fac(7),fac(10),S(5),fac(11));
stage12: full_adder port map(z(3),fac(8),fac(11),S(6),S(7));

end Behavioral;