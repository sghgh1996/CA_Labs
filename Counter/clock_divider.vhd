----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:15:30 04/26/2016 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
port(
   clk: in std_logic;
	out_clk : out std_logic
);
end clock_divider;

architecture Behavioral of clock_divider is
begin
process(clk)
variable counter : integer := 0;
begin
	if(rising_edge(clk)) then
		counter := counter + 1;
		if(counter = 40000000) then
			out_clk <= '1';
			counter := 0;
		else
			out_clk <= '0';
		end if;
	end if;
end process;

end Behavioral;
