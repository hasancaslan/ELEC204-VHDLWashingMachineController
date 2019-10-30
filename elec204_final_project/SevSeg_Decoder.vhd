----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:58 10/18/2018 
-- Design Name: 
-- Module Name:    SevSegDecoder - Behavioral 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SevSeg_Decoder IS
 PORT ( INPUT : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		  SEVSEG_BUS : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END SevSeg_Decoder;

ARCHITECTURE BEHAVIORAL OF SevSeg_Decoder IS

BEGIN

WITH INPUT SELECT SEVSEG_BUS <=
"0000001" WHEN "00000", --0
"1001111" WHEN "00001", --1 or I
"0010010" WHEN "00010", --2 
"0000110" WHEN "00011", --3 
"1001100" WHEN "00100", --4 
"0100100" WHEN "00101", --5 
"0100000" WHEN "00110", --6 
"0001111" WHEN "00111", --7 
"0000000" WHEN "01000", --8 
"0000100" WHEN "01001", --9 
"0001000" WHEN "01010", --A 
"1100000" WHEN "01011", --B 
"0110001" WHEN "01100", --C 
"1000010" WHEN "01101", --D 
"0110000" WHEN "01110", --E
"1110001" WHEN "01111", --L

"1100001" WHEN "10000", -- W Part 1
"1000011" WHEN "10001", -- W Part 2
"0001001" WHEN "10010", -- N 
"0011000" WHEN "10011", -- P
"0111001" WHEN "10100", -- R
"0100100" WHEN "10101", -- S   
"1110000" WHEN "10110", -- T
"1001000" WHEN "10111", -- H
"0000000" WHEN "11000", -- K
"0011000" WHEN "11001", -- P
"1111111" WHEN "11010", -- Blank
"0100100" WHEN "11011", -- 
"1110110" WHEN "11100", -- 
"0100001" WHEN "11101", --
"0110000" WHEN "11110", --
"1110001" WHEN "11111", --
"1111111" WHEN OTHERS;
END BEHAVIORAL;

