	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI0_1:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI0_2:
	.quad	4611235658464650854     # double 1.900000e+00
	.quad	4611235658464650854     # double 1.900000e+00
.LCPI0_3:
	.quad	4562254508917369340     # double 1.000000e-03
	.quad	4562254508917369340     # double 1.000000e-03
.LCPI0_4:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI0_5:
	.quad	4615063718147915776     # double 3.500000e+00
	.quad	4615063718147915776     # double 3.500000e+00
.LCPI0_6:
	.quad	4532020583610935537     # double 1.000000e-05
	.quad	4532020583610935537     # double 1.000000e-05
.LCPI0_7:
	.quad	4576918229304087675     # double 1.000000e-02
	.quad	4576918229304087675     # double 1.000000e-02
.LCPI0_8:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_9:
	.quad	40                      # 0x28
	.quad	40                      # 0x28
.LCPI0_10:
	.quad	4696837146684686336     # double 1.000000e+06
	.quad	4696837146684686336     # double 1.000000e+06
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp3:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp4:
	.cfi_def_cfa_offset 24
	subq	$40104, %rsp            # imm = 0x9CA8
.Ltmp5:
	.cfi_def_cfa_offset 40128
.Ltmp6:
	.cfi_offset %rbx, -24
.Ltmp7:
	.cfi_offset %r14, -16
	movl	$.Lstr, %edi
	callq	puts
	leaq	64(%rsp), %r14
	xorl	%esi, %esi
	movl	$12800, %edx            # imm = 0x3200
	movq	%r14, %rdi
	callq	memset
	vpxor	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI0_0(%rip), %xmm8
	vmovapd	.LCPI0_1(%rip), %xmm9
	vmovapd	.LCPI0_2(%rip), %xmm10
	vmovapd	.LCPI0_3(%rip), %xmm11
	vmovapd	.LCPI0_4(%rip), %xmm12
	movabsq	$4629137466983448576, %rax # imm = 0x403E000000000000
	vmovapd	.LCPI0_5(%rip), %xmm13
	vmovapd	.LCPI0_6(%rip), %xmm14
	vmovapd	.LCPI0_7(%rip), %xmm1
	vmovdqa	.LCPI0_8(%rip), %xmm2
	vmovdqa	.LCPI0_9(%rip), %xmm3
	.align	16, 0x90
.LBB0_1:                                # %for.body.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	vpextrq	$1, %xmm0, %rcx
	vmovq	%xmm0, %rdx
	movslq	%edx, %rdx
	movslq	%ecx, %rsi
	vcvtsi2sdq	%rsi, %xmm0, %xmm4
	vcvtsi2sdq	%rdx, %xmm0, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vmulpd	%xmm8, %xmm4, %xmm5
	vdivpd	%xmm9, %xmm5, %xmm5
	vaddpd	%xmm10, %xmm5, %xmm5
	vmovhpd	%xmm5, 39744(%rsp,%rcx,8)
	vmulpd	%xmm11, %xmm5, %xmm5
	vmovhpd	%xmm5, 39424(%rsp,%rcx,8)
	vaddpd	%xmm12, %xmm4, %xmm5
	vmovhpd	%xmm5, 39104(%rsp,%rcx,8)
	movq	%rax, 38784(%rsp,%rcx,8)
	vaddpd	%xmm13, %xmm4, %xmm5
	vmovhpd	%xmm5, 38464(%rsp,%rcx,8)
	vxorpd	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB0_2:                                # %for.body19.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm5, %rdx
	vmovq	%xmm5, %rsi
	movslq	%esi, %rsi
	movslq	%edx, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm6
	vcvtsi2sdq	%rsi, %xmm0, %xmm7
	vunpcklpd	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	vmulpd	%xmm14, %xmm6, %xmm6
	vmulpd	%xmm6, %xmm4, %xmm6
	vaddpd	%xmm1, %xmm6, %xmm6
	movq	%rcx, %rsi
	shlq	$6, %rsi
	leaq	(%rsi,%rsi,4), %rsi
	leaq	25664(%rsp,%rsi), %rdi
	vmovhpd	%xmm6, (%rdi,%rdx,8)
	vpaddq	%xmm0, %xmm5, %xmm6
	vmovq	%xmm6, %rdi
	movslq	%edi, %rdi
	vpextrq	$1, %xmm6, %rbx
	movslq	%ebx, %rbx
	vcvtsi2sdq	%rbx, %xmm0, %xmm6
	vcvtsi2sdq	%rdi, %xmm0, %xmm7
	vunpcklpd	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	leaq	12864(%rsp,%rsi), %rsi
	vmovhpd	%xmm6, (%rsi,%rdx,8)
	vpaddq	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm3, %xmm5, %xmm6
	vptest	%xmm6, %xmm6
	je	.LBB0_2
# BB#3:                                 # %for.inc39.i
                                        #   in Loop: Header=BB0_1 Depth=1
	vpaddq	%xmm2, %xmm0, %xmm0
	vpcmpeqq	%xmm3, %xmm0, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB0_1
