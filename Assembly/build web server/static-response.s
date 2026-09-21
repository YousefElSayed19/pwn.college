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

    # Save listening socket fd
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

    # accept(sockfd, NULL, NULL)
    mov rsi, 0
    mov rdx, 0
    mov rax, 43
    syscall

    # Save client fd
    mov rdi, rax

    # read(client_fd, buffer, 1024)
    sub rsp, 1024
    mov rsi, rsp
    mov rdx, 1024
    mov rax, 0
    syscall

    # write(client_fd, response, 19)
    mov rdi, rdi
    lea rsi, [rip + response]
    mov rdx, 19
    mov rax, 1
    syscall

    # close(client_fd)
    mov rax, 3
    syscall

    # exit(0)
    mov rdi, 0
    mov rax, 60
    syscall

.section .data

response:
    .ascii "HTTP/1.0 200 OK\r\n\r\n"