0000000000401000 <_start>:

401000: 48 8b 44 24 10    mov    0x10(%rsp),%rax
401005: 80 38 64          cmpb   $0x64,(%rax)
401008: 75 74             jne    40107e <fail>

40100a: 80 78 01 76       cmpb   $0x76,0x1(%rax)
40100e: 75 6e             jne    40107e <fail>

401010: 80 78 02 70       cmpb   $0x70,0x2(%rax)
401014: 75 68             jne    40107e <fail>

401016: 80 78 03 73       cmpb   $0x73,0x3(%rax)
40101a: 75 62             jne    40107e <fail>

40101c: c6 04 24 2f       movb   $0x2f,(%rsp)
401020: c6 44 24 01 66    movb   $0x66,0x1(%rsp)
401025: c6 44 24 02 6c    movb   $0x6c,0x2(%rsp)
40102a: c6 44 24 03 61    movb   $0x61,0x3(%rsp)
40102f: c6 44 24 04 67    movb   $0x67,0x4(%rsp)
401034: c6 44 24 05 00    movb   $0x0,0x5(%rsp)

401039: 48 89 e7          mov    %rsp,%rdi
40103c: 48 c7 c6 00 00 00 00    mov    $0x0,%rsi
401043: 48 c7 c0 02 00 00 00    mov    $0x2,%rax
40104a: 0f 05             syscall

40104c: 48 89 c7          mov    %rax,%rdi
40104f: 48 89 e6          mov    %rsp,%rsi
401052: 48 c7 c2 40 00 00 00    mov    $0x40,%rdx
401059: 48 c7 c0 00 00 00 00    mov    $0x0,%rax
401060: 0f 05             syscall

401062: 48 89 c2          mov    %rax,%rdx
401065: 48 c7 c7 01 00 00 00    mov    $0x1,%rdi
40106c: 48 c7 c0 01 00 00 00    mov    $0x1,%rax
401073: 0f 05             syscall

401075: 48 c7 c0 3c 00 00 00    mov    $0x3c,%rax
40107c: 0f 05             syscall


000000000040107e <fail>:

40107e: 48 c7 c0 3c 00 00 00    mov    $0x3c,%rax
401085: 0f 05             syscall


@ solve :
@     cmpb $0x64,(%rax)
@     cmpb $0x76,0x1(%rax)
@     cmpb $0x70,0x2(%rax)
@     cmpb $0x73,0x3(%rax)

@     0x64 = d
@     0x76 = v
@     0x70 = p
@     0x73 = s

@ then password is dvps