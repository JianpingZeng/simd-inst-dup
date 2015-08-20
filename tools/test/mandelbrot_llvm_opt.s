	.file	"llvmprof.out"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4616189618054758400     # double 4
	.text
	.globl	_Z17mandelbrot_serialddddiiiPi
	.align	16, 0x90
	.type	_Z17mandelbrot_serialddddiiiPi,@function
_Z17mandelbrot_serialddddiiiPi:         # @_Z17mandelbrot_serialddddiiiPi
# BB#0:                                 # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$92, %esp
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_49
# BB#1:                                 # %entry.split50
	vmovsd	128(%esp), %xmm0
	vsubsd	112(%esp), %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB0_49
# BB#2:                                 # %entry.split49
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_49
# BB#3:                                 # %entry.split49.split51
	vcvtsi2sdl	144(%esp), %xmm0, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB0_49
# BB#4:                                 # %entry.split49.split
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	%xmm2, 64(%esp)         # 8-byte Spill
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 56(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm2
	jne	.LBB0_49
# BB#5:                                 # %entry.split49.split.split52
	vmovsd	64(%esp), %xmm0         # 8-byte Reload
	vucomisd	56(%esp), %xmm0 # 8-byte Folded Reload
	jne	.LBB0_49
# BB#6:                                 # %entry.split49.split.split
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_49
# BB#7:                                 # %entry.split49.split.split.split
	vmovsd	136(%esp), %xmm0
	vsubsd	120(%esp), %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB0_49
# BB#8:                                 # %entry.split
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_49
# BB#9:                                 # %entry.split.split47
	vcvtsi2sdl	148(%esp), %xmm0, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB0_49
# BB#10:                                # %entry.split.split
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	%xmm2, 48(%esp)         # 8-byte Spill
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 40(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm2
	jne	.LBB0_49
# BB#11:                                # %entry.split.split.split48
	vmovsd	48(%esp), %xmm0         # 8-byte Reload
	vucomisd	40(%esp), %xmm0 # 8-byte Folded Reload
	jne	.LBB0_49
# BB#12:                                # %entry.split.split.split
	cmpl	$0, 148(%esp)
	jle	.LBB0_50
# BB#13:                                # %for.cond4.preheader.lr.ph
	cmpl	$0, 144(%esp)
	jle	.LBB0_50
# BB#14:                                # %for.cond4.preheader.lr.ph.split.us
	movl	152(%esp), %ebp
	movl	144(%esp), %eax
	leal	(,%eax,4), %eax
	movl	%eax, 36(%esp)          # 4-byte Spill
	xorl	%edi, %edi
.LBB0_16:                               # %for.body6.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_25 Depth 2
                                        #       Child Loop BB0_32 Depth 3
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_49
# BB#17:                                # %for.body6.lr.ph.us.split46
                                        #   in Loop: Header=BB0_16 Depth=1
	vcvtsi2sdl	%edi, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB0_49
# BB#18:                                # %for.body6.lr.ph.us.split
                                        #   in Loop: Header=BB0_16 Depth=1
	vmovsd	48(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	40(%esp), %xmm2         # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_49
# BB#19:                                # %for.body6.lr.ph.us.split.split45
                                        #   in Loop: Header=BB0_16 Depth=1
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_49
# BB#20:                                # %for.body6.lr.ph.us.split.split
                                        #   in Loop: Header=BB0_16 Depth=1
	vmovsd	120(%esp), %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 80(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 72(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_49
# BB#21:                                # %for.body6.lr.ph.us.split.split.split60
                                        #   in Loop: Header=BB0_16 Depth=1
	vmovsd	80(%esp), %xmm0         # 8-byte Reload
	vucomisd	72(%esp), %xmm0 # 8-byte Folded Reload
	jne	.LBB0_49
# BB#22:                                # %for.body6.lr.ph.us.split.split.split
                                        #   in Loop: Header=BB0_16 Depth=1
	movl	%edi, %eax
	imull	144(%esp), %eax
	xorl	%ecx, %ecx
	testl	%ebp, %ebp
	jle	.LBB0_23
.LBB0_25:                               # %for.body.i.preheader.us.us
                                        #   Parent Loop BB0_16 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_32 Depth 3
	xorb	%dl, %dl
	testb	%dl, %dl
	jne	.LBB0_49
# BB#26:                                # %for.body.i.preheader.us.us.split53
                                        #   in Loop: Header=BB0_25 Depth=2
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB0_49
# BB#27:                                # %for.body.i.preheader.us.us.split
                                        #   in Loop: Header=BB0_25 Depth=2
	vmovsd	64(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	56(%esp), %xmm2         # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_49
# BB#28:                                # %for.body.i.preheader.us.us.split.split54
                                        #   in Loop: Header=BB0_25 Depth=2
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_49
# BB#29:                                # %for.body.i.preheader.us.us.split.split
                                        #   in Loop: Header=BB0_25 Depth=2
	vmovsd	112(%esp), %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB0_49
# BB#30:                                # %for.body.i.preheader.us.us.split.split.split58
                                        #   in Loop: Header=BB0_25 Depth=2
	vucomisd	%xmm3, %xmm2
	jne	.LBB0_49
# BB#31:                                # %for.body.i.preheader.us.us.split.split.split
                                        #   in Loop: Header=BB0_25 Depth=2
	leal	(%ecx,%eax), %edx
	xorl	%esi, %esi
	vmovapd	%xmm2, %xmm4
	vmovsd	80(%esp), %xmm5         # 8-byte Reload
.LBB0_32:                               # %for.body.i.us.us
                                        #   Parent Loop BB0_16 Depth=1
                                        #     Parent Loop BB0_25 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorb	%bl, %bl
	testb	%bl, %bl
	jne	.LBB0_49
# BB#33:                                # %for.body.i.us.us.split43
                                        #   in Loop: Header=BB0_32 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm6
	vucomisd	%xmm6, %xmm6
	jne	.LBB0_49
# BB#34:                                # %for.body.i.us.us.split
                                        #   in Loop: Header=BB0_32 Depth=3
	vucomisd	%xmm6, %xmm6
	jne	.LBB0_49
# BB#35:                                # %for.body.i.us.us.split.split55
                                        #   in Loop: Header=BB0_32 Depth=3
	xorb	%bl, %bl
	testb	%bl, %bl
	jne	.LBB0_49
# BB#36:                                # %for.body.i.us.us.split.split44
                                        #   in Loop: Header=BB0_32 Depth=3
	vmulsd	%xmm5, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB0_49
# BB#37:                                # %for.body.i.us.us.split.split
                                        #   in Loop: Header=BB0_32 Depth=3
	vucomisd	%xmm1, %xmm1
	jne	.LBB0_49
# BB#38:                                # %for.body.i.us.us.split.split.split56
                                        #   in Loop: Header=BB0_32 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB0_49
# BB#39:                                # %for.body.i.us.us.split.split.split
                                        #   in Loop: Header=BB0_32 Depth=3
	vucomisd	.LCPI0_0, %xmm0
	ja	.LBB0_24
# BB#40:                                # %if.end.i.us.us
                                        #   in Loop: Header=BB0_32 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB0_49
# BB#41:                                # %if.end.i.us.us.split59
                                        #   in Loop: Header=BB0_32 Depth=3
	vucomisd	%xmm6, %xmm7
	jne	.LBB0_49
# BB#42:                                # %if.end.i.us.us.split
                                        #   in Loop: Header=BB0_32 Depth=3
	xorb	%bl, %bl
	testb	%bl, %bl
	jne	.LBB0_49
# BB#43:                                # %if.end.i.us.us.split.split57
                                        #   in Loop: Header=BB0_32 Depth=3
	vaddsd	%xmm4, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB0_49
# BB#44:                                # %if.end.i.us.us.split.split
                                        #   in Loop: Header=BB0_32 Depth=3
	vmulsd	%xmm1, %xmm5, %xmm0
	vmulsd	%xmm1, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB0_49
# BB#45:                                # %if.end.i.us.us.split.split.split61
                                        #   in Loop: Header=BB0_32 Depth=3
	vucomisd	%xmm1, %xmm0
	jne	.LBB0_49
# BB#46:                                # %if.end.i.us.us.split.split.split
                                        #   in Loop: Header=BB0_32 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm4
	vaddsd	%xmm6, %xmm3, %xmm5
	vucomisd	%xmm5, %xmm4
	jne	.LBB0_49
# BB#47:                                # %if.end.i.us.us.split.split.split.split
                                        #   in Loop: Header=BB0_32 Depth=3
	vmovsd	80(%esp), %xmm5         # 8-byte Reload
	vaddsd	%xmm0, %xmm5, %xmm5
	vmovsd	72(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm5
	jne	.LBB0_49
# BB#48:                                # %if.end.i.us.us.split.split.split.split.split
                                        #   in Loop: Header=BB0_32 Depth=3
	incl	%esi
	cmpl	%ebp, %esi
	jl	.LBB0_32
.LBB0_24:                               # %_ZL6mandelddi.exit.us.us
                                        #   in Loop: Header=BB0_25 Depth=2
	movl	156(%esp), %ebx
	movl	%esi, (%ebx,%edx,4)
	incl	%ecx
	cmpl	144(%esp), %ecx
	je	.LBB0_15
	jmp	.LBB0_25
.LBB0_23:                               # %for.body6.lr.ph.for.body6.lr.ph.split_crit_edge.us
                                        #   in Loop: Header=BB0_16 Depth=1
	movl	36(%esp), %ecx          # 4-byte Reload
	movl	%ecx, 8(%esp)
	movl	156(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	memset
.LBB0_15:                               # %for.inc13.us
                                        #   in Loop: Header=BB0_16 Depth=1
	incl	%edi
	cmpl	148(%esp), %edi
	je	.LBB0_50
	jmp	.LBB0_16
.LBB0_49:                               # %relExit
	movl	$.Lfunc, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB0_50:                               # %for.end15
	addl	$92, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp0:
	.size	_Z17mandelbrot_serialddddiiiPi, .Ltmp0-_Z17mandelbrot_serialddddiiiPi

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
	pushl	%ebp
.Ltmp6:
	.cfi_def_cfa_offset 8
	pushl	%ebx
.Ltmp7:
	.cfi_def_cfa_offset 12
	pushl	%edi
.Ltmp8:
	.cfi_def_cfa_offset 16
	pushl	%esi
.Ltmp9:
	.cfi_def_cfa_offset 20
	subl	$60, %esp
.Ltmp10:
	.cfi_def_cfa_offset 80
.Ltmp11:
	.cfi_offset %esi, -20
.Ltmp12:
	.cfi_offset %edi, -16
.Ltmp13:
	.cfi_offset %ebx, -12
.Ltmp14:
	.cfi_offset %ebp, -8
	movl	$1073741824, (%esp)     # imm = 0x40000000
	calll	_Znaj
	movl	%eax, %esi
	leal	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	calll	clock_gettime
	movl	$274877907, %eax        # imm = 0x10624DD3
	imull	52(%esp)
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$6, %edx
	addl	%eax, %edx
	movl	%edx, 28(%esp)          # 4-byte Spill
	movl	48(%esp), %eax
	movl	%eax, 24(%esp)          # 4-byte Spill
	sarl	$31, %eax
	movl	%eax, 20(%esp)          # 4-byte Spill
	xorl	%edx, %edx
.LBB1_2:                                # %for.body6.lr.ph.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_10 Depth 2
                                        #       Child Loop BB1_17 Depth 3
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB1_101
# BB#3:                                 # %for.body6.lr.ph.us.i.split94
                                        #   in Loop: Header=BB1_2 Depth=1
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB1_101
# BB#4:                                 # %for.body6.lr.ph.us.i.split
                                        #   in Loop: Header=BB1_2 Depth=1
	vmovsd	.LCPI1_0, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#5:                                 # %for.body6.lr.ph.us.i.split.split95
                                        #   in Loop: Header=BB1_2 Depth=1
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#6:                                 # %for.body6.lr.ph.us.i.split.split
                                        #   in Loop: Header=BB1_2 Depth=1
	vmovsd	.LCPI1_1, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 40(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#7:                                 # %for.body6.lr.ph.us.i.split.split.split106
                                        #   in Loop: Header=BB1_2 Depth=1
	vmovsd	40(%esp), %xmm0         # 8-byte Reload
	vucomisd	32(%esp), %xmm0 # 8-byte Folded Reload
	jne	.LBB1_101
# BB#8:                                 #   in Loop: Header=BB1_2 Depth=1
	xorl	%eax, %eax
	movl	%edx, %ebx
	shll	$14, %ebx
.LBB1_10:                               # %for.body.i.preheader.us.us.i
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_17 Depth 3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#11:                                # %for.body.i.preheader.us.us.i.split96
                                        #   in Loop: Header=BB1_10 Depth=2
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB1_101
# BB#12:                                # %for.body.i.preheader.us.us.i.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vmovsd	.LCPI1_2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#13:                                # %for.body.i.preheader.us.us.i.split.split97
                                        #   in Loop: Header=BB1_10 Depth=2
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#14:                                # %for.body.i.preheader.us.us.i.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	vmovsd	.LCPI1_3, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_101
# BB#15:                                # %for.body.i.preheader.us.us.i.split.split.split107
                                        #   in Loop: Header=BB1_10 Depth=2
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_101
# BB#16:                                # %for.body.i.preheader.us.us.i.split.split.split
                                        #   in Loop: Header=BB1_10 Depth=2
	leal	(%eax,%ebx), %edi
	xorl	%ebp, %ebp
	vmovapd	%xmm2, %xmm4
	vmovsd	40(%esp), %xmm5         # 8-byte Reload
.LBB1_17:                               # %for.body.i.us.us.i
                                        #   Parent Loop BB1_2 Depth=1
                                        #     Parent Loop BB1_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#18:                                # %for.body.i.us.us.i.split100
                                        #   in Loop: Header=BB1_17 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm6
	vucomisd	%xmm6, %xmm6
	jne	.LBB1_101
# BB#19:                                # %for.body.i.us.us.i.split98
                                        #   in Loop: Header=BB1_17 Depth=3
	vucomisd	%xmm6, %xmm6
	jne	.LBB1_101
# BB#20:                                # %for.body.i.us.us.i.split
                                        #   in Loop: Header=BB1_17 Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#21:                                # %for.body.i.us.us.i.split.split101
                                        #   in Loop: Header=BB1_17 Depth=3
	vmulsd	%xmm5, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#22:                                # %for.body.i.us.us.i.split.split99
                                        #   in Loop: Header=BB1_17 Depth=3
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#23:                                # %for.body.i.us.us.i.split.split
                                        #   in Loop: Header=BB1_17 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB1_101
# BB#24:                                # %for.body.i.us.us.i.split.split.split
                                        #   in Loop: Header=BB1_17 Depth=3
	vucomisd	.LCPI1_4, %xmm0
	ja	.LBB1_9
# BB#25:                                # %if.end.i.us.us.i
                                        #   in Loop: Header=BB1_17 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_101
# BB#26:                                # %if.end.i.us.us.i.split105
                                        #   in Loop: Header=BB1_17 Depth=3
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_101
# BB#27:                                # %if.end.i.us.us.i.split102
                                        #   in Loop: Header=BB1_17 Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#28:                                # %if.end.i.us.us.i.split102.split103
                                        #   in Loop: Header=BB1_17 Depth=3
	vaddsd	%xmm4, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#29:                                # %if.end.i.us.us.i.split102.split
                                        #   in Loop: Header=BB1_17 Depth=3
	vmulsd	%xmm1, %xmm5, %xmm0
	vmulsd	%xmm1, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_101
# BB#30:                                # %if.end.i.us.us.i.split
                                        #   in Loop: Header=BB1_17 Depth=3
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_101
# BB#31:                                # %if.end.i.us.us.i.split.split104
                                        #   in Loop: Header=BB1_17 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm4
	vaddsd	%xmm6, %xmm3, %xmm5
	vucomisd	%xmm5, %xmm4
	jne	.LBB1_101
# BB#32:                                # %if.end.i.us.us.i.split.split104.split
                                        #   in Loop: Header=BB1_17 Depth=3
	vmovsd	40(%esp), %xmm5         # 8-byte Reload
	vaddsd	%xmm0, %xmm5, %xmm5
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm5
	jne	.LBB1_101
# BB#33:                                # %if.end.i.us.us.i.split.split
                                        #   in Loop: Header=BB1_17 Depth=3
	incl	%ebp
	cmpl	$10, %ebp
	jl	.LBB1_17
.LBB1_9:                                # %_ZL6mandelddi.exit.us.us.i
                                        #   in Loop: Header=BB1_10 Depth=2
	movl	%ebp, (%esi,%edi,4)
	incl	%eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB1_10
# BB#1:                                 # %for.inc13.us.i
                                        #   in Loop: Header=BB1_2 Depth=1
	incl	%edx
	xorl	%eax, %eax
	cmpl	$16384, %edx            # imm = 0x4000
	jne	.LBB1_2
.LBB1_34:                               # %for.body6.lr.ph.us.i.1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_41 Depth 2
                                        #       Child Loop BB1_48 Depth 3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#35:                                # %for.body6.lr.ph.us.i.1.split83
                                        #   in Loop: Header=BB1_34 Depth=1
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB1_101
# BB#36:                                # %for.body6.lr.ph.us.i.1.split
                                        #   in Loop: Header=BB1_34 Depth=1
	vmovsd	.LCPI1_0, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#37:                                # %for.body6.lr.ph.us.i.1.split.split84
                                        #   in Loop: Header=BB1_34 Depth=1
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#38:                                # %for.body6.lr.ph.us.i.1.split.split
                                        #   in Loop: Header=BB1_34 Depth=1
	vmovsd	.LCPI1_1, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 40(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#39:                                # %for.body6.lr.ph.us.i.1.split.split.split112
                                        #   in Loop: Header=BB1_34 Depth=1
	vmovsd	40(%esp), %xmm0         # 8-byte Reload
	vucomisd	32(%esp), %xmm0 # 8-byte Folded Reload
	jne	.LBB1_101
# BB#40:                                #   in Loop: Header=BB1_34 Depth=1
	xorl	%edx, %edx
	movl	%eax, %ebx
	shll	$14, %ebx
.LBB1_41:                               # %for.body.i.preheader.us.us.i.1
                                        #   Parent Loop BB1_34 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_48 Depth 3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#42:                                # %for.body.i.preheader.us.us.i.1.split85
                                        #   in Loop: Header=BB1_41 Depth=2
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB1_101
# BB#43:                                # %for.body.i.preheader.us.us.i.1.split
                                        #   in Loop: Header=BB1_41 Depth=2
	vmovsd	.LCPI1_2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#44:                                # %for.body.i.preheader.us.us.i.1.split.split86
                                        #   in Loop: Header=BB1_41 Depth=2
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#45:                                # %for.body.i.preheader.us.us.i.1.split.split
                                        #   in Loop: Header=BB1_41 Depth=2
	vmovsd	.LCPI1_3, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_101
# BB#46:                                # %for.body.i.preheader.us.us.i.1.split.split.split110
                                        #   in Loop: Header=BB1_41 Depth=2
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_101
# BB#47:                                # %for.body.i.preheader.us.us.i.1.split.split.split
                                        #   in Loop: Header=BB1_41 Depth=2
	leal	(%edx,%ebx), %edi
	xorl	%ebp, %ebp
	vmovapd	%xmm2, %xmm4
	vmovsd	40(%esp), %xmm5         # 8-byte Reload
.LBB1_48:                               # %for.body.i.us.us.i.1
                                        #   Parent Loop BB1_34 Depth=1
                                        #     Parent Loop BB1_41 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#49:                                # %for.body.i.us.us.i.1.split108
                                        #   in Loop: Header=BB1_48 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm6
	vucomisd	%xmm6, %xmm6
	jne	.LBB1_101
# BB#50:                                # %for.body.i.us.us.i.1.split87
                                        #   in Loop: Header=BB1_48 Depth=3
	vucomisd	%xmm6, %xmm6
	jne	.LBB1_101
# BB#51:                                # %for.body.i.us.us.i.1.split
                                        #   in Loop: Header=BB1_48 Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#52:                                # %for.body.i.us.us.i.1.split.split109
                                        #   in Loop: Header=BB1_48 Depth=3
	vmulsd	%xmm5, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#53:                                # %for.body.i.us.us.i.1.split.split88
                                        #   in Loop: Header=BB1_48 Depth=3
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#54:                                # %for.body.i.us.us.i.1.split.split
                                        #   in Loop: Header=BB1_48 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB1_101
# BB#55:                                # %for.body.i.us.us.i.1.split.split.split
                                        #   in Loop: Header=BB1_48 Depth=3
	vucomisd	.LCPI1_4, %xmm0
	ja	.LBB1_65
# BB#56:                                # %if.end.i.us.us.i.1
                                        #   in Loop: Header=BB1_48 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_101
# BB#57:                                # %if.end.i.us.us.i.1.split111
                                        #   in Loop: Header=BB1_48 Depth=3
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_101
# BB#58:                                # %if.end.i.us.us.i.1.split
                                        #   in Loop: Header=BB1_48 Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#59:                                # %if.end.i.us.us.i.1.split.split89
                                        #   in Loop: Header=BB1_48 Depth=3
	vaddsd	%xmm4, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#60:                                # %if.end.i.us.us.i.1.split.split
                                        #   in Loop: Header=BB1_48 Depth=3
	vmulsd	%xmm1, %xmm5, %xmm0
	vmulsd	%xmm1, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_101
# BB#61:                                # %if.end.i.us.us.i.1.split.split.split113
                                        #   in Loop: Header=BB1_48 Depth=3
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_101
# BB#62:                                # %if.end.i.us.us.i.1.split.split.split
                                        #   in Loop: Header=BB1_48 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm4
	vaddsd	%xmm6, %xmm3, %xmm5
	vucomisd	%xmm5, %xmm4
	jne	.LBB1_101
# BB#63:                                # %if.end.i.us.us.i.1.split.split.split.split
                                        #   in Loop: Header=BB1_48 Depth=3
	vmovsd	40(%esp), %xmm5         # 8-byte Reload
	vaddsd	%xmm0, %xmm5, %xmm5
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm5
	jne	.LBB1_101
# BB#64:                                # %if.end.i.us.us.i.1.split.split.split.split.split
                                        #   in Loop: Header=BB1_48 Depth=3
	incl	%ebp
	cmpl	$10, %ebp
	jl	.LBB1_48
.LBB1_65:                               # %_ZL6mandelddi.exit.us.us.i.1
                                        #   in Loop: Header=BB1_41 Depth=2
	movl	%ebp, (%esi,%edi,4)
	incl	%edx
	cmpl	$16384, %edx            # imm = 0x4000
	jne	.LBB1_41
# BB#66:                                # %for.inc13.us.i.1
                                        #   in Loop: Header=BB1_34 Depth=1
	incl	%eax
	xorl	%edx, %edx
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB1_34
.LBB1_67:                               # %for.body6.lr.ph.us.i.2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_74 Depth 2
                                        #       Child Loop BB1_81 Depth 3
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB1_101
# BB#68:                                # %for.body6.lr.ph.us.i.2.split90
                                        #   in Loop: Header=BB1_67 Depth=1
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB1_101
# BB#69:                                # %for.body6.lr.ph.us.i.2.split
                                        #   in Loop: Header=BB1_67 Depth=1
	vmovsd	.LCPI1_0, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#70:                                # %for.body6.lr.ph.us.i.2.split.split91
                                        #   in Loop: Header=BB1_67 Depth=1
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#71:                                # %for.body6.lr.ph.us.i.2.split.split
                                        #   in Loop: Header=BB1_67 Depth=1
	vmovsd	.LCPI1_1, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 40(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#72:                                # %for.body6.lr.ph.us.i.2.split.split.split121
                                        #   in Loop: Header=BB1_67 Depth=1
	vmovsd	40(%esp), %xmm0         # 8-byte Reload
	vucomisd	32(%esp), %xmm0 # 8-byte Folded Reload
	jne	.LBB1_101
# BB#73:                                #   in Loop: Header=BB1_67 Depth=1
	xorl	%eax, %eax
	movl	%edx, %ebx
	shll	$14, %ebx
.LBB1_74:                               # %for.body.i.preheader.us.us.i.2
                                        #   Parent Loop BB1_67 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_81 Depth 3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#75:                                # %for.body.i.preheader.us.us.i.2.split92
                                        #   in Loop: Header=BB1_74 Depth=2
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm0
	jne	.LBB1_101
# BB#76:                                # %for.body.i.preheader.us.us.i.2.split
                                        #   in Loop: Header=BB1_74 Depth=2
	vmovsd	.LCPI1_2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#77:                                # %for.body.i.preheader.us.us.i.2.split.split93
                                        #   in Loop: Header=BB1_74 Depth=2
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_101
# BB#78:                                # %for.body.i.preheader.us.us.i.2.split.split
                                        #   in Loop: Header=BB1_74 Depth=2
	vmovsd	.LCPI1_3, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_101
# BB#79:                                # %for.body.i.preheader.us.us.i.2.split.split.split119
                                        #   in Loop: Header=BB1_74 Depth=2
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_101
# BB#80:                                # %for.body.i.preheader.us.us.i.2.split.split.split
                                        #   in Loop: Header=BB1_74 Depth=2
	leal	(%eax,%ebx), %edi
	xorl	%ebp, %ebp
	vmovapd	%xmm2, %xmm4
	vmovsd	40(%esp), %xmm5         # 8-byte Reload
.LBB1_81:                               # %for.body.i.us.us.i.2
                                        #   Parent Loop BB1_67 Depth=1
                                        #     Parent Loop BB1_74 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#82:                                # %for.body.i.us.us.i.2.split116
                                        #   in Loop: Header=BB1_81 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm6
	vucomisd	%xmm6, %xmm6
	jne	.LBB1_101
# BB#83:                                # %for.body.i.us.us.i.2.split114
                                        #   in Loop: Header=BB1_81 Depth=3
	vucomisd	%xmm6, %xmm6
	jne	.LBB1_101
# BB#84:                                # %for.body.i.us.us.i.2.split
                                        #   in Loop: Header=BB1_81 Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#85:                                # %for.body.i.us.us.i.2.split.split117
                                        #   in Loop: Header=BB1_81 Depth=3
	vmulsd	%xmm5, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#86:                                # %for.body.i.us.us.i.2.split.split115
                                        #   in Loop: Header=BB1_81 Depth=3
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#87:                                # %for.body.i.us.us.i.2.split.split
                                        #   in Loop: Header=BB1_81 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB1_101
# BB#88:                                # %for.body.i.us.us.i.2.split.split.split
                                        #   in Loop: Header=BB1_81 Depth=3
	vucomisd	.LCPI1_4, %xmm0
	ja	.LBB1_98
# BB#89:                                # %if.end.i.us.us.i.2
                                        #   in Loop: Header=BB1_81 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_101
# BB#90:                                # %if.end.i.us.us.i.2.split120
                                        #   in Loop: Header=BB1_81 Depth=3
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_101
# BB#91:                                # %if.end.i.us.us.i.2.split
                                        #   in Loop: Header=BB1_81 Depth=3
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_101
# BB#92:                                # %if.end.i.us.us.i.2.split.split118
                                        #   in Loop: Header=BB1_81 Depth=3
	vaddsd	%xmm4, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm1
	jne	.LBB1_101
# BB#93:                                # %if.end.i.us.us.i.2.split.split
                                        #   in Loop: Header=BB1_81 Depth=3
	vmulsd	%xmm1, %xmm5, %xmm0
	vmulsd	%xmm1, %xmm5, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_101
# BB#94:                                # %if.end.i.us.us.i.2.split.split.split122
                                        #   in Loop: Header=BB1_81 Depth=3
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_101
# BB#95:                                # %if.end.i.us.us.i.2.split.split.split
                                        #   in Loop: Header=BB1_81 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm4
	vaddsd	%xmm6, %xmm3, %xmm5
	vucomisd	%xmm5, %xmm4
	jne	.LBB1_101
# BB#96:                                # %if.end.i.us.us.i.2.split.split.split.split
                                        #   in Loop: Header=BB1_81 Depth=3
	vmovsd	40(%esp), %xmm5         # 8-byte Reload
	vaddsd	%xmm0, %xmm5, %xmm5
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm5
	jne	.LBB1_101
# BB#97:                                # %if.end.i.us.us.i.2.split.split.split.split.split
                                        #   in Loop: Header=BB1_81 Depth=3
	incl	%ebp
	cmpl	$10, %ebp
	jl	.LBB1_81
.LBB1_98:                               # %_ZL6mandelddi.exit.us.us.i.2
                                        #   in Loop: Header=BB1_74 Depth=2
	movl	%ebp, (%esi,%edi,4)
	incl	%eax
	cmpl	$16384, %eax            # imm = 0x4000
	jne	.LBB1_74
# BB#99:                                # %for.inc13.us.i.2
                                        #   in Loop: Header=BB1_67 Depth=1
	incl	%edx
	cmpl	$16384, %edx            # imm = 0x4000
	jne	.LBB1_67
# BB#100:                               # %_Z17mandelbrot_serialddddiiiPi.exit.2
	leal	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	movl	$-1000000, %edx         # imm = 0xFFFFFFFFFFF0BDC0
	movl	24(%esp), %ecx          # 4-byte Reload
	movl	%ecx, %eax
	mull	%edx
	movl	%eax, %ebx
	subl	%ecx, %edx
	imull	$-1000000, 20(%esp), %ebp # 4-byte Folded Reload
                                        # imm = 0xFFFFFFFFFFF0BDC0
	addl	%edx, %ebp
	movl	28(%esp), %ecx          # 4-byte Reload
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%ecx, %ebx
	sbbl	%eax, %ebp
	calll	clock_gettime
	movl	$1000000, %eax          # imm = 0xF4240
	imull	48(%esp)
	movl	%eax, %edi
	movl	%edx, %ecx
	addl	%ebx, %edi
	adcl	%ebp, %ecx
	movl	$274877907, %eax        # imm = 0x10624DD3
	imull	52(%esp)
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$6, %edx
	addl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	addl	%edi, %edx
	movl	%edx, 4(%esp)
	adcl	%ecx, %eax
	movl	%eax, 8(%esp)
	movl	$.L.str, (%esp)
	calll	printf
	movl	65536(%esi), %eax
	movl	%eax, 8(%esp)
	movl	$16384, 4(%esp)         # imm = 0x4000
	movl	$.L.str1, (%esp)
	calll	printf
	jmp	.LBB1_102
.LBB1_101:                              # %relExit
	movl	$.Lfunc1, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB1_102:                              # %relExit
	xorl	%eax, %eax
	addl	$60, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp15:
	.size	main, .Ltmp15-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "[mandelbrot serial]:\t\t[%lld] microseconds\n"
	.size	.L.str, 43

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "buf[%d] = %d\n"
	.size	.L.str1, 14

	.type	.LrelFun,@object        # @relFun
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.LrelFun:
	.asciz	 "Reliability CMP failed in function, exit directly %s\n"
	.size	.LrelFun, 54

	.type	.Lfunc,@object          # @func
	.align	16
.Lfunc:
	.asciz	 "_Z17mandelbrot_serialddddiiiPi"
	.size	.Lfunc, 31

	.type	.Lfunc1,@object         # @func1
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc1:
	.asciz	 "main"
	.size	.Lfunc1, 5


	.section	".note.GNU-stack","",@progbits
