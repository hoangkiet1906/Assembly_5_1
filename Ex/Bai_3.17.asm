.model small
.stack 100h
.data
tb1 db 10,13,"Nhap 1 ky tu:$"
tb2 db 10,13,"Day vua nhap:$"
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov cx,0
    nhap: 
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,1
    int 21h 
    push ax 
    inc cx
    cmp al,51h
    jne nhap
    
    mov ah,9
    lea dx,tb2
    int 21h
tip:
    pop dx
    mov ah,2
    int 21h
    loop tip
    mov ah,4ch
    int 21h
main endp
end main