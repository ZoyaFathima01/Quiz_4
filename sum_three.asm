section .data
    x dq 10         ; First integer
    y dq 15         ; Second integer
    z dq 5          ; Third integer

section .text
    global _start

_start:
    ; Load values of x, y, z into registers
    mov rdi, [x]     ; First argument
    mov rsi, [y]     ; Second argument
    mov rdx, [z]     ; Third argument

    ; Call the add_three function
    call add_three

    ; Return result in rax to shell (must be in 0-255 range for shell echo $? to work)
    ; We'll store it in rax already, but make sure to convert to int and exit cleanly

    ; Exit system call
    mov rdi, rax     ; move result to rdi as exit code
    mov rax, 60      ; syscall: exit
    syscall

; -------- Function: add_three -------------
; Arguments:
;   rdi = x
;   rsi = y
;   rdx = z
; Returns:
;   rax = result = x + y + z
add_three:
    push rbp
    mov rbp, rsp     ; Set up stack frame (not strictly required, but clean)
    
    ; Add the three numbers
    mov rax, rdi
    add rax, rsi
    add rax, rdx     ; rax = x + y + z
    
    ; Deallocate function stack (clean exit)
    mov rsp, rbp
    pop rbp
    ret
