dosseg
;macro for printing a string
displayStr macro s1
               lea dx , s1
               mov ah , 9
               int 21h
endm
;macro for printing a char
displayChar macro c1
                mov dl , c1
                mov ah , 2
                int 21h
endm
.model small
.stack 100h
.data
    arr       db 7,8,9,1,2
    inputM    db "Enter a char to search : $"
    ;char variable
    char      db ?
    foundM    db "Found ! $"
    notFoundM db "Not Found ! $"
.code
main proc
               mov        ax , @data
               mov        ds , ax

    ;taking char as input
               displayStr inputM
               mov        ah , 1
               int        21h
    ;since we are taking input from user we need to ASCII Correct
               sub        al , 48
    ;we store the corrected input in char variable
               mov        char , al
               call       endl

    ;searching
               lea        si , arr
               mov        cx , 5

    searchLoop:
               mov        al , [si]
               cmp        al , char
               je         found
               inc        si
               loop       searchLoop

    ;incase char is not found we print not found mssg and jump to exit
               displayStr notFoundM
               jmp        exit
    ;incase the char is found we jump to this label and print and exit
    found:     
               displayStr foundM

    exit:      
               mov        ah , 4ch
               int        21h

    ;procedure for newline
endl proc
               mov        dl , 10
               mov        ah , 2
               int        21h
               ret
endl endp

main endp
end main