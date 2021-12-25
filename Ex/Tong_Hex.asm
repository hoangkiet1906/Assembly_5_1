.model small
.stack 100h
.data
tb1 db "Nhap so Hexa:$"
tb2 db 10,13,"Tong la:$"
.code
main proc
     mov ax,@data
     mov ds,ax
     mov ah,9
     lea dx,tb1
     int 21h      
     mov ah,1
     int 21h
     cmp al,39h
     ja chu
     sub al,30h
     mov bl,al
chu:
     sub al,37h
     mov bl,al
     ;tinh tong
     mov ax,0
     mov cx,0
tong:
     inc cl
     add al,cl
     cmp cl,bl
     jne tong
     ;hien thi
     mov bl,al
     mov ah,9
     lea dx,tb2
     int 21h
     mov cx,8
hienthi:
     shl bl,1
     jc in1
     mov ah,2
     mov dl,30h
     int 21h
     loop hienthi
     jmp dos
in1:
     mov ah,2
     mov dl,31h
     int 21h
     loop hienthi
dos:
     mov ah,4ch
     int 21h
main endp
end main