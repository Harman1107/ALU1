library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decrement is
Generic (n: integer :=32);
    Port ( a1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
            cin : in std_logic;
           out1 : out  STD_LOGIC_VECTOR (n-1 downto 0)
         );
end decrement;

architecture Behavioral of decrement is

 component bit_32_adder
          Generic (n: integer := 32);
  port (input1,input2 :in std_logic_vectoR (n-1 downto 0);
            cin: in std_logic;
            cout: inout std_logic;
            overflow : out std_logic;
      out_add:out std_logic_vector (n-1 downto 0)); 
 end component;

signal overflow : STD_LOGIC; 
signal cout : STD_LOGIC;

begin
bit_32_adder1: bit_32_adder port map(a1(n-1 downto 0), "11111111111111111111111111111111", cin, cout, overflow, out1(n-1 downto 0)); 
end Behavioral;