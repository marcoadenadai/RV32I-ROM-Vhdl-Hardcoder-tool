import os , glob

print("\n")

local_path = os.path.abspath(os.getcwd())

input_path = f"{local_path}\\input_assembly\\";
input_fnames = glob.glob(f"{local_path}\\input_assembly\\**\*.*", recursive=True)
output_path = f"{local_path}\\output_vhdl\\";


for filename in input_fnames:
    

    with open(filename, "r") as f:
        lines = f.readlines()
        tmp = os.path.basename(filename).split('.')[0]
        print(f'..>{filename}')
        
        with open(f"{output_path}{tmp}.vhdl", "w") as vhdl_file:
            print(f"GENERATED VHDL for INPUT: \t\"{filename}\" \n\t\tOUTPUT: \t\"{output_path}{tmp}.vhdl\"\n")
            rom_addr_mem = ""
            
            for pc, instruction in enumerate(lines):
                print(pc,',',instruction)
                pc_bin = '{0:032b}'.format(pc)
                aux = f"WHEN \"{pc_bin}\" => result := \"{instruction[:-1]}\";\n\t\t\t\t\t"
                rom_addr_mem = f"{rom_addr_mem}{aux}"
            
            vhdl_file.write(f"""LIBRARY ieee;
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
                
                -- {filename}
                
				CASE fio_addr IS
                    {rom_addr_mem}
					when others => NULL; -- tem que trocar isso aqui pra nao ter mais warning
				END CASE;
			
			END IF;
			
			fio_result <= result;
		END IF;
		
		END PROCESS;
	
		
END ARCHITECTURE;
            
            """)   
            
            