.model small
.stack 100h
.data
tb db 10,13,"Nhap so hexa thu nhat:$"
tb1 db 10,13,"Nhap so hexa thu hai:$"
tb3 db 10,13,"Nhap so hexa thu ba:$"
tb2 db 10,13,"So lon nhat la:$"
x dw ?
y dw ?
h1 dw ?
h2 dw ?
h3 dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    ;Nhap so thu nhat
    mov ah,9
    lea dx,tb
    int 21h
    call nhap_hex
    mov ax,x
    mov h1,ax
    ;Nhap so thu hai
nhap2:
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_hex
    mov ax,x
    cmp ax,h1
    je nhap2
    mov h2,ax
    ;Nhap so thu ba
nhap3:
    mov ah,9
    lea dx,tb3
    int 21h
    call nhap_hex
    mov ax,x
    cmp ax,h1
    je nhap3
    cmp ax,h2
    je nhap3
    mov h3,ax
    ;So sanh
    mov ah,9
    lea dx,tb2
    int 21h
    mov ax,h3
    cmp ax,h2
    ja sosanh
    mov ax,h2
    cmp ax,h1
    ja h2min
    jmp h1min    
sosanh:
    cmp ax,h1
    ja h3min    
h1max:
    mov ax,h1
    call hthi_bin
    jmp ketthuc
h2max:
    mov ax,h2
    call hthi_bin
    jmp ketthuc
h3max:
    mov ax,h3
    call hthi_bin
    ;Ket thuc
ketthuc:
    mov ah,4ch
    int 21h            
main endp
    ;He Hexa
nhap_hex proc
    mov x,0
    mov y,0
    mov bx,16
nhap:
    mov ah,1
    int 21h
    cmp al,13
    je thoat3
    cmp al,39h
    ja nhapchu
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap
nhapchu:
    sub al,37h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap
thoat3:
    ret
nhap_hex endp
    ;Hien thi
hthi_bin proc
    mov bx,2
    mov cx,0
chia1:
    mov dx,0
    div bx
    inc cx
    push dx
    cmp al,0
    je ht1
    jmp chia1
ht1:
    pop dx 
    add dl,30h
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht1
    ret
hthi_bin endp
end main