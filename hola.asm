.MODEL small
.DATA
; variable que contiene el texto que queremos mostrar
cadena DB 'Hola mundo$' ;$ delimita el final de una cadena

.STACK
.CODE
Programa:       ; etiqueta de inicio de programa
; inicializar programa
MOV AX, @DATA   ; guardadndo dirección de inicio segmento de memoria
MOV DS, AX

; imprimit cadena
MOV DX, OFFSET cadena   ;asignando a DX la variable cadena
MOV AH, 09h             ;decimos que se imprimira una cadena
INT 21h                 ;ejecuta la interrupcion, imprime cadena

; finalizar programa
MOV AH, 4Ch     ; finalizar proceso
INT 21h         ; ejecuta la interrupcino, finaliza programa
END Programa
