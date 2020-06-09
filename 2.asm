INCLUDE  irvine32.inc
.data
INCLUDE hw3.inc
CODE_A BYTE '1'
CODE_B BYTE '01'
CODE_C BYTE '000'
CODE_D BYTE '0011'
CODE_E BYTE '0010'

.code
main PROC
	pushad
	mov edi, CODE01		;store code01
	mov edx, 0			
	call check			
	popad				;pop registers
	call crlf			;<ent>
	
	pushad
	mov edi, CODE02
	mov edx, 0
	call check
	popad
	call crlf

	pushad
	mov edi, CODE03
	mov edx, 0
	call check
	popad
	call crlf

	pushad
	mov edi, CODE04
	mov edx, 0
	call check
	popad
	call crlf

	pushad
	mov edi, CODE05
	mov edx, 0
	call check
	popad
	call crlf
main ENDP

check PROC
	cmp edx, 32
	jge fin
	inc edx
	shl edi, 1	; is 1
	jc finA
	inc edx
	shl edi, 1	
	jc finB		; is 01
	inc edx
	shl edi, 1
	jnc finC	;is 000
	inc edx
	shl edi, 1
	jc	finD	;is 0011
	jnc finE	;is 0010
finA :
	mov al, "A"		;print function
	call Writechar
	loop check
finB :
	mov al, "B"
	call Writechar
	loop check
finC :
	mov al, "C"
	call Writechar
	loop check
finD :
	mov al, "D"
	call Writechar
	loop check
finE :
	mov al, "E"
	call Writechar
	loop check
fin : ret
check ENDP


END main
