; ------------------------------------------------------
; Programa: Número mayor o menor SIMPLE
; Autor:    [Jesús Alberto Domínguez Charris]
; Limitantes:
; - Solo acepta números de 1 dígito (0-9).
; - No maneja números negativos o resultados mayores a 9.
; ------------------------------------------------------

.model small ; modelo de memoria
.stack ; segmento de pila
.data ; segmento de datos

    ; Variables string
    msgWelcome db 'Mayor o menor SIMPLE...',10,13,'$'
    msgNumReferencia db 'Ingrese un numero de referencia (0-9):',10,13,'$'
    msgNumUsuario db 10,13,'Ingrese ahora SU numero (0-9):',10,13,'$'
    msgMayor db 10,13,'SU numero es MAYOR $'
    msgMenor db 10,13,'SU numero es MENOR $'
    msgIgual db 10,13,'SU numero es IGUAL $'
    msgError db 10,13,'Operacion invalida.',10,13,'$'
    msgFin db 10,13,'Programa finalizado... $'

    ; Variables numéricas
    num1 db ?
    num2 db ?
    resultado db ?

    ; salto de línea (asscii 10)
    ; retorno de carro (asscii 13)

.code ; segmento de código
    main PROC
        ; importar segmento de datos
        mov ax, @data
        mov ds, ax

        ; Mostrar bienvenida
        mov dx, offset msgWelcome
        mov ah, 9
        int 21h

        ; Leer número de referencia
        mov dx, offset msgNumReferencia
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        sub al, '0' ; Convertir de ASCII a número
        mov num1, al

        ; Leer número usuario
        mov dx, offset msgNumUsuario
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        sub al, '0' ; Convertir de ASCII a número
        mov num2, al

        ; Comparaciones válidas:
        ; Registro vs. memoria
        ; Registro vs. registro
        ; Registro vs. inmediato
        ; Memoria vs. inmediato

        ; Comparar números
        mov al, num2     ; Cargar num2 en AL
        cmp al, num1     ; Comparar AL con num1
        ja MAYOR
        jb MENOR
        je IGUAL
        jmp ERROR

        MAYOR:
            ; Mostrar mensaje de mayor
            mov dx, offset msgMayor
            mov ah, 9
            int 21h
            jmp FIN
        MENOR:
            ; Mostrar mensaje de menor
            mov dx, offset msgMenor
            mov ah, 9
            int 21h
            jmp FIN
        IGUAL:
            ; Mostrar mensaje de igualdad
            mov dx, offset msgIgual
            mov ah, 9
            int 21h
            jmp FIN
        ERROR:
            ; Mostrar mensaje de error
            mov dx, offset msgError
            mov ah, 9
            int 21h
        FIN:
            ; Mostrar mensaje de finalización
            mov dx, offset msgFin
            mov ah, 9
            int 21h

        ; Terminar el programa
        ; Función de salida del programa (4Ch = terminate program)
        mov ah, 4Ch
        int 21h
    main ENDP
end main
