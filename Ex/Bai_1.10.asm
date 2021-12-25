.model small
.stack 100h
.data        
tb1 db 10,13,"Moi nhap 1 chu:$"
tb2 db 10,13,"Ki tu duoc chuyen thanh:$"
.code
main proc
    mov ax,@data
    mov ds,ax                           
nhap:
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp al,61h
    jb nhap
    cmp al,7ah
    ja nhap
    
    mov ah,9
    lea dx,tb2
    int 21h
    sub bl,20h
    mov ah,2
    mov dl,bl
    int 21h
    mov ah,4ch
    int 21h
main endp
end main
    