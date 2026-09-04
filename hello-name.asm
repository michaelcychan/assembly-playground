%define ENDL 10

section .bss
    name resb 31

section .data
    question db "What is your name?", ENDL
    question_len equ $ - question
    answer_start db "Hello, "
    answer_start_len equ $ - answer_start
    answer_end db "!", ENDL
    answer_end_len equ $ - answer_end

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
    mov rsi, name
    mov rdx, 31
    syscall

    mov r12, rax
    sub r12, 1 ; remove the new line character from r12 - name

    ; reply a constructed name
    mov rax, 1
    mov rdi, 1
    mov rsi, answer_start
    mov rdx, answer_start_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, r12
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, answer_end
    mov rdx, answer_end_len
    syscall

    

    ; sys_exit with exit code 0
    mov rax, 60
    mov rdi, 0
    syscall