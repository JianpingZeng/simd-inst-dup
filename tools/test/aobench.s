	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI0_1:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI0_2:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
	.text
	.globl	ray_sphere_intersect
	.align	16, 0x90
	.type	ray_sphere_intersect,@function
ray_sphere_intersect:                   # @ray_sphere_intersect
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	(%rsi), %xmm0
	vmovddup	(%rdx), %xmm1
	vsubpd	%xmm1, %xmm0, %xmm1
	vmovddup	8(%rsi), %xmm0
	vmovddup	8(%rdx), %xmm2
	vsubpd	%xmm2, %xmm0, %xmm2
	vmovddup	16(%rsi), %xmm0
	vmovddup	16(%rdx), %xmm3
	vsubpd	%xmm3, %xmm0, %xmm3
	vmovddup	24(%rsi), %xmm0
	vmovddup	32(%rsi), %xmm4
	vmovddup	40(%rsi), %xmm5
	vmulpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm4, %xmm2, %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm3, %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm3, %xmm3, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovddup	24(%rdx), %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vsubpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm2
	vsubpd	%xmm1, %xmm2, %xmm2
	vxorpd	%xmm1, %xmm1, %xmm1
	vcmpltpd	%xmm2, %xmm1, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB0_5
# BB#1:                                 # %if.then
	vxorpd	.LCPI0_0(%rip), %xmm0, %xmm0
	vsqrtpd	%xmm2, %xmm2
	vsubpd	%xmm2, %xmm0, %xmm0
	vcmpltpd	%xmm0, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_5
# BB#2:                                 # %land.lhs.true
	vmovddup	(%rdi), %xmm1
	vcmpltpd	%xmm1, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_5
# BB#3:                                 # %if.then24
	vmovq	%rdx, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovq	%rsi, %xmm2
	vmovlhps	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	leaq	24(%rsi), %rax
	vmovq	%rax, %xmm3
	vmovlhps	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vunpckhpd	%xmm0, %xmm0, %xmm4 # xmm4 = xmm0[1,1]
	vmovsd	%xmm4, (%rdi)
	movl	$1, 56(%rdi)
	vpextrq	$1, %xmm2, %rax
	vmovupd	(%rax), %xmm2
	vinsertf128	$1, %xmm2, %ymm2, %ymm2
	vpextrq	$1, %xmm3, %rax
	vmovupd	(%rax), %xmm3
	vinsertf128	$1, %xmm3, %ymm3, %ymm3
	vpermpd	$80, %ymm0, %ymm4       # ymm4 = ymm0[0,0,1,1]
	vmulpd	%ymm3, %ymm4, %ymm3
	vaddpd	%ymm3, %ymm2, %ymm2
	vmovupd	%xmm2, 8(%rdi)
	vmovddup	16(%rsi), %xmm3
	vmovddup	40(%rsi), %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vmovhpd	%xmm0, 24(%rdi)
	vpextrq	$1, %xmm1, %rax
	vmovupd	(%rax), %xmm1
	vinsertf128	$1, %xmm1, %ymm1, %ymm1
	vsubpd	%ymm1, %ymm2, %ymm1
	vmovupd	%xmm1, 32(%rdi)
	vmovddup	16(%rdx), %xmm2
	vsubpd	%xmm2, %xmm0, %xmm0
	vmovhpd	%xmm0, 48(%rdi)
	vextractf128	$1, %ymm1, %xmm2
	vunpcklpd	%xmm2, %xmm1, %xmm3 # xmm3 = xmm1[0],xmm2[0]
	vmulpd	%xmm3, %xmm3, %xmm3
	vunpckhpd	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[1,1]
	vunpckhpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,1]
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vandpd	.LCPI0_1(%rip), %xmm0, %xmm1
	vmovapd	.LCPI0_2(%rip), %xmm2
	vcmpltpd	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_5
# BB#4:                                 # %if.then.i
	leaq	32(%rdi), %rax
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vpextrq	$1, %xmm1, %rax
	vmovupd	(%rax), %xmm1
	vinsertf128	$1, %xmm1, %ymm1, %ymm1
	vpermpd	$80, %ymm0, %ymm2       # ymm2 = ymm0[0,0,1,1]
	vdivpd	%ymm2, %ymm1, %ymm1
	vmovupd	%xmm1, (%rax)
	vmovddup	48(%rdi), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovhpd	%xmm0, 48(%rdi)
.LBB0_5:                                # %if.end69
	vzeroupper
	ret
.Ltmp0:
	.size	ray_sphere_intersect, .Ltmp0-ray_sphere_intersect
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI1_1:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
.LCPI1_2:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
	.text
	.globl	ray_plane_intersect
	.align	16, 0x90
	.type	ray_plane_intersect,@function
ray_plane_intersect:                    # @ray_plane_intersect
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	24(%rdx), %xmm5
	vmovddup	32(%rdx), %xmm4
	vmovddup	40(%rdx), %xmm3
	vmovdqu	24(%rsi), %xmm1
	vmovddup	40(%rsi), %xmm9
	vpbroadcastq	%xmm1, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vpermilpd	$3, %xmm1, %xmm6 # xmm6 = xmm1[1,1]
	vmulpd	%xmm6, %xmm4, %xmm6
	vaddpd	%xmm6, %xmm2, %xmm2
	vmulpd	%xmm9, %xmm3, %xmm6
	vaddpd	%xmm6, %xmm2, %xmm6
	vandpd	.LCPI1_0(%rip), %xmm6, %xmm2
	vcmpltpd	.LCPI1_1(%rip), %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB1_4
# BB#1:                                 # %if.end
	vmovq	%rsi, %xmm2
	vmovlhps	%xmm2, %xmm2, %xmm8 # xmm8 = xmm2[0,0]
	vmovddup	8(%rdx), %xmm7
	vmovddup	(%rdx), %xmm2
	vmulpd	%xmm7, %xmm4, %xmm7
	vmulpd	%xmm2, %xmm5, %xmm2
	vmovddup	16(%rdx), %xmm0
	vmulpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm2, %xmm7, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm0
	vpextrq	$1, %xmm8, %rax
	vmovdqu	(%rax), %xmm7
	vmovddup	16(%rsi), %xmm8
	vpbroadcastq	%xmm7, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vpermilpd	$3, %xmm7, %xmm5 # xmm5 = xmm7[1,1]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm2, %xmm2
	vmulpd	%xmm8, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vsubpd	%xmm0, %xmm2, %xmm0
	vxorpd	.LCPI1_2(%rip), %xmm0, %xmm0
	vdivpd	%xmm6, %xmm0, %xmm3
	vxorpd	%xmm0, %xmm0, %xmm0
	vcmpltpd	%xmm3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_4
# BB#2:                                 # %land.lhs.true
	vmovddup	(%rdi), %xmm0
	vcmpltpd	%xmm0, %xmm3, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB1_4
# BB#3:                                 # %if.then10
	addq	$24, %rdx
	vmovq	%rdx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vinsertf128	$1, %xmm1, %ymm1, %ymm1
	vinsertf128	$1, %xmm7, %ymm7, %ymm2
	vunpckhpd	%xmm3, %xmm3, %xmm4 # xmm4 = xmm3[1,1]
	vmovsd	%xmm4, (%rdi)
	movl	$1, 56(%rdi)
	vpermpd	$80, %ymm3, %ymm4       # ymm4 = ymm3[0,0,1,1]
	vmulpd	%ymm1, %ymm4, %ymm1
	vaddpd	%ymm1, %ymm2, %ymm1
	vmovupd	%xmm1, 8(%rdi)
	vmulpd	%xmm3, %xmm9, %xmm1
	vaddpd	%xmm1, %xmm8, %xmm1
	vmovhpd	%xmm1, 24(%rdi)
	vpextrq	$1, %xmm0, %rax
	movq	16(%rax), %rcx
	movq	%rcx, 48(%rdi)
	vmovupd	(%rax), %xmm0
	vmovupd	%xmm0, 32(%rdi)
.LBB1_4:                                # %if.end34
	vzeroupper
	ret
.Ltmp1:
	.size	ray_plane_intersect, .Ltmp1-ray_plane_intersect
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	4603579539098121011     # double 6.000000e-01
	.quad	4603579539098121011     # double 6.000000e-01
.LCPI2_1:
	.quad	-4619792497756654797    # double -6.000000e-01
	.quad	-4619792497756654797    # double -6.000000e-01
.LCPI2_2:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI2_5:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI2_6:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
	.section	.rodata,"a",@progbits
	.align	32
.LCPI2_3:
	.quad	0                       # double 0.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI2_4:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	0                       # double 0.000000e+00
	.text
	.globl	orthoBasis
	.align	16, 0x90
	.type	orthoBasis,@function
orthoBasis:                             # @orthoBasis
	.cfi_startproc
# BB#0:                                 # %entry
	vmovq	%rdi, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm9 # xmm9 = xmm0[0,0]
	movq	24(%rsp), %rax
	movq	%rax, 64(%rdi)
	vmovaps	8(%rsp), %xmm0
	vmovups	%xmm0, 48(%rdi)
	leaq	24(%rdi), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm8 # xmm8 = xmm0[0,0]
	vxorps	%xmm2, %xmm2, %xmm2
	vmovups	%xmm2, 24(%rdi)
	movq	$0, 40(%rdi)
	vmovddup	8(%rsp), %xmm3
	vcmpltpd	.LCPI2_0(%rip), %xmm3, %xmm4
	vmovapd	.LCPI2_1(%rip), %xmm2
	vcmpltpd	%xmm3, %xmm2, %xmm3
	vandpd	%xmm3, %xmm4, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB2_5
# BB#1:                                 # %if.else
	leaq	8(%rsp), %rcx
	vmovddup	8(%rcx), %xmm3
	vcmpltpd	.LCPI2_0(%rip), %xmm3, %xmm4
	vcmpltpd	%xmm3, %xmm2, %xmm3
	vandpd	%xmm3, %xmm4, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB2_3
# BB#2:                                 # %if.then14
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, 32(%rdi)
	vmovapd	.LCPI2_4(%rip), %ymm4
	vxorpd	%xmm3, %xmm3, %xmm3
	jmp	.LBB2_6
.LBB2_3:                                # %if.else17
	vmovddup	16(%rcx), %xmm3
	vcmpltpd	.LCPI2_0(%rip), %xmm3, %xmm4
	vcmpltpd	%xmm3, %xmm2, %xmm2
	vandpd	%xmm2, %xmm4, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB2_5
