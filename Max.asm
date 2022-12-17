dosseg
.model small
.stack 100h
.data
      arr  db 7,8,9,1,2
      maxM db "Maximum : $"
.code
main proc
            mov  ax , @data
            mov  ds , ax

            lea  si , arr
            mov  bl , [si]
            inc  si
            mov  cx , 4

      loop1:
            cmp  bl , [si]
            jg   next
            mov  bl , [si]
      next: 
            inc  si

            loop loop1

            lea  dx , maxM
            mov  ah , 9
            int  21h

            mov  dl , bl
            add  dl , 48

            mov  ah , 2
            int  21h

            mov  ah , 4ch
            int  21h
      
main endp
end main