.386
;model
.model flat, stdcall
option casemap:none
;includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc
;librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
	str1 db "Ingrese un numero: ",0
	resta db "Resta: ",0
	suma db "Suma: ",0
	menor db "El primero es menor al segundo",0
	mayor db "El primero es mayor al segundo",0
	igual db "Ambos numeros son iguales",0
.data?
	num1 dw ?
	num2 dw ?
.code
program:
	;hacer suma y resta
	invoke StdOut, addr str1
	invoke StdIn, addr num1, 10
	mov bx, num1
	sub bx, 30h

	invoke StdOut, addr str1
	invoke StdIn, addr num2, 10
	mov dx, num2
	sub dx, 30h
	add bx, dx

	invoke StdOut, addr suma
	print str$(bx),13,10
	
	xor bx, bx
	mov bx, num1
	sub bx, 30h
	mov dx, num2
	sub dx, 30h
	sub bx, dx

	invoke StdOut, addr resta
	print str$(bx),13,10
	;comparar si son iguales, el primero mayor al segundo o el primero menor al segundo
	mov bx, num1
	cmp bx, num2
	je esigual
	jg esmayor
	jl esmenor

	esigual:
	invoke StdOut, addr igual
	jmp fin

	esmenor:
	invoke StdOut, addr menor
	jmp fin

	esmayor:
	invoke StdOut, addr mayor
	jmp fin

	fin:
	invoke ExitProcess,0
end program