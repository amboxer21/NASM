bits 32
global main

section .data
  hello: db 'Hello world!'
  h_len equ $-hello

section .text
    main:
      mov eax, 4
      mov ebx, 1
      mov ecx, hello
      mov edx, h_len

      int 80h

      mov eax, 1
      mov ebx, 0
      int 80h


