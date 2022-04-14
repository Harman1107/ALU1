
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.all;




entity bit_4_adder is
port (a,b :in std_logic_vector (3 downto 0);
       cin: in std_logic;
       cout:out std_logic;
      s:out std_logic_vector (3 downto 0)); 
end bit_4_adder ;

architecture Behavioral of bit_4_adder is
signal c1, c2, c3: std_logic;
begin
full_adder1: full_adder port map(a=>a(0),b=> b(0),cin => cin,s=> s(0),cout => c1 );
full_adder2: full_adder port map(a=>a(1),b=> b(1),cin => c1,s=> s(1),cout => c2 );
full_adder3: full_adder port map(a=>a(2),b=> b(2),cin => c2,s=> s(2),cout => c3 );
full_adder4: full_adder port map(a=>a(3),b=> b(3),cin => c3,s=> s(3),cout => cout );

end Behavioral;