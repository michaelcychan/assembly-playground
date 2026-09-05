%define ENDL 10

section .bss
    target resb 5
    output resb 2

section .data
    question db "What is your target number? "
    question_len equ $ - question

section .text
    global _start

_start:
    ; sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, question
    mov rdx, question_len
    syscall

    ; sys_read
    mov rax, 0
    mov rdi, 0
    mov rsi, target
    mov rdx, 5
    syscall

    mov r12, rax
    sub r12, 1 ; remove the new line character from r12 - target
    movzx r14, byte [target]
    sub r14, '0'

    ; loop
    mov r13, 0

loop_start:

    mov byte [output], r13b
    add byte [output], '0'
    mov byte [output + 1], ENDL

    mov rax, 1
    mov rdi, 1
    mov rsi, output
    mov rdx, 2
    syscall

    inc r13
    cmp r13, r14
    jle loop_start
    

    ; sys_exit with exit code 0
    mov rax, 60
    mov rdi, 0
    syscall