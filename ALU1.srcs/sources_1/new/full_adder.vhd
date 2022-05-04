

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity full_adder is
  Port ( a : in std_logic;
         b: in std_logic;
--         binv: in std_logic;
         Cin: in std_logic;
         s: out std_logic;
         Cout: out std_logic 
         );
end full_adder;

architecture data of full_adder is
--signal b1: std_logic;
component half_adder is
    port (a,b :in STD_LOGIC;
          s,c: out STD_LOGIC);
    end component;
begin
--b1 <= b xor binv;
s <= a xor b xor Cin;
Cout <= (a and b) or (Cin and (a xor b));

end data;