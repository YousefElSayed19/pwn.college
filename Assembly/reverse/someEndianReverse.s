@  use objdump -d -M intel /challenge/reverse-me


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

@ -----------------------------------------------------------------------



0000000000401000 <_start>:
    401000:       48 8b 7c 24 10          mov    rdi,QWORD PTR [rsp+0x10]
    401005:       8b 07                   mov    eax,DWORD PTR [rdi]
    401007:       3d 71 77 46 49          cmp    eax,0x49467771
    40100c:       0f 85 80 00 00 00       jne    401092 <fail>
    401012:       8b 47 04                mov    eax,DWORD PTR [rdi+0x4]
    401015:       3d 6a 4a 49 57          cmp    eax,0x57494a6a
    40101a:       75 76                   jne    401092 <fail>
    40101c:       8b 47 08                mov    eax,DWORD PTR [rdi+0x8]
    40101f:       3d 71 4b 6a 78          cmp    eax,0x786a4b71
    401024:       75 6c                   jne    401092 <fail>
    401026:       8b 47 0c                mov    eax,DWORD PTR [rdi+0xc]
    401029:       3d 4e 30 63 41          cmp    eax,0x4163304e
    40102e:       75 62                   jne    401092 <fail>
    401030:       c6 04 24 2f             mov    BYTE PTR [rsp],0x2f
    401034:       c6 44 24 01 66          mov    BYTE PTR [rsp+0x1],0x66
    401039:       c6 44 24 02 6c          mov    BYTE PTR [rsp+0x2],0x6c
    40103e:       c6 44 24 03 61          mov    BYTE PTR [rsp+0x3],0x61
    401043:       c6 44 24 04 67          mov    BYTE PTR [rsp+0x4],0x67
    401048:       c6 44 24 05 00          mov    BYTE PTR [rsp+0x5],0x0
    40104d:       48 89 e7                mov    rdi,rsp
    401050:       48 c7 c6 00 00 00 00    mov    rsi,0x0
    401057:       48 c7 c0 02 00 00 00    mov    rax,0x2
    40105e:       0f 05                   syscall
    401060:       48 89 c7                mov    rdi,rax
    401063:       48 89 e6                mov    rsi,rsp
    401066:       48 c7 c2 00 01 00 00    mov    rdx,0x100
    40106d:       48 c7 c0 00 00 00 00    mov    rax,0x0
    401074:       0f 05                   syscall
    401076:       48 89 c2                mov    rdx,rax
    401079:       48 c7 c7 01 00 00 00    mov    rdi,0x1
    401080:       48 c7 c0 01 00 00 00    mov    rax,0x1
    401087:       0f 05                   syscall
    401089:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    401090:       0f 05                   syscall

0000000000401092 <fail>:
    401092:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    401099:       0f 05                   syscall


@ 1. First dword
@ cmp eax, 0x49467771

@ Bytes:
@ 49 46 77 71

@ Reverse:
@ 71 77 46 49

@ ASCII:
@ qwFI


@ 2. Second dword
@ cmp eax, 0x57494a6a

@ Bytes:
@ 57 49 4a 6a

@ Reverse:
@ 6a 4a 49 57

@ ASCII:
@ jJIW


@ 3. Third dword
@ cmp eax, 0x786a4b71

@ Bytes:
@ 78 6a 4b 71

@ Reverse:
@ 71 4b 6a 78

@ ASCII:
@ qKjx


@ 4. Fourth dword
@ cmp eax, 0x4163304e

@ Bytes:
@ 41 63 30 4e

@ Reverse:
@ 4e 30 63 41

@ ASCII:
@ N0cA


@ Password:
@ then password is qwFIjJIWqKjxN0cA

@ --------------------------------------------------------

Disassembly of section .text:

