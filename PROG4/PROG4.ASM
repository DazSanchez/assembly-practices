; ADD op1,op2 => op2 + op1
.MODEL SMALL	; Modelo de memoria SMALL = 1 Segmento de memoria por registro

.STACK 64		; Definición del segmento de pila

.DATA			; Definición del segmento de datos
VAR DB ?		; VAR | 256
VAR2 DB ?
VAR3 DB ?

.CODE			; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento
MOV AX,@data	; Obtiene la dirección del segmento de datos
MOV DS,AX		; Asigna la dirección al registro de datos

; 73 + 100 = REG (REG,MEM)
MOV AL,73
MOV VAR,100
ADD AL,VAR

; DX + 18 = VAR2 (REG,MEM)
MOV DX,10
ADD DX,18
MOV VAR2,DX

; VAR3 + VAR4 = VAR5 (REG,MEM)
MOV VAR,10
MOV VAR2,20
ADD VAR2,VAR
MOV VAR3,VAR2

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP		; ENDP = Directiva para finalizar procedimiento
END PRIN		; END = Directiva para terminar programa
				; Sólo con el procedimiento principal