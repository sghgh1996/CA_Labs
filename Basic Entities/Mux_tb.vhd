library IEEE;
use IEEE.std_logic_1164.all;

Entity test is
end entity test;

Architecture mux_test of test is
  component mas_mux is 
  port(
    I : in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(1 downto 0);
    output : out std_logic 
  );
end component;
signal I : std_logic_vector(3 downto 0);  
signal sel :  std_logic_vector(1 downto 0);
signal output :  std_logic;

begin 
  mux1: mas_mux port map (I,sel,output);
  I <= "1000";
  sel <= "00" , "11" after 100 ns;
    
end mux_test;


