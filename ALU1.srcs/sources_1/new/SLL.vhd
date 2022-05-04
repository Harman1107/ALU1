library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity shift_ll is
	 Generic (n : integer :=32);
    Port ( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_sll : out STD_LOGIC := '0';
           out_sll : out  STD_LOGIC_VECTOR (n-1 downto 0));
end shift_ll;

architecture Behavioral of shift_ll is

begin
	
	Result_proc1: process
	begin
		for i in 0 to 2 loop
			out_sll(i) <= '0';
			end loop;
		wait for 0.1 ns;
		
		
		for i in 31 downto 3 loop
			out_sll(i) <= input1(i-3);
			end loop;
		wait for 0.1 ns;
		
end process Result_proc1;

end Behavioral;