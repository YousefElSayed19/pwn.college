.intel_syntax noprefix
.globl _start

.section .text

_start:
    # socket(AF_INET, SOCK_STREAM, 0)
    mov rdi, 2
    mov rsi, 1
    xor rdx, rdx
    mov rax, 41
    syscall

    # Save listening socket
    mov r12, rax

    # sockaddr_in
    sub rsp, 16
    mov word ptr [rsp], 2
    mov word ptr [rsp + 2], 0x5000
    mov qword ptr [rsp + 4], 0

    # bind
    mov rdi, r12
    mov rsi, rsp
    mov rdx, 16
    mov rax, 49
    syscall

    # listen
    mov rdi, r12
    xor rsi, rsi
    mov rax, 50
    syscall


request_loop:

    # accept(listening_socket, NULL, NULL)
    mov rdi, r12
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 43
    syscall

    # Save client socket
    mov r13, rax

    # Allocate request/file buffer
    sub rsp, 1024
    mov r14, rsp

    # read(client_socket, buffer, 1024)
    mov rdi, r13
    mov rsi, r14
    mov rdx, 1024
    xor rax, rax
    syscall

    # GET /path HTTP/1.1
    # Path starts at buffer + 4
    lea r15, [r14 + 4]
    mov rbx, r15

find_end:
    cmp byte ptr [rbx], 32
    je found_end
    inc rbx
    jmp find_end

found_end:
    # Null terminate path
    mov byte ptr [rbx], 0

    # open(path, O_RDONLY, 0)
    mov rdi, r15
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 2
    syscall

    # Save file descriptor
    mov r8, rax

    # read(file_fd, buffer, 1024)
    mov rdi, r8
    mov rsi, r14
    mov rdx, 1024
    xor rax, rax
    syscall

    # Save file size
    mov r9, rax

    # close(file_fd)
    mov rdi, r8
    mov rax, 3
    syscall

    # write(client_socket, HTTP header, 19)
    mov rdi, r13
    lea rsi, [rip + response]
    mov rdx, 19
    mov rax, 1
    syscall

    # write(client_socket, file_content, file_size)
    mov rdi, r13
    mov rsi, r14
    mov rdx, r9
    mov rax, 1
    syscall

    # close(client_socket)
    mov rdi, r13
    mov rax, 3
    syscall

    # Free request buffer
    add rsp, 1024

    # Accept next client
    jmp request_loop


.section .data

response:
    .ascii "HTTP/1.0 200 OK\r\n\r\n"