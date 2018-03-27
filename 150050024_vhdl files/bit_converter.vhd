----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:03 03/27/2018 
-- Design Name: 
-- Module Name:    bit_converter - Behavioral 
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

entity bit_converter is
    Port ( in0 : in STD_LOGIC;
			  in1 : in STD_LOGIC;
			  in2 : in STD_LOGIC;
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
           B : out  STD_LOGIC_VECTOR (7 downto 0));
end bit_converter;

architecture Behavioral of bit_converter is
signal A : std_logic_vector (2 downto 0) := (others => '0');

begin
A(0) <= in0;
A(1) <= in1;
A(2) <= in2;

process(clk,reset,A) 
begin
if(reset = '1') then
	B <= "00000000";
elsif (reset = '0' and rising_edge(clk)) then
	if( A = "000") then
		B <= "00000001";
	elsif (A = "001") then
		B <= "00000010";
	elsif (A = "010") then
		B <= "00000100";
	elsif (A = "011") then
		B <= "00001000";
	elsif (A = "100") then
		B <= "00010000";
	elsif (A = "101") then
		B <= "00100000";
	elsif(A = "110") then
		B <= "01000000";
	elsif(A = "111") then
		B <= "10000000";
	end if;
end if;
end process;


end Behavioral;

