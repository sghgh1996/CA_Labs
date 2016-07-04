library IEEE;
use IEEE.std_logic_1164.all;

Entity mas_mux is 
  port(
    I : in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(1 downto 0);
    output : out std_logic 
  );
end entity;

Architecture mas_mux_beh of mas_mux is
  begin
    output <= I(0) when sel = "00" else 
     I(1) when sel = "01" else
     I(2) when sel = "10" else
     I(3) when sel = "11" ;
    
    
end mas_mux_beh;