# BB#4:                                 # %if.then23
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, 40(%rdi)
	vmovapd	.LCPI2_3(%rip), %ymm4
	vxorpd	%xmm3, %xmm3, %xmm3
	jmp	.LBB2_6
.LBB2_5:                                # %if.else26
	movabsq	$4607182418800017408, %rcx # imm = 0x3FF0000000000000
	movq	%rcx, (%rax)
	vxorpd	%ymm4, %ymm4, %ymm4
	vmovapd	.LCPI2_2(%rip), %xmm3
.LBB2_6:                                # %if.end30
	vextractf128	$1, %ymm4, %xmm2
	vunpckhpd	%xmm2, %xmm2, %xmm5 # xmm5 = xmm2[1,1]
	vunpckhpd	%xmm4, %xmm4, %xmm6 # xmm6 = xmm4[1,1]
	vunpcklpd	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vunpcklpd	%xmm2, %xmm4, %xmm6 # xmm6 = xmm4[0],xmm2[0]
	vmovddup	48(%rdi), %xmm7
	leaq	56(%rdi), %rax
	vmovq	%rax, %xmm2
	vmovlhps	%xmm2, %xmm2, %xmm10 # xmm10 = xmm2[0,0]
	vmovddup	56(%rdi), %xmm0
	vmovddup	64(%rdi), %xmm1
	vunpckhpd	%xmm7, %xmm1, %xmm2 # xmm2 = xmm1[1],xmm7[1]
	vunpcklpd	%xmm7, %xmm1, %xmm11 # xmm11 = xmm1[0],xmm7[0]
	vinsertf128	$1, %xmm2, %ymm11, %ymm2
	vmulpd	%ymm2, %ymm4, %ymm2
	vunpckhpd	%xmm3, %xmm5, %xmm4 # xmm4 = xmm5[1],xmm3[1]
	vunpcklpd	%xmm3, %xmm5, %xmm5 # xmm5 = xmm5[0],xmm3[0]
	vinsertf128	$1, %xmm4, %ymm5, %ymm4
	vunpckhpd	%xmm1, %xmm0, %xmm5 # xmm5 = xmm0[1],xmm1[1]
	vunpcklpd	%xmm1, %xmm0, %xmm1 # xmm1 = xmm0[0],xmm1[0]
	vinsertf128	$1, %xmm5, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm4, %ymm1
	vsubpd	%ymm1, %ymm2, %ymm1
	vpextrq	$1, %xmm9, %rax
	vmovupd	%xmm1, (%rax)
	vmulpd	%xmm0, %xmm3, %xmm0
	vmulpd	%xmm7, %xmm6, %xmm2
	vsubpd	%xmm2, %xmm0, %xmm0
	vmovhpd	%xmm0, 16(%rdi)
	vextractf128	$1, %ymm1, %xmm2
	vunpcklpd	%xmm2, %xmm1, %xmm3 # xmm3 = xmm1[0],xmm2[0]
	vmulpd	%xmm3, %xmm3, %xmm3
	vunpckhpd	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[1,1]
	vunpckhpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,1]
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm3
	vandpd	.LCPI2_5(%rip), %xmm3, %xmm0
	vmovapd	.LCPI2_6(%rip), %xmm9
	vmovddup	(%rdi), %xmm4
	vcmpltpd	%xmm0, %xmm9, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB2_7
# BB#8:                                 # %if.then.i76
	leaq	8(%rdi), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vdivpd	%xmm3, %xmm4, %xmm2
	vmovhpd	%xmm2, (%rdi)
	vpextrq	$1, %xmm0, %rax
	vmovupd	(%rax), %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vpermpd	$80, %ymm3, %ymm3       # ymm3 = ymm3[0,0,1,1]
	vdivpd	%ymm3, %ymm0, %ymm0
	vmovupd	%xmm0, (%rax)
	vextractf128	$1, %ymm0, %xmm3
	vunpckhpd	%xmm3, %xmm3, %xmm4 # xmm4 = xmm3[1,1]
	vunpckhpd	%xmm0, %xmm0, %xmm5 # xmm5 = xmm0[1,1]
	vunpcklpd	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vunpckhpd	%xmm2, %xmm4, %xmm5 # xmm5 = xmm4[1],xmm2[1]
	vunpcklpd	%xmm2, %xmm4, %xmm2 # xmm2 = xmm4[0],xmm2[0]
	vinsertf128	$1, %xmm5, %ymm2, %ymm4
	vunpcklpd	%xmm3, %xmm0, %xmm3 # xmm3 = xmm0[0],xmm3[0]
	jmp	.LBB2_9
.LBB2_7:                                # %if.end30.vnormalize.exit77_crit_edge
	vmovddup	8(%rdi), %xmm3
	vmovddup	16(%rdi), %xmm0
	vunpckhpd	%xmm4, %xmm0, %xmm2 # xmm2 = xmm0[1],xmm4[1]
	vunpcklpd	%xmm4, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm4[0]
	vinsertf128	$1, %xmm2, %ymm0, %ymm4
.LBB2_9:                                # %vnormalize.exit77
	vextractf128	$1, %ymm4, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vunpckhpd	%xmm4, %xmm4, %xmm2 # xmm2 = xmm4[1,1]
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vmovddup	48(%rdi), %xmm2
	vpextrq	$1, %xmm10, %rax
	vmovupd	(%rax), %xmm5
	vinsertf128	$1, %xmm5, %ymm5, %ymm6
	vmulpd	%ymm6, %ymm4, %ymm6
	vunpckhpd	%xmm3, %xmm3, %xmm7 # xmm7 = xmm3[1,1]
	vinsertf128	$1, %xmm7, %ymm7, %ymm7
	vunpcklpd	%ymm4, %ymm7, %ymm4 # ymm4 = ymm7[0],ymm4[0],ymm7[2],ymm4[2]
	vpermilpd	$3, %xmm5, %xmm7 # xmm7 = xmm5[1,1]
	vunpckhpd	%xmm2, %xmm7, %xmm1 # xmm1 = xmm7[1],xmm2[1]
	vunpcklpd	%xmm2, %xmm7, %xmm7 # xmm7 = xmm7[0],xmm2[0]
	vinsertf128	$1, %xmm1, %ymm7, %ymm1
	vmulpd	%ymm1, %ymm4, %ymm1
	vsubpd	%ymm1, %ymm6, %ymm1
	vpextrq	$1, %xmm8, %rax
	vmovupd	%xmm1, (%rax)
	vmulpd	%xmm2, %xmm3, %xmm2
	vpbroadcastq	%xmm5, %xmm3
	vmulpd	%xmm3, %xmm0, %xmm0
	vsubpd	%xmm0, %xmm2, %xmm0
	vmovhpd	%xmm0, 40(%rdi)
	vextractf128	$1, %ymm1, %xmm2
	vunpcklpd	%xmm2, %xmm1, %xmm3 # xmm3 = xmm1[0],xmm2[0]
	vmulpd	%xmm3, %xmm3, %xmm3
	vunpckhpd	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[1,1]
	vunpckhpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,1]
	vunpcklpd	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vandpd	.LCPI2_5(%rip), %xmm0, %xmm1
	vcmpltpd	%xmm1, %xmm9, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_11
# BB#10:                                # %if.then.i
	vmovupd	(%rax), %xmm1
	vinsertf128	$1, %xmm1, %ymm1, %ymm1
	vpermpd	$80, %ymm0, %ymm2       # ymm2 = ymm0[0,0,1,1]
	vdivpd	%ymm2, %ymm1, %ymm1
	vmovupd	%xmm1, (%rax)
	vmovddup	40(%rdi), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovhpd	%xmm0, 40(%rdi)
.LBB2_11:                               # %vnormalize.exit
	vzeroupper
	ret
.Ltmp2:
	.size	orthoBasis, .Ltmp2-orthoBasis
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4547007122018943789     # double 1.0E-4
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_1:
	.quad	4547007122018943789     # double 1.000000e-04
	.quad	4547007122018943789     # double 1.000000e-04
.LCPI3_2:
	.quad	4603579539098121011     # double 6.000000e-01
	.quad	4603579539098121011     # double 6.000000e-01
.LCPI3_3:
	.quad	-4619792497756654797    # double -6.000000e-01
	.quad	-4619792497756654797    # double -6.000000e-01
.LCPI3_4:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI3_7:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI3_8:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
.LCPI3_9:
	.quad	4618760256179416344     # double 6.283185e+00
	.quad	4618760256179416344     # double 6.283185e+00
.LCPI3_10:
	.quad	4861130398305394688     # double 1.000000e+17
	.quad	4861130398305394688     # double 1.000000e+17
.LCPI3_11:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI3_12:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI3_13:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI3_14:
	.quad	16                      # 0x10
	.quad	16                      # 0x10
.LCPI3_15:
	.quad	4643211215818981376     # double 2.560000e+02
	.quad	4643211215818981376     # double 2.560000e+02
.LCPI3_16:
	.quad	4571153621781053440     # double 3.906250e-03
	.quad	4571153621781053440     # double 3.906250e-03
	.section	.rodata,"a",@progbits
	.align	32
.LCPI3_5:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	0                       # double 0.000000e+00
.LCPI3_6:
	.quad	0                       # double 0.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	0                       # double 0.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.text
	.globl	ambient_occlusion
	.align	16, 0x90
	.type	ambient_occlusion,@function
ambient_occlusion:                      # @ambient_occlusion
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 16
	subq	$464, %rsp              # imm = 0x1D0
.Ltmp6:
	.cfi_def_cfa_offset 480
.Ltmp7:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	leaq	432(%rsp), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm8 # xmm8 = xmm0[0,0]
	vmovupd	8(%rsi), %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm1
	vmovupd	32(%rsi), %xmm2
	vinsertf128	$1, %xmm2, %ymm2, %ymm10
	vbroadcastsd	.LCPI3_0(%rip), %ymm3
	vmulpd	%ymm3, %ymm10, %ymm3
	vaddpd	%ymm3, %ymm1, %ymm0
	vmovupd	%ymm0, 320(%rsp)        # 32-byte Folded Spill
	vmovddup	24(%rsi), %xmm1
	vmovddup	48(%rsi), %xmm3
	vmulpd	.LCPI3_1(%rip), %xmm3, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm0
	vmovapd	%xmm0, 384(%rsp)        # 16-byte Spill
	vmovdqu	40(%rsi), %xmm6
	vinserti128	$1, %xmm6, %ymm6, %ymm1
	vpbroadcastq	%xmm2, %xmm2
	vcmpltpd	.LCPI3_2(%rip), %xmm2, %xmm3
	vmovapd	.LCPI3_3(%rip), %xmm4
	vcmpltpd	%xmm2, %xmm4, %xmm7
	vandpd	%xmm7, %xmm3, %xmm7
	vpbroadcastq	%xmm6, %xmm9
	vpermilpd	$3, %xmm6, %xmm0 # xmm0 = xmm6[1,1]
	vmovapd	%xmm0, 208(%rsp)        # 16-byte Spill
	vptest	%xmm7, %xmm7
	je	.LBB3_2
