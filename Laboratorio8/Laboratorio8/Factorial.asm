;macro
CalcFactorial macro num, return	
	xor eax, eax
	xor ecx, ecx

	cmp num, 0
	je @eq

	mov eax, 1
	mov cl, num

	fact:
	mul ecx
	loop fact
	jmp @ret

	@eq:
	mov return, 01h
	jmp @end

	@ret:
	mov return, eax
	@end:
endm

.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc 
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
	str1 db "Ingrese un numero menor o igual a 120. (Ej: 007, 059, 105): ",0
	str2 db "Factorial: ",0
	err db "El numero debe ser menor o igual a 120",0
	diez db 10
	cien db 100
.data?
	numero db 3 dup('0')
	resultado dd ?
.code
program:
main proc
	invoke StdOut, addr str1 
	invoke StdIn, addr numero, 3

	;centenas
	mov al, numero[0]
	sub al, 30h
	mul cien
	add bl, al			; en bl estará el número ingresado

	;decenas
	mov al, numero[1]
	sub al, 30h
	mul diez
	add bl, al

	;unidades
	mov al, numero[2]
	sub al, 30h
	add bl, al

	cmp bl, 121d
	jge error			;si es mayor, muestra el error

	CalcFactorial bl, resultado
	invoke StdOut, addr str2
	print str$(resultado),10,13
	jmp fin

	error:
	invoke StdOut, addr err

	fin:
	invoke ExitProcess,0
main endp
end program