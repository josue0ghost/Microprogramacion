.model small
.stack
.data
    num1 DB ?
    residuo DB ?
    
    str1 DB 'Ingrese un numero: $'
    espar DB 'El numero es par ^^$'
    nopar DB 'El numero es impar ^^$'
    dos DB 02h
.code
program:
    mov ax, @data
    mov ds, ax
    
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    ;leer numero
    xor ax, ax
    mov ah, 01h
    int 21h
    
    mov num1, al
    sub num1, 30h
    
    ;modular 2
    xor ax, ax
    mov al, num1
    div dos
    
    ;comparar
    cmp ah, 0h
    jnz impar
    
    par:
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
    
    mov dx, offset espar
    mov ah, 09h
    int 21h
    jmp fin
    
    impar:
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
    
    mov dx, offset nopar
    mov ah, 09h
    int 21h
    
    fin:
    
    ; fin
    mov ah, 4ch
    int 21h
end program