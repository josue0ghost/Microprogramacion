.model small
.stack
.data
    cadena1 DB 100 dup(?)               ;se llenan 100 espacios con "?"
    cadena2 DB 100 dup(?)
    
    str1 DB 'Ingrese una cadena: $'
    strEQ DB 'Las cadenas ingresadas son identicas.$'
    strNEQ DB 'Las cadenas ingresadas discrepan$'
    
    apuntador dw 0;
.code
program:
    mov ax, @data
    mov ds, ax
    
    ;primera cadena
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    xor SI, SI
    lea SI, cadena1                 ;se obtiene la direccion de la cadena
    
    call leer
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    ;segunda cadena
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    xor SI, SI
    lea SI, cadena2                 ;se obtiene la direccion de la cadena
    
    call leer
    
    ;comparacion
    call comparacion
    
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
        jmp asignar_cadena

        fin:
        mov [SI], 24h           ;$  fin de cadena

        ret
    leer endp
    
    comparacion proc near
        leer_cadena:
        cmp apuntador, 100
        jz identicas            ;termin? de analizar y no encontr? diferencias
        
        lea SI, cadena1         ;obtiene la posicion de cadena1
        add SI, apuntador           ;hace el corrimiento en la cadena
        mov cl, [SI]
        
        lea SI, cadena2         ;obtiene la posicion de cadena2
        add SI, apuntador           ;hace el corrimiento en cadena2

        cmp CL, [SI]            ;compara la posicion de cadena1 con posicion de cadena2
        jne discrepa
        add apuntador, 1                ;si son iguales aumenta el apuntador
        jmp leer_cadena
        
        identicas:
        mov dl, 0dh
        mov ah, 02h
        int 21h
        mov dl, 0ah
        int 21h

        mov dx, offset strEQ    
        mov ah, 09h             
        int 21h
        ret
        
        discrepa:
        mov dl, 0dh
        mov ah, 02h
        int 21h
        mov dl, 0ah
        int 21h

        mov dx, offset strNEQ   
        mov ah, 09h
        int 21h
        ret     
    comparacion ENDP
end program