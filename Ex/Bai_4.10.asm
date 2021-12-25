.model small
.stack 100h
.data      
tb1 db 10,13,"   $"
tb2 db 10,13,"  $"
tb3 db 10,13," $"
tb4 db 10,13,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,1
    int 21h 
    mov bl,al
    ;dong 1
    mov cx,4
    dong1:
    mov ah,2
    mov dl,bl
    int 21h
    loop dong1
    ;dong 2
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    ;dong 3
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    ;dong 4
    mov ah,9
    lea dx,tb3
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    ;dong 5 
    mov ah,9
    lea dx,tb4
    int 21h
    mov cx,5
    dong5:
    mov ah,2
    mov dl,bl
    int 21h
    loop dong5 
    
    mov ah,4ch
    int 21h
main endp
end main