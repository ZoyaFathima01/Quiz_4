section .text
    global _start

_start:
    mov eax, 7
    mov ebx, 12
    mov ecx, 5

    push ecx
    push ebx
    push eax

    call add_three

    mov [result], eax

    mov eax, 1
    int 0x80

add_three:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    add eax, [ebp+12]
    add eax, [ebp+16]

    pop ebp
    ret

section .bss
    result resd 1
