	.file	"mandelbrot_dbl_opt.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4616189618054758400     # double 4
	.text
	.globl	_Z17mandelbrot_serialddddiiiPi
	.align	16, 0x90
	.type	_Z17mandelbrot_serialddddiiiPi,@function
_Z17mandelbrot_serialddddiiiPi:         # @_Z17mandelbrot_serialddddiiiPi
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp8:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp9:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp10:
	.cfi_def_cfa_offset 48
.Ltmp11:
	.cfi_offset %rbx, -48
.Ltmp12:
	.cfi_offset %r12, -40
.Ltmp13:
	.cfi_offset %r14, -32
.Ltmp14:
	.cfi_offset %r15, -24
.Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rcx, %rbx
	movl	%esi, %r14d
	movl	%edi, %ebp
	testl	%r14d, %r14d
	jle	.LBB0_12
# BB#1:                                 # %entry
	testl	%ebp, %ebp
	jle	.LBB0_12
# BB#2:                                 # %for.cond4.preheader.lr.ph.split.us
	leal	-1(%rbp), %eax
	xorl	%r12d, %r12d
	testl	%edx, %edx
	jle	.LBB0_10
# BB#3:
	vsubsd	%xmm0, %xmm2, %xmm2
	vcvtsi2sdl	%ebp, %xmm0, %xmm4
	vdivsd	%xmm4, %xmm2, %xmm9
	vsubsd	%xmm1, %xmm3, %xmm2
	vcvtsi2sdl	%r14d, %xmm0, %xmm3
	vdivsd	%xmm3, %xmm2, %xmm8
	.align	16, 0x90
.LBB0_9:                                # %for.body.i.preheader.us.us.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #       Child Loop BB0_5 Depth 3
	vcvtsi2sdl	%r12d, %xmm0, %xmm10
	movl	%r12d, %eax
	imull	%ebp, %eax
	cltq
	vfmadd213sd	%xmm1, %xmm8, %xmm10
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB0_4:                                # %for.body.i.preheader.us.us.us
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
	vcvtsi2sdl	%ecx, %xmm0, %xmm5
	vfmadd213sd	%xmm0, %xmm9, %xmm5
	leaq	(%rcx,%rax), %rsi
	xorl	%edi, %edi
	vmovaps	%xmm5, %xmm6
	vmovaps	%xmm10, %xmm7
	.align	16, 0x90
.LBB0_5:                                # %for.body.i.us.us.us
                                        #   Parent Loop BB0_9 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm6, %xmm6, %xmm3
	vmulsd	%xmm7, %xmm7, %xmm2
	vaddsd	%xmm2, %xmm3, %xmm4
	vucomisd	.LCPI0_0(%rip), %xmm4
	ja	.LBB0_7
# BB#6:                                 # %if.end.i.us.us.us
                                        #   in Loop: Header=BB0_5 Depth=3
	vsubsd	%xmm2, %xmm3, %xmm2
	vaddsd	%xmm6, %xmm6, %xmm3
	vaddsd	%xmm2, %xmm5, %xmm6
	vfmadd213sd	%xmm10, %xmm3, %xmm7
	incl	%edi
	cmpl	%edx, %edi
	jl	.LBB0_5
.LBB0_7:                                # %_ZL6mandelddi.exit.us.us.us
                                        #   in Loop: Header=BB0_4 Depth=2
	movl	%edi, (%rbx,%rsi,4)
	incq	%rcx
	cmpl	%ebp, %ecx
	jne	.LBB0_4
# BB#8:                                 # %for.inc13.us.us
                                        #   in Loop: Header=BB0_9 Depth=1
	incq	%r12
	cmpl	%r14d, %r12d
	jne	.LBB0_9
	jmp	.LBB0_12
.LBB0_10:
	leaq	4(,%rax,4), %r15
	.align	16, 0x90
