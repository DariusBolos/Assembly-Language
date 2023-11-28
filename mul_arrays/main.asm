global main

section .data
    a db 1000 dup(0)
    i db 0
    x db 0
    n db 3
    msg db "Lungimea sirului este: "

section .text

readnr:
    mov rax, 0
    mov rdi, 0
    mov rsi, x
    mov rdx, 1
    syscall

    mov al, [x]
    sub al, '0'
    
    xor rcx, rcx
    mov cl, [i]
    mov [a + ecx], al

    ret 


printnr:
    mov al, [a + r9d]
    add al, '0'
    mov [x], al
    
    mov rax, 1
    mov rdi, 1
    mov rsi, x
    mov rdi, 1
    syscall
    
    ret 


main:
    mov rax, 0
    mov rdi, 0
    mov rsi, n
    mov rdx, 1
    syscall

    mov al, [n]
    sub al, '0'
    mov [n], al

    mov r8b, [n]
    loop1:
        call readnr
        mov al, [i]
        inc al
        mov [i], al
        dec r8b
        cmp r8b, 0
    ja loop1


    xor r9, r9
    mov r10b, [n]
    loop2:
        call printnr
        dec r10b
        inc r9b
        cmp r10b, 0
    ja loop2


    mov rax, 60
    xor rdi, rdi
    syscall
