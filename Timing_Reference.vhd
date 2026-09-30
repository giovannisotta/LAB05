library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity Timing_Reference is
	generic (clk_desejado: real := 1.0);
	
	port ( clk: in std_logic; -- Pin connected to P11 (N14)
			clk_out: out std_logic);-- Can check it using PIN A8 - LEDR0

	end Timing_Reference;
  
architecture freq_div of Timing_Reference is
 
constant clk_placa: integer :=50000000;
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk)
	begin
	if(clk'event and clk='1') then
		count <=count+1;
		if (count = integer(real(clk_placa)/(2.0*clk_desejado))) then
			tmp <= NOT tmp;
			count <= 1;
		end if;
	end if;

	
	end process;

clk_out <= tmp;
end freq_div;