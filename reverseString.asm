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
    strM    db "String : $"
    revStrM db "Reversed String : $"
    str     db "Hello ! $"
    ; length variable to store the length of the string
    len     dw ?
.code
main proc
             mov         ax , @data
             mov         ds , ax
    ;displaying origninal string
             displayStr  strM
             displayStr  str
             call        endl
    ; moving to the end of the string while counting each charachter to get length till $ is found
             lea         si , str

    loop1:   
             mov         al , [si]
             cmp         al , '$'
             je          exitLoop
             inc         si
             inc         len
             jmp         loop1

    exitLoop:
    ;displaying the reversed string
             displayStr  revStrM
    ;since we moved to $ we need to dec si by 1 to go to one previous position
             dec         si
    ;we can use the length to run a loop now
             mov         cx , len
    loop2:   
             mov         al , [si]
             displayChar al
             dec         si
             loop        loop2
             call        endl



             mov         ah , 4ch
             int         21h
    ;procedure for new line
endl proc
             mov         dl , 10
             mov         ah , 2
             int         21h
             ret
endl endp
main endp
end main