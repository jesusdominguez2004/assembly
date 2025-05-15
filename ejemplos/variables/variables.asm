.model small
.stack
.data
    ; definición de variables
    DataByte db 200d ; 255d máximo
    DataWord dw 60000d ; 65535d máximo
    DataDouble dd 90000d ; 4294967295d máximo

    ; variables y comportamiento vector
    var1 db "!"
    var2 dw "+!"

    var3 db "!"
    ; var4 dw "+!+"

    var5 db "+","!","+"
    var6 dw "+","!","+"

    var7 db 200d,200d,200d,200d,200d
    var8 dw 60000d,60000d,60000d,60000d,60000d

.code
    main PROC

        ; Importar variables
        mov ax, @data
        mov ds, ax
        xor ax, ax

        ; al = al + DataByte 
        ; al = 200d + 55d = 255d
        mov al, 55d
        add al, DataByte

        ; DataWord = DataWord - cx 
        ; DataWord = 60000d - 50000d = 10000d
        mov cx, 50000d
        sub DataWord, cx

        ; eax = DataDouble / ebx
        ; eax = 90000d / 10000d = 9d
        ; PARA PROCESADORES MAYORES A 16 BITS
        ; mov eax, DataDouble
        ; mov ebx, 10000d
        ; div ebx 

        ; ax =  DataWord / bx 
        ; ax =  90000d / 2d  = 45000d
        ; PARA PROCESADORES MAYORES A 16 BITS
        mov ax, DataWord
        mov bx, 2d
        div bx

        ; al = DataByte * bl
        ; al = 200d * 2d = 400d
        mov al, DataByte
        mov bl, 2d
        mul bl 

        ; /////////////

        ; 1 char = 1 byte = 8 bits
        ; 2 char = 2 byte = 16 bits
        ; 3 char = 3 byte = 24 bits
        ; 4 char = 4 byte = 32 bits
        ; n char = n byte = n * 8 bits

        ; al: 1 byte : 8 bits
        mov al, "+"

        ; ax: 2 byte : 16 bits
        mov ax, "+"

        ; ah, al, bh, bl: 1 byte : 8 bits = db (DataByte)
        ; ax, bx: 2 byte : 16 bits = dw (DataWord)

        .exit
    main ENDP
end main