# BB#4:                                 # %init.exit
	leaq	40088(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 48(%rsp)         # 16-byte Spill
	movq	%r14, 8(%rsp)
	leaq	12864(%rsp), %rax
	movq	%rax, (%rsp)
	leaq	39744(%rsp), %rdi
	leaq	39424(%rsp), %rsi
	leaq	39104(%rsp), %rdx
	leaq	38784(%rsp), %rcx
	leaq	38464(%rsp), %r8
	leaq	25664(%rsp), %r9
	callq	SPEdriver
	vmovsd	%xmm0, 24(%rsp)         # 8-byte Spill
	leaq	40072(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 32(%rsp)         # 16-byte Spill
	movl	$.Lstr6, %edi
	callq	puts
	movl	$.L.str2, %edi
	movb	$1, %al
	vmovsd	24(%rsp), %xmm0         # 8-byte Reload
	callq	printf
	vmovsd	25664(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	25768(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	25872(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	25976(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vmovsd	29824(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	29928(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	30032(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	30136(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vmovsd	33984(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	34088(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	34192(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	34296(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38144(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38248(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38352(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38456(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vpbroadcastq	40072(%rsp), %xmm0
	vpbroadcastq	40088(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpbroadcastq	40080(%rsp), %xmm1
	vpbroadcastq	40096(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vmovq	%xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vdivpd	.LCPI0_10(%rip), %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str4, %edi
	movb	$1, %al
	callq	printf
	vmovdqa	48(%rsp), %xmm0         # 16-byte Reload
	vmovdqa	32(%rsp), %xmm1         # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vdivpd	.LCPI0_10(%rip), %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str5, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$40104, %rsp            # imm = 0x9CA8
	popq	%rbx
	popq	%r14
	ret
.Ltmp8:
	.size	main, .Ltmp8-main
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI1_1:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI1_2:
	.quad	4611235658464650854     # double 1.900000e+00
	.quad	4611235658464650854     # double 1.900000e+00
.LCPI1_3:
	.quad	4562254508917369340     # double 1.000000e-03
	.quad	4562254508917369340     # double 1.000000e-03
.LCPI1_4:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI1_5:
	.quad	4615063718147915776     # double 3.500000e+00
	.quad	4615063718147915776     # double 3.500000e+00
.LCPI1_6:
	.quad	4532020583610935537     # double 1.000000e-05
	.quad	4532020583610935537     # double 1.000000e-05
.LCPI1_7:
	.quad	4576918229304087675     # double 1.000000e-02
	.quad	4576918229304087675     # double 1.000000e-02
.LCPI1_8:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI1_9:
	.quad	40                      # 0x28
	.quad	40                      # 0x28
	.text
	.globl	init
	.align	16, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp15:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp16:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp17:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp18:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp19:
	.cfi_def_cfa_offset 48
.Ltmp20:
	.cfi_offset %rbx, -48
.Ltmp21:
	.cfi_offset %r12, -40
.Ltmp22:
	.cfi_offset %r13, -32
.Ltmp23:
	.cfi_offset %r14, -24
.Ltmp24:
	.cfi_offset %r15, -16
	vpxor	%xmm0, %xmm0, %xmm0
	movq	56(%rsp), %r10
	movq	48(%rsp), %r14
	vmovapd	.LCPI1_0(%rip), %xmm8
	vmovapd	.LCPI1_1(%rip), %xmm9
	vmovapd	.LCPI1_2(%rip), %xmm10
	vmovapd	.LCPI1_3(%rip), %xmm11
	vmovapd	.LCPI1_4(%rip), %xmm12
	movabsq	$4629137466983448576, %r11 # imm = 0x403E000000000000
	vmovapd	.LCPI1_5(%rip), %xmm13
	vmovapd	.LCPI1_6(%rip), %xmm14
	vmovapd	.LCPI1_7(%rip), %xmm1
	vmovdqa	.LCPI1_8(%rip), %xmm2
	vmovdqa	.LCPI1_9(%rip), %xmm3
	.align	16, 0x90
.LBB1_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	vpextrq	$1, %xmm0, %r12
	vmovq	%xmm0, %rax
	movslq	%eax, %r15
	movslq	%r12d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm4
	vcvtsi2sdq	%r15, %xmm0, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vmulpd	%xmm8, %xmm4, %xmm5
	vdivpd	%xmm9, %xmm5, %xmm5
	vaddpd	%xmm10, %xmm5, %xmm5
	vmovhpd	%xmm5, (%rdi,%r12,8)
	vmulpd	%xmm11, %xmm5, %xmm5
	vmovhpd	%xmm5, (%rsi,%r12,8)
	vaddpd	%xmm12, %xmm4, %xmm5
	vmovhpd	%xmm5, (%rdx,%r12,8)
	movq	%r11, (%rcx,%r12,8)
	vaddpd	%xmm13, %xmm4, %xmm5
	vmovhpd	%xmm5, (%r8,%r12,8)
	vxorpd	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB1_2:                                # %for.body19
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm5, %r13
	vmovq	%xmm5, %rbx
	movslq	%ebx, %r15
	movslq	%r13d, %rbx
	vcvtsi2sdq	%rbx, %xmm0, %xmm6
	vcvtsi2sdq	%r15, %xmm0, %xmm7
	vunpcklpd	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	vmulpd	%xmm14, %xmm6, %xmm6
	vmulpd	%xmm6, %xmm4, %xmm6
	vaddpd	%xmm1, %xmm6, %xmm6
	movq	%r12, %rbx
	shlq	$6, %rbx
	leaq	(%rbx,%rbx,4), %rbx
	leaq	(%r9,%rbx), %rax
	vmovhpd	%xmm6, (%rax,%r13,8)
	vpaddq	%xmm0, %xmm5, %xmm6
	vmovq	%xmm6, %rax
	movslq	%eax, %r15
	vpextrq	$1, %xmm6, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm6
	vcvtsi2sdq	%r15, %xmm0, %xmm7
	vunpcklpd	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	leaq	(%r14,%rbx), %rax
	vmovhpd	%xmm6, (%rax,%r13,8)
	addq	%r10, %rbx
	movq	$0, (%rbx,%r13,8)
	vpaddq	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm3, %xmm5, %xmm6
	vptest	%xmm6, %xmm6
	je	.LBB1_2
# BB#3:                                 # %for.inc39
                                        #   in Loop: Header=BB1_1 Depth=1
	vpaddq	%xmm2, %xmm0, %xmm0
	vpcmpeqq	%xmm3, %xmm0, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB1_1
# BB#4:                                 # %for.end41
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.Ltmp25:
	.size	init, .Ltmp25-init
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	4576918229304087675     # double 0.01
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_1:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI2_2:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI2_3:
	.quad	1000000                 # 0xf4240
	.quad	1000000                 # 0xf4240
.LCPI2_4:
	.quad	4696837146684686336     # double 1.000000e+06
	.quad	4696837146684686336     # double 1.000000e+06
.LCPI2_5:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI2_6:
	.quad	4606281698874543309     # double 9.000000e-01
	.quad	4606281698874543309     # double 9.000000e-01
.LCPI2_7:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI2_8:
	.quad	40                      # 0x28
	.quad	40                      # 0x28
.LCPI2_9:
	.quad	4517329193108106637     # double 1.000000e-06
	.quad	4517329193108106637     # double 1.000000e-06
.LCPI2_10:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI2_11:
	.quad	4608083138725491507     # double 1.200000e+00
	.quad	4608083138725491507     # double 1.200000e+00
.LCPI2_12:
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
.LCPI2_13:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
	.text
	.globl	SPEdriver
	.align	16, 0x90
	.type	SPEdriver,@function
SPEdriver:                              # @SPEdriver
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp33:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp34:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp35:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp36:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp37:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp38:
	.cfi_def_cfa_offset 56
	subq	$808, %rsp              # imm = 0x328
.Ltmp39:
	.cfi_def_cfa_offset 864
.Ltmp40:
	.cfi_offset %rbx, -56
.Ltmp41:
	.cfi_offset %r12, -48
.Ltmp42:
	.cfi_offset %r13, -40
.Ltmp43:
	.cfi_offset %r14, -32
.Ltmp44:
	.cfi_offset %r15, -24
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%r9, %r12
	movq	%r8, %rbx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	movq	%rdx, %r13
	movq	%rsi, %rbp
	movq	%rdi, %r15
	movq	872(%rsp), %r14
	leaq	144(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	vpxor	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm1, 112(%rsp)        # 16-byte Spill
	movq	%r14, 16(%rsp)
	movq	864(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	%r12, (%rsp)
	movl	$40, %edi
	vmovsd	.LCPI2_0(%rip), %xmm0
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movq	96(%rsp), %r8           # 8-byte Reload
	movq	%rbx, %r9
	callq	Crystal_div
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpaddq	.LCPI2_1(%rip), %xmm1, %xmm1
	vpand	.LCPI2_2(%rip), %xmm1, %xmm0
	vpcmpeqq	.LCPI2_3(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB2_1
# BB#2:                                 # %for.end
	movq	%r13, 56(%rsp)          # 8-byte Spill
	movq	%rbx, %r13
	leaq	128(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	vpbroadcastq	128(%rsp), %xmm0
	vpbroadcastq	144(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpbroadcastq	136(%rsp), %xmm1
	vpbroadcastq	152(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vmovq	%xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vdivpd	.LCPI2_4(%rip), %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	movl	$.Lstr4, %edi
	callq	puts
	movl	$.L.str1, %edi
	movb	$1, %al
	vmovaps	96(%rsp), %xmm0         # 16-byte Reload
	callq	printf
	vmovdqa	80(%rsp), %xmm0         # 16-byte Reload
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vdivpd	.LCPI2_4(%rip), %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str23, %edi
	movb	$1, %al
	callq	printf
	leaq	144(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 32(%rsp)         # 16-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	movabsq	$4607182418800017408, %rbp # imm = 0x3FF0000000000000
	vmovdqa	.LCPI2_8(%rip), %xmm4
	vmovdqa	.LCPI2_1(%rip), %xmm3
	.align	16, 0x90
.LBB2_3:                                # %for.body23
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
                                        #     Child Loop BB2_5 Depth 2
	vmovapd	%xmm1, 64(%rsp)         # 16-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB2_4:                                # %for.body.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm0, %rax
	movq	%rbp, 160(%rsp,%rax,8)
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm2
	vunpcklpd	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmulpd	.LCPI2_5(%rip), %xmm1, %xmm1
	vmulpd	.LCPI2_6(%rip), %xmm1, %xmm1
	vdivpd	.LCPI2_7(%rip), %xmm1, %xmm1
	vmovhpd	%xmm1, 480(%rsp,%rax,8)
	vpaddq	%xmm3, %xmm0, %xmm0
	vpcmpeqq	%xmm4, %xmm0, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vptest	%xmm1, %xmm1
	je	.LBB2_4
	.align	16, 0x90
.LBB2_5:                                # %for.body9.i
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovapd	%xmm2, 112(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm2, %rbx
	vmovddup	(%r15,%rbx,8), %xmm0
	vmovddup	160(%rsp,%rbx,8), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vaddpd	.LCPI2_9(%rip), %xmm0, %xmm0
	vmulpd	.LCPI2_10(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovsd	.LCPI2_0(%rip), %xmm1
	callq	pow
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	vmovapd	80(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	.LCPI2_0(%rip), %xmm1
	callq	pow
	vmovdqa	112(%rsp), %xmm2        # 16-byte Reload
	vmovdqa	.LCPI2_8(%rip), %xmm4
	vmovdqa	.LCPI2_1(%rip), %xmm3
	vmovapd	96(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI2_11(%rip), %xmm0, %xmm0
	vmovhpd	%xmm0, 480(%rsp,%rbx,8)
	vpaddq	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm4, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB2_5
# BB#6:                                 # %Crystal_pow.exit
                                        #   in Loop: Header=BB2_3 Depth=1
	vmovdqa	64(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm3, %xmm1, %xmm1
	vpand	.LCPI2_2(%rip), %xmm1, %xmm0
	vpcmpeqq	.LCPI2_3(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB2_3
# BB#7:                                 # %for.end27
	vmovsd	504(%rsp), %xmm0
	vmovsd	%xmm0, 96(%rsp)         # 8-byte Spill
	leaq	128(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	vpbroadcastq	128(%rsp), %xmm0
	vpbroadcastq	144(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpbroadcastq	136(%rsp), %xmm1
	vpbroadcastq	152(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vmovq	%xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovapd	.LCPI2_4(%rip), %xmm2
	vdivpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	movl	$.Lstr5, %edi
	callq	puts
	movl	$.L.str1, %edi
	movb	$1, %al
	vmovaps	80(%rsp), %xmm0         # 16-byte Reload
	callq	printf
	vmovdqa	32(%rsp), %xmm0         # 16-byte Reload
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vdivpd	.LCPI2_4(%rip), %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str23, %edi
	movb	$1, %al
	callq	printf
	leaq	144(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovdqa	.LCPI2_8(%rip), %xmm7
	vmovdqa	%xmm7, %xmm1
	vmovdqa	.LCPI2_1(%rip), %xmm6
	vmovdqa	%xmm6, %xmm9
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	.LCPI2_12(%rip), %xmm6
	vpcmpeqd	%xmm8, %xmm8, %xmm8
	vmovdqa	.LCPI2_13(%rip), %xmm7
	movq	%r13, %rbx
	.align	16, 0x90
.LBB2_8:                                # %vector.memcheck27
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_9 Depth 2
                                        #     Child Loop BB2_13 Depth 2
	vpextrq	$1, %xmm0, %rax
	shlq	$6, %rax
	leaq	(%rax,%rax,4), %rdx
	leaq	(%r12,%rdx), %rax
	leaq	312(%r12,%rdx), %rcx
	vmovq	%rcx, %xmm2
	vmovlhps	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	vmovq	%rax, %xmm3
	vmovlhps	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	leaq	(%r14,%rdx), %rcx
	leaq	312(%r14,%rdx), %rdx
	vmovq	%rdx, %xmm4
	vmovlhps	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vmovq	%rcx, %xmm5
	vmovlhps	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vxorps	%xmm6, %xmm4, %xmm4
	vxorps	%xmm6, %xmm3, %xmm3
	vpcmpgtq	%xmm4, %xmm3, %xmm3
	vpxor	%xmm8, %xmm3, %xmm3
	vxorps	%xmm6, %xmm2, %xmm2
	vxorps	%xmm6, %xmm5, %xmm4
	vpcmpgtq	%xmm2, %xmm4, %xmm2
	vpandn	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm2, %xmm2, %xmm2
	jne	.LBB2_11
	.align	16, 0x90
.LBB2_9:                                # %vector.body11
                                        #   Parent Loop BB2_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm3, %rdx
	vmovups	(%rax,%rdx,8), %xmm2
	vmovups	%xmm2, (%rcx,%rdx,8)
	vpaddq	%xmm7, %xmm3, %xmm3
	vpcmpeqq	%xmm1, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB2_9
# BB#10:                                #   in Loop: Header=BB2_8 Depth=1
	vmovdqa	%xmm9, %xmm4
	vmovdqa	%xmm1, %xmm2
.LBB2_11:                               # %middle.block12
                                        #   in Loop: Header=BB2_8 Depth=1
	vpextrq	$1, %xmm4, %rdx
	shlq	$63, %rdx
	sarq	$63, %rdx
	vmovq	%rdx, %xmm3
	vmovq	%xmm4, %rdx
	shlq	$63, %rdx
	sarq	$63, %rdx
	vmovq	%rdx, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	jmp	.LBB2_13
	.align	16, 0x90
.LBB2_12:                               # %for.body55
                                        #   in Loop: Header=BB2_13 Depth=2
	vpextrq	$1, %xmm2, %rdx
	vmovsd	(%rax,%rdx,8), %xmm3
	vmovsd	%xmm3, (%rcx,%rdx,8)
	vpaddq	%xmm9, %xmm2, %xmm2
	vpcmpeqq	%xmm1, %xmm2, %xmm3
.LBB2_13:                               # %for.body55
                                        #   Parent Loop BB2_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vptest	%xmm3, %xmm3
	je	.LBB2_12
# BB#14:                                # %for.inc65
                                        #   in Loop: Header=BB2_8 Depth=1
	vpaddq	%xmm9, %xmm0, %xmm0
	vpcmpeqq	%xmm1, %xmm0, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB2_8
# BB#15:
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqd	%xmm8, %xmm8, %xmm8
	vmovdqa	.LCPI2_1(%rip), %xmm5
	vmovdqa	.LCPI2_8(%rip), %xmm9
	movq	56(%rsp), %rbp          # 8-byte Reload
	.align	16, 0x90
.LBB2_16:                               # %for.cond72.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_17 Depth 2
                                        #       Child Loop BB2_18 Depth 3
                                        #       Child Loop BB2_22 Depth 3
	vmovdqa	%xmm1, 112(%rsp)        # 16-byte Spill
	vpxor	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB2_17:                               # %vector.memcheck
                                        #   Parent Loop BB2_16 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_18 Depth 3
                                        #       Child Loop BB2_22 Depth 3
	vpextrq	$1, %xmm0, %rax
	shlq	$6, %rax
	leaq	(%rax,%rax,4), %rdx
	leaq	(%r14,%rdx), %rax
	leaq	312(%r14,%rdx), %rcx
	vmovq	%rcx, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovq	%rax, %xmm2
	vmovlhps	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	leaq	(%r12,%rdx), %rcx
	leaq	312(%r12,%rdx), %rdx
	vmovq	%rdx, %xmm3
	vmovlhps	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vmovq	%rcx, %xmm4
	vmovlhps	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vxorps	%xmm6, %xmm3, %xmm3
	vxorps	%xmm6, %xmm2, %xmm2
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vpxor	%xmm8, %xmm2, %xmm2
	vxorps	%xmm6, %xmm1, %xmm1
	vxorps	%xmm6, %xmm4, %xmm3
	vpcmpgtq	%xmm1, %xmm3, %xmm1
	vpandn	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm1, %xmm1, %xmm1
	jne	.LBB2_20
	.align	16, 0x90
.LBB2_18:                               # %vector.body
                                        #   Parent Loop BB2_16 Depth=1
                                        #     Parent Loop BB2_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm2, %rdx
	vmovups	(%rax,%rdx,8), %xmm1
	vmovups	%xmm1, (%rcx,%rdx,8)
	vpaddq	%xmm7, %xmm2, %xmm2
	vpcmpeqq	%xmm9, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_18
# BB#19:                                #   in Loop: Header=BB2_17 Depth=2
	vmovdqa	%xmm5, %xmm3
	vmovdqa	%xmm9, %xmm1
.LBB2_20:                               # %middle.block
                                        #   in Loop: Header=BB2_17 Depth=2
	vpextrq	$1, %xmm3, %rdx
	shlq	$63, %rdx
	sarq	$63, %rdx
	vmovq	%rdx, %xmm2
	vmovq	%xmm3, %rdx
	shlq	$63, %rdx
	sarq	$63, %rdx
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	jmp	.LBB2_22
	.align	16, 0x90
.LBB2_21:                               # %for.body79
                                        #   in Loop: Header=BB2_22 Depth=3
	vpextrq	$1, %xmm1, %rdx
	vmovsd	(%rax,%rdx,8), %xmm2
	vmovsd	%xmm2, (%rcx,%rdx,8)
	vpaddq	%xmm5, %xmm1, %xmm1
	vpcmpeqq	%xmm9, %xmm1, %xmm2
.LBB2_22:                               # %for.body79
                                        #   Parent Loop BB2_16 Depth=1
                                        #     Parent Loop BB2_17 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vptest	%xmm2, %xmm2
	je	.LBB2_21
# BB#23:                                # %for.inc91
                                        #   in Loop: Header=BB2_17 Depth=2
	vpaddq	%xmm5, %xmm0, %xmm0
	vpcmpeqq	%xmm9, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_17
# BB#24:                                # %for.end93
                                        #   in Loop: Header=BB2_16 Depth=1
	movl	$40, %edi
	movq	%r12, %rsi
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	callq	Crystal_Cholesky
	vmovdqa	.LCPI2_8(%rip), %xmm9
	vmovdqa	.LCPI2_1(%rip), %xmm5
	vpcmpeqd	%xmm8, %xmm8, %xmm8
	vmovdqa	.LCPI2_13(%rip), %xmm7
	vmovaps	.LCPI2_12(%rip), %xmm6
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpaddq	%xmm5, %xmm1, %xmm1
	vpand	.LCPI2_2(%rip), %xmm1, %xmm0
	vpcmpeqq	.LCPI2_3(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB2_16
# BB#25:                                # %for.end96
	leaq	128(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	vpbroadcastq	128(%rsp), %xmm0
	vpbroadcastq	144(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpbroadcastq	136(%rsp), %xmm1
	vpbroadcastq	152(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vmovq	%xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovapd	.LCPI2_4(%rip), %xmm2
	vdivpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	movl	$.Lstr65, %edi
	callq	puts
	movl	$.L.str1, %edi
	movb	$1, %al
	vmovaps	64(%rsp), %xmm0         # 16-byte Reload
	callq	printf
	vmovdqa	80(%rsp), %xmm0         # 16-byte Reload
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vdivpd	.LCPI2_4(%rip), %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str23, %edi
	movb	$1, %al
	callq	printf
	vmovsd	96(%rsp), %xmm0         # 8-byte Reload
	addq	$808, %rsp              # imm = 0x328
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp46:
	.size	SPEdriver, .Ltmp46-SPEdriver
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI3_1:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI3_2:
	.quad	4606281698874543309     # double 9.000000e-01
	.quad	4606281698874543309     # double 9.000000e-01
.LCPI3_3:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI3_4:
	.quad	-2                      # 0xfffffffffffffffe
	.quad	-2                      # 0xfffffffffffffffe
.LCPI3_7:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI3_8:
	.quad	4517329193108106637     # double 1.000000e-06
	.quad	4517329193108106637     # double 1.000000e-06
.LCPI3_9:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI3_10:
	.quad	4608083138725491507     # double 1.200000e+00
	.quad	4608083138725491507     # double 1.200000e+00
.LCPI3_11:
	.quad	4629137466983448576     # double 3.000000e+01
	.quad	4629137466983448576     # double 3.000000e+01
.LCPI3_12:
	.quad	-4                      # 0xfffffffffffffffc
	.quad	-4                      # 0xfffffffffffffffc
.LCPI3_13:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI3_14:
	.quad	4576918229304087675     # double 1.000000e-02
	.quad	4576918229304087675     # double 1.000000e-02
.LCPI3_15:
	.zero	16
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_5:
	.quad	4517329193108106637     # double 9.9999999999999995E-7
.LCPI3_6:
	.quad	4607182418800017408     # double 1
	.text
	.globl	Crystal_div
	.align	16, 0x90
	.type	Crystal_div,@function
Crystal_div:                            # @Crystal_div
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp53:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp54:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp55:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp56:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp57:
	.cfi_def_cfa_offset 48
	subq	$832, %rsp              # imm = 0x340
.Ltmp58:
	.cfi_def_cfa_offset 880
.Ltmp59:
	.cfi_offset %rbx, -48
.Ltmp60:
	.cfi_offset %r12, -40
.Ltmp61:
	.cfi_offset %r13, -32
.Ltmp62:
	.cfi_offset %r14, -24
.Ltmp63:
	.cfi_offset %r15, -16
	vmovd	%edi, %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpgtq	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB3_24
# BB#1:                                 # %for.body.lr.ph
	movq	896(%rsp), %r10
	movq	888(%rsp), %r12
	movq	880(%rsp), %r13
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	movslq	%r11d, %rbx
	vmovq	%rbx, %xmm1
	movslq	%r14d, %rbx
	vmovq	%rbx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	movabsq	$4607182418800017408, %r15 # imm = 0x3FF0000000000000
	vmovapd	.LCPI3_0(%rip), %xmm8
	vmovapd	.LCPI3_1(%rip), %xmm5
	vmovapd	.LCPI3_2(%rip), %xmm6
	vmovdqa	.LCPI3_3(%rip), %xmm11
	.align	16, 0x90
.LBB3_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rbx
	movq	%r15, 192(%rsp,%rbx,8)
	vcvtsi2sdq	%rbx, %xmm0, %xmm7
	vmovq	%xmm3, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm4
	vunpcklpd	%xmm7, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm7[0]
	vmulpd	%xmm8, %xmm4, %xmm4
	vdivpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmovhpd	%xmm4, -128(%rsp,%rbx,8)
	vpaddq	%xmm11, %xmm3, %xmm3
	vpcmpeqq	%xmm1, %xmm3, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB3_2
# BB#3:                                 # %for.body8.preheader
	movslq	%r11d, %rdi
	vmovq	%rdi, %xmm3
	movslq	%r14d, %rdi
	vmovq	%rdi, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm8 # xmm8 = xmm4[0],xmm3[0]
	vpand	.LCPI3_4(%rip), %xmm8, %xmm5
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm5, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB3_7
# BB#4:
	vbroadcastsd	.LCPI3_5(%rip), %ymm6
	vbroadcastsd	.LCPI3_6(%rip), %ymm7
	vmovdqa	.LCPI3_7(%rip), %xmm2
	.align	16, 0x90
.LBB3_5:                                # %vector.body7
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rdi
	vmovupd	(%rsi,%rdi,8), %xmm9
	vinsertf128	$1, %xmm9, %ymm9, %ymm9
	vmovapd	192(%rsp,%rdi,8), %xmm10
	vinsertf128	$1, %xmm10, %ymm10, %ymm10
	vmulpd	%ymm10, %ymm9, %ymm9
	vaddpd	%ymm6, %ymm9, %ymm9
	vdivpd	%ymm9, %ymm7, %ymm9
	vmovapd	%xmm9, 512(%rsp,%rdi,8)
	vpaddq	%xmm2, %xmm3, %xmm3
	vpcmpeqq	%xmm5, %xmm3, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB3_5
# BB#6:
	vmovdqa	%xmm5, %xmm3
.LBB3_7:                                # %middle.block8
	vpcmpeqq	%xmm3, %xmm8, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB3_10
# BB#8:
	vmovapd	.LCPI3_8(%rip), %xmm4
	vmovapd	.LCPI3_9(%rip), %xmm5
	.align	16, 0x90
.LBB3_9:                                # %for.body8
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rdi
	vmovddup	(%rsi,%rdi,8), %xmm6
	vmovddup	192(%rsp,%rdi,8), %xmm7
	vmulpd	%xmm7, %xmm6, %xmm6
	vaddpd	%xmm4, %xmm6, %xmm6
	vdivpd	%xmm6, %xmm5, %xmm6
	vmovhpd	%xmm6, 512(%rsp,%rdi,8)
	vpaddq	%xmm11, %xmm3, %xmm3
	vpcmpeqq	%xmm1, %xmm3, %xmm6
	vptest	%xmm6, %xmm6
	je	.LBB3_9
.LBB3_10:                               # %for.body22.lr.ph.split.us
	vmulpd	.LCPI3_10(%rip), %xmm0, %xmm2
	movslq	%r11d, %rsi
	vmovq	%rsi, %xmm3
	movslq	%r14d, %rsi
	vmovq	%rsi, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm12 # xmm12 = xmm4[0],xmm3[0]
	vmovapd	.LCPI3_11(%rip), %xmm9
	vpand	.LCPI3_12(%rip), %xmm12, %xmm4
	vmovapd	.LCPI3_14(%rip), %xmm10
	vmovdqa	.LCPI3_7(%rip), %xmm15
	vmovdqa	.LCPI3_13(%rip), %xmm8
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB3_11:                               # %for.body32.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_13 Depth 2
                                        #     Child Loop BB3_20 Depth 2
	vpextrq	$1, %xmm3, %rsi
	vmovddup	-128(%rsp,%rsi,8), %xmm6
	vmulpd	%xmm9, %xmm6, %xmm7
	vmovsd	192(%rsp,%rsi,8), %xmm5
	vpermilpd	$0, %xmm5, %xmm14 # xmm14 = xmm5[0,0]
	vmulpd	%xmm14, %xmm7, %xmm5
	vmovhpd	%xmm5, (%rcx,%rsi,8)
	vmulpd	%xmm6, %xmm2, %xmm5
	vunpckhpd	%xmm5, %xmm5, %xmm13 # xmm13 = xmm5[1,1]
	vpcmpeqq	.LCPI3_15, %xmm4, %xmm5
	vptest	%xmm5, %xmm5
	vxorpd	%xmm7, %xmm7, %xmm7
	jne	.LBB3_15
# BB#12:                                # %vector.ph
                                        #   in Loop: Header=BB3_11 Depth=1
	vinsertf128	$1, %xmm13, %ymm13, %ymm5
	vmovddup	%ymm5, %ymm7
	vxorpd	%xmm6, %xmm6, %xmm6
	.align	16, 0x90
.LBB3_13:                               # %vector.body
                                        #   Parent Loop BB3_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm6, %rdi
	leaq	(%rsi,%rsi,4), %rbx
	shlq	$6, %rbx
	addq	%r13, %rbx
	vmovupd	%xmm7, (%rbx,%rdi,8)
	vpor	%xmm15, %xmm6, %xmm5
	vpextrq	$1, %xmm5, %rdi
	vmovupd	%xmm7, (%rbx,%rdi,8)
	vpaddq	%xmm8, %xmm6, %xmm6
	vpcmpeqq	%xmm4, %xmm6, %xmm5
	vptest	%xmm5, %xmm5
	je	.LBB3_13
# BB#14:                                #   in Loop: Header=BB3_11 Depth=1
	vmovdqa	%xmm4, %xmm7
.LBB3_15:                               # %middle.block
                                        #   in Loop: Header=BB3_11 Depth=1
	vpcmpeqq	%xmm7, %xmm12, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB3_16
	.align	16, 0x90
.LBB3_20:                               # %for.body32.us
                                        #   Parent Loop BB3_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm7, %rdi
	leaq	(%rsi,%rsi,4), %rbx
	shlq	$6, %rbx
	addq	%r13, %rbx
	vmovsd	%xmm13, (%rbx,%rdi,8)
	vpaddq	%xmm11, %xmm7, %xmm7
	vpcmpeqq	%xmm1, %xmm7, %xmm6
	vptest	%xmm6, %xmm6
	je	.LBB3_20
.LBB3_16:                               # %for.end40.us
                                        #   in Loop: Header=BB3_11 Depth=1
	vmovddup	(%rcx,%rsi,8), %xmm6
	vmulpd	%xmm10, %xmm6, %xmm6
	vmulpd	%xmm6, %xmm14, %xmm6
	vmovddup	512(%rsp,%rsi,8), %xmm7
	vmulpd	%xmm6, %xmm7, %xmm6
	leaq	(%rsi,%rsi,4), %rdi
	shlq	$6, %rdi
	addq	%r13, %rdi
	vmovddup	(%rdi,%rsi,8), %xmm7
	vaddpd	%xmm6, %xmm7, %xmm6
	vmovhpd	%xmm6, (%rdi,%rsi,8)
	vpaddq	%xmm11, %xmm3, %xmm3
	vpcmpeqq	%xmm1, %xmm3, %xmm6
	vptest	%xmm6, %xmm6
	je	.LBB3_11
# BB#17:
	vpxor	%xmm3, %xmm3, %xmm3
	vmovapd	.LCPI3_9(%rip), %xmm4
	.align	16, 0x90
.LBB3_18:                               # %for.body57
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rax
	leaq	(%rax,%rax,4), %rsi
	shlq	$6, %rsi
	addq	%r13, %rsi
	vmovddup	(%rsi,%rax,8), %xmm2
	vdivpd	%xmm2, %xmm4, %xmm2
	vmovhpd	%xmm2, 512(%rsp,%rax,8)
	vpaddq	%xmm11, %xmm3, %xmm3
	vpcmpeqq	%xmm1, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB3_18
# BB#19:
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB3_23:                               # %for.body76.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_21 Depth 2
	vpextrq	$1, %xmm3, %rbx
	vmovddup	(%rcx,%rbx,8), %xmm4
	vmovsd	512(%rsp,%rbx,8), %xmm2
	vpermilpd	$0, %xmm2, %xmm5 # xmm5 = xmm2[0,0]
	vpxor	%xmm6, %xmm6, %xmm6
	.align	16, 0x90
.LBB3_21:                               # %for.body76.us
                                        #   Parent Loop BB3_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm6, %rdi
	movq	%rbx, %rsi
	shlq	$6, %rsi
	leaq	(%rsi,%rsi,4), %rsi
	leaq	(%r12,%rsi), %rax
	vmovddup	(%rax,%rdi,8), %xmm7
	vmulpd	%xmm0, %xmm7, %xmm7
	vmovddup	(%rdx,%rdi,8), %xmm2
	vmulpd	%xmm2, %xmm7, %xmm2
	vaddpd	%xmm2, %xmm4, %xmm4
	leaq	(%r13,%rsi), %rax
	vmovddup	(%rax,%rdi,8), %xmm2
	vsubpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	addq	%r10, %rsi
	vmovhpd	%xmm2, (%rsi,%rdi,8)
	vpaddq	%xmm11, %xmm6, %xmm6
	vpcmpeqq	%xmm1, %xmm6, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB3_21
# BB#22:                                # %for.end93.us
                                        #   in Loop: Header=BB3_23 Depth=1
	vmovddup	(%r8,%rbx,8), %xmm6
	vsubpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vmovhpd	%xmm4, (%r9,%rbx,8)
	vpaddq	%xmm11, %xmm3, %xmm3
	vpcmpeqq	%xmm1, %xmm3, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB3_23
.LBB3_24:                               # %for.end104
	addq	$832, %rsp              # imm = 0x340
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	vzeroupper
	ret
.Ltmp64:
	.size	Crystal_div, .Ltmp64-Crystal_div
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI4_0:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI4_1:
	.quad	4606281698874543309     # double 9.000000e-01
	.quad	4606281698874543309     # double 9.000000e-01
.LCPI4_2:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI4_3:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI4_4:
	.quad	4517329193108106637     # double 1.000000e-06
	.quad	4517329193108106637     # double 1.000000e-06
.LCPI4_5:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI4_7:
	.quad	4608083138725491507     # double 1.200000e+00
	.quad	4608083138725491507     # double 1.200000e+00
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI4_6:
	.quad	4576918229304087675     # double 0.01
	.text
	.globl	Crystal_pow
	.align	16, 0x90
	.type	Crystal_pow,@function
Crystal_pow:                            # @Crystal_pow
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp68:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp69:
	.cfi_def_cfa_offset 24
	subq	$712, %rsp              # imm = 0x2C8
.Ltmp70:
	.cfi_def_cfa_offset 736
.Ltmp71:
	.cfi_offset %rbx, -24
.Ltmp72:
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	movslq	%eax, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rdx
	vmovq	%rdx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1 # xmm1 = xmm0[0],xmm1[0]
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpgtq	%xmm0, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB4_5
# BB#1:                                 # %for.body.lr.ph
	cltq
	vmovq	%rax, %xmm1
	movslq	%ecx, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm6 # xmm6 = xmm2[0],xmm1[0]
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	vmovapd	.LCPI4_0(%rip), %xmm1
	vmovapd	.LCPI4_1(%rip), %xmm2
	vmovapd	.LCPI4_2(%rip), %xmm3
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rcx
	movq	%rax, 64(%rsp,%rcx,8)
	vcvtsi2sdq	%rcx, %xmm0, %xmm4
	vmovq	%xmm0, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vmulpd	%xmm1, %xmm4, %xmm4
	vmulpd	%xmm2, %xmm4, %xmm4
	vdivpd	%xmm3, %xmm4, %xmm4
	vmovhpd	%xmm4, 384(%rsp,%rcx,8)
	vpaddq	.LCPI4_3(%rip), %xmm0, %xmm0
	vpcmpeqq	%xmm6, %xmm0, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB4_2
# BB#3:
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovdqa	%xmm6, (%rsp)           # 16-byte Spill
	.align	16, 0x90
.LBB4_4:                                # %for.body9
                                        # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm1, 48(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm1, %rbx
	vmovddup	(%r14,%rbx,8), %xmm0
	vmovddup	64(%rsp,%rbx,8), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vaddpd	.LCPI4_4(%rip), %xmm0, %xmm0
	vmulpd	.LCPI4_5(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	vmovsd	.LCPI4_6(%rip), %xmm1
	callq	pow
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vmovapd	16(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	.LCPI4_6(%rip), %xmm1
	callq	pow
	vmovdqa	48(%rsp), %xmm1         # 16-byte Reload
	vmovapd	32(%rsp), %xmm2         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vmulpd	.LCPI4_7(%rip), %xmm0, %xmm0
	vmovhpd	%xmm0, 384(%rsp,%rbx,8)
	vpaddq	.LCPI4_3(%rip), %xmm1, %xmm1
	vpcmpeqq	(%rsp), %xmm1, %xmm0 # 16-byte Folded Reload
	vptest	%xmm0, %xmm0
	je	.LBB4_4
.LBB4_5:                                # %for.end19
	vmovsd	408(%rsp), %xmm0
	addq	$712, %rsp              # imm = 0x2C8
	popq	%rbx
	popq	%r14
	ret
.Ltmp73:
	.size	Crystal_pow, .Ltmp73-Crystal_pow
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_0:
	.quad	-4                      # 0xfffffffffffffffc
	.quad	-4                      # 0xfffffffffffffffc
.LCPI5_1:
	.quad	-9223372036854775808    # 0x8000000000000000
	.quad	-9223372036854775808    # 0x8000000000000000
.LCPI5_2:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI5_3:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI5_4:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI5_5:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI5_6:
	.quad	4294967294              # 0xfffffffe
	.quad	4294967294              # 0xfffffffe
	.text
	.globl	Crystal_Cholesky
	.align	16, 0x90
	.type	Crystal_Cholesky,@function
Crystal_Cholesky:                       # @Crystal_Cholesky
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm10
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm10, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB5_21
# BB#1:                                 # %for.body.preheader
	movslq	%r8d, %rax
	vmovq	%rax, %xmm3
	movslq	%r10d, %rax
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpand	.LCPI5_0(%rip), %xmm3, %xmm4
	vpcmpeqq	%xmm2, %xmm4, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB5_6
# BB#2:                                 # %vector.memcheck
	vmovq	%rcx, %xmm2
	vmovlhps	%xmm2, %xmm2, %xmm9 # xmm9 = xmm2[0,0]
	vmovq	%rdx, %xmm5
	vmovlhps	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vpcmpeqd	%xmm8, %xmm8, %xmm8
	vpaddq	%xmm8, %xmm3, %xmm7
	vpextrq	$1, %xmm7, %r9
	leaq	(%rdx,%r9,8), %rax
	vmovq	%rax, %xmm7
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	leaq	(%rcx,%r9,8), %rax
	vmovq	%rax, %xmm6
	vmovlhps	%xmm6, %xmm6, %xmm6 # xmm6 = xmm6[0,0]
	vmovaps	.LCPI5_1(%rip), %xmm2
	vxorps	%xmm2, %xmm5, %xmm5
	vxorps	%xmm2, %xmm6, %xmm6
	vpcmpgtq	%xmm6, %xmm5, %xmm5
	vpxor	%xmm8, %xmm5, %xmm5
	vxorps	%xmm2, %xmm9, %xmm6
	vxorps	%xmm2, %xmm7, %xmm2
	vpcmpgtq	%xmm2, %xmm6, %xmm2
	vpandn	%xmm5, %xmm2, %xmm5
	vpxor	%xmm2, %xmm2, %xmm2
	vptest	%xmm5, %xmm5
	jne	.LBB5_6
# BB#3:
	vmovdqa	.LCPI5_2(%rip), %xmm5
	vmovdqa	.LCPI5_3(%rip), %xmm6
	.align	16, 0x90
.LBB5_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovups	(%rdx,%rax,8), %xmm7
	vpor	%xmm5, %xmm2, %xmm1
	vpextrq	$1, %xmm1, %rdi
	vmovups	(%rdx,%rdi,8), %xmm1
	vmovups	%xmm7, (%rcx,%rax,8)
	vmovups	%xmm1, (%rcx,%rdi,8)
	vpaddq	%xmm6, %xmm2, %xmm2
	vpcmpeqq	%xmm4, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_4
# BB#5:
	vmovdqa	%xmm4, %xmm2
.LBB5_6:                                # %middle.block
	vpcmpeqq	%xmm2, %xmm3, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB5_9
# BB#7:
	vmovdqa	.LCPI5_4(%rip), %xmm3
	.align	16, 0x90
.LBB5_8:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovsd	(%rdx,%rax,8), %xmm1
	vmovsd	%xmm1, (%rcx,%rax,8)
	vpaddq	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm0, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_8
.LBB5_9:                                # %for.cond3.preheader
	movslq	%r8d, %rax
	vmovq	%rax, %xmm1
	movslq	%r10d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	.LCPI5_4(%rip), %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_21
# BB#10:                                # %for.body7.lr.ph
	vmovdqa	.LCPI5_4(%rip), %xmm8
	vmovdqa	%xmm8, %xmm2
	.align	16, 0x90
.LBB5_11:                               # %for.body7
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	leaq	(%rax,%rax,4), %rax
	shlq	$6, %rax
	vmovddup	(%rsi,%rax), %xmm1
	vmovddup	(%rsi), %xmm3
	vdivpd	%xmm3, %xmm1, %xmm1
	vmovhpd	%xmm1, (%rsi,%rax)
	vpaddq	%xmm8, %xmm2, %xmm2
	vpcmpeqq	%xmm0, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_11
# BB#12:
	vmovdqa	.LCPI5_4(%rip), %xmm2
	.align	16, 0x90
.LBB5_13:                               # %for.body25.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_14 Depth 2
                                        #     Child Loop BB5_30 Depth 2
                                        #       Child Loop BB5_31 Depth 3
                                        #       Child Loop BB5_27 Depth 3
	vmovdqa	%xmm8, %xmm3
	vpextrq	$1, %xmm3, %r9
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB5_14:                               # %for.body25
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm5, %rax
	leaq	(%r9,%r9,4), %r10
	shlq	$6, %r10
	addq	%rsi, %r10
	vmovddup	(%r10,%rax,8), %xmm1
	leaq	(%rax,%rax,4), %rax
	shlq	$6, %rax
	addq	%rsi, %rax
	vmovddup	(%rax,%r9,8), %xmm6
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm4, %xmm4
	vpaddq	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm3, %xmm5, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_14
# BB#15:                                # %for.end32
                                        #   in Loop: Header=BB5_13 Depth=1
	vmovddup	(%r10,%r9,8), %xmm1
	vsubpd	%xmm4, %xmm1, %xmm1
	vmovhpd	%xmm1, (%r10,%r9,8)
	vpaddq	%xmm2, %xmm3, %xmm8
	vpcmpgtq	%xmm8, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_16
# BB#29:                                #   in Loop: Header=BB5_13 Depth=1
	leaq	(%r10,%r9,8), %r8
	vmovdqa	%xmm8, %xmm5
	.align	16, 0x90
.LBB5_30:                               # %for.body46.lr.ph.us
                                        #   Parent Loop BB5_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_31 Depth 3
                                        #       Child Loop BB5_27 Depth 3
	vpextrq	$1, %xmm5, %rdi
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	.align	16, 0x90
.LBB5_31:                               # %for.body46.us
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm7, %rax
	vmovddup	(%r10,%rax,8), %xmm1
	leaq	(%rax,%rax,4), %rax
	shlq	$6, %rax
	addq	%rsi, %rax
	vmovddup	(%rax,%rdi,8), %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm6, %xmm6
	vpaddq	%xmm2, %xmm7, %xmm7
	vpcmpeqq	%xmm3, %xmm7, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_31
# BB#32:                                # %for.body64.lr.ph.us
                                        #   in Loop: Header=BB5_30 Depth=2
	vmovddup	(%r10,%rdi,8), %xmm1
	vsubpd	%xmm6, %xmm1, %xmm1
	vmovhpd	%xmm1, (%r10,%rdi,8)
	vxorpd	%xmm6, %xmm6, %xmm6
	vpxor	%xmm7, %xmm7, %xmm7
	.align	16, 0x90
.LBB5_27:                               # %for.body64.us
                                        #   Parent Loop BB5_13 Depth=1
                                        #     Parent Loop BB5_30 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm7, %rdx
	leaq	(%rdi,%rdi,4), %rax
	shlq	$6, %rax
	addq	%rsi, %rax
	vmovddup	(%rax,%rdx,8), %xmm1
	leaq	(%rdx,%rdx,4), %rdx
	shlq	$6, %rdx
	addq	%rsi, %rdx
	vmovddup	(%rdx,%r9,8), %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm6, %xmm6
	vpaddq	%xmm2, %xmm7, %xmm7
	vpcmpeqq	%xmm3, %xmm7, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_27
# BB#28:                                # %for.end73.us
                                        #   in Loop: Header=BB5_30 Depth=2
	vmovddup	(%rax,%r9,8), %xmm1
	vsubpd	%xmm6, %xmm1, %xmm1
	vmovddup	(%r8), %xmm6
	vdivpd	%xmm6, %xmm1, %xmm1
	vmovhpd	%xmm1, (%rax,%r9,8)
	vpaddq	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm0, %xmm5, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_30
.LBB5_16:                               # %for.cond17.loopexit
                                        #   in Loop: Header=BB5_13 Depth=1
	vpcmpeqq	%xmm0, %xmm8, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_13
# BB#17:
	vmovdqa	.LCPI5_4(%rip), %xmm3
	.align	16, 0x90
.LBB5_18:                               # %for.body96.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_19 Depth 2
	vpextrq	$1, %xmm2, %rax
	vmovddup	(%rcx,%rax,8), %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB5_19:                               # %for.body96
                                        #   Parent Loop BB5_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm5, %rdx
	leaq	(%rax,%rax,4), %rdi
	shlq	$6, %rdi
	addq	%rsi, %rdi
	vmovddup	(%rdi,%rdx,8), %xmm1
	vmovddup	(%rcx,%rdx,8), %xmm6
	vmulpd	%xmm6, %xmm1, %xmm1
	vsubpd	%xmm1, %xmm4, %xmm4
	vmovhpd	%xmm4, (%rcx,%rax,8)
	vpaddq	%xmm3, %xmm5, %xmm5
	vpcmpeqq	%xmm2, %xmm5, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_19
# BB#20:                                # %for.inc107
                                        #   in Loop: Header=BB5_18 Depth=1
	vpaddq	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm0, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_18
.LBB5_21:                               # %for.end109
	vpaddq	.LCPI5_5(%rip), %xmm10, %xmm1
	vpcmpeqd	%xmm8, %xmm8, %xmm8
	vpextrq	$1, %xmm1, %rax
	vmovddup	(%rcx,%rax,8), %xmm1
	leaq	(%rax,%rax,4), %rdx
	shlq	$6, %rdx
	addq	%rsi, %rdx
	vmovddup	(%rdx,%rax,8), %xmm3
	vdivpd	%xmm3, %xmm1, %xmm1
	vmovhpd	%xmm1, (%rcx,%rax,8)
	vpaddq	.LCPI5_6(%rip), %xmm10, %xmm1
	vpcmpgtq	%xmm8, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_26
# BB#22:                                # %for.cond129.preheader.lr.ph
	cltq
	vmovq	%rax, %xmm1
	movslq	%edx, %rax
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm1, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm1[0]
	vmovdqa	.LCPI5_4(%rip), %xmm1
	vpxor	%xmm4, %xmm4, %xmm4
	.align	16, 0x90
.LBB5_23:                               # %for.cond129.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_24 Depth 2
	vpextrq	$1, %xmm3, %rax
	vpaddq	%xmm1, %xmm3, %xmm6
	vmovddup	(%rcx,%rax,8), %xmm5
	vpcmpgtq	%xmm6, %xmm0, %xmm7
	vptest	%xmm7, %xmm7
	je	.LBB5_25
	.align	16, 0x90
.LBB5_24:                               # %for.body133
                                        #   Parent Loop BB5_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm6, %rdx
	leaq	(%rax,%rax,4), %rdi
	shlq	$6, %rdi
	addq	%rsi, %rdi
	vmovddup	(%rdi,%rdx,8), %xmm7
	vmovddup	(%rcx,%rdx,8), %xmm2
	vmulpd	%xmm2, %xmm7, %xmm2
	vsubpd	%xmm2, %xmm5, %xmm5
	vmovhpd	%xmm5, (%rcx,%rax,8)
	vpaddq	%xmm1, %xmm6, %xmm6
	vpcmpeqq	%xmm0, %xmm6, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB5_24
.LBB5_25:                               # %for.end143
                                        #   in Loop: Header=BB5_23 Depth=1
	leaq	(%rax,%rax,4), %rdx
	shlq	$6, %rdx
	addq	%rsi, %rdx
	vmovddup	(%rdx,%rax,8), %xmm2
	vdivpd	%xmm2, %xmm5, %xmm2
	vmovhpd	%xmm2, (%rcx,%rax,8)
	vpcmpgtq	%xmm4, %xmm3, %xmm2
	vpaddq	%xmm8, %xmm3, %xmm3
	vptest	%xmm2, %xmm2
	jne	.LBB5_23
.LBB5_26:                               # %for.end151
	ret
.Ltmp74:
	.size	Crystal_Cholesky, .Ltmp74-Crystal_Cholesky
	.cfi_endproc

	.type	.L.str2,@object         # @.str2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str2:
	.asciz	"returnVal = %f \n"
	.size	.L.str2, 17

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"i = %5d j = %5d    dtcdgd[i][j]   = %e \n"
	.size	.L.str3, 41

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	"\nTotal Wall time = %f seconds. \n"
	.size	.L.str4, 33

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	"\nTotal CPU  time = %f seconds. \n\n"
	.size	.L.str5, 34

	.type	.Lstr,@object           # @str
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr:
	.asciz	"\nSequoia benchmark version 1.0"
	.size	.Lstr, 31

	.type	.Lstr6,@object          # @str6
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr6:
	.asciz	"\n***** results "
	.size	.Lstr6, 16

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"\nWall time = %f seconds. \n"
	.size	.L.str1, 27

	.type	.L.str23,@object        # @.str23
.L.str23:
	.asciz	"\nCPU  time = %f seconds. \n\n"
	.size	.L.str23, 28

	.type	.Lstr4,@object          # @str4
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr4:
	.asciz	"\n***** timing for Crystal_div "
	.size	.Lstr4, 31

	.type	.Lstr5,@object          # @str5
	.align	16
.Lstr5:
	.asciz	"\n***** timing for Crystal_pow "
	.size	.Lstr5, 31

	.type	.Lstr65,@object         # @str65
	.align	16
.Lstr65:
	.asciz	"\n***** timing for Crystal_Cholesky "
	.size	.Lstr65, 36


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
