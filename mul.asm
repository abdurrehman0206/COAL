dosseg
displayStr macro s1
               lea dx , s1
               mov ah , 9
               int 21h
endm
displayChar macro c1
                mov dl , c1
                mov ah , 2
                int 21h
endm
.model small
.stack 100h
.data
    inputM   db "Input a number : $"
    num1M    db "First Number : $"
    num2M    db "Second Number : $"
    productM db "Product : $"
    num1     db ?
    num2     db ?
    n1       db ?
    n2       db ?
.code
main proc
    ;pulling data from data segement
         mov         ax , @data
         mov         ds , ax
    ;Taking input
         displayStr  inputM
         mov         ah , 1
         int         21h
         mov         num1 , al
         call        endl
         displayStr  inputM
         mov         ah , 1
         int         21h
         mov         num2 , al
         call        endl
    ; displaying the inputted numbers
         displayStr  num1M
         displayChar num1
         call        endl
         displayStr  num2M
         displayChar num2
         call        endl
    ;Multiplying
         mov         al , num1
         mov         bl , num2
    ;ASCII Adjustment
         sub         al , 48
         sub         bl , 48
    ;mul mnemonic multiplies bl with al and stores the result in al and ah respectively
    ;the first number in the product is stored inside ah and second in al
         mul         bl
         AAM
    ;Converting into decimal numbers ASCII Conversion
         add         al , 48
         add         ah , 48
         mov         n1 , al
         mov         n2 ,ah
    ;printing the product
         displayStr  productM
         displayChar n2
         displayChar n1
    ;exiting out of the regsiters
         mov         ah , 4ch
         int         21h
    ;procedure for next line
endl proc
         mov         dl , 10
         mov         ah , 2
         int         21h
         ret
endl endp
main endp
end main