.intel_syntax noprefix

MAIN:
        mov rax, [rsp+16]
        cmp BYTE PTR [rax], 'p'
        jne FAIL

SUCCESS:
        mov rdi, 0
        mov rax, 60
        syscall

FAIL:
        mov rdi, 1
        mov rax, 60
        syscall