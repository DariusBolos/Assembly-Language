global main
extern f
section .data

section .text

main:
    sub rsp, 8
    mov rdi, 5
    mov rsi, 7
    call f
    add rsp, 8

    mov rax, 60
    xor rdx, rdx
    syscall