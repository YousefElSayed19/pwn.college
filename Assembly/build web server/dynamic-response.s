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
    xor rsi, rsi
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

    # Request buffer
    sub rsp, 1024
    mov r14, rsp

    # read(client_fd, request, 1024)
    mov rdi, r13
    mov rsi, r14
    mov rdx, 1024
    xor rax, rax
    syscall

    # Path starts after "GET "
    lea r15, [r14 + 4]

    # Find space after path
    mov rbx, r15

find_end:
    cmp byte ptr [rbx], 32
    je found_end
    inc rbx
    jmp find_end

found_end:
    mov byte ptr [rbx], 0

    # open(path, O_RDONLY, 0)
    mov rdi, r15
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 2
    syscall

    # Save file fd
    mov r12, rax

    # Read file
    mov rdi, r12
    mov rsi, r14
    mov rdx, 1024
    xor rax, rax
    syscall

    # Save file size
    mov rbx, rax

    # Close file FIRST
    mov rdi, r12
    mov rax, 3
    syscall

    # write(client, "HTTP/1.0 200 OK\r\n\r\n", 19)
    mov rdi, r13
    lea rsi, [rip + response]
    mov rdx, 19
    mov rax, 1
    syscall

    # write(client, file_content, file_size)
    mov rdi, r13
    mov rsi, r14
    mov rdx, rbx
    mov rax, 1
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

response:
    .ascii "HTTP/1.0 200 OK\r\n\r\n"