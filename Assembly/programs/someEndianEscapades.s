.intel_syntax noprefix
.global solve

solve:
    movsx rax, BYTE PTR [rdi]
    ret

@ -----------------------------------------

ubuntu@endian-escapades~little-endian-bytes:~$ objdump -d -M intel /challenge/reverse-me

/challenge/reverse-me:     file format elf64-x86-64


Disassembly of section .text:

0000000000401000 <_start>:
    401000:       48 8b 7c 24 10          mov    rdi,QWORD PTR [rsp+0x10]
    401005:       48 bb 6c 67 6c 34 43    movabs rbx,0x39746f43346c676c
    40100c:       6f 74 39 
    40100f:       48 8b 07                mov    rax,QWORD PTR [rdi]
    401012:       48 39 d8                cmp    rax,rbx
    401015:       75 62                   jne    401079 <fail>
    401017:       c6 04 24 2f             mov    BYTE PTR [rsp],0x2f
    40101b:       c6 44 24 01 66          mov    BYTE PTR [rsp+0x1],0x66
    401020:       c6 44 24 02 6c          mov    BYTE PTR [rsp+0x2],0x6c
    401025:       c6 44 24 03 61          mov    BYTE PTR [rsp+0x3],0x61
    40102a:       c6 44 24 04 67          mov    BYTE PTR [rsp+0x4],0x67
    40102f:       c6 44 24 05 00          mov    BYTE PTR [rsp+0x5],0x0
    401034:       48 89 e7                mov    rdi,rsp
    401037:       48 c7 c6 00 00 00 00    mov    rsi,0x0
    40103e:       48 c7 c0 02 00 00 00    mov    rax,0x2
    401045:       0f 05                   syscall
    401047:       48 89 c7                mov    rdi,rax
    40104a:       48 89 e6                mov    rsi,rsp
    40104d:       48 c7 c2 00 01 00 00    mov    rdx,0x100
    401054:       48 c7 c0 00 00 00 00    mov    rax,0x0
    40105b:       0f 05                   syscall
    40105d:       48 89 c2                mov    rdx,rax
    401060:       48 c7 c7 01 00 00 00    mov    rdi,0x1
    401067:       48 c7 c0 01 00 00 00    mov    rax,0x1
    40106e:       0f 05                   syscall
    401070:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    401077:       0f 05                   syscall

0000000000401079 <fail>:
    401079:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    401080:       0f 05                   syscall
    

@ 6c = l
@ 67 = g
@ 6c = l
@ 34 = 4
@ 43 = C
@ 6f = o
@ 74 = t
@ 39 = 9

@ then password is lgl4Cot9


@ ----------------------------------------------------------------


ubuntu@endian-escapades~qword-by-qword:~$ objdump -d -M intel /challenge/reverse-me

/challenge/reverse-me:     file format elf64-x86-64


Disassembly of section .text:

0000000000401000 <_start>:
    401000:       48 8b 7c 24 10          mov    rdi,QWORD PTR [rsp+0x10]
    401005:       48 bb 79 4e 78 67 46    movabs rbx,0x4332434667784e79
    40100c:       43 32 43 
    40100f:       48 8b 07                mov    rax,QWORD PTR [rdi]
    401012:       48 39 d8                cmp    rax,rbx
    401015:       75 75                   jne    40108c <fail>
    401017:       48 bb 41 37 59 73 45    movabs rbx,0x786a6a4573593741
    40101e:       6a 6a 78 
    401021:       48 8b 47 08             mov    rax,QWORD PTR [rdi+0x8]
    401025:       48 39 d8                cmp    rax,rbx
    401028:       75 62                   jne    40108c <fail>
    40102a:       c6 04 24 2f             mov    BYTE PTR [rsp],0x2f
    40102e:       c6 44 24 01 66          mov    BYTE PTR [rsp+0x1],0x66
    401033:       c6 44 24 02 6c          mov    BYTE PTR [rsp+0x2],0x6c
    401038:       c6 44 24 03 61          mov    BYTE PTR [rsp+0x3],0x61
    40103d:       c6 44 24 04 67          mov    BYTE PTR [rsp+0x4],0x67
    401042:       c6 44 24 05 00          mov    BYTE PTR [rsp+0x5],0x0
    401047:       48 89 e7                mov    rdi,rsp
    40104a:       48 c7 c6 00 00 00 00    mov    rsi,0x0
    401051:       48 c7 c0 02 00 00 00    mov    rax,0x2
    401058:       0f 05                   syscall
    40105a:       48 89 c7                mov    rdi,rax
    40105d:       48 89 e6                mov    rsi,rsp
    401060:       48 c7 c2 00 01 00 00    mov    rdx,0x100
    401067:       48 c7 c0 00 00 00 00    mov    rax,0x0
    40106e:       0f 05                   syscall
    401070:       48 89 c2                mov    rdx,rax
    401073:       48 c7 c7 01 00 00 00    mov    rdi,0x1
    40107a:       48 c7 c0 01 00 00 00    mov    rax,0x1
    401081:       0f 05                   syscall
    401083:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    40108a:       0f 05                   syscall

000000000040108c <fail>:
    40108c:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    401093:       0f 05                   syscall

@ movabs rbx, 0x4332434667784e79


@ 43 32 43 46 67 78 4e 79


@ 79 4e 78 67 46 43 32 43

@ ASCII:

@ yNxgFC2C
@ movabs rbx, 0x786a6a4573593741


@ 78 6a 6a 45 73 59 37 41

@ 41 37 59 73 45 6a 6a 78

@ ASCII:

@ A7YsEjjx
@ yNxgFC2C + A7YsEjjx


@ then password is yNxgFC2CA7YsEjjx