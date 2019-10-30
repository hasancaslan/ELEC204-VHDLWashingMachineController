----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:37 12/11/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
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


entity main is

Port (
	Clock : in std_logic;
	start : in std_logic;
	reset : in std_logic;
	leds 	: out std_logic_vector(9 downto 0);
	userMode : in std_logic_vector(4 downto 0);
	SevSegData : out std_logic_vector(6 downto 0);
	SevSegDriver : out std_logic_vector(7 downto 0));	
	
end main;

architecture Behavioral of main is

signal ledOut : std_logic_vector(9 downto 0);
signal time_sn : std_logic_vector(4 downto 0);
signal dataSevSeg : std_logic_vector(4 downto 0);
signal hz : std_logic;
signal tempLed : std_logic_vector (9 downto 0);

	Component washing_machine 
		Port (
			CK : in std_logic;
			start : in std_logic;
			reset : in std_logic;
			userMode : in std_logic_vector(4 downto 0);
			state : out std_logic_vector(9 downto 0);	
			time_sn  : out std_logic_vector(4 downto 0));
		end Component;
	
	Component clock_divider
	PORT(
		MCLK : IN std_logic;          
		HUNDREDHZCLOCK : OUT std_logic
		);
	END Component;
	
	COMPONENT SevSeg_Decoder
	PORT(
		INPUT : IN std_logic_vector(4 downto 0);          
		SEVSEG_BUS : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SevSeg_Driver
	PORT(
		time_sn : IN std_logic_vector(4 downto 0);
		leds : IN std_logic_vector(9 downto 0);
		userMode : IN STD_LOGIC_VECTOR(4 downto 0);
		CLK : IN std_logic; 
		start : IN STD_LOGIC;
		SEV_SEG_DATA : OUT std_logic_vector(4 downto 0);
		SEV_SEG_DRIVER : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

begin

	clk : clock_divider Port Map(Clock, hz);
	wsh : washing_machine Port Map(hz, start, reset, userMode, templed, time_sn);
	driver : SevSeg_Driver PORT MAP(time_sn, tempLed, userMode, hz, start, dataSevSeg, SevsegDriver);
	decoder : SevSeg_Decoder PORT MAP(dataSevSeg, SevSegData);
	
	leds <= tempLed;
	
end Behavioral;