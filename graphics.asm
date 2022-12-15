dosseg
.model small
.stack 100h
.data
.code
main proc 
;specifying the area / 06h for scroll down area or in simple words rectangular space
mov ah , 06h
;al specifies the height of the area
mov al , 10
;cl specifies the upper x axis coordinate
mov cl , 0
;dl specifies the lower x axis coordinate
mov dl , 20
;ch specifies the upper y axis coordinate
mov ch , 20
;dh specifies the lower y axis coordinate
mov dh , 40
;bh specifies the background/foreground color and cursor handling 
;bh takes an 8 bit binary number
;the "b" at the end specifies binary
mov bh , 01110000b

;int 10h is the interrupt for graphics mode
int 10h

mov ah , 4ch
int 21h
main endp
end main