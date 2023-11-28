global main

section .data
    n db 123
    digit db 0
    space db ' '

section .text

main:
    xor rax, rax
    mov al, [n]
    mov bl, 10
    call printDigits

    mov rax, 60
    xor rdi, rdi
    syscall


printDigits:
    cmp al, 0
    div bl
    add ah, '0'
    mov [digit], ah
    mov [n], al
    call printDigits


    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    ret
