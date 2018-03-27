----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:11:31 03/20/2018 
-- Design Name: 
-- Module Name:    state_machine - Behavioral 
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

entity state_machine is
    Port ( input : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           out0 : out  STD_LOGIC;
           out1 : out  STD_LOGIC);
end state_machine;


architecture Behavioral of state_machine is

signal curr_s : STD_LOGIC_VECTOR ( 1 downto 0) := (others =>'0');


begin
process(clk,reset)
begin
if(reset = '1') then	
	out1 <= '0';
	out0 <= '0';
elsif(reset = '0' and rising_edge(clk)) then
	if(curr_s = "00" and input = '1') then
		curr_s <= "01";
	elsif(curr_s = "00" and input = '0') then
		curr_s <= "11";
	elsif(curr_s = "01" and input = '1') then
		curr_s <= "10";
	elsif(curr_s = "01" and input = '0') then
		curr_s <= "00";
	elsif(curr_s = "10" and input = '1') then
		curr_s <= "11";
	elsif(curr_s = "10" and input = '0') then
		curr_s <= "01";
	elsif(curr_s = "11" and input = '1') then
		curr_s <=  "00";
	elsif(curr_s = "11" and input = '0') then
		curr_s <= "10";
	end if;
	
	out0 <= curr_s(0);
	out1 <= curr_s(1);
	
end if;
end process;





end Behavioral;