# BB#1:
	vxorpd	%ymm7, %ymm7, %ymm7
	vmovapd	.LCPI3_4(%rip), %xmm6
	jmp	.LBB3_5
.LBB3_2:                                # %if.else.i
	vextracti128	$1, %ymm1, %xmm6
	vunpcklpd	%xmm6, %xmm1, %xmm7 # xmm7 = xmm1[0],xmm6[0]
	vcmpltpd	.LCPI3_2(%rip), %xmm7, %xmm3
	vcmpltpd	%xmm7, %xmm4, %xmm7
	vandpd	%xmm7, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB3_4
# BB#3:
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovapd	.LCPI3_5(%rip), %ymm7
	jmp	.LBB3_5
.LBB3_4:                                # %if.else17.i
	vunpckhpd	%xmm6, %xmm6, %xmm3 # xmm3 = xmm6[1,1]
	vunpckhpd	%xmm1, %xmm1, %xmm6 # xmm6 = xmm1[1,1]
	vunpcklpd	%xmm3, %xmm6, %xmm3 # xmm3 = xmm6[0],xmm3[0]
	vcmpltpd	.LCPI3_2(%rip), %xmm3, %xmm6
	vcmpltpd	%xmm3, %xmm4, %xmm3
	vandpd	%xmm3, %xmm6, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI3_4(%rip), %xmm6
	vblendvpd	%xmm3, %xmm4, %xmm6, %xmm6
	vpshufd	$8, %xmm3, %xmm3        # xmm3 = xmm3[0,2,0,0]
	vpshufd	$1, %xmm3, %xmm3        # xmm3 = xmm3[1,0,0,0]
	vpbroadcastd	%xmm3, %xmm3
	vpslld	$31, %xmm3, %xmm3
	vpmovsxdq	%xmm3, %ymm3
	vxorpd	%ymm4, %ymm4, %ymm4
	vblendvpd	%ymm3, .LCPI3_6(%rip), %ymm4, %ymm7
.LBB3_5:                                # %if.end30.i
	vextractf128	$1, %ymm7, %xmm3
	vunpckhpd	%xmm3, %xmm3, %xmm4 # xmm4 = xmm3[1,1]
	vunpckhpd	%xmm7, %xmm7, %xmm0 # xmm0 = xmm7[1,1]
	vunpcklpd	%xmm4, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm4[0]
	vunpcklpd	%xmm3, %xmm7, %xmm3 # xmm3 = xmm7[0],xmm3[0]
	vshufpd	$5, %ymm10, %ymm1, %ymm12 # ymm12 = ymm1[1],ymm10[0],ymm1[3],ymm10[2]
	vmulpd	%ymm12, %ymm7, %ymm7
	vunpckhpd	%xmm6, %xmm0, %xmm5 # xmm5 = xmm0[1],xmm6[1]
	vunpcklpd	%xmm6, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm6[0]
	vinsertf128	$1, %xmm5, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vsubpd	%ymm0, %ymm7, %ymm13
	vpextrq	$1, %xmm8, %rax
	vmovapd	%xmm13, (%rax)
	vmulpd	%xmm9, %xmm6, %xmm0
	vmulpd	%xmm3, %xmm2, %xmm3
	vsubpd	%xmm3, %xmm0, %xmm4
	vmovhpd	%xmm4, 448(%rsp)
	vextractf128	$1, %ymm13, %xmm0
	vunpcklpd	%xmm0, %xmm13, %xmm7 # xmm7 = xmm13[0],xmm0[0]
	vmulpd	%xmm7, %xmm7, %xmm3
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vunpckhpd	%xmm13, %xmm13, %xmm5 # xmm5 = xmm13[1,1]
	vunpcklpd	%xmm0, %xmm5, %xmm6 # xmm6 = xmm5[0],xmm0[0]
	vmulpd	%xmm6, %xmm6, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vmulpd	%xmm4, %xmm4, %xmm3
	vaddpd	%xmm0, %xmm3, %xmm0
	vsqrtpd	%xmm0, %xmm8
	vandpd	.LCPI3_7(%rip), %xmm8, %xmm0
	vmovapd	.LCPI3_8(%rip), %xmm11
	vcmpltpd	%xmm0, %xmm11, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_6
# BB#7:                                 # %if.then.i76.i
	vdivpd	%xmm8, %xmm7, %xmm0
	vmovhpd	%xmm0, 432(%rsp)
	vmovupd	440(%rsp), %xmm3
	vinsertf128	$1, %xmm3, %ymm3, %ymm3
	vpermpd	$80, %ymm8, %ymm6       # ymm6 = ymm8[0,0,1,1]
	vdivpd	%ymm6, %ymm3, %ymm3
	vmovupd	%xmm3, 440(%rsp)
	vextractf128	$1, %ymm3, %xmm6
	vunpckhpd	%xmm6, %xmm6, %xmm7 # xmm7 = xmm6[1,1]
	vunpckhpd	%xmm3, %xmm3, %xmm5 # xmm5 = xmm3[1,1]
	vunpcklpd	%xmm7, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm7[0]
	vunpckhpd	%xmm0, %xmm4, %xmm5 # xmm5 = xmm4[1],xmm0[1]
	vunpcklpd	%xmm0, %xmm4, %xmm7 # xmm7 = xmm4[0],xmm0[0]
	vinsertf128	$1, %xmm5, %ymm7, %ymm7
	vunpcklpd	%xmm6, %xmm3, %xmm6 # xmm6 = xmm3[0],xmm6[0]
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vunpcklpd	%ymm3, %ymm0, %ymm13 # ymm13 = ymm0[0],ymm3[0],ymm0[2],ymm3[2]
	jmp	.LBB3_8
.LBB3_6:                                # %if.end30.vnormalize.exit77_crit_edge.i
	vunpckhpd	%xmm4, %xmm4, %xmm0 # xmm0 = xmm4[1,1]
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vunpcklpd	%ymm13, %ymm0, %ymm7 # ymm7 = ymm0[0],ymm13[0],ymm0[2],ymm13[2]
.LBB3_8:                                # %vnormalize.exit77.i
	vmovupd	%ymm13, 160(%rsp)       # 32-byte Folded Spill
	vmovapd	%xmm4, 192(%rsp)        # 16-byte Spill
	vextractf128	$1, %ymm7, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vunpckhpd	%xmm7, %xmm7, %xmm3 # xmm3 = xmm7[1,1]
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	vmulpd	%ymm1, %ymm7, %ymm3
	vunpckhpd	%xmm6, %xmm6, %xmm5 # xmm5 = xmm6[1,1]
	vinsertf128	$1, %xmm5, %ymm5, %ymm5
	vunpcklpd	%ymm7, %ymm5, %ymm5 # ymm5 = ymm5[0],ymm7[0],ymm5[2],ymm7[2]
	vmulpd	%ymm12, %ymm5, %ymm4
	vsubpd	%ymm4, %ymm3, %ymm4
	vmulpd	%xmm6, %xmm2, %xmm2
	vmulpd	%xmm9, %xmm0, %xmm0
	vsubpd	%xmm0, %xmm2, %xmm5
	vextractf128	$1, %ymm4, %xmm0
	vunpcklpd	%xmm0, %xmm4, %xmm2 # xmm2 = xmm4[0],xmm0[0]
	vmulpd	%xmm2, %xmm2, %xmm2
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vunpckhpd	%xmm4, %xmm4, %xmm3 # xmm3 = xmm4[1,1]
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm0
	vmulpd	%xmm5, %xmm5, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm0
	vsqrtpd	%xmm0, %xmm2
	vandpd	.LCPI3_7(%rip), %xmm2, %xmm0
	vcmpltpd	%xmm0, %xmm11, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_10
# BB#9:                                 # %if.then.i.i
	vpermpd	$80, %ymm2, %ymm0       # ymm0 = ymm2[0,0,1,1]
	vdivpd	%ymm0, %ymm4, %ymm4
	vdivpd	%xmm2, %xmm5, %xmm5
.LBB3_10:                               # %orthoBasis.exit
	vmovapd	%xmm5, 112(%rsp)        # 16-byte Spill
	vmovupd	%ymm4, 128(%rsp)        # 32-byte Folded Spill
	vunpcklpd	%ymm1, %ymm10, %ymm0 # ymm0 = ymm10[0],ymm1[0],ymm10[2],ymm1[2]
	vmovupd	%ymm0, 64(%rsp)         # 32-byte Folded Spill
	vmovupd	320(%rsp), %ymm0        # 32-byte Folded Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vpxor	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 224(%rsp)        # 16-byte Spill
	.align	16, 0x90
