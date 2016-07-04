----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:13:47 05/03/2016 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
port(
    wen : in std_logic;
    ren : in std_logic;
    reset : in std_logic;
    address : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    datain : in std_logic_vector(7 downto 0);
    dataout : out std_logic_vector(7 downto 0)
  );
end RAM;

architecture Behavioral of RAM is
  type ram_type is array(15 downto 0) of std_logic_vector(7 downto 0);
  signal memory : ram_type;
begin
  process(clk,reset)
    begin
      if(reset = '1') then
          for i in 0 to 15 loop
             memory(i) <= std_logic_vector(to_unsigned(i, 8));
          end loop;
			 memory(0) <= "10111100";
			 memory(1) <= "11110100";
			 memory(2) <= "00110100";
			 memory(5) <= "10110101";
      elsif(rising_edge(clk)) then
          if(wen = '1' and ren = '0') then
            memory(conv_integer(address)) <= datain;
            dataout <= (OTHERS => 'Z'); 
          elsif(wen = '0' and ren = '1') then
            dataout <= memory(conv_integer(address));
        end if;
      end if;
    end process;
end Behavioral;

