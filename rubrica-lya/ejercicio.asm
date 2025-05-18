.model small ; modelo de memoria
.stack ; segmento de pila
.data ; segmento de datos
    valor db 3 ; Declaramos la variable con el valor 3.
.code ; segmento de código
    main PROC ; programa principal
        ; Inicializar segmento de datos
        mov ax, @data ; Cargar la dirección del segmento de datos en AX
        mov ds, ax ; Mover el valor de AX a DS

        ; Proceso para duplicar el valor
        mov al, valor ; Cargar el valor de la variable en AL
        add al, al ; Duplicar el valor en AL (AL + AL)

        ; Proceso para mostrar el resultado
        add al, '0' ; Convertir el número a ASCII
        mov dl, al ; DOS requiere el valor en DL
        mov ah, 02h ; (02h = display character)
        int 21h ; (21h = DOS interrupt)

        ; Terminar el programa
        mov ah, 4Ch ; (4Ch = terminate program)
        int 21h ; (21h = DOS interrupt)
    main ENDP ; fin del procedimiento main
end main ; fin del programa
