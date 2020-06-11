INCLUDE irvine32.inc

BUFMAX = 45

.data
inputPrompt BYTE "Type_A_String: ", 0
SearchPrompt BYTE "A_Word_for_Search: ", 0
EndPrompt BYTE "Bye!", 0
foundPrompt BYTE "Found", 0
notFoundPrompt BYTE "Not found", 0

buffer BYTE BUFMAX DUP(0)		;target string
search BYTE BUFMAX DUP(0)		;search word

bufSize DWORD BUFMAX			;target string size
searchSize DWORD BUFMAX			;search word size

.code
main PROC
L1: 
	mov ebx, 0					;ebx is going to be used to check if it is found or not found so initialize
	call inputString
	mov esi, 0
	cmp buffer[esi], 0			;if input value is just '\n' jmp to next
	jz next
	cmp bufSize, 40				;if buffer size is bigger than 40 get the input again
	ja L1
	call inputKey
	mov esi, 0

L2: 
	call searchWord
	cmp esi, bufSize
	jz L3
	inc esi
	jmp L2

L3:
	cmp ebx, 1
	jnz L4
	mov edx, OFFSET foundPrompt
	call writeString
	call crlf
	jmp L1

L4:
	mov edx, OFFSET notFoundPrompt
	call writeString
	call crlf
	jmp L1

next: 
	mov edx, OFFSET EndPrompt	;end the program
	call WriteString
	INVOKE ExitProcess, 0

main ENDP

;[PROCEDURE inputString] get input from user and store it in buffer
inputString PROC
	pushad
	mov edx, OFFSET inputPrompt
	call WriteString							;display input prompt
	mov ecx, BUFMAX
	mov edx, OFFSET buffer
	call ReadString								;get input from user
	mov bufSize, eax
	popad
	ret
inputString ENDP

;[PROCEDURE inputKey] get input from user and store it in buffer
inputKey PROC
	pushad
	mov edx, OFFSET SearchPrompt
	call WriteString							;display input prompt
	mov ecx, BUFMAX
	mov edx, OFFSET search
	call ReadString
	mov searchSize, eax
	popad
	ret
inputKey ENDP

searchWord PROC
	mov edx, 0
	mov ecx, bufSize
L1:
	mov al, search[edx]
	cmp buffer[esi], '.'
	jz L2
	cmp buffer[esi], al
	jz L3
L2:
	ret
L3:
	inc esi					;if it is correct, check for next character
	inc edx
	cmp search[edx], 0
	jz L4
	jmp L1

L4:
	cmp buffer[esi], ' '
	jz L5
	cmp buffer[esi], 0
	jz L5
	cmp buffer[esi], '.'
	jz L5
	ret
L5:
	mov ebx, 1
	ret
searchWord ENDP

END main
