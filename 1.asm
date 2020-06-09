INCLUDE irvine32.inc


BUFMAX = 45
keyBUFMAX = 15
.data
buffer BYTE BUFMAX+1 DUP(0)
bufSize DWORD BUFMAX
KeyBuffer BYTE keyBUFMAX+1 DUP(0)
KeyBufSize DWORD keyBUFMAX

plainPrompt BYTE "Enter a plain text: ", 0
keyPrompt BYTE "Enter a key: ", 0

originPrompt BYTE "Original Text: ", 0
EncryPrompt BYTE "Encrypted Text: ", 0
DecryPrompt BYTE "Decrypted Text: ", 0

lPrompt BYTE "Bye!",0
.code
main PROC

L1:	call inputTheText		;input the plain text
	mov esi,0
	cmp buffer[esi],0		;if(buffer == <ent>) jump to next
	jz next
	call inputTheKey		;input the key
	call crlf
	call crlf

	mov edx, OFFSET originPrompt
	call displayTheString
	call translateBuffer	;encrypt the buffer
	mov edx, OFFSET EncryPrompt
	call displayTheString
	call translateBuffer	;decrypt the buffer
	mov edx, OFFSET DecryPrompt
	call displayTheString
	call crlf
	call crlf
	jmp L1
next:
	mov edx, OFFSET lPrompt
	call WriteString
	INVOKE ExitProcess, 0
	

main ENDP

inputTheText PROC
	pushad
	mov edx, OFFSET plainPrompt ;  display a prompt
	call WriteString

	mov ecx, BUFMAX	;	maximum char count
	mov edx, offset buffer	;point to the buffer
	call ReadString			;input the string
	mov bufSize, eax		;save the length
	popad
	ret
inputTheText ENDP

inputTheKey PROC
	pushad
	mov edx, OFFSET keyPrompt ;  display a prompt
	call WriteString

	mov ecx, keyBUFMAX	;	maximum char count
	mov edx, offset KeyBuffer	;point to the KEYbuffer
	call ReadString			;input the string
	mov KeyBufSize, eax		;save the length
	popad
	ret
inputTheKey ENDP

translateBuffer PROC
	pushad
	mov ecx, bufSize		;loop counter
	mov esi, 0				;index 0 in buffer
	mov edi, 0				;edi :keybuffer index
L1: 
	mov al,	keyBuffer[edi]		;al : keybuffer[edi]
	xor buffer[esi], al	;translate a byte
	inc esi		;point to next byte
	inc edi
	cmp edi, keyBufSize				;if(edi가 keyBuffer 사이즈를 초과하면)
	jb next
	mov edi,0						;edi를 0으로 초기화
next:	
	loop L1
	popad
	ret
translateBuffer ENDP

displayTheString PROC
	
	call WriteString	;  display a prompt
	mov edx, OFFSET buffer
	call WriteString
	call crlf
	
	ret
displayTheString ENDP

END main

