.intel_syntax noprefix
.global _start

_start:
    mov rax, [rsp]
    cmp rax, 42
    setz dil

    mov rax, 60
    syscall