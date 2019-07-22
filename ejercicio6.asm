; 6. Examine la siguiente rutina en lenguaje C:
; void Proc () {
; char a, b;
; int c, d;
; a = 10;
; b = 100;
; c = a + b;
; d = c * a;
; }

Proc:
MOV CL, 10  ; a sera CL
MOV BL, 100 ; b sera BL
MOV DL, CL  ; c sera DL
ADD DX, BX  ; c = a + b
MOV AX, CX  ; d sera AX
MUL DX      ; d = c * a
RET