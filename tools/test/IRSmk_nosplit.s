	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI0_2:
	.quad	5000                    # 0x1388
	.quad	5000                    # 0x1388
.LCPI0_3:
	.quad	4696837146684686336     # double 1.000000e+06
	.quad	4696837146684686336     # double 1.000000e+06
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp5:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp6:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp7:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp8:
	.cfi_def_cfa_offset 40
	subq	$360, %rsp              # imm = 0x168
.Ltmp9:
	.cfi_def_cfa_offset 400
.Ltmp10:
	.cfi_offset %rbx, -40
.Ltmp11:
	.cfi_offset %r12, -32
.Ltmp12:
	.cfi_offset %r14, -24
.Ltmp13:
	.cfi_offset %r15, -16
	movl	$.Lstr, %edi
	callq	puts
	callq	readInput
	vmovd	i_ub(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	movq	%rax, %r15
	vmovd	x_size(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	movq	%rax, %rbx
	leaq	64(%rsp), %r14
	movq	%r14, %rdi
	callq	allocMem
	leaq	280(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	callq	init
	leaq	48(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, (%rsp)           # 16-byte Spill
	vpxor	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm1, 16(%rsp)         # 16-byte Spill
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	callq	rmatmult3
	vmovdqa	16(%rsp), %xmm1         # 16-byte Reload
	vpaddq	.LCPI0_0(%rip), %xmm1, %xmm1
	vpand	.LCPI0_1(%rip), %xmm1, %xmm0
	vpcmpeqq	.LCPI0_2(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_1
# BB#2:                                 # %for.end
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	movq	%rax, %r14
	movl	$.Lstr6, %edi
	callq	puts
	vmovd	i_ub(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpgtq	%xmm3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_5
# BB#3:
	movabsq	$7378697629483820647, %rbx # imm = 0x6666666666666667
	.align	16, 0x90
.LBB0_4:                                # %for.body14
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm3, 16(%rsp)         # 16-byte Spill
	vpextrd	$2, %xmm3, %esi
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm0, %rax
	vmovsd	(%r15,%rax,8), %xmm0
	movl	$.L.str2, %edi
	movb	$1, %al
	callq	printf
	vmovdqa	16(%rsp), %xmm3         # 16-byte Reload
	vmovd	i_ub(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	imulq	%rbx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	%rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm1
	movq	%rcx, %rax
	imulq	%rbx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	%rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpaddq	%xmm3, %xmm1, %xmm3
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_4
.LBB0_5:                                # %for.end17
	vmovq	%r14, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 16(%rsp)         # 16-byte Spill
	vpbroadcastq	32(%rsp), %xmm0
	vpbroadcastq	48(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpbroadcastq	40(%rsp), %xmm1
	vpbroadcastq	56(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vmovq	%xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vdivpd	.LCPI0_3(%rip), %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str3, %edi
	movb	$1, %al
	callq	printf
	vmovdqa	(%rsp), %xmm0           # 16-byte Reload
	vmovdqa	16(%rsp), %xmm1         # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vdivpd	.LCPI0_3(%rip), %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str4, %edi
	movb	$1, %al
	callq	printf
	movl	errors(%rip), %esi
	movl	$.L.str5, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$360, %rsp              # imm = 0x168
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
.Ltmp14:
	.size	main, .Ltmp14-main
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI1_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI1_2:
	.zero	16,255
	.text
	.globl	rmatmult3
	.align	16, 0x90
	.type	rmatmult3,@function
rmatmult3:                              # @rmatmult3
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp22:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp23:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp24:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp25:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp26:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp27:
	.cfi_def_cfa_offset 56
	subq	$648, %rsp              # imm = 0x288
.Ltmp28:
	.cfi_def_cfa_offset 704
.Ltmp29:
	.cfi_offset %rbx, -56
.Ltmp30:
	.cfi_offset %r12, -48
.Ltmp31:
	.cfi_offset %r13, -40
.Ltmp32:
	.cfi_offset %r14, -32
.Ltmp33:
	.cfi_offset %r15, -24
.Ltmp34:
	.cfi_offset %rbp, -16
	movq	%rcx, 640(%rsp)         # 8-byte Spill
	movq	%rsi, %r10
	vmovd	16(%rdi), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, -32(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovd	28(%rdi), %xmm1
	vpbroadcastq	%xmm1, %xmm2
	vmovdqa	%xmm2, -48(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm2, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm2, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_9
# BB#1:                                 # %for.cond141.preheader.lr.ph
	vmovd	12(%rdi), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, -80(%rsp)        # 16-byte Spill
	vmovd	24(%rdi), %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vmovdqa	%xmm2, 176(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm2, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm2, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_9
# BB#2:
	vmovd	8(%rdi), %xmm0
	vpbroadcastq	%xmm0, %xmm6
	vmovd	20(%rdi), %xmm1
	vpbroadcastq	%xmm1, %xmm3
	vmovd	68(%rdi), %xmm2
	vpbroadcastq	%xmm2, %xmm12
	vmovdqa	%xmm12, 160(%rsp)       # 16-byte Spill
	vmovd	72(%rdi), %xmm2
	vpbroadcastq	%xmm2, %xmm10
	vmovdqa	%xmm10, -96(%rsp)       # 16-byte Spill
	movq	(%r10), %r14
	movq	%r14, 632(%rsp)         # 8-byte Spill
	movq	8(%r10), %r15
	movq	%r15, 624(%rsp)         # 8-byte Spill
	movq	16(%r10), %r12
	movq	%r12, 616(%rsp)         # 8-byte Spill
	movq	24(%r10), %rbx
	movq	%rbx, 608(%rsp)         # 8-byte Spill
	movq	32(%r10), %rdi
	movq	%rdi, 600(%rsp)         # 8-byte Spill
	movq	40(%r10), %r11
	movq	%r11, 592(%rsp)         # 8-byte Spill
	movq	48(%r10), %rbp
	movq	%rbp, 584(%rsp)         # 8-byte Spill
	movq	56(%r10), %r8
	movq	%r8, 568(%rsp)          # 8-byte Spill
	movq	64(%r10), %rcx
	movq	%rcx, 576(%rsp)         # 8-byte Spill
	movq	72(%r10), %rax
	movq	%rax, 384(%rsp)         # 8-byte Spill
	movq	80(%r10), %rax
	movq	%rax, 424(%rsp)         # 8-byte Spill
	vpextrq	$1, %xmm10, %rax
	cltq
	vmovq	%rax, %xmm9
	vmovq	%xmm10, %rax
	cltq
	vmovq	%rax, %xmm4
	vpextrq	$1, %xmm12, %rax
	cltq
	vmovq	%rax, %xmm7
	vmovq	%xmm12, %rax
	cltq
	vmovq	%rax, %xmm2
	vpextrq	$1, %xmm6, %rax
	movslq	%eax, %rsi
	vmovq	%rsi, %xmm0
	vmovq	%xmm6, %r9
	movslq	%r9d, %rsi
	vmovq	%rsi, %xmm11
	movq	%rbx, %rsi
	cltq
	vmovq	%rax, %xmm15
	movslq	%r9d, %rax
	movq	%r14, %rbx
	vmovq	%rax, %xmm5
	vpextrq	$1, %xmm3, %rax
	movq	%rax, 416(%rsp)         # 8-byte Spill
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	movq	%rax, 248(%rsp)         # 8-byte Spill
	cltq
	vmovq	%rax, %xmm8
	movq	88(%r10), %rax
	movq	%rax, 232(%rsp)         # 8-byte Spill
	movq	96(%r10), %rax
	movq	%rax, 240(%rsp)         # 8-byte Spill
	movq	104(%r10), %rax
	movq	%rax, 408(%rsp)         # 8-byte Spill
	movq	112(%r10), %rax
	movq	%rax, 400(%rsp)         # 8-byte Spill
	movq	120(%r10), %rax
	movq	%rax, 392(%rsp)         # 8-byte Spill
	movq	128(%r10), %rax
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	136(%r10), %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	144(%r10), %rax
	movq	%rax, 136(%rsp)         # 8-byte Spill
	movq	152(%r10), %r14
	movq	160(%r10), %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	168(%r10), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	176(%r10), %rax
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	184(%r10), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	192(%r10), %rax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movq	200(%r10), %rax
	movq	%rax, 88(%rsp)          # 8-byte Spill
	vpunpcklqdq	%xmm9, %xmm4, %xmm14 # xmm14 = xmm4[0],xmm9[0]
	vpunpcklqdq	%xmm7, %xmm2, %xmm13 # xmm13 = xmm2[0],xmm7[0]
	vpaddq	%xmm13, %xmm14, %xmm2
	vpcmpeqd	%xmm9, %xmm9, %xmm9
	vpxor	%xmm9, %xmm2, %xmm3
	vmovdqa	%xmm3, 544(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI1_0(%rip), %xmm7
	vpsubq	%xmm2, %xmm7, %xmm4
	vmovdqa	%xmm4, 480(%rsp)        # 16-byte Spill
	vpxor	%xmm9, %xmm14, %xmm6
	vmovdqa	%xmm6, 464(%rsp)        # 16-byte Spill
	vpunpcklqdq	%xmm0, %xmm11, %xmm0 # xmm0 = xmm11[0],xmm0[0]
	vmovdqa	%xmm0, 64(%rsp)         # 16-byte Spill
	vpsubq	%xmm14, %xmm7, %xmm0
	vmovdqa	%xmm0, 448(%rsp)        # 16-byte Spill
	vpunpcklqdq	%xmm15, %xmm5, %xmm11 # xmm11 = xmm5[0],xmm15[0]
	vpsubq	%xmm14, %xmm13, %xmm5
	vmovdqa	%xmm5, 256(%rsp)        # 16-byte Spill
	vpunpcklqdq	%xmm1, %xmm8, %xmm8 # xmm8 = xmm8[0],xmm1[0]
	vpaddq	%xmm9, %xmm5, %xmm1
	vmovdqa	%xmm1, 368(%rsp)        # 16-byte Spill
	vpcmpgtq	%xmm11, %xmm8, %xmm1
	vmovdqa	%xmm1, -64(%rsp)        # 16-byte Spill
	vpaddq	%xmm7, %xmm5, %xmm1
	vmovdqa	%xmm1, 352(%rsp)        # 16-byte Spill
	vpxor	%xmm9, %xmm13, %xmm1
	vmovdqa	%xmm1, 336(%rsp)        # 16-byte Spill
	vpsubq	%xmm13, %xmm7, %xmm1
	vmovdqa	%xmm1, 320(%rsp)        # 16-byte Spill
	vpaddq	%xmm9, %xmm13, %xmm1
	vmovdqa	%xmm1, 304(%rsp)        # 16-byte Spill
	vpaddq	%xmm7, %xmm13, %xmm1
	vmovdqa	%xmm1, 288(%rsp)        # 16-byte Spill
	vpsubq	%xmm13, %xmm14, %xmm1
	vmovdqa	%xmm1, 272(%rsp)        # 16-byte Spill
	vpaddq	%xmm9, %xmm1, %xmm5
	vmovdqa	%xmm5, 48(%rsp)         # 16-byte Spill
	vpaddq	%xmm7, %xmm1, %xmm1
	vmovdqa	%xmm1, 16(%rsp)         # 16-byte Spill
	vpaddq	%xmm9, %xmm14, %xmm1
	vmovdqa	%xmm1, (%rsp)           # 16-byte Spill
	vpaddq	%xmm7, %xmm14, %xmm5
	vmovdqa	%xmm5, 528(%rsp)        # 16-byte Spill
	vpaddq	%xmm7, %xmm2, %xmm8
	vmovdqa	%xmm8, 512(%rsp)        # 16-byte Spill
	vpsrlq	$32, %xmm10, %xmm1
	vmovdqa	%xmm1, -112(%rsp)       # 16-byte Spill
	vpsrlq	$32, %xmm12, %xmm1
	vmovdqa	%xmm1, -16(%rsp)        # 16-byte Spill
	movq	208(%r10), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	vpaddq	%xmm9, %xmm2, %xmm12
	vmovdqa	%xmm12, 496(%rsp)       # 16-byte Spill
	.align	16, 0x90
.LBB1_3:                                # %for.cond144.preheader.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_6 Depth 3
	vmovdqa	%xmm0, %xmm9
	vmovdqa	%xmm6, %xmm11
	vmovdqa	%xmm4, %xmm15
	vmovdqa	%xmm12, %xmm10
	vmovdqa	%xmm5, %xmm4
	movq	%rcx, %r13
	movq	%rbp, %r10
	movq	%rdi, %rax
	movq	%rsi, %rbp
	movq	%r12, %rsi
	movq	%r15, %rdi
	movq	640(%rsp), %rcx         # 8-byte Reload
	vmovdqa	-64(%rsp), %xmm0        # 16-byte Reload
	vptest	%xmm0, %xmm0
	je	.LBB1_8
# BB#4:                                 #   in Loop: Header=BB1_3 Depth=1
	vmovdqa	-32(%rsp), %xmm0        # 16-byte Reload
	vmovdqa	-96(%rsp), %xmm1        # 16-byte Reload
	vpmuludq	%xmm1, %xmm0, %xmm10
	vpmuludq	-112(%rsp), %xmm0, %xmm5 # 16-byte Folded Reload
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm10, %xmm10
	vpsrlq	$32, %xmm0, %xmm5
	vpmuludq	%xmm1, %xmm5, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm10, %xmm0
	vmovdqa	%xmm0, 192(%rsp)        # 16-byte Spill
	vmovdqa	-80(%rsp), %xmm6        # 16-byte Reload
	.align	16, 0x90
.LBB1_5:                                # %for.body146.lr.ph.us.us
                                        #   Parent Loop BB1_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
	vmovdqa	%xmm6, 208(%rsp)        # 16-byte Spill
	vmovdqa	160(%rsp), %xmm0        # 16-byte Reload
	vpmuludq	%xmm0, %xmm6, %xmm10
	vpmuludq	-16(%rsp), %xmm6, %xmm5 # 16-byte Folded Reload
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm10, %xmm10
	vpsrlq	$32, %xmm6, %xmm5
	vpmuludq	%xmm0, %xmm5, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm10, %xmm5
	vpaddq	192(%rsp), %xmm5, %xmm0 # 16-byte Folded Reload
	vmovdqa	%xmm0, 432(%rsp)        # 16-byte Spill
	vmovdqa	64(%rsp), %xmm10        # 16-byte Reload
	movq	152(%rsp), %r15         # 8-byte Reload
	movq	144(%rsp), %r12         # 8-byte Reload
	movq	136(%rsp), %r13         # 8-byte Reload
	movq	128(%rsp), %r11         # 8-byte Reload
	movq	120(%rsp), %r8          # 8-byte Reload
	movq	112(%rsp), %r10         # 8-byte Reload
	movq	104(%rsp), %rsi         # 8-byte Reload
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	88(%rsp), %rbp          # 8-byte Reload
	vmovdqa	48(%rsp), %xmm8         # 16-byte Reload
	movq	40(%rsp), %rcx          # 8-byte Reload
	vmovdqa	16(%rsp), %xmm15        # 16-byte Reload
	vmovdqa	(%rsp), %xmm12          # 16-byte Reload
	.align	16, 0x90
.LBB1_6:                                # %for.body146.us.us
                                        #   Parent Loop BB1_3 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqa	432(%rsp), %xmm0        # 16-byte Reload
	vpaddq	%xmm10, %xmm0, %xmm9
	vpextrq	$1, %xmm9, %r9
	movslq	%r9d, %rdi
	vmovq	%rdi, %xmm11
	vmovq	%xmm9, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm0
	vpunpcklqdq	%xmm11, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm11[0]
	vpextrq	$1, %xmm0, %rdi
	movq	632(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm3
	vpaddq	544(%rsp), %xmm0, %xmm4 # 16-byte Folded Reload
	vpextrq	$1, %xmm4, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	movq	624(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm1
	vpsubq	%xmm2, %xmm0, %xmm5
	vmulpd	%xmm4, %xmm3, %xmm3
	vpextrq	$1, %xmm5, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	movq	616(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm5
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovdqa	480(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm0, %xmm4, %xmm4
	vpextrq	$1, %xmm4, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	movq	608(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm5
	vpaddq	464(%rsp), %xmm0, %xmm6 # 16-byte Folded Reload
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm1, %xmm3, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vpsubq	%xmm14, %xmm0, %xmm5
	movq	600(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm6
	vpextrq	$1, %xmm5, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vaddpd	%xmm4, %xmm1, %xmm1
	movq	592(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm4
	vmovdqa	448(%rsp), %xmm6        # 16-byte Reload
	vpaddq	%xmm0, %xmm6, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm4, %xmm3
	vmovdqa	368(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm0, %xmm4, %xmm4
	movq	584(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm6
	vpextrq	$1, %xmm4, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	vmulpd	%xmm4, %xmm6, %xmm4
	vaddpd	%xmm5, %xmm1, %xmm1
	movq	568(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm5
	vpaddq	256(%rsp), %xmm0, %xmm6 # 16-byte Folded Reload
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmovdqa	352(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm0, %xmm5, %xmm5
	movq	576(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm6
	vpextrq	$1, %xmm5, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vaddpd	%xmm4, %xmm1, %xmm1
	movq	384(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm4
	vpaddq	336(%rsp), %xmm0, %xmm6 # 16-byte Folded Reload
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm4, %xmm3
	vpsubq	%xmm13, %xmm0, %xmm4
	movq	424(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm6
	vpextrq	$1, %xmm4, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	vmulpd	%xmm4, %xmm6, %xmm4
	vaddpd	%xmm5, %xmm1, %xmm1
	movq	232(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm5
	vmovdqa	320(%rsp), %xmm6        # 16-byte Reload
	vpaddq	%xmm0, %xmm6, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vpaddq	.LCPI1_2, %xmm0, %xmm5
	movq	240(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm6
	vpextrq	$1, %xmm5, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vaddpd	%xmm4, %xmm1, %xmm1
	movq	408(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm4
	vmovddup	(%rdx,%rdi,8), %xmm6
	vmulpd	%xmm6, %xmm4, %xmm4
	vaddpd	%xmm3, %xmm1, %xmm1
	movq	400(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm3
	vpaddq	%xmm7, %xmm0, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm5, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm5
	vmulpd	%xmm5, %xmm3, %xmm3
	vmovdqa	304(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm0, %xmm5, %xmm5
	movq	392(%rsp), %rbx         # 8-byte Reload
	vmovddup	(%rbx,%rdi,8), %xmm6
	vpextrq	$1, %xmm5, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vaddpd	%xmm4, %xmm1, %xmm1
	vmovddup	(%r15,%rdi,8), %xmm4
	vpaddq	%xmm13, %xmm0, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm4, %xmm3
	vmovdqa	288(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm0, %xmm4, %xmm4
	vmovddup	(%r12,%rdi,8), %xmm6
	vpextrq	$1, %xmm4, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	vmulpd	%xmm4, %xmm6, %xmm4
	vaddpd	%xmm5, %xmm1, %xmm1
	vmovddup	(%r13,%rdi,8), %xmm5
	vpaddq	%xmm0, %xmm8, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vpaddq	272(%rsp), %xmm0, %xmm5 # 16-byte Folded Reload
	vmovddup	(%r14,%rdi,8), %xmm6
	vpextrq	$1, %xmm5, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vaddpd	%xmm4, %xmm1, %xmm1
	vmovddup	(%r11,%rdi,8), %xmm4
	vpaddq	%xmm0, %xmm15, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm4, %xmm3
	vpaddq	%xmm0, %xmm12, %xmm4
	vmovddup	(%r10,%rdi,8), %xmm6
	vpextrq	$1, %xmm4, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	vmulpd	%xmm4, %xmm6, %xmm4
	vaddpd	%xmm5, %xmm1, %xmm1
	vmovddup	(%r8,%rdi,8), %xmm5
	vpaddq	%xmm14, %xmm0, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmovdqa	528(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm0, %xmm5, %xmm5
	vmovddup	(%rax,%rdi,8), %xmm6
	vpextrq	$1, %xmm5, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vaddpd	%xmm4, %xmm1, %xmm1
	vmovddup	(%rsi,%rdi,8), %xmm4
	vmovdqa	496(%rsp), %xmm6        # 16-byte Reload
	vpaddq	%xmm0, %xmm6, %xmm6
	vpextrq	$1, %xmm6, %rbx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm4, %xmm3
	vpaddq	%xmm2, %xmm0, %xmm4
	vmovddup	(%rbp,%rdi,8), %xmm6
	vpextrq	$1, %xmm4, %rbx
	vmovddup	(%rdx,%rbx,8), %xmm4
	vmulpd	%xmm4, %xmm6, %xmm4
	vaddpd	%xmm5, %xmm1, %xmm1
	vmovdqa	512(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm0, %xmm5, %xmm0
	vpextrq	$1, %xmm0, %rbx
	vmovddup	(%rcx,%rdi,8), %xmm0
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	(%rdx,%rbx,8), %xmm3
	vmulpd	%xmm3, %xmm0, %xmm0
	vpaddq	%xmm7, %xmm10, %xmm10
	vaddpd	%xmm4, %xmm1, %xmm1
	vpextrq	$1, %xmm10, %rbx
	movslq	%ebx, %rbx
	vmovq	%rbx, %xmm3
	vmovq	%xmm10, %rbx
	movslq	%ebx, %rbx
	vmovq	%rbx, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vaddpd	%xmm0, %xmm1, %xmm0
	movq	416(%rsp), %rbx         # 8-byte Reload
	movslq	%ebx, %rbx
	vmovq	%rbx, %xmm1
	movq	248(%rsp), %rbx         # 8-byte Reload
	movslq	%ebx, %rbx
	vmovq	%rbx, %xmm4
	vpunpcklqdq	%xmm1, %xmm4, %xmm1 # xmm1 = xmm4[0],xmm1[0]
	vpcmpgtq	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	movq	640(%rsp), %rbx         # 8-byte Reload
	vmovhpd	%xmm0, (%rbx,%rdi,8)
	jne	.LBB1_6
# BB#7:                                 # %for.inc310.us.us
                                        #   in Loop: Header=BB1_5 Depth=2
	vmovdqa	448(%rsp), %xmm9        # 16-byte Reload
	vmovdqa	464(%rsp), %xmm11       # 16-byte Reload
	vmovdqa	480(%rsp), %xmm15       # 16-byte Reload
	vmovdqa	496(%rsp), %xmm10       # 16-byte Reload
	vmovdqa	512(%rsp), %xmm8        # 16-byte Reload
	vmovdqa	528(%rsp), %xmm4        # 16-byte Reload
	vmovdqa	544(%rsp), %xmm3        # 16-byte Reload
	movq	576(%rsp), %r13         # 8-byte Reload
	movq	568(%rsp), %r8          # 8-byte Reload
	movq	584(%rsp), %r10         # 8-byte Reload
	movq	592(%rsp), %r11         # 8-byte Reload
	movq	600(%rsp), %rax         # 8-byte Reload
	movq	608(%rsp), %rbp         # 8-byte Reload
	movq	616(%rsp), %rsi         # 8-byte Reload
	movq	624(%rsp), %rdi         # 8-byte Reload
	movq	632(%rsp), %rbx         # 8-byte Reload
	movq	640(%rsp), %rcx         # 8-byte Reload
	vmovdqa	208(%rsp), %xmm6        # 16-byte Reload
	vpaddq	%xmm7, %xmm6, %xmm6
	vmovdqa	.LCPI1_1(%rip), %xmm0
	vmovdqa	%xmm0, %xmm5
	vpand	%xmm5, %xmm6, %xmm0
	vmovdqa	176(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm5, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_5
.LBB1_8:                                # %for.inc313.us
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	%rcx, 640(%rsp)         # 8-byte Spill
	vmovdqa	-32(%rsp), %xmm0        # 16-byte Reload
	vpaddq	%xmm7, %xmm0, %xmm0
	vmovdqa	%xmm0, -32(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI1_1(%rip), %xmm1
	vmovdqa	%xmm1, %xmm5
	vpand	%xmm5, %xmm0, %xmm0
	vmovdqa	-48(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm5, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	movq	%rdi, %r15
	movq	%rsi, %r12
	movq	%rbp, %rsi
	movq	%rax, %rdi
	movq	%r10, %rbp
	movq	%r13, %rcx
	vmovdqa	%xmm4, %xmm5
	vmovdqa	%xmm10, %xmm12
	vmovdqa	%xmm15, %xmm4
	vmovdqa	%xmm11, %xmm6
	vmovdqa	%xmm9, %xmm0
	je	.LBB1_3
.LBB1_9:                                # %for.end315
	addq	$648, %rsp              # imm = 0x288
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp35:
	.size	rmatmult3, .Ltmp35-rmatmult3
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI2_1:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI2_2:
	.quad	12                      # 0xc
	.quad	12                      # 0xc
	.text
	.globl	readInput
	.align	16, 0x90
	.type	readInput,@function
readInput:                              # @readInput
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp39:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp40:
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
.Ltmp41:
	.cfi_def_cfa_offset 64
.Ltmp42:
	.cfi_offset %rbx, -24
.Ltmp43:
	.cfi_offset %r14, -16
	movl	$.L.str, %edi
	movl	$.L.str1, %esi
	callq	fopen
	movq	%rax, %r14
	vmovq	%r14, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_1
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
	vmovd	imin(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovd	jmin(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vmovd	jp(%rip), %xmm2
	vpbroadcastq	%xmm2, %xmm2
	vpmuludq	%xmm1, %xmm2, %xmm3
	vpsrlq	$32, %xmm1, %xmm4
	vpmuludq	%xmm4, %xmm2, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm3, %xmm3
	vpsrlq	$32, %xmm2, %xmm4
	vpmuludq	%xmm1, %xmm4, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm3, %xmm1
	vpaddq	%xmm0, %xmm1, %xmm0
	vmovd	kmin(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vmovd	kp(%rip), %xmm3
	vpbroadcastq	%xmm3, %xmm3
	vpmuludq	%xmm1, %xmm3, %xmm5
	vpsrlq	$32, %xmm1, %xmm6
	vpmuludq	%xmm6, %xmm3, %xmm6
	vpsllq	$32, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm5, %xmm5
	vpsrlq	$32, %xmm3, %xmm6
	vpmuludq	%xmm1, %xmm6, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm5, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm5
	vpextrd	$2, %xmm5, i_lb(%rip)
	vmovd	imax(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovd	jmax(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	.LCPI2_0(%rip), %xmm8
	vpaddq	%xmm8, %xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm7
	vpmuludq	%xmm4, %xmm1, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm7, %xmm4
	vpsrlq	$32, %xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm4, %xmm1
	vmovd	kmax(%rip), %xmm4
	vpbroadcastq	%xmm4, %xmm4
	vpaddq	%xmm8, %xmm4, %xmm4
	vpmuludq	%xmm3, %xmm4, %xmm7
	vpmuludq	%xmm6, %xmm4, %xmm6
	vpsllq	$32, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm6
	vpsrlq	$32, %xmm4, %xmm4
	vpmuludq	%xmm3, %xmm4, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm6, %xmm4
	vpaddq	%xmm0, %xmm1, %xmm0
	vpaddq	%xmm4, %xmm0, %xmm0
	vpextrd	$2, %xmm0, i_ub(%rip)
	vpaddq	%xmm2, %xmm3, %xmm1
	vpsubq	%xmm1, %xmm5, %xmm2
	vpextrq	$1, %xmm2, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm2, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm3, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm3[0]
	vmovdqa	.LCPI2_1(%rip), %xmm3
	vpcmpgtq	%xmm2, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_4
# BB#5:                                 # %if.end22
	vpaddq	%xmm1, %xmm1, %xmm1
	vpaddq	.LCPI2_2(%rip), %xmm1, %xmm1
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrd	$2, %xmm0, x_size(%rip)
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
.Ltmp44:
	.size	readInput, .Ltmp44-readInput
	.cfi_endproc

	.globl	allocMem
	.align	16, 0x90
	.type	allocMem,@function
allocMem:                               # @allocMem
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp48:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp49:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp50:
	.cfi_def_cfa_offset 32
.Ltmp51:
	.cfi_offset %rbx, -24
.Ltmp52:
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	vmovd	i_ub(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rbx
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
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	movq	%rax, 208(%r14)
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_1
# BB#2:                                 # %if.then
	movl	$.Lstr16, %edi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	jmp	puts                    # TAILCALL
.LBB3_1:                                # %if.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp53:
	.size	allocMem, .Ltmp53-allocMem
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI4_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI4_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI4_2:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI4_3:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI4_4:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI4_5:
	.quad	5                       # 0x5
	.quad	5                       # 0x5
.LCPI4_6:
	.quad	6                       # 0x6
	.quad	6                       # 0x6
.LCPI4_7:
	.quad	7                       # 0x7
	.quad	7                       # 0x7
.LCPI4_8:
	.quad	8                       # 0x8
	.quad	8                       # 0x8
.LCPI4_9:
	.quad	9                       # 0x9
	.quad	9                       # 0x9
.LCPI4_10:
	.quad	10                      # 0xa
	.quad	10                      # 0xa
.LCPI4_11:
	.quad	11                      # 0xb
	.quad	11                      # 0xb
.LCPI4_12:
	.quad	12                      # 0xc
	.quad	12                      # 0xc
.LCPI4_13:
	.quad	13                      # 0xd
	.quad	13                      # 0xd
.LCPI4_14:
	.quad	14                      # 0xe
	.quad	14                      # 0xe
.LCPI4_15:
	.quad	15                      # 0xf
	.quad	15                      # 0xf
.LCPI4_16:
	.quad	16                      # 0x10
	.quad	16                      # 0x10
.LCPI4_17:
	.quad	17                      # 0x11
	.quad	17                      # 0x11
.LCPI4_18:
	.quad	18                      # 0x12
	.quad	18                      # 0x12
.LCPI4_19:
	.quad	19                      # 0x13
	.quad	19                      # 0x13
.LCPI4_20:
	.quad	20                      # 0x14
	.quad	20                      # 0x14
.LCPI4_21:
	.quad	21                      # 0x15
	.quad	21                      # 0x15
.LCPI4_22:
	.quad	22                      # 0x16
	.quad	22                      # 0x16
.LCPI4_23:
	.quad	23                      # 0x17
	.quad	23                      # 0x17
.LCPI4_24:
	.quad	24                      # 0x18
	.quad	24                      # 0x18
.LCPI4_25:
	.quad	25                      # 0x19
	.quad	25                      # 0x19
.LCPI4_26:
	.quad	26                      # 0x1a
	.quad	26                      # 0x1a
.LCPI4_27:
	.quad	8589934584              # 0x1fffffff8
	.quad	8589934584              # 0x1fffffff8
.LCPI4_28:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
.LCPI4_29:
	.long	4                       # 0x4
	.long	5                       # 0x5
	.long	6                       # 0x6
	.long	7                       # 0x7
.LCPI4_31:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI4_32:
	.zero	16
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI4_30:
	.quad	4611686018427387904     # double 2
	.text
	.globl	init
	.align	16, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp61:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp62:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp63:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp64:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp65:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp66:
	.cfi_def_cfa_offset 56
	subq	$856, %rsp              # imm = 0x358
.Ltmp67:
	.cfi_def_cfa_offset 912
.Ltmp68:
	.cfi_offset %rbx, -56
.Ltmp69:
	.cfi_offset %r12, -48
.Ltmp70:
	.cfi_offset %r13, -40
.Ltmp71:
	.cfi_offset %r14, -32
.Ltmp72:
	.cfi_offset %r15, -24
.Ltmp73:
	.cfi_offset %rbp, -16
	movq	%rdx, -104(%rsp)        # 8-byte Spill
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
	vmovd	i_ub(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, -96(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB4_3
# BB#1:                                 # %for.body.lr.ph
	vmovq	%rcx, %xmm2
	vpbroadcastq	208(%rsi), %xmm0
	vpbroadcastq	200(%rsi), %xmm1
	vmovdqa	%xmm1, 592(%rsp)        # 16-byte Spill
	vpbroadcastq	192(%rsi), %xmm1
	vmovdqa	%xmm1, 416(%rsp)        # 16-byte Spill
	vpbroadcastq	184(%rsi), %xmm1
	vmovdqa	%xmm1, 576(%rsp)        # 16-byte Spill
	vpbroadcastq	176(%rsi), %xmm4
	vpbroadcastq	168(%rsi), %xmm1
	vmovdqa	%xmm1, 448(%rsp)        # 16-byte Spill
	vpbroadcastq	160(%rsi), %xmm1
	vmovdqa	%xmm1, 496(%rsp)        # 16-byte Spill
	vpbroadcastq	152(%rsi), %xmm1
	vmovdqa	%xmm1, 480(%rsp)        # 16-byte Spill
	vpbroadcastq	144(%rsi), %xmm1
	vmovdqa	%xmm1, 560(%rsp)        # 16-byte Spill
	vpbroadcastq	136(%rsi), %xmm1
	vmovdqa	%xmm1, 544(%rsp)        # 16-byte Spill
	vpbroadcastq	128(%rsi), %xmm1
	vmovdqa	%xmm1, 528(%rsp)        # 16-byte Spill
	vpbroadcastq	120(%rsi), %xmm1
	vmovdqa	%xmm1, 512(%rsp)        # 16-byte Spill
	vpbroadcastq	112(%rsi), %xmm1
	vmovdqa	%xmm1, 432(%rsp)        # 16-byte Spill
	vpbroadcastq	104(%rsi), %xmm1
	vmovdqa	%xmm1, 464(%rsp)        # 16-byte Spill
	vpbroadcastq	96(%rsi), %xmm1
	vmovdqa	%xmm1, 816(%rsp)        # 16-byte Spill
	vpbroadcastq	88(%rsi), %xmm1
	vmovdqa	%xmm1, 800(%rsp)        # 16-byte Spill
	vpbroadcastq	80(%rsi), %xmm1
	vmovdqa	%xmm1, 784(%rsp)        # 16-byte Spill
	vpbroadcastq	72(%rsi), %xmm1
	vmovdqa	%xmm1, 768(%rsp)        # 16-byte Spill
	vpbroadcastq	64(%rsi), %xmm1
	vmovdqa	%xmm1, 752(%rsp)        # 16-byte Spill
	vpbroadcastq	56(%rsi), %xmm1
	vmovdqa	%xmm1, 736(%rsp)        # 16-byte Spill
	vpbroadcastq	48(%rsi), %xmm1
	vmovdqa	%xmm1, 720(%rsp)        # 16-byte Spill
	vpbroadcastq	40(%rsi), %xmm1
	vmovdqa	%xmm1, 704(%rsp)        # 16-byte Spill
	vpbroadcastq	32(%rsi), %xmm1
	vmovdqa	%xmm1, 688(%rsp)        # 16-byte Spill
	vpbroadcastq	24(%rsi), %xmm1
	vmovdqa	%xmm1, 672(%rsp)        # 16-byte Spill
	vpbroadcastq	16(%rsi), %xmm1
	vmovdqa	%xmm1, 656(%rsp)        # 16-byte Spill
	vpbroadcastq	8(%rsi), %xmm1
	vmovdqa	%xmm1, 640(%rsp)        # 16-byte Spill
	vpbroadcastq	(%rsi), %xmm1
	vmovdqa	%xmm1, 624(%rsp)        # 16-byte Spill
	vpxor	%xmm3, %xmm3, %xmm3
	vmovlhps	%xmm2, %xmm2, %xmm1 # xmm1 = xmm2[0,0]
	vmovaps	%xmm1, 608(%rsp)        # 16-byte Spill
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpaddq	.LCPI4_2(%rip), %xmm3, %xmm2
	vmovdqa	%xmm2, 112(%rsp)        # 16-byte Spill
	vpaddq	.LCPI4_3(%rip), %xmm3, %xmm8
	vmovdqa	%xmm8, 80(%rsp)         # 16-byte Spill
	vpaddq	.LCPI4_4(%rip), %xmm3, %xmm9
	vmovdqa	%xmm9, 48(%rsp)         # 16-byte Spill
	vpaddq	.LCPI4_5(%rip), %xmm3, %xmm10
	vmovdqa	%xmm10, 16(%rsp)        # 16-byte Spill
	vpaddq	.LCPI4_6(%rip), %xmm3, %xmm11
	vmovdqa	%xmm11, -16(%rsp)       # 16-byte Spill
	vpaddq	.LCPI4_7(%rip), %xmm3, %xmm12
	vmovdqa	%xmm12, 160(%rsp)       # 16-byte Spill
	vpaddq	.LCPI4_8(%rip), %xmm3, %xmm15
	vmovdqa	%xmm15, 240(%rsp)       # 16-byte Spill
	vpaddq	.LCPI4_9(%rip), %xmm3, %xmm13
	vmovdqa	%xmm13, 320(%rsp)       # 16-byte Spill
	vpaddq	.LCPI4_10(%rip), %xmm3, %xmm6
	vmovdqa	%xmm6, -80(%rsp)        # 16-byte Spill
	vpaddq	.LCPI4_11(%rip), %xmm3, %xmm14
	vmovdqa	%xmm14, 336(%rsp)       # 16-byte Spill
	vpaddq	.LCPI4_12(%rip), %xmm3, %xmm5
	vmovdqa	%xmm5, 368(%rsp)        # 16-byte Spill
	vpaddq	.LCPI4_13(%rip), %xmm3, %xmm7
	vmovdqa	%xmm7, 288(%rsp)        # 16-byte Spill
	vpaddq	.LCPI4_0(%rip), %xmm3, %xmm1
	vmovdqa	%xmm1, 832(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm3, %rbp
	vmovq	%xmm3, 136(%rsp)        # 8-byte Folded Spill
	vmovq	%xmm1, 152(%rsp)        # 8-byte Folded Spill
	vpextrq	$1, %xmm1, %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	vmovq	%xmm2, 184(%rsp)        # 8-byte Folded Spill
	vmovq	%xmm8, 200(%rsp)        # 8-byte Folded Spill
	vmovq	%xmm9, 208(%rsp)        # 8-byte Folded Spill
	vmovq	%xmm10, 216(%rsp)       # 8-byte Folded Spill
	vmovq	%xmm11, 232(%rsp)       # 8-byte Folded Spill
	vmovq	%xmm12, 256(%rsp)       # 8-byte Folded Spill
	vmovq	%xmm15, 264(%rsp)       # 8-byte Folded Spill
	vmovq	%xmm13, 272(%rsp)       # 8-byte Folded Spill
	vmovq	%xmm6, 304(%rsp)        # 8-byte Folded Spill
	vmovq	%xmm14, %r14
	vpextrq	$1, %xmm5, %rax
	movq	%rax, 392(%rsp)         # 8-byte Spill
	vmovq	%xmm7, 408(%rsp)        # 8-byte Folded Spill
	vpaddq	.LCPI4_14(%rip), %xmm3, %xmm1
	vmovdqa	%xmm1, -48(%rsp)        # 16-byte Spill
	vmovq	%xmm1, 400(%rsp)        # 8-byte Folded Spill
	vpaddq	.LCPI4_15(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 384(%rsp)        # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm15
	vpaddq	.LCPI4_16(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 360(%rsp)        # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm14
	vpaddq	.LCPI4_17(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 280(%rsp)        # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm12
	vpaddq	.LCPI4_18(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 224(%rsp)        # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm11
	vpaddq	.LCPI4_19(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 192(%rsp)        # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm10
	vpaddq	.LCPI4_20(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 128(%rsp)        # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm8
	vpaddq	.LCPI4_21(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 104(%rsp)        # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm9
	vpaddq	.LCPI4_22(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 72(%rsp)         # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm6
	vpaddq	.LCPI4_23(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 40(%rsp)         # 8-byte Folded Spill
	vmovdqa	%xmm1, %xmm2
	vpaddq	.LCPI4_24(%rip), %xmm3, %xmm5
	vmovq	%xmm5, 8(%rsp)          # 8-byte Folded Spill
	vpaddq	.LCPI4_25(%rip), %xmm3, %xmm1
	vmovq	%xmm1, -24(%rsp)        # 8-byte Folded Spill
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	vmovdqa	592(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 592(%rsp)         # 8-byte Spill
	vmovdqa	416(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 416(%rsp)         # 8-byte Spill
	vmovdqa	576(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 576(%rsp)         # 8-byte Spill
	vpextrq	$1, %xmm4, %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	vmovdqa	448(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 448(%rsp)         # 8-byte Spill
	vmovdqa	496(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 496(%rsp)         # 8-byte Spill
	vmovdqa	480(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 480(%rsp)         # 8-byte Spill
	vmovdqa	560(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, -56(%rsp)         # 8-byte Spill
	vmovdqa	544(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, -64(%rsp)         # 8-byte Spill
	vmovdqa	528(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 560(%rsp)         # 8-byte Spill
	vmovdqa	512(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 544(%rsp)         # 8-byte Spill
	vmovdqa	432(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 528(%rsp)         # 8-byte Spill
	vmovdqa	464(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 512(%rsp)         # 8-byte Spill
	vmovdqa	816(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movq	%rax, 816(%rsp)         # 8-byte Spill
	vmovdqa	800(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r13
	vmovdqa	784(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r12
	vmovdqa	768(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r15
	vmovdqa	752(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbx
	vmovdqa	736(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r11
	vmovdqa	720(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r10
	vmovdqa	704(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r9
	vmovdqa	688(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r8
	vmovdqa	672(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rdi
	vmovdqa	656(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rsi
	vmovdqa	640(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rdx
	vmovdqa	624(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rcx
	vmovdqa	608(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	136(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm13
	vunpcklpd	%xmm0, %xmm13, %xmm0 # xmm0 = xmm13[0],xmm0[0]
	movq	$0, (%rax)
	vmovhpd	%xmm0, (%rcx)
	movq	144(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	152(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%rdx)
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	184(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%rsi)
	vmovdqa	80(%rsp), %xmm0         # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	200(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%rdi)
	vmovdqa	48(%rsp), %xmm0         # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	208(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%r8)
	vmovdqa	16(%rsp), %xmm0         # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	216(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%r9)
	vmovdqa	-16(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	232(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%r10)
	vmovdqa	160(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	256(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%r11)
	vmovdqa	240(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	264(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%rbx)
	vmovdqa	320(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	272(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%r15)
	vmovdqa	-80(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movq	304(%rsp), %rbp         # 8-byte Reload
	movslq	%ebp, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%r12)
	vmovdqa	336(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movslq	%ebp, %rbp
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movslq	%r14d, %rbp
	vcvtsi2sdq	%rbp, %xmm0, %xmm7
	vunpcklpd	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0]
	vmovhpd	%xmm0, (%r13)
	leaq	8(%rax), %rax
	vmovq	%rax, %xmm7
	vmovaps	368(%rsp), %xmm0        # 16-byte Reload
	vmovq	%xmm0, %rax
	leaq	8(%rcx), %rcx
	vmovq	%rcx, %xmm0
	vmovaps	%xmm0, 800(%rsp)        # 16-byte Spill
	vmovdqa	-48(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r14
	leaq	8(%rdx), %rdx
	vmovq	%rdx, %xmm0
	vmovaps	%xmm0, 784(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm14, %rcx
	movq	%rcx, 272(%rsp)         # 8-byte Spill
	leaq	8(%rsi), %rsi
	vmovq	%rsi, %xmm0
	vmovaps	%xmm0, 768(%rsp)        # 16-byte Spill
	vmovdqa	288(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rsi
	leaq	8(%rdi), %rdi
	vmovq	%rdi, %xmm0
	vmovaps	%xmm0, 752(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm15, %rdi
	leaq	8(%r8), %rbp
	vmovq	%rbp, %xmm0
	vmovaps	%xmm0, 736(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm12, %rbp
	leaq	8(%r9), %rdx
	vmovq	%rdx, %xmm0
	vmovaps	%xmm0, 720(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm11, %r8
	leaq	8(%r10), %rdx
	vmovq	%rdx, %xmm0
	vmovaps	%xmm0, 464(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm10, %r9
	leaq	8(%r11), %rdx
	vmovq	%rdx, %xmm0
	vmovaps	%xmm0, 432(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm8, %rdx
	leaq	8(%rbx), %rbx
	vmovq	%rbx, %xmm0
	vmovaps	%xmm0, 368(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm9, %rcx
	movq	%rcx, 656(%rsp)         # 8-byte Spill
	leaq	8(%r15), %rbx
	vmovq	%rbx, %xmm0
	vmovaps	%xmm0, 336(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm6, %rcx
	movq	%rcx, 672(%rsp)         # 8-byte Spill
	leaq	8(%r12), %rbx
	vmovq	%rbx, %xmm0
	vmovaps	%xmm0, 320(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm2, %rcx
	movq	%rcx, 608(%rsp)         # 8-byte Spill
	leaq	8(%r13), %rbx
	vmovq	%rbx, %xmm0
	vmovaps	%xmm0, 304(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm5, %rcx
	movq	%rcx, 704(%rsp)         # 8-byte Spill
	vpextrq	$1, %xmm1, %rcx
	movq	%rcx, 640(%rsp)         # 8-byte Spill
	vpaddq	.LCPI4_26(%rip), %xmm3, %xmm1
	vmovq	%xmm1, 624(%rsp)        # 8-byte Folded Spill
	movq	392(%rsp), %rbx         # 8-byte Reload
	movslq	%ebx, %r15
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%r15, %xmm0, %xmm2
	vpextrq	$1, %xmm1, %rcx
	movq	%rcx, 688(%rsp)         # 8-byte Spill
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%esi, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	816(%rsp), %rcx         # 8-byte Reload
	vmovhpd	%xmm1, (%rcx)
	movq	408(%rsp), %rax         # 8-byte Reload
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%r14d, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	512(%rsp), %r13         # 8-byte Reload
	vmovhpd	%xmm1, (%r13)
	movq	400(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%edi, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	528(%rsp), %r15         # 8-byte Reload
	vmovhpd	%xmm1, (%r15)
	movq	384(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movq	272(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	544(%rsp), %r14         # 8-byte Reload
	vmovhpd	%xmm1, (%r14)
	movq	360(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%ebp, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	560(%rsp), %r11         # 8-byte Reload
	vmovhpd	%xmm1, (%r11)
	movq	280(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%r8d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	-64(%rsp), %r10         # 8-byte Reload
	vmovhpd	%xmm1, (%r10)
	movq	224(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%r9d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	-56(%rsp), %r12         # 8-byte Reload
	vmovhpd	%xmm1, (%r12)
	movq	192(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%edx, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	480(%rsp), %r9          # 8-byte Reload
	vmovhpd	%xmm1, (%r9)
	movq	128(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movq	656(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	496(%rsp), %r8          # 8-byte Reload
	vmovhpd	%xmm1, (%r8)
	movq	104(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movq	672(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	448(%rsp), %rbx         # 8-byte Reload
	vmovhpd	%xmm1, (%rbx)
	movq	72(%rsp), %rax          # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movq	608(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	-32(%rsp), %rbp         # 8-byte Reload
	vmovhpd	%xmm1, (%rbp)
	movq	40(%rsp), %rax          # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movq	704(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	576(%rsp), %rdi         # 8-byte Reload
	vmovhpd	%xmm1, (%rdi)
	movq	8(%rsp), %rax           # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movq	640(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	416(%rsp), %rsi         # 8-byte Reload
	vmovhpd	%xmm1, (%rsi)
	movq	-24(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movq	688(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	movq	592(%rsp), %rdx         # 8-byte Reload
	vmovhpd	%xmm1, (%rdx)
	movq	624(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovdqa	.LCPI4_1(%rip), %xmm0
	vmovdqa	832(%rsp), %xmm2        # 16-byte Reload
	vpand	%xmm0, %xmm2, %xmm2
	leaq	8(%rcx), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	vmovhpd	%xmm1, (%rcx)
	vmovdqa	-96(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm0, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm2, %xmm1
	vmovq	%rax, %xmm15
	leaq	8(%r13), %rax
	vptest	%xmm1, %xmm1
	vmovq	%rax, %xmm9
	leaq	8(%r15), %rax
	vmovq	%rax, %xmm13
	leaq	8(%r14), %rax
	vmovq	%rax, %xmm12
	leaq	8(%r11), %rax
	vmovq	%rax, %xmm11
	leaq	8(%r10), %rax
	vmovq	%rax, %xmm10
	leaq	8(%r12), %rax
	vmovq	%rax, %xmm8
	leaq	8(%r9), %rax
	vmovq	%rax, %xmm14
	leaq	8(%r8), %rax
	vmovq	%rax, %xmm6
	leaq	8(%rbx), %rax
	vmovq	%rax, %xmm5
	leaq	8(%rbp), %rax
	vmovq	%rax, %xmm4
	leaq	8(%rdi), %rax
	vmovq	%rax, %xmm3
	leaq	8(%rsi), %rax
	vmovq	%rax, %xmm2
	leaq	8(%rdx), %rax
	vmovq	%rax, %xmm1
	leaq	8(%rcx), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 608(%rsp)        # 16-byte Spill
	vmovaps	800(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 624(%rsp)        # 16-byte Spill
	vmovaps	784(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 640(%rsp)        # 16-byte Spill
	vmovaps	768(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 656(%rsp)        # 16-byte Spill
	vmovaps	752(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 672(%rsp)        # 16-byte Spill
	vmovaps	736(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 688(%rsp)        # 16-byte Spill
	vmovaps	720(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 704(%rsp)        # 16-byte Spill
	vmovaps	464(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 720(%rsp)        # 16-byte Spill
	vmovaps	432(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 736(%rsp)        # 16-byte Spill
	vmovaps	368(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 752(%rsp)        # 16-byte Spill
	vmovaps	336(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 768(%rsp)        # 16-byte Spill
	vmovaps	320(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 784(%rsp)        # 16-byte Spill
	vmovaps	304(%rsp), %xmm7        # 16-byte Reload
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm7, 800(%rsp)        # 16-byte Spill
	vmovlhps	%xmm15, %xmm15, %xmm7 # xmm7 = xmm15[0,0]
	vmovaps	%xmm7, 816(%rsp)        # 16-byte Spill
	vmovlhps	%xmm9, %xmm9, %xmm7 # xmm7 = xmm9[0,0]
	vmovaps	%xmm7, 464(%rsp)        # 16-byte Spill
	vmovlhps	%xmm13, %xmm13, %xmm7 # xmm7 = xmm13[0,0]
	vmovaps	%xmm7, 432(%rsp)        # 16-byte Spill
	vmovlhps	%xmm12, %xmm12, %xmm7 # xmm7 = xmm12[0,0]
	vmovaps	%xmm7, 512(%rsp)        # 16-byte Spill
	vmovlhps	%xmm11, %xmm11, %xmm7 # xmm7 = xmm11[0,0]
	vmovaps	%xmm7, 528(%rsp)        # 16-byte Spill
	vmovlhps	%xmm10, %xmm10, %xmm7 # xmm7 = xmm10[0,0]
	vmovaps	%xmm7, 544(%rsp)        # 16-byte Spill
	vmovlhps	%xmm8, %xmm8, %xmm7 # xmm7 = xmm8[0,0]
	vmovaps	%xmm7, 560(%rsp)        # 16-byte Spill
	vmovlhps	%xmm14, %xmm14, %xmm7 # xmm7 = xmm14[0,0]
	vmovaps	%xmm7, 480(%rsp)        # 16-byte Spill
	vmovlhps	%xmm6, %xmm6, %xmm6 # xmm6 = xmm6[0,0]
	vmovaps	%xmm6, 496(%rsp)        # 16-byte Spill
	vmovlhps	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vmovaps	%xmm5, 448(%rsp)        # 16-byte Spill
	vmovlhps	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vmovlhps	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vmovaps	%xmm3, 576(%rsp)        # 16-byte Spill
	vmovlhps	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	vmovaps	%xmm2, 416(%rsp)        # 16-byte Spill
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 592(%rsp)        # 16-byte Spill
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	832(%rsp), %xmm3        # 16-byte Reload
	je	.LBB4_2
.LBB4_3:                                # %for.cond106.preheader
	vmovd	x_size(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm10
	vpextrq	$1, %xmm10, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm10, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	.LCPI4_32, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB4_12
# BB#4:                                 # %for.body109.preheader
	vmovdqa	.LCPI4_1(%rip), %xmm11
	vpaddq	%xmm11, %xmm10, %xmm1
	vpand	%xmm11, %xmm1, %xmm1
	vpaddq	.LCPI4_0(%rip), %xmm1, %xmm9
	vpand	.LCPI4_27(%rip), %xmm9, %xmm5
	vxorps	%xmm2, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm5, %xmm1
	vptest	%xmm1, %xmm1
	movq	-104(%rsp), %rcx        # 8-byte Reload
	je	.LBB4_6
# BB#5:
	vmovq	%rcx, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm3 # xmm3 = xmm1[0,0]
	jmp	.LBB4_9
.LBB4_6:
	vpextrq	$1, %xmm5, %rax
	leaq	(%rcx,%rax,8), %rax
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm3 # xmm3 = xmm1[0,0]
	vmovdqa	.LCPI4_28(%rip), %xmm12
	vmovdqa	.LCPI4_29(%rip), %xmm7
	vbroadcastsd	.LCPI4_30(%rip), %ymm8
	vmovdqa	.LCPI4_4(%rip), %xmm4
	vmovdqa	.LCPI4_8(%rip), %xmm1
	.align	16, 0x90
.LBB4_7:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vpinsrd	$1, %eax, %xmm2, %xmm0
	vpshufd	$1, %xmm0, %xmm0        # xmm0 = xmm0[1,0,0,0]
	vpbroadcastd	%xmm0, %xmm0
	vpaddd	%xmm12, %xmm0, %xmm6
	vpaddd	%xmm7, %xmm0, %xmm0
	vcvtdq2pd	%xmm6, %ymm6
	vcvtdq2pd	%xmm0, %ymm0
	vmulpd	%ymm8, %ymm6, %ymm6
	vmulpd	%ymm8, %ymm0, %ymm0
	vmovupd	%ymm6, (%rcx,%rax,8)
	vpor	%xmm4, %xmm2, %xmm6
	vpextrq	$1, %xmm6, %rax
	vmovupd	%ymm0, (%rcx,%rax,8)
	vpaddq	%xmm1, %xmm2, %xmm2
	vpcmpeqq	%xmm5, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB4_7
# BB#8:
	vmovdqa	%xmm5, %xmm2
.LBB4_9:                                # %middle.block
	vpcmpeqq	%xmm2, %xmm9, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB4_12
# BB#10:
	vmovapd	.LCPI4_31(%rip), %xmm1
	vmovdqa	.LCPI4_0(%rip), %xmm4
	vpand	%xmm11, %xmm10, %xmm5
	.align	16, 0x90
.LBB4_11:                               # %for.body109
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rax
	vpextrq	$1, %xmm2, %rcx
	movslq	%ecx, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vmovq	%xmm2, %rcx
	movslq	%ecx, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm3
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	vmulpd	%xmm1, %xmm0, %xmm0
	leaq	8(%rax), %rcx
	vmovq	%rcx, %xmm3
	vmovlhps	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vmovhpd	%xmm0, (%rax)
	vpaddq	%xmm4, %xmm2, %xmm2
	vpand	%xmm11, %xmm2, %xmm0
	vpcmpeqq	%xmm5, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB4_11
.LBB4_12:                               # %for.end114
	addq	$856, %rsp              # imm = 0x358
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	ret
.Ltmp74:
	.size	init, .Ltmp74-init
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

	.type	.LrelFun,@object        # @relFun
	.align	16
.LrelFun:
	.asciz	"Reliability CMP failed in function, exit directly %s\n"
	.size	.LrelFun, 54

	.type	.Lfunc,@object          # @func
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc:
	.asciz	"main"
	.size	.Lfunc, 5

	.type	.Lfunc1,@object         # @func1
.Lfunc1:
	.asciz	"rmatmult3"
	.size	.Lfunc1, 10

	.type	.Lfunc2,@object         # @func2
.Lfunc2:
	.asciz	"readInput"
	.size	.Lfunc2, 10

	.type	.Lfunc3,@object         # @func3
.Lfunc3:
	.asciz	"allocMem"
	.size	.Lfunc3, 9

	.type	.Lfunc4,@object         # @func4
.Lfunc4:
	.asciz	"init"
	.size	.Lfunc4, 5


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
