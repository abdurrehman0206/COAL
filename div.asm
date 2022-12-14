dosseg
;macro to print a string
displayStr macro s1
               lea dx , s1
               mov ah , 9
               int 21h
endm
;macro to print a charachter
displayChar macro c1
                mov dl , c1
                mov ah , 2
                int 21h
endm

.model small
.stack 100h
.data
    inputM             db "Enter a number : $"
    numerator          db ?
    denominator        db ?
    quotient           db ?
    remainder          db ?
    outputNumeratorM   db "Numerator = $"
    outputDenominatorM db "Denominator = $"
    outputQuotientM    db "Quotient = $"
    outputRemainderM   db "Remainder = $"
.code
main proc
    ;pulling data from the data segment
         mov         ax , @data
         mov         ds , ax
    ;Taking numerator and denominator from the user
         displayStr  inputM
         mov         ah , 1
         int         21h
         mov         numerator , al
         call        endl
         displayStr  inputM
         mov         ah , 1
         int         21h
         mov         denominator , al
         call        endl
    ;displaying the numerator and denominator
         displayStr  outputNumeratorM
         displayChar numerator
         call        endl
         displayStr  outputDenominatorM
         displayChar denominator
         call        endl

    ;performing division

         mov         al , numerator
         mov         bl , denominator
    ;ASCII Correction
         sub         al , 48
         sub         bl , 48
    ;since div works on ax and we are taking only an 8-bit number we need to set ah to zero
         mov         ah , 0
         div         bl
    ;ASCII Correction
         add         al , 48
         add         ah , 48
         mov         quotient , al
         mov         remainder , ah
         displayStr  outputQuotientM
         displayChar quotient
         call        endl
         displayStr  outputRemainderM
         displayChar remainder
         call        endl


         mov         ah , 4ch
         int         21h

    ;procedure to jump to next line
endl proc
         mov         dl , 10
         mov         ah , 2
         int         21h
         ret
endl endp
main endp
end main