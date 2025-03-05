----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2025 04:47:28 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
   -- Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
   --        o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder_tb;

architecture test of sevenseg_decoder_tb is
    signal i_Hex : std_logic_vector (3 downto 0);
    signal o_seg_n : std_logic_vector (6 downto 0);
begin
    uut: entity work.sevenseg_decoder --uut is label for testing component
        port map (
             i_Hex => i_Hex,
             o_seg_n => o_seg_n
        );
    process
    begin
        for i in 0 to 15 loop --loop through all binary nums 0000-1111
            i_Hex <= std_logic_vector(to_unsigned(i,4));
            wait for 10 ns;
            case i is
                when 0 => assert o_seg_n = "1000000" report "Error on 0" severity error;
                when 1 => assert o_seg_n = "1111001" report "Error on 1" severity error;
                when 2 => assert o_seg_n = "0100100" report "Error on 2" severity error;
                when 3 => assert o_seg_n = "0110000" report "Error on 3" severity error;
                when 4 => assert o_seg_n = "0011001" report "Error on 4" severity error;
                when 5 => assert o_seg_n = "0010010" report "Error on 5" severity error;
                when 6 => assert o_seg_n = "0000010" report "Error on 6" severity error;
                when 7 => assert o_seg_n = "1111000" report "Error on 7" severity error;
                when 8 => assert o_seg_n = "0000000" report "Error on 8" severity error;
                when 9 => assert o_seg_n = "0011000" report "Error on 9" severity error;
                when 10 => assert o_seg_n = "0001000" report "Error on A" severity error;
                when 11 => assert o_seg_n = "0000011" report "Error on B" severity error;
                when 12 => assert o_seg_n = "0100111" report "Error on C" severity error;
                when 13 => assert o_seg_n = "0100001" report "Error on D" severity error;
                when 14 => assert o_seg_n = "0000110" report "Error on E" severity error;
                when 15 => assert o_seg_n = "0001110" report "Error on F" severity error;
                when others => null;
            end case;
        end loop;
        wait;
    end process;
end test;
