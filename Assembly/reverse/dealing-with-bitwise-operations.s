CODE:
.intel_syntax noprefix
.global _start

_start:
    mov rax, rsp
    mov al, byte ptr [rax]
    xor al, 0xA7
    cmp al, 0x97
    jne fail

    mov rdi, 0
    mov rax, 60
    syscall

fail:
    mov rdi, 1
    mov rax, 60
    syscall


REVERSE:
input XOR 0xA7 = 0x97

input = 0x97 XOR 0xA7
      = 0x30

0x30 = '0'


VALUE:
0


RESULT:
0