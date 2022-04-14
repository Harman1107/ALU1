

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;

--use UNISIM.VComponents.all;


entity full_adder is
  Port ( a : in std_logic;
         b: in std_logic;
         Cin: in std_logic;
         s: out std_logic;
         Cout: out std_logic 
         );
end full_adder;

architecture data of full_adder is

component half_adder is
    port (a,b :in STD_LOGIC;
          s,c: out STD_LOGIC);
    end component;
begin
s <= a xor b xor Cin;
Cout <= (a and b) or (Cin and (a xor b));

end data;