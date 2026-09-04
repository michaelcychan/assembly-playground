%define ENDL 10

section .data
    message db "Hello, assembly!", ENDL
    length equ $ - message

section .text
    global _start

_start:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, message    ; address of string
    mov rdx, length     ; number of bytes
    syscall

    ; sys_exit with exit code 0
    mov rax, 60
    mov rdi, 0
    syscall