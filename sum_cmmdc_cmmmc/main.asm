global main

section .data
    n1 db 24
    n2 db 36
    sum db 0
    d dw 0
    m dw 0
    cif db 0

section .text

cmmdc:
    mov ah, 0
    mov al, [n1]
    mov bl, [n2]
    div bl     ; rest in ah
    mov [n1], bl
    mov [n2], ah
    cmp ah, 0
    ja cmmdc
    ret


cmmmc:
    mov al, r8b
    mov bl, [d]
    div bl ; in al catul impartirii lui n1 la cmmdc
    mov bl, r9b
    mul bl ; in ax cmmmc
    ret


suma:
    xor rax, rax
    mov al, [d]
    mov ah, [m]
    add al, ah
    ret


afisCif: 
    mov rax, 1
    mov rdi, 1
    mov rsi, cif
    mov rdx, 1
    syscall
    ret


procesAfisNr: 
    cmp al, 0
    jg afisNr
    ret


afisNr: 
    mov al, [sum]
    mov ah, 0
    mov r8b, 10
    div r8b
    mov [sum], al
    push ax
    call procesAfisNr
    pop ax
    add ah, '0'
    mov [cif], ah
    call afisCif
    ret
    

main:
    xor rax, rax
    xor rbx, rbx
    xor rdx, rdx
    xor r8, r8
    xor r9, r9
    mov r8b, [n1]
    mov r9b, [n2]
    call cmmdc
    mov r10b, [n1]
    mov [d], r10b
    
    call cmmmc
    mov [m], ax

    call suma
    mov [sum], al

    call procesAfisNr

    mov rax, 60
    xor rdi, rdi
    syscall