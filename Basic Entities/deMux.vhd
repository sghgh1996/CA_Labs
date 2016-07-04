library IEEE;
use IEEE.std_logic_1164.all;

entity deMux is
  port(
    input : in std_logic;
    select_line : in std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0)
  );
end entity;

architecture deMux_arch of deMux is
begin
  output(0) <= input when select_line="00" else '0';
  output(1) <= input when select_line="01" else '0';
  output(2) <= input when select_line="10" else '0';
  output(3) <= input when select_line="11" else '0';
end architecture;
