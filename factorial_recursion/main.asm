global main

section .data
    message db "Factorial of the number = "
    messageLen equ $- message
    fact db 0
    n db 0
    cif db 0
section .text

readNumber: ; gets the number of which the factorial will be calculated
    mov rax, 0
    mov rdi, 0
    mov rsi, n
    mov rdx, 1
    syscall
    ret

processFactorial:
    cmp bl, 1
    jg calculateFactorial
    mov ax, 1
    ret

calculateFactorial:
    dec bl
    call processFactorial
    inc bl
    mul bl
    ret

printDigit:
    mov rax, 1
    mov rdi, 1
    mov rsi, cif
    mov rdx, 1
    syscall
    ret

printNumber:
    mov al, [n]
    mov ah, 0
    mov r8b, 10
    div r8b
    add ah, '0'
    mov [cif], ah
    push ax
    call printDigit
    pop ax
    mov [n], al
    cmp al, 0
    ja printNumber
    ret 

main: 
    call readNumber
    mov bx, [n]
    sub bx, '0'
    call processFactorial
    mov [n], ax
    ;call printNumber
    ;mov al, [fact]
    ;mov [n], al
    call printNumber

    ; exiting the program
    mov rax, 60
    xor rdi, rdi
    syscall