----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:06:41 04/26/2016 
-- Design Name: 
-- Module Name:    multiplier - Behavioral 
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

entity multiplier is
port(
	x : in std_logic_vector(3 downto 0);
	y : in std_logic_vector(3 downto 0);
	P : out std_logic_vector(7 downto 0)
);
end multiplier;

architecture Behavioral of multiplier is
component FullAdder is 
  port(
    A,B,Cin : in std_logic;
    Cout, S : out std_logic 
  );
end component;

component half_adder is
port(
  A,B : in std_logic;
  C,S : out std_logic
  );
end component;
	signal C_L1, C_L2, C_L3, S_L1, S_L2, S_L3 :  std_logic_vector(3 downto 0);
	signal and_vector : std_logic_vector(14 downto 0); 
begin
	P(0) <= x(0) and y(0);
	and_vector(0) <= x(1) and y(0);
	and_vector(1) <= x(0) and y(1);
	and_vector(2) <= x(2) and y(0);
	and_vector(3) <= x(1) and y(1);
	and_vector(4) <= x(3) and y(0);
	and_vector(5) <= x(2) and y(1);
	and_vector(6) <= x(3) and y(1);
	and_vector(7) <= x(0) and y(2);
	and_vector(8) <= x(1) and y(2);
	and_vector(9) <= x(2) and y(2); 
	and_vector(10) <= x(3) and y(2);
	and_vector(11) <= x(0) and y(3);
	and_vector(12) <= x(1) and y(3);
	and_vector(13) <= x(2) and y(3);
	and_vector(14) <= x(3) and y(3); 
	HA1 : half_adder port map(and_vector(0),and_vector(1) , C_L1(0), P(1));
	FA1 : FullAdder port map(and_vector(2), and_vector(3), C_L1(0), C_L1(1), S_L1(1));
	FA2 : FullAdder port map(and_vector(4), and_vector(5), C_L1(1), C_L1(2), S_L1(2));
	HA2 : half_adder port map ( and_vector(6), C_L1(2), C_L1(3), S_L1(3));
	
	HA3 : half_adder port map ( and_vector(7), S_L1(1), C_L2(0), P(2));
	FA3 : FullAdder port map(and_vector(8) , S_L1(2), C_L2(0), C_L2(1), S_L2(1));
	FA4 : FullAdder port map(and_vector(9), S_L1(3), C_L2(1), C_L2(2), S_L2(2));
	FA5 : FullAdder port map(and_vector(10), C_L1(3), C_L2(2), C_L2(3), S_L2(3));
	
	HA4 : half_adder port map ( and_vector(11), S_L2(1), C_L3(0), P(3));
	FA6 : FullAdder port map(and_vector(12), S_L2(2), C_L3(0), C_L3(1), P(4));
	FA7 : FullAdder port map(and_vector(13) , S_L2(3), C_L3(1), C_L3(2), P(5));	
	FA8 : FullAdder port map(and_vector(14), C_L2(3), C_L3(2), P(7), P(6));
end Behavioral;

