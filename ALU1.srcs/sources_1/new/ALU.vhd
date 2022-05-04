library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
port(
    --inputs
    a,b : in std_logic_vector(31 downto 0);
    Mode: in std_logic_vector(6 downto 3);
    cin : in std_logic;
    --outputs
    cout: inout std_logic;
    R : out std_logic_vector(31 downto 0);
    R_64 : out std_logic_vector(63 downto 0));
end ALU;

architecture Behavioral of ALU is

 component bit_32_adder
          Generic (n: integer := 32);
  port (input1,input2 :in std_logic_vectoR (n-1 downto 0);
            cin: in std_logic;
            cout: inout std_logic;
            overflow : out std_logic;
      out_add:out std_logic_vector (n-1 downto 0)); 
        end component;
        
 component shift_ll
    Generic (n: integer :=32);
		port(
				input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
				cout_sll : out STD_LOGIC;
           out_sll : out  STD_LOGIC_VECTOR (n-1 downto 0)
		);
	end component;
	
component shift_rl
		Generic (n: integer :=32);
    port ( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_srl : out STD_LOGIC := '0';
           out_srl : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component decrement
    Generic (n: integer :=32);
    Port ( a1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
            cin : in std_logic;
           out1 : out  STD_LOGIC_VECTOR (n-1 downto 0)
         );
 end component;
  
 component increment
    Generic (n: integer :=32);
    Port ( a1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
            cin : in std_logic;
           out1 : out  STD_LOGIC_VECTOR (n-1 downto 0)
         );
 end component;
 
 component bit_32_sub
    Generic (n: integer := 32);
        port (input1,input2 :in std_logic_vectoR (n-1 downto 0);
            cin: in std_logic;
            cout: inout std_logic;
            overflow : out std_logic;
      out_sub:out std_logic_vector (n-1 downto 0));
end component;

component slt 
Generic (n: integer :=32);
    Port( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_slt : out STD_LOGIC := '0';	
           out_slt : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component sign_extend
Port(a : in std_logic_vector(31 downto 0);
      b:out std_logic_vector(63 downto 0));
end component;

component floating_divider
Port ( x : in STD_LOGIC_VECTOR (31 downto 0);
y : in STD_LOGIC_VECTOR (31 downto 0);
z : out STD_LOGIC_VECTOR (31 downto 0));
end component;
component floating_multiply
Port ( x : in STD_LOGIC_VECTOR (31 downto 0);
y : in STD_LOGIC_VECTOR (31 downto 0);
z : out STD_LOGIC_VECTOR (31 downto 0));
end component;

    signal adder_op: std_logic_vector(31 downto 0); 
    signal a_extend: std_logic_vector(31 downto 0);
    signal b_extend: std_logic_vector(31 downto 0);
    signal r_flt_div: std_logic_vector(31 downto 0);
    signal slt_op: std_logic_vector(31 downto 0);
    signal sub_op: std_logic_vector(31 downto 0);
    signal r_decre: std_logic_vector(31 downto 0);
    signal r_incre: std_logic_vector(31 downto 0);
    signal r_sign: std_logic_vector(63 downto 0);
    signal r_cout : STD_LOGIC;
	signal r_cout1 : STD_LOGIC;
	signal r_overflow : STD_LOGIC;
	signal r_overflow1 : STD_LOGIC;
	signal r_cout_sll : STD_LOGIC;
	signal r_cout_srl : STD_LOGIC;
	signal r_sll : STD_LOGIC_VECTOR (31 downto 0);
	signal r_srl : STD_LOGIC_VECTOR (31 downto 0);
begin

--a_ext: sign_extend port map(a, a_extend);
--b_ext: sign_extend port map(b, b_extend);

P1: bit_32_adder
		port map (a, b, cin,r_cout , r_overflow, adder_op);
P2: shift_ll
		port map (a, r_cout_sll, r_sll);
P3: shift_rl
		port map (a, r_cout_srl, r_srl);
P4: decrement
		port map (a, '0', r_decre);
P5: increment
		port map (a, '0', r_incre);
P6: bit_32_sub
		port map (a, b, cin,r_cout , r_overflow, sub_op);
P7: slt
		port map (a, b,r_cout , slt_op);
P8: sign_extend
        port map(a, r_sign);
P9: floating_divider
    	port map (a_extend, b_extend, r_flt_div);
P10: floating_multiply
    	port map (a_extend, b_extend, r_flt_div);



process(a,b,Mode)
begin

if ( Mode = "0000") then
   R <= adder_op;
 end if; 
if( Mode = "0001") then
   R <= r_sll;
end if;
if( Mode = "0010") then
   R <= r_srl;
end if;
if( Mode = "0011") then
   R <= r_decre;
end if;
if( Mode = "0100") then
   R <= r_incre;
end if;
if( Mode = "0101") then
   R <= sub_op;
end if;
if( Mode = "0111") then
   R <= slt_op;
end if;
if( Mode = "1000") then
   R <= a and b;
end if;
if( Mode = "1001") then
   R <= a or b;
end if;
if( Mode = "1001") then
   R <= a xor b;
end if;
if( Mode = "1010") then
   R_64 <= r_sign;
end if;

end process;

end Behavioral;
