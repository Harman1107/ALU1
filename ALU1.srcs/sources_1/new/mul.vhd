library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
entity mult is
	 port(
		 A : in std_logic_vector(31 downto 0);
		 B : in std_logic_vector(31 downto 0);
		 C : out std_logic_vector(63 downto 0)
	     );
end mult;
architecture BOOTH of mult is
begin
	process (A,B)
  variable tmp_B: signed(32 downto 0) ;
  variable tmp_out: signed(63 downto 0) ;
  variable tmp_A: signed(63 downto 0) ;
  variable fixed_A : signed(63 downto 0) ;
	variable i : integer ;
	begin
		tmp_B := "000000000000000000000000000000000" ;
		fixed_A := "0000000000000000000000000000000000000000000000000000000000000000" ;
		tmp_out := "0000000000000000000000000000000000000000000000000000000000000000" ;
        tmp_A := "0000000000000000000000000000000000000000000000000000000000000000";
    tmp_b(32 downto 1) := signed(b) ;
		fixed_A(31 downto 0 ) :=  signed(A) ;
	for i in 0 to 31 loop
		tmp_A := fixed_A ;
		if ((tmp_b(i+1 downto i) = "01")) then
		    
			tmp_A :=  shift_left(tmp_A , i) ;
			tmp_out :=  tmp_out + tmp_A ;
		end if;
		if ((tmp_b(i+1 downto i) = "10"  )) then  
			tmp_A := -tmp_A;
			tmp_A :=  shift_left(tmp_A , i) ;
			tmp_out := tmp_out + tmp_A ;
		end if ;
	end loop;
	c <=  std_logic_vector(tmp_out) ;
	end process ;
end BOOTH;