library IEEE;
use ieee.std_logic_1164.all;

Entity test is 
end entity;

Architecture test_behave of test is 
component MAS_FullAdder is 
  port(
    A,B,Cin : in std_logic;
    Cout,S : out std_logic 
  );
end component;
  signal A,B,Cin,Cout,S : std_logic;
  begin
    fa : MAS_FullAdder port map (A,B,Cin,Cout,S);
      A <= '1' , '0' after 100 ns;
      B <= '1' ;
      Cin <= '0';
end test_behave;
