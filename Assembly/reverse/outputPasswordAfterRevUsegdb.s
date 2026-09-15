@ after open program by gdb reverse_me
@ and start and disassemble _start
@ i found 
0x0000000000401000 <+0>: mov 0x10(%rsp),%rcx 
0x0000000000401005 <+5>: xor %eax,%eax 
x0000000000401007 <+7>: mov (%rcx),%al 
0x0000000000401009 <+9>: mov 0x401088(,%rax,8),%rax 
0x0000000000401011 <+17>: jmp *%rax

@ and just write x/256a 0x401088 to show the table of address

@ 0x401238 → fail
@ 0x401240 → success

@ entry = 8 bytes.


@ 0x401240
@ 0x401240 - 0x401088
@ = 0x1b8
@ 0x1b8 / 8 = 55

@ 55 ASCII :

@ 55 = '7'