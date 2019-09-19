# Microprogramacion
Pequeños proyectos de microprogramación en MASM

# Como ejecutar:
1. En el directorio de los archivos .asm deben estar los ejecutables TASM.EXE y TLINK.EXE
2. En el Simbolo del Sistema debemos posicionarnos en el directorio de nuestro archivo .asm y los ejecutables TASM y TLINK
3. Ejecutar la siguiente linea de comandos: 
            TASM.EXE {NAMEFILE}.ASM     -     Que genera el archivo del mismo nombre con extension .OBJ para luego ser enlazado
            TLINK.EXE {NAMEFILE}.OBJ    -     Que genera el ejecutable del mismo nombre con extension .EXE para poder ser ejecutado
            {NAMEFILE}.EXE              -     Que ejecuta el programa
            
Por cada modificacion del codigo del archivo .asm se deben realizar los tres pasos anteriores
