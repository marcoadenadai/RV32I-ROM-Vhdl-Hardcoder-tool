LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ROM IS
    PORT (
		clock    : IN STD_LOGIC := '0';
		Reset 	: IN STD_LOGIC := '0';
      ADDR 		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- ENDERECO DA MEMORIA DE INSTRUCAO 
      S 			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE ROM_arch OF ROM IS

	signal fio_addr : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal fio_result : std_logic_vector(31 downto 0);
	
BEGIN	
	fio_addr <= ADDR;
	S <= fio_result;		
		
		PROCESS (fio_addr, clock) 
			variable	result : std_logic_vector(31 downto 0);
		BEGIN
		
		IF rising_edge(clock) THEN
			IF Reset = '1' THEN
				result := "00000000000000000000010110010011";
			ELSE
                
                -- C:\Users\Marco\Desktop\tools\input_assembly\teste1_derek.txt
                
				CASE fio_addr IS
                    WHEN "00000000000000000000000000000000" => result := "00000000000000001010000010110111";
					WHEN "00000000000000000000000000000001" => result := "00000000000000001010000100010111";
					WHEN "00000000000000000000000000000010" => result := "00001000110000000000000101101111";
					WHEN "00000000000000000000000000000011" => result := "00000000000000010000000111100111";
					WHEN "00000000000000000000000000000100" => result := "00001000001100011000001001100011";
					WHEN "00000000000000000000000000000101" => result := "00001000001100011001000001100011";
					WHEN "00000000000000000000000000000110" => result := "00000110001100011100111001100011";
					WHEN "00000000000000000000000000000111" => result := "00000110001100011101110001100011";
					WHEN "00000000000000000000000000001000" => result := "00000110001100011110101001100011";
					WHEN "00000000000000000000000000001001" => result := "00000110001100011111100001100011";
					WHEN "00000000000000000000000000001010" => result := "11111001110000010000001000000011";
					WHEN "00000000000000000000000000001011" => result := "11111001110000010001001010000011";
					WHEN "00000000000000000000000000001100" => result := "11111001110000010010001100000011";
					WHEN "00000000000000000000000000001101" => result := "11111001110000010100001110000011";
					WHEN "00000000000000000000000000001110" => result := "11111001110000010101010000000011";
					WHEN "00000000000000000000000000001111" => result := "11111000100100010000111000100011";
					WHEN "00000000000000000000000000010000" => result := "11111000101000010001111000100011";
					WHEN "00000000000000000000000000010001" => result := "11111000000100010010111000100011";
					WHEN "00000000000000000000000000010010" => result := "00000000101001010000000100010011";
					WHEN "00000000000000000000000000010011" => result := "00000000101001010010000110010011";
					WHEN "00000000000000000000000000010100" => result := "00000000101001010011001000010011";
					WHEN "00000000000000000000000000010101" => result := "00000000101000101100001000010011";
					WHEN "00000000000000000000000000010110" => result := "00000000101000101110001000010011";
					WHEN "00000000000000000000000000010111" => result := "00000000101000101111001000010011";
					WHEN "00000000000000000000000000011000" => result := "00000000101000100001001010010011";
					WHEN "00000000000000000000000000011001" => result := "00000000101000100101001100010011";
					WHEN "00000000000000000000000000011010" => result := "01000000101000100101001110010011";
					WHEN "00000000000000000000000000011011" => result := "00000000010001010000010000110011";
					WHEN "00000000000000000000000000011100" => result := "01000000010001010000010010110011";
					WHEN "00000000000000000000000000011101" => result := "00000000010001010001010100110011";
					WHEN "00000000000000000000000000011110" => result := "00000000010001010010000010110011";
					WHEN "00000000000000000000000000011111" => result := "00000000010001010011000100110011";
					WHEN "00000000000000000000000000100000" => result := "00000000010001010100000110110011";
					WHEN "00000000000000000000000000100001" => result := "00000000010001010101001000110011";
					WHEN "00000000000000000000000000100010" => result := "01000000010001010101001010110011";
					WHEN "00000000000000000000000000100011" => result := "00000000010001010110001100110011";
					WHEN "00000000000000000000000000100100" => result := "00000000010001010111001110110011";
					
					when others => NULL; -- tem que trocar isso aqui pra nao ter mais warning
				END CASE;
			
			END IF;
			
			fio_result <= result;
		END IF;
		
		END PROCESS;
	
		
END ARCHITECTURE;
            
            