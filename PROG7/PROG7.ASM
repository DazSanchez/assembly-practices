; MUL op1 => op1 * AL = AX
.MODEL SMALL	; Modelo de memoria SMALL = 1 Segmento de memoria por registro

.STACK 64			; Definición del segmento de pila

.DATA					; Definición del segmento de datos
VAR DW ?
VAR2 DB ?
VAR3 DB ?

.CODE					; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento
MOV AX,@data		; Obtiene la dirección del segmento de datos
MOV DS,AX			; Asigna la dirección al registro de datos

; 5 * 2 = VAR (REG)
MOV AL,5
MOV AH,2
MUL AH
MOV VAR,AX

; 100 * 100 = BX (REG)
MOV AL,100
MOV AH,100
MUL AH
MOV BX,AX

; VAR * 3 = REG (REG)
MOV AL,3
MOV VAR2,10
MOV AH,VAR2
MUL AH
MOV BX,AX

; 20 * 7 = AX (REG)
MOV AL,7
MOV AH,20
MUL AH

; VAR * VAR = VAR (REG)
MOV VAR2,10
MOV AH,VAR2
MOV VAR3,4
MOV AL,VAR3
MUL AH
MOV VAR,AX

; DL * CH = DX (MEM)
MOV DL,10
MOV CH,5
MOV AL,DL
MOV VAR3,CH
MUL VAR3
MOV DX,AX

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP			; ENDP = Directiva para finalizar procedimiento
END PRIN				; END = Directiva para terminar programa
							; Sólo con el procedimiento principal