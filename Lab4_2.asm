.model small
.stack
.data
    num1 DB ?
    num2 DB ?
    
    str1 DB 'Ingrese un numero: $'
    
    igual DB 'Los numeros son iguales :D$'
    mayor DB 'El primer numero ingresado es mayor al segundo :)$'
    menor DB 'El primer numero ingresado es menor al segundo :)$'
    
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
    
    ;leer segundo numero
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    ;leer numero
    xor ax, ax
    mov ah, 01h
    int 21h
    
    mov num2, al
    sub num2, 30h
    
    mov bl, num1
    
    cmp bl, num2
    
    je iguales
    jge mayor1
    jle menor1
    
    iguales:
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset igual
    mov ah, 09h
    int 21h
    jmp fin
    
    mayor1:
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset mayor
    mov ah, 09h
    int 21h
    jmp fin
    
    menor1:
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset menor
    mov ah, 09h
    int 21h
    jmp fin
    
    fin:
    mov ah, 4ch
    int 21h
end program