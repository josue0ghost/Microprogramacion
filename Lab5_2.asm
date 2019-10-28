.model small
.data
    intro DB ?
.stack
.code
program:
    mov ax, @data
    mov ds, ax    
    
    xor ax, ax
    
    mov cl, 15d
    impX:
        mov dl, 58h     ; imprimir X
        mov ah, 02h
        int 21h
        
        mov ah, 08h
        int 21h
        
        cmp al, 0dh
        jz finloop         
        
        add cl, 01h
    loop impX
   
    finloop:
    mov ah, 4ch
    int 21h
end program
    