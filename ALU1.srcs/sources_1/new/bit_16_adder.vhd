
library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.all;




entity bit_32_adder is
    Generic (n: integer := 32);
  port (input1,input2 :in std_logic_vectoR (n-1 downto 0);
            cin: in std_logic;
            cout: inout std_logic;
            overflow : out std_logic;
      out_add:out std_logic_vector (n-1 downto 0)); 
end bit_32_adder ;

architecture structural of bit_32_adder is

signal t : std_logic_vector(1 to n-1);
signal c: std_logic;

begin


	U1: full_adder
		port map (cin, input1(0), input2(0), out_add(0), t(1));
		
	U_Generator: For i in 1 to n-2 generate
		U_i: full_adder
			port map (t(i), input1(i), input2(i), out_add(i), t(i+1));
	end generate;

	U_n: full_adder
		port map (t(n-1), input1(n-1), input2(n-1), out_add(n-1), cout);	
	
	
	c <= cout;
	overflow <= t(n-1) xor c;



end structural;
