library IEEE;
use ieee.std_logic_1164.all;

Entity test is 
end entity;

Architecture test_behave of test is 
  component half_adder is
port(
  A,B : in std_logic;
  C,S : out std_logic
  );
end component;
  
  signal A,B,C,S : std_logic;
  begin
    ha : half_adder port map (A,B,C,S);
      A <= '1' , '0' after 100 ns;
      B <= '1' ;
end test_behave;
