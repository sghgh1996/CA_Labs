library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity divider is
	port (
		a : in std_logic_vector (3 downto 0);
		b : in std_logic_vector (3 downto 0);
		clk : in std_logic;
		R : out std_logic_vector (3 downto 0);
		Q : out std_logic_vector (3 downto 0)	
	);
end divider;

architecture Behavioral of divider is

begin
	process(clk)
		variable sub_result : integer range -20 to 20;
		variable sub_input_1 : integer range 0 to 15;
		variable sub_input_2 : integer range 0 to 15;
		variable temp_R : std_logic_vector(3 downto 0) ;
		variable temp_Q : std_logic_vector(3 downto 0) ;
		variable count : integer range 0 to 5 := 4;
		
		begin
			if (count = 4 ) then 
				temp_R := "0000";
				temp_Q := a ;
			end if;
			R <= temp_R;
			Q <= temp_Q;
			if(rising_edge(clk) and count > 0) then
		      temp_R := temp_R(2 downto 0) & temp_Q(3);
				temp_Q := temp_Q(2 downto 0) & '0';
				sub_input_1 := to_integer(unsigned(temp_R));
				sub_input_2 := to_integer(unsigned(b));
				
				
				sub_result := sub_input_1 - sub_input_2;
				
				if(sub_result < 0) then
					count := count - 1;
				else 
					temp_Q(0) := '1';
					count := count - 1;
					temp_R := std_logic_vector(to_unsigned(sub_result, 4));
				end if;
					
			end if;
		end process;

end Behavioral;

