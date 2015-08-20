	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	dot
	.align	16, 0x90
	.type	dot,@function
dot:                                    # @dot
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edx, %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vpextrq	$1, %xmm2, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm2, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpgtq	%xmm0, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	movb	-2(%rsp), %al
	testb	%al, %al
	je	.LBB0_1
# BB#2:
	vmovdqa	.LCPI0_0(%rip), %xmm1
	vmovdqa	.LCPI0_1(%rip), %xmm3
	vpand	%xmm3, %xmm2, %xmm4
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rax
	vmovddup	(%rdi,%rax,8), %xmm5
	vmovddup	(%rsi,%rax,8), %xmm6
	vmulpd	%xmm6, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm2, %xmm2
	vpaddq	%xmm1, %xmm0, %xmm0
	vpand	%xmm3, %xmm0, %xmm5
	vpcmpeqq	%xmm4, %xmm5, %xmm5
	vpextrq	$1, %xmm5, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	vmovq	%xmm5, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	movb	-4(%rsp), %al
	testb	%al, %al
	je	.LBB0_3
# BB#4:                                 # %for.end
	vunpckhpd	%xmm2, %xmm2, %xmm0 # xmm0 = xmm2[1,1]
	ret
.LBB0_1:
	vpxor	%xmm2, %xmm2, %xmm2
	vunpckhpd	%xmm2, %xmm2, %xmm0 # xmm0 = xmm2[1,1]
	ret
.Ltmp0:
	.size	dot, .Ltmp0-dot
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI1_1:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI1_2:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI1_3:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	mult_Av_serial
	.align	16, 0x90
	.type	mult_Av_serial,@function
mult_Av_serial:                         # @mult_Av_serial
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edx, %xmm0
	vpbroadcastq	%xmm0, %xmm10
	vpextrq	$1, %xmm10, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm10, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm13, %xmm13, %xmm13
	vpcmpgtq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	movb	-2(%rsp), %al
	testb	%al, %al
	je	.LBB1_5
# BB#1:
	vmovdqa	.LCPI1_0(%rip), %xmm11
	vmovapd	.LCPI1_1(%rip), %xmm8
	vmovapd	.LCPI1_2(%rip), %xmm9
	vmovdqa	.LCPI1_3(%rip), %xmm12
	.align	16, 0x90
.LBB1_4:                                # %for.body3.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	vmovdqa	%xmm13, %xmm15
	vpextrq	$1, %xmm15, %rax
	vmovq	%xmm15, %rcx
	movslq	%ecx, %rcx
	movslq	%eax, %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm14 # xmm14 = xmm1[0],xmm0[0]
	vpaddq	%xmm11, %xmm15, %xmm13
	vpxor	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB1_2:                                # %for.body3.us
                                        #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm3, %rcx
	vmovddup	(%rdi,%rcx,8), %xmm2
	vpaddq	%xmm15, %xmm3, %xmm5
	vpaddq	%xmm0, %xmm13, %xmm1
	vpmuludq	%xmm5, %xmm1, %xmm7
	vpsrlq	$32, %xmm5, %xmm6
	vpmuludq	%xmm6, %xmm1, %xmm6
	vpsllq	$32, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm6
	vpsrlq	$32, %xmm1, %xmm1
	vpmuludq	%xmm5, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm6, %xmm1
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm1, %rdx
	movslq	%edx, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm1
	vcvtsi2sdq	%rcx, %xmm0, %xmm5
	vunpcklpd	%xmm1, %xmm5, %xmm1 # xmm1 = xmm5[0],xmm1[0]
	vmulpd	%xmm8, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm14, %xmm1
	vaddpd	%xmm9, %xmm1, %xmm1
	vdivpd	%xmm1, %xmm2, %xmm1
	vaddpd	%xmm1, %xmm4, %xmm4
	vpaddq	%xmm11, %xmm3, %xmm3
	vpaddq	%xmm11, %xmm0, %xmm0
	vpand	%xmm12, %xmm3, %xmm1
	vpand	%xmm12, %xmm10, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -4(%rsp)
	vmovq	%xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -4(%rsp)
	movb	-4(%rsp), %cl
	testb	%cl, %cl
	je	.LBB1_2
# BB#3:                                 # %for.end.us
                                        #   in Loop: Header=BB1_4 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm0 # xmm0 = xmm4[1,1]
	vmovsd	%xmm0, (%rsi,%rax,8)
	vpand	%xmm12, %xmm13, %xmm0
	vpcmpeqq	%xmm2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	movb	-6(%rsp), %al
	testb	%al, %al
	je	.LBB1_4
