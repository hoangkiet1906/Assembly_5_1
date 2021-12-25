.model small
.stack 100h
.data      
tb1 db 10,13,"Nhap so thu nhat:$"
tb2 db 10,13,"Nhap so thu hai:$"
tb3 db 10,13,"Tong hai so la:$"
.code
main proc
    mov ax,@data 
    mov ds,ax
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov bl,al
    
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,1
    int 21h
    sub al,30h
                        
    add bl,al
    mov ah,9
    lea dx,tb3
    int 21h
    mov ax,bx
    mov bl,10
    div bl 
    mov bl,ah
    mov ah,0
    push bx
    push ax
    mov cx,2
    tip:
    pop dx
    add dx,30h
    mov ah,2
    int 21h
    loop tip
main endp
end main
    