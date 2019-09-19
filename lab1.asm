.MODEL small
.DATA
; variable que contiene el texto que queremos mostrar
nombre DB 'Nombre: Emmanuel$' ;$ delimita el final de una cadena
carnet DB 'Carnet: 1109117$'
texto DB 'El caracter escogido: $'

.STACK
.CODE
Programa:       ; etiqueta de inicio de programa
; inicializar programa
MOV AX, @DATA   ; guardadndo dirección de inicio segmento de memoria
MOV DS, AX

; imprimir cadena
MOV DX, OFFSET nombre   ;asignando a DX la variable cadena
MOV AH, 09h             ;decimos que se imprimira una cadena
INT 21h                 ;ejecuta la interrupcion, imprime cadena

MOV DL, 10              ; imprime un enter
MOV AH, 02h
INT 21h

; imprimir cadena
MOV DX, OFFSET carnet   ;asignando a DX la variable cadena
MOV AH, 09h             ;decimos que se imprimira una cadena
INT 21h                 ;ejecuta la interrupcion, imprime cadena

MOV DL, 10
MOV AH, 02h
INT 21h

MOV DX, OFFSET texto
MOV AH, 09h
INT 21h

MOV DL, 26
MOV AH, 02h
INT 21h

; finalizar programa
MOV AH, 4Ch     ; finalizar proceso
INT 21h         ; ejecuta la interrupcino, finaliza programa
END Programa
