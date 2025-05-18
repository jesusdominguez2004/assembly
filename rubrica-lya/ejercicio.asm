.model small ; modelo de memoria
.stack ; segmento de pila
.data ; segmento de datos
    ; Variables string
    
    ; Variables numéricas

.code ; segmento de código
    ; programa principal
    main PROC
        ; Inicializar segmento de datos
        mov ax, @data
        mov ds, ax
        

        ; Terminar el programa
        mov ah, 4Ch ; Función de salida del programa (4Ch = terminate program)
        int 21h ; (21h = DOS interrupt)
    main ENDP
end main
