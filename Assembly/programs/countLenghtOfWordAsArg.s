.intel_syntax noprefix

MAIN:
    mov rsi, [rsp+16]
    xor rdi, rdi

loop:
    cmp BYTE PTR [rsi], 0
    je done
    inc rdi
    inc rsi
    jmp loop

done:
    mov rax, 60
    syscall