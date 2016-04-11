section .data

  start: db 'Starting server.',10
  start_len: equ $-start

  SYS_EXIT:  equ 1
  SYS_WRITE: equ 4
  SYS_SEND:  equ 9
  AF_INET:   equ 2
  SYS_RECV:  equ 10
  SYS_SOKET: equ 1

  SOCK_PROTO:     equ 0
  SYS_CONNECT:    equ 3
  SOCK_STREAM:    equ 1
  SYS_SOCKETCALL: equ 102

  port: equ '1030'
  ip:   dq '0x7F000001' ;127.0.0.1

section .text

  global _start
    _start:

      mov eax, 4
      mov ebx, 1
      mov ecx, start
      mov edx, start_len
      int 80h

      ;No need to exit here.
      ;mov eax, SYS_EXIT
      ;mov ebx, 0 ;Exit code of 0(No error).
      ;int 80h    ;Call Kernel

      push ebp
      mov  ebp, esp
      sub  esp, 14

      ;socket
      mov  [ebp -  4], dword AF_INET
      mov  [ebp -  8], dword SOCK_STREAM
      mov  [ebp - 12], dword SOCK_PROTO
      mov  [ebp - 14], dword SYS_SOCKETCALL
      int 80h
      ret

      ;bind


      ;accept


      ;loop


      ;receive


      ;send


      ;closefd


