library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity slt is
	 Generic (n: integer :=32);
    Port( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_slt : out STD_LOGIC := '0';	
           out_slt : out  STD_LOGIC_VECTOR (n-1 downto 0));
end slt;

architecture Behavioral of slt is


begin
	SetLessThan: process
		begin 
    
			if (input1 < input2) then  
				out_slt <= "00000000000000000000000000000001";
			else
				out_slt <= "00000000000000000000000000000000"; 
			end if; 
		   wait for 0.1 ns;
			
	end process SetLessThan;
end Behavioral;