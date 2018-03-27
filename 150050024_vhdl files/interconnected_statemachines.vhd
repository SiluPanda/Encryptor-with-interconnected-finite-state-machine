----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:20 03/20/2018 
-- Design Name: 
-- Module Name:    interconnected_statemachines - Behavioral 
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

entity interconnected_statemachines is
    Port ( in1 : in  STD_LOGIC;
           ctr : in  STD_LOGIC;
           out00 : out  STD_LOGIC;
           out01 : out  STD_LOGIC;
           out02 : out  STD_LOGIC;
			  clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end interconnected_statemachines;

architecture Behavioral of interconnected_statemachines is

component state_machine is
	Port ( input : in  STD_LOGIC;
          
          reset : in  STD_LOGIC;
			 clk : in  STD_LOGIC;
			 out0 : out STD_LOGIC;
			 out1 : out STD_LOGIC);
			  
end component;

signal out10 : STD_LOGIC;
signal out11 : STD_LOGIC;
signal out12 : STD_LOGIC;
signal input1 : STD_LOGIC := '0';

begin

process( clk, reset) 
begin
if(reset = '1') then
	input1 <= '0';
elsif( reset = '0' and rising_edge(clk)) then
	if(ctr = '1') then
		input1 <= out12;
	elsif(ctr = '0') then
		input1 <= in1;
	end if;
end if;
end process;


--input1 <= out12 when rising_edge(clk) and (ctr = '1') else in1;

sm01: state_machine port map (input1,reset,clk,out00,out10);
sm02: state_machine port map (out10,reset,clk,out01,out11);
sm03: state_machine port map (out11,reset,clk,out02,out12);








	




end Behavioral;

