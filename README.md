Generating the asm equivelant from a c program:
gcc -S -masm=intel program.c

^^ If you do not specify intel it will default to at&t syntax.

How to build 32 bit code on a 64 bit machine:

nasm -f elf32 hello_world.asm
gcc -m32 hello_world.o -o hello_world

To generate a 32 bit intel syntax executable for debugging with gdb:
gcc -S -masm=intel -m32 server.c
gcc -c -m32 server.s
gcc -m32 -o server server.o

Dump c code as asm intrustions:
objdump -Mintel -D bare_server.o
