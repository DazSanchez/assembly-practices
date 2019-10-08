; Directiva = Palabra reservada
; . = Forma simplificada
.MODEL SMALL	; Modelo de memoria (cómo se segmenta la memoria)
				; SMALL = 1 Segmento de memoria por registro
.STACK 64		; Definición del segmento de pila
				; Tamaño dado en kbytes
.DATA			; Definición del segmento de datos
VAR1 DW	250		; DB = Define Byte = 256
				; DW = Define Word = 32767
VAR2 DW 125
VAR3 DW ?		; ? = Va a tener un valor post ejecución
				; ? || 0
.CODE			; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento
				; FAR = No hay llamadas a otros procedimientos
MOV AX,@data	; Obtiene la dirección del segmento de datos
MOV DS,AX		; Asigna la dirección al registro de datos
				; Sólo es necesario para el segmento de datos
MOV AX,VAR1
ADD AX,VAR2
MOV VAR3,AX		; VAR3 = 375

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP		; ENDP = Directiva para finalizar procedimiento
END PRIN		; END = Directiva para terminar programa
				; Sólo con el procedimiento principal