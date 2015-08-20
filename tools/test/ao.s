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
	vpextrq	$1, %xmm3, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	vmovq	%xmm3, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	movb	-2(%rsp), %al
	testb	%al, %al
	je	.LBB0_5
# BB#1:                                 # %if.then
	vxorpd	.LCPI0_0(%rip), %xmm0, %xmm0
	vsqrtpd	%xmm2, %xmm2
	vsubpd	%xmm2, %xmm0, %xmm0
	vcmpltpd	%xmm0, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	movb	-4(%rsp), %al
	testb	%al, %al
	je	.LBB0_5
# BB#2:                                 # %land.lhs.true
	vmovddup	(%rdi), %xmm1
	vcmpltpd	%xmm1, %xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	movb	-6(%rsp), %al
	testb	%al, %al
	je	.LBB0_5
# BB#3:                                 # %if.then24
	vmovhpd	%xmm0, (%rdi)
	movl	$1, 56(%rdi)
	vmovddup	(%rsi), %xmm1
	vmovddup	24(%rsi), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovhpd	%xmm1, 8(%rdi)
	vmovddup	8(%rsi), %xmm2
	vmovddup	32(%rsi), %xmm3
	vmulpd	%xmm3, %xmm0, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovhpd	%xmm2, 16(%rdi)
	vmovddup	16(%rsi), %xmm3
	vmovddup	40(%rsi), %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vmovhpd	%xmm0, 24(%rdi)
	vmovddup	(%rdx), %xmm3
	vsubpd	%xmm3, %xmm1, %xmm1
	vmovhpd	%xmm1, 32(%rdi)
	vmovddup	8(%rdx), %xmm3
	vsubpd	%xmm3, %xmm2, %xmm2
	vmovhpd	%xmm2, 40(%rdi)
	vmovddup	16(%rdx), %xmm3
	vsubpd	%xmm3, %xmm0, %xmm0
	vmovhpd	%xmm0, 48(%rdi)
	vmulpd	%xmm1, %xmm1, %xmm1
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vandpd	.LCPI0_1(%rip), %xmm0, %xmm1
	vmovapd	.LCPI0_2(%rip), %xmm2
	vcmpltpd	%xmm1, %xmm2, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, -8(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, -8(%rsp)
	movb	-8(%rsp), %al
	testb	%al, %al
	je	.LBB0_5
# BB#4:                                 # %if.then.i
	vmovddup	32(%rdi), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm1
	vmovhpd	%xmm1, 32(%rdi)
	vmovddup	40(%rdi), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm1
	vmovhpd	%xmm1, 40(%rdi)
	vmovddup	48(%rdi), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovhpd	%xmm0, 48(%rdi)
.LBB0_5:                                # %if.end69
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
	vmovddup	24(%rdx), %xmm7
	vmovddup	32(%rdx), %xmm3
	vmovddup	40(%rdx), %xmm6
	vmovddup	24(%rsi), %xmm2
	vmovddup	32(%rsi), %xmm11
	vmovddup	40(%rsi), %xmm10
	vmulpd	%xmm2, %xmm7, %xmm4
	vmulpd	%xmm11, %xmm3, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmulpd	%xmm10, %xmm6, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vandpd	.LCPI1_0(%rip), %xmm4, %xmm5
	vcmpltpd	.LCPI1_1(%rip), %xmm5, %xmm5
	vpextrq	$1, %xmm5, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	vmovq	%xmm5, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	movb	-2(%rsp), %al
	testb	%al, %al
	jne	.LBB1_4
# BB#1:                                 # %if.end
	vmovddup	8(%rdx), %xmm5
	vmovddup	(%rdx), %xmm0
	vmulpd	%xmm5, %xmm3, %xmm5
	vmulpd	%xmm0, %xmm7, %xmm0
	vmovddup	16(%rdx), %xmm1
	vmulpd	%xmm1, %xmm6, %xmm1
	vaddpd	%xmm0, %xmm5, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	(%rsi), %xmm5
	vmovddup	8(%rsi), %xmm9
	vmovddup	16(%rsi), %xmm8
	vmulpd	%xmm5, %xmm7, %xmm1
	vmulpd	%xmm9, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmulpd	%xmm8, %xmm6, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vsubpd	%xmm0, %xmm1, %xmm0
	vxorpd	.LCPI1_2(%rip), %xmm0, %xmm0
	vdivpd	%xmm4, %xmm0, %xmm6
	vxorpd	%xmm0, %xmm0, %xmm0
	vcmpltpd	%xmm6, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	movb	-4(%rsp), %al
	testb	%al, %al
	je	.LBB1_4
# BB#2:                                 # %land.lhs.true
	vmovddup	(%rdi), %xmm0
	vcmpltpd	%xmm0, %xmm6, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	movb	-6(%rsp), %al
	testb	%al, %al
	je	.LBB1_4
# BB#3:                                 # %if.then10
	addq	$24, %rdx
	vmovq	%rdx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovhpd	%xmm6, (%rdi)
	movl	$1, 56(%rdi)
	vmulpd	%xmm6, %xmm2, %xmm1
	vaddpd	%xmm1, %xmm5, %xmm1
	vmovhpd	%xmm1, 8(%rdi)
	vmulpd	%xmm6, %xmm11, %xmm1
	vaddpd	%xmm1, %xmm9, %xmm1
	vmovhpd	%xmm1, 16(%rdi)
	vmulpd	%xmm6, %xmm10, %xmm1
	vaddpd	%xmm1, %xmm8, %xmm1
	vmovhpd	%xmm1, 24(%rdi)
	vpextrq	$1, %xmm0, %rax
	movq	16(%rax), %rcx
	movq	%rcx, 48(%rdi)
	vmovupd	(%rax), %xmm0
	vmovupd	%xmm0, 32(%rdi)
.LBB1_4:                                # %if.end34
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
.LCPI2_3:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI2_4:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
	.text
	.globl	orthoBasis
	.align	16, 0x90
	.type	orthoBasis,@function
orthoBasis:                             # @orthoBasis
	.cfi_startproc
# BB#0:                                 # %entry
	leaq	48(%rdi), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, 64(%rdi)
	vmovapd	8(%rsp), %xmm0
	vmovupd	%xmm0, 48(%rdi)
	leaq	24(%rdi), %rcx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%xmm0, 24(%rdi)
	movq	$0, 40(%rdi)
	vmovddup	8(%rsp), %xmm2
	vcmpltpd	.LCPI2_0(%rip), %xmm2, %xmm3
	vmovapd	.LCPI2_1(%rip), %xmm1
	vcmpltpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm2, %xmm3, %xmm2
	vpextrq	$1, %xmm2, %rdx
	andl	$1, %edx
	movb	%dl, -2(%rsp)
	vmovq	%xmm2, %rdx
	andl	$1, %edx
	movb	%dl, -2(%rsp)
	movb	-2(%rsp), %dl
	testb	%dl, %dl
	je	.LBB2_2
# BB#1:                                 # %if.then
	movabsq	$4607182418800017408, %rdx # imm = 0x3FF0000000000000
	movq	%rdx, (%rcx)
	vmovapd	.LCPI2_2(%rip), %xmm2
.LBB2_7:                                # %if.end30
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.LBB2_8
.LBB2_2:                                # %if.else
	leaq	8(%rsp), %r8
	vmovddup	8(%r8), %xmm0
	vcmpltpd	.LCPI2_0(%rip), %xmm0, %xmm2
	vcmpltpd	%xmm0, %xmm1, %xmm0
	vandpd	%xmm0, %xmm2, %xmm0
	vpextrq	$1, %xmm0, %rsi
	andl	$1, %esi
	movb	%sil, -4(%rsp)
	vmovq	%xmm0, %rsi
	andl	$1, %esi
	movb	%sil, -4(%rsp)
	movb	-4(%rsp), %dl
	testb	%dl, %dl
	je	.LBB2_4
# BB#3:                                 # %if.then14
	movabsq	$4607182418800017408, %rcx # imm = 0x3FF0000000000000
	movq	%rcx, 32(%rdi)
	vmovapd	.LCPI2_2(%rip), %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	jmp	.LBB2_8
.LBB2_4:                                # %if.else17
	vmovddup	16(%r8), %xmm0
	vcmpltpd	.LCPI2_0(%rip), %xmm0, %xmm2
	vcmpltpd	%xmm0, %xmm1, %xmm0
	vandpd	%xmm0, %xmm2, %xmm0
	vpextrq	$1, %xmm0, %rdx
	andl	$1, %edx
	movb	%dl, -6(%rsp)
	vmovq	%xmm0, %rdx
	andl	$1, %edx
	movb	%dl, -6(%rsp)
	movb	-6(%rsp), %dl
	testb	%dl, %dl
	je	.LBB2_6
# BB#5:                                 # %if.then23
	movabsq	$4607182418800017408, %rcx # imm = 0x3FF0000000000000
	movq	%rcx, 40(%rdi)
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	.LCPI2_2(%rip), %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
.LBB2_8:                                # %if.end30
	vmovddup	(%rax), %xmm3
	vmovddup	56(%rdi), %xmm4
	vmovddup	64(%rdi), %xmm5
	vmulpd	%xmm5, %xmm1, %xmm6
	vmulpd	%xmm4, %xmm0, %xmm7
	vsubpd	%xmm7, %xmm6, %xmm6
	vmovhpd	%xmm6, (%rdi)
	vmulpd	%xmm3, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm2, %xmm5
	vsubpd	%xmm5, %xmm0, %xmm0
	vmovhpd	%xmm0, 8(%rdi)
	vmulpd	%xmm4, %xmm2, %xmm2
	vmulpd	%xmm3, %xmm1, %xmm1
	vsubpd	%xmm1, %xmm2, %xmm1
	vmovhpd	%xmm1, 16(%rdi)
	vmulpd	%xmm6, %xmm6, %xmm2
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vsqrtpd	%xmm0, %xmm3
	vandpd	.LCPI2_3(%rip), %xmm3, %xmm1
	vmovapd	.LCPI2_4(%rip), %xmm8
	vcmpltpd	%xmm1, %xmm8, %xmm1
	vpextrq	$1, %xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -8(%rsp)
	vmovq	%xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -8(%rsp)
	movb	-8(%rsp), %cl
	vmovddup	(%rdi), %xmm1
	testb	%cl, %cl
	je	.LBB2_9
# BB#10:                                # %if.then.i76
	vdivpd	%xmm3, %xmm1, %xmm1
	vmovhpd	%xmm1, (%rdi)
	vmovddup	8(%rdi), %xmm2
	vdivpd	%xmm3, %xmm2, %xmm2
	vmovhpd	%xmm2, 8(%rdi)
	vmovddup	16(%rdi), %xmm4
	vdivpd	%xmm3, %xmm4, %xmm3
	vmovhpd	%xmm3, 16(%rdi)
	jmp	.LBB2_11
.LBB2_9:                                # %if.end30.vnormalize.exit77_crit_edge
	vmovddup	8(%rdi), %xmm2
	vmovddup	16(%rdi), %xmm3
.LBB2_11:                               # %vnormalize.exit77
	vmovddup	(%rax), %xmm4
	vmovddup	56(%rdi), %xmm5
	vmovddup	64(%rdi), %xmm6
	vmulpd	%xmm5, %xmm3, %xmm7
	vmulpd	%xmm6, %xmm2, %xmm0
	vsubpd	%xmm0, %xmm7, %xmm0
	vmovhpd	%xmm0, 24(%rdi)
	vmulpd	%xmm6, %xmm1, %xmm6
	vmulpd	%xmm4, %xmm3, %xmm3
	vsubpd	%xmm3, %xmm6, %xmm3
	vmovhpd	%xmm3, 32(%rdi)
	vmulpd	%xmm4, %xmm2, %xmm2
	vmulpd	%xmm5, %xmm1, %xmm1
	vsubpd	%xmm1, %xmm2, %xmm1
	vmovhpd	%xmm1, 40(%rdi)
	vmulpd	%xmm0, %xmm0, %xmm0
	vmulpd	%xmm3, %xmm3, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vsqrtpd	%xmm0, %xmm1
	vandpd	.LCPI2_3(%rip), %xmm1, %xmm0
	vcmpltpd	%xmm0, %xmm8, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -10(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -10(%rsp)
	movb	-10(%rsp), %al
	testb	%al, %al
	je	.LBB2_13
# BB#12:                                # %if.then.i
	vmovddup	24(%rdi), %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, 24(%rdi)
	vmovddup	32(%rdi), %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, 32(%rdi)
	vmovddup	40(%rdi), %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, 40(%rdi)
.LBB2_13:                               # %vnormalize.exit
	ret
.LBB2_6:                                # %if.else26
	movabsq	$4607182418800017408, %rdx # imm = 0x3FF0000000000000
	movq	%rdx, (%rcx)
	vmovapd	.LCPI2_2(%rip), %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	jmp	.LBB2_7
.Ltmp2:
	.size	orthoBasis, .Ltmp2-orthoBasis
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.quad	4547007122018943789     # double 1.000000e-04
	.quad	4547007122018943789     # double 1.000000e-04
.LCPI3_1:
	.quad	4618760256179416344     # double 6.283185e+00
	.quad	4618760256179416344     # double 6.283185e+00
.LCPI3_2:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI3_3:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI3_4:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
.LCPI3_5:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI3_6:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI3_7:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI3_8:
	.quad	16                      # 0x10
	.quad	16                      # 0x10
.LCPI3_9:
	.quad	4643211215818981376     # double 2.560000e+02
	.quad	4643211215818981376     # double 2.560000e+02
.LCPI3_10:
	.quad	4571153621781053440     # double 3.906250e-03
	.quad	4571153621781053440     # double 3.906250e-03
.LCPI3_11:
	.zero	16
	.text
	.globl	ambient_occlusion
	.align	16, 0x90
	.type	ambient_occlusion,@function
ambient_occlusion:                      # @ambient_occlusion
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp9:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp10:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp11:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp12:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp13:
	.cfi_def_cfa_offset 48
	subq	$544, %rsp              # imm = 0x220
.Ltmp14:
	.cfi_def_cfa_offset 592
.Ltmp15:
	.cfi_offset %rbx, -48
.Ltmp16:
	.cfi_offset %r12, -40
.Ltmp17:
	.cfi_offset %r13, -32
.Ltmp18:
	.cfi_offset %r14, -24
.Ltmp19:
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	leaq	416(%rsp), %rbx
	leaq	352(%rsp), %r15
	vmovddup	8(%rsi), %xmm0
	vmovddup	32(%rsi), %xmm1
	vmovapd	.LCPI3_0(%rip), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 288(%rsp)        # 16-byte Spill
	vmovddup	16(%rsi), %xmm0
	vmovddup	40(%rsi), %xmm1
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 272(%rsp)        # 16-byte Spill
	vmovddup	24(%rsi), %xmm0
	vmovddup	48(%rsi), %xmm1
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 256(%rsp)        # 16-byte Spill
	leaq	464(%rsp), %rdi
	movq	48(%rsi), %rax
	movq	%rax, 16(%rsp)
	vmovups	32(%rsi), %xmm0
	vmovups	%xmm0, (%rsp)
	callq	orthoBasis
	vmovddup	464(%rsp), %xmm0
	vmovapd	%xmm0, 176(%rsp)        # 16-byte Spill
	vmovddup	488(%rsp), %xmm0
	vmovapd	%xmm0, 160(%rsp)        # 16-byte Spill
	vmovddup	512(%rsp), %xmm0
	vmovapd	%xmm0, 144(%rsp)        # 16-byte Spill
	vmovddup	472(%rsp), %xmm0
	vmovapd	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovddup	496(%rsp), %xmm0
	vmovapd	%xmm0, 112(%rsp)        # 16-byte Spill
	vmovddup	520(%rsp), %xmm0
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	vmovddup	480(%rsp), %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovddup	504(%rsp), %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovddup	528(%rsp), %xmm0
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 192(%rsp)        # 16-byte Spill
	leaq	384(%rsp), %r12
	movabsq	$4861130398305394688, %r13 # imm = 0x4376345785D8A000
	.align	16, 0x90
.LBB3_1:                                # %for.cond17.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	vmovapd	%xmm2, 32(%rsp)         # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB3_2:                                # %for.body19
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovapd	%xmm2, 240(%rsp)        # 16-byte Spill
	callq	drand48
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vsqrtpd	%xmm0, %xmm0
	vmovapd	%xmm0, 320(%rsp)        # 16-byte Spill
	callq	drand48
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmulpd	.LCPI3_1(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, 304(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 224(%rsp)        # 16-byte Spill
	vmovapd	304(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 208(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	224(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	320(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 224(%rsp)        # 16-byte Spill
	vmovaps	304(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 304(%rsp)        # 16-byte Spill
	vmovapd	208(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovapd	304(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	320(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vmovapd	.LCPI3_2(%rip), %xmm2
	vsubpd	%xmm1, %xmm2, %xmm1
	vsqrtpd	%xmm1, %xmm1
	vmovapd	176(%rsp), %xmm2        # 16-byte Reload
	vmovapd	224(%rsp), %xmm5        # 16-byte Reload
	vmulpd	%xmm5, %xmm2, %xmm2
	vmovapd	160(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm0, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovapd	144(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm3
	vaddpd	%xmm2, %xmm3, %xmm4
	vmovapd	%xmm4, 320(%rsp)        # 16-byte Spill
	vmovapd	128(%rsp), %xmm2        # 16-byte Reload
	vmulpd	%xmm5, %xmm2, %xmm2
	vmovapd	%xmm5, %xmm6
	vmovapd	112(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm0, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovapd	96(%rsp), %xmm3         # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm3
	vaddpd	%xmm2, %xmm3, %xmm5
	vmovapd	%xmm5, 304(%rsp)        # 16-byte Spill
	vmovapd	80(%rsp), %xmm2         # 16-byte Reload
	vmulpd	%xmm6, %xmm2, %xmm2
	vmovapd	64(%rsp), %xmm3         # 16-byte Reload
	vmulpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm0
	vmovapd	48(%rsp), %xmm2         # 16-byte Reload
	vmulpd	%xmm1, %xmm2, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 224(%rsp)        # 16-byte Spill
	vmovapd	288(%rsp), %xmm1        # 16-byte Reload
	vmovhpd	%xmm1, (%rbx)
	vmovapd	272(%rsp), %xmm1        # 16-byte Reload
	vmovhpd	%xmm1, 8(%rbx)
	vmovapd	256(%rsp), %xmm1        # 16-byte Reload
	vmovhpd	%xmm1, 16(%rbx)
	vmovhpd	%xmm4, 24(%rbx)
	vmovhpd	%xmm5, 32(%rbx)
	vmovhpd	%xmm0, 40(%rbx)
	movq	%r13, (%r15)
	movl	$0, 56(%r15)
	movl	$spheres, %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	ray_sphere_intersect
	movl	$spheres+32, %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	ray_sphere_intersect
	movl	$spheres+64, %edx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	ray_sphere_intersect
	vmovapd	224(%rsp), %xmm12       # 16-byte Reload
	vmovapd	304(%rsp), %xmm11       # 16-byte Reload
	vmovapd	320(%rsp), %xmm10       # 16-byte Reload
	vmovapd	256(%rsp), %xmm9        # 16-byte Reload
	vmovapd	272(%rsp), %xmm8        # 16-byte Reload
	vmovapd	288(%rsp), %xmm7        # 16-byte Reload
	vmovddup	plane+24(%rip), %xmm1
	vmovddup	plane+32(%rip), %xmm2
	vmovddup	plane+40(%rip), %xmm0
	vmulpd	%xmm1, %xmm10, %xmm3
	vmulpd	%xmm2, %xmm11, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm0, %xmm12, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vandpd	.LCPI3_3(%rip), %xmm3, %xmm4
	vcmpltpd	.LCPI3_4(%rip), %xmm4, %xmm4
	vpextrq	$1, %xmm4, %rax
	andl	$1, %eax
	movb	%al, 350(%rsp)
	vmovq	%xmm4, %rax
	andl	$1, %eax
	movb	%al, 350(%rsp)
	movb	350(%rsp), %al
	testb	%al, %al
	jne	.LBB3_5
# BB#3:                                 # %if.end.i
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovddup	plane+8(%rip), %xmm4
	vmovddup	plane(%rip), %xmm5
	vmulpd	%xmm4, %xmm2, %xmm4
	vmulpd	%xmm5, %xmm1, %xmm5
	vmovddup	plane+16(%rip), %xmm6
	vmulpd	%xmm6, %xmm0, %xmm6
	vaddpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm1, %xmm7, %xmm1
	vmulpd	%xmm2, %xmm8, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm0, %xmm9, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vsubpd	%xmm4, %xmm0, %xmm0
	vxorpd	.LCPI3_5(%rip), %xmm0, %xmm0
	vdivpd	%xmm3, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcmpltpd	%xmm0, %xmm1, %xmm1
	vmovddup	(%r15), %xmm2
	vcmpltpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, 348(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, 348(%rsp)
	movb	348(%rsp), %al
	testb	%al, %al
	je	.LBB3_5
# BB#4:                                 # %if.then10.i
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovhpd	%xmm0, (%r15)
	movl	$1, 56(%r15)
	vmulpd	%xmm0, %xmm10, %xmm1
	vaddpd	%xmm1, %xmm7, %xmm1
	vmovhpd	%xmm1, 8(%r15)
	vmulpd	%xmm0, %xmm11, %xmm1
	vaddpd	%xmm1, %xmm8, %xmm1
	vmovhpd	%xmm1, 16(%r15)
	vmulpd	%xmm0, %xmm12, %xmm0
	vaddpd	%xmm0, %xmm9, %xmm0
	vmovhpd	%xmm0, 24(%r15)
	movq	plane+40(%rip), %rax
	movq	%rax, 16(%r12)
	vmovupd	plane+24(%rip), %xmm0
	vmovupd	%xmm0, (%r12)
.LBB3_5:                                # %ray_plane_intersect.exit
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovd	56(%r15), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	.LCPI3_6(%rip), %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vpcmpeqq	.LCPI3_11, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 346(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 346(%rsp)
	movb	346(%rsp), %al
	testb	%al, %al
	vmovdqa	240(%rsp), %xmm2        # 16-byte Reload
	jne	.LBB3_7
# BB#6:                                 # %if.then
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovapd	192(%rsp), %xmm0        # 16-byte Reload
	vaddpd	.LCPI3_2(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, 192(%rsp)        # 16-byte Spill
.LBB3_7:                                # %if.end
                                        #   in Loop: Header=BB3_2 Depth=2
	vpaddq	.LCPI3_7(%rip), %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm0
	vpcmpeqq	.LCPI3_8(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 344(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 344(%rsp)
	movb	344(%rsp), %al
	testb	%al, %al
	je	.LBB3_2
# BB#8:                                 # %for.inc71
                                        #   in Loop: Header=BB3_1 Depth=1
	vmovdqa	32(%rsp), %xmm2         # 16-byte Reload
	vpaddq	.LCPI3_7(%rip), %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm0
	vpcmpeqq	.LCPI3_8(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 342(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 342(%rsp)
	movb	342(%rsp), %al
	testb	%al, %al
	je	.LBB3_1
# BB#9:                                 # %for.end73
	vmovapd	.LCPI3_9(%rip), %xmm0
	vsubpd	192(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmulpd	.LCPI3_10(%rip), %xmm0, %xmm0
	vmovhpd	%xmm0, (%r14)
	vmovhpd	%xmm0, 8(%r14)
	vmovhpd	%xmm0, 16(%r14)
	addq	$544, %rsp              # imm = 0x220
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.Ltmp20:
	.size	ambient_occlusion, .Ltmp20-ambient_occlusion
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
.Ltmp21:
	.size	clamp, .Ltmp21-clamp
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
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI5_11:
	.quad	4643193623632936960     # double 2.555000e+02
	.quad	4643193623632936960     # double 2.555000e+02
.LCPI5_12:
	.quad	255                     # 0xff
	.quad	255                     # 0xff
	.text
	.globl	render
	.align	16, 0x90
	.type	render,@function
render:                                 # @render
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp29:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp30:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp31:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp32:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp33:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp34:
	.cfi_def_cfa_offset 56
	subq	$696, %rsp              # imm = 0x2B8
.Ltmp35:
	.cfi_def_cfa_offset 752
.Ltmp36:
	.cfi_offset %rbx, -56
.Ltmp37:
	.cfi_offset %r12, -48
.Ltmp38:
	.cfi_offset %r13, -40
.Ltmp39:
	.cfi_offset %r14, -32
.Ltmp40:
	.cfi_offset %r15, -24
.Ltmp41:
	.cfi_offset %rbp, -16
	movl	%ecx, %r12d
	movq	%rdi, %r15
	movq	%r15, 120(%rsp)         # 8-byte Spill
	vmovd	%edx, %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vmovdqa	%xmm2, 32(%rsp)         # 16-byte Spill
	vmovd	%esi, %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, 192(%rsp)        # 16-byte Spill
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
	vmovdqa	%xmm4, 512(%rsp)        # 16-byte Spill
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
	movq	%rax, 168(%rsp)         # 8-byte Spill
	xorl	%esi, %esi
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	memset
	vpxor	%xmm13, %xmm13, %xmm13
	vmovdqa	512(%rsp), %xmm0        # 16-byte Reload
	vpcmpgtq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 558(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 558(%rsp)
	movb	558(%rsp), %al
	testb	%al, %al
	je	.LBB5_8
# BB#1:                                 # %for.cond10.preheader.lr.ph
	vmovd	%r12d, %xmm0
	vpbroadcastq	%xmm0, %xmm4
	vmovdqa	%xmm4, 368(%rsp)        # 16-byte Spill
	leaq	648(%rsp), %r12
	vmovq	%r12, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpextrq	$1, %xmm4, %r9
	movq	%r9, 112(%rsp)          # 8-byte Spill
	movslq	%r9d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vmovq	%xmm4, %r10
	movq	%r10, 104(%rsp)         # 8-byte Spill
	movslq	%r10d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vunpcklpd	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovapd	%xmm1, 448(%rsp)        # 16-byte Spill
	movq	56(%rsp), %rax          # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	movq	48(%rsp), %rax          # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vunpcklpd	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovapd	.LCPI5_1(%rip), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vmovapd	%xmm1, 352(%rsp)        # 16-byte Spill
	movslq	%r14d, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	movslq	%ebp, %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm3
	vunpcklpd	%xmm1, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm1[0]
	vmulpd	%xmm2, %xmm1, %xmm1
	vmovapd	%xmm1, 208(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm0, %rbp
	vpsrlq	$32, %xmm4, %xmm0
	vpmuludq	%xmm0, %xmm4, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpmuludq	%xmm4, %xmm4, %xmm1
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
	vmovdqa	.LCPI5_3(%rip), %xmm6
	vmovapd	.LCPI5_11(%rip), %xmm9
	vmovdqa	.LCPI5_12(%rip), %xmm10
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	leaq	584(%rsp), %rbx
	leaq	32(%rbx), %rax
	movq	%rax, 344(%rsp)         # 8-byte Spill
	.align	16, 0x90
.LBB5_2:                                # %for.cond10.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
                                        #       Child Loop BB5_21 Depth 3
                                        #         Child Loop BB5_11 Depth 4
	movq	56(%rsp), %rax          # 8-byte Reload
	cltq
	vmovq	%rax, %xmm0
	movq	48(%rsp), %rax          # 8-byte Reload
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 556(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 556(%rsp)
	movb	556(%rsp), %al
	testb	%al, %al
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
	vmovapd	%xmm0, 224(%rsp)        # 16-byte Spill
	vmovdqa	192(%rsp), %xmm2        # 16-byte Reload
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
	vmovdqa	%xmm0, 176(%rsp)        # 16-byte Spill
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB5_4:                                # %for.cond14.preheader
                                        #   Parent Loop BB5_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_21 Depth 3
                                        #         Child Loop BB5_11 Depth 4
	movslq	%r9d, %rax
	vmovq	%rax, %xmm0
	movslq	%r10d, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 554(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 554(%rsp)
	movb	554(%rsp), %al
	testb	%al, %al
	je	.LBB5_5
# BB#20:                                # %for.cond18.preheader.lr.ph.split.us
                                        #   in Loop: Header=BB5_4 Depth=2
	vmovq	%xmm5, %rax
	cltq
	vpextrq	$1, %xmm5, %rcx
	movslq	%ecx, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 384(%rsp)        # 16-byte Spill
	vpaddq	176(%rsp), %xmm5, %xmm0 # 16-byte Folded Reload
	vmovdqa	%xmm5, 144(%rsp)        # 16-byte Spill
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
	movq	168(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %r14
	vmovq	%r14, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm1, 288(%rsp)        # 16-byte Spill
	vpaddq	%xmm6, %xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovdqa	%xmm1, 272(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	leaq	(%rcx,%rax,8), %r15
	vmovq	%r15, %xmm1
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
	vmovdqa	%xmm0, 240(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	leaq	(%rcx,%rax,8), %r13
	vmovq	%r13, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB5_21:                               # %for.body21.lr.ph.us
                                        #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_11 Depth 4
	vmovaps	%xmm0, 320(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovaps	%xmm0, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vdivpd	448(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovapd	224(%rsp), %xmm1        # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	208(%rsp), %xmm1        # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm0
	vxorpd	.LCPI5_5(%rip), %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 432(%rsp)        # 16-byte Spill
	vunpckhpd	%xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,1]
	vmovapd	%xmm1, 416(%rsp)        # 16-byte Spill
	vmulpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 400(%rsp)        # 16-byte Spill
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB5_11:                               # %for.body21.us
                                        #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_21 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vpextrq	$1, %xmm3, %rax
	cltq
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vdivpd	448(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovapd	384(%rsp), %xmm1        # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	352(%rsp), %xmm1        # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm4
	vmovdqu	%xmm13, (%rbp)
	movq	$0, 16(%rbp)
	vmovhpd	%xmm4, 24(%r12)
	vmovaps	416(%rsp), %xmm0        # 16-byte Reload
	vmovsd	%xmm0, 32(%r12)
	movabsq	$-4616189618054758400, %rax # imm = 0xBFF0000000000000
	movq	%rax, 40(%r12)
	vmulpd	%xmm4, %xmm4, %xmm0
	vmovapd	400(%rsp), %xmm1        # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vaddpd	.LCPI5_6(%rip), %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vandpd	.LCPI5_7(%rip), %xmm0, %xmm1
	vmovapd	.LCPI5_8(%rip), %xmm2
	vcmpltpd	%xmm1, %xmm2, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, 552(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, 552(%rsp)
	movb	552(%rsp), %al
	testb	%al, %al
	je	.LBB5_12
# BB#13:                                # %if.then.i.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	%xmm3, 512(%rsp)        # 16-byte Spill
	vdivpd	%xmm0, %xmm4, %xmm4
	vmovapd	%xmm4, 464(%rsp)        # 16-byte Spill
	vmovhpd	%xmm4, 24(%r12)
	vmovapd	432(%rsp), %xmm1        # 16-byte Reload
	vdivpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 496(%rsp)        # 16-byte Spill
	vmovhpd	%xmm1, 32(%r12)
	vmovapd	.LCPI5_9(%rip), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 480(%rsp)        # 16-byte Spill
	vmovhpd	%xmm0, 40(%r12)
	jmp	.LBB5_14
	.align	16, 0x90
.LBB5_12:                               #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	%xmm3, 512(%rsp)        # 16-byte Spill
	vmovaps	.LCPI5_9(%rip), %xmm0
	vmovaps	%xmm0, 480(%rsp)        # 16-byte Spill
	vmovapd	432(%rsp), %xmm0        # 16-byte Reload
	vmovapd	%xmm0, 496(%rsp)        # 16-byte Spill
	vmovapd	%xmm4, 464(%rsp)        # 16-byte Spill
.LBB5_14:                               # %vnormalize.exit.us
                                        #   in Loop: Header=BB5_11 Depth=4
	movabsq	$4861130398305394688, %rax # imm = 0x4376345785D8A000
	movq	%rax, (%rbx)
	movl	$0, 56(%rbx)
	movl	$spheres, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	ray_sphere_intersect
	movl	$spheres+32, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	ray_sphere_intersect
	movl	$spheres+64, %edx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	ray_sphere_intersect
	vmovddup	plane+24(%rip), %xmm1
	vmovddup	plane+32(%rip), %xmm2
	vmovddup	plane+40(%rip), %xmm0
	vmovapd	464(%rsp), %xmm7        # 16-byte Reload
	vmulpd	%xmm1, %xmm7, %xmm3
	vmovapd	496(%rsp), %xmm5        # 16-byte Reload
	vmulpd	%xmm2, %xmm5, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmovapd	480(%rsp), %xmm6        # 16-byte Reload
	vmulpd	%xmm0, %xmm6, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vandpd	.LCPI5_7(%rip), %xmm3, %xmm4
	vcmpltpd	.LCPI5_8(%rip), %xmm4, %xmm4
	vpextrq	$1, %xmm4, %rax
	andl	$1, %eax
	movb	%al, 550(%rsp)
	vmovq	%xmm4, %rax
	andl	$1, %eax
	movb	%al, 550(%rsp)
	movb	550(%rsp), %al
	testb	%al, %al
	vpxor	%xmm13, %xmm13, %xmm13
	vmovapd	%xmm6, %xmm8
	vmovapd	%xmm5, %xmm9
	jne	.LBB5_17
# BB#15:                                # %if.end.i.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovddup	plane+8(%rip), %xmm4
	vmovddup	plane(%rip), %xmm5
	vmulpd	%xmm4, %xmm2, %xmm4
	vmulpd	%xmm5, %xmm1, %xmm5
	vmovddup	plane+16(%rip), %xmm6
	vmulpd	%xmm6, %xmm0, %xmm6
	vaddpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm13, %xmm1, %xmm1
	vmulpd	%xmm13, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm13, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vsubpd	%xmm4, %xmm0, %xmm0
	vxorpd	.LCPI5_5(%rip), %xmm0, %xmm0
	vdivpd	%xmm3, %xmm0, %xmm0
	vcmpltpd	%xmm0, %xmm13, %xmm1
	vmovddup	(%rbx), %xmm2
	vcmpltpd	%xmm2, %xmm0, %xmm2
	vandpd	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, 548(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, 548(%rsp)
	movb	548(%rsp), %al
	testb	%al, %al
	je	.LBB5_17
# BB#16:                                # %if.then10.i.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovhpd	%xmm0, (%rbx)
	movl	$1, 56(%rbx)
	vmulpd	%xmm0, %xmm7, %xmm1
	vaddpd	%xmm13, %xmm1, %xmm1
	vmovhpd	%xmm1, 8(%rbx)
	vmulpd	%xmm0, %xmm9, %xmm1
	vaddpd	%xmm13, %xmm1, %xmm1
	vmovhpd	%xmm1, 16(%rbx)
	vmulpd	%xmm0, %xmm8, %xmm0
	vaddpd	%xmm13, %xmm0, %xmm0
	vmovhpd	%xmm0, 24(%rbx)
	movq	plane+40(%rip), %rax
	movq	344(%rsp), %rcx         # 8-byte Reload
	movq	%rax, 16(%rcx)
	vmovupd	plane+24(%rip), %xmm0
	vmovupd	%xmm0, (%rcx)
.LBB5_17:                               # %ray_plane_intersect.exit.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovd	56(%rbx), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI5_10(%rip), %xmm0, %xmm0
	vpcmpeqq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 546(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 546(%rsp)
	movb	546(%rsp), %al
	testb	%al, %al
	jne	.LBB5_19
# BB#18:                                # %if.then.us
                                        #   in Loop: Header=BB5_11 Depth=4
	leaq	560(%rsp), %rdi
	movq	%rbx, %rsi
	callq	ambient_occlusion
	vxorpd	%xmm13, %xmm13, %xmm13
	vmovddup	560(%rsp), %xmm0
	vmovddup	(%r14), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%r14)
	vmovddup	568(%rsp), %xmm0
	vmovddup	(%r15), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%r15)
	vmovddup	576(%rsp), %xmm0
	vmovddup	(%r13), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%r13)
.LBB5_19:                               # %if.end.us
                                        #   in Loop: Header=BB5_11 Depth=4
	vmovdqa	.LCPI5_3(%rip), %xmm6
	vmovdqa	512(%rsp), %xmm3        # 16-byte Reload
	vpaddq	%xmm6, %xmm3, %xmm3
	vmovdqa	.LCPI5_10(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm3, %xmm1
	vmovdqa	368(%rsp), %xmm0        # 16-byte Reload
	vpand	%xmm2, %xmm0, %xmm0
	vpcmpeqq	%xmm0, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, 544(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, 544(%rsp)
	movb	544(%rsp), %al
	testb	%al, %al
	je	.LBB5_11
# BB#9:                                 # %for.inc75.us
                                        #   in Loop: Header=BB5_21 Depth=3
	vmovdqa	320(%rsp), %xmm2        # 16-byte Reload
	vpaddq	%xmm6, %xmm2, %xmm2
	vpand	.LCPI5_10(%rip), %xmm2, %xmm1
	vpcmpeqq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 542(%rsp)
	vmovq	%xmm0, %rax
	vmovdqa	%xmm2, %xmm0
	andl	$1, %eax
	movb	%al, 542(%rsp)
	movb	542(%rsp), %al
	testb	%al, %al
	vmovdqa	304(%rsp), %xmm12       # 16-byte Reload
	vmovaps	288(%rsp), %xmm4        # 16-byte Reload
	vmovdqa	272(%rsp), %xmm2        # 16-byte Reload
	vmovaps	256(%rsp), %xmm1        # 16-byte Reload
	vmovdqa	240(%rsp), %xmm3        # 16-byte Reload
	je	.LBB5_21
# BB#10:                                #   in Loop: Header=BB5_4 Depth=2
	movq	120(%rsp), %r15         # 8-byte Reload
	movq	112(%rsp), %r9          # 8-byte Reload
	movq	104(%rsp), %r10         # 8-byte Reload
	vmovapd	80(%rsp), %xmm8         # 16-byte Reload
	vmovapd	.LCPI5_11(%rip), %xmm5
	vmovapd	%xmm5, %xmm9
	vmovdqa	.LCPI5_12(%rip), %xmm5
	vmovdqa	%xmm5, %xmm10
	vmovdqa	144(%rsp), %xmm5        # 16-byte Reload
	vmovaps	128(%rsp), %xmm0        # 16-byte Reload
	jmp	.LBB5_6
	.align	16, 0x90
.LBB5_5:                                # %for.cond14.preheader.for.end77_crit_edge
                                        #   in Loop: Header=BB5_4 Depth=2
	vpaddq	176(%rsp), %xmm5, %xmm0 # 16-byte Folded Reload
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
	vpunpcklqdq	%xmm1, %xmm2, %xmm12 # xmm12 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm12, %rax
	movq	168(%rsp), %rcx         # 8-byte Reload
	leaq	(%rcx,%rax,8), %rax
	vmovq	%rax, %xmm1
	vmovlhps	%xmm1, %xmm1, %xmm4 # xmm4 = xmm1[0,0]
	vpaddq	%xmm6, %xmm0, %xmm1
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
	vmovlhps	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vpaddq	.LCPI5_4(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm11
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm11, %xmm0, %xmm3 # xmm3 = xmm0[0],xmm11[0]
	vpextrq	$1, %xmm3, %rax
	leaq	(%rcx,%rax,8), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
.LBB5_6:                                # %for.end77
                                        #   in Loop: Header=BB5_4 Depth=2
	vpextrq	$1, %xmm0, %rax
	vpextrq	$1, %xmm1, %rcx
	vpextrq	$1, %xmm4, %rdx
	vpextrq	$1, %xmm3, %r8
	vpextrq	$1, %xmm2, %rdi
	vpextrq	$1, %xmm12, %rsi
	vmovddup	(%rdx), %xmm0
	vdivpd	%xmm8, %xmm0, %xmm0
	vmovhpd	%xmm0, (%rdx)
	vmovddup	(%rcx), %xmm1
	vdivpd	%xmm8, %xmm1, %xmm1
	vmovhpd	%xmm1, (%rcx)
	vmovddup	(%rax), %xmm2
	vdivpd	%xmm8, %xmm2, %xmm2
	vmovhpd	%xmm2, (%rax)
	vmulpd	%xmm9, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm3
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm13, %xmm3
	vpsllq	$63, %xmm3, %xmm3
	vblendvpd	%xmm3, %xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm10, %xmm3, %xmm3
	vblendvpd	%xmm3, %xmm10, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	movb	%al, (%r15,%rsi)
	vmulpd	%xmm9, %xmm1, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm13, %xmm1
	vpsllq	$63, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm1, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm1[0]
	vpcmpgtq	%xmm10, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm10, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	movb	%al, (%r15,%rdi)
	vmulpd	%xmm9, %xmm2, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm13, %xmm1
	vpsllq	$63, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm10, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm10, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	movb	%al, (%r15,%r8)
	vpaddq	%xmm6, %xmm5, %xmm5
	vmovdqa	.LCPI5_10(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm5, %xmm0
	vmovdqa	192(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 540(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 540(%rsp)
	movb	540(%rsp), %al
	testb	%al, %al
	je	.LBB5_4
.LBB5_7:                                # %for.inc147
                                        #   in Loop: Header=BB5_2 Depth=1
	vmovdqa	64(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm6, %xmm1, %xmm1
	vmovdqa	%xmm1, 64(%rsp)         # 16-byte Spill
	vmovdqa	.LCPI5_10(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm1, %xmm0
	vmovdqa	32(%rsp), %xmm1         # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 538(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 538(%rsp)
	movb	538(%rsp), %al
	testb	%al, %al
	je	.LBB5_2
.LBB5_8:                                # %for.end149
	addq	$696, %rsp              # imm = 0x2B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp42:
	.size	render, .Ltmp42-render
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
.Ltmp43:
	.size	init_scene, .Ltmp43-init_scene
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
.Ltmp49:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp50:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp51:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp52:
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
.Ltmp53:
	.cfi_def_cfa_offset 80
.Ltmp54:
	.cfi_offset %rbx, -40
.Ltmp55:
	.cfi_offset %r14, -32
.Ltmp56:
	.cfi_offset %r15, -24
.Ltmp57:
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
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 38(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 38(%rsp)
	movb	38(%rsp), %al
	testb	%al, %al
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
.Ltmp58:
	.size	saveppm, .Ltmp58-saveppm
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
.Ltmp62:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp63:
	.cfi_def_cfa_offset 24
	subq	$88, %rsp
.Ltmp64:
	.cfi_def_cfa_offset 112
.Ltmp65:
	.cfi_offset %rbx, -24
.Ltmp66:
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
.Ltmp67:
	.size	main, .Ltmp67-main
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
