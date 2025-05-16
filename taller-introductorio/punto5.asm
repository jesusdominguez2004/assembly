; ------------------------------------------------------
; Programa: Cuenta regresiva SIMPLE
; Autor:    [Jesús Alberto Domínguez Charris]
; Limitantes:
; - Solo acepta números de 1 dígito (0-9).
; - No maneja números negativos o resultados mayores a 9.
; ------------------------------------------------------

.model small ; modelo de memoria
.stack ; segmento de pila
.data ; segmento de datos

    ; Variables string
    msgWelcome db 'Cuenta regresiva SIMPLE...',10,13,'$'
    msgNumReferencia db 'Ingrese un numero de referencia (0-9):',10,13,'$'
    msgError db 10,13,'Operacion invalida.',10,13,'$'
    msgFin db 10,13,'Programa finalizado... $'

.code ; segmento de código
    ; programa principal
    main PROC
        ; Inicializar segmento de datos
        mov ax, @data
        mov ds, ax

        ; Mostrar mensaje de bienvenida
        mov dx, offset msgWelcome
        mov ah, 9
        int 21h

        ; Pedir número
        mov dx, offset msgNumReferencia
        mov ah, 9
        int 21h

        ; Leer número del usuario
        mov ah, 1
        int 21h
        sub al, '0' ; Convertir de ASCII a número
        cmp al, 9
        ja Error ; Si es mayor que 9, error

        mov cl, al ; Guardar número en cl (contador)
        inc cl ; Incluir el valor original (porque loop descuenta antes)

        ; Etiqueta para la cuenta regresiva
        CuentaRegresiva:
            ; Restar antes de mostrar
            dec cl 
            mov dl, cl
            add dl, '0' ; Convertir a ASCII para impresión
            mov ah, 02h
            int 21h

            ; Salto de línea
            mov dl, 10 ; ASCII para LF
            mov ah, 02h
            int 21h
            mov dl, 13 ; ASCII para CR
            int 21h

            ; Volver a contar si cl no es cero
            cmp cl, 0
            jne CuentaRegresiva

            ; Fin del ciclo
            jmp Salir

        ; Etiqueta de error
        Error:
            mov dx, offset msgError
            mov ah, 9
            int 21h

        ; Etiqueta de salida
        Salir:
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
