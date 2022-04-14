
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.all;




entity bit_16_adder is
  port (a,b :in std_logic_vectoR (15 downto 0);
       cin: in std_logic;
       cout:out std_logic;
      s:out std_logic_vector (15 downto 0)); 
end bit_16_adder ;

architecture structural of bit_16_adder is
signal c : std_logic;
begin
GEN_ADD: for I in 0 to 3 generate
bit_4_adder1: bit_4_adder port map(a=>a((I*4 +3) downto I*4 ),b=> b(I*4 +3 downto I*4 ),cin => cin,s=> s(I*4 +3 downto I*4 ),cout => c);
end generate GEN_ADD;
end structural;
