	.file	"mandelbrot_avx.bc"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4616189618054758400     # double 4
.LCPI0_1:
	.quad	4607182418800017408     # double 1
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
	subl	$60, %esp
	movl	116(%esp), %eax
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovsd	104(%esp), %xmm1
	vsubsd	88(%esp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 24(%esp)         # 8-byte Spill
	movl	112(%esp), %esi
	vcvtsi2sdl	%esi, %xmm0, %xmm0
	vmovsd	96(%esp), %xmm1
	vsubsd	80(%esp), %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 48(%esp)         # 8-byte Spill
	movl	120(%esp), %ebp
	testl	%eax, %eax
	jle	.LBB0_10
# BB#1:                                 # %for.cond4.preheader.lr.ph
	testl	%esi, %esi
	jle	.LBB0_10
# BB#2:                                 # %for.cond4.preheader.lr.ph.split.us
	leal	(,%esi,4), %eax
	movl	%eax, 20(%esp)          # 4-byte Spill
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB0_4:                                # %for.body6.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #       Child Loop BB0_8 Depth 3
	vmovsd	%xmm1, 32(%esp)         # 8-byte Spill
	movl	%ecx, 44(%esp)          # 4-byte Spill
	movl	%ecx, %eax
	imull	%esi, %eax
	vmovsd	24(%esp), %xmm0         # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	88(%esp), %xmm0, %xmm0
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	testl	%ebp, %ebp
	jle	.LBB0_5
	.align	16, 0x90
.LBB0_7:                                # %for.body.i.preheader.us.us
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_8 Depth 3
	leal	(%ecx,%eax), %edx
	vmovsd	48(%esp), %xmm2         # 8-byte Reload
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	80(%esp), %xmm2, %xmm2
	xorl	%ebx, %ebx
	vmovaps	%xmm2, %xmm4
	vmovaps	%xmm0, %xmm3
	.align	16, 0x90
.LBB0_8:                                # %for.body.i.us.us
                                        #   Parent Loop BB0_4 Depth=1
                                        #     Parent Loop BB0_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulsd	%xmm3, %xmm3, %xmm5
	vmulsd	%xmm4, %xmm4, %xmm6
	vaddsd	%xmm5, %xmm6, %xmm7
	vucomisd	.LCPI0_0, %xmm7
	ja	.LBB0_6
# BB#9:                                 # %if.end.i.us.us
                                        #   in Loop: Header=BB0_8 Depth=3
	vsubsd	%xmm5, %xmm6, %xmm5
	vaddsd	%xmm5, %xmm2, %xmm5
	vaddsd	%xmm4, %xmm4, %xmm4
	vmulsd	%xmm4, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm3
	incl	%ebx
	movl	%ebx, %edi
	subl	%ebp, %edi
	vmovaps	%xmm5, %xmm4
	jl	.LBB0_8
.LBB0_6:                                # %_ZL6mandelddi.exit.us.us
                                        #   in Loop: Header=BB0_7 Depth=2
	movl	124(%esp), %edi
	movl	%ebx, (%edi,%edx,4)
	vaddsd	.LCPI0_1, %xmm1, %xmm1
	incl	%ecx
	movl	%ecx, %edx
	subl	%esi, %edx
	je	.LBB0_3
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_5:                                # %for.body6.lr.ph.for.body6.lr.ph.split_crit_edge.us
                                        #   in Loop: Header=BB0_4 Depth=1
	movl	20(%esp), %ecx          # 4-byte Reload
	movl	%ecx, 8(%esp)
	movl	124(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	memset
.LBB0_3:                                # %for.inc13.us
                                        #   in Loop: Header=BB0_4 Depth=1
	vmovsd	32(%esp), %xmm1         # 8-byte Reload
	vaddsd	.LCPI0_1, %xmm1, %xmm1
	movl	44(%esp), %ecx          # 4-byte Reload
	incl	%ecx
	movl	%ecx, %eax
	subl	116(%esp), %eax
	jne	.LBB0_4
.LBB0_10:                               # %for.end15
	addl	$60, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp0:
	.size	_Z17mandelbrot_serialddddiiiPi, .Ltmp0-_Z17mandelbrot_serialddddiiiPi

	.section	.rodata,"a",@progbits
	.align	32
.LCPI1_0:
	.quad	4895412794951729152     # double 1.844674e+19
	.quad	4895412794951729152     # double 1.844674e+19
	.quad	4895412794951729152     # double 1.844674e+19
	.quad	4895412794951729152     # double 1.844674e+19
.LCPI1_1:
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
.LCPI1_2:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_3:
	.quad	4607182418800017408     # double 1
	.text
	.globl	_Z18mandelbrot_genericddddiiiPi
	.align	16, 0x90
	.type	_Z18mandelbrot_genericddddiiiPi,@function
_Z18mandelbrot_genericddddiiiPi:        # @_Z18mandelbrot_genericddddiiiPi
# BB#0:                                 # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$204, %esp
	movl	260(%esp), %eax
	vcvtsi2sdl	%eax, %xmm0, %xmm1
	vmovsd	232(%esp), %xmm0
	vmovsd	248(%esp), %xmm2
	vsubsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm1
	vpermilpd	$0, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vinsertf128	$1, %xmm1, %ymm1, %ymm1
	vmovupd	%ymm1, 32(%esp)         # 32-byte Folded Spill
	vcvtsi2sdl	256(%esp), %xmm0, %xmm2
	vmovsd	224(%esp), %xmm1
	vmovsd	240(%esp), %xmm3
	vsubsd	%xmm1, %xmm3, %xmm3
	vdivsd	%xmm2, %xmm3, %xmm2
	vpermilpd	$0, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	vinsertf128	$1, %xmm2, %ymm2, %ymm2
	vmovupd	%ymm2, 160(%esp)        # 32-byte Folded Spill
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vmovupd	%ymm0, (%esp)           # 32-byte Folded Spill
	vpermilpd	$0, %xmm1, %xmm0 # xmm0 = xmm1[0,0]
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vmovupd	%ymm0, 128(%esp)        # 32-byte Folded Spill
	movl	268(%esp), %edx
	movl	264(%esp), %esi
	testl	%eax, %eax
	jle	.LBB1_11
# BB#1:                                 # %for.body.lr.ph
	movl	%esi, %eax
	sarl	$31, %eax
	vmovd	%esi, %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpinsrd	$2, %esi, %xmm0, %xmm0
	vpinsrd	$3, %eax, %xmm0, %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vmovupd	%ymm0, 96(%esp)         # 32-byte Folded Spill
	movl	$0, 92(%esp)            # 4-byte Folded Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 64(%esp)         # 16-byte Spill
	.align	16, 0x90
.LBB1_2:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_4 Depth 2
                                        #       Child Loop BB1_5 Depth 3
	cmpl	$0, 256(%esp)
	jle	.LBB1_10
# BB#3:                                 # %for.body11.lr.ph
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	92(%esp), %ebx          # 4-byte Reload
	imull	256(%esp), %ebx
	vpermilpd	$0, 64(%esp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[0,0]
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vmovupd	32(%esp), %ymm1         # 32-byte Folded Reload
	vmulpd	%ymm0, %ymm1, %ymm0
	vmovupd	(%esp), %ymm1           # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm5
	xorl	%ebp, %ebp
	.align	16, 0x90
.LBB1_4:                                # %for.body11
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_5 Depth 3
	leal	(%ebp,%ebx), %eax
	movl	%ebp, %ecx
	orl	$1, %ecx
	vmovd	%ebp, %xmm0
	vpinsrd	$1, %ecx, %xmm0, %xmm0
	movl	%ebp, %ecx
	orl	$2, %ecx
	vpinsrd	$2, %ecx, %xmm0, %xmm0
	movl	%ebp, %ecx
	orl	$3, %ecx
	vpinsrd	$3, %ecx, %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %ymm0
	vmovupd	160(%esp), %ymm1        # 32-byte Folded Reload
	vmulpd	%ymm0, %ymm1, %ymm0
	vmovupd	128(%esp), %ymm1        # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vxorpd	%xmm7, %xmm7, %xmm7
	vmovapd	.LCPI1_0, %ymm2
	xorl	%edi, %edi
	testl	%esi, %esi
	vmovapd	%ymm0, %ymm1
	vmovapd	%ymm5, %ymm6
	jle	.LBB1_7
	.align	16, 0x90
.LBB1_5:                                # %for.body.i
                                        #   Parent Loop BB1_2 Depth=1
                                        #     Parent Loop BB1_4 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%edi, %ecx
	sarl	$31, %ecx
	vmovd	%edi, %xmm3
	vpinsrd	$1, %ecx, %xmm3, %xmm3
	vpinsrd	$2, %edi, %xmm3, %xmm3
	vpinsrd	$3, %ecx, %xmm3, %xmm3
	vinsertf128	$1, %xmm3, %ymm3, %ymm3
	vblendvpd	%ymm2, %ymm3, %ymm7, %ymm7
	vmulpd	%ymm6, %ymm6, %ymm3
	vmulpd	%ymm1, %ymm1, %ymm4
	vaddpd	%ymm3, %ymm4, %ymm2
	vcmple_oqpd	.LCPI1_1, %ymm2, %ymm2
	vmovmskpd	%ymm2, %ecx
	testl	%ecx, %ecx
	je	.LBB1_7
# BB#6:                                 # %if.end.i
                                        #   in Loop: Header=BB1_5 Depth=3
	vsubpd	%ymm3, %ymm4, %ymm3
	vaddpd	%ymm3, %ymm0, %ymm3
	vmulpd	.LCPI1_2, %ymm1, %ymm1
	vmulpd	%ymm6, %ymm1, %ymm1
	vaddpd	%ymm1, %ymm5, %ymm6
	incl	%edi
	movl	%edi, %ecx
	subl	%esi, %ecx
	vmovapd	%ymm3, %ymm1
	jl	.LBB1_5
.LBB1_7:                                # %for.end.i
                                        #   in Loop: Header=BB1_4 Depth=2
	subl	%esi, %edi
	vmovupd	96(%esp), %ymm0         # 32-byte Folded Reload
	je	.LBB1_9
# BB#8:                                 # %for.end.i
                                        #   in Loop: Header=BB1_4 Depth=2
	vmovapd	%ymm7, %ymm0
.LBB1_9:                                # %for.end.i
                                        #   in Loop: Header=BB1_4 Depth=2
	vmovd	%xmm0, (%edx,%eax,4)
	vpextrd	$2, %xmm0, 4(%edx,%eax,4)
	vextractf128	$1, %ymm0, %xmm0
	vmovd	%xmm0, 8(%edx,%eax,4)
	vpextrd	$2, %xmm0, 12(%edx,%eax,4)
	addl	$4, %ebp
	movl	%ebp, %eax
	subl	256(%esp), %eax
	jl	.LBB1_4
.LBB1_10:                               # %for.inc40
                                        #   in Loop: Header=BB1_2 Depth=1
	vmovaps	64(%esp), %xmm0         # 16-byte Reload
	vaddsd	.LCPI1_3, %xmm0, %xmm0
	vmovapd	%xmm0, 64(%esp)         # 16-byte Spill
	movl	92(%esp), %eax          # 4-byte Reload
	incl	%eax
	movl	%eax, 92(%esp)          # 4-byte Spill
	subl	260(%esp), %eax
	jne	.LBB1_2
.LBB1_11:                               # %for.end41
	addl	$204, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	vzeroupper
	ret
.Ltmp1:
	.size	_Z18mandelbrot_genericddddiiiPi, .Ltmp1-_Z18mandelbrot_genericddddiiiPi

	.section	.rodata,"a",@progbits
	.align	32
.LCPI2_0:
	.quad	4548635623644200960     # double 1.220703e-04
	.quad	4548635623644200960     # double 1.220703e-04
	.quad	4548635623644200960     # double 1.220703e-04
	.quad	4548635623644200960     # double 1.220703e-04
.LCPI2_1:
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
.LCPI2_2:
	.quad	4550887423457886208     # double 1.831055e-04
	.quad	4550887423457886208     # double 1.831055e-04
	.quad	4550887423457886208     # double 1.831055e-04
	.quad	4550887423457886208     # double 1.831055e-04
.LCPI2_3:
	.quad	-4611686018427387904    # double -2.000000e+00
	.quad	-4611686018427387904    # double -2.000000e+00
	.quad	-4611686018427387904    # double -2.000000e+00
	.quad	-4611686018427387904    # double -2.000000e+00
.LCPI2_4:
	.quad	4895412794951729152     # double 1.844674e+19
	.quad	4895412794951729152     # double 1.844674e+19
	.quad	4895412794951729152     # double 1.844674e+19
	.quad	4895412794951729152     # double 1.844674e+19
.LCPI2_5:
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
.LCPI2_6:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI2_7:
	.long	10                      # 0xa
	.long	0                       # 0x0
	.long	10                      # 0xa
	.long	0                       # 0x0
	.long	10                      # 0xa
	.long	0                       # 0x0
	.long	10                      # 0xa
	.long	0                       # 0x0
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_8:
	.quad	4616189618054758400     # double 4
.LCPI2_9:
	.quad	4607182418800017408     # double 1
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%ebp
.Ltmp7:
	.cfi_def_cfa_offset 8
	pushl	%ebx
.Ltmp8:
	.cfi_def_cfa_offset 12
	pushl	%edi
.Ltmp9:
	.cfi_def_cfa_offset 16
	pushl	%esi
.Ltmp10:
	.cfi_def_cfa_offset 20
	subl	$76, %esp
.Ltmp11:
	.cfi_def_cfa_offset 96
.Ltmp12:
	.cfi_offset %esi, -20
.Ltmp13:
	.cfi_offset %edi, -16
.Ltmp14:
	.cfi_offset %ebx, -12
.Ltmp15:
	.cfi_offset %ebp, -8
	movl	$1073741824, (%esp)     # imm = 0x40000000
	calll	_Znaj
	movl	%eax, %esi
	leal	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	calll	clock_gettime
	movl	$274877907, %eax        # imm = 0x10624DD3
	imull	68(%esp)
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$6, %edx
	addl	%eax, %edx
	movl	%edx, 24(%esp)          # 4-byte Spill
	movl	64(%esp), %eax
	movl	%eax, 20(%esp)          # 4-byte Spill
	sarl	$31, %eax
	movl	%eax, 16(%esp)          # 4-byte Spill
	xorl	%ecx, %ecx
.LBB2_1:                                # %for.body.i.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
                                        #       Child Loop BB2_3 Depth 3
                                        #         Child Loop BB2_4 Depth 4
	movl	%ecx, 28(%esp)          # 4-byte Spill
	xorl	%edx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB2_2:                                # %for.body.i
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_3 Depth 3
                                        #         Child Loop BB2_4 Depth 4
	vmovapd	%xmm0, 32(%esp)         # 16-byte Spill
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vmulpd	.LCPI2_0, %ymm0, %ymm0
	vaddpd	.LCPI2_1, %ymm0, %ymm1
	movl	%edx, %ebx
	shll	$14, %ebx
	xorl	%edi, %edi
	vxorpd	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB2_3:                                # %for.body11.i
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_4 Depth 4
	vmovapd	%xmm3, 48(%esp)         # 16-byte Spill
	movl	%edi, %eax
	orl	$3, %eax
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movl	%edi, %eax
	orl	$2, %eax
	vcvtsi2sdl	%eax, %xmm0, %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	movl	%edi, %eax
	orl	$1, %eax
	vcvtsi2sdl	%eax, %xmm0, %xmm2
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vinsertf128	$1, %xmm0, %ymm2, %ymm0
	vmulpd	.LCPI2_2, %ymm0, %ymm0
	vaddpd	.LCPI2_3, %ymm0, %ymm4
	leal	(%edi,%ebx), %ebp
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovapd	.LCPI2_4, %ymm5
	xorl	%eax, %eax
	vmovapd	%ymm4, %ymm7
	vmovapd	%ymm1, %ymm6
	.align	16, 0x90
.LBB2_4:                                # %for.body.i.i
                                        #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_2 Depth=2
                                        #       Parent Loop BB2_3 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	%eax, %ecx
	sarl	$31, %ecx
	vmovd	%eax, %xmm0
	vpinsrd	$1, %ecx, %xmm0, %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm0
	vpinsrd	$3, %ecx, %xmm0, %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vblendvpd	%ymm5, %ymm0, %ymm3, %ymm3
	vmulpd	%ymm6, %ymm6, %ymm0
	vmulpd	%ymm7, %ymm7, %ymm2
	vaddpd	%ymm0, %ymm2, %ymm5
	vcmple_oqpd	.LCPI2_5, %ymm5, %ymm5
	vmovmskpd	%ymm5, %ecx
	testl	%ecx, %ecx
	je	.LBB2_6
# BB#5:                                 # %if.end.i.i
                                        #   in Loop: Header=BB2_4 Depth=4
	vsubpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vmulpd	.LCPI2_6, %ymm7, %ymm2
	vmulpd	%ymm6, %ymm2, %ymm2
	vaddpd	%ymm2, %ymm1, %ymm6
	incl	%eax
	movl	%eax, %ecx
	subl	$10, %ecx
	vmovapd	%ymm0, %ymm7
	jl	.LBB2_4
.LBB2_6:                                # %for.end.i.i
                                        #   in Loop: Header=BB2_3 Depth=3
	vmovapd	.LCPI2_7, %ymm4
	subl	$10, %eax
	je	.LBB2_8
# BB#7:                                 # %for.end.i.i
                                        #   in Loop: Header=BB2_3 Depth=3
	vmovapd	%ymm3, %ymm4
.LBB2_8:                                # %for.end.i.i
                                        #   in Loop: Header=BB2_3 Depth=3
	vmovd	%xmm4, (%esi,%ebp,4)
	movl	%ebp, %eax
	orl	$1, %eax
	vpextrd	$2, %xmm4, (%esi,%eax,4)
	vextractf128	$1, %ymm4, %xmm0
	movl	%ebp, %eax
	orl	$2, %eax
	vmovd	%xmm0, (%esi,%eax,4)
	orl	$3, %ebp
	vpextrd	$2, %xmm0, (%esi,%ebp,4)
	vmovaps	48(%esp), %xmm3         # 16-byte Reload
	vaddsd	.LCPI2_8, %xmm3, %xmm3
	addl	$4, %edi
	movl	%edi, %eax
	subl	$16384, %eax            # imm = 0x4000
	jl	.LBB2_3
# BB#9:                                 # %for.inc40.i
                                        #   in Loop: Header=BB2_2 Depth=2
	vmovaps	32(%esp), %xmm0         # 16-byte Reload
	vaddsd	.LCPI2_9, %xmm0, %xmm0
	incl	%edx
	movl	%edx, %eax
	subl	$16384, %eax            # imm = 0x4000
	jne	.LBB2_2
# BB#10:                                # %_Z18mandelbrot_genericddddiiiPi.exit
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	28(%esp), %ecx          # 4-byte Reload
	incl	%ecx
	movl	%ecx, %eax
	subl	$3, %eax
	jne	.LBB2_1
# BB#11:                                # %for.end
	leal	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	movl	$-1000000, %ecx         # imm = 0xFFFFFFFFFFF0BDC0
	movl	20(%esp), %edi          # 4-byte Reload
	movl	%edi, %eax
	mull	%ecx
	movl	%eax, %ebx
	subl	%edi, %edx
	imull	$-1000000, 16(%esp), %ebp # 4-byte Folded Reload
                                        # imm = 0xFFFFFFFFFFF0BDC0
	addl	%edx, %ebp
	movl	24(%esp), %ecx          # 4-byte Reload
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%ecx, %ebx
	sbbl	%eax, %ebp
	vzeroupper
	calll	clock_gettime
	movl	$1000000, %eax          # imm = 0xF4240
	imull	64(%esp)
	movl	%eax, %edi
	movl	%edx, %ecx
	addl	%ebx, %edi
	adcl	%ebp, %ecx
	movl	$274877907, %eax        # imm = 0x10624DD3
	imull	68(%esp)
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
	xorl	%eax, %eax
	addl	$76, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp16:
	.size	main, .Ltmp16-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "[mandelbrot intrin]:\t\t[%lld] microseconds\n"
	.size	.L.str, 43

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "buf[%d] = %d\n"
	.size	.L.str1, 14


	.section	".note.GNU-stack","",@progbits
