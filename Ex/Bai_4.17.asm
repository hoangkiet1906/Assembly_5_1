.model small
.stack 100h
.data      
tb1 db "Nhap so thu nhat:$" 
tb2 db 10,13,"Nhap so thu hai:$"
tb3 db 10,13,"Nhap so thu ba:$" 
tb4 db 10,13,"Ko co so chan$"
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
    mov ah,1
    int 21h  
    mov cl,al
    
    mov ah,9
    lea dx,tb3
    int 21h            
    mov ah,1
    int 21h
    
    shr al,1
    jc tip1
    shl al,1
    mov ah,2
    mov dl,al
    int 21h
    tip1:
    shr bl,1
    jc tip2
    shl bl,1
    mov ah,2
    mov dl,bl
    int 21h
    tip2:
    shr cl,1
    jc tip3
    shl cl,1
    mov ah,2
    mov dl,cl
    int 21h 
    jmp dos
    tip3:
    mov ah,9
    lea dx,tb4
    int 21h
    dos:
    mov ah,4ch
    int 21h
main endp
end main