.model small
.stack 100h
.data
tb1 db "Nhap so thu nhat:$"
tb2 db 10,13,"Nhap so thu hai:$"
tb3 db 10,13,"Nhap so thu ba:$"
tb4 db 10,13,"So lon nhat la:$"
.code
main proc
    mov ax,@data
    mov ds,ax 
    nhap1:
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    nhap2:
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,1
    int 21h
    cmp al,bl
    je nhap2
    mov cl,al
    nhap3:
    mov ah,9
    lea dx,tb3
    int 21h
    mov ah,1
    int 21h
    cmp al,bl
    je nhap3
    cmp al,cl
    je nhap3
    ja tip
    cmp cl,bl
    ja max
max1:
    mov ah,9
    lea dx,tb4
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    jmp dos
    tip:
    cmp al,bl
    jb max1
    mov cl,al
    mov ah,9
    lea dx,tb4
    int 21h
    mov ah,2 
    mov dl,cl
    int 21h
    jmp dos
    max:
    mov ah,9
    lea dx,tb4
    int 21h
    mov ah,2
    mov dl,cl
    int 21h 
    dos:
    mov ah,4ch
    int 21h
main endp
end main