0000000000401000 <_start>:
    401000:       48 8b 7c 24 10          mov    rdi,QWORD PTR [rsp+0x10]
    401005:       66 8b 07                mov    ax,WORD PTR [rdi]
    401008:       66 3d 35 7a             cmp    ax,0x7a35
    40100c:       0f 85 b8 00 00 00       jne    4010ca <fail>
    401012:       66 8b 47 02             mov    ax,WORD PTR [rdi+0x2]
    401016:       66 3d 59 47             cmp    ax,0x4759
    40101a:       0f 85 aa 00 00 00       jne    4010ca <fail>
    401020:       66 8b 47 04             mov    ax,WORD PTR [rdi+0x4]
    401024:       66 3d 38 72             cmp    ax,0x7238
    401028:       0f 85 9c 00 00 00       jne    4010ca <fail>
    40102e:       66 8b 47 06             mov    ax,WORD PTR [rdi+0x6]
    401032:       66 3d 34 70             cmp    ax,0x7034
    401036:       0f 85 8e 00 00 00       jne    4010ca <fail>
    40103c:       66 8b 47 08             mov    ax,WORD PTR [rdi+0x8]
    401040:       66 3d 74 42             cmp    ax,0x4274
    401044:       0f 85 80 00 00 00       jne    4010ca <fail>
    40104a:       66 8b 47 0a             mov    ax,WORD PTR [rdi+0xa]
    40104e:       66 3d 6d 43             cmp    ax,0x436d
    401052:       75 76                   jne    4010ca <fail>
    401054:       66 8b 47 0c             mov    ax,WORD PTR [rdi+0xc]
    401058:       66 3d 75 6f             cmp    ax,0x6f75
    40105c:       75 6c                   jne    4010ca <fail>
    40105e:       66 8b 47 0e             mov    ax,WORD PTR [rdi+0xe]
    401062:       66 3d 67 73             cmp    ax,0x7367
    401066:       75 62                   jne    4010ca <fail>
    401068:       c6 04 24 2f             mov    BYTE PTR [rsp],0x2f
    40106c:       c6 44 24 01 66          mov    BYTE PTR [rsp+0x1],0x66
    401071:       c6 44 24 02 6c          mov    BYTE PTR [rsp+0x2],0x6c
    401076:       c6 44 24 03 61          mov    BYTE PTR [rsp+0x3],0x61
    40107b:       c6 44 24 04 67          mov    BYTE PTR [rsp+0x4],0x67
    401080:       c6 44 24 05 00          mov    BYTE PTR [rsp+0x5],0x0
    401085:       48 89 e7                mov    rdi,rsp
    401088:       48 c7 c6 00 00 00 00    mov    rsi,0x0
    40108f:       48 c7 c0 02 00 00 00    mov    rax,0x2
    401096:       0f 05                   syscall
    401098:       48 89 c7                mov    rdi,rax
    40109b:       48 89 e6                mov    rsi,rsp
    40109e:       48 c7 c2 00 01 00 00    mov    rdx,0x100
    4010a5:       48 c7 c0 00 00 00 00    mov    rax,0x0
    4010ac:       0f 05                   syscall
    4010ae:       48 89 c2                mov    rdx,rax
    4010b1:       48 c7 c7 01 00 00 00    mov    rdi,0x1
    4010b8:       48 c7 c0 01 00 00 00    mov    rax,0x1
    4010bf:       0f 05                   syscall
    4010c1:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    4010c8:       0f 05                   syscall

00000000004010ca <fail>:
    4010ca:       48 c7 c0 3c 00 00 00    mov    rax,0x3c
    4010d1:       0f 05                   syscall



@     1. First word
@ cmp ax, 0x7a35

@ Bytes:
@ 7a 35

@ Reverse:
@ 35 7a

@ ASCII:
@ 5z


@ 2. Second word
@ cmp ax, 0x4759

@ Bytes:
@ 47 59

@ Reverse:
@ 59 47

@ ASCII:
@ YG


@ 3. Third word
@ cmp ax, 0x7238

@ Bytes:
@ 72 38

@ Reverse:
@ 38 72

@ ASCII:
@ 8r


@ 4. Fourth word
@ cmp ax, 0x7034

@ Bytes:
@ 70 34

@ Reverse:
@ 34 70

@ ASCII:
@ 4p


@ 5. Fifth word
@ cmp ax, 0x4274

@ Bytes:
@ 42 74

@ Reverse:
@ 74 42

@ ASCII:
@ tB


@ 6. Sixth word
@ cmp ax, 0x436d

@ Bytes:
@ 43 6d

@ Reverse:
@ 6d 43

@ ASCII:
@ mC


@ 7. Seventh word
@ cmp ax, 0x6f75

@ Bytes:
@ 6f 75

@ Reverse:
@ 75 6f

@ ASCII:
@ uo


@ 8. Eighth word
@ cmp ax, 0x7367

@ Bytes:
@ 73 67

@ Reverse:
@ 67 73

@ ASCII:
@ gs


@ Password:
@ 5zYG8r4ptBmCuogs