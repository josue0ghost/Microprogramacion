.model small
.stack
.data
    num1 DB ?
    num2 DB ?
    
    str1 DB 'Ingrese un numero: $'
.code
program:
    mov ax, @data
    mov ds, ax
    
    ;leer numeros
    xor ax, ax
    
    ; impresion str1
    mov dl, offset str1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h    
    mov num1, al
    sub num1, 30h
    
    ; /r/n
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    mov dl, offset str1
    mov ah, 09h
    int 21h
        
    mov num2, al
    sub num2, 30h
    
    mov cl, num2    
    multiplicacion:
    add bl, num1
    loop multiplicacion
    
    endprogram:
    mov ah,4ch
    int 21h
end program