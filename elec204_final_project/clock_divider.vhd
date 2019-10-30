----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:39 12/11/2018 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_divider is

 Port (
	MCLK : in STD_LOGIC;
	HUNDREDHZCLOCK : out STD_LOGIC);
		  
end clock_divider;

architecture Behavioral of clock_divider is

SIGNAL COUNTER : STD_LOGIC_VECTOR(18 DOWNTO 0) := "0000000000000000000";

begin

CLK_PROCESS: PROCESS(MCLK)

	BEGIN

		if (MCLK'EVENT AND MCLK = '1') then
			if COUNTER <= "0011110100001001000" then
					COUNTER <= COUNTER + 1;
			else 
					COUNTER <= "0000000000000000000";
			end if;
		end if;
	
	END PROCESS;

	HUNDREDHZCLOCK <= '1' WHEN COUNTER = "0001111010000100100" else '0';

end Behavioral;