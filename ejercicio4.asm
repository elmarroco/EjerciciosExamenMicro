; 4. Diseñe en ensamblador una rutina que transforme
; una cadena de caracteres a mayúsculas.
; Recuerde que entre 97 y 122, se emplean para representar
; caracteres en minúsculas; mientras que entre 65 y 90,
; se emplean para los caracteres en mayúsculas.

; Segmento de la cadena SP + 6, OFFSET de la cadena SP + 4, (IP SP + 2)
TO_UPPER:
  PUSH BP
  MOV BP, SP
  PUSH DS       ; Guardar registros que se van a modificar
  PUSH ES
  PUSH DI
  PUSH SI
  PUSH AX
  PUSHF
  MOV AX, [BP+6]  
  MOV DS, AX
  MOV ES, AX
  MOV DI, [BP+4]
  MOV SI, DI
  CLD
  TO_UPPER_LOOP:
    LODSB
    CMP AL, 0       ; Verifico fin de cadena
    JEQ END_LOOP
    CMP AL, 97      ; Verifico minusculas
    JL NO_MINUSCULA
    ADD AL, 32      ; Convierto a minusculas
    NO_MINUSCULA:
    STOSB           ; Guardo el caracter modificado
    JMP TO_UPPER_LOOP
  END_LOOP:
    POPF
    POP AX
    POP SI
    POP DI
    POP ES
    POP DS
    POP BP
    RET