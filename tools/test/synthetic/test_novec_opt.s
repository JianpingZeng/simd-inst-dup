	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_1:
	.quad	100                     # 0x64
	.quad	100                     # 0x64
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$856, %rsp              # imm = 0x358
.Ltmp1:
	.cfi_def_cfa_offset 864
	vpxor	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI0_0(%rip), %xmm4
	.align	16, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rax
	vmovddup	.Lmain.A(,%rax,8), %xmm1
	vmovddup	.Lmain.B(,%rax,8), %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vpermilpd	$1, %xmm1, %xmm2 # xmm2 = xmm1[1,0]
	vcmpneqpd	%xmm2, %xmm1, %xmm3
	vcmpordpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm3, %xmm2, %xmm2
	vandpd	%xmm4, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_10
# BB#2:                                 # %for.body.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vunpckhpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,1]
	vmovsd	%xmm1, 48(%rsp,%rax,8)
	vpaddq	%xmm4, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,0]
	vpcmpeqq	%xmm1, %xmm0, %xmm1
	vpandn	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_10
# BB#3:                                 # %for.body.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vpcmpeqq	.LCPI0_1(%rip), %xmm0, %xmm1
	vpand	%xmm4, %xmm1, %xmm2
	vshufpd	$1, %xmm1, %xmm1, %xmm3 # xmm3 = xmm1[1,0]
	vandpd	%xmm4, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm2, %xmm2
	vpandn	%xmm4, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_10
# BB#4:                                 # %for.body.split.split.split
                                        #   in Loop: Header=BB0_1 Depth=1
	vptest	%xmm1, %xmm1
	je	.LBB0_1
# BB#5:
	vpxor	%xmm4, %xmm4, %xmm4
	.align	16, 0x90
.LBB0_6:                                # %for.body7
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm4, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm4, %rax
	vmovsd	48(%rsp,%rax,8), %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	vmovdqa	32(%rsp), %xmm4         # 16-byte Reload
	vmovdqa	.LCPI0_0(%rip), %xmm3
	vpaddq	%xmm3, %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm0 # xmm0 = xmm4[1,0]
	vpcmpeqq	%xmm0, %xmm4, %xmm0
	vpandn	%xmm3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	.LCPI0_1(%rip), %xmm0
	jne	.LBB0_10
# BB#7:                                 # %for.body7.split
                                        #   in Loop: Header=BB0_6 Depth=1
	vpcmpeqq	%xmm0, %xmm4, %xmm0
	vpand	%xmm3, %xmm0, %xmm1
	vshufpd	$1, %xmm0, %xmm0, %xmm2 # xmm2 = xmm0[1,0]
	vandpd	%xmm3, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpandn	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_10
# BB#8:                                 # %for.body7.split.split
                                        #   in Loop: Header=BB0_6 Depth=1
	vptest	%xmm0, %xmm0
	je	.LBB0_6
# BB#9:                                 # %for.end12
	movl	$1, %eax
	addq	$856, %rsp              # imm = 0x358
	ret
.LBB0_10:                               # %relExit
	movl	$.LrelFun, %edi
	movl	$.Lfunc, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
	xorl	%eax, %eax
	addq	$856, %rsp              # imm = 0x358
	ret
.Ltmp2:
	.size	main, .Ltmp2-main
	.cfi_endproc

	.type	.Lmain.A,@object        # @main.A
	.section	.rodata,"a",@progbits
	.align	16
.Lmain.A:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4613937818241073152     # double 3.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4617315517961601024     # double 5.000000e+00
	.quad	4618441417868443648     # double 6.000000e+00
	.quad	4619567317775286272     # double 7.000000e+00
	.quad	4620693217682128896     # double 8.000000e+00
	.quad	4621256167635550208     # double 9.000000e+00
	.quad	4621819117588971520     # double 1.000000e+01
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.size	.Lmain.A, 800

	.type	.Lmain.B,@object        # @main.B
	.align	16
.Lmain.B:
	.quad	4591870180066957722     # double 1.000000e-01
	.quad	4596373779694328218     # double 2.000000e-01
	.quad	4599075939470750515     # double 3.000000e-01
	.quad	4600877379321698714     # double 4.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4603579539098121011     # double 6.000000e-01
	.quad	4604480259023595110     # double 7.000000e-01
	.quad	4605380978949069210     # double 8.000000e-01
	.quad	4606281698874543309     # double 9.000000e-01
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	0                       # double 0.000000e+00
	.size	.Lmain.B, 800

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lf "
	.size	.L.str, 5

	.type	.LrelFun,@object        # @relFun
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.LrelFun:
	.asciz	"Reliability CMP failed in function, exit directly %s\n"
	.size	.LrelFun, 54

	.type	.Lfunc,@object          # @func
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc:
	.asciz	"main"
	.size	.Lfunc, 5


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
