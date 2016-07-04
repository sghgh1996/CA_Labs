
--necessary libraries----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------------------------------------
entity adder_component is
port ( 
  		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		cin: in std_logic;
    
    output: out std_logic_vector(3 downto 0);
    cout: out std_logic
);
end adder_component;
architecture behavioral_adder_component of adder_component is
  
  signal p : std_logic_vector(3 downto 0);
  signal g : std_logic_vector(3 downto 0);
  signal c : std_logic_vector(3 downto 0);
  
begin
  
  g <= a and b;
  p <= a xor b;
  
  c(0)<=cin;
  
  c(1) <= g(0) or ( p(0) and c(0) );
  
  c(2) <= g(1) or
          (p(1) and g(0)) or
          (p(1)and p(0) and c(0));
          
  c(3) <= g(2) or 
          (p(2) and g(1)) or
          (p(2) and p(1) and g(0)) or
          (p(2) and p(1) and p(0) and c(0));
    
  cout <= g(3) or
          (p(3) and g(2)) or
          (p(3) and p(2) and g(1)) or
          (p(3) and p(2) and p(1) and g(0)) or
          (p(3) and p(2) and p(1) and p(0) and c(0));
          
  output <= p xor c;  
end behavioral_adder_component;


--necessary libraries----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------------------------------------
entity adder is
port ( 
  		a_in : in std_logic_vector(7 downto 0);
		b_in : in std_logic_vector(7 downto 0);
    
    zeroFlag,signFlag,ovfFlag : out std_logic :='0';
    output_out: out std_logic_vector(7 downto 0);
    c_out: out std_logic

);
end adder;

architecture behavioral_adder of adder is

component adder_component is
port ( 
  		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		cin: in std_logic;
    
    output: out std_logic_vector(3 downto 0);
    cout: out std_logic
);
end component;
signal msb_cin , cout_buff:std_logic;
signal output_buff: std_logic_vector(7 downto 0);

begin
    
lsb: adder_component port map (a_in(3 downto 0),b_in(3 downto 0),'0',output_buff(3 downto 0),msb_cin );
msb: adder_component port map (a_in(7 downto 4),b_in(7 downto 4),msb_cin,output_buff(7 downto 4),cout_buff);
c_out<=cout_buff;
output_out<= output_buff;

zeroFlag <= not( output_buff(0) or output_buff(1) or output_buff(2) or output_buff(3) or output_buff(4) or output_buff(5) or output_buff(6) or output_buff(7));
signFlag <='0';
ovfFlag<= cout_buff;
    
end behavioral_adder;
