global main

section .data
    array db 1, 2, 3, 3
    c db 0

section .text

sumArray:
    mov rcx, 4
    l1:
        xor rax, rax
        mov al, [array + rcx]
        mov bl, [c]
        add bl, al
        mov [c], bl
    loop l1

    mov al, [c]
    add al, '0'

    mov rax, 1
    mov rdi, 1
    mov rsi, c
    mov rdx, 1  
    syscall

    ret

main:
    call sumArray

    mov rax, 60
    xor rdi, rdi
    syscall
