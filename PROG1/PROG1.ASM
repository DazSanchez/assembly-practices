; Directiva = Palabra reservada
; . = Forma simplificada
.MODEL SMALL	; Modelo de memoria (c�mo se segmenta la memoria)
				; SMALL = 1 Segmento de memoria por registro
.STACK 64		; Definici�n del segmento de pila
				; Tama�o dado en kbytes
.DATA			; Definici�n del segmento de datos
VAR1 DW	250		; DB = Define Byte = 256
				; DW = Define Word = 32767
VAR2 DW 125
VAR3 DW ?		; ? = Va a tener un valor post ejecuci�n
				; ? || 0
.CODE			; Definici�n del segmento de c�digo
PRIN PROC FAR	; PROC = Define un procedimiento
				; FAR = No hay llamadas a otros procedimientos
MOV AX,@data	; Obtiene la direcci�n del segmento de datos
MOV DS,AX		; Asigna la direcci�n al registro de datos
				; S�lo es necesario para el segmento de datos
MOV AX,VAR1
ADD AX,VAR2
MOV VAR3,AX		; VAR3 = 375

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP		; ENDP = Directiva para finalizar procedimiento
END PRIN		; END = Directiva para terminar programa
				; S�lo con el procedimiento principal