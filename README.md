Generating the asm equivelant from a c program:
gcc -S -masm=intel program.c

^^ If you do not specify intel it will default to at&t syntax.

How to build 32 bit code on a 64 bit machine:

nasm -f elf32 hello_world.asm
gcc -m32 hello_world.o -o hello_world
