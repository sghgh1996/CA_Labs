----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:28 04/19/2016 
-- Design Name: 
-- Module Name:    rippleAdder - Behavioral 
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

entity rippleAdder is
	port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		Sum : out std_logic_vector(3 downto 0);
		Cout : out std_logic
	);
end rippleAdder;

architecture Behavioral of rippleAdder is
component MAS_FullAdder is 
  port(
    A,B,Cin : in std_logic;
    S, Cout : out std_logic 
  );
end component;

signal c : std_logic_vector(2 downto 0);
begin
	FA1 : MAS_FullAdder port map(A(0),B(0),Cin,Sum(0),c(0));
	FA2 : MAS_FullAdder port map(A(1),B(1),c(0),Sum(1),c(1));
	FA3 : MAS_FullAdder port map(A(2),B(2),c(1),Sum(2),c(2));
  	FA4 : MAS_FullAdder port map(A(3),B(3),c(2),Sum(3),Cout);
end Behavioral;

