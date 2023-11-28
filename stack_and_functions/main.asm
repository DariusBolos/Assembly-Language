global main

section .data
    n db 0
    c db '5'
    m db 201
    space db ' '
section .text

afisc:
    mov rax, 1
    mov rdi, 1
    mov rsi, c
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    ret

afisnr:
    mov al, [n]
    mov ah, 0
    mov r8b, 10
    div r8b
    add ah, '0'
    mov [c], ah
    push ax
    call afisc
    pop ax
    mov [n], al
    cmp al, 0
    ja afisnr
    ret

reverse:
    mov al, [m]
    mov ah, 0
    mov bl, 10
    div bl
    push ax
    mov al, ah
    mov r8b, al
    mov al, [n]
    mul bl
    add al, r8b
    mov [n], al
    pop bx
    mov [m], bl
    cmp bl, 0
    ja reverse
    ret 

main:
    call reverse
    call afisnr

    mov rax, 60
    xor rdi, rdi
    syscall