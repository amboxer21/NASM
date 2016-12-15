Generating the asm equivelant from a c program:
gcc -S -masm=intel program.c

^^ If you do not specify intel it will default to at&t syntax.
