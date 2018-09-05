bits 32
global main
section .text
  _MyFunction1:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov edx, [ebp + 12]
    add eax, edx
    pop ebp
    ret

  main:
    push 3
    push 2
    call _MyFunction1
    add esp, 8
