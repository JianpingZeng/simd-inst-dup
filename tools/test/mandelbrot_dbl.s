	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_1:
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
.LCPI0_2:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.text
	.globl	_Z17mandelbrot_serialddddxxxPx
	.align	16, 0x90
	.type	_Z17mandelbrot_serialddddxxxPx,@function
_Z17mandelbrot_serialddddxxxPx:         # @_Z17mandelbrot_serialddddxxxPx
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp3:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp4:
	.cfi_def_cfa_offset 24
	subq	$136, %rsp
.Ltmp5:
	.cfi_def_cfa_offset 160
.Ltmp6:
	.cfi_offset %rbx, -24
.Ltmp7:
	.cfi_offset %r14, -16
	movq	%rcx, %rbx
	vmovq	%rsi, %xmm4
	vmovlhps	%xmm4, %xmm4, %xmm6 # xmm6 = xmm4[0,0]
	vmovaps	%xmm6, 64(%rsp)         # 16-byte Spill
	vmovq	%rdi, %xmm4
	vmovlhps	%xmm4, %xmm4, %xmm12 # xmm12 = xmm4[0,0]
	vmovaps	%xmm12, (%rsp)          # 16-byte Spill
	vpxor	%xmm5, %xmm5, %xmm5
	vpcmpgtq	%xmm5, %xmm6, %xmm4
	vpcmpgtq	%xmm5, %xmm12, %xmm5
	vpand	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB0_11
# BB#1:                                 # %for.cond4.preheader.lr.ph.split.us
	vmovq	%rdx, %xmm4
	vmovlhps	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vpxor	%xmm5, %xmm5, %xmm5
	vpcmpgtq	%xmm5, %xmm4, %xmm5
	vptest	%xmm5, %xmm5
	je	.LBB0_9
