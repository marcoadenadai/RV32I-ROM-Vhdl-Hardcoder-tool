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
                
                -- C:\Users\Marco\Desktop\tools\input_assembly\nosso_teste01.txt
                
				CASE fio_addr IS
                    WHEN "00000000000000000000000000000000" => result := "00000000101000000000000100010011";
					WHEN "00000000000000000000000000000001" => result := "00000000000000000000000010110011";
					WHEN "00000000000000000000000000000010" => result := "00000000001000001000000110110011";
					
					when others => NULL; -- tem que trocar isso aqui pra nao ter mais warning
				END CASE;
			
			END IF;
			
			fio_result <= result;
		END IF;
		
		END PROCESS;
	
		
END ARCHITECTURE;
            
            