	.file	"client.c"
	.intel_syntax noprefix
	.section	.rodata
	.align 8
.LC0:
	.string	"Ussage: %s + IP Address + port No. Append a 1 to turn verbose on.\n"
.LC1:
	.string	"SOCKET(-1) error ---> %s.\n"
.LC2:
	.string	"SOCKET(0) error ---> %s.\n"
	.align 8
.LC3:
	.string	"DEBUG MSG --> SOCKET was successful."
.LC4:
	.string	"No such host.\n"
	.align 8
.LC5:
	.string	"DEBUG MSG - Successfully got host by name."
.LC6:
	.string	"PORTNO(0) error ---> %s.\n"
	.align 8
.LC7:
	.string	"DEBUG MSG - ATOI(0) error ---> %s.\n"
	.align 8
.LC8:
	.string	"Successfully binded to port %d.\n"
.LC9:
	.string	"%s. CONNECT()\n"
.LC10:
	.string	"Made a connection to %s\n"
.LC11:
	.string	"Message: "
.LC12:
	.string	"WRITE(-1) error ---> %s.\n"
.LC13:
	.string	"Nothing was written."
	.align 8
.LC14:
	.string	"DEBUG MSG - WRITE was successful."
.LC15:
	.string	"READ(-1) error ---> %s.\n"
.LC16:
	.string	"READ(0) error ---> %s.\n"
.LC17:
	.string	"server: %s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 4192
	mov	DWORD PTR [rbp-4180], edi
	mov	QWORD PTR [rbp-4192], rsi
	cmp	DWORD PTR [rbp-4180], 2
	jg	.L2
	cmp	DWORD PTR [rbp-4180], 4
	jle	.L2
	mov	rax, QWORD PTR [rbp-4192]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR stderr[rip]
	mov	esi, OFFSET FLAT:.LC0
	mov	rdi, rax
	mov	eax, 0
	call	fprintf
	mov	edi, 1
	call	exit
.L2:
	cmp	DWORD PTR [rbp-4180], 4
	jne	.L3
	mov	rax, QWORD PTR [rbp-4192]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi
	mov	DWORD PTR [rbp-4], eax
.L3:
	mov	edx, 0
	mov	esi, 1
	mov	edi, 2
	call	socket
	mov	DWORD PTR [rbp-8], eax
	cmp	DWORD PTR [rbp-8], 0
	jns	.L4
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC1
	mov	eax, 0
	call	printf
	mov	edi, 1
	call	exit
.L4:
	cmp	DWORD PTR [rbp-8], 0
	jne	.L5
	cmp	DWORD PTR [rbp-4], 1
	jne	.L5
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC2
	mov	eax, 0
	call	printf
.L5:
	cmp	DWORD PTR [rbp-8], 0
	je	.L6
	cmp	DWORD PTR [rbp-4], 1
	jne	.L6
	mov	edi, OFFSET FLAT:.LC3
	call	puts
.L6:
	mov	DWORD PTR [rbp-68], 1
	lea	rdx, [rbp-68]
	mov	eax, DWORD PTR [rbp-8]
	mov	r8d, 4
	mov	rcx, rdx
	mov	edx, 2
	mov	esi, 1
	mov	edi, eax
	call	setsockopt
	lea	rax, [rbp-64]
	mov	esi, 16
	mov	rdi, rax
	call	bzero
	mov	rax, QWORD PTR [rbp-4192]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	gethostbyname
	mov	QWORD PTR [rbp-16], rax
	cmp	QWORD PTR [rbp-16], 0
	jne	.L7
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 14
	mov	esi, 1
	mov	edi, OFFSET FLAT:.LC4
	call	fwrite
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rdi, rax
	call	puts
	mov	edi, 1
	call	exit
.L7:
	cmp	QWORD PTR [rbp-16], 0
	je	.L8
	cmp	DWORD PTR [rbp-4], 1
	jne	.L8
	mov	edi, OFFSET FLAT:.LC5
	call	puts
.L8:
	mov	rax, QWORD PTR [rbp-4192]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi
	mov	DWORD PTR [rbp-20], eax
	cmp	DWORD PTR [rbp-20], 0
	jns	.L9
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC6
	mov	eax, 0
	call	printf
