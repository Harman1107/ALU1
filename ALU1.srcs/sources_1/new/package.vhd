
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package adders is
      component full_adder
        port(a, b,cin : in std_logic;
             s, cout: out std_logic);
       end component;
       
       component half_adder
               port(a, b: in std_logic;
                    s, c: out std_logic);
       end component;
       component bit_4_adder
       port (a,b :in std_logic_vectoR (3 downto 0);
              cin: in std_logic;
              cout:out std_logic;
             s:out std_logic_vector (3 downto 0));
        end component;
        component bit_16_adder
        port (a,b :in std_logic_vector (15 downto 0);
                cin: in std_logic;
                cout:out std_logic;
                s:out std_logic_vector (15 downto 0)); 
        end component;
       component increment
        Port ( a1 : in  STD_LOGIC_VECTOR (3 downto 0);
				carry : out  STD_LOGIC;
           out1 : out  STD_LOGIC_VECTOR (3 downto 0)
           
			  );
		end component; 
end adders;       