# BB#2:
	vpermilpd	$0, %xmm1, %xmm5 # xmm5 = xmm1[0,0]
	vmovapd	%xmm5, 48(%rsp)         # 16-byte Spill
	vpermilpd	$0, %xmm3, %xmm1 # xmm1 = xmm3[0,0]
	vpermilpd	$0, %xmm0, %xmm3 # xmm3 = xmm0[0,0]
	vmovapd	%xmm3, 112(%rsp)        # 16-byte Spill
	vpermilpd	$0, %xmm2, %xmm0 # xmm0 = xmm2[0,0]
	vsubpd	%xmm3, %xmm0, %xmm0
	vpextrq	$1, %xmm12, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vmovq	%xmm12, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm3
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vdivpd	%xmm2, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	vsubpd	%xmm5, %xmm1, %xmm0
	vpextrq	$1, %xmm6, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm6, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vunpcklpd	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vpsrlq	$32, %xmm12, %xmm0
	vmovdqa	%xmm0, 16(%rsp)         # 16-byte Spill
	vmovapd	.LCPI0_1(%rip), %xmm15
	vmovdqa	.LCPI0_0(%rip), %xmm11
	vmovapd	.LCPI0_2(%rip), %xmm14
	vxorpd	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB0_8:                                # %for.body.i.preheader.us.us.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #       Child Loop BB0_4 Depth 3
	vmovapd	%xmm2, 80(%rsp)         # 16-byte Spill
	vpmuludq	%xmm12, %xmm2, %xmm0
	vpmuludq	16(%rsp), %xmm2, %xmm1 # 16-byte Folded Reload
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpsrlq	$32, %xmm2, %xmm1
	vpmuludq	%xmm12, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm13
	vpextrq	$1, %xmm2, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm2, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	32(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vaddpd	48(%rsp), %xmm0, %xmm6  # 16-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB0_3:                                # %for.body.i.preheader.us.us.us
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_4 Depth 3
	vpextrq	$1, %xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm0, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vunpcklpd	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovapd	96(%rsp), %xmm2         # 16-byte Reload
	vmulpd	%xmm1, %xmm2, %xmm1
	vaddpd	112(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vpaddq	%xmm13, %xmm0, %xmm2
	vpextrq	$1, %xmm2, %rax
	vmovapd	%xmm1, %xmm3
	vmovapd	%xmm6, %xmm5
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB0_4:                                # %for.body.i.us.us.us
                                        #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulpd	%xmm3, %xmm3, %xmm8
	vmulpd	%xmm5, %xmm5, %xmm9
	vaddpd	%xmm9, %xmm8, %xmm10
	vcmpltpd	%xmm10, %xmm15, %xmm7
	vptest	%xmm7, %xmm7
	jne	.LBB0_6
# BB#5:                                 # %if.end.i.us.us.us
                                        #   in Loop: Header=BB0_4 Depth=3
	vsubpd	%xmm9, %xmm8, %xmm7
	vmulpd	%xmm14, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm5, %xmm5
	vaddpd	%xmm7, %xmm1, %xmm3
	vaddpd	%xmm5, %xmm6, %xmm5
	vpaddq	%xmm11, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm4, %xmm7
	vptest	%xmm7, %xmm7
	jne	.LBB0_4
.LBB0_6:                                # %_ZL6mandelddx.exit.us.us.us
                                        #   in Loop: Header=BB0_3 Depth=2
	vpextrq	$1, %xmm2, (%rbx,%rax,8)
	vpaddq	%xmm11, %xmm0, %xmm0
	vpcmpeqq	%xmm12, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_3
# BB#7:                                 # %for.inc13.us.us
                                        #   in Loop: Header=BB0_8 Depth=1
	vmovdqa	80(%rsp), %xmm2         # 16-byte Reload
	vpaddq	%xmm11, %xmm2, %xmm2
	vmovdqa	64(%rsp), %xmm0         # 16-byte Reload
	vpcmpeqq	%xmm0, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_8
	jmp	.LBB0_11
.LBB0_9:
	vpsllq	$3, %xmm12, %xmm0
	vpextrq	$1, %xmm0, %r14
	vpsrlq	$32, %xmm12, %xmm0
	vmovdqa	%xmm0, 112(%rsp)        # 16-byte Spill
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB0_10:                               # %for.inc13.us
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm2, 80(%rsp)         # 16-byte Spill
	vpmuludq	%xmm12, %xmm2, %xmm0
	vpmuludq	112(%rsp), %xmm2, %xmm1 # 16-byte Folded Reload
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpsrlq	$32, %xmm2, %xmm1
	vpmuludq	%xmm12, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	leaq	(%rbx,%rax,8), %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	memset
	vmovdqa	80(%rsp), %xmm2         # 16-byte Reload
	vmovaps	(%rsp), %xmm12          # 16-byte Reload
	vmovdqa	64(%rsp), %xmm0         # 16-byte Reload
	vpaddq	.LCPI0_0(%rip), %xmm2, %xmm2
	vpcmpeqq	%xmm0, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_10
.LBB0_11:                               # %for.end15
	addq	$136, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp8:
	.size	_Z17mandelbrot_serialddddxxxPx, .Ltmp8-_Z17mandelbrot_serialddddxxxPx
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	4548635623644200960     # double 1.220703e-04
	.quad	4548635623644200960     # double 1.220703e-04
.LCPI1_1:
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
.LCPI1_2:
	.quad	4550887423457886208     # double 1.831055e-04
	.quad	4550887423457886208     # double 1.831055e-04
.LCPI1_3:
	.quad	-4611686018427387904    # double -2.000000e+00
	.quad	-4611686018427387904    # double -2.000000e+00
.LCPI1_4:
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
.LCPI1_5:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI1_6:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI1_7:
	.quad	10                      # 0xa
	.quad	10                      # 0xa
.LCPI1_8:
	.quad	16384                   # 0x4000
	.quad	16384                   # 0x4000
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$24, %rsp
.Ltmp10:
	.cfi_def_cfa_offset 32
	movl	$2147483648, %edi       # imm = 0x80000000
	callq	_Znam
	vpxor	%xmm1, %xmm1, %xmm1
	vmovapd	.LCPI1_4(%rip), %xmm10
	vmovdqa	.LCPI1_6(%rip), %xmm12
	vmovdqa	.LCPI1_8(%rip), %xmm13
	vmovapd	.LCPI1_5(%rip), %xmm15
	vmovdqa	.LCPI1_7(%rip), %xmm9
	.align	16, 0x90
.LBB1_1:                                # %for.body6.lr.ph.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_19 Depth 2
                                        #       Child Loop BB1_20 Depth 3
	vmovdqa	%xmm1, (%rsp)           # 16-byte Spill
	vpsllq	$14, %xmm1, %xmm14
	vpextrq	$1, %xmm1, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vmovq	%xmm1, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI1_0(%rip), %xmm0, %xmm0
	vaddpd	.LCPI1_1(%rip), %xmm0, %xmm8
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB1_19:                               # %for.body.i.preheader.us.us.i
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_20 Depth 3
	vpextrq	$1, %xmm3, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vmovq	%xmm3, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI1_2(%rip), %xmm0, %xmm0
	vaddpd	.LCPI1_3(%rip), %xmm0, %xmm7
	vpaddq	%xmm14, %xmm3, %xmm0
	vpextrq	$1, %xmm0, %rcx
	vpxor	%xmm6, %xmm6, %xmm6
	vmovapd	%xmm7, %xmm1
	vmovapd	%xmm8, %xmm2
	.align	16, 0x90
.LBB1_20:                               # %for.body.i.us.us.i
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulpd	%xmm1, %xmm1, %xmm0
	vmulpd	%xmm2, %xmm2, %xmm4
	vaddpd	%xmm4, %xmm0, %xmm11
	vcmpltpd	%xmm11, %xmm10, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_18
# BB#21:                                # %if.end.i.us.us.i
                                        #   in Loop: Header=BB1_20 Depth=3
	vsubpd	%xmm4, %xmm0, %xmm0
	vmulpd	%xmm15, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm2, %xmm2
	vaddpd	%xmm0, %xmm7, %xmm1
	vaddpd	%xmm2, %xmm8, %xmm2
	vpaddq	%xmm12, %xmm6, %xmm6
	vpcmpgtq	%xmm6, %xmm9, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB1_20
.LBB1_18:                               # %_ZL6mandelddx.exit.us.us.i
                                        #   in Loop: Header=BB1_19 Depth=2
	vpextrq	$1, %xmm6, (%rax,%rcx,8)
	vpaddq	%xmm12, %xmm3, %xmm3
	vpcmpeqq	%xmm13, %xmm3, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_19
# BB#2:                                 # %for.inc13.us.i
                                        #   in Loop: Header=BB1_1 Depth=1
	vmovdqa	(%rsp), %xmm1           # 16-byte Reload
	vpaddq	%xmm12, %xmm1, %xmm1
	vpcmpeqq	%xmm13, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_1
# BB#3:
	vxorpd	%xmm11, %xmm11, %xmm11
	.align	16, 0x90
.LBB1_4:                                # %for.body6.lr.ph.us.i.1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
                                        #       Child Loop BB1_6 Depth 3
	vpsllq	$14, %xmm11, %xmm14
	vpextrq	$1, %xmm11, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vmovq	%xmm11, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI1_0(%rip), %xmm0, %xmm0
	vaddpd	.LCPI1_1(%rip), %xmm0, %xmm0
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB1_5:                                # %for.body.i.preheader.us.us.i.1
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_6 Depth 3
	vpextrq	$1, %xmm3, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vmovq	%xmm3, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm2
	vunpcklpd	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmulpd	.LCPI1_2(%rip), %xmm1, %xmm1
	vaddpd	.LCPI1_3(%rip), %xmm1, %xmm1
	vpaddq	%xmm14, %xmm3, %xmm2
	vpextrq	$1, %xmm2, %rcx
	vmovapd	%xmm1, %xmm7
	vmovapd	%xmm0, %xmm2
	vpxor	%xmm6, %xmm6, %xmm6
	.align	16, 0x90
.LBB1_6:                                # %for.body.i.us.us.i.1
                                        #   Parent Loop BB1_4 Depth=1
                                        #     Parent Loop BB1_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulpd	%xmm7, %xmm7, %xmm4
	vmulpd	%xmm2, %xmm2, %xmm8
	vaddpd	%xmm8, %xmm4, %xmm5
	vcmpltpd	%xmm5, %xmm10, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_8
# BB#7:                                 # %if.end.i.us.us.i.1
                                        #   in Loop: Header=BB1_6 Depth=3
	vsubpd	%xmm8, %xmm4, %xmm4
	vmulpd	%xmm15, %xmm7, %xmm5
	vmulpd	%xmm5, %xmm2, %xmm2
	vaddpd	%xmm4, %xmm1, %xmm7
	vaddpd	%xmm2, %xmm0, %xmm2
	vpaddq	%xmm12, %xmm6, %xmm6
	vpcmpgtq	%xmm6, %xmm9, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB1_6
.LBB1_8:                                # %_ZL6mandelddx.exit.us.us.i.1
                                        #   in Loop: Header=BB1_5 Depth=2
	vpextrq	$1, %xmm6, (%rax,%rcx,8)
	vpaddq	%xmm12, %xmm3, %xmm3
	vpcmpeqq	%xmm13, %xmm3, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB1_5
# BB#9:                                 # %for.inc13.us.i.1
                                        #   in Loop: Header=BB1_4 Depth=1
	vpaddq	%xmm12, %xmm11, %xmm11
	vpcmpeqq	%xmm13, %xmm11, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_4
# BB#10:
	vpxor	%xmm11, %xmm11, %xmm11
	.align	16, 0x90
.LBB1_11:                               # %for.body6.lr.ph.us.i.2
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_12 Depth 2
                                        #       Child Loop BB1_13 Depth 3
	vpsllq	$14, %xmm11, %xmm14
	vpextrq	$1, %xmm11, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vmovq	%xmm11, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI1_0(%rip), %xmm0, %xmm0
	vaddpd	.LCPI1_1(%rip), %xmm0, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB1_12:                               # %for.body.i.preheader.us.us.i.2
                                        #   Parent Loop BB1_11 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_13 Depth 3
	vpextrq	$1, %xmm3, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vmovq	%xmm3, %rcx
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI1_2(%rip), %xmm0, %xmm0
	vaddpd	.LCPI1_3(%rip), %xmm0, %xmm1
	vpaddq	%xmm14, %xmm3, %xmm0
	vpextrq	$1, %xmm0, %rcx
	vmovapd	%xmm1, %xmm7
	vmovapd	%xmm2, %xmm0
	vpxor	%xmm6, %xmm6, %xmm6
	.align	16, 0x90
.LBB1_13:                               # %for.body.i.us.us.i.2
                                        #   Parent Loop BB1_11 Depth=1
                                        #     Parent Loop BB1_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmulpd	%xmm7, %xmm7, %xmm4
	vmulpd	%xmm0, %xmm0, %xmm8
	vaddpd	%xmm8, %xmm4, %xmm5
	vcmpltpd	%xmm5, %xmm10, %xmm5
	vptest	%xmm5, %xmm5
	jne	.LBB1_15
# BB#14:                                # %if.end.i.us.us.i.2
                                        #   in Loop: Header=BB1_13 Depth=3
	vsubpd	%xmm8, %xmm4, %xmm4
	vmulpd	%xmm15, %xmm7, %xmm5
	vmulpd	%xmm5, %xmm0, %xmm0
	vaddpd	%xmm4, %xmm1, %xmm7
	vaddpd	%xmm0, %xmm2, %xmm0
	vpaddq	%xmm12, %xmm6, %xmm6
	vpcmpgtq	%xmm6, %xmm9, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB1_13
.LBB1_15:                               # %_ZL6mandelddx.exit.us.us.i.2
                                        #   in Loop: Header=BB1_12 Depth=2
	vpextrq	$1, %xmm6, (%rax,%rcx,8)
	vpaddq	%xmm12, %xmm3, %xmm3
	vpcmpeqq	%xmm13, %xmm3, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_12
# BB#16:                                # %for.inc13.us.i.2
                                        #   in Loop: Header=BB1_11 Depth=1
	vpaddq	%xmm12, %xmm11, %xmm11
	vpcmpeqq	%xmm13, %xmm11, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_11
# BB#17:                                # %_Z17mandelbrot_serialddddxxxPx.exit.2
	movq	131072(%rax), %rdx
	movl	$.L.str, %edi
	movl	$16384, %esi            # imm = 0x4000
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$24, %rsp
	ret
.Ltmp11:
	.size	main, .Ltmp11-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"buf[%d] = %d\n"
	.size	.L.str, 14


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