.L9:
	cmp	DWORD PTR [rbp-20], 0
	jne	.L10
	cmp	DWORD PTR [rbp-4], 1
	jne	.L10
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC7
	mov	eax, 0
	call	printf
.L10:
	cmp	DWORD PTR [rbp-20], 0
	je	.L11
	cmp	DWORD PTR [rbp-4], 1
	jne	.L11
	mov	eax, DWORD PTR [rbp-20]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC8
	mov	eax, 0
	call	printf
.L11:
	mov	WORD PTR [rbp-64], 2
	mov	rax, QWORD PTR [rbp-16]
	mov	eax, DWORD PTR [rax+20]
	movsx	rdx, eax
	mov	rax, QWORD PTR [rbp-16]
	mov	rax, QWORD PTR [rax+24]
	mov	rax, QWORD PTR [rax]
	lea	rcx, [rbp-64]
	add	rcx, 4
	mov	rsi, rax
	mov	rdi, rcx
	call	memcpy
	mov	eax, DWORD PTR [rbp-20]
	movzx	eax, ax
	mov	edi, eax
	call	htons
	mov	WORD PTR [rbp-62], ax
	lea	rcx, [rbp-64]
	mov	eax, DWORD PTR [rbp-8]
	mov	edx, 16
	mov	rsi, rcx
	mov	edi, eax
	call	connect
	mov	DWORD PTR [rbp-24], eax
	cmp	DWORD PTR [rbp-24], 0
	jns	.L12
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rdx, rax
	mov	rax, QWORD PTR stderr[rip]
	mov	esi, OFFSET FLAT:.LC9
	mov	rdi, rax
	mov	eax, 0
	call	fprintf
	mov	edi, 1
	call	exit
.L12:
	mov	eax, DWORD PTR [rbp-60]
	mov	edi, eax
	call	inet_ntoa
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC10
	mov	eax, 0
	call	printf
.L19:
	mov	edi, OFFSET FLAT:.LC11
	mov	eax, 0
	call	printf
	mov	rdx, QWORD PTR stdin[rip]
	lea	rax, [rbp-4176]
	mov	esi, 4096
	mov	rdi, rax
	call	fgets
	lea	rax, [rbp-4176]
	mov	rdi, rax
	call	strlen
	mov	rdx, rax
	lea	rcx, [rbp-4176]
	mov	eax, DWORD PTR [rbp-8]
	mov	rsi, rcx
	mov	edi, eax
	call	write
	mov	QWORD PTR [rbp-32], rax
	cmp	QWORD PTR [rbp-32], 0
	jns	.L13
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC12
	mov	eax, 0
	call	printf
.L13:
	cmp	QWORD PTR [rbp-32], 0
	jne	.L14
	mov	edi, OFFSET FLAT:.LC13
	call	puts
.L14:
	cmp	QWORD PTR [rbp-32], 0
	je	.L15
	cmp	DWORD PTR [rbp-4], 1
	jne	.L15
	mov	edi, OFFSET FLAT:.LC14
	call	puts
.L15:
	lea	rcx, [rbp-4176]
	mov	eax, DWORD PTR [rbp-8]
	mov	edx, 4096
	mov	rsi, rcx
	mov	edi, eax
	call	read
	mov	QWORD PTR [rbp-40], rax
	cmp	QWORD PTR [rbp-40], 0
	jns	.L16
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC15
	mov	eax, 0
	call	printf
	mov	edi, 1
	call	exit
.L16:
	cmp	QWORD PTR [rbp-40], 0
	jne	.L17
	cmp	DWORD PTR [rbp-4], 1
	jne	.L17
	call	__errno_location
	mov	eax, DWORD PTR [rax]
	mov	edi, eax
	call	strerror
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC16
	mov	eax, 0
	call	printf
	jmp	.L19
.L17:
	lea	rax, [rbp-4176]
	mov	rsi, rax
	mov	edi, OFFSET FLAT:.LC17
	mov	eax, 0
	call	printf
	jmp	.L19
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-4)"
	.section	.note.GNU-stack,"",@progbits
