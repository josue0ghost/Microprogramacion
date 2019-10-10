.model small
.data
    num1 DB ?
    num2 DB ?
    
    str1 DB 'Ingrese multiplicando/dividendo: $'
    str2 DB 'Ingrese multiplicador/divisor: $'
    multi DB 'Multiplicacion: $'
    divi DB 'Division: $'
    resi DB 'Residuo: $'
    
    diez DB 10d
    residuo DB ?
    cociente DB ?
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
    
    xor cx, cx
    mov cl, num2            ;contador  = multiplicador
    xor bx, bx
    
    ;MULTIPLICACION
    sumas:
    add bl, num1            ; sumas sucesivas
    loop sumas

    ;separo los dijitos
    xor ax, ax
    mov al, bl
    div diez
    mov residuo, al         ; guardo residuo
    mov cociente, ah        ; guardo cociente
    
    mov dl, 0dh
    mov ah, 2h
    int 21h
    mov dl, 0ah
    mov ah, 2h
    int 21h
    mov dx, offset multi    
    mov ah, 09h
    int 21h
    
    add residuo, 30h             ;impresion de resutado
    add cociente, 30h
    mov dl, residuo
    mov ah, 02h
    int 21h     
    mov dl, cociente
    mov ah, 02h
    int 21h     
    
    xor bx, bx
    mov bl, num1                ;iniciamos bl con num1
    xor cx, cx
    ; DIVISION
    restas:
    cmp bl, num2
    jl imp_division             ; si num2 es mayor, ya no se puede restar mas
    sub bl, num2                ; restas sucesivas
    add cl, 01h                 ; se suma uno al cociente
    jmp restas
    
    imp_division:
    mov cociente, cl
    mov residuo, bl
    
    add cociente, 30h           ; para obtener ascii del numero
    add residuo, 30h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    mov dl, offset divi         ; impresion de cociente
    mov ah, 09h
    int 21h
    mov dl, cociente
    mov ah, 02h
    int 21h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    mov dl, offset resi         ; impresion residuo
    mov ah, 09h
    int 21h
    mov dl, residuo
    mov ah, 02h
    int 21h
    
    fin:
    mov ah, 4ch
    int 21h    
end program