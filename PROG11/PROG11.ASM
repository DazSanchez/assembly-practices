.MODEL SMALL

.STACK 64

.DATA
CAD DB "Hola mundo","$"

.CODE
PRIN PROC FAR
	MOV AX,@data		; Obtiene la dirección del segmento de datos
	MOV DS,AX			; Asigna la dirección al registro de datos

	; LIMPIAR PANTALLA
	MOV AX,0600H	; INT Limpiar pantalla 
	MOV BH,71H		; Color: 7 (Pantalla, Blanco) 1 (Texto, Azul)
	MOV CX,0000H	; Coordenada incial (R,C) RRCCH
	MOV DX,0C4FH	; Coordenada final	(R,C) RRCCH
	INT 10H
	
	; POSICIONAR CURSOR
	MOV AH,02H		; INT Mover cursor
	MOV BH,00		; Paginación = 0
	MOV DH,05		; Renglón 5 / 24
	MOV DL,26		; Columna 12 / 79
	INT 10H		; Solicitar interrupción
	
	MOV AH,09H
	LEA DX,CAD
	INT 21H
	
	MOV AX,4C00H	; Salir a MS-DOS
	INT 21H
PRIN ENDP
END PRIN