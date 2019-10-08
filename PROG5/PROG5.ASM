; ADD op1,op2 => op2 + op1
.MODEL SMALL	; Modelo de memoria SMALL = 1 Segmento de memoria por registro

.STACK 64		; Definición del segmento de pila

.DATA			; Definición del segmento de datos
VAR DW ?
BASE DB 10
HEIGHT DB 20
PERIMETER DB ?

.CODE			; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento
MOV AX,@data	; Obtiene la dirección del segmento de datos
MOV DS,AX		; Asigna la dirección al registro de datos

; a) 80 + 300 = VAR (REG,INM)
MOV AX,80
ADD AX,300
MOV VAR,AX

; b) REG + REG = REG (MEM,INM)
MOV AX,200
MOV BX,100
MOV VAR,AX
ADD VAR,100
MOV BX,VAR

; c) CX + BX = AX (MEM,REG)
MOV CX,100
MOV BX,200
MOV VAR,CX
ADD VAR,BX
MOV AX,VAR

; d) Perímetro de un rectángulo
MOV AL,BASE
ADD AL,AL
MOV AH,HEIGHT
ADD AH,AH
ADD AL,AH
MOV PERIMETER,AL

; [(18 + 7) + (92 + 800 + 500)] + 3 = VAR (REG,INM)
MOV AX,18
ADD AX,7
MOV BX,92
ADD BX,800
ADD BX,500
ADD AX,BX
ADD AX,3
MOV VAR,AX

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP		; ENDP = Directiva para finalizar procedimiento
END PRIN		; END = Directiva para terminar programa
				; Sólo con el procedimiento principal