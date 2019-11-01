.model small
.data
    dece DB ?
    unid DB ?
    num DB ?
    cociente DB ?
    residuo DB ?
    
    str1 DB 'Ingrese un numero de dos digitos: $'
    diez DB 10d
    cero DB 00h
    dos DB 02d
    uno DB 01d
.stack
.code
program:
    mov ax, @data
    mov ds, ax
    xor ax, ax
    
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    mov ah, 01h             ;leer caracter - decenas -
    int 21h
    
    mov dece, al
    sub dece, 30h           ;obtener numero en vez de ascii
    
    mov ah, 01h             ;leer caracter - unidades -
    int 21h
    
    mov unid, al
    sub unid, 30h           ;obtener numero en vez de ascii
    
    ;multiplicar decenas por 10d
    mov al, dece
    mul diez                ;se guarda el resultado en al
    add al, unid            ;se suman las unidades para obtener el numero completo
    
    mov num, al             ;se guarda el numero ingresado en num
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    xor ax, ax
    
    mov al, num
    binario:
    div dos                 ;divide entre 2
    mov cociente, al
    mov residuo, ah
    add residuo, 30h
    
    mov bl, residuo
    push bx
    
    add cl, 01h
    xor ax, ax
    mov al, cociente
    
    cmp al, uno       ;compara el cociente con uno para terminar el ciclo
    jz imprimirUltimo
    cmp al, cero
    jz imprimirUltimo       ;compara el cociente con cero para terminar el ciclo    
    jmp binario             ;de lo contrario sigue dividiendo
    
    imprimirUltimo:
    mov bl, cociente
    add bl, 30h
    push bx
    add cl, 02h

    imprime:
    pop dx                  ;se saca de la pila para imprimir
    mov ah, 02h
    int 21h
    loop imprime
    
    fin_programa:
    mov ah, 4ch
    int 21h  
end program