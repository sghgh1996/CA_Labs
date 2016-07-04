----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:13:38 05/03/2016 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
	port (
		addr : in std_logic_vector (3 downto 0);
		reset : in std_logic;
		clk : in std_logic;
		read_en : in std_logic;
		opcode : out std_logic_vector (2 downto 0);
		data_addr : out std_logic_vector (3 downto 0)
	);
end ROM;

architecture Behavioral of ROM is
	type ROM_type is array(15 downto 0) of std_logic_vector(7 downto 0);
	signal rom : ROM_type;
begin
	process(clk,reset)
    begin
      if(reset = '1') then
          for i in 0 to 15 loop
             rom(i)(3 downto 0) <= std_logic_vector(to_unsigned(i, 4));
				 rom(i)(4) <= '0';
				 rom(i)(7 downto 5) <= std_logic_vector(to_unsigned(i, 3));
          end loop;
				 rom(6) <= "11000111";
      elsif(rising_edge(clk)) then
          if(read_en = '1') then
            data_addr <= rom(conv_integer(addr))(3 downto 0);   
				opcode <= rom(conv_integer(addr))(7 downto 5);
			 end if;
      end if;
    end process;
 
end Behavioral;

