
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Sign_extend is
Port(a : in std_logic_vector(31 downto 0);
      b:out std_logic_vector(63 downto 0));
end Sign_extend;

architecture Behavioral of Sign_extend is
signal mask_a : std_logic_vector(63 downto 0);
signal mask_posi : std_logic_vector(31 downto 0);
begin

b <= std_logic_vector(resize(signed(a), b'length));
end Behavioral;
