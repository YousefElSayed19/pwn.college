.intel_syntax noprefix
.global solve

solve:
    mov rdx, rsi
    mov rsi, rdi
    mov rdi, 1
    mov rax, 1
    syscall

    mov rdi, 0
    mov rax, 60
    syscall