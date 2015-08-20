	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI0_1:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI0_2:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI0_3:
	.quad	4611235658464650854     # double 1.900000e+00
	.quad	4611235658464650854     # double 1.900000e+00
.LCPI0_4:
	.quad	4562254508917369340     # double 1.000000e-03
	.quad	4562254508917369340     # double 1.000000e-03
.LCPI0_5:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI0_6:
	.quad	4615063718147915776     # double 3.500000e+00
	.quad	4615063718147915776     # double 3.500000e+00
.LCPI0_7:
	.quad	4532020583610935537     # double 1.000000e-05
	.quad	4532020583610935537     # double 1.000000e-05
.LCPI0_8:
	.quad	4576918229304087675     # double 1.000000e-02
	.quad	4576918229304087675     # double 1.000000e-02
.LCPI0_9:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_10:
	.quad	40                      # 0x28
	.quad	40                      # 0x28
.LCPI0_11:
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
.Ltmp4:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp5:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp6:
	.cfi_def_cfa_offset 32
	subq	$40080, %rsp            # imm = 0x9C90
.Ltmp7:
	.cfi_def_cfa_offset 40112
.Ltmp8:
	.cfi_offset %rbx, -32
.Ltmp9:
	.cfi_offset %r14, -24
.Ltmp10:
	.cfi_offset %r15, -16
	movl	$.Lstr, %edi
	callq	puts
	leaq	48(%rsp), %r15
	xorl	%esi, %esi
	movl	$12800, %edx            # imm = 0x3200
	movq	%r15, %rdi
	callq	memset
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI0_0(%rip), %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vmovapd	.LCPI0_1(%rip), %xmm13
	vmovapd	.LCPI0_2(%rip), %xmm12
	vmovapd	.LCPI0_3(%rip), %xmm11
	movabsq	$4629137466983448576, %rax # imm = 0x403E000000000000
	vmovapd	.LCPI0_7(%rip), %xmm9
	vmovapd	.LCPI0_8(%rip), %xmm15
	vmovdqa	.LCPI0_9(%rip), %xmm10
	vmovdqa	.LCPI0_10(%rip), %xmm14
.LBB0_1:                                # %for.body.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	vandpd	%xmm1, %xmm0, %xmm3
	vshufpd	$1, %xmm0, %xmm0, %xmm4 # xmm4 = xmm0[1,0]
	vandpd	%xmm1, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm3, %xmm3
	vpxor	%xmm2, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB0_35
# BB#2:                                 # %for.body.i.split46
                                        #   in Loop: Header=BB0_1 Depth=1
	vpextrq	$1, %xmm0, %rcx
	vmovq	%xmm0, %rdx
	movslq	%edx, %rdx
	movslq	%ecx, %rsi
	vcvtsi2sdq	%rsi, %xmm0, %xmm3
	vcvtsi2sdq	%rdx, %xmm0, %xmm4
	vunpcklpd	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpermilpd	$1, %xmm3, %xmm4 # xmm4 = xmm3[1,0]
	vcmpneqpd	%xmm4, %xmm3, %xmm6
	vcmpordpd	%xmm4, %xmm3, %xmm4
	vandpd	%xmm6, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB0_35
# BB#3:                                 # %for.body.i.split46.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vmulpd	%xmm13, %xmm3, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB0_35
# BB#4:                                 # %for.body.i.split46.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vdivpd	%xmm12, %xmm4, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB0_35
# BB#5:                                 # %for.body.i.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vaddpd	%xmm11, %xmm4, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB0_35
# BB#6:                                 # %for.body.i.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm6 # xmm6 = xmm4[1,1]
	vmovsd	%xmm6, 39728(%rsp,%rcx,8)
	vmulpd	.LCPI0_4(%rip), %xmm4, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB0_35
# BB#7:                                 # %for.body.i.split.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[1,1]
	vmovsd	%xmm4, 39408(%rsp,%rcx,8)
	vaddpd	.LCPI0_5(%rip), %xmm3, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB0_35
# BB#8:                                 # %for.body.i.split.split.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[1,1]
	vmovsd	%xmm4, 39088(%rsp,%rcx,8)
	movq	%rax, 38768(%rsp,%rcx,8)
	vaddpd	.LCPI0_6(%rip), %xmm3, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB0_35
# BB#9:                                 # %for.body.i.split.split.split.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[1,1]
	vmovsd	%xmm4, 38448(%rsp,%rcx,8)
	vxorpd	%xmm4, %xmm4, %xmm4
.LBB0_10:                               # %for.body19.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vandpd	%xmm1, %xmm4, %xmm6
	vshufpd	$1, %xmm4, %xmm4, %xmm7 # xmm7 = xmm4[1,0]
	vandpd	%xmm1, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm6, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB0_35
# BB#11:                                # %for.body19.i.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vpextrq	$1, %xmm4, %rdx
	vmovq	%xmm4, %rsi
	movslq	%esi, %rsi
	movslq	%edx, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm6
	vcvtsi2sdq	%rsi, %xmm0, %xmm7
	vunpcklpd	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	vpermilpd	$1, %xmm6, %xmm7 # xmm7 = xmm6[1,0]
	vcmpneqpd	%xmm7, %xmm6, %xmm5
	vcmpordpd	%xmm7, %xmm6, %xmm7
	vandpd	%xmm5, %xmm7, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#12:                                # %for.body19.i.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vmulpd	%xmm9, %xmm6, %xmm6
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#13:                                # %for.body19.i.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vmulpd	%xmm6, %xmm3, %xmm6
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#14:                                # %for.body19.i.split.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vaddpd	%xmm15, %xmm6, %xmm6
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#15:                                # %for.body19.i.split.split.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vunpckhpd	%xmm6, %xmm6, %xmm5 # xmm5 = xmm6[1,1]
	leaq	(%rcx,%rcx,4), %rsi
	shlq	$6, %rsi
	leaq	25648(%rsp,%rsi), %rdi
	vmovsd	%xmm5, (%rdi,%rdx,8)
	vpaddq	%xmm0, %xmm4, %xmm6
	vshufpd	$1, %xmm6, %xmm6, %xmm8 # xmm8 = xmm6[1,0]
	vpcmpeqq	%xmm8, %xmm6, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#16:                                # %for.body19.i.split.split.split.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vandpd	%xmm1, %xmm6, %xmm5
	vandpd	%xmm1, %xmm8, %xmm7
	vpcmpeqq	%xmm7, %xmm5, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#17:                                # %for.body19.i.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vmovq	%xmm6, %rdi
	movslq	%edi, %rdi
	vpextrq	$1, %xmm6, %rbx
	movslq	%ebx, %rbx
	vcvtsi2sdq	%rbx, %xmm0, %xmm5
	vcvtsi2sdq	%rdi, %xmm0, %xmm6
	vunpcklpd	%xmm5, %xmm6, %xmm6 # xmm6 = xmm6[0],xmm5[0]
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#18:                                # %for.body19.i.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vunpckhpd	%xmm6, %xmm6, %xmm5 # xmm5 = xmm6[1,1]
	leaq	12848(%rsp,%rsi), %rsi
	vmovsd	%xmm5, (%rsi,%rdx,8)
	vpaddq	%xmm10, %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm5 # xmm5 = xmm4[1,0]
	vpcmpeqq	%xmm5, %xmm4, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#19:                                # %for.body19.i.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vpcmpeqq	%xmm14, %xmm4, %xmm6
	vpand	%xmm10, %xmm6, %xmm5
	vshufpd	$1, %xmm6, %xmm6, %xmm7 # xmm7 = xmm6[1,0]
	vandpd	%xmm10, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm5, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB0_35
# BB#20:                                # %for.body19.i.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB0_10 Depth=2
	vptest	%xmm6, %xmm6
	je	.LBB0_10
# BB#21:                                # %for.inc39.i
                                        #   in Loop: Header=BB0_1 Depth=1
	vpaddq	%xmm10, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm3 # xmm3 = xmm0[1,0]
	vpcmpeqq	%xmm3, %xmm0, %xmm3
	vpxor	%xmm2, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB0_35
# BB#22:                                # %for.inc39.i.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vpcmpeqq	%xmm14, %xmm0, %xmm3
	vpand	%xmm10, %xmm3, %xmm4
	vshufpd	$1, %xmm3, %xmm3, %xmm5 # xmm5 = xmm3[1,0]
	vandpd	%xmm10, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm2, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB0_35
# BB#23:                                # %for.inc39.i.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vptest	%xmm3, %xmm3
	je	.LBB0_1
