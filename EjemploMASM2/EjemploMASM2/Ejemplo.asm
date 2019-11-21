;ConvertNumToASCII.lib contenido
;ConvertirASCII macro valor
	;add valor, 30h
;endm
;
.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc

include \Macros\ConvertNumToASCII.lib


includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
.data
	num0 DB 1,0
	num1 DW 10,0
	num2 DD 3450,0

	formatofecha db " dd/MM/yyyy ",0
	formatohora db " hh:mm:ss ",0

	texto DB "Hola",0
.data?
	fechaBuf db 50 dup(?)
	horaBuf db 50 dup(?)
.code
program:
	invoke StdOut, addr texto

	mov al, num0
	;mov ax, num1
	;mov eax, num2

	invoke ClearScreen

	ConvertirASCII num0
	invoke StdOut, addr num0

	;print str$(EAX)
	
	invoke GetDateFormat, 0,0, \
	0, addr formatofecha, addr fechaBuf, 50
	;mov ebx, offset fechaBuf
	;mov byte ptr[ebx-1], " "	; reemplazamos todo lo nulo con espacios

	invoke GetTimeFormat, 0, 0, \
	0, addr formatohora, addr horaBuf, 50

	invoke StdOut, addr fechaBuf
	invoke StdOut, addr horaBuf

	;fin
	invoke ExitProcess,0
end program