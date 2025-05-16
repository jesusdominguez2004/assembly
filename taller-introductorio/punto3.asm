; ------------------------------------------------------
; Programa: Calculadora SIMPLE
; Autor:    [Jesús Alberto Domínguez Charris]
; Limitantes:
; - Solo acepta números de 1 dígito (0-9).
; - No maneja números negativos o resultados mayores a 9.
; - No muestra números de 2 dígitos como 12 o 15.
; ------------------------------------------------------

.model small ; modelo de memoria
.stack ; segmento de pila
.data ; segmento de datos

    ; Variables string
    msgWelcome db 'Calculadora simple',10,13,'$'
    msgNum1 db 'Ingrese un primer numero:',10,13,'$'
    msgNum2 db 10,13,'Ingrese un segundo numero:',10,13,'$'
    msgOperacion db 10,13,'Ingrese + para sumar, o - para restar:',10,13,'$'
    msgSuma db 10,13,'La suma es: $'
    msgResta db 10,13,'La resta es: $'
    msgError db 10,13,'Operacion invalida.',10,13,'$'
    msgFin db 10,13,'Programa finalizado... $'

    ; Variables numéricas
    num1 db ?
    num2 db ?
    operacion db ?
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

        ; Leer primer número
        mov dx, offset msgNum1
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        sub al, '0' ; Convertir de ASCII a número
        mov num1, al

        ; Leer segundo número
        mov dx, offset msgNum2
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        sub al, '0' ; Convertir de ASCII a número
        mov num2, al

        ; Leer operación
        mov dx, offset msgOperacion
        mov ah, 9
        int 21h

        mov ah, 1
        int 21h
        mov operacion, al

        ; Verificar operación
        cmp operacion, '+'
        je hacer_suma
        cmp operacion, '-'
        je hacer_resta
        jmp operacion_invalida

        ; Etiqueta suma
        hacer_suma:
            ; Sumar los números
            mov al, num1
            add al, num2
            mov resultado, al

            ; Mostrar mensaje de suma
            mov dx, offset msgSuma
            mov ah, 9
            int 21h

            ; Mostrar resultado
            mov al, resultado
            add al, '0' ; Convertir resultado a ASCII
            mov dl, al
            mov ah, 2
            int 21h

            ; Saltar a etiqueta fin
            jmp fin

        ; Etiqueta resta
        hacer_resta:
            ; Restar los números
            mov al, num1
            sub al, num2
            mov resultado, al

            ; Mostrar mensaje de resta
            mov dx, offset msgResta
            mov ah, 9
            int 21h

            ; Mostrar resultado
            mov al, resultado
            add al, '0' ; Convertir resultado a ASCII
            mov dl, al
            mov ah, 2
            int 21h

            ; Saltar a etiqueta fin
            jmp fin

        ; Etiqueta de operación inválida
        operacion_invalida:
            ; Mostrar mensaje de error
            mov dx, offset msgError
            mov ah, 9
            int 21h
        
        ; Etiqueta de fin
        fin:
            ; Mostrar mensaje de fin
            mov dx, offset msgFin
            mov ah, 9
            int 21h

            ; Terminar el programa
            ; Función de salida del programa (4Ch = terminate program)
            mov ah, 4Ch
            int 21h
    main ENDP
end main
