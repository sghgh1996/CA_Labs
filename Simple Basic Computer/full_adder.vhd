library IEEE;
use ieee.std_logic_1164.all;

Entity MAS_FullAdder is 
  port(
    A,B,Cin : in std_logic;
    S,Cout : out std_logic 
  );
end entity;

Architecture MAS_FA of MAS_FullAdder is
   component half_adder is
port(
  A,B : in std_logic;
  C,S : out std_logic
  );
end component;

  signal S1,Co1,Co2 : std_logic ;
  begin 
    ha1 : half_adder port map (A,B,Co1,S1);
    ha2 : half_adder port map (S1,Cin,Co2,S);
    Cout <= Co1 or Co2;
end MAS_FA;