.LBB1_5:                                # %for.end8
	ret
.Ltmp1:
	.size	mult_Av_serial, .Ltmp1-mult_Av_serial
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI2_1:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI2_2:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI2_3:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	mult_Atv_serial
	.align	16, 0x90
	.type	mult_Atv_serial,@function
mult_Atv_serial:                        # @mult_Atv_serial
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edx, %xmm0
	vpbroadcastq	%xmm0, %xmm10
	vpextrq	$1, %xmm10, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm10, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm13, %xmm13, %xmm13
	vpcmpgtq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	movb	-2(%rsp), %al
	testb	%al, %al
	je	.LBB2_5
# BB#1:
	vmovdqa	.LCPI2_0(%rip), %xmm11
	vmovapd	.LCPI2_1(%rip), %xmm8
	vmovapd	.LCPI2_2(%rip), %xmm9
	vmovdqa	.LCPI2_3(%rip), %xmm12
	.align	16, 0x90
.LBB2_4:                                # %for.body3.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	vmovdqa	%xmm13, %xmm15
	vpextrq	$1, %xmm15, %rax
	vmovq	%xmm15, %rcx
	movslq	%ecx, %rcx
	movslq	%eax, %rdx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm14 # xmm14 = xmm1[0],xmm0[0]
	vpaddq	%xmm11, %xmm15, %xmm13
	vpxor	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB2_2:                                # %for.body3.us
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm3, %rcx
	vmovddup	(%rdi,%rcx,8), %xmm2
	vpaddq	%xmm15, %xmm3, %xmm5
	vpaddq	%xmm0, %xmm13, %xmm1
	vpmuludq	%xmm5, %xmm1, %xmm7
	vpsrlq	$32, %xmm5, %xmm6
	vpmuludq	%xmm6, %xmm1, %xmm6
	vpsllq	$32, %xmm6, %xmm6
	vpaddq	%xmm6, %xmm7, %xmm6
	vpsrlq	$32, %xmm1, %xmm1
	vpmuludq	%xmm5, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm6, %xmm1
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm1, %rdx
	movslq	%edx, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm1
	vcvtsi2sdq	%rcx, %xmm0, %xmm5
	vunpcklpd	%xmm1, %xmm5, %xmm1 # xmm1 = xmm5[0],xmm1[0]
	vmulpd	%xmm8, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm14, %xmm1
	vaddpd	%xmm9, %xmm1, %xmm1
	vdivpd	%xmm1, %xmm2, %xmm1
	vaddpd	%xmm1, %xmm4, %xmm4
	vpaddq	%xmm11, %xmm3, %xmm3
	vpaddq	%xmm11, %xmm0, %xmm0
	vpand	%xmm12, %xmm3, %xmm1
	vpand	%xmm12, %xmm10, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -4(%rsp)
	vmovq	%xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -4(%rsp)
	movb	-4(%rsp), %cl
	testb	%cl, %cl
	je	.LBB2_2
# BB#3:                                 # %for.end.us
                                        #   in Loop: Header=BB2_4 Depth=1
	vunpckhpd	%xmm4, %xmm4, %xmm0 # xmm0 = xmm4[1,1]
	vmovsd	%xmm0, (%rsi,%rax,8)
	vpand	%xmm12, %xmm13, %xmm0
	vpcmpeqq	%xmm2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -6(%rsp)
	movb	-6(%rsp), %al
	testb	%al, %al
	je	.LBB2_4
.LBB2_5:                                # %for.end8
	ret
.Ltmp2:
	.size	mult_Atv_serial, .Ltmp2-mult_Atv_serial
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI3_1:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI3_2:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI3_3:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	mult_AtAv_serial
	.align	16, 0x90
	.type	mult_AtAv_serial,@function
mult_AtAv_serial:                       # @mult_AtAv_serial
	.cfi_startproc
