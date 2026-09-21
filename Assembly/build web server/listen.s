.intel_syntax noprefix
.globl _start

.section .text

_start:
    # socket(AF_INET, SOCK_STREAM, 0)
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    mov rax, 41
    syscall

    # Save socket fd
    mov rdi, rax

    # sockaddr_in
    sub rsp, 16

    mov word ptr [rsp], 0x0002
    mov word ptr [rsp+2], 0x5000
    mov qword ptr [rsp+4], 0

    # bind(sockfd, sockaddr, 16)
    mov rsi, rsp
    mov rdx, 16
    mov rax, 49
    syscall

    # listen(sockfd, 0)
    mov rsi, 0
    mov rax, 50
    syscall

    # exit(0)
    mov rdi, 0
    mov rax, 60
    syscall

.section .data