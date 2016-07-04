library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity ram_tb is 
end entity;

architecture ram_tb_behave of ram_tb is 
component ram is
  port(
    wen : in std_logic;
    ren : in std_logic;
    reset : in std_logic;
    address : in std_logic_vector(9 downto 0);
    clk : in std_logic;
    datain : in std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0)
  );
end component;

signal w, r, rst : std_logic;
signal addr : std_logic_vector(9 downto 0);
signal di : std_logic_vector(15 downto 0);
signal do : std_logic_vector(15 downto 0);
signal clk : std_logic := '0';
begin
  process
    begin
      wait for 10ns;
      clk <= not clk;
    end process;
    
  RAM_component : ram port map(w, r, rst, addr, clk, di, do);
  rst <= '1', '0' after 10ns;
  w <= '1', '0' after 60ns;
  r <= '0', '1' after 60ns;
  di <= "0000000000111111";
  addr <= "0000000000";
  
end architecture;