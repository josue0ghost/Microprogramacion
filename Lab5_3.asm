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
    
    ;encontrar factores
    mov cl, num             ;el contador sera el numero, de esta forma se revisan
    factores:               ;todos los numeros (decrementando) para encontrar factores
    xor ax, ax
    mov al, num
    div cl
    
    cmp ah, cero            ;si es cero, es un factor y lo imprime
    jnz seguir               ;de lo contrario, sigue buscando
    
    jmp imprimirFac
    
    seguir:
    loop factores
    
    fin_programa:
    mov ah, 4ch
    int 21h
    
    imprimirFac:            ;en al se encuentra el cociente
    div diez                ;dividir entre 10d por los factores de dos digitos
    
    mov cociente, al        ;guardo los resultados
    add cociente, 30h
    mov residuo, ah         ;guardo los resultados
    add residuo, 30h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h  
    
    mov dl, cociente        ;imprimo cociente
    int 21h
    mov dl, residuo         ;imprimo residuo
    int 21h
    
    jmp seguir
end program