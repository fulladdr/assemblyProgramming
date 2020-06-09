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

displayTheString PROC
	
	call WriteString	;  display a prompt
	mov edx, OFFSET buffer
	call WriteString
	call crlf
	
	ret
displayTheString ENDP

END main

