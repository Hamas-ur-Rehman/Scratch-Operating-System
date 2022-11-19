org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start: 
    jmp

;prints characters to the screen
puts:
    push si
    push ax

.loop:
    lodsb
    or al,al
    jz .done

    mov ah,0x0E
    int 0x10
    jmp .loop
.done:
    pop ax
    pop si
    ret

main:
    ;setup data segment
    mov ax,0
    mov ds,ax
    mov es,ax

    ;setup stack segment
    mov ss,ax
    mov sp,0x7C00

    ;print message
    mov si, msg_hello
    call puts

    hlt

.halt:
    jmp .halt


msg_hello: db 'Hello world from hamas in 16 bit mode!',ENDL,0

times 510-($-$$) db 0
dw 0AA55h