global main

section .data
    message db "Factorial of the read digit is: "
    messageLen equ $- message
    n dd 0
    digit db 0
    space db ' '
section .text

readNumber: ; gets the digit of which the factorial will be calculated
    mov rax, 0
    mov rdi, 0
    mov rsi, n
    mov rdx, 1
    syscall
    ret


printMessage:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, messageLen
    syscall
    ret


processFactorial: ; processes the calls of the calculateFactorial function
    cmp bx, 1
    jg calculateFactorial
    mov ax, 1
    ret


calculateFactorial: ; calculates the factorial of the digit entered via the keyboard
    dec bx
    call processFactorial
    inc bx
    mul bx
    ret


printDigit: ; prints a single digit of the result
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 1
    syscall
    ret


processPrintNumber: ; processes the calls for the printNumber function
    cmp eax, 0
    jg printNumberRecursive
    ret


printNumberRecursive: ; recursively prints the digits of the calculated factorial value
    mov eax, [n]
    mov dx, 0
    mov r8d, 10
    div r8d
    mov [n], eax
    push dx
    call processPrintNumber
    pop dx
    add dx, '0'
    mov [digit], dx
    call printDigit
    ret


main: ; default main function
    call readNumber
    xor rdx, rdx
    mov bx, [n]
    sub bx, '0'
    call processFactorial
    mov [n], ax
    mov [n + 2], dx
    call printMessage
    call processPrintNumber

    mov rax, 60
    xor rdi, rdi
    syscall