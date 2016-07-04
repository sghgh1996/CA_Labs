library IEEE;
use ieee.std_logic_1164.all;

Entity half_adder is
port(
  A,B : in std_logic;
  C,S : out std_logic
  );
end entity;

Architecture half_adder_behave of half_adder is
  begin
    S <= A xor B;
    C <= A and B;
end half_adder_behave;
