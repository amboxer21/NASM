bits 32
global main

section .data
  a: db 'a'
  b: db 'b'
  c: db 'c'
section .bss
section .text
  _test_func:
    push ebp
    mov ebp, esp
    sub esp, 12
    mov eax, [ebp+4]
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    mov esp, ebp
    pop ebp
    ret 12

  main:
    push c
    push b
    push a
    call _test_func
