global main

section .data
    n db 0
section .text

readPosition: ; gets the position of an element in the fibonacci sequence
    mov rax, 0
    mov rdi, 0
    mov rsi, n
    mov rdx, 1
    syscall
    ret

processFibo:
    

    ret

calculateFibo:


main:
    


    ; exiting the program
    mov rax, 60
    xor rdi, rdi
    syscall    