.LBB3_11:                               # %for.cond17.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_12 Depth 2
	vmovdqa	%xmm1, 16(%rsp)         # 16-byte Spill
	vpxor	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB3_12:                               # %for.body19
                                        #   Parent Loop BB3_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqa	%xmm1, 304(%rsp)        # 16-byte Spill
	vzeroupper
	callq	drand48
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vsqrtpd	%xmm0, %xmm0
	vmovapd	%xmm0, 368(%rsp)        # 16-byte Spill
	callq	drand48
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmulpd	.LCPI3_9(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, 352(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 256(%rsp)        # 16-byte Spill
	vmovapd	352(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 240(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	256(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	368(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovupd	%ymm0, 256(%rsp)        # 32-byte Folded Spill
	vmovaps	352(%rsp), %xmm0        # 16-byte Reload
	vzeroupper
	callq	sin
	vmovaps	%xmm0, 352(%rsp)        # 16-byte Spill
	vmovapd	240(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovapd	352(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	368(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vmovapd	.LCPI3_4(%rip), %xmm2
	vsubpd	%xmm1, %xmm2, %xmm1
	vsqrtpd	%xmm1, %xmm1
	vmovupd	256(%rsp), %ymm4        # 32-byte Folded Reload
	vpermpd	$80, %ymm4, %ymm2       # ymm2 = ymm4[0,0,1,1]
	vmulpd	160(%rsp), %ymm2, %ymm2 # 32-byte Folded Reload
	vpermpd	$80, %ymm0, %ymm3       # ymm3 = ymm0[0,0,1,1]
	vmulpd	128(%rsp), %ymm3, %ymm3 # 32-byte Folded Reload
	vaddpd	%ymm3, %ymm2, %ymm2
	vpermpd	$80, %ymm1, %ymm3       # ymm3 = ymm1[0,0,1,1]
	vmulpd	64(%rsp), %ymm3, %ymm3  # 32-byte Folded Reload
	vaddpd	%ymm2, %ymm3, %ymm2
	vmovapd	192(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovapd	112(%rsp), %xmm4        # 16-byte Reload
	vmulpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vmovapd	208(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm13
	vmovddup	spheres(%rip), %xmm0
	vmovupd	320(%rsp), %ymm10       # 32-byte Folded Reload
	vmovupd	%ymm10, 320(%rsp)       # 32-byte Folded Spill
	vunpcklpd	48(%rsp), %xmm10, %xmm9 # 16-byte Folded Reload
                                        # xmm9 = xmm10[0],mem[0]
	vsubpd	%xmm0, %xmm9, %xmm4
	vmovddup	spheres+8(%rip), %xmm0
	vunpckhpd	%xmm10, %xmm10, %xmm1 # xmm1 = xmm10[1,1]
	vunpcklpd	32(%rsp), %xmm1, %xmm11 # 16-byte Folded Reload
                                        # xmm11 = xmm1[0],mem[0]
	vsubpd	%xmm0, %xmm11, %xmm6
	vmovddup	spheres+16(%rip), %xmm0
	vmovapd	384(%rsp), %xmm1        # 16-byte Reload
	vsubpd	%xmm0, %xmm1, %xmm7
	vextractf128	$1, %ymm2, %xmm12
	vunpcklpd	%xmm12, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm12[0]
	vmulpd	%xmm0, %xmm4, %xmm1
	vunpckhpd	%xmm12, %xmm12, %xmm8 # xmm8 = xmm12[1,1]
	vunpckhpd	%xmm2, %xmm2, %xmm5 # xmm5 = xmm2[1,1]
	vunpcklpd	%xmm8, %xmm5, %xmm15 # xmm15 = xmm5[0],xmm8[0]
	vmulpd	%xmm15, %xmm6, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmulpd	%xmm7, %xmm13, %xmm3
	vaddpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm4, %xmm4, %xmm3
	vmulpd	%xmm6, %xmm6, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm7, %xmm7, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmovddup	spheres+24(%rip), %xmm4
	vmulpd	%xmm4, %xmm4, %xmm4
	vsubpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm1, %xmm1, %xmm4
	vsubpd	%xmm3, %xmm4, %xmm7
	vxorpd	%xmm14, %xmm14, %xmm14
	vcmpltpd	%xmm7, %xmm14, %xmm3
	vptest	%xmm3, %xmm3
	vmovapd	%xmm10, 416(%rsp)
	vmovapd	%xmm2, 400(%rsp)
	je	.LBB3_13
# BB#14:                                # %if.then.i15
                                        #   in Loop: Header=BB3_12 Depth=2
	vxorpd	.LCPI3_11(%rip), %xmm1, %xmm1
	vsqrtpd	%xmm7, %xmm3
	vsubpd	%xmm3, %xmm1, %xmm1
	vxorpd	%xmm14, %xmm14, %xmm14
	vcmpltpd	%xmm1, %xmm14, %xmm3
	vmovapd	.LCPI3_10(%rip), %xmm4
	vmovapd	%xmm4, %xmm5
	vcmpltpd	%xmm5, %xmm1, %xmm4
	vandpd	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	vmovapd	%xmm9, %xmm7
	vmovapd	%xmm5, %xmm10
	je	.LBB3_16
# BB#15:                                # %if.then24.i
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovdqa	416(%rsp), %xmm0
	vmovdqa	400(%rsp), %xmm3
	vpbroadcastq	%xmm0, %xmm7
	vpbroadcastq	%xmm3, %xmm0
	vmovapd	.LCPI3_12(%rip), %xmm14
	vmovapd	%xmm1, %xmm10
	jmp	.LBB3_16
	.align	16, 0x90
.LBB3_13:                               #   in Loop: Header=BB3_12 Depth=2
	vmovapd	%xmm9, %xmm7
	vmovapd	.LCPI3_10(%rip), %xmm10
.LBB3_16:                               # %ray_sphere_intersect.exit
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovddup	spheres+32(%rip), %xmm1
	vsubpd	%xmm1, %xmm7, %xmm3
	vmovddup	spheres+40(%rip), %xmm1
	vsubpd	%xmm1, %xmm11, %xmm4
	vmovddup	spheres+48(%rip), %xmm1
	vmovapd	384(%rsp), %xmm5        # 16-byte Reload
	vsubpd	%xmm1, %xmm5, %xmm6
	vmulpd	%xmm0, %xmm3, %xmm1
	vmulpd	%xmm15, %xmm4, %xmm5
	vaddpd	%xmm5, %xmm1, %xmm1
	vmulpd	%xmm6, %xmm13, %xmm5
	vaddpd	%xmm1, %xmm5, %xmm1
	vmulpd	%xmm3, %xmm3, %xmm3
	vmulpd	%xmm4, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm6, %xmm6, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmovddup	spheres+56(%rip), %xmm4
	vmulpd	%xmm4, %xmm4, %xmm4
	vsubpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm1, %xmm1, %xmm4
	vsubpd	%xmm3, %xmm4, %xmm4
	vxorpd	%xmm6, %xmm6, %xmm6
	vcmpltpd	%xmm4, %xmm6, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB3_19
# BB#17:                                # %if.then.i57
                                        #   in Loop: Header=BB3_12 Depth=2
	vxorpd	.LCPI3_11(%rip), %xmm1, %xmm1
	vsqrtpd	%xmm4, %xmm3
	vsubpd	%xmm3, %xmm1, %xmm1
	vcmpltpd	%xmm1, %xmm6, %xmm3
	vcmpltpd	%xmm10, %xmm1, %xmm4
	vandpd	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB3_19
# BB#18:                                # %if.then24.i77
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovdqa	416(%rsp), %xmm0
	vmovdqa	400(%rsp), %xmm3
	vpbroadcastq	%xmm0, %xmm7
	vpbroadcastq	%xmm3, %xmm0
	vmovapd	.LCPI3_12(%rip), %xmm14
	vmovapd	%xmm1, %xmm10
.LBB3_19:                               # %ray_sphere_intersect.exit80
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovddup	spheres+64(%rip), %xmm1
	vsubpd	%xmm1, %xmm7, %xmm1
	vmovddup	spheres+72(%rip), %xmm3
	vsubpd	%xmm3, %xmm11, %xmm3
	vmovddup	spheres+80(%rip), %xmm4
	vmovapd	384(%rsp), %xmm5        # 16-byte Reload
	vsubpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm15, %xmm3, %xmm5
	vaddpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm4, %xmm13, %xmm5
	vaddpd	%xmm0, %xmm5, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vmulpd	%xmm3, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmulpd	%xmm4, %xmm4, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	spheres+88(%rip), %xmm3
	vmulpd	%xmm3, %xmm3, %xmm3
	vsubpd	%xmm3, %xmm1, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm3
	vsubpd	%xmm1, %xmm3, %xmm1
	vcmpltpd	%xmm1, %xmm6, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB3_22
# BB#20:                                # %if.then.i112
                                        #   in Loop: Header=BB3_12 Depth=2
	vxorpd	.LCPI3_11(%rip), %xmm0, %xmm0
	vsqrtpd	%xmm1, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm0
	vcmpltpd	%xmm0, %xmm6, %xmm1
	vcmpltpd	%xmm10, %xmm0, %xmm3
	vandpd	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB3_22
# BB#21:                                # %if.then24.i132
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovapd	.LCPI3_12(%rip), %xmm14
	vmovapd	%xmm0, %xmm10
.LBB3_22:                               # %ray_sphere_intersect.exit135
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovddup	plane+24(%rip), %xmm5
	vmovddup	plane+32(%rip), %xmm7
	vmovddup	plane+40(%rip), %xmm0
	vunpcklpd	%xmm12, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm12[0]
	vmulpd	%xmm5, %xmm1, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[1,1]
	vunpcklpd	%xmm8, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm8[0]
	vmulpd	%xmm7, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm0, %xmm13, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm2
	vandpd	.LCPI3_7(%rip), %xmm2, %xmm1
	vcmpltpd	.LCPI3_8(%rip), %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB3_23
# BB#24:                                # %ray_plane_intersect.exit
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovapd	.LCPI3_13(%rip), %xmm2
	vandpd	%xmm2, %xmm14, %xmm0
	vpcmpeqq	%xmm6, %xmm0, %xmm0
	jmp	.LBB3_25
	.align	16, 0x90
.LBB3_23:                               # %if.end.i
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovddup	plane+8(%rip), %xmm1
	vmovddup	plane(%rip), %xmm3
	vmulpd	%xmm1, %xmm7, %xmm1
	vmulpd	%xmm3, %xmm5, %xmm3
	vmovddup	plane+16(%rip), %xmm4
	vmulpd	%xmm4, %xmm0, %xmm4
	vaddpd	%xmm3, %xmm1, %xmm1
	vaddpd	%xmm4, %xmm1, %xmm1
	vmulpd	%xmm5, %xmm9, %xmm3
	vmulpd	%xmm7, %xmm11, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmovapd	384(%rsp), %xmm4        # 16-byte Reload
	vmulpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vsubpd	%xmm1, %xmm0, %xmm0
	vxorpd	.LCPI3_11(%rip), %xmm0, %xmm0
	vdivpd	%xmm2, %xmm0, %xmm0
	vcmpnltpd	%xmm0, %xmm6, %xmm1
	vcmpnltpd	%xmm10, %xmm0, %xmm0
	vorpd	%xmm1, %xmm0, %xmm0
	vmovapd	.LCPI3_13(%rip), %xmm2
	vandpd	%xmm2, %xmm14, %xmm1
	vpcmpeqq	%xmm6, %xmm1, %xmm1
	vandpd	%xmm1, %xmm0, %xmm0
.LBB3_25:                               # %ray_plane_intersect.exit
                                        #   in Loop: Header=BB3_12 Depth=2
	vptest	%xmm0, %xmm0
	vmovdqa	304(%rsp), %xmm1        # 16-byte Reload
	jne	.LBB3_27
# BB#26:                                # %if.then
                                        #   in Loop: Header=BB3_12 Depth=2
	vmovapd	224(%rsp), %xmm0        # 16-byte Reload
	vaddpd	.LCPI3_4(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, 224(%rsp)        # 16-byte Spill
.LBB3_27:                               # %if.end
                                        #   in Loop: Header=BB3_12 Depth=2
	vpaddq	.LCPI3_12(%rip), %xmm1, %xmm1
	vpand	%xmm2, %xmm1, %xmm0
	vpcmpeqq	.LCPI3_14(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_12
# BB#28:                                # %for.inc71
                                        #   in Loop: Header=BB3_11 Depth=1
	vmovdqa	16(%rsp), %xmm1         # 16-byte Reload
	vpaddq	.LCPI3_12(%rip), %xmm1, %xmm1
	vpand	%xmm2, %xmm1, %xmm0
	vpcmpeqq	.LCPI3_14(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_11
# BB#29:                                # %for.end73
	vmovapd	.LCPI3_15(%rip), %xmm0
	vsubpd	224(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmulpd	.LCPI3_16(%rip), %xmm0, %xmm0
	vmovhpd	%xmm0, (%rbx)
	vmovhpd	%xmm0, 8(%rbx)
	vmovhpd	%xmm0, 16(%rbx)
	addq	$464, %rsp              # imm = 0x1D0
	popq	%rbx
	vzeroupper
	ret
.Ltmp8:
	.size	ambient_occlusion, .Ltmp8-ambient_occlusion
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI4_0:
	.quad	4643193623632936960     # double 2.555000e+02
	.quad	4643193623632936960     # double 2.555000e+02
.LCPI4_1:
	.quad	255                     # 0xff
	.quad	255                     # 0xff
	.text
	.globl	clamp
	.align	16, 0x90
	.type	clamp,@function
clamp:                                  # @clamp
	.cfi_startproc
# BB#0:                                 # %entry
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmulpd	.LCPI4_0(%rip), %xmm0, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm0, %xmm1, %xmm2
	vpsllq	$63, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovdqa	.LCPI4_1(%rip), %xmm2
	vpcmpgtq	%xmm2, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm2, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	ret
.Ltmp9:
	.size	clamp, .Ltmp9-clamp
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_0:
	.quad	24                      # 0x18
	.quad	24                      # 0x18
.LCPI5_1:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI5_2:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI5_3:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI5_4:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI5_5:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI5_6:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI5_7:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI5_8:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
.LCPI5_9:
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
.LCPI5_10:
	.quad	4861130398305394688     # double 1.000000e+17
	.quad	4861130398305394688     # double 1.000000e+17
.LCPI5_11:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI5_12:
	.quad	4643193623632936960     # double 2.555000e+02
	.quad	4643193623632936960     # double 2.555000e+02
.LCPI5_13:
	.quad	255                     # 0xff
	.quad	255                     # 0xff
	.section	.rodata,"a",@progbits
	.align	32
.LCPI5_14:
	.zero	32
	.text
	.globl	render
	.align	16, 0x90
	.type	render,@function
render:                                 # @render
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp17:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp18:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp19:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp20:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp21:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp22:
	.cfi_def_cfa_offset 56
	subq	$584, %rsp              # imm = 0x248
.Ltmp23:
	.cfi_def_cfa_offset 640
.Ltmp24:
	.cfi_offset %rbx, -56
.Ltmp25:
	.cfi_offset %r12, -48
.Ltmp26:
	.cfi_offset %r13, -40
.Ltmp27:
	.cfi_offset %r14, -32
.Ltmp28:
	.cfi_offset %r15, -24
.Ltmp29:
	.cfi_offset %rbp, -16
	movl	%ecx, %r12d
	movq	%rdi, %r15
	movq	%r15, 120(%rsp)         # 8-byte Spill
	vmovd	%edx, %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vmovdqa	%xmm2, 32(%rsp)         # 16-byte Spill
	vmovd	%esi, %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, 208(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm2, %r14
	movslq	%r14d, %rax
	vmovq	%rax, %xmm1
	vmovq	%xmm2, %rbp
	movslq	%ebp, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm4 # xmm4 = xmm2[0],xmm1[0]
	vmovdqa	%xmm4, 448(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI5_0(%rip), %xmm1
	vpmuludq	%xmm1, %xmm0, %xmm2
	vpsrlq	$32, %xmm1, %xmm3
	vpmuludq	%xmm3, %xmm0, %xmm3
	vpsllq	$32, %xmm3, %xmm3
	vpaddq	%xmm3, %xmm2, %xmm2
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm1, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm2, %xmm0
	vpmuludq	%xmm4, %xmm0, %xmm1
	vpsrlq	$32, %xmm4, %xmm2
	vpmuludq	%xmm2, %xmm0, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm4, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rbx
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 184(%rsp)         # 8-byte Spill
	xorl	%esi, %esi
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	memset
	vpxor	%xmm10, %xmm10, %xmm10
	vmovdqa	448(%rsp), %xmm0        # 16-byte Reload
	vpcmpgtq	%xmm10, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_8
# BB#1:                                 # %for.cond10.preheader.lr.ph
	vmovd	%r12d, %xmm0
	vpbroadcastq	%xmm0, %xmm3
	vmovdqa	%xmm3, 352(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm3, %r8
	movq	%r8, 112(%rsp)          # 8-byte Spill
	movslq	%r8d, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm3, %r9
	movq	%r9, 104(%rsp)          # 8-byte Spill
	movslq	%r9d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 432(%rsp)        # 16-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movq	48(%rsp), %rax          # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	.LCPI5_1(%rip), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 336(%rsp)        # 16-byte Spill
	movslq	%r14d, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movslq	%ebp, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 224(%rsp)        # 16-byte Spill
	vpsrlq	$32, %xmm3, %xmm0
	vpmuludq	%xmm0, %xmm3, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpmuludq	%xmm3, %xmm3, %xmm1
	vpaddq	%xmm0, %xmm1, %xmm1
	vpaddq	%xmm0, %xmm1, %xmm0
	vmovq	%xmm0, %rax
	cltq
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm8 # xmm8 = xmm1[0],xmm0[0]
	vmovapd	%xmm8, 80(%rsp)         # 16-byte Spill
	vmovdqa	.LCPI5_3(%rip), %xmm13
	vmovapd	.LCPI5_5(%rip), %xmm14
	vmovapd	.LCPI5_7(%rip), %xmm15
	vmovapd	.LCPI5_12(%rip), %xmm9
	vmovdqa	.LCPI5_13(%rip), %xmm6
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	leaq	504(%rsp), %r13
	leaq	528(%rsp), %rbp
	movabsq	$4861130398305394688, %r14 # imm = 0x4376345785D8A000
	.align	16, 0x90
.LBB5_2:                                # %for.cond10.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
                                        #       Child Loop BB5_36 Depth 3
                                        #         Child Loop BB5_11 Depth 4
	movq	56(%rsp), %rax          # 8-byte Reload
	cltq
	vmovq	%rax, %xmm0
	movq	48(%rsp), %rax          # 8-byte Reload
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm10, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_7
# BB#3:                                 # %for.cond14.preheader.lr.ph
                                        #   in Loop: Header=BB5_2 Depth=1
	vmovdqa	64(%rsp), %xmm3         # 16-byte Reload
	vmovq	%xmm3, %rax
	cltq
	vpextrq	$1, %xmm3, %rcx
	movslq	%ecx, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 240(%rsp)        # 16-byte Spill
	vmovdqa	208(%rsp), %xmm2        # 16-byte Reload
	vpmuludq	%xmm2, %xmm3, %xmm0
	vpsrlq	$32, %xmm2, %xmm1
	vpmuludq	%xmm1, %xmm3, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpsrlq	$32, %xmm3, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vmovdqa	%xmm0, 192(%rsp)        # 16-byte Spill
	vpxor	%xmm7, %xmm7, %xmm7
	.align	16, 0x90
.LBB5_4:                                # %for.cond14.preheader
                                        #   Parent Loop BB5_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_36 Depth 3
                                        #         Child Loop BB5_11 Depth 4
	movslq	%r8d, %rax
	vmovq	%rax, %xmm0
	movslq	%r9d, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm10, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_5
# BB#35:                                # %for.cond18.preheader.lr.ph.split.us
                                        #   in Loop: Header=BB5_4 Depth=2
	vmovq	%xmm7, %rax
	cltq
	vpextrq	$1, %xmm7, %rcx
	movslq	%ecx, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 368(%rsp)        # 16-byte Spill
	vpaddq	192(%rsp), %xmm7, %xmm0 # 16-byte Folded Reload
	vmovdqa	%xmm7, 160(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI5_2(%rip), %xmm1
	vmovdqa	%xmm1, %xmm3
	vpmuludq	%xmm3, %xmm0, %xmm1
	vpsrlq	$32, %xmm3, %xmm2
	vpmuludq	%xmm2, %xmm0, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm3, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovdqa	%xmm1, 304(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	movq	184(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %r15
	vmovq	%r15, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 288(%rsp)        # 16-byte Spill
	vpaddq	%xmm13, %xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovdqa	%xmm1, 272(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	leaq	(%rcx,%rax,8), %r12
	vmovq	%r12, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 256(%rsp)        # 16-byte Spill
	vpaddq	.LCPI5_4(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vmovdqa	%xmm0, 144(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	leaq	(%rcx,%rax,8), %rbx
	vmovq	%rbx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vpxor	%xmm6, %xmm6, %xmm6
	.align	16, 0x90
.LBB5_36:                               # %for.body21.lr.ph.us
                                        #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_11 Depth 4
	vmovdqa	%xmm6, 320(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm6, %rax
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm6, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vdivpd	432(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovapd	240(%rsp), %xmm1        # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	224(%rsp), %xmm1        # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm14, %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 416(%rsp)        # 16-byte Spill
	vunpckhpd	%xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,1]
	vmovapd	%xmm1, 400(%rsp)        # 16-byte Spill
	vmulpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 384(%rsp)        # 16-byte Spill
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB5_11:                               # %for.body21.us
                                        #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_36 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vpextrq	$1, %xmm3, %rax
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vdivpd	432(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovapd	368(%rsp), %xmm1        # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	336(%rsp), %xmm1        # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm11
	vmovhpd	%xmm11, 560(%rsp)
	vmovaps	400(%rsp), %xmm0        # 16-byte Reload
	vmovsd	%xmm0, 568(%rsp)
	vmulpd	%xmm11, %xmm11, %xmm1
	vmovapd	384(%rsp), %xmm0        # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vaddpd	.LCPI5_6(%rip), %xmm1, %xmm1
	vsqrtpd	%xmm1, %xmm1
	vandpd	%xmm15, %xmm1, %xmm2
	vmovapd	.LCPI5_8(%rip), %xmm0
	vcmpltpd	%xmm2, %xmm0, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB5_12
# BB#13:                                # %if.then.i.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	%xmm3, 448(%rsp)        # 16-byte Spill
	vdivpd	%xmm1, %xmm11, %xmm11
	vmovhpd	%xmm11, 560(%rsp)
	vmovapd	416(%rsp), %xmm0        # 16-byte Reload
	vdivpd	%xmm1, %xmm0, %xmm8
	vmovhpd	%xmm8, 568(%rsp)
	vmovapd	.LCPI5_9(%rip), %xmm0
	vdivpd	%xmm1, %xmm0, %xmm10
	jmp	.LBB5_14
	.align	16, 0x90
.LBB5_12:                               #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	%xmm3, 448(%rsp)        # 16-byte Spill
	vmovapd	.LCPI5_9(%rip), %xmm10
	vmovapd	416(%rsp), %xmm8        # 16-byte Reload
.LBB5_14:                               # %vnormalize.exit.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vxorpd	%xmm12, %xmm12, %xmm12
	movq	%r14, 496(%rsp)
	movl	$0, 552(%rsp)
	vmovddup	spheres(%rip), %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vsubpd	%xmm2, %xmm3, %xmm4
	vmovddup	spheres+8(%rip), %xmm2
	vsubpd	%xmm2, %xmm3, %xmm5
	vmovddup	spheres+16(%rip), %xmm2
	vsubpd	%xmm2, %xmm3, %xmm6
	vmulpd	%xmm11, %xmm4, %xmm2
	vmulpd	%xmm8, %xmm5, %xmm7
	vaddpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm6, %xmm10, %xmm7
	vaddpd	%xmm2, %xmm7, %xmm2
	vmulpd	%xmm4, %xmm4, %xmm4
	vmulpd	%xmm5, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmulpd	%xmm6, %xmm6, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	spheres+24(%rip), %xmm5
	vmulpd	%xmm5, %xmm5, %xmm5
	vsubpd	%xmm5, %xmm4, %xmm4
	vmulpd	%xmm2, %xmm2, %xmm5
	vsubpd	%xmm4, %xmm5, %xmm6
	vcmpltpd	%xmm6, %xmm3, %xmm4
	vptest	%xmm4, %xmm4
	vmovapd	%xmm11, %xmm5
	vmovapd	.LCPI5_10(%rip), %xmm9
	je	.LBB5_19
# BB#15:                                # %if.then.i
                                        #   in Loop: Header=BB5_11 Depth=4
	vxorpd	%xmm14, %xmm2, %xmm2
	vsqrtpd	%xmm6, %xmm3
	vsubpd	%xmm3, %xmm2, %xmm6
	vxorpd	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm6, %xmm3, %xmm2
	vmovapd	.LCPI5_10(%rip), %xmm0
	vcmpltpd	%xmm0, %xmm6, %xmm4
	vandpd	%xmm4, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	vmovapd	%xmm11, %xmm5
	vmovapd	%xmm0, %xmm9
	je	.LBB5_19
# BB#16:                                # %if.then24.i
                                        #   in Loop: Header=BB5_11 Depth=4
	vunpckhpd	%xmm6, %xmm6, %xmm2 # xmm2 = xmm6[1,1]
	vmovsd	%xmm2, 496(%rsp)
	movl	$1, 552(%rsp)
	vmovapd	560(%rsp), %xmm9
	vinsertf128	$1, %xmm9, %ymm9, %ymm2
	vpermpd	$80, %ymm6, %ymm3       # ymm3 = ymm6[0,0,1,1]
	vmulpd	%ymm2, %ymm3, %ymm2
	vaddpd	.LCPI5_14, %ymm2, %ymm2
	vmovupd	%xmm2, (%r13)
	vmulpd	%xmm6, %xmm10, %xmm3
	vaddpd	%xmm12, %xmm3, %xmm4
	vmovhpd	%xmm4, 520(%rsp)
	vmovapd	spheres(%rip), %xmm3
	vinsertf128	$1, %xmm3, %ymm3, %ymm3
	vsubpd	%ymm3, %ymm2, %ymm3
	vmovupd	%xmm3, (%rbp)
	vmovddup	spheres+16(%rip), %xmm2
	vsubpd	%xmm2, %xmm4, %xmm4
	vmovhpd	%xmm4, 544(%rsp)
	vextractf128	$1, %ymm3, %xmm2
	vunpcklpd	%xmm2, %xmm3, %xmm7 # xmm7 = xmm3[0],xmm2[0]
	vmulpd	%xmm7, %xmm7, %xmm7
	vunpckhpd	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[1,1]
	vunpckhpd	%xmm3, %xmm3, %xmm5 # xmm5 = xmm3[1,1]
	vunpcklpd	%xmm2, %xmm5, %xmm2 # xmm2 = xmm5[0],xmm2[0]
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm7, %xmm2
	vmulpd	%xmm4, %xmm4, %xmm5
	vaddpd	%xmm2, %xmm5, %xmm2
	vsqrtpd	%xmm2, %xmm2
	vandpd	%xmm15, %xmm2, %xmm7
	vpbroadcastq	%xmm9, %xmm5
	vmovapd	.LCPI5_8(%rip), %xmm0
	vcmpltpd	%xmm7, %xmm0, %xmm7
	vptest	%xmm7, %xmm7
	je	.LBB5_18
# BB#17:                                # %if.then.i.i
                                        #   in Loop: Header=BB5_11 Depth=4
	vpermpd	$80, %ymm2, %ymm7       # ymm7 = ymm2[0,0,1,1]
	vdivpd	%ymm7, %ymm3, %ymm3
	vmovupd	%xmm3, (%rbp)
	vdivpd	%xmm2, %xmm4, %xmm2
	vmovhpd	%xmm2, 544(%rsp)
.LBB5_18:                               # %ray_sphere_intersect.exit
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	%xmm13, %xmm3
	vmovapd	%xmm6, %xmm9
.LBB5_19:                               # %ray_sphere_intersect.exit
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovddup	spheres+32(%rip), %xmm2
	vsubpd	%xmm2, %xmm12, %xmm6
	vmovddup	spheres+40(%rip), %xmm2
	vsubpd	%xmm2, %xmm12, %xmm7
	vmovddup	spheres+48(%rip), %xmm2
	vsubpd	%xmm2, %xmm12, %xmm1
	vmulpd	%xmm5, %xmm6, %xmm2
	vmulpd	%xmm8, %xmm7, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm0
	vmulpd	%xmm1, %xmm10, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm2
	vmulpd	%xmm6, %xmm6, %xmm0
	vmulpd	%xmm7, %xmm7, %xmm6
	vaddpd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	spheres+56(%rip), %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm2, %xmm1
	vsubpd	%xmm0, %xmm1, %xmm6
	vcmpltpd	%xmm6, %xmm12, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_24
# BB#20:                                # %if.then.i32
                                        #   in Loop: Header=BB5_11 Depth=4
	vxorpd	%xmm14, %xmm2, %xmm0
	vsqrtpd	%xmm6, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm6
	vcmpltpd	%xmm6, %xmm12, %xmm0
	vcmpltpd	%xmm9, %xmm6, %xmm1
	vandpd	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_24
# BB#21:                                # %if.then24.i52
                                        #   in Loop: Header=BB5_11 Depth=4
	vunpckhpd	%xmm6, %xmm6, %xmm0 # xmm0 = xmm6[1,1]
	vmovsd	%xmm0, 496(%rsp)
	movl	$1, 552(%rsp)
	vmovapd	560(%rsp), %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm1
	vpermpd	$80, %ymm6, %ymm2       # ymm2 = ymm6[0,0,1,1]
	vmulpd	%ymm1, %ymm2, %ymm1
	vaddpd	.LCPI5_14, %ymm1, %ymm1
	vmovupd	%xmm1, (%r13)
	vmulpd	%xmm6, %xmm10, %xmm2
	vaddpd	%xmm12, %xmm2, %xmm2
	vmovhpd	%xmm2, 520(%rsp)
	vmovapd	spheres+32(%rip), %xmm3
	vinsertf128	$1, %xmm3, %ymm3, %ymm3
	vsubpd	%ymm3, %ymm1, %ymm3
	vmovupd	%xmm3, (%rbp)
	vmovddup	spheres+48(%rip), %xmm1
	vsubpd	%xmm1, %xmm2, %xmm4
	vmovhpd	%xmm4, 544(%rsp)
	vextractf128	$1, %ymm3, %xmm1
	vunpcklpd	%xmm1, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm1[0]
	vmulpd	%xmm2, %xmm2, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,1]
	vunpckhpd	%xmm3, %xmm3, %xmm5 # xmm5 = xmm3[1,1]
	vunpcklpd	%xmm1, %xmm5, %xmm1 # xmm1 = xmm5[0],xmm1[0]
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm4, %xmm4, %xmm2
	vaddpd	%xmm1, %xmm2, %xmm1
	vsqrtpd	%xmm1, %xmm2
	vandpd	%xmm15, %xmm2, %xmm1
	vpbroadcastq	%xmm0, %xmm5
	vmovapd	.LCPI5_8(%rip), %xmm0
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_23
# BB#22:                                # %if.then.i.i54
                                        #   in Loop: Header=BB5_11 Depth=4
	vpermpd	$80, %ymm2, %ymm0       # ymm0 = ymm2[0,0,1,1]
	vdivpd	%ymm0, %ymm3, %ymm0
	vmovupd	%xmm0, (%rbp)
	vdivpd	%xmm2, %xmm4, %xmm0
	vmovhpd	%xmm0, 544(%rsp)
.LBB5_23:                               # %ray_sphere_intersect.exit55
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	%xmm13, %xmm3
	vmovapd	%xmm6, %xmm9
.LBB5_24:                               # %ray_sphere_intersect.exit55
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovddup	spheres+64(%rip), %xmm0
	vsubpd	%xmm0, %xmm12, %xmm0
	vmovddup	spheres+72(%rip), %xmm1
	vsubpd	%xmm1, %xmm12, %xmm1
	vmovddup	spheres+80(%rip), %xmm2
	vsubpd	%xmm2, %xmm12, %xmm6
	vmulpd	%xmm5, %xmm0, %xmm2
	vmulpd	%xmm8, %xmm1, %xmm5
	vaddpd	%xmm5, %xmm2, %xmm2
	vmulpd	%xmm6, %xmm10, %xmm5
	vaddpd	%xmm2, %xmm5, %xmm2
	vmulpd	%xmm0, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm6, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	spheres+88(%rip), %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm2, %xmm1
	vsubpd	%xmm0, %xmm1, %xmm5
	vcmpltpd	%xmm5, %xmm12, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_29
# BB#25:                                # %if.then.i87
                                        #   in Loop: Header=BB5_11 Depth=4
	vxorpd	%xmm14, %xmm2, %xmm0
	vsqrtpd	%xmm5, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm5
	vcmpltpd	%xmm5, %xmm12, %xmm0
	vcmpltpd	%xmm9, %xmm5, %xmm1
	vandpd	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_29
# BB#26:                                # %if.then24.i107
                                        #   in Loop: Header=BB5_11 Depth=4
	vunpckhpd	%xmm5, %xmm5, %xmm0 # xmm0 = xmm5[1,1]
	vmovsd	%xmm0, 496(%rsp)
	movl	$1, 552(%rsp)
	vmovapd	560(%rsp), %xmm0
	vinsertf128	$1, %xmm0, %ymm0, %ymm0
	vpermpd	$80, %ymm5, %ymm1       # ymm1 = ymm5[0,0,1,1]
	vmulpd	%ymm0, %ymm1, %ymm0
	vaddpd	.LCPI5_14, %ymm0, %ymm0
	vmovupd	%xmm0, (%r13)
	vmulpd	%xmm5, %xmm10, %xmm1
	vaddpd	%xmm12, %xmm1, %xmm1
	vmovhpd	%xmm1, 520(%rsp)
	vmovapd	spheres+64(%rip), %xmm2
	vinsertf128	$1, %xmm2, %ymm2, %ymm2
	vsubpd	%ymm2, %ymm0, %ymm3
	vmovupd	%xmm3, (%rbp)
	vmovddup	spheres+80(%rip), %xmm0
	vsubpd	%xmm0, %xmm1, %xmm4
	vmovhpd	%xmm4, 544(%rsp)
	vextractf128	$1, %ymm3, %xmm0
	vunpcklpd	%xmm0, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm0[0]
	vmulpd	%xmm1, %xmm1, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vunpckhpd	%xmm3, %xmm3, %xmm2 # xmm2 = xmm3[1,1]
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm4, %xmm4, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vsqrtpd	%xmm0, %xmm2
	vandpd	%xmm15, %xmm2, %xmm0
	vmovapd	.LCPI5_8(%rip), %xmm1
	vcmpltpd	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_28
# BB#27:                                # %if.then.i.i109
                                        #   in Loop: Header=BB5_11 Depth=4
	vpermpd	$80, %ymm2, %ymm0       # ymm0 = ymm2[0,0,1,1]
	vdivpd	%ymm0, %ymm3, %ymm0
	vmovupd	%xmm0, (%rbp)
	vdivpd	%xmm2, %xmm4, %xmm0
	vmovhpd	%xmm0, 544(%rsp)
.LBB5_28:                               # %ray_sphere_intersect.exit110
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovapd	%xmm5, %xmm9
	vmovdqa	%xmm13, %xmm3
.LBB5_29:                               # %ray_sphere_intersect.exit110
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovsd	plane+24(%rip), %xmm0
	vpermilpd	$0, %xmm0, %xmm6 # xmm6 = xmm0[0,0]
	vmovddup	plane+32(%rip), %xmm7
	vmovddup	plane+40(%rip), %xmm5
	vmulpd	%xmm6, %xmm11, %xmm0
	vmulpd	%xmm7, %xmm8, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm10, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm2
	vandpd	%xmm15, %xmm2, %xmm0
	vcmpltpd	.LCPI5_8(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB5_32
# BB#30:                                # %if.end.i.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovddup	plane+8(%rip), %xmm0
	vmovddup	plane(%rip), %xmm1
	vmulpd	%xmm0, %xmm7, %xmm0
	vmulpd	%xmm1, %xmm6, %xmm1
	vmovddup	plane+16(%rip), %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vaddpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm4, %xmm0, %xmm0
	vmulpd	%xmm12, %xmm6, %xmm1
	vmulpd	%xmm12, %xmm7, %xmm4
	vaddpd	%xmm4, %xmm1, %xmm1
	vmulpd	%xmm12, %xmm5, %xmm4
	vaddpd	%xmm4, %xmm1, %xmm1
	vsubpd	%xmm0, %xmm1, %xmm0
	vxorpd	%xmm14, %xmm0, %xmm0
	vdivpd	%xmm2, %xmm0, %xmm2
	vcmpltpd	%xmm2, %xmm12, %xmm0
	vcmpltpd	%xmm9, %xmm2, %xmm1
	vandpd	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_32
# BB#31:                                # %ray_plane_intersect.exit.us.thread
                                        #   in Loop: Header=BB5_11 Depth=4
	vunpckhpd	%xmm2, %xmm2, %xmm0 # xmm0 = xmm2[1,1]
	vmovsd	%xmm0, 496(%rsp)
	movl	$1, 552(%rsp)
	vmulpd	%xmm2, %xmm11, %xmm0
	vaddpd	%xmm12, %xmm0, %xmm0
	vmovhpd	%xmm0, 504(%rsp)
	vmulpd	%xmm2, %xmm8, %xmm0
	vaddpd	%xmm12, %xmm0, %xmm0
	vmovhpd	%xmm0, 512(%rsp)
	vmulpd	%xmm2, %xmm10, %xmm0
	vaddpd	%xmm12, %xmm0, %xmm0
	vmovhpd	%xmm0, 520(%rsp)
	movq	plane+40(%rip), %rax
	movq	%rax, 16(%rbp)
	vmovdqu	plane+24(%rip), %xmm0
	vmovdqu	%xmm0, (%rbp)
	jmp	.LBB5_33
	.align	16, 0x90
.LBB5_32:                               # %ray_plane_intersect.exit.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vandpd	.LCPI5_11(%rip), %xmm3, %xmm0
	vpcmpeqq	%xmm12, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB5_34
.LBB5_33:                               # %if.then.us
                                        #   in Loop: Header=BB5_11 Depth=4
	leaq	472(%rsp), %rdi
	leaq	496(%rsp), %rsi
	vzeroupper
	callq	ambient_occlusion
	vmovapd	.LCPI5_7(%rip), %xmm15
	vmovapd	.LCPI5_5(%rip), %xmm14
	vmovddup	472(%rsp), %xmm0
	vmovddup	(%r15), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%r15)
	vmovddup	480(%rsp), %xmm0
	vmovddup	(%r12), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%r12)
	vmovddup	488(%rsp), %xmm0
	vmovddup	(%rbx), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%rbx)
.LBB5_34:                               # %if.end.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	.LCPI5_3(%rip), %xmm13
	vmovdqa	448(%rsp), %xmm3        # 16-byte Reload
	vpaddq	%xmm13, %xmm3, %xmm3
	vmovdqa	.LCPI5_11(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm3, %xmm1
	vmovdqa	352(%rsp), %xmm0        # 16-byte Reload
	vpand	%xmm2, %xmm0, %xmm0
	vpcmpeqq	%xmm0, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB5_11
# BB#9:                                 # %for.inc75.us
                                        #   in Loop: Header=BB5_36 Depth=3
	vmovdqa	320(%rsp), %xmm6        # 16-byte Reload
	vpaddq	%xmm13, %xmm6, %xmm6
	vpand	.LCPI5_11(%rip), %xmm6, %xmm1
	vpcmpeqq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	304(%rsp), %xmm3        # 16-byte Reload
	vmovaps	288(%rsp), %xmm4        # 16-byte Reload
	vmovdqa	272(%rsp), %xmm2        # 16-byte Reload
	vmovaps	256(%rsp), %xmm5        # 16-byte Reload
	je	.LBB5_36
# BB#10:                                #   in Loop: Header=BB5_4 Depth=2
	movq	120(%rsp), %r15         # 8-byte Reload
	vxorpd	%xmm10, %xmm10, %xmm10
	movq	112(%rsp), %r8          # 8-byte Reload
	movq	104(%rsp), %r9          # 8-byte Reload
	vmovapd	80(%rsp), %xmm8         # 16-byte Reload
	vmovapd	.LCPI5_12(%rip), %xmm7
	vmovapd	%xmm7, %xmm9
	vmovdqa	.LCPI5_13(%rip), %xmm6
	vmovdqa	160(%rsp), %xmm7        # 16-byte Reload
	vmovdqa	144(%rsp), %xmm1        # 16-byte Reload
	vmovaps	128(%rsp), %xmm0        # 16-byte Reload
	jmp	.LBB5_6
	.align	16, 0x90
.LBB5_5:                                # %for.cond14.preheader.for.end77_crit_edge
                                        #   in Loop: Header=BB5_4 Depth=2
	vpaddq	192(%rsp), %xmm7, %xmm0 # 16-byte Folded Reload
	vmovdqa	.LCPI5_2(%rip), %xmm1
	vmovdqa	%xmm1, %xmm3
	vpmuludq	%xmm3, %xmm0, %xmm1
	vpsrlq	$32, %xmm3, %xmm2
	vpmuludq	%xmm2, %xmm0, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm3, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm3 # xmm3 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm3, %rax
	movq	184(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm4 # xmm4 = xmm1[0,0]
	vpaddq	%xmm13, %xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm2, %rax
	leaq	(%rcx,%rax,8), %rax
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm5 # xmm5 = xmm1[0,0]
	vpaddq	.LCPI5_4(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1 # xmm1 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm1, %rax
	leaq	(%rcx,%rax,8), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
.LBB5_6:                                # %for.end77
                                        #   in Loop: Header=BB5_4 Depth=2
	vpextrq	$1, %xmm0, %rax
	vpextrq	$1, %xmm5, %rcx
	vpextrq	$1, %xmm4, %rdx
	vpextrq	$1, %xmm1, %rsi
	vpextrq	$1, %xmm2, %rdi
	vpextrq	$1, %xmm3, %rbx
	vmovddup	(%rdx), %xmm0
	vdivpd	%xmm8, %xmm0, %xmm0
	vmovhpd	%xmm0, (%rdx)
	vmovhpd	%xmm0, (%rdx)
	vmovddup	(%rcx), %xmm1
	vdivpd	%xmm8, %xmm1, %xmm1
	vmovhpd	%xmm1, (%rcx)
	vmovhpd	%xmm1, (%rcx)
	vmovddup	(%rax), %xmm2
	vdivpd	%xmm8, %xmm2, %xmm2
	vmovhpd	%xmm2, (%rax)
	vmovhpd	%xmm2, (%rax)
	vmulpd	%xmm9, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm3
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm10, %xmm3
	vpsllq	$63, %xmm3, %xmm3
	vblendvpd	%xmm3, %xmm10, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm6, %xmm3, %xmm3
	vblendvpd	%xmm3, %xmm6, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	movb	%al, (%r15,%rbx)
	vmulpd	%xmm9, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm10, %xmm1
	vpsllq	$63, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm10, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm1, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm1[0]
	vpcmpgtq	%xmm6, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	movb	%al, (%r15,%rdi)
	vmulpd	%xmm9, %xmm2, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm10, %xmm1
	vpsllq	$63, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm10, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm6, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm6, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	movb	%al, (%r15,%rsi)
	vpaddq	%xmm13, %xmm7, %xmm7
	vmovdqa	.LCPI5_11(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm7, %xmm0
	vmovdqa	208(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_4
.LBB5_7:                                # %for.inc147
                                        #   in Loop: Header=BB5_2 Depth=1
	vmovdqa	64(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm13, %xmm1, %xmm1
	vmovdqa	%xmm1, 64(%rsp)         # 16-byte Spill
	vmovdqa	.LCPI5_11(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm1, %xmm0
	vmovdqa	32(%rsp), %xmm1         # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB5_2
.LBB5_8:                                # %for.end149
	addq	$584, %rsp              # imm = 0x248
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	ret
.Ltmp30:
	.size	render, .Ltmp30-render
	.cfi_endproc

	.globl	init_scene
	.align	16, 0x90
	.type	init_scene,@function
init_scene:                             # @init_scene
	.cfi_startproc
# BB#0:                                 # %entry
	movabsq	$-4611686018427387904, %rax # imm = 0xC000000000000000
	movq	%rax, spheres(%rip)
	movq	$0, spheres+8(%rip)
	movabsq	$-4608308318706860032, %rax # imm = 0xC00C000000000000
	movq	%rax, spheres+16(%rip)
	movabsq	$4602678819172646912, %rax # imm = 0x3FE0000000000000
	movq	%rax, spheres+24(%rip)
	movabsq	$-4620693217682128896, %rcx # imm = 0xBFE0000000000000
	movq	%rcx, spheres+32(%rip)
	movq	$0, spheres+40(%rip)
	movabsq	$-4609434218613702656, %rdx # imm = 0xC008000000000000
	movq	%rdx, spheres+48(%rip)
	movq	%rax, spheres+56(%rip)
	movabsq	$4607182418800017408, %rdx # imm = 0x3FF0000000000000
	movq	%rdx, spheres+64(%rip)
	movq	$0, spheres+72(%rip)
	movabsq	$-4611235658464650854, %rsi # imm = 0xC00199999999999A
	movq	%rsi, spheres+80(%rip)
	movq	%rax, spheres+88(%rip)
	movq	$0, plane(%rip)
	movq	%rcx, plane+8(%rip)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, plane+16(%rip)
	movq	%rdx, plane+32(%rip)
	movq	$0, plane+40(%rip)
	ret
.Ltmp31:
	.size	init_scene, .Ltmp31-init_scene
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
	.text
	.globl	saveppm
	.align	16, 0x90
	.type	saveppm,@function
saveppm:                                # @saveppm
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp37:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp38:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp39:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp40:
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
.Ltmp41:
	.cfi_def_cfa_offset 80
.Ltmp42:
	.cfi_offset %rbx, -40
.Ltmp43:
	.cfi_offset %r14, -32
.Ltmp44:
	.cfi_offset %r15, -24
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rcx, %r14
	movl	%edx, %r15d
	movl	%esi, %ebp
	movl	$.L.str, %esi
	callq	fopen
	movq	%rax, %rbx
	vmovq	%rbx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB7_1
# BB#2:                                 # %cond.end
	vmovd	%r15d, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	%xmm0, 16(%rsp)         # 16-byte Spill
	vmovd	%ebp, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	%xmm0, (%rsp)           # 16-byte Spill
	movl	$.L.str3, %edi
	movl	$3, %esi
	movl	$1, %edx
	movq	%rbx, %rcx
	callq	fwrite
	movl	$.L.str4, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%ebp, %edx
	movl	%r15d, %ecx
	callq	fprintf
	movl	$.L.str5, %edi
	movl	$4, %esi
	movl	$1, %edx
	movq	%rbx, %rcx
	callq	fwrite
	vmovdqa	.LCPI7_0(%rip), %xmm0
	vmovdqa	(%rsp), %xmm3           # 16-byte Reload
	vpmuludq	%xmm0, %xmm3, %xmm1
	vpsrlq	$32, %xmm0, %xmm2
	vpmuludq	%xmm2, %xmm3, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vpsrlq	$32, %xmm3, %xmm2
	vpmuludq	%xmm0, %xmm2, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vmovdqa	16(%rsp), %xmm3         # 16-byte Reload
	vpmuludq	%xmm3, %xmm0, %xmm1
	vpsrlq	$32, %xmm3, %xmm2
	vpmuludq	%xmm2, %xmm0, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm3, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rsi
	movl	$1, %edx
	movq	%r14, %rdi
	movq	%rbx, %rcx
	callq	fwrite
	movq	%rbx, %rdi
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	fclose                  # TAILCALL
.LBB7_1:                                # %cond.false
	movl	$.L.str1, %edi
	movl	$.L.str2, %esi
	movl	$326, %edx              # imm = 0x146
	movl	$.L__PRETTY_FUNCTION__.saveppm, %ecx
	callq	__assert_fail
.Ltmp46:
	.size	saveppm, .Ltmp46-saveppm
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI8_0:
	.quad	1000000                 # 0xf4240
	.quad	1000000                 # 0xf4240
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp50:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 24
	subq	$88, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 112
.Ltmp53:
	.cfi_offset %rbx, -24
.Ltmp54:
	.cfi_offset %r14, -16
	movl	$786432, %edi           # imm = 0xC0000
	callq	malloc
	movq	%rax, %r14
	movabsq	$-4611686018427387904, %rax # imm = 0xC000000000000000
	movq	%rax, spheres(%rip)
	movq	$0, spheres+8(%rip)
	movabsq	$-4608308318706860032, %rax # imm = 0xC00C000000000000
	movq	%rax, spheres+16(%rip)
	movabsq	$4602678819172646912, %rax # imm = 0x3FE0000000000000
	movq	%rax, spheres+24(%rip)
	movabsq	$-4620693217682128896, %rcx # imm = 0xBFE0000000000000
	movq	%rcx, spheres+32(%rip)
	movq	$0, spheres+40(%rip)
	movabsq	$-4609434218613702656, %rdx # imm = 0xC008000000000000
	movq	%rdx, spheres+48(%rip)
	movq	%rax, spheres+56(%rip)
	movabsq	$4607182418800017408, %rdx # imm = 0x3FF0000000000000
	movq	%rdx, spheres+64(%rip)
	movq	$0, spheres+72(%rip)
	movabsq	$-4611235658464650854, %rsi # imm = 0xC00199999999999A
	movq	%rsi, spheres+80(%rip)
	movq	%rax, spheres+88(%rip)
	movq	$0, plane(%rip)
	movq	%rcx, plane+8(%rip)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, plane+16(%rip)
	movq	%rdx, plane+32(%rip)
	movq	$0, plane+40(%rip)
	leaq	72(%rsp), %rbx
	movl	$1, %edi
	movq	%rbx, %rsi
	callq	clock_gettime
	vpbroadcastq	72(%rsp), %xmm0
	vmovdqa	%xmm0, 48(%rsp)         # 16-byte Spill
	vpbroadcastq	80(%rsp), %xmm0
	vmovdqa	%xmm0, 16(%rsp)         # 16-byte Spill
	movl	$512, %esi              # imm = 0x200
	movl	$512, %edx              # imm = 0x200
	movl	$4, %ecx
	movq	%r14, %rdi
	callq	render
	movl	$1, %edi
	movq	%rbx, %rsi
	callq	clock_gettime
	vpbroadcastq	72(%rsp), %xmm0
	vmovdqa	%xmm0, 32(%rsp)         # 16-byte Spill
	vpbroadcastq	80(%rsp), %xmm0
	vpextrq	$1, %xmm0, %rax
	movabsq	$2361183241434822607, %rcx # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm1
	vmovq	%xmm0, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vmovdqa	%xmm0, (%rsp)           # 16-byte Spill
	movl	$.L.str6, %edi
	movl	$512, %esi              # imm = 0x200
	movl	$512, %edx              # imm = 0x200
	movq	%r14, %rcx
	callq	saveppm
	vmovdqa	16(%rsp), %xmm1         # 16-byte Reload
	vpextrq	$1, %xmm1, %rax
	movabsq	$-2361183241434822607, %rcx # imm = 0xDF3B645A1CAC0831
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm0
	vmovq	%xmm1, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	48(%rsp), %xmm1         # 16-byte Reload
	vmovdqa	32(%rsp), %xmm2         # 16-byte Reload
	vpsubq	%xmm1, %xmm2, %xmm1
	vmovdqa	.LCPI8_0(%rip), %xmm2
	vpmuludq	%xmm2, %xmm1, %xmm3
	vpsrlq	$32, %xmm2, %xmm4
	vpmuludq	%xmm4, %xmm1, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm3, %xmm3
	vpsrlq	$32, %xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm3, %xmm1
	vpaddq	(%rsp), %xmm0, %xmm0    # 16-byte Folded Reload
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rsi
	movl	$.L.str7, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp55:
	.size	main, .Ltmp55-main
	.cfi_endproc

	.type	spheres,@object         # @spheres
	.comm	spheres,96,16
	.type	plane,@object           # @plane
	.comm	plane,48,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"wb"
	.size	.L.str, 3

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"fp"
	.size	.L.str1, 3

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"ao.c"
	.size	.L.str2, 5

	.type	.L__PRETTY_FUNCTION__.saveppm,@object # @__PRETTY_FUNCTION__.saveppm
.L__PRETTY_FUNCTION__.saveppm:
	.asciz	"void saveppm(const char *, int, int, unsigned char *)"
	.size	.L__PRETTY_FUNCTION__.saveppm, 54

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"P6\n"
	.size	.L.str3, 4

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	"%d %d\n"
	.size	.L.str4, 7

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	"255\n"
	.size	.L.str5, 5

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	"ao.ppm"
	.size	.L.str6, 7

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	"The total CPU time is %lld microseconds.\n"
	.size	.L.str7, 42


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
