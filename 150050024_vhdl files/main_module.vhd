----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:52:56 03/27/2018 
-- Design Name: 
-- Module Name:    main_module - Behavioral 
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

entity main_module is
    Port ( input : in  STD_LOGIC;
           control : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  Key : in STD_LOGIC_VECTOR (31 downto 0);
           cipher : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end main_module;

architecture Behavioral of main_module is

component interconnected_statemachines is
	 Port ( in1 : in  STD_LOGIC;
           ctr : in  STD_LOGIC;
			  clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           out00 : out  STD_LOGIC;
           out01 : out  STD_LOGIC;
           out02 : out  STD_LOGIC);
end component;

component bit_converter is
	Port ( in0 : in STD_LOGIC;
			  in1 : in STD_LOGIC;
			  in2 : in STD_LOGIC;
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
           B : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component read_multiple_data_bytes is
	Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           next_data : in  STD_LOGIC;
           data_read : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component encryptor is
	Port ( P : in  STD_LOGIC_VECTOR (31 downto 0);
           K : in  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal out0 : std_logic;
signal out1 : std_logic;
signal out2 : std_logic;
signal temp0 : std_logic_vector (7 downto 0) := (others => '0');
signal temp1 : std_logic_vector (31 downto 0) := (others => '0');
signal next_d : std_logic:= '0';
signal temp : std_logic:= '0';


 

begin
process(reset, clk)
begin
if(reset = '1') then
	next_d <= '0';
elsif( reset = '0' and rising_edge(clk)) then
	if(next_d = '0') then
		temp <= '1';
	elsif(next_d = '1') then
		temp <= '0';
	end if;
	
end if;
next_d <= temp;

	

end process;
pr01: interconnected_statemachines port map( input,control,clk,reset,out0,out1,out2);
pr02: bit_converter port map(out0,out1,out2,clk,reset,temp0);
pr03: read_multiple_data_bytes port map(clk,reset,temp0,temp,temp1);
pr04: encryptor port map(temp1, key, clk, reset, cipher);


end Behavioral;

