	.file	"mandelbrot_dbl.cpp"
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
	subq	$40, %rsp
.Ltmp13:
	.cfi_def_cfa_offset 96
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
	movq	%rcx, %r15
	movl	%edx, %ebp
	movl	%esi, %r14d
	movl	%edi, %ebx
	movsd	%xmm1, 16(%rsp)         # 8-byte Spill
	movsd	%xmm0, 32(%rsp)         # 8-byte Spill
	testl	%r14d, %r14d
	jle	.LBB0_11
# BB#1:                                 # %for.cond4.preheader.lr.ph
	testl	%ebx, %ebx
	jle	.LBB0_11
# BB#2:                                 # %for.cond4.preheader.lr.ph.split.us
	subsd	32(%rsp), %xmm2         # 8-byte Folded Reload
	cvtsi2sdl	%ebx, %xmm0
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 24(%rsp)         # 8-byte Spill
	subsd	16(%rsp), %xmm3         # 8-byte Folded Reload
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%r14d, %xmm0
	divsd	%xmm0, %xmm3
	movsd	%xmm3, 8(%rsp)          # 8-byte Spill
	leal	-1(%rbx), %eax
	leaq	4(,%rax,4), %r12
	xorl	%r13d, %r13d
	.align	16, 0x90
.LBB0_5:                                # %for.body6.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #       Child Loop BB0_9 Depth 3
	movl	%r13d, %eax
	imull	%ebx, %eax
	testl	%ebp, %ebp
	cltq
	jle	.LBB0_3
# BB#6:                                 #   in Loop: Header=BB0_5 Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%r13d, %xmm0
	mulsd	8(%rsp), %xmm0          # 8-byte Folded Reload
	addsd	16(%rsp), %xmm0         # 8-byte Folded Reload
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB0_8:                                # %for.body.i.preheader.us.us
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
	cvtsi2sdl	%ecx, %xmm1
	mulsd	24(%rsp), %xmm1         # 8-byte Folded Reload
	addsd	32(%rsp), %xmm1         # 8-byte Folded Reload
	leaq	(%rcx,%rax), %rdx
	xorl	%esi, %esi
	movaps	%xmm1, %xmm3
	movaps	%xmm0, %xmm2
	.align	16, 0x90
.LBB0_9:                                # %for.body.i.us.us
                                        #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm3, %xmm4
	mulsd	%xmm4, %xmm4
	movaps	%xmm2, %xmm5
	mulsd	%xmm5, %xmm5
	movaps	%xmm4, %xmm6
	addsd	%xmm5, %xmm6
	ucomisd	.LCPI0_0(%rip), %xmm6
	ja	.LBB0_7
# BB#10:                                # %if.end.i.us.us
                                        #   in Loop: Header=BB0_9 Depth=3
	subsd	%xmm5, %xmm4
	addsd	%xmm3, %xmm3
	mulsd	%xmm3, %xmm2
	addsd	%xmm1, %xmm4
	addsd	%xmm0, %xmm2
	incl	%esi
	cmpl	%ebp, %esi
	movaps	%xmm4, %xmm3
	jl	.LBB0_9
.LBB0_7:                                # %_ZL6mandelddi.exit.us.us
                                        #   in Loop: Header=BB0_8 Depth=2
	movl	%esi, (%r15,%rdx,4)
	incq	%rcx
	cmpl	%ebx, %ecx
	jne	.LBB0_8
	jmp	.LBB0_4
	.align	16, 0x90
.LBB0_3:                                # %for.body6.lr.ph.for.body6.lr.ph.split_crit_edge.us
                                        #   in Loop: Header=BB0_5 Depth=1
	leaq	(%r15,%rax,4), %rdi
	xorl	%esi, %esi
	movq	%r12, %rdx
	callq	memset
.LBB0_4:                                # %for.inc13.us
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%r13
	cmpl	%r14d, %r13d
	jne	.LBB0_5
.LBB0_11:                               # %for.end15
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp20:
	.size	_Z17mandelbrot_serialddddiiiPi, .Ltmp20-_Z17mandelbrot_serialddddiiiPi
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
.Ltmp22:
	.cfi_def_cfa_offset 16
	movl	$1073741824, %edi       # imm = 0x40000000
	callq	_Znam
	xorl	%r8d, %r8d
	movsd	.LCPI1_0(%rip), %xmm8
	movsd	.LCPI1_1(%rip), %xmm9
	movsd	.LCPI1_2(%rip), %xmm10
	movsd	.LCPI1_3(%rip), %xmm3
	xorl	%r9d, %r9d
	.align	16, 0x90
