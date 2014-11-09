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

entity four_bit_multiplier2 is
    Port ( A,B : in std_logic_vector(3 downto 0);		                -- 'A' and 'B' are the inputs
           
           P : out std_logic_vector(7 downto 0));		                -- 'P' is the output
end four_bit_multiplier2;

architecture Behavioral of four_bit_multiplier2 is

signal c,s:std_logic_vector(1 to 18);

component myblock is					-- This is the component for 'myblock' program
     port(x,y,cin,a:in std_logic;
          sumout,cout:out std_logic);
end component;

begin

-- The following steps from 'stage1' to 'stage18' is used for
-- port mapping the entities and signals with the 'myblock' program.

Stage1:myblock port map(A(0),B(0),'0','0',P(0),C(1));
Stage2:myblock port map(A(1),B(0),'0','0',S(2),C(2));
Stage3:myblock port map(A(0),B(2),'0','0',S(3),C(3));
Stage4:myblock port map(A(0),B(3),'0','0',S(4),C(4));
Stage5:myblock port map(A(0),B(1),C(1),S(2),P(1),C(5));
Stage6:myblock port map(A(1),B(1),C(2),S(3),S(6),C(6));
Stage7:myblock port map(A(1),B(2),C(3),S(4),S(7),C(7));
Stage8:myblock port map(A(1),B(3),C(4),'0',S(8),C(8));
Stage9:myblock port map(A(2),B(0),C(5),S(6),P(2),C(9));
Stage10:myblock port map(A(2),B(1),C(6),S(7),S(10),C(10));
Stage11:myblock port map(A(2),B(2),C(7),S(8),S(11),C(11));
Stage12:myblock port map(A(2),B(3),C(8),'0',S(12),C(12));
Stage13:myblock port map(A(3),B(0),C(9),S(10),P(3),C(13));
Stage14:myblock port map(A(3),B(1),C(10),S(11),S(14),C(14));
Stage15:myblock port map(A(3),B(2),C(11),S(12),S(15),C(15));
Stage16:myblock port map('0','0',C(13),S(14),P(4),C(16));
Stage17:myblock port map('1',C(14),C(16),S(15),P(5),C(17));
Stage18:myblock port map(A(3),B(3),C(15),C(17),P(6),P(7));

end Behavioral;