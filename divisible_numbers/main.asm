global main

section .data
    n1 dd 0
    n2 dd 0
    n dd 0
    msgdiv db "Numerele sunt divizibile"
    lungmsgdiv equ $- msgdiv
    msgnediv db "Numerele nu sunt divizibile"
    lungmsgnediv equ $- msgnediv
section .text

cit_cif:
    mov rax, 0
    mov rdi, 0
    mov rsi, n
    mov rdx, 1
    syscall

    xor r9, r9
    mov r9d, [n]
    sub r9d, '0'
    mov [n], r9d
    ret


cit_nr1:
    xor r10, r10
    mov r10b, [n]
    xor r8, r8
    loop1:
        call cit_cif
        dec r10b
        xor rax, rax
        mov eax, [n1]
        mov bx, 10
        mul bx
        mov r9d, [n]
        add eax, r9d
        mov [n1], eax
        cmp r10b, 0
    ja loop1
    ret


cit_nr2:
    xor r10, r10
    mov r10b, [n]
    xor r8, r8
    loop2:
        call cit_cif
        dec r10b
        xor rax, rax
        mov eax, [n2]
        mov bx, 10
        mul bx
        mov r9d, [n]
        add eax, r9d
        mov [n2], eax
        cmp r10b, 0
    ja loop2
    ret


verif_div:
    xor rbx, rbx
    xor rdx, rdx
    mov eax, [n1]
    mov ebx, [n2]
    div ebx
    cmp edx, 0
    jz divizibil
    jmp nedivizibil

    divizibil:
        mov rax, 1
        mov rdi, 1
        mov rsi, msgdiv
        mov rdx, lungmsgdiv
        syscall
        ret

    nedivizibil:
        mov rax, 1
        mov rdi, 1
        mov rsi, msgnediv
        mov rdx, lungmsgnediv
        syscall
        ret


main: 
    call cit_cif
    call cit_nr1
    call cit_cif
    call cit_nr2
    call verif_div

    mov rax, 60
    xor rdi, rdi
    syscall