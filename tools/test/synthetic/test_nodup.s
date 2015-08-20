	.file	"test_nodup.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
# BB#0:                                 # %entry
	pushl	%esi
	subl	$824, %esp              # imm = 0x338
	xorl	%eax, %eax
	xorl	%esi, %esi
	.align	16, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	.Lmain.B(,%eax,8), %xmm0
	vaddsd	.LCPI0_0, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%esp,%eax,8)
	incl	%eax
	movl	%eax, %ecx
	subl	$100, %ecx
	jne	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %for.body5
                                        # =>This Inner Loop Header: Depth=1
	vmovsd	24(%esp,%esi,8), %xmm0
	vmovsd	%xmm0, 4(%esp)
	movl	$.L.str, (%esp)
	calll	printf
	incl	%esi
	movl	%esi, %eax
	subl	$100, %eax
	jne	.LBB0_2
# BB#3:                                 # %for.end9
	movl	$1, %eax
	addl	$824, %esp              # imm = 0x338
	popl	%esi
	ret
.Ltmp0:
	.size	main, .Ltmp0-main

	.type	.Lmain.B,@object        # @main.B
	.section	.rodata,"a",@progbits
	.align	4
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
	.asciz	 "%f "
	.size	.L.str, 4


	.section	".note.GNU-stack","",@progbits
