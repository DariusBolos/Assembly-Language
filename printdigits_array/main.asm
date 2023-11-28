global main

section .data
    c db 4
    array db 1, 2, 3, 4
    arrayLen equ $-array

section .text

main:
    xor rcx, rcx
    xor rax, rax
    mov rcx, 4
    mov ebx, 0
l1:
    push rcx
    mov ah, [array + ebx]
    add ah, '0'
    mov [array + ebx], ah
    mov [c], ebx

    mov rax, 1
    mov rdi, 1
    mov rsi, array + c
    mov rdx, 1
    syscall

    inc ebx
    pop rcx
loop l1