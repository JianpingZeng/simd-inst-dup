	.file	"llvmprof.out"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4696837146684686336     # double 1.0E+6
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$488, %rsp              # imm = 0x1E8
.Ltmp1:
	.cfi_def_cfa_offset 496
	leaq	.Lstr, %rdi
	leaq	192(%rsp), %rax
	leaq	408(%rsp), %rcx
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rcx, 144(%rsp)         # 8-byte Spill
	callq	puts
	movl	%eax, 140(%rsp)         # 4-byte Spill
	movb	$0, %al
	callq	readInput
	movl	i_ub, %edx
	movslq	%edx, %rcx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	callq	malloc
	movl	x_size, %edx
	movslq	%edx, %rcx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	movq	%rax, 128(%rsp)         # 8-byte Spill
	callq	malloc
	leaq	192(%rsp), %rdi
	movq	%rax, 120(%rsp)         # 8-byte Spill
	callq	allocMem
	leaq	408(%rsp), %rdi
	leaq	192(%rsp), %rsi
	movq	120(%rsp), %rdx         # 8-byte Reload
	movq	128(%rsp), %rcx         # 8-byte Reload
	callq	init
	leaq	176(%rsp), %rdi
	movabsq	$0, %rsi
	callq	gettimeofday
	movl	%eax, 116(%rsp)         # 4-byte Spill
	callq	clock
	movl	$0, %r8d
	movl	%r8d, %r9d
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movl	%r9d, 100(%rsp)         # 4-byte Spill
	movl	%r8d, 96(%rsp)          # 4-byte Spill
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	96(%rsp), %eax          # 4-byte Reload
	movl	100(%rsp), %ecx         # 4-byte Reload
	leaq	408(%rsp), %rdi
	leaq	192(%rsp), %rsi
	movq	120(%rsp), %rdx         # 8-byte Reload
	movq	128(%rsp), %r8          # 8-byte Reload
	movl	%ecx, 92(%rsp)          # 4-byte Spill
	movq	%r8, %rcx
	movl	%eax, 88(%rsp)          # 4-byte Spill
	callq	rmatmult3
	movl	92(%rsp), %eax          # 4-byte Reload
	addl	$1, %eax
	movl	88(%rsp), %r9d          # 4-byte Reload
	addl	$1, %r9d
	cmpl	$5000, %r9d             # imm = 0x1388
	movl	%eax, 100(%rsp)         # 4-byte Spill
	movl	%r9d, 96(%rsp)          # 4-byte Spill
	jne	.LBB0_1
# BB#2:                                 # %for.end
	leaq	160(%rsp), %rdi
	movabsq	$0, %rsi
	callq	gettimeofday
	movl	%eax, 84(%rsp)          # 4-byte Spill
	callq	clock
	leaq	.Lstr6, %rdi
	movq	%rax, 72(%rsp)          # 8-byte Spill
	callq	puts
	movl	$0, %ecx
	movl	i_ub, %edx
	cmpl	$0, %edx
	movl	%ecx, %edx
	movl	%eax, 68(%rsp)          # 4-byte Spill
	movl	%edx, 64(%rsp)          # 4-byte Spill
	movl	%ecx, 60(%rsp)          # 4-byte Spill
	jle	.LBB0_4
.LBB0_3:                                # %for.body14
                                        # =>This Inner Loop Header: Depth=1
	movl	60(%rsp), %eax          # 4-byte Reload
	movl	64(%rsp), %ecx          # 4-byte Reload
	leaq	.L.str2, %rdi
	movslq	%eax, %rdx
	movq	128(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdx,8), %xmm0
	movl	%eax, %esi
	movl	%eax, 56(%rsp)          # 4-byte Spill
	movb	$1, %al
	movl	%ecx, 52(%rsp)          # 4-byte Spill
	callq	printf
	movl	$5, %ecx
	movl	i_ub, %esi
	movl	%eax, 48(%rsp)          # 4-byte Spill
	movl	%esi, %eax
	cltd
	idivl	%ecx
	movl	%eax, 44(%rsp)          # 4-byte Spill
	movl	%esi, %eax
	cltd
	idivl	%ecx
	movl	44(%rsp), %ecx          # 4-byte Reload
	movl	52(%rsp), %edx          # 4-byte Reload
	addl	%edx, %ecx
	movl	56(%rsp), %r8d          # 4-byte Reload
	addl	%r8d, %eax
	cmpl	%esi, %eax
	movl	%ecx, 64(%rsp)          # 4-byte Spill
	movl	%eax, 60(%rsp)          # 4-byte Spill
	jl	.LBB0_3
.LBB0_4:                                # %for.end17
	leaq	.L.str4, %rdi
	movabsq	$1000000, %rax          # imm = 0xF4240
	vmovsd	.LCPI0_0, %xmm0
	movq	160(%rsp), %rcx
	movq	168(%rsp), %rdx
	movq	176(%rsp), %rsi
	movq	184(%rsp), %r8
	subq	%rsi, %rcx
                                        # implicit-def: XMM1
	vcvtsi2sdq	%rcx, %xmm1, %xmm1
	subq	%r8, %rdx
                                        # implicit-def: XMM2
	vcvtsi2sdq	%rdx, %xmm2, %xmm2
	vmovsd	.LCPI0_0(%rip), %xmm3
	vdivsd	%xmm3, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	movl	$.L.str3, %r9d
	movl	%r9d, %ecx
	movb	$1, %r10b
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %rdi
	vmovsd	%xmm0, 24(%rsp)         # 8-byte Spill
	vmovaps	%xmm1, %xmm0
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movb	%r10b, %al
	callq	printf
	movq	72(%rsp), %rcx          # 8-byte Reload
	movq	104(%rsp), %rdx         # 8-byte Reload
	subq	%rdx, %rcx
                                        # implicit-def: XMM0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vmovsd	24(%rsp), %xmm1         # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm0
	movq	32(%rsp), %rdi          # 8-byte Reload
	movl	%eax, 12(%rsp)          # 4-byte Spill
	movb	$1, %al
	callq	printf
	leaq	.L.str5, %rdi
	movl	errors, %esi
	movl	%eax, 8(%rsp)           # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	$0, %esi
	movl	%eax, 4(%rsp)           # 4-byte Spill
	movl	%esi, %eax
	addq	$488, %rsp              # imm = 0x1E8
	ret
