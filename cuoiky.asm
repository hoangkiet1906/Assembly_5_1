.model small
.stack 100h
.data
tb1 db 10,13,"Nhap so a:$" 
;xuong dong lui vao dau dong
tb2 db 10,13,"Nhap so N:$"
tb3 db 10,13,"So khong dung! Nhap lai...$"
tb4 db 10,13,"Ket qua $"
tb5 db " la:$"
x dw ?
y dw ?
;a^N
a dw ?
N dw ? 
;kq
M dw ? 
K dw ?
.code
main proc  
    ;in ra 1 chuoi 
    ;thu tuc de dung ah,9
    mov ax,@data
    mov ds,ax
nhap_so_a:    
    mov ah,9 
    ;in ra 1 chuoi
    lea dx,tb1
    int 21h
    call nhap_a
    mov ax,x
    mov a,ax 
nhap_so_N:    
    mov ah,9
    lea dx,tb2
    int 21h
    call nhap_N     
    mov ax,x
    mov N,ax
    ;Tinh toan  
    ;so lan lap
    mov cx,N
    mov ax,1
tinh:    
    ;nhan so a N lan
    mul a
    loop tinh
    mov M,ax
    ;Hien thi ket qua
    mov ah,9
    lea dx,tb4
    int 21h
    ;k=1 la so am 
    cmp K,1       
    ;ko phai thi hien thi +
    jne duong              
    ;phai thi hien thi dau - truoc
    mov ah,2
    mov dx,2Dh
    int 21h
duong:
    mov ax,a
    mov x,ax
    call hthi_dec
    
    mov ah,2   
    ;dau ^
    mov dx,5Eh
    int 21h
    
    mov ax,N
    mov x,ax
    call hthi_dec
    
    mov ah,9
    lea dx,tb5
    int 21h
    ;ko phai thi hien thi +
    cmp K,1
    jne kq_duong  
    ;phai thi hien thi dau - truoc
    mov ah,2
    mov dx,2Dh
    int 21h
kq_duong:
    mov ax,M
    mov x,ax
    call hthi_dec
    jmp ket_thuc
    
    
main endp 
    ;Nhap so a
nhap_a proc  
    ;khoi tao bien x,y = 0
    mov x,0
    mov y,0
    ;luu o co so 10 de x10 (phan tich cau tao so)
    mov bx,10
nhapa:  
    ;Nhap 1 so
    mov ah,1
    int 21h 
    ;ss vs dau enter -> dung
    cmp al,13 
    ;neu = thi thoat ret=return
    je thoata 
    ;neu nhap dau -
    cmp al,2Dh
    je soam   
    ;< 0
    cmp al,30h
    jb  nhap_lai_a   
    ;> 9
    cmp al,39h
    ja  nhap_lai_a
    ;lay ra gtri vua nhap : vi ma ascil la 30-39 => -35 de lay gtri
    sub al,30h 
    ;xoa gtri thanh ghi ah 
    xor ah,ah 
    ;bien y de 16bit =>thanh ghi ax 16bit 0105 -> 0005 de chuyen vao y
    mov y,ax   
    ;chuyen x vao ax
    mov ax,x  
    ;0x10+so vua nhap
    mul bx   
    ;+so vua nhap
    add ax,y  
    ;cat ax vao bien x de ko bi a/h => sonhap luu vao x
    mov x,ax  
    ;quay lai
    jmp nhapa
soam:
    mov K,1
    jmp nhapa 
nhap_lai_a:
    mov ah,9
    lea dx,tb3
    int 21h
    jmp nhap_so_a
thoata:
    ret
nhap_a endp 
    ;Nhap so N
nhap_N proc
    mov x,0
    mov y,0
    mov bx,10
nhapN:
    mov ah,1
    int 21h
    cmp al,13
    je thoatN  
    ;so sanh ky tu vs so 0
    cmp al,30h 
    ;neu nho hon 0 thi nhap lai
    jb  nhap_lai_N
    cmp al,39h  
    ;neu lon hon 9 thi nhap lai
    ja  nhap_lai_N
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhapN 
nhap_lai_N:
    mov ah,9
    lea dx,tb3
    int 21h
    jmp nhap_so_N
thoatN:
    ret
nhap_N endp
    ;>>>>>>>>>
hthi_dec proc 
    ;luu o co so 10
    mov bx,10 
    ;dua x vao ax , so bi chia phai de vao ax
    mov ax,x  
    ;cx la bien dem so lan chia; vd so 3 chuso chia 3 lan -> hien thi 3 so
    mov cx,0
chia: 
    ;xoa thnh ghi dx
    mov dx,0      
    ;ax/bx -> phan nguyen luu trong ax, phan du luu trong dx
    div bx   
    ;sau moi lan chia tang cx -> hien thi 
    inc cx   
    ;cat so du vao ngan xep -> 85 -> in 5 8
    push dx 
    ;so sanh dã chia het hay ch -> con du chia tiep -> het r thi ht
    cmp al,0
    je ht
    jmp chia
ht:       
    ;lay data tu stack dua vao dx
    pop dx  
    ;ma ascil 5(35) + 30h -> so 5 la ma 35
    add dl,30h  
    ;ham in loai 2 -> in 1 kytu
    mov ah,2
    int 21h 
    ;giam cx khi in ra dc 1 so
    dec cx
    cmp cx,0
    jne ht
    ret ;return quai lai ctring chinh
hthi_dec endp
ket_thuc:    
end main