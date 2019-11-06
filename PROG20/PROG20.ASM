INCLUDE PROG20.LIB

.MODEL SMALL

.STACK 64

.DATA
	PROMPT		DB  'La hora actual del sistema es : ','$'
	TIME			DB  'hh:mm:ss hrs.','$'

.CODE
	MAIN PROC FAR
		SET_DATA_SEGMENT					; Asignar el segmento de memoria

		LEA BX, TIME                 			; Carga la dirección de memoria de la cadena en BX
														; Registro requerido por la macro GET_TIME
		GET_TIME									; Obtener la hora del sistema (PROG20.LIB, Linea: 17)
		
		PRINT PROMPT							; Muestra el contenido de PROMPT en pantalla
		PRINT TIME								; Muestra el contenido de TIME en pantalla

		EXIT											; Terminar la ejecución y salir a DOS
	MAIN ENDP
	END MAIN