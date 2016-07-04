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

entity ripple_subtract is
	port(
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		Sub : out std_logic_vector(3 downto 0);
		Cout : out std_logic
	);
end ripple_subtract;

architecture Behavioral of ripple_subtract is
component MAS_FullAdder is 
  port(
    A,B,Cin : in std_logic;
    S, Cout : out std_logic 
  );
end component;

signal c : std_logic_vector(2 downto 0);
signal bs : std_logic_vector(3 downto 0);

begin
	bs(0) <= not(B(0));
	bs(1) <= not(B(1));
	bs(2) <= not(B(2));
	bs(3) <= not(B(3));
	FA1 : MAS_FullAdder port map(A(0),bs(0),'1',Sub(0),c(0));
	FA2 : MAS_FullAdder port map(A(1),bs(1),C(0),Sub(1),c(1));
	FA3 : MAS_FullAdder port map(A(2),bs(2),C(1),Sub(2),c(2));
  	FA4 : MAS_FullAdder port map(A(3),bs(3),C(2),Sub(3),Cout);
end Behavioral;


