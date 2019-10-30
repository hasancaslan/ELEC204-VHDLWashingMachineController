	----------------------------------------------------------------------------------
	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    17:03:37 12/09/2018 
	-- Design Name: 
	-- Module Name:    Modes - Behavioral 
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
	use IEEE.NUMERIC_STD.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;

	-- Uncomment the following library declaration if instantiating
	-- any Xilinx primitives in this code.
	--library UNISIM;
	--use UNISIM.VComponents.all;

	entity washing_machine is 
	Port(
		CK 	: in std_logic;
		start : in std_logic;
		reset : in std_logic;
		userMode : in std_logic_vector(4 downto 0);
		state : out std_logic_vector(9 downto 0);
		time_sn  : out std_logic_vector(4 downto 0));
	end washing_machine;

	architecture Behavioral of washing_machine is

	signal hz : std_logic;
	signal tState : std_logic_vector(1 downto 0);

	signal washC : integer;
	signal spinC : integer;
	signal rinseC : integer;
	
	signal modes : std_logic_vector(3 downto 0);

	begin
		
	with userMode select washC <= 
	5 when "10000",
	6 when "01000",
	7 when "00100",
	5 when "00010",
	3 when "00001",
	0 when others;

	with userMode select spinC <= 
	3 when "10000",
	4 when "01000",
	5 when "00100",
	3 when "00010",
	2 when "00001",
	0 when others;

	with userMode select rinseC <= 
	3 when "10000",
	2 when "01000",
	3 when "00100",
	2 when "00010",
	1 when "00001",
	0 when others;
	
	process(CK,start,reset)

	constant freq 	: integer := 400;

	variable curState : UNSIGNED(1 downto 0) := "11";

	variable tick 		: integer := 0;
	variable zero 		: std_logic := '0';
	variable counter 	: integer;
	variable hold : std_logic;

	begin

		if rising_edge(CK) then
			
			if curState = "11" and start = '1' and hold = '0' then
				counter := washC;
				curState := "00";
			elsif curState = "11" and start = '1' and hold = '0' then 
				curState := curState;
			end if;
			
			if reset = '1' then
				curState := "11";
				zero := '0';
				counter := 0;
				tick := 0;
			end if;
			
			if zero = '1' then
				curState := curState + "01";
				zero := '0';
				tick := 0;
			end if;
			
			if curState = "00" and zero = '0' then
				if tick < freq then
					tick := tick + 1;
				else
					tick := 0;
					counter := counter - 1;
				end if;
				
				if counter = 0 then
					zero := '1';
					counter := spinC;
				end if;
			end if;
		
			if curState = "01" and zero = '0' then
				if tick < freq then
					tick := tick + 1;
				else
					tick := 0;
					counter := counter - 1;
				end if;
				
				if counter = 0 then
					zero := '1';
					counter := rinseC;
				end if;
			end if;
			
			if curState = "10" and zero = '0' then
				if tick < freq then
					tick := tick + 1;
				else
					tick := 0;
					counter := counter - 1;
				end if;
				
				if counter = 0 then
					curState := "11";
				end if;
			end if;
		hold := start;
		end if;
		
		tState <= std_logic_vector(curState);
		time_sn <= std_logic_vector(to_unsigned(counter, time_sn'length));
		
	end process;

		with tState select modes <=
		"1000" when "11",
		"0100" when "00",
		"0010" when "01",
		"0001" when "10",
		"1111" when others;
		
		state <= modes & "0000" & tState;

	end Behavioral;