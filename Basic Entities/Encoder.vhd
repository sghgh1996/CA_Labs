library IEEE;
use ieee.std_logic_1164.all;

Entity mas_encoder is
  port(
    I : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(1 downto 0)
  );
end entity;

Architecture mas_encoder_behave of mas_encoder is
  begin 
    output <= "11" when I(3)='1' else
              "10" when I(2)='1' else
              "01" when I(1)='1' else
              "00" when I(0)='1' ;
end mas_encoder_behave;
