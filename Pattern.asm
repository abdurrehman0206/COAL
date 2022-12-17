dosseg
.model small
.stack 100h
.data
.code
main proc
mov bx , 1
mov cx , 5
loop1:


push cx 
mov cx , bx

loop2:
mov dl , '*'
mov ah , 2
int 21h
loop loop2
mov dl , 10
mov ah ,2 
int 21h
pop cx
inc bx
loop loop1
mov ah , 4ch
int 21h
main endp
end main