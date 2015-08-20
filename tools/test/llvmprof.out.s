	.file	"IRSmk.bc"
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
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp8:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp9:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp10:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp11:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp12:
	.cfi_def_cfa_offset 56
	subq	$328, %rsp              # imm = 0x148
.Ltmp13:
	.cfi_def_cfa_offset 384
.Ltmp14:
	.cfi_offset %rbx, -56
.Ltmp15:
	.cfi_offset %r12, -48
.Ltmp16:
	.cfi_offset %r13, -40
.Ltmp17:
	.cfi_offset %r14, -32
.Ltmp18:
	.cfi_offset %r15, -24
.Ltmp19:
	.cfi_offset %rbp, -16
	movl	$.Lstr, %edi
	callq	puts
	xorl	%eax, %eax
	callq	readInput
	movslq	i_ub(%rip), %rdi
	shlq	$3, %rdi
	callq	malloc
	movq	%rax, %r12
	movslq	x_size(%rip), %rdi
	shlq	$3, %rdi
	callq	malloc
	movq	%rax, %rbx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	callq	allocMem
	leaq	248(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r12, %rcx
	callq	init
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	movl	$5000, %ebp             # imm = 0x1388
	callq	clock
	movq	%rax, %r14
	.align	16, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r12, %rcx
	callq	rmatmult3
	decl	%ebp
	jne	.LBB0_1
# BB#2:                                 # %for.end
	xorl	%ebx, %ebx
	leaq	(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	movq	%rax, %r15
	movl	$.Lstr6, %edi
	callq	puts
	cmpl	$0, i_ub(%rip)
	jle	.LBB0_4
	.align	16, 0x90
.LBB0_3:                                # %for.body14
                                        # =>This Inner Loop Header: Depth=1
	movslq	%ebx, %rbx
	vmovsd	(%r12,%rbx,8), %xmm0
	movl	$.L.str2, %edi
	movb	$1, %al
	movl	%ebx, %esi
	callq	printf
	movslq	i_ub(%rip), %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$33, %rcx
	addl	%edx, %ecx
	addl	%ecx, %ebx
	cmpl	%eax, %ebx
	jl	.LBB0_3
.LBB0_4:                                # %for.end17
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	subq	16(%rsp), %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	subq	24(%rsp), %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vdivsd	.LCPI0_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movl	$.L.str3, %edi
	movb	$1, %al
	callq	printf
	subq	%r14, %r15
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%r15, %xmm0, %xmm0
	vdivsd	.LCPI0_0(%rip), %xmm0, %xmm0
	movl	$.L.str4, %edi
	movb	$1, %al
	callq	printf
	movl	errors(%rip), %esi
	movl	$.L.str5, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$328, %rsp              # imm = 0x148
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp20:
	.size	main, .Ltmp20-main
	.cfi_endproc

	.globl	rmatmult3
	.align	16, 0x90
	.type	rmatmult3,@function
rmatmult3:                              # @rmatmult3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp28:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp29:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp30:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp31:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp32:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp33:
	.cfi_def_cfa_offset 56
	subq	$312, %rsp              # imm = 0x138
.Ltmp34:
	.cfi_def_cfa_offset 368
.Ltmp35:
	.cfi_offset %rbx, -56
.Ltmp36:
	.cfi_offset %r12, -48
.Ltmp37:
	.cfi_offset %r13, -40
.Ltmp38:
	.cfi_offset %r14, -32
.Ltmp39:
	.cfi_offset %r15, -24
.Ltmp40:
	.cfi_offset %rbp, -16
	movq	%rcx, 288(%rsp)         # 8-byte Spill
	movq	%rsi, %r11
	movq	%rdi, %r14
	movl	16(%r14), %r12d
	movl	28(%r14), %esi
	movl	%esi, -120(%rsp)        # 4-byte Spill
	movl	$1, %eax
	cmpl	%esi, %r12d
	jge	.LBB1_5
# BB#1:                                 # %for.cond141.preheader.lr.ph
	movl	8(%r14), %r8d
	movl	%r8d, -40(%rsp)         # 4-byte Spill
	movl	12(%r14), %esi
	movl	%esi, -112(%rsp)        # 4-byte Spill
	movl	%esi, %r10d
	movl	20(%r14), %esi
	movl	%esi, 244(%rsp)         # 4-byte Spill
	movslq	72(%r14), %r15
	movq	%r15, -32(%rsp)         # 8-byte Spill
	movslq	68(%r14), %rbx
	movq	%rbx, -128(%rsp)        # 8-byte Spill
	leaq	(%r15,%rbx), %rsi
	movq	%rsi, 304(%rsp)         # 8-byte Spill
	movl	$1, %esi
	movl	$1, %r13d
	movq	%rbx, %rbp
	subq	%r15, %rbp
	movq	%rbp, 176(%rsp)         # 8-byte Spill
	leaq	-1(%rbp), %rdi
	movq	%rdi, 184(%rsp)         # 8-byte Spill
	leaq	1(%rbp), %rdi
	movq	%rdi, 232(%rsp)         # 8-byte Spill
	movl	%r12d, %r9d
	imull	%r15d, %r9d
	addl	%r8d, %r9d
	movl	%ebx, %edi
	imull	%r10d, %edi
	addl	%r9d, %edi
	movl	%edi, -116(%rsp)        # 4-byte Spill
	movq	%rbx, %r8
	leaq	-1(%r8), %rbx
	movq	%rbx, 256(%rsp)         # 8-byte Spill
	leaq	1(%r8), %rbp
	movq	%rbp, 248(%rsp)         # 8-byte Spill
	movq	%r15, %rdi
	subq	%r8, %rdi
	movq	%rdi, 224(%rsp)         # 8-byte Spill
	leaq	-1(%rdi), %r9
	movq	%r9, 216(%rsp)          # 8-byte Spill
	leaq	1(%rdi), %rdi
	movq	%rdi, 208(%rsp)         # 8-byte Spill
	leaq	-1(%r15), %rdi
	movq	%rdi, 200(%rsp)         # 8-byte Spill
	leaq	1(%r15), %rdi
	movq	%rdi, 192(%rsp)         # 8-byte Spill
	movq	(%r11), %rdi
	movq	%rdi, -16(%rsp)         # 8-byte Spill
	movq	8(%r11), %rdi
	movq	%rdi, -8(%rsp)          # 8-byte Spill
	movq	16(%r11), %rdi
	movq	%rdi, (%rsp)            # 8-byte Spill
	movq	24(%r11), %rdi
	movq	%rdi, 168(%rsp)         # 8-byte Spill
	movq	32(%r11), %rdi
	movq	%rdi, 160(%rsp)         # 8-byte Spill
	movq	40(%r11), %rdi
	movq	%rdi, 152(%rsp)         # 8-byte Spill
	movq	48(%r11), %rdi
	movq	%rdi, 144(%rsp)         # 8-byte Spill
	movq	56(%r11), %rdi
	movq	%rdi, 136(%rsp)         # 8-byte Spill
	movq	64(%r11), %rdi
	movq	%rdi, 128(%rsp)         # 8-byte Spill
	movq	72(%r11), %rdi
	movq	%rdi, 120(%rsp)         # 8-byte Spill
	movq	80(%r11), %rdi
	movq	%rdi, 112(%rsp)         # 8-byte Spill
	movq	88(%r11), %rdi
	movq	%rdi, 104(%rsp)         # 8-byte Spill
	movq	96(%r11), %rdi
	movq	%rdi, 96(%rsp)          # 8-byte Spill
	movq	104(%r11), %rdi
	movq	%rdi, 88(%rsp)          # 8-byte Spill
	movq	112(%r11), %rdi
	movq	%rdi, 80(%rsp)          # 8-byte Spill
	movq	120(%r11), %rdi
	movq	%rdi, 72(%rsp)          # 8-byte Spill
	movq	128(%r11), %rdi
	movq	%rdi, 64(%rsp)          # 8-byte Spill
	movq	136(%r11), %rdi
	movq	%rdi, 56(%rsp)          # 8-byte Spill
	movq	144(%r11), %rdi
	movq	%rdi, 48(%rsp)          # 8-byte Spill
	movq	152(%r11), %rdi
	movq	%rdi, 40(%rsp)          # 8-byte Spill
	movq	160(%r11), %rdi
	movq	%rdi, 32(%rsp)          # 8-byte Spill
	movq	168(%r11), %rdi
	movq	%rdi, 24(%rsp)          # 8-byte Spill
	movq	176(%r11), %rdi
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	movq	184(%r11), %rdi
	movq	%rdi, 8(%rsp)           # 8-byte Spill
	movq	192(%r11), %rdi
	movq	%rdi, -64(%rsp)         # 8-byte Spill
	movq	200(%r11), %rdi
	movq	%rdi, -72(%rsp)         # 8-byte Spill
	movq	304(%rsp), %r10         # 8-byte Reload
	movq	%r10, %r8
	movq	%r15, -48(%rsp)         # 8-byte Spill
	movq	-128(%rsp), %r9         # 8-byte Reload
	movq	%r9, -56(%rsp)          # 8-byte Spill
	leaq	-1(%r15,%r9), %rdi
	movq	%rdi, -88(%rsp)         # 8-byte Spill
	leaq	1(%r15,%r9), %rdi
	movq	%rdi, -96(%rsp)         # 8-byte Spill
	movl	24(%r14), %edi
	movl	%edi, -36(%rsp)         # 4-byte Spill
	movq	%r10, %rdi
	subq	%rdi, %rsi
	movq	%rsi, 272(%rsp)         # 8-byte Spill
	subq	%r15, %r13
	movq	%r13, 264(%rsp)         # 8-byte Spill
	subq	%r9, %rax
	movq	%rax, 280(%rsp)         # 8-byte Spill
	movq	208(%r11), %rdi
	movq	%rdi, -104(%rsp)        # 8-byte Spill
	notq	%r8
	movq	%r8, -80(%rsp)          # 8-byte Spill
	notq	-48(%rsp)               # 8-byte Folded Spill
	notq	-56(%rsp)               # 8-byte Folded Spill
	movq	-96(%rsp), %r14         # 8-byte Reload
	.align	16, 0x90
.LBB1_2:                                # %for.cond141.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_8 Depth 2
                                        #       Child Loop BB1_6 Depth 3
	movq	%rbp, %r8
	movq	%rbx, %r15
	movq	%r13, %r11
	movl	%r12d, -108(%rsp)       # 4-byte Spill
	movl	-36(%rsp), %edi         # 4-byte Reload
	cmpl	%edi, -112(%rsp)        # 4-byte Folded Reload
	jge	.LBB1_4
# BB#3:                                 # %for.cond144.preheader.lr.ph
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	-116(%rsp), %ebx        # 4-byte Reload
	movl	-112(%rsp), %ebp        # 4-byte Reload
	movl	244(%rsp), %edi         # 4-byte Reload
	cmpl	%edi, -40(%rsp)         # 4-byte Folded Reload
	jge	.LBB1_4
	.align	16, 0x90
.LBB1_8:                                # %for.body146.lr.ph.us
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
	movl	%ebp, -24(%rsp)         # 4-byte Spill
	movl	%ebx, -20(%rsp)         # 4-byte Spill
	movl	%ebx, %r12d
	movl	-40(%rsp), %r13d        # 4-byte Reload
	movq	-32(%rsp), %rax         # 8-byte Reload
	movq	-64(%rsp), %r8          # 8-byte Reload
	movq	-48(%rsp), %r11         # 8-byte Reload
	movq	-72(%rsp), %r15         # 8-byte Reload
	movq	-56(%rsp), %rsi         # 8-byte Reload
	movq	-80(%rsp), %rcx         # 8-byte Reload
	movq	-88(%rsp), %rbp         # 8-byte Reload
	movq	-104(%rsp), %rbx        # 8-byte Reload
	.align	16, 0x90
.LBB1_6:                                # %for.body146.us
                                        #   Parent Loop BB1_2 Depth=1
                                        #     Parent Loop BB1_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	%r12d, %r12
	movq	-16(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm0
	leaq	(%r12,%rcx), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm0, %xmm0
	movq	-8(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	%r12, %rdi
	subq	%r10, %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	(%rsp), %rdi            # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	272(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	168(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	leaq	(%r12,%r11), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	160(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	%r12, %rdi
	subq	%rax, %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	152(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	264(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	144(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	184(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	136(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	176(%rsp), %rdi         # 8-byte Reload
	leaq	(%r12,%rdi), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	128(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	232(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 304(%rsp)        # 8-byte Spill
	movq	120(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	leaq	(%r12,%rsi), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm0
	vmovsd	%xmm0, 296(%rsp)        # 8-byte Spill
	movq	112(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm2
	movq	%r12, %rdi
	subq	%r9, %rdi
	vmulsd	(%rdx,%rdi,8), %xmm2, %xmm10
	movq	104(%rsp), %rdi         # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm3
	movq	280(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm3, %xmm11
	movq	72(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm4
	movq	256(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm4, %xmm12
	movq	64(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm5
	leaq	(%r12,%r9), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm5, %xmm13
	movq	56(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm6
	movq	248(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm6, %xmm14
	movq	48(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm7
	movq	216(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm7, %xmm15
	movq	40(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm0
	movq	224(%rsp), %rdi         # 8-byte Reload
	leaq	(%r12,%rdi), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm0, %xmm9
	movq	32(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	movq	208(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm1, %xmm8
	movq	24(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm2
	movq	200(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm2, %xmm2
	movq	16(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm3
	leaq	(%r12,%rax), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm3, %xmm3
	movq	8(%rsp), %rdi           # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm4
	movq	192(%rsp), %rdi         # 8-byte Reload
	leaq	(%rdi,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm4, %xmm4
	vmovsd	(%r8,%r12,8), %xmm5
	leaq	(%rbp,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm5, %xmm5
	vmovsd	(%r15,%r12,8), %xmm6
	leaq	(%r12,%r10), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm6, %xmm6
	vmovsd	(%rbx,%r12,8), %xmm7
	leaq	(%r14,%r12), %rdi
	vmulsd	(%rdx,%rdi,8), %xmm7, %xmm7
	vmovsd	304(%rsp), %xmm0        # 8-byte Reload
	vaddsd	296(%rsp), %xmm0, %xmm0 # 8-byte Folded Reload
	vaddsd	%xmm10, %xmm0, %xmm0
	vaddsd	%xmm11, %xmm0, %xmm0
	movq	96(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	vmulsd	-8(%rdx,%r12,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	88(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	vmulsd	(%rdx,%r12,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movq	80(%rsp), %rdi          # 8-byte Reload
	vmovsd	(%rdi,%r12,8), %xmm1
	vmulsd	8(%rdx,%r12,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm12, %xmm0, %xmm0
	vaddsd	%xmm13, %xmm0, %xmm0
	vaddsd	%xmm14, %xmm0, %xmm0
	vaddsd	%xmm15, %xmm0, %xmm0
	vaddsd	%xmm9, %xmm0, %xmm0
	vaddsd	%xmm8, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm0
	vaddsd	%xmm5, %xmm0, %xmm0
	vaddsd	%xmm6, %xmm0, %xmm0
	vaddsd	%xmm7, %xmm0, %xmm0
	movq	288(%rsp), %rdi         # 8-byte Reload
	vmovsd	%xmm0, (%rdi,%r12,8)
	incl	%r13d
	incl	%r12d
	cmpl	244(%rsp), %r13d        # 4-byte Folded Reload
	jl	.LBB1_6
# BB#7:                                 # %for.inc310.us
                                        #   in Loop: Header=BB1_8 Depth=2
	movq	248(%rsp), %r8          # 8-byte Reload
	movq	256(%rsp), %r15         # 8-byte Reload
	movq	264(%rsp), %r11         # 8-byte Reload
	movq	272(%rsp), %rsi         # 8-byte Reload
	movq	280(%rsp), %rax         # 8-byte Reload
	movq	288(%rsp), %rcx         # 8-byte Reload
	movl	-24(%rsp), %ebp         # 4-byte Reload
	incl	%ebp
	movl	-20(%rsp), %ebx         # 4-byte Reload
	addl	%r9d, %ebx
	cmpl	-36(%rsp), %ebp         # 4-byte Folded Reload
	jne	.LBB1_8
.LBB1_4:                                # %for.inc313
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	-108(%rsp), %r12d       # 4-byte Reload
	incl	%r12d
	movq	-32(%rsp), %rdi         # 8-byte Reload
	addl	%edi, -116(%rsp)        # 4-byte Folded Spill
	cmpl	-120(%rsp), %r12d       # 4-byte Folded Reload
	movq	%r11, %r13
	movq	%r15, %rbx
	movq	%r8, %rbp
	jne	.LBB1_2
.LBB1_5:                                # %for.end315
	addq	$312, %rsp              # imm = 0x138
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp41:
	.size	rmatmult3, .Ltmp41-rmatmult3
	.cfi_endproc

	.globl	readInput
	.align	16, 0x90
	.type	readInput,@function
readInput:                              # @readInput
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp45:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp46:
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
.Ltmp47:
	.cfi_def_cfa_offset 64
.Ltmp48:
	.cfi_offset %rbx, -24
.Ltmp49:
	.cfi_offset %r14, -16
	movl	$.L.str, %edi
	movl	$.L.str1, %esi
	callq	fopen
	movq	%rax, %r14
	testq	%r14, %r14
	je	.LBB2_1
# BB#3:                                 # %if.end
	movl	$kmin, %edx
	movl	$kmax, %ecx
	xorl	%eax, %eax
	movq	$jp, 24(%rsp)
	movq	$kp, 16(%rsp)
	movq	$imax, 8(%rsp)
	movq	$imin, (%rsp)
	movl	$.L.str43, %esi
	movl	$jmin, %r8d
	movl	$jmax, %r9d
	movq	%r14, %rdi
	callq	__isoc99_fscanf
	movl	$.Lstr4, %edi
	callq	puts
	movl	kmin(%rip), %esi
	movl	kmax(%rip), %edx
	movl	jmin(%rip), %ecx
	movl	jmax(%rip), %r8d
	movl	imin(%rip), %r9d
	movl	imax(%rip), %eax
	movl	kp(%rip), %edi
	movl	jp(%rip), %ebx
	movl	%ebx, 16(%rsp)
	movl	%edi, 8(%rsp)
	movl	%eax, (%rsp)
	movl	$.L.str6, %edi
	xorl	%eax, %eax
	callq	printf
	movl	jp(%rip), %eax
	movl	jmin(%rip), %edx
	imull	%eax, %edx
	addl	imin(%rip), %edx
	movl	kp(%rip), %ecx
	movl	kmin(%rip), %esi
	imull	%ecx, %esi
	addl	%edx, %esi
	movl	%esi, i_lb(%rip)
	movl	jmax(%rip), %edx
	decl	%edx
	imull	%eax, %edx
	movl	kmax(%rip), %edi
	decl	%edi
	imull	%ecx, %edi
	addl	imax(%rip), %edx
	addl	%edi, %edx
	movl	%edx, i_ub(%rip)
	subl	%ecx, %esi
	subl	%eax, %esi
	testl	%esi, %esi
	jle	.LBB2_4
# BB#5:                                 # %if.end22
	addl	%ecx, %eax
	leal	12(%rdx,%rax,2), %eax
	movl	%eax, x_size(%rip)
	movl	$.Lstr11, %edi
	callq	puts
	movl	i_lb(%rip), %esi
	movl	i_ub(%rip), %edx
	movl	x_size(%rip), %ecx
	movl	$.L.str9, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%r14, %rdi
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	jmp	fclose                  # TAILCALL
.LBB2_1:                                # %if.then
	movl	$.Lstr14, %edi
	callq	puts
	movl	$.Lstr15, %edi
	jmp	.LBB2_2
.LBB2_4:                                # %if.then19
	movl	$.Lstr14, %edi
	callq	puts
	movl	$.Lstr13, %edi
.LBB2_2:                                # %if.then
	callq	puts
	movl	$1, %edi
	callq	exit
.Ltmp50:
	.size	readInput, .Ltmp50-readInput
	.cfi_endproc

	.globl	allocMem
	.align	16, 0x90
	.type	allocMem,@function
allocMem:                               # @allocMem
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp54:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp55:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp56:
	.cfi_def_cfa_offset 32
.Ltmp57:
	.cfi_offset %rbx, -24
.Ltmp58:
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	i_ub(%rip), %eax
	shll	$3, %eax
	movslq	%eax, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, (%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 8(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 16(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 24(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 32(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 40(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 48(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 56(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 64(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 72(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 80(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 88(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 96(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 104(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 112(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 120(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 128(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 136(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 144(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 152(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 160(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 168(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 176(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 184(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 192(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 200(%r14)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 208(%r14)
	testq	%rax, %rax
	je	.LBB3_2
# BB#1:                                 # %if.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
.LBB3_2:                                # %if.then
	movl	$.Lstr16, %edi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	jmp	puts                    # TAILCALL
.Ltmp59:
	.size	allocMem, .Ltmp59-allocMem
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI4_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	init
	.align	16, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp67:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp68:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp69:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp70:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp71:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp72:
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
.Ltmp73:
	.cfi_def_cfa_offset 112
.Ltmp74:
	.cfi_offset %rbx, -56
.Ltmp75:
	.cfi_offset %r12, -48
.Ltmp76:
	.cfi_offset %r13, -40
.Ltmp77:
	.cfi_offset %r14, -32
.Ltmp78:
	.cfi_offset %r15, -24
.Ltmp79:
	.cfi_offset %rbp, -16
	movq	%rdx, -128(%rsp)        # 8-byte Spill
	movl	imin(%rip), %eax
	movl	%eax, 8(%rdi)
	movl	imax(%rip), %eax
	movl	%eax, 20(%rdi)
	movl	jmin(%rip), %eax
	movl	%eax, 12(%rdi)
	movl	jmax(%rip), %eax
	movl	%eax, 24(%rdi)
	movl	kmin(%rip), %eax
	movl	%eax, 16(%rdi)
	movl	kmax(%rip), %eax
	movl	%eax, 28(%rdi)
	movl	jp(%rip), %eax
	movl	%eax, 68(%rdi)
	movl	kp(%rip), %eax
	movl	%eax, 72(%rdi)
	movl	i_ub(%rip), %edi
	testl	%edi, %edi
	jle	.LBB4_3
# BB#1:                                 # %for.body.lr.ph
	movq	208(%rsi), %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	200(%rsi), %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	192(%rsi), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	184(%rsi), %rax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	176(%rsi), %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	168(%rsi), %rax
	movq	%rax, -8(%rsp)          # 8-byte Spill
	movq	160(%rsi), %rax
	movq	%rax, -16(%rsp)         # 8-byte Spill
	movq	152(%rsi), %rax
	movq	%rax, -24(%rsp)         # 8-byte Spill
	movq	144(%rsi), %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	movq	136(%rsi), %rax
	movq	%rax, -40(%rsp)         # 8-byte Spill
	movq	128(%rsi), %rax
	movq	%rax, -48(%rsp)         # 8-byte Spill
	movq	120(%rsi), %rax
	movq	%rax, -56(%rsp)         # 8-byte Spill
	movq	112(%rsi), %rax
	movq	%rax, -64(%rsp)         # 8-byte Spill
	movq	104(%rsi), %rax
	movq	%rax, -72(%rsp)         # 8-byte Spill
	movq	96(%rsi), %rax
	movq	%rax, -80(%rsp)         # 8-byte Spill
	movq	88(%rsi), %rax
	movq	%rax, -88(%rsp)         # 8-byte Spill
	movq	80(%rsi), %rax
	movq	%rax, -96(%rsp)         # 8-byte Spill
	movq	72(%rsi), %rax
	movq	%rax, -104(%rsp)        # 8-byte Spill
	movq	64(%rsi), %rax
	movq	%rax, -112(%rsp)        # 8-byte Spill
	movq	56(%rsi), %rax
	movq	%rax, -120(%rsp)        # 8-byte Spill
	movq	48(%rsi), %r13
	movq	40(%rsi), %r11
	movq	32(%rsi), %r15
	movq	24(%rsi), %r12
	movq	16(%rsi), %rbp
	movq	(%rsi), %r8
	xorl	%r9d, %r9d
	xorl	%edx, %edx
	movq	8(%rsi), %rsi
	vxorps	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rcx,%rdx)
	vmovsd	%xmm1, (%r8,%rdx)
	movq	%rcx, %r14
	leaq	1(%r9), %rcx
	leal	2(%r9), %r10d
	vcvtsi2sdl	%r10d, %xmm0, %xmm12
	leal	3(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm13
	leal	4(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm14
	leal	5(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm15
	leal	6(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	leal	7(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm7
	leal	8(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm11
	leal	9(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm9
	leal	10(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm10
	leal	11(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm2
	vmovsd	%xmm2, 48(%rsp)         # 8-byte Spill
	leal	12(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm2
	vmovsd	%xmm2, 40(%rsp)         # 8-byte Spill
	leal	13(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm3
	leal	14(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm4
	leal	15(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm5
	leal	16(%r9), %ebx
	vcvtsi2sdl	%ebx, %xmm0, %xmm8
	leal	17(%r9), %ebx
	vcvtsi2sdl	%ecx, %xmm0, %xmm6
	vmovsd	%xmm6, (%rsi,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm6
	leal	18(%r9), %ebx
	vmovsd	%xmm12, (%rbp,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm12
	leal	19(%r9), %ebx
	vmovsd	%xmm13, (%r12,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm13
	leal	20(%r9), %ebx
	vmovsd	%xmm14, (%r15,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm14
	leal	21(%r9), %ebx
	vmovsd	%xmm15, (%r11,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm15
	leal	22(%r9), %ebx
	vmovsd	%xmm0, (%r13,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	leal	23(%r9), %ebx
	movq	-120(%rsp), %rax        # 8-byte Reload
	vmovsd	%xmm7, (%rax,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm7
	leal	24(%r9), %ebx
	movq	-112(%rsp), %rax        # 8-byte Reload
	vmovsd	%xmm11, (%rax,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm11
	leal	25(%r9), %ebx
	movq	-104(%rsp), %rax        # 8-byte Reload
	vmovsd	%xmm9, (%rax,%rdx)
	vcvtsi2sdl	%ebx, %xmm0, %xmm9
	addl	$26, %r9d
	movq	-96(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm10, (%rbx,%rdx)
	vcvtsi2sdl	%r9d, %xmm0, %xmm10
	movq	-88(%rsp), %rbx         # 8-byte Reload
	vmovsd	48(%rsp), %xmm2         # 8-byte Reload
	vmovsd	%xmm2, (%rbx,%rdx)
	movq	-80(%rsp), %rbx         # 8-byte Reload
	vmovsd	40(%rsp), %xmm2         # 8-byte Reload
	vmovsd	%xmm2, (%rbx,%rdx)
	movq	-72(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm3, (%rbx,%rdx)
	movq	-64(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm4, (%rbx,%rdx)
	movq	-56(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm5, (%rbx,%rdx)
	movq	-48(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm8, (%rbx,%rdx)
	movq	-40(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm6, (%rbx,%rdx)
	movq	-32(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm12, (%rbx,%rdx)
	movq	-24(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm13, (%rbx,%rdx)
	movq	-16(%rsp), %rbx         # 8-byte Reload
	vmovsd	%xmm14, (%rbx,%rdx)
	movq	-8(%rsp), %rbx          # 8-byte Reload
	vmovsd	%xmm15, (%rbx,%rdx)
	movq	(%rsp), %rbx            # 8-byte Reload
	vmovsd	%xmm0, (%rbx,%rdx)
	movq	8(%rsp), %rbx           # 8-byte Reload
	vmovsd	%xmm7, (%rbx,%rdx)
	movq	16(%rsp), %rbx          # 8-byte Reload
	vmovsd	%xmm11, (%rbx,%rdx)
	movq	24(%rsp), %rbx          # 8-byte Reload
	vmovsd	%xmm9, (%rbx,%rdx)
	vaddsd	.LCPI4_0(%rip), %xmm1, %xmm1
	movq	32(%rsp), %rbx          # 8-byte Reload
	vmovsd	%xmm10, (%rbx,%rdx)
	leaq	8(%rdx), %rdx
	cmpl	%edi, %ecx
	movq	%rcx, %r9
	movq	%r14, %rcx
	jl	.LBB4_2
.LBB4_3:                                # %for.cond106.preheader
	movl	x_size(%rip), %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	movq	-128(%rsp), %rdx        # 8-byte Reload
	jle	.LBB4_6
# BB#4:
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI4_0(%rip), %xmm1
	.align	16, 0x90
.LBB4_5:                                # %for.body109
                                        # =>This Inner Loop Header: Depth=1
	vaddsd	%xmm0, %xmm0, %xmm2
	vmovsd	%xmm2, (%rdx,%rcx,8)
	vaddsd	%xmm1, %xmm0, %xmm0
	incq	%rcx
	cmpl	%eax, %ecx
	jl	.LBB4_5
.LBB4_6:                                # %for.end114
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp80:
	.size	init, .Ltmp80-init
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