.LBB0_11:                               # %for.inc13.us
                                        # =>This Inner Loop Header: Depth=1
	movslq	%r12d, %r12
	leaq	(%rbx,%r12,4), %rdi
	xorl	%esi, %esi
	movq	%r15, %rdx
	callq	memset
	addl	%ebp, %r12d
	decl	%r14d
	jne	.LBB0_11
.LBB0_12:                               # %for.end15
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp16:
	.size	_Z17mandelbrot_serialddddiiiPi, .Ltmp16-_Z17mandelbrot_serialddddiiiPi
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4548635623644200960     # double 1.220703125E-4
.LCPI1_1:
	.quad	-4616189618054758400    # double -1
.LCPI1_2:
	.quad	4550887423457886208     # double 1.8310546875E-4
.LCPI1_3:
	.quad	-4611686018427387904    # double -2
.LCPI1_4:
	.quad	4616189618054758400     # double 4
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp18:
	.cfi_def_cfa_offset 16
	movl	$1073741824, %edi       # imm = 0x40000000
	callq	_Znam
	xorl	%r8d, %r8d
	vmovsd	.LCPI1_0(%rip), %xmm8
	vmovsd	.LCPI1_1(%rip), %xmm9
	vmovsd	.LCPI1_2(%rip), %xmm10
	vmovsd	.LCPI1_3(%rip), %xmm3
	xorl	%r9d, %r9d
	.align	16, 0x90
.LBB1_1:                                # %for.body6.lr.ph.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_18 Depth 2
                                        #       Child Loop BB1_19 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%r9d, %xmm0, %xmm4
	movl	%r9d, %ecx
	shll	$14, %ecx
	movslq	%ecx, %rsi
	vfmadd213sd	%xmm9, %xmm8, %xmm4
	xorl	%edi, %edi
	.align	16, 0x90
.LBB1_18:                               # %for.body.i.preheader.us.us.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_19 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%edi, %xmm0, %xmm5
	vfmadd213sd	%xmm3, %xmm10, %xmm5
	leaq	(%rdi,%rsi), %rcx
	xorl	%edx, %edx
	vmovaps	%xmm5, %xmm6
	vmovaps	%xmm4, %xmm7
	.align	16, 0x90
.LBB1_19:                               # %for.body.i.us.us.i
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_18 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm6, %xmm6, %xmm0
	vmulsd	%xmm7, %xmm7, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm2
	vucomisd	.LCPI1_4(%rip), %xmm2
	ja	.LBB1_17
# BB#20:                                # %if.end.i.us.us.i
                                        #   in Loop: Header=BB1_19 Depth=3
	vsubsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm6, %xmm6, %xmm1
	vaddsd	%xmm0, %xmm5, %xmm6
	vfmadd213sd	%xmm4, %xmm1, %xmm7
	incl	%edx
	cmpl	$10, %edx
	jl	.LBB1_19
.LBB1_17:                               # %_ZL6mandelddi.exit.us.us.i
                                        #   in Loop: Header=BB1_18 Depth=2
	movl	%edx, (%rax,%rcx,4)
	incq	%rdi
	cmpq	$16384, %rdi            # imm = 0x4000
	jne	.LBB1_18
# BB#2:                                 # %for.inc13.us.i
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%r9
	cmpq	$16384, %r9             # imm = 0x4000
	jne	.LBB1_1
# BB#3:
	xorl	%r9d, %r9d
	.align	16, 0x90
.LBB1_4:                                # %for.body6.lr.ph.us.i.1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_6 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%r8d, %xmm0, %xmm4
	movl	%r8d, %ecx
	shll	$14, %ecx
	movslq	%ecx, %rsi
	vfmadd213sd	%xmm9, %xmm8, %xmm4
	xorl	%edi, %edi
	.align	16, 0x90
.LBB1_5:                                # %for.body.i.preheader.us.us.i.1
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%edi, %xmm0, %xmm5
	vfmadd213sd	%xmm3, %xmm10, %xmm5
	leaq	(%rdi,%rsi), %rcx
	xorl	%edx, %edx
	vmovaps	%xmm5, %xmm6
	vmovaps	%xmm4, %xmm7
	.align	16, 0x90
