	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI0_1:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_2:
	.quad	-4620693217682128896    # double -5.000000e-01
	.quad	-4620693217682128896    # double -5.000000e-01
.LCPI0_3:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI0_4:
	.quad	4600858325139338833     # double 3.989423e-01
	.quad	4600858325139338833     # double 3.989423e-01
.LCPI0_5:
	.quad	4597513799286722574     # double 2.316419e-01
	.quad	4597513799286722574     # double 2.316419e-01
.LCPI0_6:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI0_7:
	.quad	4599425086075893996     # double 3.193815e-01
	.quad	4599425086075893996     # double 3.193815e-01
.LCPI0_8:
	.quad	-4623277134873873829    # double -3.565638e-01
	.quad	-4623277134873873829    # double -3.565638e-01
.LCPI0_9:
	.quad	4610701882545888872     # double 1.781478e+00
	.quad	4610701882545888872     # double 1.781478e+00
.LCPI0_10:
	.quad	-4612491009938261808    # double -1.821256e+00
	.quad	-4612491009938261808    # double -1.821256e+00
.LCPI0_11:
	.quad	4608669842595391811     # double 1.330274e+00
	.quad	4608669842595391811     # double 1.330274e+00
	.text
	.globl	CNDF
	.align	16, 0x90
	.type	CNDF,@function
CNDF:                                   # @CNDF
	.cfi_startproc
# BB#0:                                 # %entry
	vpermilpd	$0, %xmm0, %xmm1 # xmm1 = xmm0[0,0]
	vxorpd	%xmm0, %xmm0, %xmm0
	vcmpltpd	%xmm0, %xmm1, %xmm2
	vpextrq	$1, %xmm2, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	vmovq	%xmm2, %rax
	andl	$1, %eax
	movb	%al, -2(%rsp)
	movb	-2(%rsp), %al
	testb	%al, %al
	je	.LBB0_2
# BB#1:                                 # %if.then
	vxorpd	.LCPI0_0(%rip), %xmm1, %xmm1
	vmovapd	.LCPI0_1(%rip), %xmm0
.LBB0_2:                                # %if.end
	vmulpd	.LCPI0_2(%rip), %xmm1, %xmm2
	vmulpd	%xmm2, %xmm1, %xmm2
	vandpd	.LCPI0_3(%rip), %xmm2, %xmm2
	vmulpd	.LCPI0_4(%rip), %xmm2, %xmm2
	vmulpd	.LCPI0_5(%rip), %xmm1, %xmm3
	vmovapd	.LCPI0_6(%rip), %xmm1
	vaddpd	%xmm1, %xmm3, %xmm3
	vdivpd	%xmm3, %xmm1, %xmm3
	vmulpd	%xmm3, %xmm3, %xmm4
	vmulpd	%xmm4, %xmm3, %xmm5
	vmulpd	%xmm5, %xmm3, %xmm6
	vmulpd	%xmm6, %xmm3, %xmm7
	vmulpd	.LCPI0_7(%rip), %xmm3, %xmm3
	vmulpd	.LCPI0_8(%rip), %xmm4, %xmm4
	vmulpd	.LCPI0_9(%rip), %xmm5, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmulpd	.LCPI0_10(%rip), %xmm6, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmulpd	.LCPI0_11(%rip), %xmm7, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vsubpd	%xmm2, %xmm1, %xmm2
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, -4(%rsp)
	movb	-4(%rsp), %al
	testb	%al, %al
	je	.LBB0_4
# BB#3:                                 # %if.then19
	vsubpd	%xmm2, %xmm1, %xmm2
.LBB0_4:                                # %if.end21
	vunpckhpd	%xmm2, %xmm2, %xmm0 # xmm0 = xmm2[1,1]
	ret
.Ltmp0:
	.size	CNDF, .Ltmp0-CNDF
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_0:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI1_1:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI1_2:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI1_3:
	.quad	-4620693217682128896    # double -5.000000e-01
	.quad	-4620693217682128896    # double -5.000000e-01
.LCPI1_4:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI1_5:
	.quad	4600858325139338833     # double 3.989423e-01
	.quad	4600858325139338833     # double 3.989423e-01
.LCPI1_6:
	.quad	4597513799286722574     # double 2.316419e-01
	.quad	4597513799286722574     # double 2.316419e-01
.LCPI1_7:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI1_8:
	.quad	4599425086075893996     # double 3.193815e-01
	.quad	4599425086075893996     # double 3.193815e-01
.LCPI1_9:
	.quad	-4623277134873873829    # double -3.565638e-01
	.quad	-4623277134873873829    # double -3.565638e-01
.LCPI1_10:
	.quad	4610701882545888872     # double 1.781478e+00
	.quad	4610701882545888872     # double 1.781478e+00
.LCPI1_11:
	.quad	-4612491009938261808    # double -1.821256e+00
	.quad	-4612491009938261808    # double -1.821256e+00
.LCPI1_12:
	.quad	4608669842595391811     # double 1.330274e+00
	.quad	4608669842595391811     # double 1.330274e+00
.LCPI1_13:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	BlkSchlsEqEuroNoDiv
	.align	16, 0x90
	.type	BlkSchlsEqEuroNoDiv,@function
