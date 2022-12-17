dosseg
;macro for printing string
displayStr macro s1
               lea dx , s1
               mov ah , 9
               int 21h
endm
;macro for printing char
displayChar macro c1
                mov dl , c1
                mov ah , 2
                int 21h
endm
.model small
.stack 100h
.data
    ; making a string variable
    str    db 50 dup("$")
    inputM db "Input a string : $"
    len    dw 0
.code
main proc
                mov         ax , @data
                mov         ds , ax
    ;taking input
                displayStr  inputM
                lea         si , str
    inputLoop:  
                mov         ah , 1
                int         21h
    ;comparing the input to Enter key
                cmp         al , 13
                je          exitInput
                mov         [si] , al
                inc         si
                inc         len
                loop        inputLoop
    exitInput:  
                dec         si
    ;displaying the string
                displayStr  str
                call        endl



    ;reversing the string
    ;since we stored the length while we took the input we can use it to run the reverse loop
                mov         cx , len
    reverseLoop:
                displayChar [si]
                dec         si
                loop        reverseLoop
                
                mov         ah , 4ch
                int         21h
    ;procedure for new line
endl proc
                mov         dl , 10
                mov         ah ,2
                int         21h
                ret
endl endp


main endp
end main