CODE:
.intel_syntax noprefix
.global _start

_start:
    mov rax, rsp
    mov al, byte ptr [rax]
    add al, 0x12
    cmp al, 0x61
    jne fail

    mov rdi, 0
    mov rax, 60
    syscall

fail:
    mov rdi, 1
    mov rax, 60
    syscall


REVERSE:
input + 0x12 = 0x61

input = 0x61 - 0x12
      = 0x4F

0x4F = 'O'


VALUE:
O


RESULT:
O