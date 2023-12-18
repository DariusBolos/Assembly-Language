global main

section .data
x db 0
n dd 0
sum dw 0
cif db 0

section .text


cit_cif:
    mov rax, 0
    mov rdi, 0
    mov rsi, x
    mov rdx, 1
    syscall

    xor r9, r9
    mov r9b, [x]
    sub r9b, '0'
    mov [x], r9b
    ret


proces_afisNr:
    cmp eax, 0
    jg afis_nr
    ret


afis_nr:
    mov eax, [n]
    mov dx, 0
    mov r8d, 10
    div r8d
    mov [n], eax
    push dx
    call proces_afisNr
    pop dx
    add dx, '0'
    mov [cif], dx
    call afis_cif
    ret


sum_cif:
    mov eax, [n]
    mov dx, 0
    mov bx, 10
    div bx
    xor r8, r8
    mov r8w, [sum]
    add r8w, dx
    mov [sum], r8w
    mov [n], eax
    cmp ax, 0
    ja sum_cif

    xor rax, rax
    mov ax, [sum]
    mov [n], ax
    ret


afis_cif:
    mov rax, 1
    mov rdi, 1
    mov rsi, cif
    mov rdx, 1
    syscall
    ret


main:

xor r10,r10
call cit_cif
mov r10b, [x]

creare_numar:
    call cit_cif
    mov bx, 10
    mov eax, [n]
    mul bx
    add eax, r9d
    mov [n], eax
    dec r10b
    cmp r10b, 0
jnz creare_numar

call sum_cif
call proces_afisNr

mov rax, 60
xor rdi, rdi
syscall