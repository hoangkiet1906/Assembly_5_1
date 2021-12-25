.model small
.stack 100h
.data      
tb1 db "Nhap 1 ky tu:$"
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,tb1
    int 21h            
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,30h
    jb dos
    cmp bl,39h
    ja dos
    mov ah,2
    mov dl,bl
    int 21h
    dos:
    mov ah,4ch
    int 21h
main endp
end main