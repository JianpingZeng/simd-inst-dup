	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI0_1:
	.quad	9223372036854775804     # 0x7ffffffffffffffc
	.quad	9223372036854775804     # 0x7ffffffffffffffc
.LCPI0_2:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI0_3:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_4:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI0_5:
	.quad	4614256656552045848     # double 3.141593e+00
	.quad	4614256656552045848     # double 3.141593e+00
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
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
	subq	$168, %rsp
.Ltmp13:
	.cfi_def_cfa_offset 224
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
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	.LCPI0_0(%rip), %xmm1
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_39
# BB#1:                                 # %if.end
	movq	8(%rsi), %rdi
	xorl	%eax, %eax
	callq	atoi
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm1, %rbp
	movslq	%ebp, %rax
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %r13
	movslq	%r13d, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	%xmm0, 112(%rsp)        # 16-byte Spill
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %r14
	vmovq	%r14, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 144(%rsp)        # 16-byte Spill
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, %rbx
	vmovq	%rbx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vpsllq	$2, %xmm0, %xmm0
	vpand	.LCPI0_1(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %r12
	movq	%r12, %rdi
	callq	malloc
	movq	%rax, %r15
	vmovq	%r15, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 112(%rsp)        # 16-byte Spill
	movq	%r12, %rdi
	callq	malloc
	movq	%rax, %r12
	vmovq	%r12, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm1 # xmm1 = xmm0[0,0]
	vxorps	%xmm0, %xmm0, %xmm0
	vmovdqa	144(%rsp), %xmm2        # 16-byte Reload
	vpcmpeqq	%xmm0, %xmm2, %xmm2
	vmovdqa	128(%rsp), %xmm3        # 16-byte Reload
	vpcmpeqq	%xmm0, %xmm3, %xmm3
	vpcmpeqd	%xmm4, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vpandn	%xmm3, %xmm2, %xmm2
	vmovdqa	112(%rsp), %xmm3        # 16-byte Reload
	vpcmpeqq	%xmm0, %xmm3, %xmm3
	vpandn	%xmm2, %xmm3, %xmm2
	vpcmpeqq	%xmm0, %xmm1, %xmm1
	vpandn	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_40
# BB#2:                                 # %cond.end
	movslq	%ebp, %rax
	vmovq	%rax, %xmm1
	movslq	%r13d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	vmovdqa	32(%rsp), %xmm3         # 16-byte Reload
	je	.LBB0_38
# BB#3:
	vmovdqa	.LCPI0_2(%rip), %xmm2
	vmovdqa	.LCPI0_3(%rip), %xmm8
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	vpand	%xmm2, %xmm3, %xmm4
	.align	16, 0x90
.LBB0_4:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rcx
	vpand	%xmm2, %xmm0, %xmm1
	vpcmpeqq	%xmm8, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_6
# BB#5:                                 # %if.then.i
                                        #   in Loop: Header=BB0_4 Depth=1
	movq	%rax, (%r14,%rcx,8)
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_6:                                # %if.else.i
                                        #   in Loop: Header=BB0_4 Depth=1
	movq	$0, (%r14,%rcx,8)
.LBB0_7:                                # %for.inc.i
                                        #   in Loop: Header=BB0_4 Depth=1
	movq	$0, (%rbx,%rcx,8)
	vpaddq	%xmm8, %xmm0, %xmm0
	vpand	%xmm2, %xmm0, %xmm1
	vpcmpeqq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_4
# BB#8:                                 # %init_array.exit
	movslq	%ebp, %rax
	vmovq	%rax, %xmm0
	movslq	%r13d, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	.LCPI0_3(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_38
# BB#9:
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	%xmm3, %xmm0
	.align	16, 0x90
.LBB0_10:                               # %for.body.i.i
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm1, %xmm5
	vpextrq	$1, %xmm0, %rax
	cltq
	sarq	%rax
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	sarq	%rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpaddq	%xmm8, %xmm5, %xmm1
	vpcmpgtq	%xmm8, %xmm0, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_10
# BB#11:                                # %for.body.lr.ph.i
	movslq	%ebp, %rax
	movq	%rbp, 24(%rsp)          # 8-byte Spill
	movq	%rax, %rcx
	shrq	$63, %rcx
	addq	%rax, %rcx
	sarq	%rcx
	vmovq	%rcx, %xmm0
	movslq	%r13d, %rcx
	movq	%r13, 16(%rsp)          # 8-byte Spill
	movq	%rcx, %rdx
	shrq	$63, %rdx
	addq	%rcx, %rdx
	sarq	%rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vcvtsi2sdq	%rcx, %xmm0, %xmm3
	vunpcklpd	%xmm2, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm2[0]
	vmovapd	%xmm3, 80(%rsp)         # 16-byte Spill
	vpcmpgtq	%xmm6, %xmm5, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_26
# BB#12:
	vmovdqa	%xmm5, 64(%rsp)         # 16-byte Spill
	vmovdqa	%xmm4, (%rsp)           # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	cltq
	movq	%rax, 56(%rsp)          # 8-byte Spill
	vmovq	%xmm0, %rax
	movslq	%eax, %rbp
	.align	16, 0x90
.LBB0_13:                               # %for.body.i25.preheader.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm6, %xmm2
	vmovdqa	.LCPI0_2(%rip), %xmm5
	vmovdqa	64(%rsp), %xmm7         # 16-byte Reload
	.align	16, 0x90
.LBB0_14:                               # %for.body.i25.us.i
                                        #   Parent Loop BB0_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddq	%xmm1, %xmm1, %xmm1
	vpand	%xmm8, %xmm2, %xmm3
	vmovq	%xmm2, %rax
	cltq
	vpextrq	$1, %xmm2, %rcx
	movslq	%ecx, %rcx
	vpor	%xmm1, %xmm3, %xmm1
	sarq	%rcx
	vmovq	%rcx, %xmm2
	sarq	%rax
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpaddq	%xmm8, %xmm0, %xmm0
	vpand	%xmm5, %xmm0, %xmm3
	vpand	%xmm5, %xmm7, %xmm4
	vpcmpeqq	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB0_14
# BB#15:                                # %bitrev.exit.us.i
                                        #   in Loop: Header=BB0_13 Depth=1
	vpextrq	$1, %xmm1, %r13
	vpextrq	$1, %xmm6, %rax
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm6, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI0_4(%rip), %xmm0, %xmm0
	vmulpd	.LCPI0_5(%rip), %xmm0, %xmm0
	vdivpd	80(%rsp), %xmm0, %xmm0  # 16-byte Folded Reload
	vmovapd	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovdqa	%xmm6, 144(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	vmovapd	128(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 112(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	96(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovhpd	%xmm0, (%r15,%r13,8)
	vmovaps	128(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovapd	112(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovdqa	144(%rsp), %xmm6        # 16-byte Reload
	vmovdqa	.LCPI0_3(%rip), %xmm8
	vmovapd	128(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovhpd	%xmm0, (%r12,%r13,8)
	vpaddq	%xmm8, %xmm6, %xmm6
	vmovq	56(%rsp), %xmm1         # 8-byte Folded Reload
	vmovq	%rbp, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm6, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_13
# BB#16:
	vmovdqa	32(%rsp), %xmm9         # 16-byte Reload
	jmp	.LBB0_17
.LBB0_26:
	vmovdqa	%xmm4, (%rsp)           # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	movslq	%eax, %r13
	vmovq	%xmm0, %rax
	movslq	%eax, %rbp
	.align	16, 0x90
.LBB0_27:                               # %bitrev.exit.i
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm6, 144(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm6, %rax
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm6, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI0_4(%rip), %xmm0, %xmm0
	vmulpd	.LCPI0_5(%rip), %xmm0, %xmm0
	vdivpd	%xmm3, %xmm0, %xmm0
	vmovapd	%xmm0, 128(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	vmovapd	128(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 112(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	96(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovhpd	%xmm0, (%r15)
	vmovaps	128(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovapd	112(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovdqa	80(%rsp), %xmm3         # 16-byte Reload
	vmovdqa	144(%rsp), %xmm6        # 16-byte Reload
	vmovapd	128(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovhpd	%xmm0, (%r12)
	vpaddq	.LCPI0_3(%rip), %xmm6, %xmm6
	vmovq	%r13, %xmm1
	vmovq	%rbp, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm6, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_27
# BB#28:
	vmovdqa	32(%rsp), %xmm9         # 16-byte Reload
	vmovdqa	.LCPI0_3(%rip), %xmm8
.LBB0_17:                               # %for.body3.lr.ph.us.i57
	movq	24(%rsp), %rdi          # 8-byte Reload
	movq	16(%rsp), %rbp          # 8-byte Reload
	.align	16, 0x90
.LBB0_18:                               # %for.body3.lr.ph.us.i57
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_32 Depth 2
                                        #       Child Loop BB0_30 Depth 3
	vpextrq	$1, %xmm9, %rax
	cltq
	movq	%rax, %rcx
	sarq	%rcx
	vmovq	%rcx, %xmm0
	vmovq	%xmm9, %rcx
	movslq	%ecx, %rcx
	movq	%rcx, %rdx
	sarq	%rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm13 # xmm13 = xmm1[0],xmm0[0]
	vpxor	%xmm12, %xmm12, %xmm12
	vpcmpgtq	%xmm12, %xmm13, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_19
# BB#29:                                #   in Loop: Header=BB0_18 Depth=1
	vmovq	%rax, %xmm0
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vmovdqa	%xmm0, 144(%rsp)        # 16-byte Spill
	movslq	%edi, %rax
	movslq	%ebp, %rcx
	vpxor	%xmm10, %xmm10, %xmm10
	vpxor	%xmm11, %xmm11, %xmm11
	.align	16, 0x90
.LBB0_32:                               # %for.body8.us.preheader.us.i89
                                        #   Parent Loop BB0_18 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_30 Depth 3
	vpextrq	$1, %xmm10, %rdx
	vmovddup	(%r15,%rdx,8), %xmm14
	vmovsd	(%r12,%rdx,8), %xmm0
	vpermilpd	$0, %xmm0, %xmm15 # xmm15 = xmm0[0,0]
	vpaddq	%xmm13, %xmm12, %xmm3
	vmovdqa	%xmm11, %xmm5
	vmovdqa	%xmm12, %xmm2
	.align	16, 0x90
.LBB0_30:                               # %for.body8.us.us.i77
                                        #   Parent Loop BB0_18 Depth=1
                                        #     Parent Loop BB0_32 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm5, %rdx
	vpaddq	%xmm13, %xmm5, %xmm0
	vpextrq	$1, %xmm0, %rsi
	vmovddup	(%r14,%rsi,8), %xmm0
	vmulpd	%xmm0, %xmm14, %xmm4
	vmovddup	(%rbx,%rsi,8), %xmm1
	vmulpd	%xmm1, %xmm15, %xmm6
	vsubpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm14, %xmm1
	vmulpd	%xmm0, %xmm15, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	(%r14,%rdx,8), %xmm1
	vmovddup	(%rbx,%rdx,8), %xmm6
	vaddpd	%xmm4, %xmm1, %xmm7
	vmovhpd	%xmm7, (%r14,%rdx,8)
	vaddpd	%xmm0, %xmm6, %xmm7
	vmovhpd	%xmm7, (%rbx,%rdx,8)
	vsubpd	%xmm4, %xmm1, %xmm1
	vmovhpd	%xmm1, (%r14,%rsi,8)
	vsubpd	%xmm0, %xmm6, %xmm0
	vmovhpd	%xmm0, (%rbx,%rsi,8)
	vpaddq	%xmm8, %xmm2, %xmm2
	vpaddq	%xmm8, %xmm5, %xmm5
	vpcmpgtq	%xmm2, %xmm3, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_30
# BB#31:                                # %for.inc43.us.us.i82
                                        #   in Loop: Header=BB0_32 Depth=2
	vpaddq	%xmm9, %xmm12, %xmm12
	vpaddq	%xmm8, %xmm10, %xmm10
	vmovq	%rax, %xmm1
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpaddq	144(%rsp), %xmm11, %xmm11 # 16-byte Folded Reload
	vpcmpgtq	%xmm12, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_32
	jmp	.LBB0_21
	.align	16, 0x90
.LBB0_19:                               #   in Loop: Header=BB0_18 Depth=1
	movslq	%edi, %rax
	vmovq	%rax, %xmm0
	movslq	%ebp, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	.align	16, 0x90
.LBB0_20:                               # %for.inc43.us.i51
                                        #   Parent Loop BB0_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddq	%xmm9, %xmm12, %xmm12
	vpcmpgtq	%xmm12, %xmm0, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_20
.LBB0_21:                               # %for.cond.loopexit.us.i53
                                        #   in Loop: Header=BB0_18 Depth=1
	vpcmpgtq	.LCPI0_3(%rip), %xmm13, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	%xmm13, %xmm9
	jne	.LBB0_18
# BB#22:
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	32(%rsp), %xmm3         # 16-byte Reload
	.align	16, 0x90
.LBB0_23:                               # %for.body.i.i57
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm1, %xmm0
	vpextrq	$1, %xmm3, %rax
	cltq
	sarq	%rax
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	sarq	%rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm3 # xmm3 = xmm2[0],xmm1[0]
	vpaddq	%xmm8, %xmm0, %xmm1
	vpcmpgtq	%xmm8, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_23
# BB#24:                                # %for.body.lr.ph.i59
	vpcmpeqd	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	.LCPI0_2(%rip), %xmm7
	vmovdqa	(%rsp), %xmm9           # 16-byte Reload
	je	.LBB0_38
# BB#25:
	vpxor	%xmm0, %xmm0, %xmm0
	vpand	%xmm7, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB0_37:                               # %for.body.i38.preheader.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_33 Depth 2
	vpextrq	$1, %xmm0, %rax
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	vmovdqa	%xmm2, %xmm5
	.align	16, 0x90
.LBB0_33:                               # %for.body.i38.us.i
                                        #   Parent Loop BB0_37 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddq	%xmm3, %xmm3, %xmm3
	vpand	%xmm8, %xmm5, %xmm6
	vmovq	%xmm5, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm5, %rdx
	movslq	%edx, %rdx
	vpor	%xmm3, %xmm6, %xmm3
	sarq	%rdx
	vmovq	%rdx, %xmm5
	sarq	%rcx
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vpaddq	%xmm8, %xmm4, %xmm4
	vpand	%xmm7, %xmm4, %xmm6
	vpcmpeqq	%xmm1, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	je	.LBB0_33
# BB#34:                                # %bitrev.exit.us.i67
                                        #   in Loop: Header=BB0_37 Depth=1
	movslq	%eax, %rcx
	vmovq	%rcx, %xmm4
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vpextrq	$1, %xmm3, %rcx
	movslq	%ecx, %rdx
	vmovq	%rdx, %xmm5
	vmovq	%xmm3, %rdx
	movslq	%edx, %rsi
	vmovq	%rsi, %xmm3
	vpunpcklqdq	%xmm5, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm5[0]
	vpcmpgtq	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB0_36
# BB#35:                                # %if.end.us.i
                                        #   in Loop: Header=BB0_37 Depth=1
	vmovsd	(%r14,%rax,8), %xmm3
	vmovsd	(%rbx,%rax,8), %xmm4
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm5
	movslq	%edx, %rcx
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vpextrq	$1, %xmm5, %rcx
	vmovsd	(%r14,%rcx,8), %xmm5
	vmovsd	%xmm5, (%r14,%rax,8)
	vmovsd	(%rbx,%rcx,8), %xmm5
	vmovsd	%xmm5, (%rbx,%rax,8)
	vmovsd	%xmm3, (%r14,%rcx,8)
	vmovsd	%xmm4, (%rbx,%rcx,8)
.LBB0_36:                               # %for.inc.us.i
                                        #   in Loop: Header=BB0_37 Depth=1
	vpaddq	%xmm8, %xmm0, %xmm0
	vpaddq	%xmm8, %xmm2, %xmm2
	vpand	%xmm7, %xmm0, %xmm3
	vpcmpeqq	%xmm9, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB0_37
.LBB0_38:                               # %permute_bitrev.exit
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	free
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	movq	%r15, %rdi
	callq	free
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB0_39:                               # %if.then
	movq	stderr(%rip), %rax
	movl	$.L.str, %edi
	movl	$23, %esi
	movl	$1, %edx
	movq	%rax, %rcx
	callq	fwrite
	movl	$-1, %edi
	callq	exit
.LBB0_40:                               # %cond.false
	movl	$.L.str1, %edi
	movl	$.L.str2, %esi
	movl	$42, %edx
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	callq	__assert_fail
.Ltmp20:
	.size	main, .Ltmp20-main
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI1_1:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	init_array
	.align	16, 0x90
	.type	init_array,@function
init_array:                             # @init_array
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm3
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpgtq	%xmm0, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB1_6
# BB#1:
	vmovdqa	.LCPI1_0(%rip), %xmm1
	vmovdqa	.LCPI1_1(%rip), %xmm2
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	vpand	%xmm1, %xmm3, %xmm3
	.align	16, 0x90
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rcx
	vpand	%xmm1, %xmm0, %xmm4
	vpcmpeqq	%xmm2, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB1_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB1_2 Depth=1
	movq	%rax, (%rsi,%rcx,8)
	jmp	.LBB1_5
	.align	16, 0x90
.LBB1_4:                                # %if.else
                                        #   in Loop: Header=BB1_2 Depth=1
	movq	$0, (%rsi,%rcx,8)
.LBB1_5:                                # %for.inc
                                        #   in Loop: Header=BB1_2 Depth=1
	movq	$0, (%rdx,%rcx,8)
	vpaddq	%xmm2, %xmm0, %xmm0
	vpand	%xmm1, %xmm0, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB1_2
.LBB1_6:                                # %for.end
	ret
.Ltmp21:
	.size	init_array, .Ltmp21-init_array
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI2_1:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI2_2:
	.quad	4614256656552045848     # double 3.141593e+00
	.quad	4614256656552045848     # double 3.141593e+00
.LCPI2_3:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	compute_W
	.align	16, 0x90
	.type	compute_W,@function
compute_W:                              # @compute_W
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp28:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp29:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp30:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp31:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp32:
	.cfi_def_cfa_offset 48
	subq	$96, %rsp
.Ltmp33:
	.cfi_def_cfa_offset 144
.Ltmp34:
	.cfi_offset %rbx, -48
.Ltmp35:
	.cfi_offset %r12, -40
.Ltmp36:
	.cfi_offset %r13, -32
.Ltmp37:
	.cfi_offset %r14, -24
.Ltmp38:
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rax
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	movslq	%eax, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	.LCPI2_0(%rip), %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_10
# BB#1:
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	.LCPI2_0(%rip), %xmm5
	.align	16, 0x90
.LBB2_2:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm1, %xmm4
	vpextrq	$1, %xmm0, %rdx
	movslq	%edx, %rdx
	sarq	%rdx
	vmovq	%rdx, %xmm1
	vmovq	%xmm0, %rdx
	movslq	%edx, %rdx
	sarq	%rdx
	vmovq	%rdx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpaddq	%xmm5, %xmm4, %xmm1
	vpcmpgtq	%xmm5, %xmm0, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB2_2
# BB#3:                                 # %for.body.lr.ph
	movslq	%ecx, %rcx
	movq	%rcx, %rdx
	shrq	$63, %rdx
	addq	%rcx, %rdx
	sarq	%rdx
	vmovq	%rdx, %xmm0
	cltq
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rax, %rdx
	sarq	%rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm4, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm1
	vmovq	%xmm4, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpxor	%xmm9, %xmm9, %xmm9
	vcvtsi2sdq	%rcx, %xmm0, %xmm2
	vcvtsi2sdq	%rax, %xmm0, %xmm3
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm9, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_8
# BB#4:
	vmovdqa	%xmm4, (%rsp)           # 16-byte Spill
	vmovdqa	.LCPI2_3(%rip), %xmm6
	vpextrq	$1, %xmm0, %rax
	movslq	%eax, %r12
	vmovq	%xmm0, %rax
	movslq	%eax, %r13
	vmovapd	%xmm2, %xmm3
	vmovapd	%xmm3, 16(%rsp)         # 16-byte Spill
	.align	16, 0x90
.LBB2_7:                                # %for.body.i25.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	vmovapd	%xmm3, %xmm8
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm9, %xmm2
	vmovdqa	(%rsp), %xmm7           # 16-byte Reload
	.align	16, 0x90
.LBB2_5:                                # %for.body.i25.us
                                        #   Parent Loop BB2_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddq	%xmm1, %xmm1, %xmm1
	vpand	%xmm5, %xmm2, %xmm3
	vmovq	%xmm2, %rax
	cltq
	vpextrq	$1, %xmm2, %rcx
	movslq	%ecx, %rcx
	vpor	%xmm1, %xmm3, %xmm1
	sarq	%rcx
	vmovq	%rcx, %xmm2
	sarq	%rax
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpaddq	%xmm5, %xmm0, %xmm0
	vpand	%xmm6, %xmm0, %xmm3
	vpand	%xmm6, %xmm7, %xmm4
	vpcmpeqq	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB2_5
# BB#6:                                 # %bitrev.exit.us
                                        #   in Loop: Header=BB2_7 Depth=1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm0, %rbx
	vpextrq	$1, %xmm9, %rax
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm9, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI2_1(%rip), %xmm0, %xmm0
	vmulpd	.LCPI2_2(%rip), %xmm0, %xmm0
	vdivpd	%xmm8, %xmm0, %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovdqa	%xmm9, 80(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vmovapd	64(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	32(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovhpd	%xmm0, (%r15,%rbx,8)
	vmovaps	64(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	48(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovapd	16(%rsp), %xmm3         # 16-byte Reload
	vmovdqa	.LCPI2_3(%rip), %xmm6
	vmovdqa	80(%rsp), %xmm9         # 16-byte Reload
	vmovdqa	.LCPI2_0(%rip), %xmm5
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovhpd	%xmm0, (%r14,%rbx,8)
	vpaddq	%xmm5, %xmm9, %xmm9
	vpextrq	$1, %xmm9, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm9, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovq	%r12, %xmm1
	vmovq	%r13, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_7
	jmp	.LBB2_10
.LBB2_8:
	vpextrq	$1, %xmm0, %rax
	movslq	%eax, %r12
	vmovq	%xmm0, %rax
	movslq	%eax, %rbx
	vmovapd	%xmm2, 16(%rsp)         # 16-byte Spill
	.align	16, 0x90
.LBB2_9:                                # %bitrev.exit
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm9, 80(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm9, %rax
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm9, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	.LCPI2_1(%rip), %xmm0, %xmm0
	vmulpd	.LCPI2_2(%rip), %xmm0, %xmm0
	vdivpd	16(%rsp), %xmm0, %xmm0  # 16-byte Folded Reload
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vmovapd	64(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	32(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovhpd	%xmm0, (%r15)
	vmovaps	64(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	48(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovdqa	80(%rsp), %xmm9         # 16-byte Reload
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovapd	64(%rsp), %xmm2         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vmovhpd	%xmm0, (%r14)
	vpaddq	%xmm1, %xmm9, %xmm9
	vpextrq	$1, %xmm9, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm9, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovq	%r12, %xmm1
	vmovq	%rbx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_9
.LBB2_10:                               # %for.end
	addq	$96, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.Ltmp39:
	.size	compute_W, .Ltmp39-compute_W
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI3_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI3_2:
	.quad	8589934560              # 0x1ffffffe0
	.quad	8589934560              # 0x1ffffffe0
.LCPI3_3:
	.quad	32                      # 0x20
	.quad	32                      # 0x20
	.text
	.globl	permute_bitrev
	.align	16, 0x90
	.type	permute_bitrev,@function
permute_bitrev:                         # @permute_bitrev
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm8
	vpextrq	$1, %xmm8, %rax
	movslq	%eax, %rcx
	vmovq	%rcx, %xmm0
	vmovq	%xmm8, %rcx
	movslq	%ecx, %rdi
	vmovq	%rdi, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	.LCPI3_0(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vptest	%xmm0, %xmm0
	vpxor	%xmm4, %xmm4, %xmm4
	je	.LBB3_3
# BB#1:
	vmovdqa	.LCPI3_0(%rip), %xmm2
	vpxor	%xmm4, %xmm4, %xmm4
	vmovdqa	%xmm8, %xmm0
	.align	16, 0x90
.LBB3_2:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rdi
	movslq	%edi, %rdi
	sarq	%rdi
	vmovq	%rdi, %xmm3
	vmovq	%xmm0, %rdi
	movslq	%edi, %rdi
	sarq	%rdi
	vmovq	%rdi, %xmm0
	vpunpcklqdq	%xmm3, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm3[0]
	vpaddq	%xmm2, %xmm4, %xmm4
	vpcmpgtq	%xmm2, %xmm0, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB3_2
.LBB3_3:                                # %log_2.exit
	cltq
	vmovq	%rax, %xmm0
	movslq	%ecx, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_9
# BB#4:                                 # %for.body.lr.ph
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vpxor	%xmm9, %xmm9, %xmm9
	vpcmpgtq	%xmm9, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB3_6
# BB#5:
	vmovdqa	.LCPI3_0(%rip), %xmm2
	vmovdqa	.LCPI3_1(%rip), %xmm3
	vpand	%xmm3, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB3_14:                               # %for.body.i38.preheader.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_10 Depth 2
	vpextrq	$1, %xmm5, %r8
	vpxor	%xmm6, %xmm6, %xmm6
	vpxor	%xmm7, %xmm7, %xmm7
	vmovdqa	%xmm9, %xmm1
	.align	16, 0x90
.LBB3_10:                               # %for.body.i38.us
                                        #   Parent Loop BB3_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddq	%xmm6, %xmm6, %xmm6
	vpand	%xmm2, %xmm1, %xmm0
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm1, %rdi
	movslq	%edi, %rdi
	vpor	%xmm6, %xmm0, %xmm6
	sarq	%rdi
	vmovq	%rdi, %xmm0
	sarq	%rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vpaddq	%xmm2, %xmm7, %xmm7
	vpand	%xmm3, %xmm7, %xmm0
	vpcmpeqq	%xmm4, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_10
# BB#11:                                # %bitrev.exit.us
                                        #   in Loop: Header=BB3_14 Depth=1
	movslq	%r8d, %rcx
	vmovq	%rcx, %xmm0
	vmovq	%xmm5, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm6, %rcx
	movslq	%ecx, %rdi
	vmovq	%rdi, %xmm1
	vmovq	%xmm6, %rdi
	movslq	%edi, %rax
	vmovq	%rax, %xmm6
	vpunpcklqdq	%xmm1, %xmm6, %xmm1 # xmm1 = xmm6[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_13
# BB#12:                                # %if.end.us
                                        #   in Loop: Header=BB3_14 Depth=1
	vmovsd	(%rsi,%r8,8), %xmm0
	vmovsd	(%rdx,%r8,8), %xmm1
	movslq	%ecx, %rax
	vmovq	%rax, %xmm6
	movslq	%edi, %rax
	vmovq	%rax, %xmm7
	vpunpcklqdq	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	vpextrq	$1, %xmm6, %rax
	vmovsd	(%rsi,%rax,8), %xmm6
	vmovsd	%xmm6, (%rsi,%r8,8)
	vmovsd	(%rdx,%rax,8), %xmm6
	vmovsd	%xmm6, (%rdx,%r8,8)
	vmovsd	%xmm0, (%rsi,%rax,8)
	vmovsd	%xmm1, (%rdx,%rax,8)
.LBB3_13:                               # %for.inc.us
                                        #   in Loop: Header=BB3_14 Depth=1
	vpaddq	%xmm2, %xmm5, %xmm5
	vpaddq	%xmm2, %xmm9, %xmm9
	vpand	%xmm3, %xmm5, %xmm0
	vpand	%xmm3, %xmm8, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_14
	jmp	.LBB3_9
.LBB3_6:                                # %for.inc.preheader
	vmovdqa	.LCPI3_1(%rip), %xmm0
	vpaddq	%xmm0, %xmm8, %xmm1
	vpand	%xmm0, %xmm1, %xmm0
	vpaddq	.LCPI3_0(%rip), %xmm0, %xmm0
	vpand	.LCPI3_2(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB3_9
# BB#7:
	vmovdqa	.LCPI3_3(%rip), %xmm2
	.align	16, 0x90
.LBB3_8:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpaddq	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm0, %xmm1, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB3_8
.LBB3_9:                                # %for.end
	ret
.Ltmp40:
	.size	permute_bitrev, .Ltmp40-permute_bitrev
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI4_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	log_2
	.align	16, 0x90
	.type	log_2,@function
log_2:                                  # @log_2
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpcmpgtq	.LCPI4_0(%rip), %xmm0, %xmm2
	vpxor	%xmm0, %xmm0, %xmm0
	vptest	%xmm2, %xmm2
	je	.LBB4_3
# BB#1:
	vmovdqa	.LCPI4_0(%rip), %xmm2
	.align	16, 0x90
.LBB4_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm1, %rax
	cltq
	sarq	%rax
	vmovq	%rax, %xmm3
	vmovq	%xmm1, %rax
	cltq
	sarq	%rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm3, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm3[0]
	vpaddq	%xmm2, %xmm0, %xmm0
	vpcmpgtq	%xmm2, %xmm1, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB4_2
.LBB4_3:                                # %for.end
	vpextrd	$2, %xmm0, %eax
	ret
.Ltmp41:
	.size	log_2, .Ltmp41-log_2
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI5_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	bitrev
	.align	16, 0x90
	.type	bitrev,@function
bitrev:                                 # @bitrev
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%esi, %xmm0
	vpbroadcastq	%xmm0, %xmm3
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpgtq	%xmm0, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_3
# BB#1:
	vmovd	%edi, %xmm1
	vpbroadcastq	%xmm1, %xmm5
	vmovdqa	.LCPI5_0(%rip), %xmm1
	vmovdqa	.LCPI5_1(%rip), %xmm2
	vpand	%xmm2, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	.align	16, 0x90
.LBB5_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpaddq	%xmm0, %xmm0, %xmm0
	vpand	%xmm1, %xmm5, %xmm6
	vmovq	%xmm5, %rax
	cltq
	vpextrq	$1, %xmm5, %rcx
	movslq	%ecx, %rcx
	vpor	%xmm0, %xmm6, %xmm0
	sarq	%rcx
	vmovq	%rcx, %xmm5
	sarq	%rax
	vmovq	%rax, %xmm6
	vpunpcklqdq	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vpaddq	%xmm1, %xmm4, %xmm4
	vpand	%xmm2, %xmm4, %xmm6
	vpcmpeqq	%xmm3, %xmm6, %xmm6
	vptest	%xmm6, %xmm6
	je	.LBB5_2
.LBB5_3:                                # %for.end
	vpextrd	$2, %xmm0, %eax
	ret
.Ltmp42:
	.size	bitrev, .Ltmp42-bitrev
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI6_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI6_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	output_array
	.align	16, 0x90
	.type	output_array,@function
output_array:                           # @output_array
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp49:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp50:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp51:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp52:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp53:
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
.Ltmp54:
	.cfi_def_cfa_offset 80
.Ltmp55:
	.cfi_offset %rbx, -48
.Ltmp56:
	.cfi_offset %r12, -40
.Ltmp57:
	.cfi_offset %r14, -32
.Ltmp58:
	.cfi_offset %r15, -24
.Ltmp59:
	.cfi_offset %rbp, -16
	movq	%rcx, %r12
	movq	%rdx, %r14
	movq	%rsi, %r15
	movl	%edi, %ebp
	movl	$.L.str3, %esi
	movq	%r12, %rdi
	callq	fopen
	movq	%rax, %rbx
	vmovq	%rbx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB6_5
# BB#1:                                 # %for.cond.preheader
	vmovd	%ebp, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB6_4
# BB#2:
	vpand	.LCPI6_1(%rip), %xmm0, %xmm0
	vmovdqa	%xmm0, (%rsp)           # 16-byte Spill
	.align	16, 0x90
.LBB6_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm3, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rax
	vmovsd	(%r15,%rax,8), %xmm0
	vmovsd	(%r14,%rax,8), %xmm1
	movl	$.L.str5, %esi
	movb	$2, %al
	movq	%rbx, %rdi
	callq	fprintf
	vmovdqa	16(%rsp), %xmm3         # 16-byte Reload
	vpaddq	.LCPI6_0(%rip), %xmm3, %xmm3
	vpand	.LCPI6_1(%rip), %xmm3, %xmm0
	vpcmpeqq	(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vptest	%xmm0, %xmm0
	je	.LBB6_3
.LBB6_4:                                # %for.end
	movq	%rbx, %rdi
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fclose                  # TAILCALL
.LBB6_5:                                # %if.then
	movl	$.L.str4, %edi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	printf
	movl	$-1, %edi
	callq	exit
.Ltmp60:
	.size	output_array, .Ltmp60-output_array
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	fft
	.align	16, 0x90
	.type	fft,@function
fft:                                    # @fft
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp65:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp66:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp67:
	.cfi_def_cfa_offset 32
.Ltmp68:
	.cfi_offset %rbx, -32
.Ltmp69:
	.cfi_offset %r14, -24
.Ltmp70:
	.cfi_offset %r15, -16
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm14
	vpcmpgtq	.LCPI7_0(%rip), %xmm14, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB7_9
# BB#1:
	vmovdqa	.LCPI7_0(%rip), %xmm13
	movslq	%r9d, %r15
	movslq	%r10d, %rdi
	.align	16, 0x90
.LBB7_4:                                # %for.body3.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_2 Depth 2
                                        #     Child Loop BB7_8 Depth 2
                                        #       Child Loop BB7_6 Depth 3
	vmovdqa	%xmm14, %xmm1
	vmovdqa	%xmm1, -16(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rbx
	movslq	%ebx, %r11
	movq	%r11, %rbx
	sarq	%rbx
	vmovq	%rbx, %xmm0
	vmovq	%xmm1, %rbx
	movslq	%ebx, %r14
	movq	%r14, %rbx
	sarq	%rbx
	vmovq	%rbx, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm14 # xmm14 = xmm2[0],xmm0[0]
	vpxor	%xmm12, %xmm12, %xmm12
	vpcmpgtq	%xmm12, %xmm14, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB7_2
# BB#5:                                 #   in Loop: Header=BB7_4 Depth=1
	vmovq	%r11, %xmm2
	vmovq	%r14, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm2[0]
	vmovdqa	%xmm0, -32(%rsp)        # 16-byte Spill
	vpxor	%xmm10, %xmm10, %xmm10
	vpxor	%xmm11, %xmm11, %xmm11
	.align	16, 0x90
.LBB7_8:                                # %for.body8.us.preheader.us
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_6 Depth 3
	vpextrq	$1, %xmm10, %rax
	vmovddup	(%rcx,%rax,8), %xmm15
	vmovsd	(%r8,%rax,8), %xmm0
	vpermilpd	$0, %xmm0, %xmm9 # xmm9 = xmm0[0,0]
	vpaddq	%xmm14, %xmm12, %xmm2
	vmovdqa	%xmm11, %xmm6
	vmovdqa	%xmm12, %xmm3
	.align	16, 0x90
.LBB7_6:                                # %for.body8.us.us
                                        #   Parent Loop BB7_4 Depth=1
                                        #     Parent Loop BB7_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm6, %rbx
	vpaddq	%xmm14, %xmm6, %xmm5
	vpextrq	$1, %xmm5, %rax
	vmovddup	(%rsi,%rax,8), %xmm5
	vmulpd	%xmm5, %xmm15, %xmm1
	vmovddup	(%rdx,%rax,8), %xmm0
	vmulpd	%xmm0, %xmm9, %xmm7
	vsubpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm0, %xmm15, %xmm0
	vmulpd	%xmm5, %xmm9, %xmm5
	vaddpd	%xmm0, %xmm5, %xmm0
	vmovddup	(%rsi,%rbx,8), %xmm5
	vmovddup	(%rdx,%rbx,8), %xmm7
	vaddpd	%xmm1, %xmm5, %xmm8
	vmovhpd	%xmm8, (%rsi,%rbx,8)
	vaddpd	%xmm0, %xmm7, %xmm4
	vmovhpd	%xmm4, (%rdx,%rbx,8)
	vsubpd	%xmm1, %xmm5, %xmm1
	vmovhpd	%xmm1, (%rsi,%rax,8)
	vsubpd	%xmm0, %xmm7, %xmm0
	vmovhpd	%xmm0, (%rdx,%rax,8)
	vpaddq	%xmm13, %xmm3, %xmm3
	vpaddq	%xmm13, %xmm6, %xmm6
	vpcmpgtq	%xmm3, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB7_6
# BB#7:                                 # %for.inc43.us.us
                                        #   in Loop: Header=BB7_8 Depth=2
	vmovdqa	-16(%rsp), %xmm0        # 16-byte Reload
	vpaddq	%xmm0, %xmm12, %xmm12
	vpaddq	%xmm13, %xmm10, %xmm10
	vmovq	%r15, %xmm1
	vmovq	%rdi, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpaddq	-32(%rsp), %xmm11, %xmm11 # 16-byte Folded Reload
	vpcmpgtq	%xmm12, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB7_8
	jmp	.LBB7_3
	.align	16, 0x90
.LBB7_2:                                # %for.inc43.us
                                        #   Parent Loop BB7_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddq	%xmm1, %xmm12, %xmm12
	movslq	%r9d, %rbx
	vmovq	%rbx, %xmm3
	movslq	%r10d, %rbx
	vmovq	%rbx, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm12, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB7_2
.LBB7_3:                                # %for.cond.loopexit.us
                                        #   in Loop: Header=BB7_4 Depth=1
	vpcmpgtq	%xmm13, %xmm14, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB7_4
.LBB7_9:                                # %for.end49
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
.Ltmp71:
	.size	fft, .Ltmp71-fft
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Usage: ./fft n outfile\n"
	.size	.L.str, 24

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"A_re != ((void*)0) && A_im != ((void*)0) && W_re != ((void*)0) && W_im != ((void*)0)"
	.size	.L.str1, 85

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"driver.c"
	.size	.L.str2, 9

	.type	.L__PRETTY_FUNCTION__.main,@object # @__PRETTY_FUNCTION__.main
.L__PRETTY_FUNCTION__.main:
	.asciz	"int main(int, char **)"
	.size	.L__PRETTY_FUNCTION__.main, 23

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"w"
	.size	.L.str3, 2

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	"could not open %s for output\n"
	.size	.L.str4, 30

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	"%.16f %.16f\n"
	.size	.L.str5, 13


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
