library IEEE;
use ieee.std_logic_1164.all;

Entity test is
end entity;

Architecture encoder_test of test is
  
component mas_encoder is
  port(
    I : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(1 downto 0)
  );
end component;
signal I :  std_logic_vector(3 downto 0);
signal output : std_logic_vector(1 downto 0);

begin
  en1 : mas_encoder port map ( I , output );
  I <= "1000" , "0100" after 100 ns, "0010" after 200 ns , "0001" after 300 ns;
  
end encoder_test;