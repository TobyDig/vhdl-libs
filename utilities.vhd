library ieee;
use ieee.std_logic_1164.all;

package utils is

	function slv_onehot(index : integer; size : integer) return std_logic_vector;
	function slv_zeros(size : integer) return std_logic_vector;
	function log2ceil(n : integer) return integer;

end utils;


package body utils is

	function slv_onehot( index : integer; size : integer) return std_logic_vector is
		variable result : std_logic_vector(size-1 downto 0);
	begin
		for i in result'range loop
			if i = index then
				result(i) := '1';
			else
				result(i) := '0';
			end if;
		end loop;
		return result;
	end;
	
	function slv_zeros(size : integer) return std_logic_vector is
		variable result : std_logic_vector(size-1 downto 0);
	begin
		for i in result'range loop
			result(i) := '0';
		end loop;
		return result;
	end;

	function log2ceil(n : integer) return integer is
	begin
		for i in 0 to integer'high loop
			if 2 ** i >= n then
				return i;
			end if;
		end loop;
		return integer'high;
	end function log2ceil;

end utils;