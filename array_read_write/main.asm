global main

section .data
    a db 0,0,0
    n db 3
    x db 0
section .text

citc:
    mov rax, 0
    mov rdi, 0
    mov rsi, x
    mov rdx, 1
    syscall
    ret

afisc: 
    mov rax, 1
    mov rdi, 1
    mov rsi, x
    mov rdx, 1
    syscall
    ret

citirenr:
    push rcx
    call citc
    call afisc
    xor rcx, rcx
    pop rcx
    loop citirenr
    ret

main:
    xor rax, rax
    xor rcx, rcx
    mov rcx, [n]
    call citirenr

    mov rax, 60
    xor rdi, rdi
    syscall

