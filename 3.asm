TITLE Assignment 1 code : 20170795 

INCLUDE irvine32.inc

.data
INCLUDE hw1_1.inc

.code
main PROC
	;------------------
	;eval1 출력--------
	mov ecx, val1	;ecx: val1
	add ecx, ecx	;ecx: 2val1
	mov ebx, ecx	;ebx: 2val1
	add ebx, ebx	;ebx: 4val1
	mov eax, ebx	;eax: 4val1
	add eax, eax	;eax: 8val1
	add eax, ebx	;eax: 12val1
	mov ecx, val2	;ecx: val2
	add eax, ecx	;eax: 12val1+val2
	add ecx, ecx	;ecx: 2val2
	add eax, ecx	;eax: 12val1 + 3val2
	add ecx, ecx	;ecx: 4val2
	add ecx, ecx	;ecx: 8val2
	add ecx, ecx	;ecx: 16val2
	add eax, ecx	;eax: 12val1 + 19val2
	add ecx, ecx	;ecx: 32val2
	add eax, ecx	;eax: 12val1 + 51val2
	mov ecx, val4	;ecx: val4
	sub ecx, val3	;ecx: val4 - val3
	sub eax, ecx	;eax: 12val1 + 51val2 - (val4 - val3)
	add ecx, ecx	;ecx: 2(val4 - val3)
	add ecx, ecx	;ecx: 4(val4 - val3)
	sub eax, ecx	;eax: 12val1 + 51val2 -5(val4 - val3)
	call DumpRegs

	;------------------
	;eval2 출력--------
	mov eax, val1	;eax: val1
	add eax, eax	;eax: 2val1
	mov ebx, eax	;ebx: 2val1
	add eax, ebx	;eax: 4val1
	add ebx, eax	;ebx: 6val1
	add eax, eax	;eax: 8val1
	add eax, ebx	;eax = 14val1
	mov ebx, val2	;ebx: val2
	mov ecx, val2	;ecx: val2
	add ebx, ecx	;ebx: 2val2
	add ebx, ebx	;ebx: 4val2
	add ecx, ebx	;ecx: 5val2
	add ebx, ebx	;ebx: 8val2
	add ebx, ecx	;ebx: 13val2
	add eax, ebx	;eax: 14val1 + 13val2
	mov ecx, val3	;ecx: val3
	sub ecx, val4	;ecx: val3-val4
	add ecx, ecx	;ecx: 2(val3-val4)
	add ecx, ecx	;ecx: 4(val3-val4)
	add ecx, ecx	;ecx: 8(val3-val4)
	add ecx, ecx	;ecx: 16(val3-val4)
	sub ecx, val3	;ecx: 15val3-16val4
	add ecx, val4	;ecx: 15(val3-val4)
	sub eax, ecx	;eax: 14val1+13val2-15(val3-val4)
	call DumpRegs

	;------------------
	;eval3 출력--------
	mov eax, val1	;eax: val1
	add eax, val2	;eax: val1+val2
	add eax, val3	;eax: val1+val2+val3
	mov ebx, eax	;ebx: val1+val2+val3
	add eax, eax	;eax: 2(val1+val2+val3)
	add eax, ebx	;eax: 3(val1+val2+val3)
	mov ebx, val1	;ebx: val1
	add ebx, ebx	;ebx: 2val1
	add ebx, ebx	;ebx: 4val1
	add ebx, val1	;ebx: 5val1
	add ebx, ebx	;ebx: 10val1
	add ebx, ebx	;ebx: 20val1
	sub eax, ebx	;eax: 3(val1+val2+val3)-20val1
	mov ebx, val4	;ebx: val4
	add ebx, ebx	;ebx: 2val4
	add ebx, val4	;ebx: 3val4
	add ebx, val2	;ebx: 3val4+val2
	sub eax, ebx	;eax: 3(val1+val2+val3)-20val1-(val2+3val4)
	call DumpRegs
	exit
main ENDP
END main
