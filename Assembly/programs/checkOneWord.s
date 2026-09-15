.intel_syntax noprefix

mov rax, [rsp+16]
cmp BYTE PTR [rax], 'p'
setz dil

mov rax, 60
syscall