; MACROS con parámetros
MOVE_CURSOR MACRO ROW, COLUMN
	; Mover el cursor para colocar ITO
	MOV AH,02H				; INT Mover cursor
	MOV BH,00				; Paginación 0
	MOV DH,ROW			; Fila
	MOV DL,COLUMN		; Columna
	INT 10H					; Realizar interrupción
ENDM

DRAW_BOX MACRO COLOR, START_POSITION, END_POSITION
	; Pintar recuadro
    MOV AX,0600H        			; INT Pintado de pantalla
    MOV BH,COLOR
    MOV CX,START_POSITION
    MOV DX,END_POSITION
    INT 10H             				; Realizar interrupción
ENDM

DRAW_MESSAGE MACRO  MESSAGE
	MOV AH,09H				; INT Mostrar texto
	LEA DX,MESSAGE		; Cargar la cadena a mostrar
	INT 21H					; Realizar interrupción
ENDM

REQUEST_INPUT MACRO BUFFER
	MOV AH,0AH			; INT Entrada de teclado 
	LEA DX,BUFFER
	INT 21H				; Realizar interrupción
ENDM

DRAW_TITLE MACRO
	MOVE_CURSOR 13, 16
	DRAW_MESSAGE ITO
ENDM

DRAW_STUDENT_INPUT MACRO
	MOVE_CURSOR 15, 02
	DRAW_MESSAGE STUDENT
	DRAW_BOX 70H, 0F0CH, 0F25H
ENDM

DRAW_SEMESTER_INPUT MACRO
	MOVE_CURSOR 17, 02
	DRAW_MESSAGE SEMESTER
	DRAW_BOX 70H, 110CH, 1125H
ENDM

DRAW_NOTE_INPUT MACRO
	MOVE_CURSOR 19, 02
	DRAW_MESSAGE NOTE
	DRAW_BOX 70H, 1310H, 1325H
ENDM

REQUEST_DATA MACRO
	DRAW_BOX 5FH, 0C00H, 1827H
	
	DRAW_TITLE
	DRAW_STUDENT_INPUT
	DRAW_SEMESTER_INPUT
	DRAW_NOTE_INPUT
	
	MOVE_CURSOR 15, 13
	REQUEST_INPUT INPUT_STUDENT
	
	MOVE_CURSOR 17, 13
	REQUEST_INPUT INPUT_SEMESTER
	
	MOVE_CURSOR 19, 17
	REQUEST_INPUT INPUT_NOTE
ENDM

SET_DATA_SEGMENT MACRO
	MOV AX,@data		; Obtiene la dirección del segmento de datos
	MOV DS,AX			; Asigna la dirección al registro de datos
ENDM

EXIT MACRO
	MOV AX,4C00H	; Salir a MS-DOS
	INT 21H
ENDM

.MODEL SMALL

.STACK 64

.DATA
	ITO				DB	"ITO","$"
    STUDENT		DB	"Nombre:","$"
    SEMESTER 	DB	"Semestre:","$"
    NOTE 			DB	"Calificacion:","$"
	
	INPUT_STUDENT			LABEL BYTE		; Nombre de estudiante
	STUDENT_MAX_LENGTH		DB 23			; Número máximo de caracteres que se pueden introducir 
	STUDENT_CURRENT_LENGTH	DB ?			; Cuántos caracteres fueron introducidos
	STUDENT_BUFFER			DB 23 DUP(" ")	; N DUP = Duplicar N veces el parámetro
	
	INPUT_SEMESTER			LABEL BYTE		; Semestre de estudiante
	SEMESTER_MAX_LENGTH		DB 3			; Número máximo de caracteres que se pueden introducir 
	SEMESTER_CURRENT_LENGTH	DB ?			; Cuántos caracteres fueron introducidos
	SEMESTER_BUFFER			DB 3 DUP(" ")	; N DUP = Duplicar N veces el parámetro
	
	INPUT_NOTE				LABEL BYTE		; Calificación de estudiante
	NOTE_MAX_LENGTH			DB 4			; Número máximo de caracteres que se pueden introducir 
	NOTE_CURRENT_LENGTH		DB ?			; Cuántos caracteres fueron introducidos
	NOTE_BUFFER				DB 4 DUP(" ")	; N DUP = Duplicar N veces el parámetro
	
.CODE
PRIN PROC FAR
	SET_DATA_SEGMENT
	
	REQUEST_DATA
	REQUEST_DATA
	REQUEST_DATA
	
	EXIT
PRIN ENDP
END PRIN