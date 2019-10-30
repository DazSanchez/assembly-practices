; MUL op1 => AX * op1 = [AX,DX]
; DIV op1 => AX / op1 = AL (resultado), AH (residuo) (AX = DW / op1 = DB)
.MODEL SMALL	; Modelo de memoria SMALL = 1 Segmento de memoria por registro

.STACK 64			; Definición del segmento de pila

.DATA					; Definición del segmento de datos
VAR DB ?
VAR2 DW ?

.CODE					; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento, FAR no hay llamadas a otros procedimientos
MOV AX,@data		; Obtiene la dirección del segmento de datos
MOV DS,AX			; Asigna la dirección al registro de datos

; 300 * 400 = VAR (REG)
MOV AX,300
MOV BX,400
MUL BX

; 20 / 5 = VAR (REG)
MOV AX,20
MOV BL,4
DIV BL
MOV VAR,AL

; A) 18 / 3 = DH (MEM)

MOV AX,18
MOV  VAR,3
DIV VAR
MOV DH,AL

; B) [ ( 400 / 40 ) ] * 3 = VAR (REG)
MOV AX,400
MOV BH,40
DIV BH
MOV BL,3
MUL BL
MOV VAR2,AX

; C) 51 / 22 = VAR (MEM)
MOV AX,51
MOV VAR,22
DIV VAR
MOV VAR,AL

; D) 60 * 900
MOV AX,900
MOV BX,60
MUL BX

; E) BX / CH = AL (MEM)
MOV BX,100
MOV CH,10
MOV VAR,CH
MOV AX,BX
DIV VAR

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP
END PRIN