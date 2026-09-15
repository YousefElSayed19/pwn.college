.intel_syntax noprefix
.global _start

MAIN:
    mov rax, [rsp+16]

    cmp BYTE PTR [rax], 'p'
    jne FAIL

    cmp BYTE PTR [rax+1], 'w'
    jne FAIL

    cmp BYTE PTR [rax+2], 'n'
    jne FAIL

SUCCESS:
    mov rdi, 1
    mov rax, 60
    syscall

FAIL:
    mov rdi, 0
    mov rax, 60
    syscall