library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

Entity ram is
  port(
    wen : in std_logic;
    ren : in std_logic;
    reset : in std_logic;
    address : in std_logic_vector(9 downto 0);
    clk : in std_logic;
    datain : in std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0)
  );
end entity;

Architecture ram_behave of ram is
  type ram_type is array(1023 downto 0) of std_logic_vector(15 downto 0);
  signal memory : ram_type;
begin
  process(clk,reset)
    begin
      if(reset = '1') then
          for i in 0 to 1023 loop
            memory(i) <= std_logic_vector(to_unsigned(i, 16));
          end loop;
      elsif(rising_edge(clk)) then
          if(wen = '1' and ren = '0') then
            memory(conv_integer(address)) <= datain;
            dataout <= (OTHERS => 'Z'); 
          elsif(wen = '0' and ren = '1') then
            dataout <= memory(conv_integer(address));
        end if;
      end if;
    end process;
  
end architecture;
