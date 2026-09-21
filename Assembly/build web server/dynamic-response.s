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

    # Save listening socket
    mov r12, rax

    # sockaddr_in
    sub rsp, 16

    mov word ptr [rsp], 2
    mov word ptr [rsp+2], 0x5000
    mov qword ptr [rsp+4], 0

    # bind(sockfd, sockaddr, 16)
    mov rdi, r12
    mov rsi, rsp
    mov rdx, 16
    mov rax, 49
    syscall

    # listen(sockfd, 0)
    mov rdi, r12
    mov rsi, 0
    mov rax, 50
    syscall

    # accept(sockfd, NULL, NULL)
    mov rdi, r12
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 43
    syscall

    # Save client socket
    mov r13, rax

    # Buffer for HTTP request
    sub rsp, 1024
    mov r14, rsp

    # read(client_fd, buffer, 1024)
    mov rdi, r13
    mov rsi, r14
    mov rdx, 1024
    xor rax, rax
    syscall

    # HTTP request:
    # GET /path HTTP/1.0
    #
    # Path starts at buffer + 4
    lea r15, [r14 + 4]

    # Find the space after the path
    mov rbx, r15

find_end:
    cmp byte ptr [rbx], 32
    je found_end

    inc rbx
    jmp find_end

found_end:
    # Null terminate the path
    mov byte ptr [rbx], 0

    # open(path, O_RDONLY, 0)
    mov rdi, r15
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 2
    syscall

    # Save file descriptor
    mov r12, rax

    # Read file into buffer
    mov rdi, r12
    mov rsi, r14
    mov rdx, 1024
    xor rax, rax
    syscall

    # Save number of bytes read
    mov rbx, rax

    # write(client_fd, buffer, bytes_read)
    mov rdi, r13
    mov rsi, r14
    mov rdx, rbx
    mov rax, 1
    syscall

    # close(file)
    mov rdi, r12
    mov rax, 3
    syscall

    # close(client)
    mov rdi, r13
    mov rax, 3
    syscall

    # exit(0)
    xor rdi, rdi
    mov rax, 60
    syscall

.section .data