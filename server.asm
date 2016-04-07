section .data
  start: db 'Starting server.',10
  start_len: equ $-start

  ip:   equ '0x7F000001' ;127.0.0.1
  port: equ '1030'

  SYS_EXIT:  equ 1
  SYS_WRITE: equ 4
  SYS_SEND:  equ 9
  AF_INET:   equ 2
  SYS_RECV:  equ 10
  SYS_SOKET: equ 1
  SYS_CONNECT:    equ 3
  SOCK_STREAM:    equ 1
  SYS_SOCKETCALL: equ 102

section .text

  global _start
    _start:

      mov eax, 4
      mov ebx, 1
      mov ecx, start
      mov edx, start_len
      int 80h

      mov eax, 1
      mov ebx, 0
      int 80h

    ;socket


    ;bind


    ;accept

    ;loop

    ;receive


    ;send

    ;closefd