.LBB1_6:                                # %for.body.i.us.us.i.1
                                        #   Parent Loop BB1_4 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm6, %xmm6, %xmm0
	vmulsd	%xmm7, %xmm7, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm2
	vucomisd	.LCPI1_4(%rip), %xmm2
	ja	.LBB1_8
# BB#7:                                 # %if.end.i.us.us.i.1
                                        #   in Loop: Header=BB1_6 Depth=3
	vsubsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm6, %xmm6, %xmm1
	vaddsd	%xmm0, %xmm5, %xmm6
	vfmadd213sd	%xmm4, %xmm1, %xmm7
	incl	%edx
	cmpl	$10, %edx
	jl	.LBB1_6
.LBB1_8:                                # %_ZL6mandelddi.exit.us.us.i.1
                                        #   in Loop: Header=BB1_5 Depth=2
	movl	%edx, (%rax,%rcx,4)
	incq	%rdi
	cmpq	$16384, %rdi            # imm = 0x4000
	jne	.LBB1_5
# BB#9:                                 # %for.inc13.us.i.1
                                        #   in Loop: Header=BB1_4 Depth=1
	incq	%r8
	cmpq	$16384, %r8             # imm = 0x4000
	jne	.LBB1_4
	.align	16, 0x90
.LBB1_10:                               # %for.body6.lr.ph.us.i.2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_11 Depth 2
                                        #       Child Loop BB1_12 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%r9d, %xmm0, %xmm4
	movl	%r9d, %ecx
	shll	$14, %ecx
	movslq	%ecx, %rcx
	vfmadd213sd	%xmm9, %xmm8, %xmm4
	xorl	%esi, %esi
	.align	16, 0x90
.LBB1_11:                               # %for.body.i.preheader.us.us.i.2
                                        #   Parent Loop BB1_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_12 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%esi, %xmm0, %xmm5
	vfmadd213sd	%xmm3, %xmm10, %xmm5
	leaq	(%rsi,%rcx), %rdi
	xorl	%edx, %edx
	vmovaps	%xmm5, %xmm6
	vmovaps	%xmm4, %xmm7
	.align	16, 0x90
.LBB1_12:                               # %for.body.i.us.us.i.2
                                        #   Parent Loop BB1_10 Depth=1
                                        #     Parent Loop BB1_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm6, %xmm6, %xmm0
	vmulsd	%xmm7, %xmm7, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm2
	vucomisd	.LCPI1_4(%rip), %xmm2
	ja	.LBB1_14
# BB#13:                                # %if.end.i.us.us.i.2
                                        #   in Loop: Header=BB1_12 Depth=3
	vsubsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm6, %xmm6, %xmm1
	vaddsd	%xmm0, %xmm5, %xmm6
	vfmadd213sd	%xmm4, %xmm1, %xmm7
	incl	%edx
	cmpl	$10, %edx
	jl	.LBB1_12
.LBB1_14:                               # %_ZL6mandelddi.exit.us.us.i.2
                                        #   in Loop: Header=BB1_11 Depth=2
	movl	%edx, (%rax,%rdi,4)
	incq	%rsi
	cmpq	$16384, %rsi            # imm = 0x4000
	jne	.LBB1_11
# BB#15:                                # %for.inc13.us.i.2
                                        #   in Loop: Header=BB1_10 Depth=1
	incq	%r9
	cmpq	$16384, %r9             # imm = 0x4000
	jne	.LBB1_10
# BB#16:                                # %_Z17mandelbrot_serialddddiiiPi.exit.2
	movl	65536(%rax), %edx
	movl	$.L.str, %edi
	movl	$16384, %esi            # imm = 0x4000
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	popq	%rdx
	ret
.Ltmp19:
	.size	main, .Ltmp19-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"buf[%d] = %d\n"
	.size	.L.str, 14


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
