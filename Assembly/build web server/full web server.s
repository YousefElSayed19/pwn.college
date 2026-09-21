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

    # listening socket
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

    # accept
    mov rdi, r12
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 43
    syscall

    # client socket
    mov r13, rax

    # fork
    mov rax, 57
    syscall

    # child
    cmp rax, 0
    je child

    # parent closes client
    mov rdi, r13
    mov rax, 3
    syscall

    # parent accepts next connection
    jmp request_loop


child:

    # close listening socket
    mov rdi, r12
    mov rax, 3
    syscall

    # request buffer
    sub rsp, 4096
    mov r14, rsp

    # read(client, buffer, 4096)
    mov rdi, r13
    mov rsi, r14
    mov rdx, 4096
    xor rax, rax
    syscall

    # save total request length
    mov r9, rax

    # Check first byte: G or P
    cmp byte ptr [r14], 'G'
    je handle_get

    cmp byte ptr [r14], 'P'
    je handle_post

    # Unknown request
    jmp child_exit


# ============================================================
# GET
# ============================================================

handle_get:

    # GET /path HTTP/1.1
    # path starts at buffer + 4
    lea r15, [r14 + 4]

    mov rbx, r15

find_get_path_end:
    cmp byte ptr [rbx], 32
    je get_path_end

    inc rbx
    jmp find_get_path_end


get_path_end:

    # null terminate path
    mov byte ptr [rbx], 0

    # open(path, O_RDONLY, 0)
    mov rdi, r15
    xor rsi, rsi
    xor rdx, rdx
    mov rax, 2
    syscall

    # file fd
    mov r8, rax

    # read(file, buffer, 4096)
    mov rdi, r8
    mov rsi, r14
    mov rdx, 4096
    xor rax, rax
    syscall

    # save file size
    mov r9, rax

    # close file
    mov rdi, r8
    mov rax, 3
    syscall

    # HTTP 200 response
    mov rdi, r13
    lea rsi, [rip + response]
    mov rdx, 19
    mov rax, 1
    syscall

    # write file contents
    mov rdi, r13
    mov rsi, r14
    mov rdx, r9
    mov rax, 1
    syscall

    jmp child_close


# ============================================================
# POST
# ============================================================

handle_post:

    # POST /path HTTP/1.1
    # path starts at buffer + 5
    lea r15, [r14 + 5]

    mov rbx, r15

find_post_path_end:
    cmp byte ptr [rbx], 32
    je post_path_end

    inc rbx
    jmp find_post_path_end


post_path_end:

    # null terminate path
    mov byte ptr [rbx], 0

    # Find \r\n\r\n
    mov rbx, r14

find_header_end:
    cmp byte ptr [rbx], 13
    jne next_header_byte

    cmp byte ptr [rbx + 1], 10
    jne next_header_byte

    cmp byte ptr [rbx + 2], 13
    jne next_header_byte

    cmp byte ptr [rbx + 3], 10
    je post_header_found

next_header_byte:
    inc rbx
    jmp find_header_end


post_header_found:

    # body starts after \r\n\r\n
    lea r8, [rbx + 4]

    # body_length =
    # total_request_length - (body_start - buffer)

    mov r10, r8
    sub r10, r14
    sub r9, r10

    # open(path, O_WRONLY | O_CREAT, 0777)
    mov rdi, r15
    mov rsi, 65
    mov rdx, 511
    mov rax, 2
    syscall

    # file fd
    mov r10, rax

    # write(file, body, body_length)
    mov rdi, r10
    mov rsi, r8
    mov rdx, r9
    mov rax, 1
    syscall

    # close file
    mov rdi, r10
    mov rax, 3
    syscall

    # HTTP 200 response
    mov rdi, r13
    lea rsi, [rip + response]
    mov rdx, 19
    mov rax, 1
    syscall


# ============================================================
# Close client
# ============================================================

child_close:

    # close(client)
    mov rdi, r13
    mov rax, 3
    syscall


child_exit:

    # exit(0)
    xor rdi, rdi
    mov rax, 60
    syscall


.section .data

response:
    .ascii "HTTP/1.0 200 OK\r\n\r\n"
    