# BB#0:                                 # %entry
	vmovd	%edx, %xmm0
	vpbroadcastq	%xmm0, %xmm11
	vpextrq	$1, %xmm11, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm11, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	movq	tmp(%rip), %rax
	vpxor	%xmm7, %xmm7, %xmm7
	vpcmpgtq	%xmm7, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, -2(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, -2(%rsp)
	movb	-2(%rsp), %cl
	testb	%cl, %cl
	je	.LBB3_9
# BB#1:
	vmovdqa	.LCPI3_0(%rip), %xmm13
	vmovapd	.LCPI3_1(%rip), %xmm9
	vmovapd	.LCPI3_2(%rip), %xmm4
	vmovdqa	.LCPI3_3(%rip), %xmm12
	.align	16, 0x90
.LBB3_2:                                # %for.body3.lr.ph.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	vmovdqa	%xmm7, %xmm15
	vpextrq	$1, %xmm15, %r8
	vmovq	%xmm15, %rcx
	movslq	%ecx, %rcx
	movslq	%r8d, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm14 # xmm14 = xmm1[0],xmm0[0]
	vpaddq	%xmm13, %xmm15, %xmm7
	vpxor	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm5, %xmm5, %xmm5
	vpxor	%xmm3, %xmm3, %xmm3
	vmovapd	%xmm4, %xmm10
	.align	16, 0x90
.LBB3_3:                                # %for.body3.us.i
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm2, %rdx
	vmovddup	(%rdi,%rdx,8), %xmm8
	vpaddq	%xmm15, %xmm2, %xmm6
	vpaddq	%xmm3, %xmm7, %xmm0
	vpmuludq	%xmm6, %xmm0, %xmm1
	vmovdqa	%xmm7, %xmm4
	vpsrlq	$32, %xmm6, %xmm7
	vpmuludq	%xmm7, %xmm0, %xmm7
	vpsllq	$32, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm1, %xmm1
	vmovdqa	%xmm4, %xmm7
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm6, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vmovq	%xmm0, %rdx
	movslq	%edx, %rdx
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm0
	vcvtsi2sdq	%rdx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	%xmm9, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm14, %xmm0
	vaddpd	%xmm10, %xmm0, %xmm0
	vdivpd	%xmm0, %xmm8, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm5
	vpaddq	%xmm13, %xmm2, %xmm2
	vpaddq	%xmm13, %xmm3, %xmm3
	vpand	%xmm12, %xmm2, %xmm0
	vpand	%xmm12, %xmm11, %xmm8
	vpcmpeqq	%xmm8, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, -4(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, -4(%rsp)
	movb	-4(%rsp), %cl
	testb	%cl, %cl
	je	.LBB3_3
# BB#4:                                 # %for.end.us.i
                                        #   in Loop: Header=BB3_2 Depth=1
	vmovapd	%xmm10, %xmm4
	vunpckhpd	%xmm5, %xmm5, %xmm1 # xmm1 = xmm5[1,1]
	vmovsd	%xmm1, (%rax,%r8,8)
	vpand	%xmm12, %xmm7, %xmm1
	vpcmpeqq	%xmm8, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -6(%rsp)
	vmovq	%xmm1, %rcx
	andl	$1, %ecx
	movb	%cl, -6(%rsp)
	movb	-6(%rsp), %cl
	testb	%cl, %cl
	je	.LBB3_2
# BB#5:
	vxorpd	%xmm10, %xmm10, %xmm10
	vmovapd	%xmm9, %xmm15
	vmovdqa	%xmm12, %xmm11
	.align	16, 0x90
.LBB3_8:                                # %for.body3.lr.ph.us.i28
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
	vmovapd	%xmm10, %xmm12
	vpextrq	$1, %xmm12, %rcx
	vmovq	%xmm12, %rdx
	movslq	%edx, %rdx
	movslq	%ecx, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rdi, %xmm0, %xmm0
	vcvtsi2sdq	%rdx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm14 # xmm14 = xmm1[0],xmm0[0]
	vpaddq	%xmm13, %xmm12, %xmm10
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm7, %xmm7, %xmm7
	vpxor	%xmm3, %xmm3, %xmm3
	vmovapd	%xmm4, %xmm9
	.align	16, 0x90
.LBB3_6:                                # %for.body3.us.i25
                                        #   Parent Loop BB3_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm2, %rdx
	vmovddup	(%rax,%rdx,8), %xmm0
	vpaddq	%xmm12, %xmm2, %xmm5
	vpaddq	%xmm3, %xmm10, %xmm6
	vpmuludq	%xmm5, %xmm6, %xmm1
	vpsrlq	$32, %xmm5, %xmm4
	vpmuludq	%xmm4, %xmm6, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm1, %xmm1
	vpsrlq	$32, %xmm6, %xmm4
	vpmuludq	%xmm5, %xmm4, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm1, %xmm1
	vmovq	%xmm1, %rdx
	movslq	%edx, %rdx
	vpextrq	$1, %xmm1, %rdi
	movslq	%edi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm1
	vcvtsi2sdq	%rdx, %xmm0, %xmm4
	vunpcklpd	%xmm1, %xmm4, %xmm1 # xmm1 = xmm4[0],xmm1[0]
	vmulpd	%xmm15, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm14, %xmm1
	vaddpd	%xmm9, %xmm1, %xmm1
	vdivpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm7, %xmm7
	vpaddq	%xmm13, %xmm2, %xmm2
	vpaddq	%xmm13, %xmm3, %xmm3
	vpand	%xmm11, %xmm2, %xmm0
	vpcmpeqq	%xmm8, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdx
	andl	$1, %edx
	movb	%dl, -8(%rsp)
	vmovq	%xmm0, %rdx
	andl	$1, %edx
	movb	%dl, -8(%rsp)
	movb	-8(%rsp), %dl
	testb	%dl, %dl
	je	.LBB3_6
# BB#7:                                 # %for.end.us.i7
                                        #   in Loop: Header=BB3_8 Depth=1
	vmovapd	%xmm9, %xmm4
	vunpckhpd	%xmm7, %xmm7, %xmm0 # xmm0 = xmm7[1,1]
	vmovsd	%xmm0, (%rsi,%rcx,8)
	vpand	%xmm11, %xmm10, %xmm0
	vpcmpeqq	%xmm8, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, -10(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, -10(%rsp)
	movb	-10(%rsp), %cl
	testb	%cl, %cl
	je	.LBB3_8
.LBB3_9:                                # %mult_Atv_serial.exit
	ret
.Ltmp3:
	.size	mult_AtAv_serial, .Ltmp3-mult_AtAv_serial
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI4_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI4_1:
	.quad	2000                    # 0x7d0
	.quad	2000                    # 0x7d0
.LCPI4_2:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI4_3:
	.quad	8589934588              # 0x1fffffffc
	.quad	8589934588              # 0x1fffffffc
.LCPI4_4:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI4_5:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI4_6:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI4_7:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI4_8:
	.quad	10                      # 0xa
	.quad	10                      # 0xa
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp10:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp11:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp12:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp13:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp14:
	.cfi_def_cfa_offset 48
	subq	$96, %rsp
.Ltmp15:
	.cfi_def_cfa_offset 144
.Ltmp16:
	.cfi_offset %rbx, -48
.Ltmp17:
	.cfi_offset %r12, -40
.Ltmp18:
	.cfi_offset %r13, -32
.Ltmp19:
	.cfi_offset %r14, -24
.Ltmp20:
	.cfi_offset %r15, -16
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovdqa	.LCPI4_0(%rip), %xmm2
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, .LCPI4_1(%rip), %xmm0, %xmm1
	vmovapd	%xmm1, 32(%rsp)         # 16-byte Spill
	vandpd	%xmm2, %xmm1, %xmm0
	vpaddq	%xmm1, %xmm0, %xmm1
	vmovdqa	%xmm1, (%rsp)           # 16-byte Spill
	vpextrq	$1, %xmm1, %r12
	movslq	%r12d, %rax
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %r13
	movslq	%r13d, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	%xmm0, 16(%rsp)         # 16-byte Spill
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %r15
	movl	$32, %edi
	movq	%r15, %rsi
	callq	memalign
	movq	%rax, %rbx
	movl	$32, %edi
	movq	%r15, %rsi
	callq	memalign
	movq	%rax, %r14
	movl	$32, %edi
	movq	%r15, %rsi
	callq	memalign
	vmovdqa	.LCPI4_0(%rip), %xmm15
	movq	%rax, tmp(%rip)
	vpxor	%xmm5, %xmm5, %xmm5
	vmovdqa	16(%rsp), %xmm0         # 16-byte Reload
	vpcmpgtq	%xmm5, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 94(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 94(%rsp)
	movb	94(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_8
# BB#1:                                 # %for.body.preheader
	vmovdqa	.LCPI4_2(%rip), %xmm1
	vmovdqa	(%rsp), %xmm6           # 16-byte Reload
	vpaddq	%xmm1, %xmm6, %xmm0
	vpand	%xmm1, %xmm0, %xmm0
	vpaddq	.LCPI4_0(%rip), %xmm0, %xmm0
	vpand	.LCPI4_3(%rip), %xmm0, %xmm3
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm3, %xmm4
	vpextrq	$1, %xmm4, %rcx
	andl	$1, %ecx
	movb	%cl, 92(%rsp)
	vmovq	%xmm4, %rcx
	andl	$1, %ecx
	movb	%cl, 92(%rsp)
	movb	92(%rsp), %cl
	testb	%cl, %cl
	vmovdqa	%xmm6, %xmm4
	vmovdqa	%xmm4, %xmm8
	jne	.LBB4_5
# BB#2:
	vmovdqa	.LCPI4_4(%rip), %xmm4
	vmovdqa	.LCPI4_5(%rip), %xmm5
	vmovdqa	.LCPI4_6(%rip), %xmm6
	.align	16, 0x90
.LBB4_3:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rcx
	vmovdqu	%xmm4, (%rbx,%rcx,8)
	vpor	%xmm5, %xmm2, %xmm7
	vpextrq	$1, %xmm7, %rcx
	vmovdqu	%xmm4, (%rbx,%rcx,8)
	vpaddq	%xmm6, %xmm2, %xmm2
	vpcmpeqq	%xmm3, %xmm2, %xmm7
	vpextrq	$1, %xmm7, %rcx
	andl	$1, %ecx
	movb	%cl, 90(%rsp)
	vmovq	%xmm7, %rcx
	andl	$1, %ecx
	movb	%cl, 90(%rsp)
	movb	90(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_3
# BB#4:
	vmovdqa	%xmm3, %xmm2
	vpxor	%xmm5, %xmm5, %xmm5
.LBB4_5:                                # %middle.block
	vpcmpeqq	%xmm2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 88(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 88(%rsp)
	movb	88(%rsp), %cl
	testb	%cl, %cl
	jne	.LBB4_8
# BB#6:
	movabsq	$4607182418800017408, %rcx # imm = 0x3FF0000000000000
	vpand	%xmm1, %xmm8, %xmm0
	.align	16, 0x90
.LBB4_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rdx
	movq	%rcx, (%rbx,%rdx,8)
	vpaddq	%xmm15, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm3
	vpcmpeqq	%xmm0, %xmm3, %xmm3
	vpextrq	$1, %xmm3, %rdx
	andl	$1, %edx
	movb	%dl, 86(%rsp)
	vmovq	%xmm3, %rdx
	andl	$1, %edx
	movb	%dl, 86(%rsp)
	movb	86(%rsp), %dl
	testb	%dl, %dl
	je	.LBB4_7
.LBB4_8:                                # %for.body17.preheader
	vmovdqa	32(%rsp), %xmm1         # 16-byte Reload
	vpand	.LCPI4_0(%rip), %xmm1, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	movslq	%r12d, %r8
	movslq	%r13d, %rdx
	vmovapd	.LCPI4_7(%rip), %xmm11
	vmovapd	.LCPI4_4(%rip), %xmm12
	vmovdqa	.LCPI4_2(%rip), %xmm4
	vpand	%xmm4, %xmm0, %xmm13
	.align	16, 0x90
.LBB4_9:                                # %for.body17
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_10 Depth 2
                                        #       Child Loop BB4_11 Depth 3
                                        #     Child Loop BB4_15 Depth 2
                                        #       Child Loop BB4_16 Depth 3
                                        #     Child Loop BB4_19 Depth 2
                                        #       Child Loop BB4_20 Depth 3
                                        #     Child Loop BB4_23 Depth 2
                                        #       Child Loop BB4_21 Depth 3
	vmovdqa	%xmm4, %xmm2
	vmovdqa	%xmm5, 16(%rsp)         # 16-byte Spill
	vmovq	%r8, %xmm0
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	%xmm1, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm0, %rsi
	andl	$1, %esi
	movb	%sil, 84(%rsp)
	vmovq	%xmm0, %rsi
	andl	$1, %esi
	movb	%sil, 84(%rsp)
	movb	84(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_24
	.align	16, 0x90
.LBB4_10:                               # %for.body3.lr.ph.us.i.i
                                        #   Parent Loop BB4_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_11 Depth 3
	vmovdqa	32(%rsp), %xmm14        # 16-byte Reload
	vpextrq	$1, %xmm14, %rsi
	vmovq	%xmm14, %rcx
	movslq	%ecx, %rcx
	movslq	%esi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm9 # xmm9 = xmm1[0],xmm0[0]
	vpaddq	%xmm15, %xmm14, %xmm0
	vmovdqa	%xmm0, 32(%rsp)         # 16-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
	vpxor	%xmm3, %xmm3, %xmm3
	vmovapd	%xmm12, %xmm10
	vmovapd	%xmm11, %xmm12
	vmovdqa	%xmm2, %xmm11
	.align	16, 0x90
.LBB4_11:                               # %for.body3.us.i.i
                                        #   Parent Loop BB4_9 Depth=1
                                        #     Parent Loop BB4_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm1, %rcx
	vmovddup	(%rbx,%rcx,8), %xmm4
	vpaddq	%xmm14, %xmm1, %xmm2
	vmovdqa	32(%rsp), %xmm5         # 16-byte Reload
	vpaddq	%xmm3, %xmm5, %xmm6
	vpmuludq	%xmm2, %xmm6, %xmm7
	vpsrlq	$32, %xmm2, %xmm8
	vpmuludq	%xmm8, %xmm6, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm7, %xmm5
	vpsrlq	$32, %xmm6, %xmm6
	vpmuludq	%xmm2, %xmm6, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm5, %xmm2
	vmovq	%xmm2, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm2, %rdi
	movslq	%edi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm2
	vcvtsi2sdq	%rcx, %xmm0, %xmm5
	vunpcklpd	%xmm2, %xmm5, %xmm2 # xmm2 = xmm5[0],xmm2[0]
	vmulpd	%xmm12, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm9, %xmm2
	vaddpd	%xmm10, %xmm2, %xmm2
	vdivpd	%xmm2, %xmm4, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpaddq	%xmm15, %xmm1, %xmm1
	vpaddq	%xmm15, %xmm3, %xmm3
	vpand	%xmm11, %xmm1, %xmm2
	vpcmpeqq	%xmm13, %xmm2, %xmm2
	vpextrq	$1, %xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 82(%rsp)
	vmovq	%xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 82(%rsp)
	movb	82(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_11
# BB#12:                                # %for.end.us.i.i
                                        #   in Loop: Header=BB4_10 Depth=2
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%rax,%rsi,8)
	vmovdqa	32(%rsp), %xmm0         # 16-byte Reload
	vpand	%xmm11, %xmm0, %xmm0
	vmovdqa	%xmm11, %xmm2
	vpcmpeqq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 80(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 80(%rsp)
	movb	80(%rsp), %cl
	vpxor	%xmm8, %xmm8, %xmm8
	testb	%cl, %cl
	vmovapd	%xmm12, %xmm11
	vmovapd	%xmm10, %xmm12
	je	.LBB4_10
# BB#13:                                #   in Loop: Header=BB4_9 Depth=1
	vmovdqa	%xmm2, %xmm10
	.align	16, 0x90
.LBB4_15:                               # %for.body3.lr.ph.us.i28.i
                                        #   Parent Loop BB4_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_16 Depth 3
	vmovdqa	%xmm8, %xmm9
	vpextrq	$1, %xmm9, %rsi
	vmovq	%xmm9, %rcx
	movslq	%ecx, %rcx
	movslq	%esi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm14 # xmm14 = xmm1[0],xmm0[0]
	vpaddq	%xmm15, %xmm9, %xmm8
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB4_16:                               # %for.body3.us.i25.i
                                        #   Parent Loop BB4_9 Depth=1
                                        #     Parent Loop BB4_15 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm1, %rcx
	vmovddup	(%rax,%rcx,8), %xmm2
	vpaddq	%xmm9, %xmm1, %xmm4
	vpaddq	%xmm3, %xmm8, %xmm7
	vpmuludq	%xmm4, %xmm7, %xmm6
	vpsrlq	$32, %xmm4, %xmm5
	vpmuludq	%xmm5, %xmm7, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm6, %xmm5
	vpsrlq	$32, %xmm7, %xmm6
	vpmuludq	%xmm4, %xmm6, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm5, %xmm4
	vmovq	%xmm4, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm4, %rdi
	movslq	%edi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm4
	vcvtsi2sdq	%rcx, %xmm0, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vmulpd	%xmm11, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm14, %xmm4
	vaddpd	%xmm12, %xmm4, %xmm4
	vdivpd	%xmm4, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpaddq	%xmm15, %xmm1, %xmm1
	vpaddq	%xmm15, %xmm3, %xmm3
	vpand	%xmm10, %xmm1, %xmm2
	vpcmpeqq	%xmm13, %xmm2, %xmm2
	vpextrq	$1, %xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 78(%rsp)
	vmovq	%xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 78(%rsp)
	movb	78(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_16
# BB#14:                                # %for.end.us.i7.i
                                        #   in Loop: Header=BB4_15 Depth=2
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%r14,%rsi,8)
	vpand	%xmm10, %xmm8, %xmm0
	vpcmpeqq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 76(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 76(%rsp)
	movb	76(%rsp), %cl
	vpxor	%xmm9, %xmm9, %xmm9
	testb	%cl, %cl
	je	.LBB4_15
	.align	16, 0x90
.LBB4_19:                               # %for.body3.lr.ph.us.i.i84
                                        #   Parent Loop BB4_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_20 Depth 3
	vmovdqa	%xmm9, %xmm8
	vpextrq	$1, %xmm8, %rsi
	vmovq	%xmm8, %rcx
	movslq	%ecx, %rcx
	movslq	%esi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm14 # xmm14 = xmm1[0],xmm0[0]
	vpaddq	%xmm15, %xmm8, %xmm9
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB4_20:                               # %for.body3.us.i.i80
                                        #   Parent Loop BB4_9 Depth=1
                                        #     Parent Loop BB4_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm1, %rcx
	vmovddup	(%r14,%rcx,8), %xmm2
	vpaddq	%xmm8, %xmm1, %xmm4
	vpaddq	%xmm3, %xmm9, %xmm6
	vpmuludq	%xmm4, %xmm6, %xmm7
	vpsrlq	$32, %xmm4, %xmm5
	vpmuludq	%xmm5, %xmm6, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm7, %xmm5
	vpsrlq	$32, %xmm6, %xmm6
	vpmuludq	%xmm4, %xmm6, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm5, %xmm4
	vmovq	%xmm4, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm4, %rdi
	movslq	%edi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm4
	vcvtsi2sdq	%rcx, %xmm0, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vmulpd	%xmm11, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm14, %xmm4
	vaddpd	%xmm12, %xmm4, %xmm4
	vdivpd	%xmm4, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpaddq	%xmm15, %xmm1, %xmm1
	vpaddq	%xmm15, %xmm3, %xmm3
	vpand	%xmm10, %xmm1, %xmm2
	vpcmpeqq	%xmm13, %xmm2, %xmm2
	vpextrq	$1, %xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 74(%rsp)
	vmovq	%xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 74(%rsp)
	movb	74(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_20
# BB#17:                                # %for.end.us.i.i63
                                        #   in Loop: Header=BB4_19 Depth=2
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%rax,%rsi,8)
	vpand	%xmm10, %xmm9, %xmm0
	vpcmpeqq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 72(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 72(%rsp)
	movb	72(%rsp), %cl
	vpxor	%xmm8, %xmm8, %xmm8
	testb	%cl, %cl
	je	.LBB4_19
# BB#18:                                #   in Loop: Header=BB4_9 Depth=1
	vmovdqa	%xmm10, %xmm2
	.align	16, 0x90
.LBB4_23:                               # %for.body3.lr.ph.us.i28.i110
                                        #   Parent Loop BB4_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_21 Depth 3
	vmovdqa	%xmm8, %xmm9
	vpextrq	$1, %xmm9, %rsi
	vmovq	%xmm9, %rcx
	movslq	%ecx, %rcx
	movslq	%esi, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rdi, %xmm0, %xmm0
	vcvtsi2sdq	%rcx, %xmm0, %xmm1
	vunpcklpd	%xmm0, %xmm1, %xmm14 # xmm14 = xmm1[0],xmm0[0]
	vpaddq	%xmm15, %xmm9, %xmm8
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	%xmm2, %xmm10
	.align	16, 0x90
.LBB4_21:                               # %for.body3.us.i25.i106
                                        #   Parent Loop BB4_9 Depth=1
                                        #     Parent Loop BB4_23 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpextrq	$1, %xmm1, %rcx
	vmovddup	(%rax,%rcx,8), %xmm2
	vpaddq	%xmm9, %xmm1, %xmm4
	vpaddq	%xmm3, %xmm8, %xmm7
	vpmuludq	%xmm4, %xmm7, %xmm6
	vpsrlq	$32, %xmm4, %xmm5
	vpmuludq	%xmm5, %xmm7, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm6, %xmm5
	vpsrlq	$32, %xmm7, %xmm6
	vpmuludq	%xmm4, %xmm6, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm5, %xmm4
	vmovq	%xmm4, %rcx
	movslq	%ecx, %rcx
	vpextrq	$1, %xmm4, %rdi
	movslq	%edi, %rdi
	vcvtsi2sdq	%rdi, %xmm0, %xmm4
	vcvtsi2sdq	%rcx, %xmm0, %xmm5
	vunpcklpd	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vmulpd	%xmm11, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm14, %xmm4
	vaddpd	%xmm12, %xmm4, %xmm4
	vdivpd	%xmm4, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpaddq	%xmm15, %xmm1, %xmm1
	vpaddq	%xmm15, %xmm3, %xmm3
	vpand	%xmm10, %xmm1, %xmm2
	vpcmpeqq	%xmm13, %xmm2, %xmm2
	vpextrq	$1, %xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 70(%rsp)
	vmovq	%xmm2, %rcx
	andl	$1, %ecx
	movb	%cl, 70(%rsp)
	movb	70(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_21
# BB#22:                                # %for.end.us.i7.i89
                                        #   in Loop: Header=BB4_23 Depth=2
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovsd	%xmm0, (%rbx,%rsi,8)
	vpand	%xmm10, %xmm8, %xmm0
	vmovdqa	%xmm10, %xmm2
	vpcmpeqq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 68(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 68(%rsp)
	movb	68(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_23
.LBB4_24:                               # %mult_AtAv_serial.exit111
                                        #   in Loop: Header=BB4_9 Depth=1
	vmovdqa	16(%rsp), %xmm5         # 16-byte Reload
	vpaddq	%xmm15, %xmm5, %xmm5
	vmovdqa	%xmm2, %xmm4
	vpand	%xmm4, %xmm5, %xmm0
	vpcmpeqq	.LCPI4_8(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 66(%rsp)
	vmovq	%xmm0, %rcx
	andl	$1, %ecx
	movb	%cl, 66(%rsp)
	movb	66(%rsp), %cl
	testb	%cl, %cl
	je	.LBB4_9
# BB#25:                                # %for.end20
	movslq	%r12d, %rax
	vmovq	%rax, %xmm0
	movslq	%r13d, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpgtq	%xmm0, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, 64(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, 64(%rsp)
	movb	64(%rsp), %al
	vpxor	%xmm1, %xmm1, %xmm1
	testb	%al, %al
	je	.LBB4_30
# BB#26:                                # %for.body.i55.preheader
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
	.align	16, 0x90
.LBB4_27:                               # %for.body.i55
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm1, %rax
	vmovddup	(%rbx,%rax,8), %xmm2
	vmovddup	(%r14,%rax,8), %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpaddq	%xmm15, %xmm1, %xmm1
	vpand	%xmm4, %xmm1, %xmm2
	vpcmpeqq	%xmm13, %xmm2, %xmm2
	vpextrq	$1, %xmm2, %rax
	andl	$1, %eax
	movb	%al, 62(%rsp)
	vmovq	%xmm2, %rax
	andl	$1, %eax
	movb	%al, 62(%rsp)
	movb	62(%rsp), %al
	testb	%al, %al
	je	.LBB4_27
# BB#28:                                # %for.body.i.preheader
	vxorpd	%xmm3, %xmm3, %xmm3
	vpxor	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB4_29:                               # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rax
	vmovddup	(%r14,%rax,8), %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vpaddq	%xmm15, %xmm3, %xmm3
	vpand	%xmm4, %xmm3, %xmm2
	vpcmpeqq	%xmm13, %xmm2, %xmm2
	vpextrq	$1, %xmm2, %rax
	andl	$1, %eax
	movb	%al, 60(%rsp)
	vmovq	%xmm2, %rax
	andl	$1, %eax
	movb	%al, 60(%rsp)
	movb	60(%rsp), %al
	testb	%al, %al
	je	.LBB4_29
.LBB4_30:                               # %dot.exit
	vdivpd	%xmm1, %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	xorl	%eax, %eax
	addq	$96, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.Ltmp21:
	.size	main, .Ltmp21-main
	.cfi_endproc

	.type	tmp,@object             # @tmp
	.comm	tmp,8,8
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%.9f\n"
	.size	.L.str, 6


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
