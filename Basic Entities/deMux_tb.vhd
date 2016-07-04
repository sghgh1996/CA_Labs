library IEEE;
use IEEE.std_logic_1164.all;

entity deMux_tb is
end entity;

architecture deMux_tb_arch of deMux_tb is
component deMux is
  port(
    input : in std_logic;
    select_line : in std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0)
  );
end component deMux;

signal i : std_logic;
signal s : std_logic_vector(1 downto 0);
signal o : std_logic_vector(3 downto 0);

begin
d : deMux port map(i, s, o);
i <= '1';
s <= "00", "01" after 50ns, "10" after 100ns, "11" after 150ns;  
end architecture;