.LBB1_1:                                # %for.body6.lr.ph.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_18 Depth 2
                                        #       Child Loop BB1_19 Depth 3
	cvtsi2sdl	%r9d, %xmm4
	movl	%r9d, %ecx
	shll	$14, %ecx
	movslq	%ecx, %rsi
	mulsd	%xmm8, %xmm4
	addsd	%xmm9, %xmm4
	xorl	%edi, %edi
	.align	16, 0x90
.LBB1_18:                               # %for.body.i.preheader.us.us.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_19 Depth 3
	cvtsi2sdl	%edi, %xmm5
	mulsd	%xmm10, %xmm5
	addsd	%xmm3, %xmm5
	leaq	(%rdi,%rsi), %rcx
	xorl	%edx, %edx
	movaps	%xmm5, %xmm2
	movaps	%xmm4, %xmm1
	.align	16, 0x90
.LBB1_19:                               # %for.body.i.us.us.i
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_18 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm2, %xmm0
	mulsd	%xmm0, %xmm0
	movaps	%xmm1, %xmm6
	mulsd	%xmm6, %xmm6
	movaps	%xmm0, %xmm7
	addsd	%xmm6, %xmm7
	ucomisd	.LCPI1_4(%rip), %xmm7
	ja	.LBB1_17
# BB#20:                                # %if.end.i.us.us.i
                                        #   in Loop: Header=BB1_19 Depth=3
	subsd	%xmm6, %xmm0
	addsd	%xmm2, %xmm2
	mulsd	%xmm2, %xmm1
	addsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm1
	incl	%edx
	cmpl	$10, %edx
	movaps	%xmm0, %xmm2
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
	cvtsi2sdl	%r8d, %xmm4
	movl	%r8d, %ecx
	shll	$14, %ecx
	movslq	%ecx, %rsi
	mulsd	%xmm8, %xmm4
	addsd	%xmm9, %xmm4
	xorl	%edi, %edi
	.align	16, 0x90
.LBB1_5:                                # %for.body.i.preheader.us.us.i.1
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
	cvtsi2sdl	%edi, %xmm5
	mulsd	%xmm10, %xmm5
	addsd	%xmm3, %xmm5
	leaq	(%rdi,%rsi), %rcx
	xorl	%edx, %edx
	movaps	%xmm5, %xmm7
	movaps	%xmm4, %xmm6
	.align	16, 0x90
.LBB1_6:                                # %for.body.i.us.us.i.1
                                        #   Parent Loop BB1_4 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm7, %xmm0
	mulsd	%xmm0, %xmm0
	movaps	%xmm6, %xmm1
	mulsd	%xmm1, %xmm1
	movaps	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	ucomisd	.LCPI1_4(%rip), %xmm2
	ja	.LBB1_8
# BB#7:                                 # %if.end.i.us.us.i.1
                                        #   in Loop: Header=BB1_6 Depth=3
	subsd	%xmm1, %xmm0
	addsd	%xmm7, %xmm7
	mulsd	%xmm7, %xmm6
	addsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm6
	incl	%edx
	cmpl	$10, %edx
	movaps	%xmm0, %xmm7
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
	cvtsi2sdl	%r9d, %xmm4
	movl	%r9d, %ecx
	shll	$14, %ecx
	movslq	%ecx, %rcx
	mulsd	%xmm8, %xmm4
	addsd	%xmm9, %xmm4
	xorl	%esi, %esi
	.align	16, 0x90
.LBB1_11:                               # %for.body.i.preheader.us.us.i.2
                                        #   Parent Loop BB1_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_12 Depth 3
	cvtsi2sdl	%esi, %xmm5
	mulsd	%xmm10, %xmm5
	addsd	%xmm3, %xmm5
	leaq	(%rsi,%rcx), %rdi
	xorl	%edx, %edx
	movaps	%xmm5, %xmm7
	movaps	%xmm4, %xmm6
	.align	16, 0x90
.LBB1_12:                               # %for.body.i.us.us.i.2
                                        #   Parent Loop BB1_10 Depth=1
                                        #     Parent Loop BB1_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm7, %xmm0
	mulsd	%xmm0, %xmm0
	movaps	%xmm6, %xmm1
	mulsd	%xmm1, %xmm1
	movaps	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	ucomisd	.LCPI1_4(%rip), %xmm2
	ja	.LBB1_14
# BB#13:                                # %if.end.i.us.us.i.2
                                        #   in Loop: Header=BB1_12 Depth=3
	subsd	%xmm1, %xmm0
	addsd	%xmm7, %xmm7
	mulsd	%xmm7, %xmm6
	addsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm6
	incl	%edx
	cmpl	$10, %edx
	movaps	%xmm0, %xmm7
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
.Ltmp23:
	.size	main, .Ltmp23-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"buf[%d] = %d\n"
	.size	.L.str, 14


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
