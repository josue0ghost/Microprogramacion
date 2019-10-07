.model small
.data
    num1 DB ?
    num2 DB ?
    
    str1 DB 'Ingrese multiplicando/dividendo: $'
    str2 DB 'Ingrese multiplicador/divisor: $'
    multi DB 'Multiplicacion: $'
    divi DB 'Division: $'
    resi DB 'Residuo: $'
.stack
.code
program:
    mov ax, @data
    mov ds, ax
    ; guarda primer numero
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    xor ax, ax
    mov ah, 01h
    int 21h
    
    mov num1, al
    sub num1, 30h
    
    ; guarda segundo numero
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset str2
    mov ah, 09h
    int 21h
    
    xor ax, ax
    mov ah, 01h
    int 21h
    
    mov num2, al
    sub num2, 30h
    
    mov cl, num2            ;contador  = multiplicador
    xor bx, bx
    
    mult:
    add bl, num1            ; sumas sucesivas
    loop mult
    
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset multi    
    mov ah, 09h
    int 21h
    
    add bl, 30h             ;impresion de resutado
    mov dl, bl
    mov ah, 2h
    int 21h     
    
    
    xor bx, bx
    mov bl, num1            ;iniciamos bl con num1
    
    division:
    cmp bl, 0h
    jle imprime             ;si es menor que 0 imprime cociente y residuo
    
    sub bl, num2            ;restas sucesivas
    inc bh                  ; en bl se guarda el residuo y en bh el cociente
    
    jmp division
    
    imprime:
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset divi    
    mov ah, 09h
    int 21h
    
    add bh, 30h             ;impresion de resutado
    mov dl, bh
    mov ah, 2h
    int 21h
    
    residuo:
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset resi 
    mov ah, 09h
    int 21h
    
    add bl, 30h             ;impresion de resutado
    mov dl, bl
    mov ah, 2h
    int 21h
    
    fin:
    mov ah, 4ch
    int 21h    
end program