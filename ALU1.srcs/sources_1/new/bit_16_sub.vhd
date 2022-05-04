
library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.all;




entity bit_32_sub is
    Generic (n: integer := 32);
  port (input1,input2 :in std_logic_vectoR (n-1 downto 0);
            cin: in std_logic;
            cout: inout std_logic;
            overflow : out std_logic;
      out_sub:out std_logic_vector (n-1 downto 0)); 
end bit_32_sub ;

architecture structural of bit_32_sub is

    signal t: STD_LOGIC_VECTOR (1 to n-1); -- carries
	signal invertInput2 : STD_LOGIC_VECTOR (0 to n-1);
	signal cin_0: STD_LOGIC_VECTOR(0 to n-1);
	signal c: STD_LOGIC;

begin

cin_0 <= X"00000001";
		inv_Subtraction: for i in 0 to n-1 generate
			invertInput2(i) <= input2(i) XOR cin_0(i); 
		end generate inv_Subtraction; 
		

	
	U1: full_adder
		port map (cin, input1(0), invertInput2(0), out_sub(0), t(1));
		
	U_Generator: For i in 1 to n-2 generate
		U_i: full_adder
			port map (t(i), input1(i), invertInput2(i), out_sub(i), t(i+1));
	end generate;

	U_n: full_adder
		port map (t(n-1), input1(n-1), invertInput2(n-1), out_sub(n-1), cout);	
	
	c <= cout;
	overflow <= t(n-1) xor c;

end structural;