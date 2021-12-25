.model small
.stack 100h
.data
tb db "ko co a va A$"
.code
main proc  
    mov ax,@data
    mov ds,ax
    mov ah,1
    int 21h
    mov bl,al
    cmp al,61h
    jne type
    mov ah,2
    mov dl,bl
    int 21h
    jmp dos
type:
    cmp al,41h
    jne type2
    mov ah,2
    mov dl,bl
    int 21h
    jmp dos
type2:
    mov ah,9
    lea dx,tb
    int 21h
dos:
    mov ah,4ch
    int 21h
main endp
end main
    