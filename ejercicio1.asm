; Ejercicio 1
; 1. Examine el siguiente código en ensamblador, junto con el código
; de atención de la interrupción 0.
MOV AX, 0FH    ; Registro AX <- 0FH = 15
XOR CX, CX     ; Registro CX <- 0
DIV CL         ; cl <- 15/0 interrupción de división entre 0
MOV AX, 100H   ; AX <- 100H
INT 10H        ; PUSH IP, PUSH CS, PUSHF, IP <- 10H



               ; Codigo de atención a interrupción:
MOV CL, 10H    ; CL <- 10H
IRET           ; Regresa a la linea desde donde se disparo la interrupción

               ; Describa lo que sucederá. ¿Habrá interrupción? Si hay, ¿qué sucede después?
               ; Respuesta
               ; El registro AX contiene 15, el CX contiene 0 por el XOR
               ; Al realizar DIV CL se efectua AX/CX que es igual a 15/0
               ; Por lo que se dispara la interrupción de division entre 0
               ; Al entrar a la interrupcion ax se carga con 10H, osea 16
               ; Se sale de la interrupcion y de vuelve a realizar la division
               ; Donde esta vez es 15/16, AL = 0, AH = 15
               ; Se carga AX con 100H y
               ; se llama a la interrupcion 10H