.Ltmp2:
	.size	main, .Ltmp2-main
	.cfi_endproc

	.globl	rmatmult3
	.align	16, 0x90
	.type	rmatmult3,@function
rmatmult3:                              # @rmatmult3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp10:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp11:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp12:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp13:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp14:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp15:
	.cfi_def_cfa_offset 56
	subq	$576, %rsp              # imm = 0x240
.Ltmp16:
	.cfi_def_cfa_offset 632
.Ltmp17:
	.cfi_offset %rbx, -56
.Ltmp18:
	.cfi_offset %r12, -48
.Ltmp19:
	.cfi_offset %r13, -40
.Ltmp20:
	.cfi_offset %r14, -32
.Ltmp21:
	.cfi_offset %r15, -24
.Ltmp22:
	.cfi_offset %rbp, -16
	movabsq	$1, %rax
	movl	8(%rdi), %r8d
	movl	20(%rdi), %r9d
	movl	12(%rdi), %r10d
	movl	24(%rdi), %r11d
	movl	16(%rdi), %ebx
	movl	28(%rdi), %ebp
	movl	68(%rdi), %r14d
	movl	72(%rdi), %r15d
	movq	(%rsi), %rdi
	movq	8(%rsi), %r12
	movq	16(%rsi), %r13
	movq	%rax, 568(%rsp)         # 8-byte Spill
	movq	24(%rsi), %rax
	movq	%rax, 560(%rsp)         # 8-byte Spill
	movq	32(%rsi), %rax
	movq	%rax, 552(%rsp)         # 8-byte Spill
	movq	40(%rsi), %rax
	movq	%rax, 544(%rsp)         # 8-byte Spill
	movq	48(%rsi), %rax
	movq	%rax, 536(%rsp)         # 8-byte Spill
	movq	56(%rsi), %rax
	movq	%rax, 528(%rsp)         # 8-byte Spill
	movq	64(%rsi), %rax
	movq	%rax, 520(%rsp)         # 8-byte Spill
	movq	72(%rsi), %rax
	movq	%rax, 512(%rsp)         # 8-byte Spill
	movq	80(%rsi), %rax
	movq	%rax, 504(%rsp)         # 8-byte Spill
	movq	88(%rsi), %rax
	movq	%rax, 496(%rsp)         # 8-byte Spill
	movq	96(%rsi), %rax
	movq	%rax, 488(%rsp)         # 8-byte Spill
	movq	104(%rsi), %rax
	movq	%rax, 480(%rsp)         # 8-byte Spill
	movq	112(%rsi), %rax
	movq	%rax, 472(%rsp)         # 8-byte Spill
	movq	120(%rsi), %rax
	movq	%rax, 464(%rsp)         # 8-byte Spill
	movq	128(%rsi), %rax
	movq	%rax, 456(%rsp)         # 8-byte Spill
	movq	136(%rsi), %rax
	movq	%rax, 448(%rsp)         # 8-byte Spill
	movq	144(%rsi), %rax
	movq	%rax, 440(%rsp)         # 8-byte Spill
	movq	152(%rsi), %rax
	movq	%rax, 432(%rsp)         # 8-byte Spill
	movq	160(%rsi), %rax
	movq	%rax, 424(%rsp)         # 8-byte Spill
	movq	168(%rsi), %rax
	movq	%rax, 416(%rsp)         # 8-byte Spill
	movq	176(%rsi), %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	movq	184(%rsi), %rax
	movq	%rax, 400(%rsp)         # 8-byte Spill
	movq	192(%rsi), %rax
	movq	%rax, 392(%rsp)         # 8-byte Spill
	movq	200(%rsi), %rax
	movq	208(%rsi), %rsi
	movq	%rax, 384(%rsp)         # 8-byte Spill
	movslq	%r15d, %rax
	movq	%rax, 376(%rsp)         # 8-byte Spill
	movslq	%r15d, %rax
	movq	%rax, 368(%rsp)         # 8-byte Spill
	movslq	%r14d, %rax
	movq	%rax, 360(%rsp)         # 8-byte Spill
	movslq	%r14d, %rax
	movq	%rax, 352(%rsp)         # 8-byte Spill
	movq	376(%rsp), %rax         # 8-byte Reload
	movq	%rcx, 344(%rsp)         # 8-byte Spill
	movq	360(%rsp), %rcx         # 8-byte Reload
	addq	%rcx, %rax
	movq	368(%rsp), %rcx         # 8-byte Reload
	movq	%rax, 336(%rsp)         # 8-byte Spill
	movq	352(%rsp), %rax         # 8-byte Reload
	addq	%rax, %rcx
	movq	336(%rsp), %rax         # 8-byte Reload
	xorq	$-1, %rax
	movq	%rax, 328(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	xorq	$-1, %rax
	movq	%rax, 320(%rsp)         # 8-byte Spill
	movq	568(%rsp), %rax         # 8-byte Reload
	movq	%rcx, 312(%rsp)         # 8-byte Spill
	movq	336(%rsp), %rcx         # 8-byte Reload
	subq	%rcx, %rax
	movq	568(%rsp), %rcx         # 8-byte Reload
	movq	%rax, 304(%rsp)         # 8-byte Spill
	movq	312(%rsp), %rax         # 8-byte Reload
	subq	%rax, %rcx
	movq	376(%rsp), %rax         # 8-byte Reload
	xorq	$-1, %rax
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	368(%rsp), %rax         # 8-byte Reload
	xorq	$-1, %rax
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	568(%rsp), %rax         # 8-byte Reload
	movq	%rcx, 280(%rsp)         # 8-byte Spill
	movq	376(%rsp), %rcx         # 8-byte Reload
	subq	%rcx, %rax
	movq	568(%rsp), %rcx         # 8-byte Reload
	movq	%rax, 272(%rsp)         # 8-byte Spill
	movq	368(%rsp), %rax         # 8-byte Reload
	subq	%rax, %rcx
	movq	360(%rsp), %rax         # 8-byte Reload
	movq	%rcx, 264(%rsp)         # 8-byte Spill
	movq	376(%rsp), %rcx         # 8-byte Reload
	subq	%rcx, %rax
	movq	352(%rsp), %rcx         # 8-byte Reload
	movq	%rax, 256(%rsp)         # 8-byte Spill
	movq	368(%rsp), %rax         # 8-byte Reload
	subq	%rax, %rcx
	movq	256(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	addq	$-1, %rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movq	256(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	addq	$1, %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	movq	360(%rsp), %rax         # 8-byte Reload
	xorq	$-1, %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	352(%rsp), %rax         # 8-byte Reload
	xorq	$-1, %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	568(%rsp), %rax         # 8-byte Reload
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	movq	360(%rsp), %rcx         # 8-byte Reload
	subq	%rcx, %rax
	movq	568(%rsp), %rcx         # 8-byte Reload
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	352(%rsp), %rax         # 8-byte Reload
	subq	%rax, %rcx
	movq	360(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	352(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	360(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	352(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	376(%rsp), %rax         # 8-byte Reload
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	movq	360(%rsp), %rcx         # 8-byte Reload
	subq	%rcx, %rax
	movq	368(%rsp), %rcx         # 8-byte Reload
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	352(%rsp), %rax         # 8-byte Reload
	subq	%rax, %rcx
	movq	144(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	addq	$-1, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	144(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	addq	$1, %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	376(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	368(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	376(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	368(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	336(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	312(%rsp), %rax         # 8-byte Reload
	addq	$-1, %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	336(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	312(%rsp), %rax         # 8-byte Reload
	addq	$1, %rax
	cmpl	%ebp, %ebx
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%r13, 40(%rsp)          # 8-byte Spill
	movl	%r14d, 36(%rsp)         # 4-byte Spill
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movl	%r8d, 12(%rsp)          # 4-byte Spill
	movl	%r9d, 8(%rsp)           # 4-byte Spill
	movl	%r10d, 4(%rsp)          # 4-byte Spill
	movl	%r11d, (%rsp)           # 4-byte Spill
	movl	%ebx, -4(%rsp)          # 4-byte Spill
	movl	%ebp, -8(%rsp)          # 4-byte Spill
	movl	%r15d, -12(%rsp)        # 4-byte Spill
	movq	%rdi, -24(%rsp)         # 8-byte Spill
	movq	%r12, -32(%rsp)         # 8-byte Spill
	movq	%rsi, -40(%rsp)         # 8-byte Spill
	jge	.LBB1_8
# BB#1:                                 # %for.cond141.preheader.lr.ph
	movl	4(%rsp), %eax           # 4-byte Reload
	movl	(%rsp), %ecx            # 4-byte Reload
	cmpl	%ecx, %eax
	setl	%dl
	movl	12(%rsp), %esi          # 4-byte Reload
	movl	8(%rsp), %edi           # 4-byte Reload
	cmpl	%edi, %esi
	setl	%r8b
	movslq	%esi, %r9
	movslq	%esi, %r10
	movl	-4(%rsp), %r11d         # 4-byte Reload
	movl	-4(%rsp), %ebx          # 4-byte Reload
	movb	%dl, -41(%rsp)          # 1-byte Spill
	movb	%r8b, -42(%rsp)         # 1-byte Spill
	movq	%r9, -56(%rsp)          # 8-byte Spill
	movq	%r10, -64(%rsp)         # 8-byte Spill
	movl	%r11d, -68(%rsp)        # 4-byte Spill
	movl	%ebx, -72(%rsp)         # 4-byte Spill
.LBB1_2:                                # %for.cond141.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
                                        #       Child Loop BB1_5 Depth 3
	movl	-72(%rsp), %eax         # 4-byte Reload
	movl	-68(%rsp), %ecx         # 4-byte Reload
	movb	-41(%rsp), %dl          # 1-byte Reload
	testb	$1, %dl
	movl	%eax, -76(%rsp)         # 4-byte Spill
	movl	%ecx, -80(%rsp)         # 4-byte Spill
	jne	.LBB1_3
	jmp	.LBB1_7
.LBB1_3:                                # %for.cond144.preheader.lr.ph
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	-80(%rsp), %eax         # 4-byte Reload
	movl	-12(%rsp), %ecx         # 4-byte Reload
	imull	%ecx, %eax
	movl	-76(%rsp), %edx         # 4-byte Reload
	imull	%ecx, %edx
	movb	-42(%rsp), %sil         # 1-byte Reload
	testb	$1, %sil
	movl	4(%rsp), %edi           # 4-byte Reload
	movl	4(%rsp), %r8d           # 4-byte Reload
	movl	%eax, -84(%rsp)         # 4-byte Spill
	movl	%edx, -88(%rsp)         # 4-byte Spill
	movl	%edi, -92(%rsp)         # 4-byte Spill
	movl	%r8d, -96(%rsp)         # 4-byte Spill
	jne	.LBB1_6
	jmp	.LBB1_7
.LBB1_4:                                # %for.inc310.us
                                        #   in Loop: Header=BB1_6 Depth=2
	movl	-100(%rsp), %eax        # 4-byte Reload
	addl	$1, %eax
	movl	-104(%rsp), %ecx        # 4-byte Reload
	addl	$1, %ecx
	movl	(%rsp), %edx            # 4-byte Reload
	cmpl	%edx, %ecx
	movl	%eax, -92(%rsp)         # 4-byte Spill
	movl	%ecx, -96(%rsp)         # 4-byte Spill
	je	.LBB1_7
	jmp	.LBB1_6
.LBB1_5:                                # %for.body146.us
                                        #   Parent Loop BB1_2 Depth=1
                                        #     Parent Loop BB1_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-112(%rsp), %rax        # 8-byte Reload
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movl	%eax, %edx
	movl	-124(%rsp), %esi        # 4-byte Reload
	addl	%edx, %esi
	movslq	%esi, %rdi
	movq	-24(%rsp), %r8          # 8-byte Reload
	vmovsd	(%r8,%rdi,8), %xmm0
	movq	%rdi, %r9
	movq	320(%rsp), %r10         # 8-byte Reload
	addq	%r10, %r9
	movq	48(%rsp), %r11          # 8-byte Reload
	vmovsd	(%r11,%r9,8), %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	movq	-32(%rsp), %r9          # 8-byte Reload
	vmovsd	(%r9,%rdi,8), %xmm1
	movq	%rdi, %rbx
	movq	312(%rsp), %r14         # 8-byte Reload
	subq	%r14, %rbx
	vmovsd	(%r11,%rbx,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	40(%rsp), %rbx          # 8-byte Reload
	vmovsd	(%rbx,%rdi,8), %xmm1
	movq	280(%rsp), %r15         # 8-byte Reload
	addq	%rdi, %r15
	vmovsd	(%r11,%r15,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	560(%rsp), %r15         # 8-byte Reload
	vmovsd	(%r15,%rdi,8), %xmm1
	movq	%rdi, %r12
	movq	288(%rsp), %r13         # 8-byte Reload
	addq	%r13, %r12
	vmovsd	(%r11,%r12,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	552(%rsp), %r12         # 8-byte Reload
	vmovsd	(%r12,%rdi,8), %xmm1
	movq	%rdi, %rbp
	movq	368(%rsp), %rsi         # 8-byte Reload
	subq	%rsi, %rbp
	vmovsd	(%r11,%rbp,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	544(%rsp), %rbp         # 8-byte Reload
	vmovsd	(%rbp,%rdi,8), %xmm1
	movq	264(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	536(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	240(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	528(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	%rdi, %rsi
	movq	200(%rsp), %r8          # 8-byte Reload
	addq	%r8, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	520(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	224(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	512(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	%rdi, %rsi
	movq	208(%rsp), %r8          # 8-byte Reload
	addq	%r8, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	504(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	%rdi, %rsi
	movq	352(%rsp), %r8          # 8-byte Reload
	subq	%r8, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	496(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	152(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	488(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	vmovsd	-8(%r11,%rdi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	480(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	vmovsd	(%r11,%rdi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	472(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	vmovsd	8(%r11,%rdi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	464(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	176(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	456(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	%rdi, %rsi
	addq	%r8, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	448(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	160(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	440(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	128(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	432(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	%rdi, %rsi
	movq	24(%rsp), %r8           # 8-byte Reload
	addq	%r8, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	424(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	112(%rsp), %rsi         # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	416(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	96(%rsp), %rsi          # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	408(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	%rdi, %rsi
	movq	368(%rsp), %r8          # 8-byte Reload
	addq	%r8, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	400(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	80(%rsp), %rsi          # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	392(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	64(%rsp), %rsi          # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	384(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	%rdi, %rsi
	addq	%r14, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	-40(%rsp), %rsi         # 8-byte Reload
	vmovsd	(%rsi,%rdi,8), %xmm1
	movq	16(%rsp), %rsi          # 8-byte Reload
	addq	%rdi, %rsi
	vmovsd	(%r11,%rsi,8), %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	344(%rsp), %rsi         # 8-byte Reload
	vmovsd	%xmm0, (%rsi,%rdi,8)
	addq	$1, %rcx
	addq	$1, %rax
	movl	%eax, %edx
	movl	8(%rsp), %esi           # 4-byte Reload
	cmpl	%esi, %edx
	movq	%rcx, -120(%rsp)        # 8-byte Spill
	movq	%rax, -112(%rsp)        # 8-byte Spill
	jl	.LBB1_5
	jmp	.LBB1_4
.LBB1_6:                                # %for.body146.lr.ph.us
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_5 Depth 3
	movl	-96(%rsp), %eax         # 4-byte Reload
	movl	-92(%rsp), %ecx         # 4-byte Reload
	movl	%ecx, %edx
	movl	36(%rsp), %esi          # 4-byte Reload
	imull	%esi, %edx
	movl	%eax, %edi
	imull	%esi, %edi
	movl	-84(%rsp), %r8d         # 4-byte Reload
	addl	%r8d, %edx
	movl	-88(%rsp), %r9d         # 4-byte Reload
	addl	%r9d, %edi
	movq	-56(%rsp), %r10         # 8-byte Reload
	movq	-64(%rsp), %r11         # 8-byte Reload
	movl	%eax, -104(%rsp)        # 4-byte Spill
	movl	%ecx, -100(%rsp)        # 4-byte Spill
	movl	%edx, -128(%rsp)        # 4-byte Spill
	movl	%edi, -124(%rsp)        # 4-byte Spill
	movq	%r10, -120(%rsp)        # 8-byte Spill
	movq	%r11, -112(%rsp)        # 8-byte Spill
	jmp	.LBB1_5
.LBB1_7:                                # %for.inc313
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	-80(%rsp), %eax         # 4-byte Reload
	addl	$1, %eax
	movl	-76(%rsp), %ecx         # 4-byte Reload
	addl	$1, %ecx
	movl	-8(%rsp), %edx          # 4-byte Reload
	cmpl	%edx, %ecx
	movl	%eax, -68(%rsp)         # 4-byte Spill
	movl	%ecx, -72(%rsp)         # 4-byte Spill
	jne	.LBB1_2
.LBB1_8:                                # %for.end315
	addq	$576, %rsp              # imm = 0x240
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp23:
	.size	rmatmult3, .Ltmp23-rmatmult3
	.cfi_endproc

	.globl	readInput
	.align	16, 0x90
	.type	readInput,@function
readInput:                              # @readInput
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp27:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp28:
	.cfi_def_cfa_offset 24
	subq	$104, %rsp
.Ltmp29:
	.cfi_def_cfa_offset 128
.Ltmp30:
	.cfi_offset %rbx, -24
.Ltmp31:
	.cfi_offset %rbp, -16
	movl	$.L.str, %eax
	movl	%eax, %edi
	movl	$.L.str1, %eax
	movl	%eax, %esi
	callq	fopen
	cmpq	$0, %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	jne	.LBB2_2
# BB#1:                                 # %if.then
	movl	$.Lstr14, %eax
	movl	%eax, %edi
	callq	puts
	movl	$.Lstr15, %ecx
	movl	%ecx, %edi
	movl	%eax, 92(%rsp)          # 4-byte Spill
	callq	puts
	movl	$1, %edi
	movl	%eax, 88(%rsp)          # 4-byte Spill
	callq	exit
.LBB2_2:                                # %if.end
	movq	%rsp, %rax
	movq	$jp, 24(%rax)
	movq	$kp, 16(%rax)
	movq	$imax, 8(%rax)
	movq	$imin, (%rax)
	movl	$.L.str43, %ecx
	movl	%ecx, %esi
	movl	$kmin, %ecx
	movl	%ecx, %edx
	movl	$kmax, %ecx
                                        # kill: RCX<def> ECX<kill>
	movl	$jmin, %edi
	movl	%edi, %r8d
	movl	$jmax, %edi
	movl	%edi, %r9d
	xorl	%edi, %edi
	movb	%dil, %r10b
	movq	96(%rsp), %rdi          # 8-byte Reload
	movb	%r10b, %al
	callq	__isoc99_fscanf
	movl	$.Lstr4, %r11d
	movl	%r11d, %edi
	movl	%eax, 84(%rsp)          # 4-byte Spill
	callq	puts
	movl	kmin, %esi
	movl	kmax, %edx
	movl	jmin, %ecx
	movl	jmax, %r8d
	movl	imin, %r9d
	movl	imax, %r11d
	movl	kp, %ebx
	movl	jp, %ebp
	movq	%rsp, %rdi
	movl	%ebp, 16(%rdi)
	movl	%ebx, 8(%rdi)
	movl	%r11d, (%rdi)
	movl	$.L.str6, %r11d
	movl	%r11d, %edi
	xorl	%r11d, %r11d
	movb	%r11b, %r10b
	movl	%eax, 80(%rsp)          # 4-byte Spill
	movb	%r10b, %al
	callq	printf
	movl	imin, %ecx
	movl	jmin, %edx
	movl	jp, %esi
	movl	%esi, %r8d
	imull	%edx, %r8d
	addl	%ecx, %r8d
	movl	kmin, %ecx
	movl	kp, %edx
	movl	%edx, %r9d
	imull	%ecx, %r9d
	addl	%r9d, %r8d
	movl	%r8d, i_lb
	movl	imax, %ecx
	movl	jmax, %r9d
	movl	%r9d, %r11d
	addl	$4294967295, %r11d      # imm = 0xFFFFFFFF
	addl	$4294967295, %r9d       # imm = 0xFFFFFFFF
	imull	%esi, %r11d
	imull	%esi, %r9d
	movl	kmax, %ebx
	movl	%ebx, %ebp
	addl	$4294967295, %ebp       # imm = 0xFFFFFFFF
	addl	$4294967295, %ebx       # imm = 0xFFFFFFFF
	imull	%edx, %ebp
	imull	%edx, %ebx
	addl	%ecx, %r11d
	addl	%ecx, %r9d
	addl	%ebp, %r11d
	addl	%ebx, %r9d
	movl	%r9d, i_ub
	subl	%edx, %r8d
	subl	%esi, %r8d
	cmpl	$1, %r8d
	movl	%eax, 76(%rsp)          # 4-byte Spill
	movl	%edx, 72(%rsp)          # 4-byte Spill
	movl	%esi, 68(%rsp)          # 4-byte Spill
	movl	%r9d, 64(%rsp)          # 4-byte Spill
	movl	%r11d, 60(%rsp)         # 4-byte Spill
	jge	.LBB2_4
# BB#3:                                 # %if.then19
	movl	$.Lstr14, %eax
	movl	%eax, %edi
	callq	puts
	movl	$.Lstr13, %ecx
	movl	%ecx, %edi
	movl	%eax, 56(%rsp)          # 4-byte Spill
	callq	puts
	movl	$1, %edi
	movl	%eax, 52(%rsp)          # 4-byte Spill
	callq	exit
.LBB2_4:                                # %if.end22
	movl	68(%rsp), %eax          # 4-byte Reload
	movl	72(%rsp), %ecx          # 4-byte Reload
	addl	%ecx, %eax
	movl	%eax, %edx
	movl	64(%rsp), %eax          # 4-byte Reload
	movl	%eax, %esi
	leal	12(%rsi,%rdx,2), %edi
	movl	%edi, x_size(%rip)
	movl	$.Lstr11, %edi
                                        # kill: RDI<def> EDI<kill>
	callq	puts
	movl	i_lb(%rip), %esi
	movl	i_ub(%rip), %edx
	movl	x_size(%rip), %ecx
	movl	$.L.str9, %r8d
	movl	%r8d, %edi
	xorl	%r8d, %r8d
	movb	%r8b, %r9b
	movl	%eax, 48(%rsp)          # 4-byte Spill
	movb	%r9b, %al
	callq	printf
	movq	96(%rsp), %rdi          # 8-byte Reload
	movl	%eax, 44(%rsp)          # 4-byte Spill
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	jmp	fclose                  # TAILCALL
.Ltmp32:
	.size	readInput, .Ltmp32-readInput
	.cfi_endproc

	.globl	allocMem
	.align	16, 0x90
	.type	allocMem,@function
allocMem:                               # @allocMem
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp34:
	.cfi_def_cfa_offset 32
	movl	i_ub, %eax
	shll	$3, %eax
	movslq	%eax, %rcx
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	movq	%rcx, %rdi
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, (%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 8(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 16(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 24(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 32(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 40(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 48(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 56(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 64(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 72(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 80(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 88(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 96(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 104(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 112(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 120(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 128(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 136(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 144(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 152(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 160(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 168(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 176(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 184(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 192(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	16(%rsp), %rcx          # 8-byte Reload
	movq	%rax, 200(%rcx)
	movq	8(%rsp), %rdi           # 8-byte Reload
	callq	malloc
	movq	%rax, %rcx
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	%rcx, 208(%rdi)
	cmpq	$0, %rax
	jne	.LBB3_2
# BB#1:                                 # %if.then
	movl	$.Lstr16, %eax
	movl	%eax, %edi
	callq	puts
	movl	%eax, 4(%rsp)           # 4-byte Spill
.LBB3_2:                                # %if.end
	addq	$24, %rsp
	ret
.Ltmp35:
	.size	allocMem, .Ltmp35-allocMem
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI4_0:
	.quad	4611686018427387904     # double 2
	.text
	.globl	init
	.align	16, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp43:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp44:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp45:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp46:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp47:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp48:
	.cfi_def_cfa_offset 56
	subq	$544, %rsp              # imm = 0x220
.Ltmp49:
	.cfi_def_cfa_offset 600
.Ltmp50:
	.cfi_offset %rbx, -56
.Ltmp51:
	.cfi_offset %r12, -48
.Ltmp52:
	.cfi_offset %r13, -40
.Ltmp53:
	.cfi_offset %r14, -32
.Ltmp54:
	.cfi_offset %r15, -24
.Ltmp55:
	.cfi_offset %rbp, -16
	movl	imin, %eax
	movl	%eax, 8(%rdi)
	movl	imax, %eax
	movl	%eax, 20(%rdi)
	movl	jmin, %eax
	movl	%eax, 12(%rdi)
	movl	jmax, %eax
	movl	%eax, 24(%rdi)
	movl	kmin, %eax
	movl	%eax, 16(%rdi)
	movl	kmax, %eax
	movl	%eax, 28(%rdi)
	movl	jp, %eax
	movl	%eax, 68(%rdi)
	movl	kp, %eax
	movl	%eax, 72(%rdi)
	movl	i_ub, %eax
	cmpl	$0, %eax
	movq	%rdx, 536(%rsp)         # 8-byte Spill
	movq	%rsi, 528(%rsp)         # 8-byte Spill
	movq	%rcx, 520(%rsp)         # 8-byte Spill
	movl	%eax, 516(%rsp)         # 4-byte Spill
	jle	.LBB4_2
# BB#1:                                 # %for.body.lr.ph
	movl	$0, %eax
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	208(%rcx), %rdx
	movq	200(%rcx), %rsi
	movq	192(%rcx), %rdi
	movq	184(%rcx), %r8
	movq	176(%rcx), %r9
	movq	168(%rcx), %r10
	movq	160(%rcx), %r11
	movq	152(%rcx), %rbx
	movq	144(%rcx), %r14
	movq	136(%rcx), %r15
	movq	128(%rcx), %r12
	movq	120(%rcx), %r13
	movq	112(%rcx), %rbp
	movq	104(%rcx), %rcx
	movq	%rcx, 504(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	96(%rcx), %rcx
	movq	%rcx, 496(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	88(%rcx), %rcx
	movq	%rcx, 488(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	80(%rcx), %rcx
	movq	%rcx, 480(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	72(%rcx), %rcx
	movq	%rcx, 472(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	64(%rcx), %rcx
	movq	%rcx, 464(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	56(%rcx), %rcx
	movq	%rcx, 456(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	48(%rcx), %rcx
	movq	%rcx, 448(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	40(%rcx), %rcx
	movq	%rcx, 440(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	32(%rcx), %rcx
	movq	%rcx, 432(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	24(%rcx), %rcx
	movq	%rcx, 424(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	16(%rcx), %rcx
	movq	%rcx, 416(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	8(%rcx), %rcx
	movq	%rcx, 408(%rsp)         # 8-byte Spill
	movq	528(%rsp), %rcx         # 8-byte Reload
	movq	(%rcx), %rcx
	movq	%rcx, 400(%rsp)         # 8-byte Spill
	movq	504(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 392(%rsp)         # 8-byte Spill
	movq	496(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 384(%rsp)         # 8-byte Spill
	movq	488(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 376(%rsp)         # 8-byte Spill
	movq	480(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 368(%rsp)         # 8-byte Spill
	movq	472(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 360(%rsp)         # 8-byte Spill
	movq	464(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 352(%rsp)         # 8-byte Spill
	movq	456(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 344(%rsp)         # 8-byte Spill
	movq	448(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 336(%rsp)         # 8-byte Spill
	movq	440(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 328(%rsp)         # 8-byte Spill
	movq	432(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 320(%rsp)         # 8-byte Spill
	movq	424(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 312(%rsp)         # 8-byte Spill
	movq	416(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 304(%rsp)         # 8-byte Spill
	movq	408(%rsp), %rcx         # 8-byte Reload
	movq	%rcx, 296(%rsp)         # 8-byte Spill
	movq	400(%rsp), %rcx         # 8-byte Reload
	movl	%eax, 292(%rsp)         # 4-byte Spill
	movl	%eax, 288(%rsp)         # 4-byte Spill
	movl	292(%rsp), %eax         # 4-byte Reload
	movq	%rcx, 280(%rsp)         # 8-byte Spill
	movq	520(%rsp), %rcx         # 8-byte Reload
	movl	%eax, 276(%rsp)         # 4-byte Spill
	movq	%rcx, 264(%rsp)         # 8-byte Spill
	movq	%r13, 256(%rsp)         # 8-byte Spill
	movq	%rdx, 248(%rsp)         # 8-byte Spill
	movq	%rsi, 240(%rsp)         # 8-byte Spill
	movq	%rdi, 232(%rsp)         # 8-byte Spill
	movq	%r8, 224(%rsp)          # 8-byte Spill
	movq	%r9, 216(%rsp)          # 8-byte Spill
	movq	%r10, 208(%rsp)         # 8-byte Spill
	movq	%r11, 200(%rsp)         # 8-byte Spill
	movq	%rbx, 192(%rsp)         # 8-byte Spill
	movq	%r14, 184(%rsp)         # 8-byte Spill
	movq	%r15, 176(%rsp)         # 8-byte Spill
	movq	%r12, 168(%rsp)         # 8-byte Spill
	movq	%rbp, 160(%rsp)         # 8-byte Spill
	jmp	.LBB4_3
.LBB4_2:                                # %for.cond106.preheader
	movl	$0, %eax
	movl	x_size, %ecx
	cmpl	$0, %ecx
	movl	%eax, %edx
	movq	536(%rsp), %rsi         # 8-byte Reload
	movl	%edx, 156(%rsp)         # 4-byte Spill
	movl	%ecx, 152(%rsp)         # 4-byte Spill
	movl	%eax, 148(%rsp)         # 4-byte Spill
	movq	%rsi, 136(%rsp)         # 8-byte Spill
	jg	.LBB4_4
	jmp	.LBB4_5
.LBB4_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	264(%rsp), %rax         # 8-byte Reload
	movl	276(%rsp), %ecx         # 4-byte Reload
	movl	288(%rsp), %edx         # 4-byte Reload
	movq	280(%rsp), %rsi         # 8-byte Reload
	movq	296(%rsp), %rdi         # 8-byte Reload
	movq	304(%rsp), %r8          # 8-byte Reload
	movq	312(%rsp), %r9          # 8-byte Reload
	movq	320(%rsp), %r10         # 8-byte Reload
	movq	328(%rsp), %r11         # 8-byte Reload
	movq	336(%rsp), %rbx         # 8-byte Reload
	movq	344(%rsp), %r14         # 8-byte Reload
	movq	352(%rsp), %r15         # 8-byte Reload
	movq	360(%rsp), %r12         # 8-byte Reload
	movq	368(%rsp), %r13         # 8-byte Reload
	movq	376(%rsp), %rbp         # 8-byte Reload
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	384(%rsp), %rax         # 8-byte Reload
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	392(%rsp), %rax         # 8-byte Reload
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	160(%rsp), %rax         # 8-byte Reload
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	256(%rsp), %rax         # 8-byte Reload
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	168(%rsp), %rax         # 8-byte Reload
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	176(%rsp), %rax         # 8-byte Reload
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	184(%rsp), %rax         # 8-byte Reload
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	192(%rsp), %rax         # 8-byte Reload
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	200(%rsp), %rax         # 8-byte Reload
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	208(%rsp), %rax         # 8-byte Reload
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	216(%rsp), %rax         # 8-byte Reload
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	224(%rsp), %rax         # 8-byte Reload
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	232(%rsp), %rax         # 8-byte Reload
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	240(%rsp), %rax         # 8-byte Reload
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	248(%rsp), %rax         # 8-byte Reload
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	128(%rsp), %rax         # 8-byte Reload
	addq	$8, %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	128(%rsp), %rax         # 8-byte Reload
	movq	$0, (%rax)
                                        # implicit-def: XMM0
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	movq	%rsi, %rax
	addq	$8, %rax
	vmovsd	%xmm0, (%rsi)
	incl	%edx
	movl	%ecx, %esi
	incl	%esi
                                        # implicit-def: XMM0
	vcvtsi2sdl	%esi, %xmm0, %xmm0
	movq	%rax, -8(%rsp)          # 8-byte Spill
	movq	%rdi, %rax
	addq	$8, %rax
	vmovsd	%xmm0, (%rdi)
	movl	%ecx, %edi
	addl	$2, %edi
                                        # implicit-def: XMM0
	vcvtsi2sdl	%edi, %xmm0, %xmm0
	movq	%r8, %rdi
	addq	$8, %rdi
	vmovsd	%xmm0, (%r8)
	movl	%ecx, %r8d
	addl	$3, %r8d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r8d, %xmm0, %xmm0
	movq	%r9, %r8
	addq	$8, %r8
	vmovsd	%xmm0, (%r9)
	movl	%ecx, %r9d
	addl	$4, %r9d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r9d, %xmm0, %xmm0
	movq	%r10, %r9
	addq	$8, %r9
	vmovsd	%xmm0, (%r10)
	movl	%ecx, %r10d
	addl	$5, %r10d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r10d, %xmm0, %xmm0
	movq	%r11, %r10
	addq	$8, %r10
	vmovsd	%xmm0, (%r11)
	movl	%ecx, %r11d
	addl	$6, %r11d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r11d, %xmm0, %xmm0
	movq	%rbx, %r11
	addq	$8, %r11
	vmovsd	%xmm0, (%rbx)
	movl	%ecx, %ebx
	addl	$7, %ebx
                                        # implicit-def: XMM0
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	movq	%r14, %rbx
	addq	$8, %rbx
	vmovsd	%xmm0, (%r14)
	movl	%ecx, %r14d
	addl	$8, %r14d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r14d, %xmm0, %xmm0
	movq	%r15, %r14
	addq	$8, %r14
	vmovsd	%xmm0, (%r15)
	movl	%ecx, %r15d
	addl	$9, %r15d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r15d, %xmm0, %xmm0
	movq	%r12, %r15
	addq	$8, %r15
	vmovsd	%xmm0, (%r12)
	movl	%ecx, %r12d
	addl	$10, %r12d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r12d, %xmm0, %xmm0
	movq	%r13, %r12
	addq	$8, %r12
	vmovsd	%xmm0, (%r13)
	movl	%ecx, %r13d
	addl	$11, %r13d
                                        # implicit-def: XMM0
	vcvtsi2sdl	%r13d, %xmm0, %xmm0
	movq	%rbp, %r13
	addq	$8, %r13
	vmovsd	%xmm0, (%rbp)
	movl	%ecx, %ebp
	addl	$12, %ebp
                                        # implicit-def: XMM0
	vcvtsi2sdl	%ebp, %xmm0, %xmm0
	movq	120(%rsp), %rbp         # 8-byte Reload
	addq	$8, %rbp
	movq	%rax, -16(%rsp)         # 8-byte Spill
	movq	120(%rsp), %rax         # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$13, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	112(%rsp), %rax         # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -24(%rsp)         # 8-byte Spill
	movq	112(%rsp), %rax         # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$14, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	104(%rsp), %rax         # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	movq	104(%rsp), %rax         # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$15, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	96(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -40(%rsp)         # 8-byte Spill
	movq	96(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$16, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	88(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -48(%rsp)         # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$17, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	80(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -56(%rsp)         # 8-byte Spill
	movq	80(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$18, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	72(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -64(%rsp)         # 8-byte Spill
	movq	72(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$19, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	64(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -72(%rsp)         # 8-byte Spill
	movq	64(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$20, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	56(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -80(%rsp)         # 8-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$21, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	48(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -88(%rsp)         # 8-byte Spill
	movq	48(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$22, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	40(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -96(%rsp)         # 8-byte Spill
	movq	40(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$23, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	32(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -104(%rsp)        # 8-byte Spill
	movq	32(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$24, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	24(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -112(%rsp)        # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	movl	%ecx, %eax
	addl	$25, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movq	16(%rsp), %rax          # 8-byte Reload
	addq	$8, %rax
	movq	%rax, -120(%rsp)        # 8-byte Spill
	movq	16(%rsp), %rax          # 8-byte Reload
	vmovsd	%xmm0, (%rax)
	addl	$26, %ecx
                                        # implicit-def: XMM0
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$8, %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	vmovsd	%xmm0, (%rcx)
	movl	516(%rsp), %ecx         # 4-byte Reload
	cmpl	%ecx, %esi
	movq	-120(%rsp), %rcx        # 8-byte Reload
	movq	%rax, 248(%rsp)         # 8-byte Spill
	movq	-112(%rsp), %rax        # 8-byte Reload
	movq	%rax, 232(%rsp)         # 8-byte Spill
	movq	-104(%rsp), %rax        # 8-byte Reload
	movq	%rax, 224(%rsp)         # 8-byte Spill
	movq	-96(%rsp), %rax         # 8-byte Reload
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	-88(%rsp), %rax         # 8-byte Reload
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	-80(%rsp), %rax         # 8-byte Reload
	movq	%rax, 200(%rsp)         # 8-byte Spill
	movq	-72(%rsp), %rax         # 8-byte Reload
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	-64(%rsp), %rax         # 8-byte Reload
	movq	%rax, 184(%rsp)         # 8-byte Spill
	movq	-56(%rsp), %rax         # 8-byte Reload
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	-48(%rsp), %rax         # 8-byte Reload
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	-40(%rsp), %rax         # 8-byte Reload
	movq	%rax, 256(%rsp)         # 8-byte Spill
	movq	-32(%rsp), %rax         # 8-byte Reload
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	-24(%rsp), %rax         # 8-byte Reload
	movq	%rax, 392(%rsp)         # 8-byte Spill
	movq	-16(%rsp), %rax         # 8-byte Reload
	movq	%rax, 296(%rsp)         # 8-byte Spill
	movq	-8(%rsp), %rax          # 8-byte Reload
	movq	%rax, 280(%rsp)         # 8-byte Spill
	movq	(%rsp), %rax            # 8-byte Reload
	movq	%rax, 264(%rsp)         # 8-byte Spill
	movq	%rcx, 240(%rsp)         # 8-byte Spill
	movq	%r13, 376(%rsp)         # 8-byte Spill
	movq	%rbp, 384(%rsp)         # 8-byte Spill
	movl	%edx, 288(%rsp)         # 4-byte Spill
	movq	%r8, 312(%rsp)          # 8-byte Spill
	movq	%r9, 320(%rsp)          # 8-byte Spill
	movq	%r10, 328(%rsp)         # 8-byte Spill
	movq	%r11, 336(%rsp)         # 8-byte Spill
	movq	%rbx, 344(%rsp)         # 8-byte Spill
	movq	%r14, 352(%rsp)         # 8-byte Spill
	movq	%r15, 360(%rsp)         # 8-byte Spill
	movq	%r12, 368(%rsp)         # 8-byte Spill
	movq	%rdi, 304(%rsp)         # 8-byte Spill
	movl	%esi, 276(%rsp)         # 4-byte Spill
	jl	.LBB4_3
	jmp	.LBB4_2
.LBB4_4:                                # %for.body109
                                        # =>This Inner Loop Header: Depth=1
	movq	136(%rsp), %rax         # 8-byte Reload
	movl	148(%rsp), %ecx         # 4-byte Reload
	movl	156(%rsp), %edx         # 4-byte Reload
	movabsq	$2, %rsi
	vmovsd	.LCPI4_0, %xmm0
                                        # implicit-def: XMM1
	vcvtsi2sdl	%ecx, %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	movq	%rax, %rdi
	addq	$8, %rdi
	vmovsd	%xmm0, (%rax)
	addl	$1, %edx
	addl	$1, %ecx
	movl	152(%rsp), %r8d         # 4-byte Reload
	cmpl	%r8d, %ecx
	movl	%ecx, 148(%rsp)         # 4-byte Spill
	movq	%rsi, -128(%rsp)        # 8-byte Spill
	movl	%edx, 156(%rsp)         # 4-byte Spill
	movq	%rdi, 136(%rsp)         # 8-byte Spill
	jl	.LBB4_4
.LBB4_5:                                # %for.end114
	addq	$544, %rsp              # imm = 0x220
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp56:
	.size	init, .Ltmp56-init
	.cfi_endproc

	.type	errors,@object          # @errors
	.bss
	.globl	errors
	.align	4
errors:
	.long	0                       # 0x0
	.size	errors, 4

	.type	i_ub,@object            # @i_ub
	.comm	i_ub,4,4
	.type	x_size,@object          # @x_size
	.comm	x_size,4,4
	.type	.L.str2,@object         # @.str2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str2:
	.asciz	"i = %10d      b[i] = %.20f \n"
	.size	.L.str2, 29

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"\nWall time = %f seconds. \n"
	.size	.L.str3, 27

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	"\nCPU  time = %f seconds. \n\n"
	.size	.L.str4, 28

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	"Total errors: %d\n"
	.size	.L.str5, 18

	.type	kmin,@object            # @kmin
	.comm	kmin,4,4
	.type	kmax,@object            # @kmax
	.comm	kmax,4,4
	.type	jmin,@object            # @jmin
	.comm	jmin,4,4
	.type	jmax,@object            # @jmax
	.comm	jmax,4,4
	.type	imin,@object            # @imin
	.comm	imin,4,4
	.type	imax,@object            # @imax
	.comm	imax,4,4
	.type	kp,@object              # @kp
	.comm	kp,4,4
	.type	jp,@object              # @jp
	.comm	jp,4,4
	.type	i_lb,@object            # @i_lb
	.comm	i_lb,4,4
	.type	.Lstr,@object           # @str
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr:
	.asciz	"\nSequoia Benchmark Version 1.0\n"
	.size	.Lstr, 32

	.type	.Lstr6,@object          # @str6
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr6:
	.asciz	"***** results "
	.size	.Lstr6, 15

	.type	.L.str,@object          # @.str
.L.str:
	.asciz	"irsmk_input_50"
	.size	.L.str, 15

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"r"
	.size	.L.str1, 2

	.type	.L.str43,@object        # @.str43
.L.str43:
	.asciz	"%d %d %d %d %d %d %d %d"
	.size	.L.str43, 24

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	"kmin = %8d     kmax = %8d \njmin = %8d     jmax = %8d \nimin = %8d     imax = %8d \nkp   = %8d     jp   = %8d \n \n \n"
	.size	.L.str6, 113

	.type	.L.str9,@object         # @.str9
.L.str9:
	.asciz	"i_lb = %10d    i_ub = %10d    x_size = %10d \n \n \n"
	.size	.L.str9, 50

	.type	.Lstr4,@object          # @str4
.Lstr4:
	.asciz	"***** input  "
	.size	.Lstr4, 14

	.type	.Lstr11,@object         # @str11
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr11:
	.asciz	"***** array bounds  "
	.size	.Lstr11, 21

	.type	.Lstr13,@object         # @str13
	.align	16
.Lstr13:
	.asciz	"      lb of xdbl < 0 "
	.size	.Lstr13, 22

	.type	.Lstr14,@object         # @str14
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr14:
	.asciz	"***** ERROR "
	.size	.Lstr14, 13

	.type	.Lstr15,@object         # @str15
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr15:
	.asciz	"      Cannot open input file irsmk_input "
	.size	.Lstr15, 42

	.type	.Lstr16,@object         # @str16
	.align	16
.Lstr16:
	.asciz	"*****ERROR: allocMem out of memory "
	.size	.Lstr16, 36


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
