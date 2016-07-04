----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:13:25 05/03/2016 
-- Design Name: 
-- Module Name:    Basic_Computer - Behavioral 
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

entity Basic_Computer is
	port(
		clk : in std_logic;
		reset : in std_logic;
		pc : in std_logic_vector (3 downto 0);
		read_en : in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0) -- avaz shod be 8 biti
		);
end Basic_Computer;

architecture Behavioral of Basic_Computer is
	component ROM is 
		port (
			addr : in std_logic_vector (3 downto 0);
			reset : in std_logic;
			clk : in std_logic;
			read_en : in std_logic;
			opcode : out std_logic_vector (2 downto 0);
			data_addr : out std_logic_vector (3 downto 0)
		);
	end component;
	component RAM is
		port(
			 wen : in std_logic;
			 ren : in std_logic;
			 reset : in std_logic;
			 address : in std_logic_vector(3 downto 0);
			 clk : in std_logic;
			 datain : in std_logic_vector(7 downto 0);
			 dataout : out std_logic_vector(7 downto 0)
		  );
	end component;
	component rippleAdder is
	port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		Sum : out std_logic_vector(3 downto 0);
		Cout : out std_logic
	);
	end component;
	component ripple_subtract is
	port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		Sub : out std_logic_vector(3 downto 0);
		Cout : out std_logic
	);
	end component;
component multiplier is
port(
	x : in std_logic_vector(3 downto 0);
	y : in std_logic_vector(3 downto 0);
	P : out std_logic_vector(7 downto 0)
);
end component;
signal rom_data_addr : std_logic_vector(3 downto 0);
signal rom_opcode : std_logic_vector(2 downto 0);
signal ram_data_out : std_logic_vector(7 downto 0);
signal arg1,arg2 : std_logic_vector(3 downto 0);
signal ripple_sum , ripple_sub : std_logic_vector(3 downto 0);
signal ripple_Cout , ripple_Bout : std_logic;
signal multi_result : std_logic_vector(7 downto 0);
signal ram_ren , ram_wen : std_logic;
begin
	rom_memory : ROM port map (pc , reset , clk , read_en , rom_opcode , rom_data_addr );
	ram_memory : RAM port map (ram_wen  , ram_ren  , reset , rom_data_addr , clk , data_in , ram_data_out);
	multiplier_comp : multiplier port map (arg1, arg2, multi_result);
	arg2 <= ram_data_out(3 downto 0);
	arg1 <= ram_data_out(7 downto 4);
	adder : rippleAdder port map (arg1, arg2 , '0' , ripple_sum , ripple_Cout);
	suber : ripple_subtract port map (arg1, arg2 , '0' , ripple_sub , ripple_Bout);
	process(clk)
		begin
			if(rising_edge (clk)) then
				case rom_opcode is 
					when "000" => 
							ram_ren <= '1';
							ram_wen <= '0';
							data_out(3 downto 0) <= ripple_sum;
							data_out(4) <= ripple_Cout;
							data_out(7 downto 5) <= "000";
					when "001" => 
							ram_ren <= '1';
							ram_wen <= '0';
							data_out(3 downto 0) <= ripple_sub;
							data_out(4) <= ripple_Bout;							
							data_out(7 downto 5) <= "000";
					when "010" =>
							ram_ren <= '1';
							ram_wen <= '0';
							data_out <= multi_result;
					when "011" =>
							ram_ren <= '1';
							ram_wen <= '0';
							data_out(3 downto 0) <= arg1 xor arg2;
							data_out(7 downto 4) <= "0000";
					when "100" => --shift right
							ram_ren <= '1';
							ram_wen <= '0';
							for i in 0 to 6 loop
								data_out(i) <= ram_data_out(i+1);
							end loop;
							data_out(7) <= '0';
					when "101" => --shift left
							ram_ren <= '1';
							ram_wen <= '0';
							for i in 7 downto 1 loop
								data_out(i) <= ram_data_out(i-1);
							end loop;
							data_out(0) <= '0';
					when "110" => --load
							ram_ren <= '1';
							ram_wen <= '0';
							data_out <= ram_data_out;
					when "111" => --store
							ram_ren <= '0';
							ram_wen <= '1';
					when others =>
							data_out <= (OTHERS => 'Z');
				end case;
			end if;
		end process;
end Behavioral;

