.model small
.data
    num1 DB ?
    num2 DB ?
    
    str1 DB 'Ingrese un numero luego presione ENTER: $'
    suma DB 'Suma: $'
    rest DB 'Resta: $'
    mult DB 'Multiplicacion: $'
    divi DB 'Division: $'
    resi DB 'Residuo: $'
.stack
.code
program:
    mov ax, @data
    mov ds, ax
    
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    mov ah, 01h ; lee entrada del teclado y lo pone en AL
    int 21h
    sub al, 30h ; segun la tabla ascii, ingresando un numero se le resta 30h para tener ese numero especifico
    mov num1, al
    
    mov dl, 0dh ; fin de linea
    mov ah, 02h
    int 21h
    mov dl, 0ah ; salto de linea
    mov ah, 02h
    int 21h
    
    mov dx, offset str1
    mov ah, 09h
    int 21h
    
    mov ah, 01h ; lee entrada del teclado y lo pone en AL
    int 21h
    sub al, 30h ; segun la tabla ascii, ingresando un numero se le resta 30h para tener ese numero especifico
    mov num2, al
    
        mov dl, 0dh ; fin de linea
    mov ah, 02h
    int 21h
    mov dl, 0ah ; salto de linea
    mov ah, 02h
    int 21h
    
    ;suma
    mov dx, offset suma
    mov ah, 09h
    int 21h
    
    mov al, num1
    add al, num2
    add al, 30h     ; se suman 30 por la tabla ascii, asi imprime el caracter del numero
    
    mov dl, al
    mov ah, 02h
    int 21h
    
    mov dl, 0dh     ;fin de linea \r
    mov ah, 02h
    int 21h
    mov dl, 0ah     ;salto de linea \n
    mov ah, 02h
    int 21h
    
    ; resta
    mov dx, offset rest
    mov ah, 09h
    int 21h
    
    mov al, num1
    sub al, num2
    add al, 30h
    
    mov dl, al
    mov ah, 02h
    int 21h
    
    mov dl, 0dh     ;fin de linea
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
    
    ; multiplicacion
    mov dx, offset mult
    mov ah, 09h
    int 21h
    
    mov al, num1
    mul num2        ; toma el registro al para hacer la multiplicacion con el dato que enviemos
    add al, 30h
    
    mov dl, al
    mov ah, 02h
    int 21h
    
    mov dl, 0dh     ;fin de linea
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
    
    ; division
    mov dx, offset divi
    mov ah, 09h
    int 21h
    
    xor ax, ax      ; se borra el registro ax porque en el queremos operar la division
    mov al, num1
    div num2        ; toma el registro ax para hacer la division con el dato que enviemos
    add al, 30h     ; sumo 30 a al (donde esta el cociente) para obtener el valor ascii necesitado
    mov bl, ah      ; guardo el residuo (que esta en ah) en otro registro para no perderlo
    
    mov dl, al
    mov ah, 02h
    int 21h
    
    mov dl, 0dh     ;fin de linea
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
    ; residuo de la division
    mov dx, offset resi
    mov ah, 09h
    int 21h
    
    mov dl, bl  ; en bl guardamos el residuo anteriormente
    add dl, 30h ; se suma 30 para obtener el ascii necesitado
    mov ah, 02h
    int 21h
    
    ;no hay necesidad de un CrLf porque termine el programa
    
    ;fin de programa
    mov ah, 4ch
    int 21h
    
end program