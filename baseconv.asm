%include "io.inc"

section .data
    %include "input.inc"
    msg db 'Baza incorecta', 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp


    xor eax, eax
    xor ecx, ecx
    ;mov ecx, dword [nums]
intro:
    mov ebx, dword [base_array + 4 * ecx]
    mov eax, dword [nums_array + 4 * ecx]
    xor edx, edx

    cmp ebx, 2
    jb baza_incorecta
    cmp ebx, 16
    jg baza_incorecta

aici:
    div ebx
    mov ebx, dword [base_array + 4 * ecx]
    cmp edx, 10
    jb adun1
    add edx, 87

push_stack:
    push edx
    xor edx, edx
    cmp eax, 0
    je afara
    jmp aici
    
afara:
    cmp esp, ebp
    je return
    pop edx
    PRINT_CHAR edx
    jmp afara
    
adun1:
    add edx, 48
    jmp push_stack
    
baza_incorecta:
    PRINT_STRING msg
    
return:
    NEWLINE
    inc ecx
    cmp ecx, dword[nums]
    jb intro
    ret