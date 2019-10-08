; ADD op1,op2 = op2 + op1
; 1.- Forma {Registro,Registro}
; 	AX,BX,CX,DX
; 5 + 10 = VAR1 (REG,REG)
; MOV AL,5
; MOV AH,10
; ADD AH,AL
; MOV VAR1,AH
.MODEL SMALL	; Modelo de memoria SMALL = 1 Segmento de memoria por registro

.STACK 64		; Definición del segmento de pila

.DATA			; Definición del segmento de datos
VAR1 DB	?		; DB = Define Byte = 256

.CODE			; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento
				; FAR = No hay llamadas a otros procedimientos
MOV AX,@data	; Obtiene la dirección del segmento de datos
MOV DS,AX		; Asigna la dirección al registro de datos

MOV AL,5		; AL = 5
MOV AH,10		; AH = 10
ADD AH,AL		; AL + AH (REG,REG)
MOV VAR1,AH		; VAR1 = 10

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP		; ENDP = Directiva para finalizar procedimiento
END PRIN		; END = Directiva para terminar programa
				; Sólo con el procedimiento principal