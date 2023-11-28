global main

section .data
    n db 123
    c db 0
    space db ' '
section .text

main:
    do:
    xor rax, rax
    mov al, [n]
    mov bl, 10
    div bl
    add ah, '0'
    mov [c], ah
    mov [n], al

    mov rax, 1
    mov rdi, 1
    mov rsi, c
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    mov bl, [n]
    cmp bl, 0
    ja do

    mov rax, 60
    xor rdi, rdi
    syscall