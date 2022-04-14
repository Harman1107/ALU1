library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.all;

entity ALU is
port(
    --inputs
    a,b : in std_logic_vector(15 downto 0);
    Mode: in std_logic_vector(5 downto 3);
    clk, cin : in std_logic;
    --outputs
    cout, Carry, zero: out std_logic;
    R : out std_logic_vector(15 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
signal adder_op,subtract_op, multipy_op, divide_op, incr_op, decr_op: std_logic_vector(15 downto 0);
begin

bit_16_adder1: bit_16_adder port map(a(15 downto 0), b(15 downto 0), cin, Carry, adder_op(15 downto 0));
increment1: increment port map(a(3 downto 0), Carry, incr_op);

process( Mode )
begin

if ( Mode = "000") then
   R <= adder_op;
 end if; 
if( Mode = "001") then
   R <= incr_op;
end if;

end process;

end Behavioral;
