global _start
section .data
    message db "Hello, World! 123", 10
    length equ $ - message
section .text
_start:
    call print
    lea rsi, [rel message]
    mov ecx, length
.next:
    mov al, [rsi]
    cmp al, 'a'
    jb .skip
    cmp al, 'z'
    ja .skip
    sub byte [rsi], 32
.skip:
    inc rsi
    dec ecx
    jnz .next
    call print
    mov eax, 60
    xor edi, edi
    syscall
print:
    mov eax, 1
    mov edi, 1
    lea rsi, [rel message]
    mov edx, length
    syscall
    ret