BlkSchlsEqEuroNoDiv:                    # @BlkSchlsEqEuroNoDiv
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp3:
	.cfi_def_cfa_offset 16
	subq	$144, %rsp
.Ltmp4:
	.cfi_def_cfa_offset 160
.Ltmp5:
	.cfi_offset %rbx, -16
	movl	%edi, %ebx
	vpermilpd	$0, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	vmovapd	%xmm2, 80(%rsp)         # 16-byte Spill
	vpermilpd	$0, %xmm3, %xmm2 # xmm2 = xmm3[0,0]
	vmovapd	%xmm2, 48(%rsp)         # 16-byte Spill
	vpermilpd	$0, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovapd	%xmm1, 96(%rsp)         # 16-byte Spill
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovapd	%xmm0, 112(%rsp)        # 16-byte Spill
	vpermilpd	$0, %xmm4, %xmm2 # xmm2 = xmm4[0,0]
	vmovapd	%xmm2, 32(%rsp)         # 16-byte Spill
	vsqrtpd	%xmm2, %xmm2
	vmovapd	%xmm2, 64(%rsp)         # 16-byte Spill
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	callq	log
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	vmovapd	(%rsp), %xmm0           # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	log
	vmovapd	16(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm2         # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm1
	vmulpd	.LCPI1_0(%rip), %xmm1, %xmm1
	vmovapd	80(%rsp), %xmm3         # 16-byte Reload
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovapd	%xmm3, %xmm10
	vmovapd	32(%rsp), %xmm3         # 16-byte Reload
	vmulpd	%xmm3, %xmm1, %xmm1
	vmovapd	%xmm3, %xmm11
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	64(%rsp), %xmm0         # 16-byte Reload
	vmulpd	%xmm2, %xmm0, %xmm0
	vdivpd	%xmm0, %xmm1, %xmm1
	vxorpd	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm3, %xmm1, %xmm2
	vpextrq	$1, %xmm2, %rax
	andl	$1, %eax
	movb	%al, 142(%rsp)
	vmovq	%xmm2, %rax
	andl	$1, %eax
	movb	%al, 142(%rsp)
	movb	142(%rsp), %al
	vmovapd	%xmm1, %xmm4
	testb	%al, %al
	je	.LBB1_2
# BB#1:                                 # %if.then.i
	vxorpd	.LCPI1_1(%rip), %xmm1, %xmm4
	vmovapd	.LCPI1_2(%rip), %xmm3
.LBB1_2:                                # %if.end.i
	vsubpd	%xmm0, %xmm1, %xmm2
	vmulpd	.LCPI1_3(%rip), %xmm4, %xmm0
	vmulpd	%xmm0, %xmm4, %xmm0
	vandpd	.LCPI1_4(%rip), %xmm0, %xmm0
	vmulpd	.LCPI1_5(%rip), %xmm0, %xmm1
	vmulpd	.LCPI1_6(%rip), %xmm4, %xmm4
	vmovapd	.LCPI1_7(%rip), %xmm8
	vaddpd	%xmm8, %xmm4, %xmm4
	vdivpd	%xmm4, %xmm8, %xmm4
	vmulpd	%xmm4, %xmm4, %xmm5
	vmulpd	%xmm5, %xmm4, %xmm6
	vmulpd	%xmm6, %xmm4, %xmm7
	vmulpd	%xmm7, %xmm4, %xmm0
	vmulpd	.LCPI1_8(%rip), %xmm4, %xmm4
	vmulpd	.LCPI1_9(%rip), %xmm5, %xmm5
	vmulpd	.LCPI1_10(%rip), %xmm6, %xmm6
	vaddpd	%xmm6, %xmm5, %xmm5
	vmulpd	.LCPI1_11(%rip), %xmm7, %xmm6
	vaddpd	%xmm6, %xmm5, %xmm5
	vmulpd	.LCPI1_12(%rip), %xmm0, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vmulpd	%xmm0, %xmm1, %xmm0
	vsubpd	%xmm0, %xmm8, %xmm9
	vpextrq	$1, %xmm3, %rax
	andl	$1, %eax
	movb	%al, 140(%rsp)
	vmovq	%xmm3, %rax
	andl	$1, %eax
	movb	%al, 140(%rsp)
	movb	140(%rsp), %al
	testb	%al, %al
	je	.LBB1_4
# BB#3:                                 # %if.then19.i
	vsubpd	%xmm9, %xmm8, %xmm9
.LBB1_4:                                # %CNDF.exit
	vmovd	%ebx, %xmm4
	vxorpd	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm3, %xmm2, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 138(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 138(%rsp)
	movb	138(%rsp), %al
	testb	%al, %al
	je	.LBB1_6
# BB#5:                                 # %if.then.i42
	vxorpd	.LCPI1_1(%rip), %xmm2, %xmm2
	vmovapd	.LCPI1_2(%rip), %xmm3
.LBB1_6:                                # %if.end.i67
	vpbroadcastq	%xmm4, %xmm4
	vmulpd	.LCPI1_3(%rip), %xmm2, %xmm0
	vmulpd	%xmm0, %xmm2, %xmm0
	vandpd	.LCPI1_4(%rip), %xmm0, %xmm0
	vmulpd	.LCPI1_5(%rip), %xmm0, %xmm0
	vmulpd	.LCPI1_6(%rip), %xmm2, %xmm2
	vaddpd	%xmm8, %xmm2, %xmm2
	vdivpd	%xmm2, %xmm8, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm5
	vmulpd	%xmm5, %xmm2, %xmm6
	vmulpd	%xmm6, %xmm2, %xmm7
	vmulpd	%xmm7, %xmm2, %xmm1
	vmulpd	.LCPI1_8(%rip), %xmm2, %xmm2
	vmulpd	.LCPI1_9(%rip), %xmm5, %xmm5
	vmulpd	.LCPI1_10(%rip), %xmm6, %xmm6
	vaddpd	%xmm6, %xmm5, %xmm5
	vmulpd	.LCPI1_11(%rip), %xmm7, %xmm6
	vaddpd	%xmm6, %xmm5, %xmm5
	vmulpd	.LCPI1_12(%rip), %xmm1, %xmm1
	vaddpd	%xmm1, %xmm5, %xmm1
	vaddpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vsubpd	%xmm0, %xmm8, %xmm2
	vpextrq	$1, %xmm3, %rax
	andl	$1, %eax
	movb	%al, 136(%rsp)
	vmovq	%xmm3, %rax
	andl	$1, %eax
	movb	%al, 136(%rsp)
	movb	136(%rsp), %al
	testb	%al, %al
	je	.LBB1_8
# BB#7:                                 # %if.then19.i69
	vsubpd	%xmm2, %xmm8, %xmm2
.LBB1_8:                                # %CNDF.exit71
	vmulpd	%xmm11, %xmm10, %xmm0
	vandpd	.LCPI1_4(%rip), %xmm0, %xmm0
	vmulpd	96(%rsp), %xmm0, %xmm3  # 16-byte Folded Reload
	vpand	.LCPI1_13(%rip), %xmm4, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 134(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 134(%rsp)
	movb	134(%rsp), %al
	testb	%al, %al
	je	.LBB1_10
# BB#9:                                 # %if.then
	vmulpd	112(%rsp), %xmm9, %xmm0 # 16-byte Folded Reload
	vmulpd	%xmm3, %xmm2, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm0
	jmp	.LBB1_11
.LBB1_10:                               # %if.else
	vsubpd	%xmm9, %xmm8, %xmm0
	vsubpd	%xmm2, %xmm8, %xmm1
	vmulpd	%xmm3, %xmm1, %xmm1
	vmulpd	112(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vsubpd	%xmm0, %xmm1, %xmm0
.LBB1_11:                               # %if.end
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	addq	$144, %rsp
	popq	%rbx
	ret
.Ltmp6:
	.size	BlkSchlsEqEuroNoDiv, .Ltmp6-BlkSchlsEqEuroNoDiv
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI2_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI2_2:
	.quad	100                     # 0x64
	.quad	100                     # 0x64
	.text
	.globl	bs_thread
	.align	16, 0x90
	.type	bs_thread,@function
bs_thread:                              # @bs_thread
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp11:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp12:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp13:
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
.Ltmp14:
	.cfi_def_cfa_offset 96
.Ltmp15:
	.cfi_offset %rbx, -32
.Ltmp16:
	.cfi_offset %r14, -24
.Ltmp17:
	.cfi_offset %r15, -16
	vmovd	(%rdi), %xmm0
	vmovd	numOptions(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vmovq	%xmm1, %rax
	movslq	%eax, %rsi
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovd	nThreads(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rdi
	vpextrq	$1, %xmm1, %rcx
	movslq	%ecx, %rcx
	cqto
	idivq	%rcx
	movq	%rax, %rcx
	movslq	%ecx, %rax
	vmovq	%rax, %xmm1
	movq	%rsi, %rax
	cqto
	idivq	%rdi
	movslq	%eax, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpgtq	%xmm4, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rdx
	andl	$1, %edx
	movb	%dl, 62(%rsp)
	vmovq	%xmm1, %rdx
	andl	$1, %edx
	movb	%dl, 62(%rsp)
	movb	62(%rsp), %dl
	testb	%dl, %dl
	je	.LBB2_5
# BB#1:                                 # %entry.split.us
	vpbroadcastq	%xmm0, %xmm0
	vmovq	%rcx, %xmm1
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpmuludq	%xmm0, %xmm1, %xmm2
	vpsrlq	$32, %xmm0, %xmm3
	vpmuludq	%xmm3, %xmm1, %xmm3
	vpsllq	$32, %xmm3, %xmm3
	vpaddq	%xmm3, %xmm2, %xmm2
	vpsrlq	$32, %xmm1, %xmm3
	vpmuludq	%xmm0, %xmm3, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm2, %xmm0
	vpaddq	%xmm1, %xmm0, %xmm1
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm2[0]
	vmovdqa	%xmm0, (%rsp)           # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	movslq	%eax, %r14
	vmovq	%xmm1, %rax
	movslq	%eax, %r15
	.align	16, 0x90
.LBB2_4:                                # %for.body4.lr.ph.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	vmovdqa	%xmm4, 16(%rsp)         # 16-byte Spill
	vmovdqa	(%rsp), %xmm4           # 16-byte Reload
	.align	16, 0x90
.LBB2_2:                                # %for.body4.us
                                        #   Parent Loop BB2_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqa	%xmm4, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm4, %rbx
	movq	sptprice(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm0
	movq	strike(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm1
	movq	rate(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm2
	movq	volatility(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm3
	movq	otime(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm4
	movq	otype(%rip), %rax
	movl	(%rax,%rbx,4), %edi
	callq	BlkSchlsEqEuroNoDiv
	vmovdqa	32(%rsp), %xmm4         # 16-byte Reload
	vmovdqa	.LCPI2_0(%rip), %xmm3
	movq	prices(%rip), %rax
	vmovsd	%xmm0, (%rax,%rbx,8)
	vpaddq	%xmm3, %xmm4, %xmm4
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovq	%r14, %xmm1
	vmovq	%r15, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 60(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 60(%rsp)
	movb	60(%rsp), %al
	testb	%al, %al
	jne	.LBB2_2
# BB#3:                                 # %for.inc17.us
                                        #   in Loop: Header=BB2_4 Depth=1
	vmovdqa	16(%rsp), %xmm4         # 16-byte Reload
	vpaddq	%xmm3, %xmm4, %xmm4
	vpand	.LCPI2_1(%rip), %xmm4, %xmm0
	vpcmpeqq	.LCPI2_2(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 58(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 58(%rsp)
	movb	58(%rsp), %al
	testb	%al, %al
	je	.LBB2_4
.LBB2_5:                                # %for.end19
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
.Ltmp18:
	.size	bs_thread, .Ltmp18-bs_thread
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI3_1:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI3_2:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI3_3:
	.quad	72                      # 0x48
	.quad	72                      # 0x48
.LCPI3_4:
	.quad	9                       # 0x9
	.quad	9                       # 0x9
.LCPI3_5:
	.quad	5                       # 0x5
	.quad	5                       # 0x5
.LCPI3_6:
	.quad	256                     # 0x100
	.quad	256                     # 0x100
.LCPI3_7:
	.quad	-64                     # 0xffffffffffffffc0
	.quad	-64                     # 0xffffffffffffffc0
.LCPI3_8:
	.quad	255                     # 0xff
	.quad	255                     # 0xff
.LCPI3_9:
	.quad	80                      # 0x50
	.quad	80                      # 0x50
.LCPI3_10:
	.quad	76                      # 0x4c
	.quad	76                      # 0x4c
.LCPI3_11:
	.quad	100                     # 0x64
	.quad	100                     # 0x64
.LCPI3_12:
	.quad	1000000                 # 0xf4240
	.quad	1000000                 # 0xf4240
.LCPI3_13:
	.zero	16
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp25:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp26:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp27:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp28:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp29:
	.cfi_def_cfa_offset 48
	subq	$192, %rsp
.Ltmp30:
	.cfi_def_cfa_offset 240
.Ltmp31:
	.cfi_offset %rbx, -48
.Ltmp32:
	.cfi_offset %r12, -40
.Ltmp33:
	.cfi_offset %r13, -32
.Ltmp34:
	.cfi_offset %r14, -24
.Ltmp35:
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vmovdqa	%xmm0, 112(%rsp)        # 16-byte Spill
	movl	$.Lstr, %edi
	callq	puts
	xorl	%edi, %edi
	callq	fflush
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vpcmpeqq	.LCPI3_1(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 174(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 174(%rsp)
	movb	174(%rsp), %al
	testb	%al, %al
	je	.LBB3_1
# BB#2:                                 # %if.end
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpextrd	$2, %xmm0, %esi
	vpextrd	$2, %xmm0, nThreads(%rip)
	movl	$.L.str2, %edi
	xorl	%eax, %eax
	callq	printf
	movq	16(%rbx), %r15
	movl	$.L.str3, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
	movq	24(%rbx), %r14
	movl	$.L.str4, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	movl	$.L.str5, %esi
	movq	%r15, %rdi
	callq	fopen
	movq	%rax, %r13
	vmovq	%r13, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 172(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 172(%rsp)
	movb	172(%rsp), %al
	testb	%al, %al
	jne	.LBB3_3
# BB#6:                                 # %if.end16
	movl	$.L.str7, %esi
	movl	$numOptions, %edx
	xorl	%eax, %eax
	movq	%r13, %rdi
	callq	__isoc99_fscanf
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI3_2(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 170(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 170(%rsp)
	movb	170(%rsp), %al
	testb	%al, %al
	je	.LBB3_7
# BB#9:                                 # %if.end22
	vmovd	nThreads(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm0[0]
	vmovd	numOptions(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vpextrq	$1, %xmm2, %rax
	andl	$1, %eax
	movb	%al, 168(%rsp)
	vmovq	%xmm2, %rax
	andl	$1, %eax
	movb	%al, 168(%rsp)
	movb	168(%rsp), %al
	testb	%al, %al
	je	.LBB3_11
# BB#10:                                # %if.then24
	movl	$.Lstr22, %edi
	callq	puts
	movl	numOptions(%rip), %eax
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	movl	%eax, nThreads(%rip)
	vmovdqa	%xmm0, %xmm1
.LBB3_11:                               # %if.end26
	vpand	.LCPI3_0(%rip), %xmm1, %xmm1
	vpcmpeqq	.LCPI3_2(%rip), %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	andl	$1, %eax
	movb	%al, 166(%rsp)
	vmovq	%xmm1, %rax
	andl	$1, %eax
	movb	%al, 166(%rsp)
	movb	166(%rsp), %al
	testb	%al, %al
	je	.LBB3_38
# BB#12:                                # %if.end30
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm3 # xmm3 = xmm0[0],xmm1[0]
	vmovdqa	%xmm3, 112(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI3_3(%rip), %xmm0
	vpmuludq	%xmm0, %xmm3, %xmm1
	vpsrlq	$32, %xmm0, %xmm2
	vpmuludq	%xmm2, %xmm3, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vpsrlq	$32, %xmm3, %xmm2
	vpmuludq	%xmm0, %xmm2, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	movq	%rax, %r12
	movq	%r12, data(%rip)
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	movq	%rax, prices(%rip)
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 164(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 164(%rsp)
	movb	164(%rsp), %al
	testb	%al, %al
	je	.LBB3_17
# BB#13:
	vmovq	%r12, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	jmp	.LBB3_16
	.align	16, 0x90
.LBB3_15:                               # %for.cond.for.body_crit_edge
                                        #   in Loop: Header=BB3_16 Depth=1
	vpbroadcastq	data(%rip), %xmm0
.LBB3_16:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm1, 112(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	vpextrq	$1, %xmm0, %rsi
	leaq	(%rax,%rax,8), %rax
	leaq	(%rsi,%rax,8), %rdx
	leaq	8(%rsi,%rax,8), %rcx
	leaq	16(%rsi,%rax,8), %r8
	leaq	24(%rsi,%rax,8), %r9
	leaq	32(%rsi,%rax,8), %r10
	leaq	40(%rsi,%rax,8), %r11
	leaq	48(%rsi,%rax,8), %rdi
	leaq	56(%rsi,%rax,8), %rbx
	leaq	64(%rsi,%rax,8), %rax
	movq	%rax, 32(%rsp)
	movq	%rbx, 24(%rsp)
	movq	%rdi, 16(%rsp)
	movq	%r11, 8(%rsp)
	movq	%r10, (%rsp)
	movl	$.L.str11, %esi
	xorl	%eax, %eax
	movq	%r13, %rdi
	callq	__isoc99_fscanf
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI3_4(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 162(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 162(%rsp)
	movb	162(%rsp), %al
	testb	%al, %al
	je	.LBB3_7
# BB#14:                                # %for.cond
                                        #   in Loop: Header=BB3_16 Depth=1
	vmovdqa	112(%rsp), %xmm3        # 16-byte Reload
	vpaddq	.LCPI3_2(%rip), %xmm3, %xmm3
	vpunpckhqdq	%xmm3, %xmm3, %xmm0 # xmm0 = xmm3[1,1]
	vpbroadcastq	%xmm0, %xmm0
	vmovd	numOptions(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm2[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 160(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 160(%rsp)
	movb	160(%rsp), %al
	testb	%al, %al
	vmovdqa	%xmm3, %xmm1
	jne	.LBB3_15
.LBB3_17:                               # %for.end
	movq	%r13, %rdi
	callq	fclose
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 158(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 158(%rsp)
	movb	158(%rsp), %al
	testb	%al, %al
	je	.LBB3_18
# BB#19:                                # %if.end66
	movl	numOptions(%rip), %esi
	movl	$.L.str13, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str14, %edi
	movl	$100, %esi
	xorl	%eax, %eax
	callq	printf
	vmovd	numOptions(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm3
	vmovdqa	%xmm3, 112(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI3_5(%rip), %xmm0
	vpmuludq	%xmm0, %xmm3, %xmm1
	vpsrlq	$32, %xmm0, %xmm2
	vpmuludq	%xmm2, %xmm3, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vpsrlq	$32, %xmm3, %xmm2
	vpmuludq	%xmm0, %xmm2, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpsllq	$3, %xmm0, %xmm0
	vpaddq	.LCPI3_6(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI3_6(%rip), %xmm2
	vpaddq	%xmm2, %xmm0, %xmm0
	vpand	.LCPI3_7(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rbx
	vpextrq	$1, %xmm0, sptprice(%rip)
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vmovdqa	%xmm1, 48(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, strike(%rip)
	vpaddq	%xmm1, %xmm1, %xmm0
	vmovdqa	%xmm0, 96(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, rate(%rip)
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovdqa	%xmm0, 80(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, volatility(%rip)
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovdqa	%xmm0, 64(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, otime(%rip)
	vpsllq	$3, %xmm1, %xmm0
	vpaddq	%xmm2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovdqa	64(%rsp), %xmm11        # 16-byte Reload
	vmovdqa	80(%rsp), %xmm10        # 16-byte Reload
	vmovdqa	96(%rsp), %xmm2         # 16-byte Reload
	vmovdqa	48(%rsp), %xmm1         # 16-byte Reload
	vmovdqa	112(%rsp), %xmm7        # 16-byte Reload
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpaddq	.LCPI3_6(%rip), %xmm0, %xmm0
	vpand	.LCPI3_7(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, otype(%rip)
	vpcmpgtq	.LCPI3_13, %xmm1, %xmm3
	vpextrq	$1, %xmm3, %rax
	andl	$1, %eax
	movb	%al, 156(%rsp)
	vmovq	%xmm3, %rax
	andl	$1, %eax
	movb	%al, 156(%rsp)
	movb	156(%rsp), %al
	testb	%al, %al
	je	.LBB3_22
# BB#20:                                # %for.body89.lr.ph
	vpextrq	$1, %xmm0, %rax
	movq	data(%rip), %rcx
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	.LCPI3_8(%rip), %xmm8
	vmovdqa	.LCPI3_9(%rip), %xmm9
	vmovdqa	.LCPI3_2(%rip), %xmm3
	.align	16, 0x90
.LBB3_21:                               # %for.body89
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rdx
	leaq	(%rdx,%rdx,8), %rsi
	movzbl	48(%rcx,%rsi,8), %edi
	vmovd	%edi, %xmm4
	vpbroadcastq	%xmm4, %xmm4
	vpand	%xmm8, %xmm4, %xmm4
	vpcmpeqq	%xmm9, %xmm4, %xmm4
	vpand	%xmm3, %xmm4, %xmm4
	vpextrd	$2, %xmm4, (%rax,%rdx,4)
	vmovsd	(%rcx,%rsi,8), %xmm4
	vmovsd	%xmm4, (%rbx,%rdx,8)
	vmovsd	8(%rcx,%rsi,8), %xmm4
	vpaddq	%xmm1, %xmm0, %xmm5
	vpextrq	$1, %xmm5, %rdx
	vmovsd	%xmm4, (%rbx,%rdx,8)
	vmovsd	16(%rcx,%rsi,8), %xmm4
	vpaddq	%xmm2, %xmm0, %xmm5
	vpextrq	$1, %xmm5, %rdx
	vmovsd	%xmm4, (%rbx,%rdx,8)
	vmovsd	32(%rcx,%rsi,8), %xmm4
	vpaddq	%xmm10, %xmm0, %xmm5
	vpextrq	$1, %xmm5, %rdx
	vmovsd	%xmm4, (%rbx,%rdx,8)
	vmovsd	40(%rcx,%rsi,8), %xmm4
	vpaddq	%xmm11, %xmm0, %xmm5
	vpextrq	$1, %xmm5, %rdx
	vmovsd	%xmm4, (%rbx,%rdx,8)
	vpaddq	%xmm3, %xmm0, %xmm0
	vmovd	numOptions(%rip), %xmm4
	vpbroadcastq	%xmm4, %xmm7
	vpextrq	$1, %xmm7, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm4
	vmovq	%xmm7, %rdx
	movslq	%edx, %rdx
	vpextrq	$1, %xmm0, %rsi
	vmovq	%rdx, %xmm5
	movslq	%esi, %rdx
	vmovq	%rdx, %xmm6
	vmovq	%xmm0, %rdx
	vpunpcklqdq	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm5
	vpunpcklqdq	%xmm6, %xmm5, %xmm5 # xmm5 = xmm5[0],xmm6[0]
	vpcmpgtq	%xmm5, %xmm4, %xmm4
	vpextrq	$1, %xmm4, %rdx
	andl	$1, %edx
	vmovq	%xmm4, %rsi
	movb	%dl, 154(%rsp)
	andl	$1, %esi
	movb	%sil, 154(%rsp)
	movb	154(%rsp), %dl
	testb	%dl, %dl
	jne	.LBB3_21
.LBB3_22:                               # %for.end125
	vpextrq	$1, %xmm7, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm7, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	.LCPI3_10(%rip), %xmm1
	vpmuludq	%xmm1, %xmm0, %xmm2
	vpsrlq	$32, %xmm1, %xmm3
	vpmuludq	%xmm3, %xmm0, %xmm3
	vpsllq	$32, %xmm3, %xmm3
	vpaddq	%xmm3, %xmm2, %xmm2
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm1, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm2, %xmm0
	vpextrq	$1, %xmm0, %rsi
	movl	$.L.str15, %edi
	xorl	%eax, %eax
	callq	printf
	leaq	176(%rsp), %rsi
	movl	$1, %edi
	callq	clock_gettime
	vpbroadcastq	176(%rsp), %xmm0
	vmovdqa	%xmm0, 64(%rsp)         # 16-byte Spill
	vpbroadcastq	184(%rsp), %xmm0
	vmovdqa	%xmm0, 48(%rsp)         # 16-byte Spill
	vmovd	numOptions(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovq	%xmm0, %rax
	movslq	%eax, %rsi
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovd	nThreads(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rdi
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	cqto
	idivq	%rcx
	movq	%rax, %rcx
	movq	%rsi, %rax
	cqto
	idivq	%rdi
	movslq	%ecx, %rdx
	vmovq	%rdx, %xmm0
	movslq	%eax, %rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdx
	andl	$1, %edx
	movb	%dl, 152(%rsp)
	vmovq	%xmm0, %rdx
	andl	$1, %edx
	movb	%dl, 152(%rsp)
	movb	152(%rsp), %dl
	testb	%dl, %dl
	je	.LBB3_27
# BB#23:
	vmovq	%rcx, %xmm0
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	.LCPI3_0(%rip), %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vmovdqa	%xmm0, 96(%rsp)         # 16-byte Spill
	.align	16, 0x90
.LBB3_26:                               # %for.body4.lr.ph.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_24 Depth 2
	vmovdqa	%xmm2, 80(%rsp)         # 16-byte Spill
	vpxor	%xmm4, %xmm4, %xmm4
	.align	16, 0x90
.LBB3_24:                               # %for.body4.us.i
                                        #   Parent Loop BB3_26 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqa	%xmm4, 112(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm4, %rbx
	movq	sptprice(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm0
	movq	strike(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm1
	movq	rate(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm2
	movq	volatility(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm3
	movq	otime(%rip), %rax
	vmovsd	(%rax,%rbx,8), %xmm4
	movq	otype(%rip), %rax
	movl	(%rax,%rbx,4), %edi
	callq	BlkSchlsEqEuroNoDiv
	vmovdqa	112(%rsp), %xmm4        # 16-byte Reload
	vmovdqa	96(%rsp), %xmm2         # 16-byte Reload
	vmovdqa	.LCPI3_0(%rip), %xmm3
	vmovdqa	.LCPI3_2(%rip), %xmm1
	movq	prices(%rip), %rax
	vmovsd	%xmm0, (%rax,%rbx,8)
	vpaddq	%xmm1, %xmm4, %xmm4
	vpand	%xmm3, %xmm4, %xmm0
	vpcmpeqq	%xmm2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 150(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 150(%rsp)
	movb	150(%rsp), %al
	testb	%al, %al
	je	.LBB3_24
# BB#25:                                # %for.inc17.us.i
                                        #   in Loop: Header=BB3_26 Depth=1
	vmovdqa	80(%rsp), %xmm2         # 16-byte Reload
	vpaddq	%xmm1, %xmm2, %xmm2
	vpand	%xmm3, %xmm2, %xmm0
	vpcmpeqq	.LCPI3_11(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 148(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 148(%rsp)
	movb	148(%rsp), %al
	testb	%al, %al
	je	.LBB3_26
.LBB3_27:                               # %bs_thread.exit
	leaq	176(%rsp), %rsi
	movl	$1, %edi
	callq	clock_gettime
	vpbroadcastq	176(%rsp), %xmm0
	vpbroadcastq	184(%rsp), %xmm1
	vpextrq	$1, %xmm1, %rax
	movabsq	$2361183241434822607, %rcx # imm = 0x20C49BA5E353F7CF
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm2
	vmovq	%xmm1, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovdqa	48(%rsp), %xmm3         # 16-byte Reload
	vpextrq	$1, %xmm3, %rax
	movabsq	$-2361183241434822607, %rcx # imm = 0xDF3B645A1CAC0831
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm2
	vmovq	%xmm3, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vmovdqa	64(%rsp), %xmm3         # 16-byte Reload
	vpsubq	%xmm3, %xmm0, %xmm0
	vmovdqa	.LCPI3_12(%rip), %xmm3
	vpmuludq	%xmm3, %xmm0, %xmm4
	vpsrlq	$32, %xmm3, %xmm5
	vpmuludq	%xmm5, %xmm0, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm4, %xmm4
	vpsrlq	$32, %xmm0, %xmm0
	vpmuludq	%xmm3, %xmm0, %xmm0
	vpsllq	$32, %xmm0, %xmm0
	vpaddq	%xmm0, %xmm4, %xmm0
	vpaddq	%xmm1, %xmm2, %xmm1
	vpaddq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rsi
	movl	$.L.str16, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str17, %esi
	movq	%r14, %rdi
	callq	fopen
	movq	%rax, %rbx
	vmovq	%rbx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 146(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 146(%rsp)
	movb	146(%rsp), %al
	testb	%al, %al
	jne	.LBB3_28
# BB#30:                                # %if.end145
	movl	numOptions(%rip), %edx
	movl	$.L.str18, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	fprintf
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 144(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 144(%rsp)
	movb	144(%rsp), %al
	testb	%al, %al
	jne	.LBB3_36
# BB#31:                                # %for.cond153.preheader
	vmovd	numOptions(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 142(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 142(%rsp)
	movb	142(%rsp), %al
	testb	%al, %al
	je	.LBB3_32
	.align	16, 0x90
.LBB3_35:                               # %for.body156
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm1, 112(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	movq	prices(%rip), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0
	movl	$.L.str20, %esi
	movb	$1, %al
	movq	%rbx, %rdi
	callq	fprintf
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 140(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 140(%rsp)
	movb	140(%rsp), %al
	testb	%al, %al
	jne	.LBB3_36
# BB#34:                                # %for.cond153
                                        #   in Loop: Header=BB3_35 Depth=1
	vmovdqa	112(%rsp), %xmm3        # 16-byte Reload
	vpaddq	.LCPI3_2(%rip), %xmm3, %xmm3
	vpunpckhqdq	%xmm3, %xmm3, %xmm0 # xmm0 = xmm3[1,1]
	vpbroadcastq	%xmm0, %xmm0
	vmovd	numOptions(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm2[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 138(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 138(%rsp)
	movb	138(%rsp), %al
	testb	%al, %al
	vmovdqa	%xmm3, %xmm1
	jne	.LBB3_35
.LBB3_32:                               # %for.end168
	movq	%rbx, %rdi
	callq	fclose
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	andl	$1, %eax
	movb	%al, 136(%rsp)
	vmovq	%xmm0, %rax
	andl	$1, %eax
	movb	%al, 136(%rsp)
	movb	136(%rsp), %al
	testb	%al, %al
	je	.LBB3_33
# BB#37:                                # %if.end174
	movq	data(%rip), %rdi
	callq	free
	movq	prices(%rip), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$192, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LBB3_1:                                # %if.then
	movq	(%rbx), %rcx
	movl	$.L.str1, %edi
	xorl	%eax, %eax
	movq	%rcx, %rsi
	jmp	.LBB3_5
.LBB3_3:                                # %if.then14
	movl	$.L.str6, %edi
	jmp	.LBB3_4
.LBB3_38:                               # %if.then28
	movl	$.Lstr21, %edi
	callq	puts
	movl	$1, %edi
	callq	exit
.LBB3_7:                                # %if.then19
	movl	$.L.str8, %edi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	printf
	movq	%r13, %rdi
	jmp	.LBB3_8
.LBB3_18:                               # %if.then64
	movl	$.L.str12, %edi
.LBB3_4:                                # %if.then14
	xorl	%eax, %eax
	movq	%r15, %rsi
	jmp	.LBB3_5
.LBB3_28:                               # %if.then143
	movl	$.L.str6, %edi
	jmp	.LBB3_29
.LBB3_36:                               # %if.then149
	movl	$.L.str19, %edi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	printf
	movq	%rbx, %rdi
.LBB3_8:                                # %if.then19
	callq	fclose
	movl	$1, %edi
	callq	exit
.LBB3_33:                               # %if.then172
	movl	$.L.str12, %edi
.LBB3_29:                               # %if.then143
	xorl	%eax, %eax
	movq	%r14, %rsi
.LBB3_5:                                # %if.then14
	callq	printf
	movl	$1, %edi
	callq	exit
.Ltmp36:
	.size	main, .Ltmp36-main
	.cfi_endproc

	.type	numError,@object        # @numError
	.bss
	.globl	numError
	.align	4
numError:
	.long	0                       # 0x0
	.size	numError, 4

	.type	numOptions,@object      # @numOptions
	.comm	numOptions,4,4
	.type	nThreads,@object        # @nThreads
	.comm	nThreads,4,4
	.type	sptprice,@object        # @sptprice
	.comm	sptprice,8,8
	.type	strike,@object          # @strike
	.comm	strike,8,8
	.type	rate,@object            # @rate
	.comm	rate,8,8
	.type	volatility,@object      # @volatility
	.comm	volatility,8,8
	.type	otime,@object           # @otime
	.comm	otime,8,8
	.type	otype,@object           # @otype
	.comm	otype,8,8
	.type	prices,@object          # @prices
	.comm	prices,8,8
	.type	.L.str1,@object         # @.str1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str1:
	.asciz	"Usage:\n\t%s <nthreads> <inputFile> <outputFile>\n"
	.size	.L.str1, 48

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"# threads: %d\n"
	.size	.L.str2, 15

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"inputFile: %s\n"
	.size	.L.str3, 15

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	"outputFile: %s\n"
	.size	.L.str4, 16

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	"r"
	.size	.L.str5, 2

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	"ERROR: Unable to open file `%s'.\n"
	.size	.L.str6, 34

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	"%i"
	.size	.L.str7, 3

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	"ERROR: Unable to read from file `%s'.\n"
	.size	.L.str8, 39

	.type	data,@object            # @data
	.comm	data,8,8
	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	"%f %f %f %f %f %f %c %f %f"
	.size	.L.str11, 27

	.type	.L.str12,@object        # @.str12
.L.str12:
	.asciz	"ERROR: Unable to close file `%s'.\n"
	.size	.L.str12, 35

	.type	.L.str13,@object        # @.str13
.L.str13:
	.asciz	"Num of Options: %d\n"
	.size	.L.str13, 20

	.type	.L.str14,@object        # @.str14
.L.str14:
	.asciz	"Num of Runs: %d\n"
	.size	.L.str14, 17

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	"Size of data: %d\n"
	.size	.L.str15, 18

	.type	.L.str16,@object        # @.str16
.L.str16:
	.asciz	"Total simulationi time is: %lld microseconds.\n"
	.size	.L.str16, 47

	.type	.L.str17,@object        # @.str17
.L.str17:
	.asciz	"w"
	.size	.L.str17, 2

	.type	.L.str18,@object        # @.str18
.L.str18:
	.asciz	"%i\n"
	.size	.L.str18, 4

	.type	.L.str19,@object        # @.str19
.L.str19:
	.asciz	"ERROR: Unable to write to file `%s'.\n"
	.size	.L.str19, 38

	.type	.L.str20,@object        # @.str20
.L.str20:
	.asciz	"%.18f\n"
	.size	.L.str20, 7

	.type	.Lstr,@object           # @str
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr:
	.asciz	"PARSEC Benchmark Suite"
	.size	.Lstr, 23

	.type	.Lstr21,@object         # @str21
	.align	16
.Lstr21:
	.asciz	"Error: <nthreads> must be 1 (serial version)"
	.size	.Lstr21, 45

	.type	.Lstr22,@object         # @str22
	.align	16
.Lstr22:
	.asciz	"WARNING: Not enough work, reducing number of threads to match number of options."
	.size	.Lstr22, 81


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
