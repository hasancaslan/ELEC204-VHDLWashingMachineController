----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:41 12/11/2018 
-- Design Name: 
-- Module Name:    SevSeg_Driver - Behavioral 
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
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SevSeg_Driver IS

 PORT ( 
	time_sn : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	leds : IN STD_LOGIC_VECTOR(9 downto 0);
	userMode : IN STD_LOGIC_VECTOR(4 downto 0);
	CLK : IN STD_LOGIC;
	start : IN STD_LOGIC;
	SEV_SEG_DATA : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	SEV_SEG_DRIVER : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
 
END SevSeg_Driver;

ARCHITECTURE BEHAVIORAL OF SevSeg_Driver IS

-- Characters

signal A : std_logic_vector(4 downto 0);
signal B : std_logic_vector(4 downto 0);
signal C : std_logic_vector(4 downto 0);
signal D : std_logic_vector(4 downto 0);
signal E : std_logic_vector(4 downto 0);
signal L : std_logic_vector(4 downto 0);
signal W1 : std_logic_vector(4 downto 0);
signal W2 : std_logic_vector(4 downto 0);
signal N : std_logic_vector(4 downto 0); 
signal P : std_logic_vector(4 downto 0);
signal R : std_logic_vector(4 downto 0);
signal S : std_logic_vector(4 downto 0);
signal T : std_logic_vector(4 downto 0);
signal H : std_logic_vector(4 downto 0);
signal K : std_logic_vector(4 downto 0);
signal O : std_logic_vector(4 downto 0);
signal Blank : std_logic_vector(4 downto 0);

SIGNAL COUNTER : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";

BEGIN
--INCREMENT COUNTER

A <= "01010"; --A 
B <= "01011"; --B 
C <= "01100"; --C 
D <= "01101"; --D 
E <= "01110"; --E
L <= "01111"; --L
W1 <= "10000"; -- W Part 1
W2 <= "10001"; -- W Part 2
N <= "10010"; -- N 
P <= "10011"; -- P
R <= "10100"; -- R
S <= "10101"; -- S   
T <= "10110"; -- T
H <= "10111"; -- H
K <= "11000"; -- K
Blank <= "11010"; -- Blank

PROCESS_CLK : PROCESS(CLK)

BEGIN

	if rising_edge(CLK) then
		if COUNTER = "111" then
			COUNTER <= "000";
		ELSE
			COUNTER <= COUNTER + 1;
		end if;
	end if;

END PROCESS PROCESS_CLK;

SEV_SEG_DATA <=

-- Washing Modes

S		  WHEN COUNTER = "000" and userMode = "10000" and start = '0' ELSE
H	     WHEN COUNTER = "001" and userMode = "10000" and start = '0' ELSE
E		  WHEN COUNTER = "010" and userMode = "10000" and start = '0' ELSE
E		  WHEN COUNTER = "011" and userMode = "10000" and start = '0' ELSE
T  	  WHEN COUNTER = "100" and userMode = "10000" and start = '0' ELSE
Blank   WHEN COUNTER = "101" and userMode = "10000" and start = '0' ELSE
"00001" WHEN COUNTER = "110" and userMode = "10000" and start = '0' ELSE
"00001" WHEN COUNTER = "111" and userMode = "10000" and start = '0' ELSE

W1		  WHEN COUNTER = "000" and userMode = "01000" and start = '0' ELSE
W2	     WHEN COUNTER = "001" and userMode = "01000" and start = '0' ELSE
H		  WHEN COUNTER = "010" and userMode = "01000" and start = '0' ELSE
"00001" WHEN COUNTER = "011" and userMode = "01000" and start = '0' ELSE
T  	  WHEN COUNTER = "100" and userMode = "01000" and start = '0' ELSE
E 		  WHEN COUNTER = "101" and userMode = "01000" and start = '0' ELSE
"00001" WHEN COUNTER = "110" and userMode = "01000" and start = '0' ELSE
"00010" WHEN COUNTER = "111" and userMode = "01000" and start = '0' ELSE

C		  WHEN COUNTER = "000" and userMode = "00100" and start = '0' ELSE
"00000" WHEN COUNTER = "001" and userMode = "00100" and start = '0' ELSE
T		  WHEN COUNTER = "010" and userMode = "00100" and start = '0' ELSE
T		  WHEN COUNTER = "011" and userMode = "00100" and start = '0' ELSE
"00000" WHEN COUNTER = "100" and userMode = "00100" and start = '0' ELSE
N	     WHEN COUNTER = "101" and userMode = "00100" and start = '0' ELSE
"00001" WHEN COUNTER = "110" and userMode = "00100" and start = '0' ELSE
"00101" WHEN COUNTER = "111" and userMode = "00100" and start = '0' ELSE

C		  WHEN COUNTER = "000" and userMode = "00010" and start = '0' ELSE
"00000" WHEN COUNTER = "001" and userMode = "00010" and start = '0' ELSE
L		  WHEN COUNTER = "010" and userMode = "00010" and start = '0' ELSE
"00000" WHEN COUNTER = "011" and userMode = "00010" and start = '0' ELSE
R  	  WHEN COUNTER = "100" and userMode = "00010" and start = '0' ELSE
Blank   WHEN COUNTER = "101" and userMode = "00010" and start = '0' ELSE
"00001" WHEN COUNTER = "110" and userMode = "00010" and start = '0' ELSE
"00000" WHEN COUNTER = "111" and userMode = "00010" and start = '0' ELSE

R		  WHEN COUNTER = "000" and userMode = "00001" and start = '0' ELSE
A	     WHEN COUNTER = "001" and userMode = "00001" and start = '0' ELSE
P		  WHEN COUNTER = "010" and userMode = "00001" and start = '0' ELSE
"00001" WHEN COUNTER = "011" and userMode = "00001" and start = '0' ELSE
D  	  WHEN COUNTER = "100" and userMode = "00001" and start = '0' ELSE
Blank   WHEN COUNTER = "101" and userMode = "00001" and start = '0' ELSE
Blank   WHEN COUNTER = "110" and userMode = "00001" and start = '0' ELSE
"00110" WHEN COUNTER = "111" and userMode = "00001" and start = '0' ELSE

-- States of America -_- 

D       WHEN COUNTER = "000" and leds = "1000000011" and start = '1' ELSE
"00000" WHEN COUNTER = "001" and leds = "1000000011" and start = '1' ELSE
N		  WHEN COUNTER = "010" and leds = "1000000011" and start = '1' ELSE
E		  WHEN COUNTER = "011" and leds = "1000000011" and start = '1' ELSE
D   	  WHEN COUNTER = "100" and leds = "1000000011" and start = '1' ELSE
"00000" WHEN COUNTER = "101" and leds = "1000000011" and start = '1' ELSE
N   	  WHEN COUNTER = "110" and leds = "1000000011" and start = '1' ELSE
E   	  WHEN COUNTER = "111" and leds = "1000000011" and start = '1' ELSE

W1      WHEN COUNTER = "000" and leds = "0100000000" and start = '1' ELSE
W2 	  WHEN COUNTER = "001" and leds = "0100000000" and start = '1' ELSE
A		  WHEN COUNTER = "010" and leds = "0100000000" and start = '1' ELSE
S		  WHEN COUNTER = "011" and leds = "0100000000" and start = '1' ELSE
H  	  WHEN COUNTER = "100" and leds = "0100000000" and start = '1' ELSE
Blank   WHEN COUNTER = "101" and leds = "0100000000" and start = '1' ELSE
Blank	  WHEN COUNTER = "110" and leds = "0100000000" and start = '1' ELSE
time_sn WHEN COUNTER = "111" and leds = "0100000000" and start = '1' ELSE

S       WHEN COUNTER = "000" and leds = "0010000001" and start = '1' ELSE
P   	  WHEN COUNTER = "001" and leds = "0010000001" and start = '1' ELSE
"00001" WHEN COUNTER = "010" and leds = "0010000001" and start = '1' ELSE
N		  WHEN COUNTER = "011" and leds = "0010000001" and start = '1' ELSE
Blank	  WHEN COUNTER = "100" and leds = "0010000001" and start = '1' ELSE
Blank	  WHEN COUNTER = "101" and leds = "0010000001" and start = '1' ELSE
Blank	  WHEN COUNTER = "110" and leds = "0010000001" and start = '1' ELSE
time_sn WHEN COUNTER = "111" and leds = "0010000001" and start = '1' ELSE

R       WHEN COUNTER = "000" and leds = "0001000010" and start = '1' ELSE
"00001" WHEN COUNTER = "001" and leds = "0001000010" and start = '1' ELSE
N		  WHEN COUNTER = "010" and leds = "0001000010" and start = '1' ELSE
S		  WHEN COUNTER = "011" and leds = "0001000010" and start = '1' ELSE
E		  WHEN COUNTER = "100" and leds = "0001000010" and start = '1' ELSE
Blank	  WHEN COUNTER = "101" and leds = "0001000010" and start = '1' ELSE
Blank	  WHEN COUNTER = "110" and leds = "0001000010" and start = '1' ELSE
time_sn WHEN COUNTER = "111" and leds = "0001000010" and start = '1' ELSE
Blank;

SEV_SEG_DRIVER <=
"01111111" WHEN COUNTER = "000" ELSE
"10111111" WHEN COUNTER = "001" ELSE
"11011111" WHEN COUNTER = "010" ELSE
"11101111" WHEN COUNTER = "011" ELSE
"11110111" WHEN COUNTER = "100" ELSE
"11111011" WHEN COUNTER = "101" ELSE
"11111101" WHEN COUNTER = "110" ELSE
"11111110" WHEN COUNTER = "111" ELSE
"11111111";
END BEHAVIORAL;