.model small
.stack 100h
.data      
tb1 db "Moi nhap 1 ki tu:$"
tb2 db 10,13,"3 ki tu tiep theo la:$"
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
    
    mov ah,9
    lea dx,tb2
    int 21h 
    mov cx,3               
tip:
    mov ah,2
    inc bl
    mov dl,bl
    int 21h 
    loop tip
    mov ah,4ch
    int 21h
main endp
end main