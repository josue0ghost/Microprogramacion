.model small
.stack
.data
    str1 DB 'Ingrese una cadena: $'
    palindromo DB 'La cadena ingresada es un palindromo.$'
    palindromont DB 'La cadena ingresada no es un palindromo.$'

    contador dW 0;
    contador2 dW 0;
    cadena DB ?
.code
program:
    mov ax, @data
    mov ds, ax
    
    mov dx, offset str1
    mov ah, 09h
    int 21h

    xor SI, SI  
    lea SI, cadena              ;se obtiene la posicion de cadena
    
    call leer

    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    call VerPalindromo
    
    ;fin programa
    mov ah, 4ch
    int 21h
    
    leer proc near
        asignar_cadena:
        
        mov ah, 01h             ;lee el caracter
        int 21h

        cmp al, 0dh             ;compara si es la tecla enter
        jz fin

        sub al, 20h             ;representacion en mayusculas
        mov [SI], al            ;guarda en [SI] la tecla presionada
        inc SI
        inc contador
        jmp asignar_cadena

        fin:
        mov [SI], 24h           ;$  fin de cadena

        ret
    leer endp

    VerPalindromo proc near
        
        sub contador, 01h
        
        ComparaLetras:
        
        lea SI, cadena                  ;se obtiene la posicion de cadena
        add SI, contador                ;se hace el corrimiento de der a izq de cadena
        mov dh, [SI]                    ;se guarda en dh lo que hay en la posicion
                
        lea SI, cadena                  ;se obtiene la posicion de cadena
        add SI, contador2               ;se hace el corrimiento de izq a der de cadena
        mov dl, [SI]                    ;se guarda en dl lo que hay en la posicion
        
        cmp dl, dh                      ;se comparan los dos caracteres para ver si
        jnz nopalindromo                ;son iguales
        
        mov cx, contador
        sub cx, 01h
        cmp cx, contador2               ;por si es palabra con caracteres pares
        jz sipalindromo
        
        mov cx, contador
        cmp cx, contador2               ;por si es palabra con caracteres impares
        jz sipalindromo
        
        sub contador, 01h
        add contador2, 01h     
        jmp ComparaLetras
        
        sipalindromo:
        mov dl, 0dh
        mov ah, 02h
        int 21h
        mov dl, 0ah
        int 21h

        mov dx, offset palindromo       ;imprime que es un palindromo
        mov ah, 09h             
        int 21h
        ret
        
        nopalindromo:
        mov dl, 0dh
        mov ah, 02h
        int 21h
        mov dl, 0ah
        int 21h

    mov dx, offset palindromont         ;imprime que no es un palindromo
        mov ah, 09h             
        int 21h
        ret
    VerPalindromo endp
    
end program