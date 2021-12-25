.model small
.stack 100h
.data  
tb1 db 10,13,"Nhap so : $" 
tb2 db 10,13,"Gap so Am : Tong la : $"
x dw ? 
xx dw ?
y dw ?  
t dw 0
.code 
main proc
    mov ax,@data
    mov ds,ax   
    mov dx,0
    mov cx,50
    ;nhap  
N:
    inc dx  
    mov ah,9
    lea dx,tb1
    int 21h
    call nhapso
    mov ax,x
    ;add t,ax 
    cmp al,"-"
    ja P  
    add t,ax
    jmp N
    ;loop N
    
P:    ;hien thi
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi
    ;ket thuc
    mov ah,4ch
    int 21h
    
main endp

nhapso proc  
    mov x,0
    mov y,0
    mov bx,10
nhap:
    mov ah,1  
    int 21h
    cmp al,13
    je thoat
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap
thoat:
    ret
nhapso endp
    ;Xuat
hthi proc
    mov bx,10
    mov ax,t
    mov cx,0
chia:
    mov dx,0
    div bx
    inc cx
    push dx
    cmp al,0
    je ht
    jmp chia
ht:
    pop dx
    add dl,30h
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht
    ret
hthi endp 
endp main