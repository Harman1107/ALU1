library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- Needed for shifts
entity example_shift is
port(a: in std_logic_vector(15 downto 0);
     out1: out unsigned(15 downto 0));
end example_shift;
 
architecture behave of example_shift is
  signal r_Unsigned_L : unsigned(15 downto 0)         := "0000000000000000";
 
   
begin
 
  process is
  begin
    -- Left Shift
    out1 <= shift_right(unsigned(a), 1);
     
    --r_Signed_L   <= shift_left(signed(a), 1);
     
    -- Right Shift
   -- r_Unsigned_R <= shift_right(unsigned(a), 2);
    --r_Signed_R   <= shift_right(signed(a), 2);
 
    wait for 100 ns;
  end process;
end architecture behave;