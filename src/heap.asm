global _start
section .text
_start:
    mov eax, 12
    xor edi, edi
    syscall
    mov r12, rax
    lea rdi, [rax + 4096]
    mov eax, 12
    syscall
    ; Linux brk returns the current break on failure, not the requested address.
    cmp rax, rdi
    jne .failure
    mov byte [r12], 'H'
    mov byte [r12+1], 'E'
    mov byte [r12+2], 'A'
    mov byte [r12+3], 'P'
    mov byte [r12+4], ' '
    mov byte [r12+5], 'O'
    mov byte [r12+6], 'K'
    mov byte [r12+7], 10
    mov eax, 1
    mov edi, 1
    mov rsi, r12
    mov edx, 8
    syscall
    xor edi, edi
    jmp .exit
.failure:
    mov edi, 1
.exit:
    mov eax, 60
    syscall
