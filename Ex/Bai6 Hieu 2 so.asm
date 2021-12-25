.model small
.stack 100h
.data
b1 db 10,13, 'Moi nhap so thu 1:$'
b2 db 10,13, 'Moi nhap so thu 2:$'
b3 db 10,13, 'Ket qua hieu la:$'
b4 db 10,13, 'Ket qua hieu la:-$'
.code
main proc
    mov ax,@data
    mov ds,ax
    tb1:
    mov ah,9
    lea dx,b1
    int 21h
    mov ah,1
    int 21h
    cmp al, "0" 
    jl tb1
     cmp al,"9"
    ja tb1
    sub al,30h
    mov bl,al
    tb2:
    mov ah,9
    lea dx,b2
    int 21h
    mov ah,1
    int 21h
    cmp al, "0" 
    jl tb2
     cmp al,"9"
    ja tb2
    sub al,30h
    sub bl,al
    cmp bl,255
    jl htam
    
    
    kq:
    mov ah,9
    lea dx,b3
    int 21h
    add bl,30h
    mov ah,2
    mov dl,bl
    int 21h
    jmp thoat 
    htam: 
    neg bl
    add bl,30h 
    mov ah,9
    lea dx,b4
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    
    thoat:
    mov ah,4ch
    int 21h
    main endp
end main
    