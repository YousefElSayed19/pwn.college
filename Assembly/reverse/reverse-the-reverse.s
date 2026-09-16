CODE:
.intel_syntax noprefix
.global _start

_start:
    mov rax, rsp
    mov al, byte ptr [rax]
    sub al, 0x19
    cmp al, 0x29
    jne fail

    mov rdi, 0
    mov rax, 60
    syscall

fail:
    mov rdi, 1
    mov rax, 60
    syscall


REVERSE:
input - 0x19 = 0x29

input = 0x29 + 0x19
      = 0x42

0x42 = 'B'


VALUE:
B


RESULT:
B