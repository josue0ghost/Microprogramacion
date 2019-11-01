.model small
.stack
.data
    str1 DB 'Ingrese una cadena: $'
    cadena DB ?
.code
program:
    mov ax, @data
    mov ds, ax  
    
    mov dx, offset str1     
    mov ah, 09h             
    int 21h 

    xor SI, SI
    lea SI, cadena              ;transfiere la direccion del SI
    
    call leer
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
        
    xor dx, dx          
    mov dx, offset cadena   
    mov ah, 09h
    int 21h

    ;fin de programa
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
end program