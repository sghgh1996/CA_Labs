----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:37 04/26/2016 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
port(
reset : in std_logic;
hi_clk : in std_logic;
ctrl : in std_logic;
output : out std_logic_vector(3 downto 0)
);
end counter;

architecture Behavioral of counter is

component clock_divider is
port(
   clk: in std_logic;
	out_clk : out std_logic
);
end component;
signal vout : std_logic_vector(3 downto 0);
signal low_clk : std_logic;
begin


clk_di : clock_divider port map(hi_clk,low_clk);
process(low_clk , reset)
begin
	if(reset = '1') then
		vout <= "0000";
	elsif(rising_edge(low_clk)) then
		if(ctrl = '1') then --up
			if(vout = "1111") then
				vout <= "0000";
			else
				vout <= vout + 1;
			end if;
		elsif(ctrl = '0') then
			if(vout = "0000") then
				vout <= "1111";
			else
				vout <= vout - 1;
			end if;
		end if;
	end if;
	output <= vout;
end process;
end Behavioral;

