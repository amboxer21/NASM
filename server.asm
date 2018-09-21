bits 32
global main
section .data

    start: db 'Starting server.',10
    start_len: equ $-start

    SYS_BIND:   equ 49

    SYS_EXIT:   equ 1
    SYS_WRITE:  equ 4
    SYS_SEND:   equ 9
    AF_INET:    equ 2
    SYS_RECV:   equ 10
    SYS_SOCKET: equ 1

    SOCK_PROTO:     equ 6
    SYS_CONNECT:    equ 3
    SOCK_STREAM:    equ 1
    SYS_SOCKETCALL: equ 102

section .bss
    socket_address: resd 2
    port: word 0x8813 ;port 5000
    ip: dword 0x00000000 ;ip 0.0.0.0

section .text

    ;starting server message
    starting_server_message:
        mov edx, start_len
        mov ecx, start
        mov ebx, 1
        mov eax, 4
        int 80h

    ;void exit(int status)
    exit:
        mov ebx, 0 ;Exit code of 0(No error).
        mov eax, SYS_EXIT
        int 80h

    ;int socket(int family, int type, int protocol)
    socket:
        push ebp
        mov ebp, esp
        sub esp, 16

        ; you access arguments with a positive offset, and variables with a negative offset
        mov [ebp - 12], dword AF_INET ;dword is 4 bytes
        mov [ebp -  8], dword SOCK_STREAM
        mov [ebp -  4], dword SOCK_PROTO
        mov eax, 102
        mov ebx, 1
        lea ecx, [ebp-12]
        int 80h

        mov esp, ebp
        pop ebp
        ret

    ;int bind(int fd, struct sockaddr * sockaddr, int addrlen)
    ;bind:
        
    ;accept:


    ;loop:


    ;receive:


    ;send:


    ;closefd:

    main:

        call starting_server_message

        call socket