# BB#24:                                # %init.exit
	leaq	40064(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	movq	%rax, %r14
	movq	%r15, 8(%rsp)
	leaq	12848(%rsp), %rax
	movq	%rax, (%rsp)
	leaq	39728(%rsp), %rdi
	leaq	39408(%rsp), %rsi
	leaq	39088(%rsp), %rdx
	leaq	38768(%rsp), %rcx
	leaq	38448(%rsp), %r8
	leaq	25648(%rsp), %r9
	callq	SPEdriver
	vmovsd	%xmm0, 32(%rsp)         # 8-byte Spill
	leaq	40048(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	movq	%rax, %rbx
	movl	$.Lstr6, %edi
	callq	puts
	movl	$.L.str2, %edi
	movb	$1, %al
	vmovsd	32(%rsp), %xmm0         # 8-byte Reload
	callq	printf
	vmovsd	25648(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	25752(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	25856(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	25960(%rsp), %xmm0
	movl	$.L.str3, %edi
	xorl	%esi, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vmovsd	29808(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	29912(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	30016(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	30120(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$13, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vmovsd	33968(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	34072(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	34176(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	34280(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$26, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38128(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	xorl	%edx, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38232(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	movl	$13, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38336(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	movl	$26, %edx
	movb	$1, %al
	callq	printf
	vmovsd	38440(%rsp), %xmm0
	movl	$.L.str3, %edi
	movl	$39, %esi
	movl	$39, %edx
	movb	$1, %al
	callq	printf
	vpbroadcastq	40048(%rsp), %xmm0
	vpbroadcastq	40064(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_35
# BB#25:                                # %init.exit.split47
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_35
# BB#26:                                # %init.exit.split47.split
	vpbroadcastq	40056(%rsp), %xmm1
	vpbroadcastq	40072(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vshufpd	$1, %xmm1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpcmpeqq	%xmm2, %xmm1, %xmm2
	vpcmpeqd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_35
# BB#27:                                # %init.exit.split47.split.split48
	vpextrq	$1, %xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vmovq	%xmm1, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_35
# BB#28:                                # %init.exit.split47.split.split48.split
	vdivpd	.LCPI0_11(%rip), %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_35
# BB#29:                                # %init.exit.split47.split.split
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_35
# BB#30:                                # %init.exit.split47.split.split.split
	vmovq	%r14, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 32(%rsp)         # 16-byte Spill
	vmovq	%rbx, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 16(%rsp)         # 16-byte Spill
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str4, %edi
	movb	$1, %al
	callq	printf
	vmovdqa	32(%rsp), %xmm0         # 16-byte Reload
	vmovdqa	16(%rsp), %xmm1         # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_35
# BB#31:                                # %init.exit.split47.split.split.split.split
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_35
# BB#32:                                # %init.exit.split47.split.split.split.split.split
	vdivpd	.LCPI0_11(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_33
.LBB0_35:                               # %relExit
	movl	$.LrelFun, %edi
	movl	$.Lfunc, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
.LBB0_34:                               # %init.exit.split
	xorl	%eax, %eax
	addq	$40080, %rsp            # imm = 0x9C90
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
.LBB0_33:                               # %init.exit.split
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str5, %edi
	movb	$1, %al
	callq	printf
	jmp	.LBB0_34
.Ltmp11:
	.size	main, .Ltmp11-main
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI1_1:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI1_2:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI1_3:
	.quad	4611235658464650854     # double 1.900000e+00
	.quad	4611235658464650854     # double 1.900000e+00
.LCPI1_4:
	.quad	4562254508917369340     # double 1.000000e-03
	.quad	4562254508917369340     # double 1.000000e-03
.LCPI1_5:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI1_6:
	.quad	4615063718147915776     # double 3.500000e+00
	.quad	4615063718147915776     # double 3.500000e+00
.LCPI1_7:
	.quad	4532020583610935537     # double 1.000000e-05
	.quad	4532020583610935537     # double 1.000000e-05
.LCPI1_8:
	.quad	4576918229304087675     # double 1.000000e-02
	.quad	4576918229304087675     # double 1.000000e-02
.LCPI1_9:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI1_10:
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
.Ltmp17:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp18:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp19:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp20:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp21:
	.cfi_def_cfa_offset 48
.Ltmp22:
	.cfi_offset %rbx, -40
.Ltmp23:
	.cfi_offset %r12, -32
.Ltmp24:
	.cfi_offset %r14, -24
.Ltmp25:
	.cfi_offset %r15, -16
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	56(%rsp), %r10
	movq	48(%rsp), %r14
	vmovapd	.LCPI1_0(%rip), %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vmovapd	.LCPI1_1(%rip), %xmm13
	vmovapd	.LCPI1_2(%rip), %xmm12
	vmovapd	.LCPI1_3(%rip), %xmm11
	movabsq	$4629137466983448576, %r11 # imm = 0x403E000000000000
	vmovapd	.LCPI1_7(%rip), %xmm9
	vmovapd	.LCPI1_8(%rip), %xmm15
	vmovdqa	.LCPI1_9(%rip), %xmm10
	vmovdqa	.LCPI1_10(%rip), %xmm14
.LBB1_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
	vandpd	%xmm1, %xmm0, %xmm3
	vshufpd	$1, %xmm0, %xmm0, %xmm4 # xmm4 = xmm0[1,0]
	vandpd	%xmm1, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm3, %xmm3
	vpxor	%xmm2, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB1_25
# BB#2:                                 # %for.body.split23
                                        #   in Loop: Header=BB1_1 Depth=1
	vpextrq	$1, %xmm0, %r15
	vmovq	%xmm0, %rax
	cltq
	movslq	%r15d, %rbx
	vcvtsi2sdq	%rbx, %xmm0, %xmm3
	vcvtsi2sdq	%rax, %xmm0, %xmm4
	vunpcklpd	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpermilpd	$1, %xmm3, %xmm4 # xmm4 = xmm3[1,0]
	vcmpneqpd	%xmm4, %xmm3, %xmm6
	vcmpordpd	%xmm4, %xmm3, %xmm4
	vandpd	%xmm6, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB1_25
# BB#3:                                 # %for.body.split23.split
                                        #   in Loop: Header=BB1_1 Depth=1
	vmulpd	%xmm13, %xmm3, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB1_25
# BB#4:                                 # %for.body.split21
                                        #   in Loop: Header=BB1_1 Depth=1
	vdivpd	%xmm12, %xmm4, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB1_25
# BB#5:                                 # %for.body.split21.split
                                        #   in Loop: Header=BB1_1 Depth=1
	vaddpd	%xmm11, %xmm4, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB1_25
# BB#6:                                 # %for.body.split
                                        #   in Loop: Header=BB1_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm6 # xmm6 = xmm4[1,1]
	vmovsd	%xmm6, (%rdi,%r15,8)
	vmulpd	.LCPI1_4(%rip), %xmm4, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB1_25
# BB#7:                                 # %for.body.split.split22
                                        #   in Loop: Header=BB1_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[1,1]
	vmovsd	%xmm4, (%rsi,%r15,8)
	vaddpd	.LCPI1_5(%rip), %xmm3, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB1_25
# BB#8:                                 # %for.body.split.split
                                        #   in Loop: Header=BB1_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[1,1]
	vmovsd	%xmm4, (%rdx,%r15,8)
	movq	%r11, (%rcx,%r15,8)
	vaddpd	.LCPI1_6(%rip), %xmm3, %xmm4
	vpermilpd	$1, %xmm4, %xmm6 # xmm6 = xmm4[1,0]
	vcmpneqpd	%xmm6, %xmm4, %xmm7
	vcmpordpd	%xmm6, %xmm4, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB1_25
# BB#9:                                 # %for.body.split.split.split
                                        #   in Loop: Header=BB1_1 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[1,1]
	vmovsd	%xmm4, (%r8,%r15,8)
	vxorpd	%xmm4, %xmm4, %xmm4
.LBB1_10:                               # %for.body19
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vandpd	%xmm1, %xmm4, %xmm6
	vshufpd	$1, %xmm4, %xmm4, %xmm7 # xmm7 = xmm4[1,0]
	vandpd	%xmm1, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm6, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB1_25
# BB#11:                                # %for.body19.split25
                                        #   in Loop: Header=BB1_10 Depth=2
	vpextrq	$1, %xmm4, %r12
	vmovq	%xmm4, %rbx
	movslq	%ebx, %rbx
	movslq	%r12d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm6
	vcvtsi2sdq	%rbx, %xmm0, %xmm7
	vunpcklpd	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	vpermilpd	$1, %xmm6, %xmm7 # xmm7 = xmm6[1,0]
	vcmpneqpd	%xmm7, %xmm6, %xmm5
	vcmpordpd	%xmm7, %xmm6, %xmm7
	vandpd	%xmm5, %xmm7, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#12:                                # %for.body19.split24
                                        #   in Loop: Header=BB1_10 Depth=2
	vmulpd	%xmm9, %xmm6, %xmm6
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#13:                                # %for.body19.split24.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vmulpd	%xmm6, %xmm3, %xmm6
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#14:                                # %for.body19.split24.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vaddpd	%xmm15, %xmm6, %xmm6
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#15:                                # %for.body19.split24.split.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vunpckhpd	%xmm6, %xmm6, %xmm5 # xmm5 = xmm6[1,1]
	leaq	(%r15,%r15,4), %rax
	shlq	$6, %rax
	addq	%r9, %rax
	vmovsd	%xmm5, (%rax,%r12,8)
	vpaddq	%xmm0, %xmm4, %xmm6
	vshufpd	$1, %xmm6, %xmm6, %xmm8 # xmm8 = xmm6[1,0]
	vpcmpeqq	%xmm8, %xmm6, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#16:                                # %for.body19.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vandpd	%xmm1, %xmm6, %xmm5
	vandpd	%xmm1, %xmm8, %xmm7
	vpcmpeqq	%xmm7, %xmm5, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#17:                                # %for.body19.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vmovq	%xmm6, %rax
	cltq
	vpextrq	$1, %xmm6, %rbx
	movslq	%ebx, %rbx
	vcvtsi2sdq	%rbx, %xmm0, %xmm5
	vcvtsi2sdq	%rax, %xmm0, %xmm6
	vunpcklpd	%xmm5, %xmm6, %xmm6 # xmm6 = xmm6[0],xmm5[0]
	vpermilpd	$1, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vcmpneqpd	%xmm5, %xmm6, %xmm7
	vcmpordpd	%xmm5, %xmm6, %xmm5
	vandpd	%xmm7, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#18:                                # %for.body19.split.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vunpckhpd	%xmm6, %xmm6, %xmm5 # xmm5 = xmm6[1,1]
	movq	%r15, %rax
	shlq	$6, %rax
	leaq	(%rax,%rax,4), %rax
	leaq	(%r14,%rax), %rbx
	vmovsd	%xmm5, (%rbx,%r12,8)
	addq	%r10, %rax
	movq	$0, (%rax,%r12,8)
	vpaddq	%xmm10, %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm5 # xmm5 = xmm4[1,0]
	vpcmpeqq	%xmm5, %xmm4, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#19:                                # %for.body19.split.split.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vpcmpeqq	%xmm14, %xmm4, %xmm6
	vpand	%xmm10, %xmm6, %xmm5
	vshufpd	$1, %xmm6, %xmm6, %xmm7 # xmm7 = xmm6[1,0]
	vandpd	%xmm10, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm5, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_25
# BB#20:                                # %for.body19.split.split.split.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vptest	%xmm6, %xmm6
	je	.LBB1_10
# BB#21:                                # %for.inc39
                                        #   in Loop: Header=BB1_1 Depth=1
	vpaddq	%xmm10, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm3 # xmm3 = xmm0[1,0]
	vpcmpeqq	%xmm3, %xmm0, %xmm3
	vpxor	%xmm2, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB1_25
# BB#22:                                # %for.inc39.split
                                        #   in Loop: Header=BB1_1 Depth=1
	vpcmpeqq	%xmm14, %xmm0, %xmm3
	vpand	%xmm10, %xmm3, %xmm4
	vshufpd	$1, %xmm3, %xmm3, %xmm5 # xmm5 = xmm3[1,0]
	vandpd	%xmm10, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm2, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB1_25
# BB#23:                                # %for.inc39.split.split
                                        #   in Loop: Header=BB1_1 Depth=1
	vptest	%xmm3, %xmm3
	je	.LBB1_1
	jmp	.LBB1_24
.LBB1_25:                               # %relExit
	movl	$.LrelFun, %edi
	movl	$.Lfunc1, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
.LBB1_24:                               # %for.end41
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
.Ltmp26:
	.size	init, .Ltmp26-init
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
	.zero	16,255
	.text
	.globl	SPEdriver
	.align	16, 0x90
	.type	SPEdriver,@function
SPEdriver:                              # @SPEdriver
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp35:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp36:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp37:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp38:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp39:
	.cfi_def_cfa_offset 56
	subq	$840, %rsp              # imm = 0x348
.Ltmp40:
	.cfi_def_cfa_offset 896
.Ltmp41:
	.cfi_offset %rbx, -56
.Ltmp42:
	.cfi_offset %r12, -48
.Ltmp43:
	.cfi_offset %r13, -40
.Ltmp44:
	.cfi_offset %r14, -32
.Ltmp45:
	.cfi_offset %r15, -24
.Ltmp46:
	.cfi_offset %rbp, -16
	movq	%r9, 128(%rsp)          # 8-byte Spill
	movq	%r8, %r15
	movq	%rcx, %rbx
	movq	%rdx, %r12
	movq	%rsi, %rbp
	movq	%rdi, %r13
	movq	896(%rsp), %r14
	leaq	176(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, 144(%rsp)        # 16-byte Spill
	.align	16, 0x90
.LBB2_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	904(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	%r14, 8(%rsp)
	movq	128(%rsp), %rax         # 8-byte Reload
	movq	%rax, (%rsp)
	movl	$40, %edi
	vmovsd	.LCPI2_0(%rip), %xmm0
	movq	%r13, %rsi
	movq	%rbp, %rdx
	movq	%r12, %rcx
	movq	%rbx, %r8
	movq	%r15, %r9
	callq	Crystal_div
	vmovdqa	.LCPI2_1(%rip), %xmm3
	vmovdqa	144(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm3, %xmm4, %xmm4
	vmovdqa	.LCPI2_2(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm4, %xmm0
	vshufpd	$1, %xmm4, %xmm4, %xmm1 # xmm1 = xmm4[1,0]
	vandpd	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm5, %xmm5, %xmm5
	vpxor	%xmm5, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#2:                                 # %for.body.split
                                        #   in Loop: Header=BB2_1 Depth=1
	vpcmpeqq	.LCPI2_3(%rip), %xmm0, %xmm0
	vpand	%xmm3, %xmm0, %xmm1
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vandpd	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpxor	%xmm5, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#3:                                 # %for.body.split.split
                                        #   in Loop: Header=BB2_1 Depth=1
	vmovaps	%xmm4, 144(%rsp)        # 16-byte Spill
	vptest	%xmm0, %xmm0
	je	.LBB2_1
# BB#4:                                 # %for.end
	leaq	160(%rsp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
	callq	clock
	vpbroadcastq	160(%rsp), %xmm0
	vpbroadcastq	176(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#5:                                 # %for.end.split
	vpextrq	$1, %xmm0, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vmovq	%xmm0, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#6:                                 # %for.end.split.split
	vpbroadcastq	168(%rsp), %xmm1
	vpbroadcastq	184(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vshufpd	$1, %xmm1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpcmpeqq	%xmm2, %xmm1, %xmm2
	vpcmpeqd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#7:                                 # %for.end.split.split.split
	vpextrq	$1, %xmm1, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm2
	vmovq	%xmm1, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#8:                                 # %for.end.split.split.split.split
	vdivpd	.LCPI2_4(%rip), %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#9:                                 # %for.end.split.split.split.split.split
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#10:                                # %for.end.split.split.split.split.split.split
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 144(%rsp)        # 16-byte Spill
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	movl	$.Lstr4, %edi
	callq	puts
	movl	$.L.str1, %edi
	movb	$1, %al
	vmovaps	96(%rsp), %xmm0         # 16-byte Reload
	callq	printf
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vmovdqa	144(%rsp), %xmm1        # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#11:                                # %for.end.split.split.split.split.split.split.split
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#12:                                # %for.end.split.split.split.split.split.split.split.split
	vdivpd	.LCPI2_4(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#13:                                # %for.end.split.split.split.split.split.split.split.split.split
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str23, %edi
	movb	$1, %al
	callq	printf
	leaq	176(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, 144(%rsp)        # 16-byte Spill
	movabsq	$4607182418800017408, %rbx # imm = 0x3FF0000000000000
.LBB2_14:                               # %for.body23
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_15 Depth 2
                                        #     Child Loop BB2_22 Depth 2
	vxorps	%xmm0, %xmm0, %xmm0
.LBB2_15:                               # %for.body.i
                                        #   Parent Loop BB2_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm0, %rax
	movq	%rbx, 192(%rsp,%rax,8)
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm2
	vunpcklpd	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	vmovdqa	.LCPI2_1(%rip), %xmm2
	vmovdqa	%xmm2, %xmm4
	jne	.LBB2_73
# BB#16:                                # %for.body.i.split62
                                        #   in Loop: Header=BB2_15 Depth=2
	vmulpd	.LCPI2_5(%rip), %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#17:                                # %for.body.i.split
                                        #   in Loop: Header=BB2_15 Depth=2
	vmulpd	.LCPI2_6(%rip), %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#18:                                # %for.body.i.split.split
                                        #   in Loop: Header=BB2_15 Depth=2
	vdivpd	.LCPI2_7(%rip), %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#19:                                # %for.body.i.split.split.split
                                        #   in Loop: Header=BB2_15 Depth=2
	vunpckhpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,1]
	vmovsd	%xmm1, 512(%rsp,%rax,8)
	vpaddq	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpxor	.LCPI2_12, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#20:                                # %for.body.i.split.split.split.split
                                        #   in Loop: Header=BB2_15 Depth=2
	vpcmpeqq	.LCPI2_8(%rip), %xmm0, %xmm1
	vpand	%xmm4, %xmm1, %xmm2
	vshufpd	$1, %xmm1, %xmm1, %xmm3 # xmm3 = xmm1[1,0]
	vandpd	%xmm4, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm2, %xmm2
	vpxor	.LCPI2_12, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#21:                                # %for.body.i.split.split.split.split.split
                                        #   in Loop: Header=BB2_15 Depth=2
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	%xmm2, 48(%rsp)         # 16-byte Spill
	vptest	%xmm1, %xmm1
	je	.LBB2_15
.LBB2_22:                               # %for.body9.i
                                        #   Parent Loop BB2_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqa	48(%rsp), %xmm0         # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	vmovddup	(%r13,%rbp,8), %xmm0
	vmovddup	192(%rsp,%rbp,8), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#23:                                # %for.body9.i.split
                                        #   in Loop: Header=BB2_22 Depth=2
	vaddpd	.LCPI2_9(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#24:                                # %for.body9.i.split.split
                                        #   in Loop: Header=BB2_22 Depth=2
	vmulpd	.LCPI2_10(%rip), %xmm0, %xmm2
	vpermilpd	$1, %xmm2, %xmm0 # xmm0 = xmm2[1,0]
	vcmpneqpd	%xmm0, %xmm2, %xmm1
	vcmpordpd	%xmm0, %xmm2, %xmm0
	vandpd	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_73
# BB#25:                                # %for.body9.i.split.split.split
                                        #   in Loop: Header=BB2_22 Depth=2
	vmovapd	%xmm2, 32(%rsp)         # 16-byte Spill
	vmovaps	32(%rsp), %xmm0         # 16-byte Reload
	vmovsd	.LCPI2_0(%rip), %xmm1
	callq	pow
	vmovaps	%xmm0, 96(%rsp)         # 16-byte Spill
	vmovapd	32(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	.LCPI2_0(%rip), %xmm1
	callq	pow
	vmovdqa	.LCPI2_1(%rip), %xmm1
	vmovdqa	%xmm1, %xmm3
	vmovapd	96(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#26:                                # %for.body9.i.split.split.split.split
                                        #   in Loop: Header=BB2_22 Depth=2
	vmulpd	.LCPI2_11(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#27:                                # %for.body9.i.split.split.split.split.split
                                        #   in Loop: Header=BB2_22 Depth=2
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, 512(%rsp,%rbp,8)
	vmovdqa	48(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm3, %xmm1, %xmm1
	vmovdqa	%xmm1, 48(%rsp)         # 16-byte Spill
	vshufpd	$1, %xmm1, %xmm1, %xmm0 # xmm0 = xmm1[1,0]
	vpcmpeqq	%xmm0, %xmm1, %xmm0
	vpxor	.LCPI2_12, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_73
# BB#28:                                # %for.body9.i.split.split.split.split.split.split
                                        #   in Loop: Header=BB2_22 Depth=2
	vmovdqa	48(%rsp), %xmm0         # 16-byte Reload
	vpcmpeqq	.LCPI2_8(%rip), %xmm0, %xmm0
	vpand	%xmm3, %xmm0, %xmm1
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vandpd	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpxor	.LCPI2_12, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#29:                                # %for.body9.i.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB2_22 Depth=2
	vptest	%xmm0, %xmm0
	je	.LBB2_22
# BB#30:                                # %Crystal_pow.exit
                                        #   in Loop: Header=BB2_14 Depth=1
	vmovdqa	.LCPI2_1(%rip), %xmm0
	vmovdqa	%xmm0, %xmm3
	vmovdqa	144(%rsp), %xmm1        # 16-byte Reload
	vpaddq	%xmm3, %xmm1, %xmm1
	vmovdqa	%xmm1, 144(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI2_2(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm1, %xmm0
	vshufpd	$1, %xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,0]
	vandpd	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpxor	.LCPI2_12, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#31:                                # %Crystal_pow.exit.split
                                        #   in Loop: Header=BB2_14 Depth=1
	vpcmpeqq	.LCPI2_3(%rip), %xmm0, %xmm0
	vpand	%xmm3, %xmm0, %xmm1
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vandpd	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpxor	.LCPI2_12, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#32:                                # %Crystal_pow.exit.split.split
                                        #   in Loop: Header=BB2_14 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB2_14
# BB#33:                                # %for.end27
	vmovddup	536(%rsp), %xmm0
	vmovapd	%xmm0, 144(%rsp)        # 16-byte Spill
	leaq	160(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	gettimeofday
	callq	clock
	vpbroadcastq	160(%rsp), %xmm0
	vpbroadcastq	176(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#34:                                # %for.end27.split
	vpextrq	$1, %xmm0, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vmovq	%xmm0, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#35:                                # %for.end27.split.split
	vpbroadcastq	168(%rsp), %xmm1
	vpbroadcastq	184(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vshufpd	$1, %xmm1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpcmpeqq	%xmm2, %xmm1, %xmm2
	vpcmpeqd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#36:                                # %for.end27.split.split.split
	vpextrq	$1, %xmm1, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm2
	vmovq	%xmm1, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#37:                                # %for.end27.split.split.split.split
	vdivpd	.LCPI2_4(%rip), %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#38:                                # %for.end27.split.split.split.split.split
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#39:                                # %for.end27.split.split.split.split.split.split
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 96(%rsp)         # 16-byte Spill
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	movl	$.Lstr5, %edi
	callq	puts
	movl	$.L.str1, %edi
	movb	$1, %al
	vmovaps	80(%rsp), %xmm0         # 16-byte Reload
	callq	printf
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vmovdqa	96(%rsp), %xmm1         # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#40:                                # %for.end27.split.split.split.split.split.split.split
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#41:                                # %for.end27.split.split.split.split.split.split.split.split
	vdivpd	.LCPI2_4(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#42:                                # %for.end27.split.split.split.split.split.split.split.split.split
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str23, %edi
	movb	$1, %al
	callq	printf
	leaq	176(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	gettimeofday
	callq	clock
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vpcmpeqd	%xmm1, %xmm1, %xmm1
.LBB2_43:                               # %for.cond52.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_44 Depth 2
	vpextrq	$1, %xmm0, %rax
	vxorpd	%xmm2, %xmm2, %xmm2
.LBB2_44:                               # %for.body55
                                        #   Parent Loop BB2_43 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm2, %rcx
	movq	%rax, %rdx
	shlq	$6, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	movq	128(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rdx), %rsi
	vmovsd	(%rsi,%rcx,8), %xmm3
	addq	904(%rsp), %rdx
	vmovsd	%xmm3, (%rdx,%rcx,8)
	vmovdqa	.LCPI2_1(%rip), %xmm3
	vmovdqa	%xmm3, %xmm4
	vpaddq	%xmm4, %xmm2, %xmm2
	vshufpd	$1, %xmm2, %xmm2, %xmm3 # xmm3 = xmm2[1,0]
	vpcmpeqq	%xmm3, %xmm2, %xmm3
	vpxor	%xmm1, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB2_73
# BB#45:                                # %for.body55.split
                                        #   in Loop: Header=BB2_44 Depth=2
	vpcmpeqq	.LCPI2_8(%rip), %xmm2, %xmm3
	vmovdqa	%xmm4, %xmm6
	vpand	%xmm6, %xmm3, %xmm4
	vshufpd	$1, %xmm3, %xmm3, %xmm5 # xmm5 = xmm3[1,0]
	vandpd	%xmm6, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm1, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB2_73
# BB#46:                                # %for.body55.split.split
                                        #   in Loop: Header=BB2_44 Depth=2
	vptest	%xmm3, %xmm3
	je	.LBB2_44
# BB#47:                                # %for.inc65
                                        #   in Loop: Header=BB2_43 Depth=1
	vmovdqa	.LCPI2_1(%rip), %xmm2
	vmovdqa	%xmm2, %xmm4
	vpaddq	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vpcmpeqq	%xmm2, %xmm0, %xmm2
	vpxor	%xmm1, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#48:                                # %for.inc65.split
                                        #   in Loop: Header=BB2_43 Depth=1
	vpcmpeqq	.LCPI2_8(%rip), %xmm0, %xmm2
	vpand	%xmm4, %xmm2, %xmm3
	vmovdqa	%xmm4, %xmm5
	vshufpd	$1, %xmm2, %xmm2, %xmm4 # xmm4 = xmm2[1,0]
	vandpd	%xmm5, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm3, %xmm3
	vpxor	%xmm1, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB2_73
# BB#49:                                # %for.inc65.split.split
                                        #   in Loop: Header=BB2_43 Depth=1
	vptest	%xmm2, %xmm2
	je	.LBB2_43
# BB#50:
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, 64(%rsp)         # 16-byte Spill
.LBB2_51:                               # %for.cond72.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_52 Depth 2
                                        #       Child Loop BB2_53 Depth 3
	vpxor	%xmm0, %xmm0, %xmm0
.LBB2_52:                               # %for.cond76.preheader
                                        #   Parent Loop BB2_51 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_53 Depth 3
	vpextrq	$1, %xmm0, %rax
	vpxor	%xmm1, %xmm1, %xmm1
.LBB2_53:                               # %for.body79
                                        #   Parent Loop BB2_51 Depth=1
                                        #     Parent Loop BB2_52 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm1, %rcx
	movq	%rax, %rdx
	shlq	$6, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	movq	904(%rsp), %rsi
	leaq	(%rsi,%rdx), %rsi
	vmovsd	(%rsi,%rcx,8), %xmm2
	addq	128(%rsp), %rdx         # 8-byte Folded Reload
	vmovsd	%xmm2, (%rdx,%rcx,8)
	vmovdqa	.LCPI2_1(%rip), %xmm2
	vmovdqa	%xmm2, %xmm4
	vpaddq	%xmm4, %xmm1, %xmm1
	vshufpd	$1, %xmm1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpcmpeqq	%xmm2, %xmm1, %xmm2
	vpxor	.LCPI2_12, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#54:                                # %for.body79.split
                                        #   in Loop: Header=BB2_53 Depth=3
	vpcmpeqq	.LCPI2_8(%rip), %xmm1, %xmm2
	vpand	%xmm4, %xmm2, %xmm3
	vmovdqa	%xmm4, %xmm5
	vshufpd	$1, %xmm2, %xmm2, %xmm4 # xmm4 = xmm2[1,0]
	vandpd	%xmm5, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm3, %xmm3
	vpxor	.LCPI2_12, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB2_73
# BB#55:                                # %for.body79.split.split
                                        #   in Loop: Header=BB2_53 Depth=3
	vptest	%xmm2, %xmm2
	je	.LBB2_53
# BB#56:                                # %for.inc91
                                        #   in Loop: Header=BB2_52 Depth=2
	vmovdqa	.LCPI2_1(%rip), %xmm1
	vmovdqa	%xmm1, %xmm4
	vpaddq	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpxor	.LCPI2_12, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#57:                                # %for.inc91.split
                                        #   in Loop: Header=BB2_52 Depth=2
	vpcmpeqq	.LCPI2_8(%rip), %xmm0, %xmm1
	vpand	%xmm4, %xmm1, %xmm2
	vshufpd	$1, %xmm1, %xmm1, %xmm3 # xmm3 = xmm1[1,0]
	vandpd	%xmm4, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm2, %xmm2
	vpxor	.LCPI2_12, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#58:                                # %for.inc91.split.split
                                        #   in Loop: Header=BB2_52 Depth=2
	vptest	%xmm1, %xmm1
	je	.LBB2_52
# BB#59:                                # %for.end93
                                        #   in Loop: Header=BB2_51 Depth=1
	movl	$40, %edi
	movq	128(%rsp), %rsi         # 8-byte Reload
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	Crystal_Cholesky
	vmovdqa	.LCPI2_1(%rip), %xmm0
	vmovdqa	%xmm0, %xmm3
	vmovdqa	64(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm3, %xmm1, %xmm1
	vmovdqa	%xmm1, 64(%rsp)         # 16-byte Spill
	vmovdqa	.LCPI2_2(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm1, %xmm0
	vshufpd	$1, %xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,0]
	vandpd	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpxor	.LCPI2_12, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#60:                                # %for.end93.split
                                        #   in Loop: Header=BB2_51 Depth=1
	vpcmpeqq	.LCPI2_3(%rip), %xmm0, %xmm0
	vpand	%xmm3, %xmm0, %xmm1
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vandpd	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpxor	.LCPI2_12, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#61:                                # %for.end93.split.split
                                        #   in Loop: Header=BB2_51 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB2_51
# BB#62:                                # %for.end96
	leaq	160(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	callq	gettimeofday
	callq	clock
	vpbroadcastq	160(%rsp), %xmm0
	vpbroadcastq	176(%rsp), %xmm1
	vpsubq	%xmm1, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#63:                                # %for.end96.split63
	vpextrq	$1, %xmm0, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vmovq	%xmm0, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#64:                                # %for.end96.split63.split
	vpbroadcastq	168(%rsp), %xmm1
	vpbroadcastq	184(%rsp), %xmm2
	vpsubq	%xmm2, %xmm1, %xmm1
	vshufpd	$1, %xmm1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vpcmpeqq	%xmm2, %xmm1, %xmm2
	vpcmpeqd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#65:                                # %for.end96.split63.split.split
	vpextrq	$1, %xmm1, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm2
	vmovq	%xmm1, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#66:                                # %for.end96.split63.split.split.split
	vdivpd	.LCPI2_4(%rip), %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_73
# BB#67:                                # %for.end96.split
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#68:                                # %for.end96.split.split64
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 128(%rsp)        # 16-byte Spill
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	movl	$.Lstr65, %edi
	callq	puts
	movl	$.L.str1, %edi
	movb	$1, %al
	vmovaps	96(%rsp), %xmm0         # 16-byte Reload
	callq	printf
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vmovdqa	128(%rsp), %xmm1        # 16-byte Reload
	vpsubq	%xmm0, %xmm1, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#69:                                # %for.end96.split.split64.split
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
# BB#70:                                # %for.end96.split.split64.split.split
	vdivpd	.LCPI2_4(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_71
.LBB2_73:                               # %relExit
	movl	$.LrelFun, %edi
	movl	$.Lfunc2, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
	vpxor	%xmm0, %xmm0, %xmm0
.LBB2_72:                               # %for.end96.split.split
	addq	$840, %rsp              # imm = 0x348
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB2_71:                               # %for.end96.split.split
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str23, %edi
	movb	$1, %al
	callq	printf
	vmovapd	144(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	jmp	.LBB2_72
.Ltmp47:
	.size	SPEdriver, .Ltmp47-SPEdriver
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI3_1:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI3_2:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
.LCPI3_3:
	.quad	4606281698874543309     # double 9.000000e-01
	.quad	4606281698874543309     # double 9.000000e-01
.LCPI3_4:
	.quad	4517329193108106637     # double 1.000000e-06
	.quad	4517329193108106637     # double 1.000000e-06
.LCPI3_5:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI3_6:
	.quad	4608083138725491507     # double 1.200000e+00
	.quad	4608083138725491507     # double 1.200000e+00
.LCPI3_7:
	.quad	4629137466983448576     # double 3.000000e+01
	.quad	4629137466983448576     # double 3.000000e+01
.LCPI3_8:
	.quad	4576918229304087675     # double 1.000000e-02
	.quad	4576918229304087675     # double 1.000000e-02
	.text
	.globl	Crystal_div
	.align	16, 0x90
	.type	Crystal_div,@function
Crystal_div:                            # @Crystal_div
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp51:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp52:
	.cfi_def_cfa_offset 24
	subq	$968, %rsp              # imm = 0x3C8
.Ltmp53:
	.cfi_def_cfa_offset 992
.Ltmp54:
	.cfi_offset %rbx, -24
.Ltmp55:
	.cfi_offset %r14, -16
	vmovd	%edi, %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	movslq	%eax, %rdi
	vmovq	%rdi, %xmm2
	vmovq	%xmm1, %rdi
	movslq	%edi, %rbx
	vmovq	%rbx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm1, %xmm3
	vmovdqa	.LCPI3_0(%rip), %xmm1
	vpand	%xmm1, %xmm3, %xmm4
	vshufpd	$1, %xmm3, %xmm3, %xmm3 # xmm3 = xmm3[1,0]
	vandpd	%xmm1, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm4, %xmm3
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB3_51
# BB#1:                                 # %entry.split
	movslq	%eax, %rbx
	vmovq	%rbx, %xmm3
	movslq	%edi, %rbx
	vmovq	%rbx, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm2, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB3_52
# BB#2:                                 # %for.body.lr.ph
	cltq
	vmovq	%rax, %xmm2
	movslq	%edi, %rax
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm13 # xmm13 = xmm3[0],xmm2[0]
	vshufpd	$1, %xmm13, %xmm13, %xmm3 # xmm3 = xmm13[1,0]
	vpcmpeqq	%xmm3, %xmm13, %xmm4
	vpcmpeqd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB3_51
# BB#3:
	movq	1008(%rsp), %r10
	movq	1000(%rsp), %r11
	movq	992(%rsp), %r14
	vpermilpd	$0, %xmm0, %xmm12 # xmm12 = xmm0[0,0]
	vpxor	%xmm4, %xmm4, %xmm4
	movabsq	$4607182418800017408, %rdi # imm = 0x3FF0000000000000
	vmovapd	.LCPI3_1(%rip), %xmm5
	vmovapd	.LCPI3_2(%rip), %xmm6
	vmovapd	.LCPI3_3(%rip), %xmm8
	.align	16, 0x90
.LBB3_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm4, %rbx
	movq	%rdi, 320(%rsp,%rbx,8)
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rbx, %xmm0, %xmm0
	vmovq	%xmm4, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm7
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#5:                                 # %for.body.split
                                        #   in Loop: Header=BB3_4 Depth=1
	vmulpd	%xmm5, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm7
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#6:                                 # %for.body.split.split
                                        #   in Loop: Header=BB3_4 Depth=1
	vdivpd	%xmm6, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm7
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#7:                                 # %for.body.split.split.split66
                                        #   in Loop: Header=BB3_4 Depth=1
	vaddpd	%xmm8, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm7
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#8:                                 # %for.body.split.split.split
                                        #   in Loop: Header=BB3_4 Depth=1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%rsp,%rbx,8)
	vpaddq	%xmm1, %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm0 # xmm0 = xmm4[1,0]
	vpcmpeqq	%xmm0, %xmm4, %xmm0
	vpxor	%xmm3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#9:                                 # %for.body.split.split.split.split
                                        #   in Loop: Header=BB3_4 Depth=1
	vpcmpeqq	%xmm13, %xmm4, %xmm0
	vpand	%xmm1, %xmm0, %xmm2
	vshufpd	$1, %xmm0, %xmm0, %xmm7 # xmm7 = xmm0[1,0]
	vandpd	%xmm1, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm2, %xmm2
	vpxor	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#10:                                # %for.body.split.split.split.split.split
                                        #   in Loop: Header=BB3_4 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB3_4
# BB#11:
	vpxor	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI3_4(%rip), %xmm5
	vmovapd	.LCPI3_5(%rip), %xmm3
	vpcmpeqd	%xmm6, %xmm6, %xmm6
.LBB3_12:                               # %for.body8
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm4, %rdi
	vmovddup	(%rsi,%rdi,8), %xmm0
	vmovddup	320(%rsp,%rdi,8), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm7
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#13:                                # %for.body8.split
                                        #   in Loop: Header=BB3_12 Depth=1
	vaddpd	%xmm5, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm7
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#14:                                # %for.body8.split.split
                                        #   in Loop: Header=BB3_12 Depth=1
	vdivpd	%xmm0, %xmm3, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm7
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#15:                                # %for.body8.split.split.split
                                        #   in Loop: Header=BB3_12 Depth=1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, 640(%rsp,%rdi,8)
	vpaddq	%xmm1, %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm0 # xmm0 = xmm4[1,0]
	vpcmpeqq	%xmm0, %xmm4, %xmm0
	vpxor	%xmm6, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#16:                                # %for.body8.split.split.split.split
                                        #   in Loop: Header=BB3_12 Depth=1
	vpcmpeqq	%xmm13, %xmm4, %xmm0
	vpand	%xmm1, %xmm0, %xmm2
	vshufpd	$1, %xmm0, %xmm0, %xmm7 # xmm7 = xmm0[1,0]
	vandpd	%xmm1, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm2, %xmm2
	vpxor	%xmm6, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#17:                                # %for.body8.split.split.split.split.split
                                        #   in Loop: Header=BB3_12 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB3_12
# BB#18:                                # %for.body22.lr.ph.split.us
	vmulpd	.LCPI3_6(%rip), %xmm12, %xmm4
	vpermilpd	$1, %xmm4, %xmm0 # xmm0 = xmm4[1,0]
	vcmpneqpd	%xmm0, %xmm4, %xmm2
	vcmpordpd	%xmm0, %xmm4, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#19:
	vpxor	%xmm10, %xmm10, %xmm10
	vmovapd	.LCPI3_7(%rip), %xmm9
	vpcmpeqd	%xmm14, %xmm14, %xmm14
	vmovapd	.LCPI3_8(%rip), %xmm8
.LBB3_20:                               # %for.body32.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_24 Depth 2
	vpextrq	$1, %xmm10, %rsi
	vmovddup	(%rsp,%rsi,8), %xmm5
	vmulpd	%xmm9, %xmm5, %xmm6
	vpermilpd	$1, %xmm6, %xmm0 # xmm0 = xmm6[1,0]
	vcmpneqpd	%xmm0, %xmm6, %xmm2
	vcmpordpd	%xmm0, %xmm6, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#21:                                # %for.body32.lr.ph.us.split67
                                        #   in Loop: Header=BB3_20 Depth=1
	vmovddup	320(%rsp,%rsi,8), %xmm11
	vmulpd	%xmm11, %xmm6, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm6
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm6, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#22:                                # %for.body32.lr.ph.us.split67.split
                                        #   in Loop: Header=BB3_20 Depth=1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%rcx,%rsi,8)
	vmulpd	%xmm5, %xmm4, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm5
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#23:                                #   in Loop: Header=BB3_20 Depth=1
	vxorpd	%xmm5, %xmm5, %xmm5
	vunpckhpd	%xmm0, %xmm0, %xmm6 # xmm6 = xmm0[1,1]
.LBB3_24:                               # %for.body32.us
                                        #   Parent Loop BB3_20 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm5, %rax
	leaq	(%rsi,%rsi,4), %rdi
	shlq	$6, %rdi
	addq	%r14, %rdi
	vmovsd	%xmm6, (%rdi,%rax,8)
	vpaddq	%xmm1, %xmm5, %xmm5
	vshufpd	$1, %xmm5, %xmm5, %xmm0 # xmm0 = xmm5[1,0]
	vpcmpeqq	%xmm0, %xmm5, %xmm0
	vpxor	%xmm14, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#25:                                # %for.body32.us.split
                                        #   in Loop: Header=BB3_24 Depth=2
	vpcmpeqq	%xmm13, %xmm5, %xmm0
	vpand	%xmm1, %xmm0, %xmm2
	vshufpd	$1, %xmm0, %xmm0, %xmm7 # xmm7 = xmm0[1,0]
	vandpd	%xmm1, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm2, %xmm2
	vpxor	%xmm14, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#26:                                # %for.body32.us.split.split
                                        #   in Loop: Header=BB3_24 Depth=2
	vptest	%xmm0, %xmm0
	je	.LBB3_24
# BB#27:                                # %for.end40.us
                                        #   in Loop: Header=BB3_20 Depth=1
	vmovddup	(%rcx,%rsi,8), %xmm0
	vmulpd	%xmm8, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm5
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#28:                                # %for.end40.us.split
                                        #   in Loop: Header=BB3_20 Depth=1
	vmulpd	%xmm0, %xmm11, %xmm5
	vpermilpd	$1, %xmm5, %xmm0 # xmm0 = xmm5[1,0]
	vcmpneqpd	%xmm0, %xmm5, %xmm2
	vcmpordpd	%xmm0, %xmm5, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#29:                                # %for.end40.us.split.split
                                        #   in Loop: Header=BB3_20 Depth=1
	vmovddup	640(%rsp,%rsi,8), %xmm0
	vmulpd	%xmm5, %xmm0, %xmm5
	vpermilpd	$1, %xmm5, %xmm0 # xmm0 = xmm5[1,0]
	vcmpneqpd	%xmm0, %xmm5, %xmm2
	vcmpordpd	%xmm0, %xmm5, %xmm0
	vandpd	%xmm2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#30:                                # %for.end40.us.split.split.split
                                        #   in Loop: Header=BB3_20 Depth=1
	vmovddup	(%rdi,%rsi,8), %xmm0
	vaddpd	%xmm5, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm5
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#31:                                # %for.end40.us.split.split.split.split
                                        #   in Loop: Header=BB3_20 Depth=1
	leaq	(%rdi,%rsi,8), %rax
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%rax)
	vpaddq	%xmm1, %xmm10, %xmm10
	vshufpd	$1, %xmm10, %xmm10, %xmm0 # xmm0 = xmm10[1,0]
	vpcmpeqq	%xmm0, %xmm10, %xmm0
	vpxor	%xmm14, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#32:                                # %for.end40.us.split.split.split.split.split
                                        #   in Loop: Header=BB3_20 Depth=1
	vpcmpeqq	%xmm13, %xmm10, %xmm0
	vpand	%xmm1, %xmm0, %xmm2
	vshufpd	$1, %xmm0, %xmm0, %xmm5 # xmm5 = xmm0[1,0]
	vandpd	%xmm1, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm2, %xmm2
	vpxor	%xmm14, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#33:                                # %for.end40.us.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_20 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB3_20
# BB#34:
	vxorpd	%xmm4, %xmm4, %xmm4
	vpcmpeqd	%xmm5, %xmm5, %xmm5
.LBB3_35:                               # %for.body57
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm4, %rsi
	leaq	(%rsi,%rsi,4), %rax
	shlq	$6, %rax
	addq	%r14, %rax
	vmovddup	(%rax,%rsi,8), %xmm0
	vdivpd	%xmm0, %xmm3, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm6
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm6, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#36:                                # %for.body57.split
                                        #   in Loop: Header=BB3_35 Depth=1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, 640(%rsp,%rsi,8)
	vpaddq	%xmm1, %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm0 # xmm0 = xmm4[1,0]
	vpcmpeqq	%xmm0, %xmm4, %xmm0
	vpxor	%xmm5, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#37:                                # %for.body57.split.split
                                        #   in Loop: Header=BB3_35 Depth=1
	vpcmpeqq	%xmm13, %xmm4, %xmm0
	vpand	%xmm1, %xmm0, %xmm2
	vshufpd	$1, %xmm0, %xmm0, %xmm6 # xmm6 = xmm0[1,0]
	vandpd	%xmm1, %xmm6, %xmm6
	vpcmpeqq	%xmm6, %xmm2, %xmm2
	vpxor	%xmm5, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#38:                                # %for.body57.split.split.split
                                        #   in Loop: Header=BB3_35 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB3_35
# BB#39:
	vxorpd	%xmm3, %xmm3, %xmm3
	vpcmpeqd	%xmm4, %xmm4, %xmm4
.LBB3_45:                               # %for.body76.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_46 Depth 2
	vpextrq	$1, %xmm3, %rsi
	vmovddup	(%rcx,%rsi,8), %xmm6
	vmovddup	640(%rsp,%rsi,8), %xmm5
	vpxor	%xmm7, %xmm7, %xmm7
.LBB3_46:                               # %for.body76.us
                                        #   Parent Loop BB3_45 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm7, %rdi
	movq	%rsi, %rax
	shlq	$6, %rax
	leaq	(%rax,%rax,4), %rax
	leaq	(%r11,%rax), %rbx
	vmovddup	(%rbx,%rdi,8), %xmm0
	vmulpd	%xmm12, %xmm0, %xmm8
	addq	%r14, %rax
	vmovddup	(%rax,%rdi,8), %xmm0
	vsubpd	%xmm8, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm9
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm9, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#47:                                # %for.body76.us.split
                                        #   in Loop: Header=BB3_46 Depth=2
	vmulpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm9
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm9, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#48:                                # %for.body76.us.split.split
                                        #   in Loop: Header=BB3_46 Depth=2
	vmovddup	(%rdx,%rdi,8), %xmm9
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	leaq	(%rsi,%rsi,4), %rax
	shlq	$6, %rax
	addq	%r10, %rax
	vmovsd	%xmm0, (%rax,%rdi,8)
	vpaddq	%xmm1, %xmm7, %xmm7
	vshufpd	$1, %xmm7, %xmm7, %xmm0 # xmm0 = xmm7[1,0]
	vpcmpeqq	%xmm0, %xmm7, %xmm0
	vpxor	%xmm4, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#49:                                # %for.body76.us.split.split.split
                                        #   in Loop: Header=BB3_46 Depth=2
	vpcmpeqq	%xmm13, %xmm7, %xmm10
	vpand	%xmm1, %xmm10, %xmm0
	vshufpd	$1, %xmm10, %xmm10, %xmm2 # xmm2 = xmm10[1,0]
	vandpd	%xmm1, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm0, %xmm0
	vpxor	%xmm4, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#50:                                # %for.body76.us.split.split.split.split
                                        #   in Loop: Header=BB3_46 Depth=2
	vmulpd	%xmm9, %xmm8, %xmm0
	vaddpd	%xmm0, %xmm6, %xmm6
	vptest	%xmm10, %xmm10
	je	.LBB3_46
# BB#40:                                # %for.end93.us
                                        #   in Loop: Header=BB3_45 Depth=1
	vmovddup	(%r8,%rsi,8), %xmm0
	vsubpd	%xmm0, %xmm6, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm6
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm6, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#41:                                # %for.end93.us.split68
                                        #   in Loop: Header=BB3_45 Depth=1
	vmulpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm5
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm5, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#42:                                # %for.end93.us.split
                                        #   in Loop: Header=BB3_45 Depth=1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%r9,%rsi,8)
	vpaddq	%xmm1, %xmm3, %xmm3
	vshufpd	$1, %xmm3, %xmm3, %xmm0 # xmm0 = xmm3[1,0]
	vpcmpeqq	%xmm0, %xmm3, %xmm0
	vpxor	%xmm4, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB3_51
# BB#43:                                # %for.end93.us.split.split69
                                        #   in Loop: Header=BB3_45 Depth=1
	vpcmpeqq	%xmm13, %xmm3, %xmm0
	vpand	%xmm1, %xmm0, %xmm2
	vshufpd	$1, %xmm0, %xmm0, %xmm5 # xmm5 = xmm0[1,0]
	vandpd	%xmm1, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm2, %xmm2
	vpxor	%xmm4, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_51
# BB#44:                                # %for.end93.us.split.split
                                        #   in Loop: Header=BB3_45 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB3_45
	jmp	.LBB3_52
.LBB3_51:                               # %relExit
	movl	$.LrelFun, %edi
	movl	$.Lfunc3, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
.LBB3_52:                               # %for.end104
	addq	$968, %rsp              # imm = 0x3C8
	popq	%rbx
	popq	%r14
	ret
.Ltmp56:
	.size	Crystal_div, .Ltmp56-Crystal_div
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI4_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI4_1:
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
.LCPI4_2:
	.quad	4606281698874543309     # double 9.000000e-01
	.quad	4606281698874543309     # double 9.000000e-01
.LCPI4_3:
	.quad	4630826316843712512     # double 4.000000e+01
	.quad	4630826316843712512     # double 4.000000e+01
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
.Ltmp60:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp61:
	.cfi_def_cfa_offset 24
	subq	$712, %rsp              # imm = 0x2C8
.Ltmp62:
	.cfi_def_cfa_offset 736
.Ltmp63:
	.cfi_offset %rbx, -24
.Ltmp64:
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
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
	vmovdqa	.LCPI4_0(%rip), %xmm3
	vpand	%xmm3, %xmm1, %xmm2
	vshufpd	$1, %xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,0]
	vandpd	%xmm3, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm2, %xmm1
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#1:                                 # %entry.split
	movslq	%eax, %rdx
	vmovq	%rdx, %xmm1
	movslq	%ecx, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB4_20
# BB#2:                                 # %for.body.lr.ph
	cltq
	vmovq	%rax, %xmm0
	movslq	%ecx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vshufpd	$1, %xmm2, %xmm2, %xmm0 # xmm0 = xmm2[1,0]
	vpcmpeqq	%xmm0, %xmm2, %xmm1
	vpcmpeqd	%xmm0, %xmm0, %xmm0
	vpxor	%xmm0, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#3:
	vmovdqa	%xmm3, %xmm4
	vpxor	%xmm1, %xmm1, %xmm1
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	vmovapd	.LCPI4_1(%rip), %xmm3
	vmovapd	.LCPI4_2(%rip), %xmm9
	vmovapd	.LCPI4_3(%rip), %xmm8
	.align	16, 0x90
.LBB4_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm1, %rcx
	movq	%rax, 64(%rsp,%rcx,8)
	vcvtsi2sdq	%rcx, %xmm0, %xmm5
	vmovq	%xmm1, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm6
	vunpcklpd	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vpermilpd	$1, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vcmpneqpd	%xmm6, %xmm5, %xmm7
	vcmpordpd	%xmm6, %xmm5, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB4_22
# BB#5:                                 # %for.body.split22
                                        #   in Loop: Header=BB4_4 Depth=1
	vmulpd	%xmm3, %xmm5, %xmm5
	vpermilpd	$1, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vcmpneqpd	%xmm6, %xmm5, %xmm7
	vcmpordpd	%xmm6, %xmm5, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB4_22
# BB#6:                                 # %for.body.split21
                                        #   in Loop: Header=BB4_4 Depth=1
	vmulpd	%xmm9, %xmm5, %xmm5
	vpermilpd	$1, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vcmpneqpd	%xmm6, %xmm5, %xmm7
	vcmpordpd	%xmm6, %xmm5, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB4_22
# BB#7:                                 # %for.body.split20
                                        #   in Loop: Header=BB4_4 Depth=1
	vdivpd	%xmm8, %xmm5, %xmm5
	vpermilpd	$1, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vcmpneqpd	%xmm6, %xmm5, %xmm7
	vcmpordpd	%xmm6, %xmm5, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB4_22
# BB#8:                                 # %for.body.split20.split
                                        #   in Loop: Header=BB4_4 Depth=1
	vunpckhpd	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[1,1]
	vmovsd	%xmm5, 384(%rsp,%rcx,8)
	vpaddq	%xmm4, %xmm1, %xmm1
	vshufpd	$1, %xmm1, %xmm1, %xmm5 # xmm5 = xmm1[1,0]
	vpcmpeqq	%xmm5, %xmm1, %xmm5
	vpxor	%xmm0, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB4_22
# BB#9:                                 # %for.body.split
                                        #   in Loop: Header=BB4_4 Depth=1
	vpcmpeqq	%xmm2, %xmm1, %xmm5
	vpand	%xmm4, %xmm5, %xmm6
	vshufpd	$1, %xmm5, %xmm5, %xmm7 # xmm7 = xmm5[1,0]
	vandpd	%xmm4, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm6, %xmm6
	vpxor	%xmm0, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB4_22
# BB#10:                                # %for.body.split.split
                                        #   in Loop: Header=BB4_4 Depth=1
	vptest	%xmm5, %xmm5
	je	.LBB4_4
# BB#11:
	vmovapd	%xmm2, %xmm0
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	vpxor	%xmm5, %xmm5, %xmm5
.LBB4_12:                               # %for.body9
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm5, %r14
	vmovddup	(%rbx,%r14,8), %xmm0
	vmovddup	64(%rsp,%r14,8), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#13:                                # %for.body9.split23
                                        #   in Loop: Header=BB4_12 Depth=1
	vaddpd	.LCPI4_4(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#14:                                # %for.body9.split
                                        #   in Loop: Header=BB4_12 Depth=1
	vmulpd	.LCPI4_5(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vcmpneqpd	%xmm2, %xmm0, %xmm1
	vcmpordpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#15:                                # %for.body9.split.split19
                                        #   in Loop: Header=BB4_12 Depth=1
	vmovsd	.LCPI4_6(%rip), %xmm1
	vmovdqa	%xmm5, 48(%rsp)         # 16-byte Spill
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	callq	pow
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vmovapd	16(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	.LCPI4_6(%rip), %xmm1
	callq	pow
	vpcmpeqd	%xmm6, %xmm6, %xmm6
	vmovdqa	48(%rsp), %xmm5         # 16-byte Reload
	vmovdqa	(%rsp), %xmm4           # 16-byte Reload
	vmovdqa	.LCPI4_0(%rip), %xmm3
	vmovapd	32(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#16:                                # %for.body9.split.split
                                        #   in Loop: Header=BB4_12 Depth=1
	vmulpd	.LCPI4_7(%rip), %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vcmpneqpd	%xmm1, %xmm0, %xmm2
	vcmpordpd	%xmm1, %xmm0, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#17:                                # %for.body9.split.split.split24
                                        #   in Loop: Header=BB4_12 Depth=1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, 384(%rsp,%r14,8)
	vpaddq	%xmm3, %xmm5, %xmm5
	vshufpd	$1, %xmm5, %xmm5, %xmm0 # xmm0 = xmm5[1,0]
	vpcmpeqq	%xmm0, %xmm5, %xmm0
	vpxor	%xmm6, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB4_22
# BB#18:                                # %for.body9.split.split.split24.split
                                        #   in Loop: Header=BB4_12 Depth=1
	vpcmpeqq	%xmm4, %xmm5, %xmm0
	vpand	%xmm3, %xmm0, %xmm1
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vandpd	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpxor	%xmm6, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB4_22
# BB#19:                                # %for.body9.split.split.split
                                        #   in Loop: Header=BB4_12 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB4_12
.LBB4_20:                               # %for.end19
	vmovsd	408(%rsp), %xmm0
	jmp	.LBB4_21
.LBB4_22:                               # %relExit
	movl	$.LrelFun, %edi
	movl	$.Lfunc4, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
	vpxor	%xmm0, %xmm0, %xmm0
.LBB4_21:                               # %for.end19
	addq	$712, %rsp              # imm = 0x2C8
	popq	%rbx
	popq	%r14
	ret
.Ltmp65:
	.size	Crystal_pow, .Ltmp65-Crystal_pow
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI5_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI5_2:
	.quad	4294967294              # 0xfffffffe
	.quad	4294967294              # 0xfffffffe
	.text
	.globl	Crystal_Cholesky
	.align	16, 0x90
	.type	Crystal_Cholesky,@function
Crystal_Cholesky:                       # @Crystal_Cholesky
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp67:
	.cfi_def_cfa_offset 16
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vpextrq	$1, %xmm1, %r8
	movslq	%r8d, %rdi
	vmovq	%rdi, %xmm0
	vmovq	%xmm1, %rdi
	movslq	%edi, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vpcmpeqq	%xmm2, %xmm0, %xmm2
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	vpxor	%xmm4, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB5_73
# BB#1:                                 # %entry.split
	movslq	%r8d, %rax
	vmovq	%rax, %xmm2
	movslq	%edi, %rax
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm2[0]
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm3, %xmm5
	vmovdqa	.LCPI5_0(%rip), %xmm3
	vpand	%xmm3, %xmm5, %xmm6
	vshufpd	$1, %xmm5, %xmm5, %xmm5 # xmm5 = xmm5[1,0]
	vandpd	%xmm3, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm6, %xmm5
	vpxor	%xmm4, %xmm5, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#2:                                 # %entry.split.split
	movslq	%r8d, %rax
	vmovq	%rax, %xmm4
	movslq	%edi, %rax
	vmovq	%rax, %xmm5
	vpunpcklqdq	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vpcmpgtq	%xmm2, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB5_36
# BB#3:
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	.align	16, 0x90
.LBB5_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovsd	(%rdx,%rax,8), %xmm5
	vmovsd	%xmm5, (%rcx,%rax,8)
	vpaddq	%xmm3, %xmm2, %xmm2
	vshufpd	$1, %xmm2, %xmm2, %xmm5 # xmm5 = xmm2[1,0]
	vpcmpeqq	%xmm5, %xmm2, %xmm5
	vpxor	%xmm4, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB5_73
# BB#5:                                 # %for.body.split
                                        #   in Loop: Header=BB5_4 Depth=1
	vpcmpeqq	%xmm0, %xmm2, %xmm5
	vpand	%xmm3, %xmm5, %xmm6
	vshufpd	$1, %xmm5, %xmm5, %xmm7 # xmm7 = xmm5[1,0]
	vandpd	%xmm3, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm6, %xmm6
	vpxor	%xmm4, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#6:                                 # %for.body.split.split
                                        #   in Loop: Header=BB5_4 Depth=1
	vptest	%xmm5, %xmm5
	je	.LBB5_4
# BB#7:                                 # %for.cond3.preheader
	movslq	%r8d, %rax
	vmovq	%rax, %xmm2
	movslq	%edi, %rax
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm2, %xmm4, %xmm2 # xmm2 = xmm4[0],xmm2[0]
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vpand	%xmm3, %xmm2, %xmm4
	vshufpd	$1, %xmm2, %xmm2, %xmm2 # xmm2 = xmm2[1,0]
	vandpd	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm4, %xmm2
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	vpxor	%xmm4, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB5_73
# BB#8:                                 # %for.cond3.preheader.split
	movslq	%r8d, %rax
	vmovq	%rax, %xmm2
	movslq	%edi, %rax
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm2, %xmm4, %xmm2 # xmm2 = xmm4[0],xmm2[0]
	vpcmpgtq	.LCPI5_0(%rip), %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB5_36
# BB#9:                                 # %for.body7.lr.ph
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vmovdqa	%xmm3, %xmm4
.LBB5_10:                               # %for.body7
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm4, %rax
	leaq	(%rax,%rax,4), %rax
	shlq	$6, %rax
	vmovddup	(%rsi,%rax), %xmm5
	vmovddup	(%rsi), %xmm6
	vdivpd	%xmm6, %xmm5, %xmm5
	vpermilpd	$1, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vcmpneqpd	%xmm6, %xmm5, %xmm7
	vcmpordpd	%xmm6, %xmm5, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#11:                                # %for.body7.split
                                        #   in Loop: Header=BB5_10 Depth=1
	vunpckhpd	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[1,1]
	addq	%rsi, %rax
	vmovsd	%xmm5, (%rax)
	vpaddq	%xmm3, %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm5 # xmm5 = xmm4[1,0]
	vpcmpeqq	%xmm5, %xmm4, %xmm5
	vpxor	%xmm2, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB5_73
# BB#12:                                # %for.body7.split.split
                                        #   in Loop: Header=BB5_10 Depth=1
	vpcmpeqq	%xmm0, %xmm4, %xmm5
	vpand	%xmm3, %xmm5, %xmm6
	vshufpd	$1, %xmm5, %xmm5, %xmm7 # xmm7 = xmm5[1,0]
	vandpd	%xmm3, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm6, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#13:                                # %for.body7.split.split.split
                                        #   in Loop: Header=BB5_10 Depth=1
	vptest	%xmm5, %xmm5
	je	.LBB5_10
# BB#14:
	vmovdqa	.LCPI5_0(%rip), %xmm2
	vpcmpeqd	%xmm11, %xmm11, %xmm11
.LBB5_15:                               # %for.body25.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_16 Depth 2
                                        #     Child Loop BB5_62 Depth 2
                                        #       Child Loop BB5_63 Depth 3
                                        #       Child Loop BB5_70 Depth 3
	vmovdqa	%xmm3, %xmm12
	vpextrq	$1, %xmm12, %rax
	vxorpd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm6, %xmm6, %xmm6
.LBB5_16:                               # %for.body25
                                        #   Parent Loop BB5_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm6, %rdi
	leaq	(%rax,%rax,4), %rdx
	shlq	$6, %rdx
	addq	%rsi, %rdx
	vmovddup	(%rdx,%rdi,8), %xmm7
	leaq	(%rdi,%rdi,4), %rdi
	shlq	$6, %rdi
	addq	%rsi, %rdi
	vmovddup	(%rdi,%rax,8), %xmm4
	vmulpd	%xmm4, %xmm7, %xmm7
	vpermilpd	$1, %xmm7, %xmm4 # xmm4 = xmm7[1,0]
	vcmpneqpd	%xmm4, %xmm7, %xmm5
	vcmpordpd	%xmm4, %xmm7, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#17:                                # %for.body25.split
                                        #   in Loop: Header=BB5_16 Depth=2
	vaddpd	%xmm7, %xmm3, %xmm3
	vpermilpd	$1, %xmm3, %xmm4 # xmm4 = xmm3[1,0]
	vcmpneqpd	%xmm4, %xmm3, %xmm5
	vcmpordpd	%xmm4, %xmm3, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#18:                                # %for.body25.split.split
                                        #   in Loop: Header=BB5_16 Depth=2
	vpaddq	%xmm2, %xmm6, %xmm6
	vshufpd	$1, %xmm6, %xmm6, %xmm4 # xmm4 = xmm6[1,0]
	vpcmpeqq	%xmm4, %xmm6, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#19:                                # %for.body25.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=2
	vpcmpeqq	%xmm12, %xmm6, %xmm7
	vpand	%xmm2, %xmm7, %xmm4
	vshufpd	$1, %xmm7, %xmm7, %xmm5 # xmm5 = xmm7[1,0]
	vandpd	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#20:                                # %for.body25.split.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=2
	vptest	%xmm7, %xmm7
	je	.LBB5_16
# BB#21:                                # %for.end32
                                        #   in Loop: Header=BB5_15 Depth=1
	vmovddup	(%rdx,%rax,8), %xmm4
	vsubpd	%xmm3, %xmm4, %xmm3
	vpermilpd	$1, %xmm3, %xmm4 # xmm4 = xmm3[1,0]
	vcmpneqpd	%xmm4, %xmm3, %xmm5
	vcmpordpd	%xmm4, %xmm3, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#22:                                # %for.end32.split
                                        #   in Loop: Header=BB5_15 Depth=1
	leaq	(%rdx,%rax,8), %r11
	vunpckhpd	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[1,1]
	vmovsd	%xmm3, (%r11)
	vpaddq	%xmm2, %xmm12, %xmm3
	vpcmpgtq	%xmm3, %xmm0, %xmm6
	vpand	%xmm2, %xmm6, %xmm4
	vshufpd	$1, %xmm6, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vandpd	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#23:                                # %for.end32.split.split
                                        #   in Loop: Header=BB5_15 Depth=1
	vptest	%xmm6, %xmm6
	vmovdqa	%xmm3, %xmm8
	je	.LBB5_24
.LBB5_62:                               # %for.body46.lr.ph.us
                                        #   Parent Loop BB5_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_63 Depth 3
                                        #       Child Loop BB5_70 Depth 3
	vpextrq	$1, %xmm8, %r8
	vxorpd	%xmm7, %xmm7, %xmm7
	vpxor	%xmm10, %xmm10, %xmm10
.LBB5_63:                               # %for.body46.us
                                        #   Parent Loop BB5_15 Depth=1
                                        #     Parent Loop BB5_62 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm10, %rdi
	vmovddup	(%rdx,%rdi,8), %xmm4
	leaq	(%rdi,%rdi,4), %rdi
	shlq	$6, %rdi
	addq	%rsi, %rdi
	vmovddup	(%rdi,%r8,8), %xmm5
	vmulpd	%xmm5, %xmm4, %xmm6
	vpermilpd	$1, %xmm6, %xmm4 # xmm4 = xmm6[1,0]
	vcmpneqpd	%xmm4, %xmm6, %xmm5
	vcmpordpd	%xmm4, %xmm6, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#64:                                # %for.body46.us.split
                                        #   in Loop: Header=BB5_63 Depth=3
	vaddpd	%xmm6, %xmm7, %xmm7
	vpermilpd	$1, %xmm7, %xmm4 # xmm4 = xmm7[1,0]
	vcmpneqpd	%xmm4, %xmm7, %xmm5
	vcmpordpd	%xmm4, %xmm7, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#65:                                # %for.body46.us.split.split
                                        #   in Loop: Header=BB5_63 Depth=3
	vpaddq	%xmm2, %xmm10, %xmm10
	vshufpd	$1, %xmm10, %xmm10, %xmm4 # xmm4 = xmm10[1,0]
	vpcmpeqq	%xmm4, %xmm10, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#66:                                # %for.body46.us.split.split.split
                                        #   in Loop: Header=BB5_63 Depth=3
	vpcmpeqq	%xmm12, %xmm10, %xmm9
	vpand	%xmm2, %xmm9, %xmm4
	vshufpd	$1, %xmm9, %xmm9, %xmm5 # xmm5 = xmm9[1,0]
	vandpd	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#67:                                # %for.body46.us.split.split.split.split
                                        #   in Loop: Header=BB5_63 Depth=3
	vptest	%xmm9, %xmm9
	je	.LBB5_63
# BB#68:                                # %for.body64.lr.ph.us
                                        #   in Loop: Header=BB5_62 Depth=2
	vmovddup	(%rdx,%r8,8), %xmm4
	vsubpd	%xmm7, %xmm4, %xmm6
	vpermilpd	$1, %xmm6, %xmm4 # xmm4 = xmm6[1,0]
	vcmpneqpd	%xmm4, %xmm6, %xmm5
	vcmpordpd	%xmm4, %xmm6, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#69:                                # %for.body64.lr.ph.us.split
                                        #   in Loop: Header=BB5_62 Depth=2
	leaq	(%rdx,%r8,8), %rdi
	vunpckhpd	%xmm6, %xmm6, %xmm4 # xmm4 = xmm6[1,1]
	vmovsd	%xmm4, (%rdi)
	vxorpd	%xmm6, %xmm6, %xmm6
	vpxor	%xmm9, %xmm9, %xmm9
.LBB5_70:                               # %for.body64.us
                                        #   Parent Loop BB5_15 Depth=1
                                        #     Parent Loop BB5_62 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpaddq	%xmm2, %xmm9, %xmm7
	vshufpd	$1, %xmm7, %xmm7, %xmm4 # xmm4 = xmm7[1,0]
	vpcmpeqq	%xmm4, %xmm7, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#71:                                # %for.body64.us.split
                                        #   in Loop: Header=BB5_70 Depth=3
	vpcmpeqq	%xmm12, %xmm7, %xmm10
	vpand	%xmm2, %xmm10, %xmm4
	vshufpd	$1, %xmm10, %xmm10, %xmm5 # xmm5 = xmm10[1,0]
	vandpd	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#72:                                # %for.body64.us.split.split
                                        #   in Loop: Header=BB5_70 Depth=3
	vpextrq	$1, %xmm9, %r10
	leaq	(%r8,%r8,4), %r9
	shlq	$6, %r9
	addq	%rsi, %r9
	vmovddup	(%r9,%r10,8), %xmm4
	leaq	(%r10,%r10,4), %rdi
	shlq	$6, %rdi
	addq	%rsi, %rdi
	vmovddup	(%rdi,%rax,8), %xmm5
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm6, %xmm6
	vptest	%xmm10, %xmm10
	vmovapd	%xmm7, %xmm9
	je	.LBB5_70
# BB#57:                                # %for.end73.us
                                        #   in Loop: Header=BB5_62 Depth=2
	vmovddup	(%r9,%rax,8), %xmm4
	vsubpd	%xmm6, %xmm4, %xmm6
	vpermilpd	$1, %xmm6, %xmm4 # xmm4 = xmm6[1,0]
	vcmpneqpd	%xmm4, %xmm6, %xmm5
	vcmpordpd	%xmm4, %xmm6, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#58:                                # %for.end73.us.split68
                                        #   in Loop: Header=BB5_62 Depth=2
	vmovddup	(%r11), %xmm4
	vdivpd	%xmm4, %xmm6, %xmm6
	vpermilpd	$1, %xmm6, %xmm4 # xmm4 = xmm6[1,0]
	vcmpneqpd	%xmm4, %xmm6, %xmm5
	vcmpordpd	%xmm4, %xmm6, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#59:                                # %for.end73.us.split
                                        #   in Loop: Header=BB5_62 Depth=2
	leaq	(%r9,%rax,8), %r8
	vunpckhpd	%xmm6, %xmm6, %xmm4 # xmm4 = xmm6[1,1]
	vmovsd	%xmm4, (%r8)
	vpaddq	%xmm2, %xmm8, %xmm8
	vshufpd	$1, %xmm8, %xmm8, %xmm4 # xmm4 = xmm8[1,0]
	vpcmpeqq	%xmm4, %xmm8, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#60:                                # %for.end73.us.split.split69
                                        #   in Loop: Header=BB5_62 Depth=2
	vpcmpeqq	%xmm0, %xmm8, %xmm6
	vpand	%xmm2, %xmm6, %xmm4
	vshufpd	$1, %xmm6, %xmm6, %xmm5 # xmm5 = xmm6[1,0]
	vandpd	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm4, %xmm4
	vpxor	%xmm11, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#61:                                # %for.end73.us.split.split
                                        #   in Loop: Header=BB5_62 Depth=2
	vptest	%xmm6, %xmm6
	je	.LBB5_62
.LBB5_24:                               # %for.cond17.loopexit
                                        #   in Loop: Header=BB5_15 Depth=1
	vpcmpeqq	%xmm0, %xmm3, %xmm5
	vpand	%xmm2, %xmm5, %xmm6
	vshufpd	$1, %xmm5, %xmm5, %xmm7 # xmm7 = xmm5[1,0]
	vandpd	%xmm2, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm6, %xmm6
	vpxor	%xmm11, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#25:                                # %for.cond17.loopexit.split
                                        #   in Loop: Header=BB5_15 Depth=1
	vptest	%xmm5, %xmm5
	je	.LBB5_15
# BB#26:
	vmovdqa	.LCPI5_0(%rip), %xmm8
	vpcmpeqd	%xmm4, %xmm4, %xmm4
.LBB5_27:                               # %for.body96.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_28 Depth 2
	vpextrq	$1, %xmm2, %rax
	vmovddup	(%rcx,%rax,8), %xmm5
	vpxor	%xmm6, %xmm6, %xmm6
.LBB5_28:                               # %for.body96
                                        #   Parent Loop BB5_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm6, %rdx
	leaq	(%rax,%rax,4), %rdi
	shlq	$6, %rdi
	addq	%rsi, %rdi
	vmovddup	(%rdi,%rdx,8), %xmm7
	vmovddup	(%rcx,%rdx,8), %xmm3
	vmulpd	%xmm3, %xmm7, %xmm7
	vpermilpd	$1, %xmm7, %xmm3 # xmm3 = xmm7[1,0]
	vcmpneqpd	%xmm3, %xmm7, %xmm9
	vcmpordpd	%xmm3, %xmm7, %xmm3
	vandpd	%xmm9, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#29:                                # %for.body96.split
                                        #   in Loop: Header=BB5_28 Depth=2
	vsubpd	%xmm7, %xmm5, %xmm5
	vpermilpd	$1, %xmm5, %xmm3 # xmm3 = xmm5[1,0]
	vcmpneqpd	%xmm3, %xmm5, %xmm7
	vcmpordpd	%xmm3, %xmm5, %xmm3
	vandpd	%xmm7, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#30:                                # %for.body96.split.split
                                        #   in Loop: Header=BB5_28 Depth=2
	vunpckhpd	%xmm5, %xmm5, %xmm3 # xmm3 = xmm5[1,1]
	vmovsd	%xmm3, (%rcx,%rax,8)
	vpaddq	%xmm8, %xmm6, %xmm6
	vshufpd	$1, %xmm6, %xmm6, %xmm3 # xmm3 = xmm6[1,0]
	vpcmpeqq	%xmm3, %xmm6, %xmm3
	vpxor	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#31:                                # %for.body96.split.split.split
                                        #   in Loop: Header=BB5_28 Depth=2
	vpcmpeqq	%xmm2, %xmm6, %xmm7
	vpand	%xmm8, %xmm7, %xmm9
	vshufpd	$1, %xmm7, %xmm7, %xmm3 # xmm3 = xmm7[1,0]
	vandpd	%xmm8, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm9, %xmm3
	vpxor	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#32:                                # %for.body96.split.split.split.split
                                        #   in Loop: Header=BB5_28 Depth=2
	vptest	%xmm7, %xmm7
	je	.LBB5_28
# BB#33:                                # %for.inc107
                                        #   in Loop: Header=BB5_27 Depth=1
	vpaddq	%xmm8, %xmm2, %xmm2
	vshufpd	$1, %xmm2, %xmm2, %xmm3 # xmm3 = xmm2[1,0]
	vpcmpeqq	%xmm3, %xmm2, %xmm3
	vpxor	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#34:                                # %for.inc107.split
                                        #   in Loop: Header=BB5_27 Depth=1
	vpcmpeqq	%xmm0, %xmm2, %xmm5
	vpand	%xmm8, %xmm5, %xmm3
	vshufpd	$1, %xmm5, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vandpd	%xmm8, %xmm6, %xmm6
	vpcmpeqq	%xmm6, %xmm3, %xmm3
	vpxor	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#35:                                # %for.inc107.split.split
                                        #   in Loop: Header=BB5_27 Depth=1
	vptest	%xmm5, %xmm5
	je	.LBB5_27
.LBB5_36:                               # %for.end109
	vmovdqa	.LCPI5_1(%rip), %xmm2
	vpaddq	%xmm2, %xmm1, %xmm4
	vpand	%xmm2, %xmm4, %xmm3
	vshufpd	$1, %xmm4, %xmm4, %xmm5 # xmm5 = xmm4[1,0]
	vandpd	%xmm2, %xmm5, %xmm5
	vpcmpeqq	%xmm5, %xmm3, %xmm5
	vpcmpeqd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm3, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB5_73
# BB#37:                                # %for.end109.split
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm5
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm5, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm5[0]
	vshufpd	$1, %xmm4, %xmm4, %xmm5 # xmm5 = xmm4[1,0]
	vpcmpeqq	%xmm5, %xmm4, %xmm5
	vpxor	%xmm3, %xmm5, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#38:                                # %for.end109.split.split
	vpextrq	$1, %xmm4, %rax
	vmovddup	(%rcx,%rax,8), %xmm3
	leaq	(%rax,%rax,4), %rdx
	shlq	$6, %rdx
	addq	%rsi, %rdx
	vmovddup	(%rdx,%rax,8), %xmm4
	vdivpd	%xmm4, %xmm3, %xmm3
	vpermilpd	$1, %xmm3, %xmm4 # xmm4 = xmm3[1,0]
	vcmpneqpd	%xmm4, %xmm3, %xmm5
	vcmpordpd	%xmm4, %xmm3, %xmm4
	vandpd	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB5_73
# BB#39:                                # %for.end109.split.split.split
	vunpckhpd	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[1,1]
	vmovsd	%xmm3, (%rcx,%rax,8)
	vpaddq	.LCPI5_2(%rip), %xmm1, %xmm1
	vpand	%xmm2, %xmm1, %xmm3
	vshufpd	$1, %xmm1, %xmm1, %xmm4 # xmm4 = xmm1[1,0]
	vandpd	%xmm2, %xmm4, %xmm2
	vpcmpeqq	%xmm2, %xmm3, %xmm3
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm2, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB5_73
# BB#40:                                # %for.end109.split.split.split.split
	vpextrq	$1, %xmm1, %rax
	movslq	%eax, %rdx
	vmovq	%rdx, %xmm3
	vmovq	%xmm1, %rdx
	movslq	%edx, %rdi
	vmovq	%rdi, %xmm1
	vpunpcklqdq	%xmm3, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm3[0]
	vpcmpgtq	%xmm2, %xmm1, %xmm3
	vmovdqa	.LCPI5_0(%rip), %xmm1
	vpand	%xmm1, %xmm3, %xmm4
	vshufpd	$1, %xmm3, %xmm3, %xmm3 # xmm3 = xmm3[1,0]
	vandpd	%xmm1, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm4, %xmm3
	vpxor	%xmm2, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB5_73
# BB#41:                                # %for.end109.split.split.split.split.split
	movslq	%eax, %rdi
	vmovq	%rdi, %xmm2
	movslq	%edx, %rdi
	vmovq	%rdi, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm2[0]
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB5_56
# BB#42:                                # %for.cond129.preheader.lr.ph
	cltq
	vmovq	%rax, %xmm3
	movslq	%edx, %rax
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm3[0]
	vshufpd	$1, %xmm4, %xmm4, %xmm3 # xmm3 = xmm4[1,0]
	vpcmpeqq	%xmm3, %xmm4, %xmm3
	vpxor	%xmm2, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB5_73
# BB#43:
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
.LBB5_44:                               # %for.cond129.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_47 Depth 2
	vpaddq	%xmm1, %xmm4, %xmm5
	vshufpd	$1, %xmm5, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vpcmpeqq	%xmm6, %xmm5, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#45:                                # %for.cond129.preheader.split
                                        #   in Loop: Header=BB5_44 Depth=1
	vpcmpgtq	%xmm5, %xmm0, %xmm7
	vpand	%xmm1, %xmm7, %xmm8
	vshufpd	$1, %xmm7, %xmm7, %xmm6 # xmm6 = xmm7[1,0]
	vandpd	%xmm1, %xmm6, %xmm6
	vpcmpeqq	%xmm6, %xmm8, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#46:                                # %for.cond129.preheader.split.split
                                        #   in Loop: Header=BB5_44 Depth=1
	vpextrq	$1, %xmm4, %rax
	vmovddup	(%rcx,%rax,8), %xmm8
	vptest	%xmm7, %xmm7
	je	.LBB5_52
.LBB5_47:                               # %for.body133
                                        #   Parent Loop BB5_44 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm5, %rdx
	leaq	(%rax,%rax,4), %rdi
	shlq	$6, %rdi
	addq	%rsi, %rdi
	vmovddup	(%rdi,%rdx,8), %xmm7
	vmovddup	(%rcx,%rdx,8), %xmm6
	vmulpd	%xmm6, %xmm7, %xmm7
	vpermilpd	$1, %xmm7, %xmm6 # xmm6 = xmm7[1,0]
	vcmpneqpd	%xmm6, %xmm7, %xmm9
	vcmpordpd	%xmm6, %xmm7, %xmm6
	vandpd	%xmm9, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#48:                                # %for.body133.split
                                        #   in Loop: Header=BB5_47 Depth=2
	vsubpd	%xmm7, %xmm8, %xmm8
	vpermilpd	$1, %xmm8, %xmm6 # xmm6 = xmm8[1,0]
	vcmpneqpd	%xmm6, %xmm8, %xmm7
	vcmpordpd	%xmm6, %xmm8, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#49:                                # %for.body133.split.split
                                        #   in Loop: Header=BB5_47 Depth=2
	vunpckhpd	%xmm8, %xmm8, %xmm6 # xmm6 = xmm8[1,1]
	vmovsd	%xmm6, (%rcx,%rax,8)
	vpaddq	%xmm1, %xmm5, %xmm5
	vshufpd	$1, %xmm5, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vpcmpeqq	%xmm6, %xmm5, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#50:                                # %for.body133.split.split.split
                                        #   in Loop: Header=BB5_47 Depth=2
	vpcmpeqq	%xmm0, %xmm5, %xmm7
	vpand	%xmm1, %xmm7, %xmm9
	vshufpd	$1, %xmm7, %xmm7, %xmm6 # xmm6 = xmm7[1,0]
	vandpd	%xmm1, %xmm6, %xmm6
	vpcmpeqq	%xmm6, %xmm9, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#51:                                # %for.body133.split.split.split.split
                                        #   in Loop: Header=BB5_47 Depth=2
	vptest	%xmm7, %xmm7
	je	.LBB5_47
.LBB5_52:                               # %for.end143
                                        #   in Loop: Header=BB5_44 Depth=1
	leaq	(%rax,%rax,4), %rdx
	shlq	$6, %rdx
	addq	%rsi, %rdx
	vmovddup	(%rdx,%rax,8), %xmm5
	vdivpd	%xmm5, %xmm8, %xmm5
	vpermilpd	$1, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vcmpneqpd	%xmm6, %xmm5, %xmm7
	vcmpordpd	%xmm6, %xmm5, %xmm6
	vandpd	%xmm7, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#53:                                # %for.end143.split70
                                        #   in Loop: Header=BB5_44 Depth=1
	vunpckhpd	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[1,1]
	vmovsd	%xmm5, (%rcx,%rax,8)
	vpaddq	%xmm2, %xmm4, %xmm5
	vshufpd	$1, %xmm5, %xmm5, %xmm6 # xmm6 = xmm5[1,0]
	vpcmpeqq	%xmm6, %xmm5, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#54:                                # %for.end143.split
                                        #   in Loop: Header=BB5_44 Depth=1
	vpcmpgtq	%xmm3, %xmm4, %xmm4
	vpand	%xmm1, %xmm4, %xmm6
	vshufpd	$1, %xmm4, %xmm4, %xmm7 # xmm7 = xmm4[1,0]
	vandpd	%xmm1, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm6, %xmm6
	vpxor	%xmm2, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	jne	.LBB5_73
# BB#55:                                # %for.end143.split.split
                                        #   in Loop: Header=BB5_44 Depth=1
	vptest	%xmm4, %xmm4
	vmovdqa	%xmm5, %xmm4
	jne	.LBB5_44
.LBB5_56:                               # %for.end151
	popq	%rax
	ret
.LBB5_73:                               # %relExit
	movl	$.LrelFun, %edi
	movl	$.Lfunc5, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
	popq	%rax
	ret
.Ltmp68:
	.size	Crystal_Cholesky, .Ltmp68-Crystal_Cholesky
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
	.asciz	"init"
	.size	.Lfunc1, 5

	.type	.Lfunc2,@object         # @func2
.Lfunc2:
	.asciz	"SPEdriver"
	.size	.Lfunc2, 10

	.type	.Lfunc3,@object         # @func3
.Lfunc3:
	.asciz	"Crystal_div"
	.size	.Lfunc3, 12

	.type	.Lfunc4,@object         # @func4
.Lfunc4:
	.asciz	"Crystal_pow"
	.size	.Lfunc4, 12

	.type	.Lfunc5,@object         # @func5
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lfunc5:
	.asciz	"Crystal_Cholesky"
	.size	.Lfunc5, 17


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
