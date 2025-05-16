.model small ; Modelo de memoria pequeño (64KB de código y 64KB de datos)
.stack 100h ; Tamaño de la pila (100h = 256 bytes)
.data ; Sección de datos
    mensaje db 'Hola Mundo$' ; Variable de cadena de caracteres
    ; '$' es el terminador de cadena para la función de impresión de DOS
    ; db = define byte, se usa para definir una variable de un byte
.code ; Sección de código
    main: ; Nombre de la etiqueta principal
        mov ax, @data ; Mover el segmento de datos al registro AX
        mov ds, ax ; Mover el segmento de datos al registro DS
        mov ah, 09h ; Función de impresión de cadena (09h = print string)
        lea dx, mensaje ; Cargar la dirección de la cadena en DX (lea = load effective address)
        int 21h ; Interrupción de DOS para imprimir la cadena (21h = DOS interrupt)
        mov ah, 4Ch ; Función de salida del programa (4Ch = terminate program)
        int 21h ; Interrupción de DOS para imprimir la cadena (21h = DOS interrupt)
    end main ; Fin del programa
