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
	vmovsd	128(%esp), %xmm0
	vsubsd	112(%esp), %xmm0, %xmm0
	movl	152(%esp), %edi
	vmovsd	136(%esp), %xmm1
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_30
# BB#1:                                 # %entry.split25
	vcvtsi2sdl	144(%esp), %xmm0, %xmm2
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_30
# BB#2:                                 # %entry.split25.split
	vdivsd	%xmm2, %xmm0, %xmm3
	vmovsd	%xmm3, 64(%esp)         # 8-byte Spill
	vdivsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 56(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm3
	jne	.LBB0_30
# BB#3:                                 # %entry.split25.split.split
	vsubsd	120(%esp), %xmm1, %xmm0
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_30
# BB#4:                                 # %entry.split25.split.split.split
	vcvtsi2sdl	148(%esp), %xmm0, %xmm1
	xorb	%al, %al
	testb	%al, %al
	jne	.LBB0_30
# BB#5:                                 # %entry.split
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	%xmm2, 40(%esp)         # 8-byte Spill
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm2
	jne	.LBB0_30
# BB#6:                                 # %entry.split.split
	cmpl	$0, 148(%esp)
	jle	.LBB0_31
# BB#7:                                 # %for.cond4.preheader.lr.ph
	cmpl	$0, 144(%esp)
	jle	.LBB0_31
# BB#8:                                 # %for.cond4.preheader.lr.ph.split.us
	movl	144(%esp), %eax
	leal	(,%eax,4), %eax
	movl	%eax, 28(%esp)          # 4-byte Spill
	xorl	%ecx, %ecx
.LBB0_10:                               # %for.body6.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_16 Depth 2
                                        #       Child Loop BB0_20 Depth 3
	movl	%ecx, 52(%esp)          # 4-byte Spill
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	movl	%ecx, %eax
	imull	144(%esp), %eax
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB0_30
# BB#11:                                # %for.body6.lr.ph.us.split24
                                        #   in Loop: Header=BB0_10 Depth=1
	vmovsd	40(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	32(%esp), %xmm2         # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_30
# BB#12:                                # %for.body6.lr.ph.us.split
                                        #   in Loop: Header=BB0_10 Depth=1
	vmovsd	120(%esp), %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 80(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 72(%esp)         # 8-byte Spill
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_30
# BB#13:                                # %for.body6.lr.ph.us.split.split
                                        #   in Loop: Header=BB0_10 Depth=1
	xorl	%ecx, %ecx
	testl	%edi, %edi
	jle	.LBB0_14
.LBB0_16:                               # %for.body.i.preheader.us.us
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_20 Depth 3
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	xorb	%dl, %dl
	testb	%dl, %dl
	jne	.LBB0_30
# BB#17:                                # %for.body.i.preheader.us.us.split
                                        #   in Loop: Header=BB0_16 Depth=2
	vmovsd	64(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	56(%esp), %xmm2         # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB0_30
# BB#18:                                # %for.body.i.preheader.us.us.split.split
                                        #   in Loop: Header=BB0_16 Depth=2
	vmovsd	112(%esp), %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB0_30
# BB#19:                                # %for.body.i.preheader.us.us.split.split.split
                                        #   in Loop: Header=BB0_16 Depth=2
	leal	(%ecx,%eax), %edx
	xorl	%ebp, %ebp
	vmovapd	%xmm2, %xmm5
	vmovsd	80(%esp), %xmm4         # 8-byte Reload
.LBB0_20:                               # %for.body.i.us.us
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm5, %xmm5, %xmm6
	xorb	%bl, %bl
	testb	%bl, %bl
	jne	.LBB0_30
# BB#21:                                # %for.body.i.us.us.split
                                        #   in Loop: Header=BB0_20 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm1
	xorb	%bl, %bl
	testb	%bl, %bl
	jne	.LBB0_30
# BB#22:                                # %for.body.i.us.us.split.split
                                        #   in Loop: Header=BB0_20 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB0_30
# BB#23:                                # %for.body.i.us.us.split.split.split
                                        #   in Loop: Header=BB0_20 Depth=3
	vucomisd	.LCPI0_0, %xmm0
	ja	.LBB0_15
# BB#24:                                # %if.end.i.us.us
                                        #   in Loop: Header=BB0_20 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB0_30
# BB#25:                                # %if.end.i.us.us.split26
                                        #   in Loop: Header=BB0_20 Depth=3
	vaddsd	%xmm5, %xmm5, %xmm1
	xorb	%bl, %bl
	testb	%bl, %bl
	jne	.LBB0_30
# BB#26:                                # %if.end.i.us.us.split26.split
                                        #   in Loop: Header=BB0_20 Depth=3
	vmulsd	%xmm1, %xmm4, %xmm0
	vmulsd	%xmm1, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB0_30
# BB#27:                                # %if.end.i.us.us.split26.split.split
                                        #   in Loop: Header=BB0_20 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm5
	vaddsd	%xmm6, %xmm3, %xmm4
	vucomisd	%xmm4, %xmm5
	jne	.LBB0_30
# BB#28:                                # %if.end.i.us.us.split26.split.split.split
                                        #   in Loop: Header=BB0_20 Depth=3
	vmovsd	80(%esp), %xmm4         # 8-byte Reload
	vaddsd	%xmm0, %xmm4, %xmm4
	vmovsd	72(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm4
	jne	.LBB0_30
# BB#29:                                # %if.end.i.us.us.split
                                        #   in Loop: Header=BB0_20 Depth=3
	incl	%ebp
	movl	%ebp, %esi
	subl	%edi, %esi
	jl	.LBB0_20
.LBB0_15:                               # %_ZL6mandelddi.exit.us.us
                                        #   in Loop: Header=BB0_16 Depth=2
	movl	156(%esp), %esi
	movl	%ebp, (%esi,%edx,4)
	incl	%ecx
	movl	%ecx, %edx
	subl	144(%esp), %edx
	je	.LBB0_9
	jmp	.LBB0_16
.LBB0_14:                               # %for.body6.lr.ph.for.body6.lr.ph.split_crit_edge.us
                                        #   in Loop: Header=BB0_10 Depth=1
	movl	28(%esp), %ecx          # 4-byte Reload
	movl	%ecx, 8(%esp)
	movl	156(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	memset
.LBB0_9:                                # %for.inc13.us
                                        #   in Loop: Header=BB0_10 Depth=1
	movl	52(%esp), %ecx          # 4-byte Reload
	incl	%ecx
	movl	%ecx, %eax
	subl	148(%esp), %eax
	je	.LBB0_31
	jmp	.LBB0_10
.LBB0_30:                               # %relExit
	movl	$.Lfunc, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB0_31:                               # %for.end15
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
	movl	%eax, 28(%esp)          # 4-byte Spill
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
	movl	%edx, 24(%esp)          # 4-byte Spill
	movl	48(%esp), %eax
	movl	%eax, 20(%esp)          # 4-byte Spill
	sarl	$31, %eax
	movl	%eax, 16(%esp)          # 4-byte Spill
	xorl	%esi, %esi
.LBB1_2:                                # %for.body6.lr.ph.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_7 Depth 2
                                        #       Child Loop BB1_11 Depth 3
	vcvtsi2sdl	%esi, %xmm0, %xmm0
	movl	%esi, %eax
	shll	$14, %eax
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#3:                                 # %for.body6.lr.ph.us.i.split
                                        #   in Loop: Header=BB1_2 Depth=1
	vmovsd	.LCPI1_0, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
# BB#4:                                 # %for.body6.lr.ph.us.i.split.split
                                        #   in Loop: Header=BB1_2 Depth=1
	vmovsd	.LCPI1_1, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 40(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	xorl	%ebx, %ebx
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
.LBB1_7:                                # %for.body.i.preheader.us.us.i
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_11 Depth 3
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#8:                                 # %for.body.i.preheader.us.us.i.split
                                        #   in Loop: Header=BB1_7 Depth=2
	vmovsd	.LCPI1_2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
# BB#9:                                 # %for.body.i.preheader.us.us.i.split.split
                                        #   in Loop: Header=BB1_7 Depth=2
	vmovsd	.LCPI1_3, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_5
# BB#10:                                # %for.body.i.preheader.us.us.i.split.split.split
                                        #   in Loop: Header=BB1_7 Depth=2
	leal	(%ebx,%eax), %edi
	xorl	%ecx, %ecx
	vmovapd	%xmm2, %xmm5
	vmovsd	40(%esp), %xmm4         # 8-byte Reload
.LBB1_11:                               # %for.body.i.us.us.i
                                        #   Parent Loop BB1_2 Depth=1
                                        #     Parent Loop BB1_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm5, %xmm5, %xmm6
	xorb	%dl, %dl
	testb	%dl, %dl
	jne	.LBB1_5
# BB#12:                                # %for.body.i.us.us.i.split
                                        #   in Loop: Header=BB1_11 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm1
	xorb	%dl, %dl
	testb	%dl, %dl
	jne	.LBB1_5
# BB#13:                                # %for.body.i.us.us.i.split.split
                                        #   in Loop: Header=BB1_11 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB1_5
# BB#14:                                # %for.body.i.us.us.i.split.split.split
                                        #   in Loop: Header=BB1_11 Depth=3
	vucomisd	.LCPI1_4, %xmm0
	ja	.LBB1_6
# BB#15:                                # %if.end.i.us.us.i
                                        #   in Loop: Header=BB1_11 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_5
# BB#16:                                # %if.end.i.us.us.i.split
                                        #   in Loop: Header=BB1_11 Depth=3
	vaddsd	%xmm5, %xmm5, %xmm1
	xorb	%dl, %dl
	testb	%dl, %dl
	jne	.LBB1_5
# BB#17:                                # %if.end.i.us.us.i.split.split
                                        #   in Loop: Header=BB1_11 Depth=3
	vmulsd	%xmm1, %xmm4, %xmm0
	vmulsd	%xmm1, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_5
# BB#18:                                # %if.end.i.us.us.i.split.split.split
                                        #   in Loop: Header=BB1_11 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm5
	vaddsd	%xmm6, %xmm3, %xmm4
	vucomisd	%xmm4, %xmm5
	jne	.LBB1_5
# BB#19:                                # %if.end.i.us.us.i.split.split.split.split
                                        #   in Loop: Header=BB1_11 Depth=3
	vmovsd	40(%esp), %xmm4         # 8-byte Reload
	vaddsd	%xmm0, %xmm4, %xmm4
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm4
	jne	.LBB1_5
# BB#20:                                # %if.end.i.us.us.i.split.split.split.split.split
                                        #   in Loop: Header=BB1_11 Depth=3
	incl	%ecx
	movl	%ecx, %ebp
	subl	$10, %ebp
	jl	.LBB1_11
.LBB1_6:                                # %_ZL6mandelddi.exit.us.us.i
                                        #   in Loop: Header=BB1_7 Depth=2
	movl	28(%esp), %edx          # 4-byte Reload
	movl	%ecx, (%edx,%edi,4)
	incl	%ebx
	movl	%ebx, %ecx
	subl	$16384, %ecx            # imm = 0x4000
	jne	.LBB1_7
# BB#1:                                 # %for.inc13.us.i
                                        #   in Loop: Header=BB1_2 Depth=1
	incl	%esi
	xorl	%eax, %eax
	movl	%esi, %ecx
	subl	$16384, %ecx            # imm = 0x4000
	jne	.LBB1_2
.LBB1_21:                               # %for.body6.lr.ph.us.i.1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_24 Depth 2
                                        #       Child Loop BB1_28 Depth 3
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movl	%eax, %edx
	shll	$14, %edx
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#22:                                # %for.body6.lr.ph.us.i.1.split
                                        #   in Loop: Header=BB1_21 Depth=1
	vmovsd	.LCPI1_0, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
# BB#23:                                # %for.body6.lr.ph.us.i.1.split.split
                                        #   in Loop: Header=BB1_21 Depth=1
	vmovsd	.LCPI1_1, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 40(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	xorl	%ebx, %ebx
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
.LBB1_24:                               # %for.body.i.preheader.us.us.i.1
                                        #   Parent Loop BB1_21 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_28 Depth 3
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#25:                                # %for.body.i.preheader.us.us.i.1.split
                                        #   in Loop: Header=BB1_24 Depth=2
	vmovsd	.LCPI1_2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
# BB#26:                                # %for.body.i.preheader.us.us.i.1.split.split
                                        #   in Loop: Header=BB1_24 Depth=2
	vmovsd	.LCPI1_3, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_5
# BB#27:                                # %for.body.i.preheader.us.us.i.1.split.split.split
                                        #   in Loop: Header=BB1_24 Depth=2
	leal	(%ebx,%edx), %edi
	xorl	%ebp, %ebp
	vmovapd	%xmm2, %xmm5
	vmovsd	40(%esp), %xmm4         # 8-byte Reload
.LBB1_28:                               # %for.body.i.us.us.i.1
                                        #   Parent Loop BB1_21 Depth=1
                                        #     Parent Loop BB1_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm5, %xmm5, %xmm6
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#29:                                # %for.body.i.us.us.i.1.split45
                                        #   in Loop: Header=BB1_28 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm1
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#30:                                # %for.body.i.us.us.i.1.split
                                        #   in Loop: Header=BB1_28 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB1_5
# BB#31:                                # %for.body.i.us.us.i.1.split.split
                                        #   in Loop: Header=BB1_28 Depth=3
	vucomisd	.LCPI1_4, %xmm0
	ja	.LBB1_38
# BB#32:                                # %if.end.i.us.us.i.1
                                        #   in Loop: Header=BB1_28 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_5
# BB#33:                                # %if.end.i.us.us.i.1.split43
                                        #   in Loop: Header=BB1_28 Depth=3
	vaddsd	%xmm5, %xmm5, %xmm1
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#34:                                # %if.end.i.us.us.i.1.split43.split
                                        #   in Loop: Header=BB1_28 Depth=3
	vmulsd	%xmm1, %xmm4, %xmm0
	vmulsd	%xmm1, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_5
# BB#35:                                # %if.end.i.us.us.i.1.split43.split.split
                                        #   in Loop: Header=BB1_28 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm5
	vaddsd	%xmm6, %xmm3, %xmm4
	vucomisd	%xmm4, %xmm5
	jne	.LBB1_5
# BB#36:                                # %if.end.i.us.us.i.1.split
                                        #   in Loop: Header=BB1_28 Depth=3
	vmovsd	40(%esp), %xmm4         # 8-byte Reload
	vaddsd	%xmm0, %xmm4, %xmm4
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm4
	jne	.LBB1_5
# BB#37:                                # %if.end.i.us.us.i.1.split.split
                                        #   in Loop: Header=BB1_28 Depth=3
	incl	%ebp
	movl	%ebp, %ecx
	subl	$10, %ecx
	jl	.LBB1_28
.LBB1_38:                               # %_ZL6mandelddi.exit.us.us.i.1
                                        #   in Loop: Header=BB1_24 Depth=2
	movl	28(%esp), %ecx          # 4-byte Reload
	movl	%ebp, (%ecx,%edi,4)
	incl	%ebx
	movl	%ebx, %ecx
	subl	$16384, %ecx            # imm = 0x4000
	jne	.LBB1_24
# BB#39:                                # %for.inc13.us.i.1
                                        #   in Loop: Header=BB1_21 Depth=1
	incl	%eax
	xorl	%edx, %edx
	movl	%eax, %ecx
	subl	$16384, %ecx            # imm = 0x4000
	jne	.LBB1_21
.LBB1_40:                               # %for.body6.lr.ph.us.i.2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_43 Depth 2
                                        #       Child Loop BB1_47 Depth 3
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	movl	%edx, %eax
	shll	$14, %eax
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#41:                                # %for.body6.lr.ph.us.i.2.split
                                        #   in Loop: Header=BB1_40 Depth=1
	vmovsd	.LCPI1_0, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
# BB#42:                                # %for.body6.lr.ph.us.i.2.split.split
                                        #   in Loop: Header=BB1_40 Depth=1
	vmovsd	.LCPI1_1, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 40(%esp)         # 8-byte Spill
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	xorl	%ebx, %ebx
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
.LBB1_43:                               # %for.body.i.preheader.us.us.i.2
                                        #   Parent Loop BB1_40 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_47 Depth 3
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#44:                                # %for.body.i.preheader.us.us.i.2.split
                                        #   in Loop: Header=BB1_43 Depth=2
	vmovsd	.LCPI1_2, %xmm2
	vmulsd	%xmm2, %xmm0, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB1_5
# BB#45:                                # %for.body.i.preheader.us.us.i.2.split.split
                                        #   in Loop: Header=BB1_43 Depth=2
	vmovsd	.LCPI1_3, %xmm3
	vaddsd	%xmm3, %xmm1, %xmm2
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm3, %xmm2
	jne	.LBB1_5
# BB#46:                                # %for.body.i.preheader.us.us.i.2.split.split.split
                                        #   in Loop: Header=BB1_43 Depth=2
	leal	(%ebx,%eax), %edi
	xorl	%ebp, %ebp
	vmovapd	%xmm2, %xmm5
	vmovsd	40(%esp), %xmm4         # 8-byte Reload
.LBB1_47:                               # %for.body.i.us.us.i.2
                                        #   Parent Loop BB1_40 Depth=1
                                        #     Parent Loop BB1_43 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm5, %xmm5, %xmm6
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#48:                                # %for.body.i.us.us.i.2.split44
                                        #   in Loop: Header=BB1_47 Depth=3
	vmulsd	%xmm4, %xmm4, %xmm1
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#49:                                # %for.body.i.us.us.i.2.split
                                        #   in Loop: Header=BB1_47 Depth=3
	vaddsd	%xmm1, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm6, %xmm7
	vucomisd	%xmm7, %xmm0
	jne	.LBB1_5
# BB#50:                                # %for.body.i.us.us.i.2.split.split
                                        #   in Loop: Header=BB1_47 Depth=3
	vucomisd	.LCPI1_4, %xmm0
	ja	.LBB1_57
# BB#51:                                # %if.end.i.us.us.i.2
                                        #   in Loop: Header=BB1_47 Depth=3
	vsubsd	%xmm1, %xmm6, %xmm7
	vsubsd	%xmm1, %xmm6, %xmm6
	vucomisd	%xmm6, %xmm7
	jne	.LBB1_5
# BB#52:                                # %if.end.i.us.us.i.2.split
                                        #   in Loop: Header=BB1_47 Depth=3
	vaddsd	%xmm5, %xmm5, %xmm1
	xorb	%cl, %cl
	testb	%cl, %cl
	jne	.LBB1_5
# BB#53:                                # %if.end.i.us.us.i.2.split.split
                                        #   in Loop: Header=BB1_47 Depth=3
	vmulsd	%xmm1, %xmm4, %xmm0
	vmulsd	%xmm1, %xmm4, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB1_5
# BB#54:                                # %if.end.i.us.us.i.2.split.split.split
                                        #   in Loop: Header=BB1_47 Depth=3
	vaddsd	%xmm7, %xmm2, %xmm5
	vaddsd	%xmm6, %xmm3, %xmm4
	vucomisd	%xmm4, %xmm5
	jne	.LBB1_5
# BB#55:                                # %if.end.i.us.us.i.2.split.split.split.split
                                        #   in Loop: Header=BB1_47 Depth=3
	vmovsd	40(%esp), %xmm4         # 8-byte Reload
	vaddsd	%xmm0, %xmm4, %xmm4
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm4
	jne	.LBB1_5
# BB#56:                                # %if.end.i.us.us.i.2.split.split.split.split.split
                                        #   in Loop: Header=BB1_47 Depth=3
	incl	%ebp
	movl	%ebp, %ecx
	subl	$10, %ecx
	jl	.LBB1_47
.LBB1_57:                               # %_ZL6mandelddi.exit.us.us.i.2
                                        #   in Loop: Header=BB1_43 Depth=2
	movl	28(%esp), %ecx          # 4-byte Reload
	movl	%ebp, (%ecx,%edi,4)
	incl	%ebx
	movl	%ebx, %ecx
	subl	$16384, %ecx            # imm = 0x4000
	jne	.LBB1_43
# BB#58:                                # %for.inc13.us.i.2
                                        #   in Loop: Header=BB1_40 Depth=1
	incl	%edx
	movl	%edx, %eax
	subl	$16384, %eax            # imm = 0x4000
	jne	.LBB1_40
# BB#59:                                # %_Z17mandelbrot_serialddddiiiPi.exit.2
	leal	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	movl	$-1000000, %edx         # imm = 0xFFFFFFFFFFF0BDC0
	movl	20(%esp), %ecx          # 4-byte Reload
	movl	%ecx, %eax
	mull	%edx
	movl	%eax, %ebx
	subl	%ecx, %edx
	imull	$-1000000, 16(%esp), %ebp # 4-byte Folded Reload
                                        # imm = 0xFFFFFFFFFFF0BDC0
	addl	%edx, %ebp
	movl	24(%esp), %ecx          # 4-byte Reload
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
	movl	28(%esp), %eax          # 4-byte Reload
	movl	65536(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$16384, 4(%esp)         # imm = 0x4000
	movl	$.L.str1, (%esp)
	calll	printf
	jmp	.LBB1_60
.LBB1_5:                                # %relExit
	movl	$.Lfunc1, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB1_60:                               # %relExit
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
