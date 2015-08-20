	.file	"llvmprof.out"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI0_1:
	.quad	4567680445748425313     # double 2.400000e-03
	.quad	4567680445748425313     # double 2.400000e-03
.LCPI0_2:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI0_3:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI0_4:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI0_5:
	.quad	4696837146684686336     # double 1.000000e+06
	.quad	4696837146684686336     # double 1.000000e+06
.LCPI0_6:
	.quad	4598175219545276416     # double 2.500000e-01
	.quad	4598175219545276416     # double 2.500000e-01
.LCPI0_7:
	.quad	-4600708494335672320    # double -1.150000e+01
	.quad	-4600708494335672320    # double -1.150000e+01
.LCPI0_8:
	.quad	4623263855806786840     # double 1.256637e+01
	.quad	4623263855806786840     # double 1.256637e+01
.LCPI0_9:
	.quad	4606732058837280358     # double 9.500000e-01
	.quad	4606732058837280358     # double 9.500000e-01
.LCPI0_10:
	.quad	4614388178203810202     # double 3.200000e+00
	.quad	4614388178203810202     # double 3.200000e+00
.LCPI0_11:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI0_12:
	.quad	4636737291354636288     # double 1.000000e+02
	.quad	4636737291354636288     # double 1.000000e+02
.LCPI0_13:
	.quad	4618760256179416344     # double 6.283185e+00
	.quad	4618760256179416344     # double 6.283185e+00
.LCPI0_14:
	.quad	4294967294              # 0xfffffffe
	.quad	4294967294              # 0xfffffffe
.LCPI0_15:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI0_16:
	.quad	4625378267147479480     # double 1.664464e+01
	.quad	4625378267147479480     # double 1.664464e+01
.LCPI0_17:
	.quad	4624674464442746497     # double 1.507211e+01
	.quad	4624674464442746497     # double 1.507211e+01
.LCPI0_18:
	.quad	4626139330413105075     # double 1.934848e+01
	.quad	4626139330413105075     # double 1.934848e+01
.LCPI0_19:
	.quad	12                      # 0xc
	.quad	12                      # 0xc
.LCPI0_20:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI0_21:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI0_22:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI0_23:
	.quad	4594902181429758083     # double 1.591549e-01
	.quad	4594902181429758083     # double 1.591549e-01
.LCPI0_24:
	.zero	16
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
	subq	$2744, %rsp             # imm = 0xAB8
.Ltmp13:
	.cfi_def_cfa_offset 2800
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
	movq	%rsi, %rbx
	vpbroadcastq	(%rbx), %xmm0
	vmovdqu	%xmm0, progname(%rip)
	movl	$options, %edx
	callq	arch_parsecommandline
	movq	stdin(%rip), %rdi
	vmovq	%rdi, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, packfile(%rip)
	movl	$options, %esi
	callq	readpackfile
	callq	mem_init
	movq	nodekindf(%rip), %rdi
	movl	ARCHnodes(%rip), %esi
	callq	arch_readnodevector
	vmovd	options(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI0_0(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_2
# BB#1:                                 # %if.then
	movq	stderr(%rip), %rdi
	movq	(%rbx), %rdx
	movl	$.L.str, %esi
	xorl	%eax, %eax
	callq	fprintf
.LBB0_2:                                # %if.end
	movabsq	$4567680445748425313, %rax # imm = 0x3F63A92A30553261
	movq	%rax, Exc(%rip)
	vmovddup	ARCHduration(%rip), %xmm0
	vmovapd	%xmm0, 800(%rsp)        # 16-byte Spill
	vmovupd	%xmm0, Exc+8(%rip)
	movabsq	$4603579539098121011, %rax # imm = 0x3FE3333333333333
	movq	%rax, Exc+16(%rip)
	movabsq	$4629137466983448576, %rax # imm = 0x403E000000000000
	movq	%rax, Damp(%rip)
	movabsq	$4572798933001847779, %rax # imm = 0x3F75D866DEDC43E3
	movq	%rax, Damp+8(%rip)
	movabsq	$4589468260505885437, %rax # imm = 0x3FB111111F621AFD
	movq	%rax, Damp+16(%rip)
	movabsq	$4602678819172646912, %rax # imm = 0x3FE0000000000000
	movq	%rax, Damp+24(%rip)
	movabsq	$4611403712400148655, %rax # imm = 0x3FFEFF3E818748AF
	movq	%rax, Src+8(%rip)
	movabsq	$4605092252013926446, %rax # imm = 0x3FE893011F31982E
	movq	%rax, Src(%rip)
	movabsq	$4608181004090891254, %rax # imm = 0x3FF38C35418A5BF6
	movq	%rax, Src+16(%rip)
	movabsq	$4629036357794114388, %rax # imm = 0x403DA40AAEAFAB54
	movq	%rax, Src+24(%rip)
	movabsq	$4629737593166631413, %rax # imm = 0x404021CFC3F811F5
	movq	%rax, Src+32(%rip)
	movabsq	$4627396384374706397, %rcx # imm = 0x4037D07E9D94D0DD
	movq	%rcx, Src+40(%rip)
	movabsq	$-4600849231824027648, %rdx # imm = 0xC026800000000000
	movq	%rdx, Src+48(%rip)
	movq	%rax, Src+56(%rip)
	movq	%rcx, Src+64(%rip)
	movq	$0, Src+72(%rip)
	movl	$-1, Src+80(%rip)
	movl	$-1, Src+84(%rip)
	movabsq	$4618441417868443648, %rax # imm = 0x4018000000000000
	movq	%rax, 856(%rsp)
	movabsq	$4614388178203810202, %rax # imm = 0x400999999999999A
	movq	%rax, 864(%rsp)
	movabsq	$4611686018427387904, %rax # imm = 0x4000000000000000
	movq	%rax, 872(%rsp)
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	callq	fputc
	movq	stderr(%rip), %rcx
	movl	$.L.str2, %edi
	movl	$13, %esi
	movl	$1, %edx
	callq	fwrite
	movq	stderr(%rip), %rcx
	movl	$.L.str3, %edi
	movl	$18, %esi
	movl	$1, %edx
	callq	fwrite
	movq	stderr(%rip), %rdi
	vmovsd	Src+8(%rip), %xmm0
	movl	$.L.str4, %esi
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	vmovsd	Src(%rip), %xmm0
	movl	$.L.str5, %esi
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	vmovsd	Src+16(%rip), %xmm0
	movl	$.L.str6, %esi
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	vmovsd	Src+24(%rip), %xmm0
	movl	$.L.str7, %esi
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	vmovsd	Src+32(%rip), %xmm0
	vmovsd	Src+40(%rip), %xmm1
	vmovsd	Src+48(%rip), %xmm2
	movl	$.L.str8, %esi
	movb	$3, %al
	callq	fprintf
	movq	stderr(%rip), %rcx
	movl	$.L.str9, %edi
	movl	$27, %esi
	movl	$1, %edx
	callq	fwrite
	movq	stderr(%rip), %rdi
	vmovsd	Exc(%rip), %xmm0
	movl	$.L.str10, %esi
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	vmovsd	Exc+8(%rip), %xmm0
	movl	$.L.str11, %esi
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	vmovsd	Exc+16(%rip), %xmm0
	movl	$.L.str12, %esi
	movb	$1, %al
	callq	fprintf
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	callq	fputc
	movq	stderr(%rip), %rdi
	callq	fflush
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpcmpgtq	.LCPI0_24, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_12
# BB#3:                                 # %for.body.lr.ph
	movq	nodekindf(%rip), %rax
	movq	nodekind(%rip), %rcx
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LCPI0_0(%rip), %xmm13
	vmovdqa	.LCPI0_3(%rip), %xmm4
	vmovapd	.LCPI0_4(%rip), %xmm15
	.align	16, 0x90
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rdx
	vmovddup	(%rax,%rdx,8), %xmm0
	vcvttsd2si	%xmm0, %rsi
	vmovq	%rsi, %xmm2
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rsi
	vmovq	%rsi, %xmm0
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpand	%xmm13, %xmm0, %xmm2
	vpcmpeqq	%xmm4, %xmm2, %xmm2
	vpsllq	$63, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm15, %xmm0, %xmm0
	vpshufd	$8, %xmm0, %xmm0        # xmm0 = xmm0[0,2,0,0]
	vmovq	%xmm0, (%rcx,%rdx,4)
	vpaddq	%xmm15, %xmm3, %xmm3
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vpextrq	$1, %xmm2, %rdx
	movslq	%edx, %rsi
	vmovq	%rsi, %xmm0
	vmovq	%xmm2, %rsi
	movslq	%esi, %rdi
	vmovq	%rdi, %xmm5
	vpunpcklqdq	%xmm0, %xmm5, %xmm0 # xmm0 = xmm5[0],xmm0[0]
	vpextrq	$1, %xmm3, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm5
	vmovq	%xmm3, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm6
	vpunpcklqdq	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vpcmpgtq	%xmm5, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_4
# BB#5:                                 # %for.cond39.preheader
	movslq	%edx, %rax
	vmovq	%rax, %xmm0
	movslq	%esi, %rax
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpgtq	%xmm3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_12
# BB#6:                                 # %for.body42.lr.ph
	movq	ARCHcoord(%rip), %rax
	vmovddup	Src+32(%rip), %xmm0
	vmovapd	%xmm0, 832(%rsp)        # 16-byte Spill
	vmovddup	Src+40(%rip), %xmm0
	vmovapd	%xmm0, 816(%rsp)        # 16-byte Spill
	vmovddup	Src+48(%rip), %xmm10
	vmovddup	Src+56(%rip), %xmm11
	vmovddup	Src+64(%rip), %xmm12
	vmovapd	.LCPI0_5(%rip), %xmm9
	vmovddup	Src+72(%rip), %xmm14
	vmovapd	%xmm9, %xmm0
	.align	16, 0x90
.LBB0_7:                                # %for.body42
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmovddup	(%rcx), %xmm6
	vmovddup	8(%rcx), %xmm5
	vmovddup	16(%rcx), %xmm1
	vsubpd	832(%rsp), %xmm6, %xmm7 # 16-byte Folded Reload
	vmulpd	%xmm7, %xmm7, %xmm7
	vsubpd	816(%rsp), %xmm5, %xmm8 # 16-byte Folded Reload
	vmulpd	%xmm8, %xmm8, %xmm4
	vaddpd	%xmm4, %xmm7, %xmm4
	vsubpd	%xmm10, %xmm1, %xmm7
	vmulpd	%xmm7, %xmm7, %xmm7
	vaddpd	%xmm7, %xmm4, %xmm7
	vsubpd	%xmm11, %xmm6, %xmm4
	vmulpd	%xmm4, %xmm4, %xmm4
	vsubpd	%xmm12, %xmm5, %xmm5
	vmulpd	%xmm5, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vsubpd	%xmm14, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm4, %xmm6
	vcmpltpd	%xmm0, %xmm7, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_9
# BB#8:                                 # %if.then60
                                        #   in Loop: Header=BB0_7 Depth=1
	vpshufd	$8, %xmm3, %xmm0        # xmm0 = xmm3[0,2,0,0]
	vmovq	%xmm0, Src+80(%rip)
	vmovapd	%xmm7, %xmm0
.LBB0_9:                                # %if.end61
                                        #   in Loop: Header=BB0_7 Depth=1
	vcmpltpd	%xmm9, %xmm6, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_11
# BB#10:                                # %if.then64
                                        #   in Loop: Header=BB0_7 Depth=1
	vpshufd	$8, %xmm3, %xmm1        # xmm1 = xmm3[0,2,0,0]
	vmovq	%xmm1, Src+84(%rip)
	vmovapd	%xmm6, %xmm9
.LBB0_11:                               # %for.inc66
                                        #   in Loop: Header=BB0_7 Depth=1
	vpaddq	%xmm15, %xmm3, %xmm3
	vpand	%xmm13, %xmm3, %xmm1
	vpand	%xmm13, %xmm2, %xmm4
	vpcmpeqq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_7
.LBB0_12:                               # %for.end68
	leaq	2640(%rsp), %rax
	leaq	2624(%rsp), %r14
	leaq	2608(%rsp), %rcx
	leaq	1360(%rsp), %r15
	leaq	1264(%rsp), %r13
	vmovq	%rax, %xmm0
	vmovq	%r14, %xmm1
	vmovq	%rcx, %xmm2
	vmovq	%r15, %xmm3
	vmovq	%r13, %xmm4
	vmovlhps	%xmm0, %xmm0, %xmm8 # xmm8 = xmm0[0,0]
	vmovlhps	%xmm1, %xmm1, %xmm9 # xmm9 = xmm1[0,0]
	vmovlhps	%xmm2, %xmm2, %xmm6 # xmm6 = xmm2[0,0]
	vmovlhps	%xmm3, %xmm3, %xmm0 # xmm0 = xmm3[0,0]
	vmovaps	%xmm0, 640(%rsp)        # 16-byte Spill
	vmovlhps	%xmm4, %xmm4, %xmm0 # xmm0 = xmm4[0,0]
	vmovaps	%xmm0, 624(%rsp)        # 16-byte Spill
	vmovapd	800(%rsp), %xmm0        # 16-byte Reload
	vdivpd	.LCPI0_1(%rip), %xmm0, %xmm0
	vaddpd	.LCPI0_2(%rip), %xmm0, %xmm0
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vcvttsd2si	%xmm0, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	%xmm0, 544(%rsp)        # 16-byte Spill
	vpextrd	$2, %xmm0, %ecx
	vpbroadcastq	Src+80(%rip), %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm0[0]
	vpand	.LCPI0_0(%rip), %xmm1, %xmm0
	vxorpd	%xmm7, %xmm7, %xmm7
	vpcmpeqq	%xmm7, %xmm0, %xmm3
	vmovd	ARCHmine(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm4
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm5
	vpunpcklqdq	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vpcmpgtq	%xmm4, %xmm2, %xmm2
	vpor	%xmm2, %xmm3, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB0_14
# BB#13:
	vmovaps	%xmm8, 576(%rsp)        # 16-byte Spill
	vmovaps	%xmm9, 592(%rsp)        # 16-byte Spill
	vmovaps	%xmm6, 608(%rsp)        # 16-byte Spill
	movl	%ecx, 124(%rsp)         # 4-byte Spill
	vpsrlq	$32, %xmm1, %xmm1
.LBB0_15:                               # %if.end87
	vpand	.LCPI0_0(%rip), %xmm1, %xmm2
	vpcmpeqq	%xmm7, %xmm2, %xmm2
	vpextrq	$1, %xmm1, %rax
	movslq	%eax, %rcx
	vmovq	%rcx, %xmm3
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm3, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm3[0]
	vpextrq	$1, %xmm0, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm3
	vmovq	%xmm0, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm0
	vpunpcklqdq	%xmm3, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm3[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vpor	%xmm0, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_16
.LBB0_17:                               # %if.end107
	vmovd	Src+80(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI0_0(%rip), %xmm0, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vmovd	ARCHelems(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpcmpeqq	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB0_23
# BB#18:                                # %for.cond111.preheader
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpcmpgtq	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_70
# BB#19:                                # %for.cond115.preheader.lr.ph
	leaq	2632(%rsp), %rbx
	vmovdqa	.LCPI0_0(%rip), %xmm6
	vpxor	%xmm4, %xmm4, %xmm4
	jmp	.LBB0_20
	.align	16, 0x90
.LBB0_43:                               # %for.inc180.for.cond115.preheader_crit_edge
                                        #   in Loop: Header=BB0_20 Depth=1
	vmovd	Src+80(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	.LCPI0_0(%rip), %xmm6
.LBB0_20:                               # %for.cond115.preheader
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm4, 800(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm4, %rbp
	movq	ARCHvertex(%rip), %rax
	movq	(%rax,%rbp,8), %rax
	vmovd	(%rax), %xmm1
	vpbroadcastq	%xmm1, %xmm12
	vpand	%xmm6, %xmm12, %xmm4
	vmovd	4(%rax), %xmm1
	vpbroadcastq	%xmm1, %xmm7
	vpand	%xmm6, %xmm7, %xmm5
	vmovd	8(%rax), %xmm1
	vpbroadcastq	%xmm1, %xmm2
	vpshufd	$8, %xmm2, %xmm1        # xmm1 = xmm2[0,2,0,0]
	vmovq	%xmm1, 2632(%rsp)
	vmovd	12(%rax), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpshufd	$8, %xmm1, %xmm3        # xmm3 = xmm1[0,2,0,0]
	vmovq	%xmm3, 2636(%rsp)
	vpand	%xmm6, %xmm0, %xmm3
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vpcmpeqq	%xmm3, %xmm5, %xmm5
	vpor	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB0_37
# BB#21:                                #   in Loop: Header=BB0_20 Depth=1
	vmovdqa	%xmm2, %xmm0
	jmp	.LBB0_40
	.align	16, 0x90
.LBB0_37:                               # %lor.lhs.false134
                                        #   in Loop: Header=BB0_20 Depth=1
	vpbroadcastq	(%rbx), %xmm2
	vpand	%xmm6, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB0_39
# BB#38:                                #   in Loop: Header=BB0_20 Depth=1
	vpsrlq	$32, %xmm2, %xmm1
	jmp	.LBB0_40
	.align	16, 0x90
.LBB0_39:                               # %lor.lhs.false138
                                        #   in Loop: Header=BB0_20 Depth=1
	vpand	%xmm6, %xmm1, %xmm1
	vpcmpeqq	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	vmovdqa	%xmm0, %xmm1
	vmovdqa	%xmm2, %xmm0
	je	.LBB0_42
	.align	16, 0x90
.LBB0_40:                               # %for.cond143.preheader
                                        #   in Loop: Header=BB0_20 Depth=1
	movq	ARCHcoord(%rip), %rax
	vpextrq	$1, %xmm12, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm2
	vmovq	%xmm12, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpextrq	$1, %xmm2, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmovddup	(%rcx), %xmm10
	vmovapd	%xmm10, 880(%rsp)
	vmovddup	8(%rcx), %xmm9
	vmovupd	%xmm9, 888(%rsp)
	vmovddup	16(%rcx), %xmm8
	vmovapd	%xmm8, 896(%rsp)
	vpextrq	$1, %xmm7, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm5
	vmovq	%xmm7, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm6
	vpunpcklqdq	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vpextrq	$1, %xmm5, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmovddup	(%rcx), %xmm5
	vmovupd	%xmm5, 904(%rsp)
	vmovddup	8(%rcx), %xmm6
	vmovapd	%xmm6, 912(%rsp)
	vmovdqa	%xmm7, 768(%rsp)        # 16-byte Spill
	vmovddup	16(%rcx), %xmm11
	vmovupd	%xmm11, 920(%rsp)
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm4
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm0
	vpunpcklqdq	%xmm4, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm4[0]
	vpextrq	$1, %xmm0, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmovddup	(%rcx), %xmm0
	vmovapd	%xmm0, 928(%rsp)
	vmovddup	8(%rcx), %xmm4
	vmovupd	%xmm4, 936(%rsp)
	vmovddup	16(%rcx), %xmm3
	vmovapd	%xmm3, 944(%rsp)
	vpextrq	$1, %xmm1, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm2
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm1, %rcx
	movq	(%rax,%rcx,8), %rax
	vmovddup	(%rax), %xmm1
	vmovupd	%xmm1, 952(%rsp)
	vmovddup	8(%rax), %xmm2
	vmovapd	%xmm2, 960(%rsp)
	vmovdqa	%xmm12, 784(%rsp)       # 16-byte Spill
	vmovddup	16(%rax), %xmm7
	vmovupd	%xmm7, 968(%rsp)
	vaddpd	%xmm5, %xmm10, %xmm5
	vaddpd	%xmm0, %xmm5, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	.LCPI0_6(%rip), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 752(%rsp)        # 16-byte Spill
	vaddpd	%xmm6, %xmm9, %xmm0
	vaddpd	%xmm4, %xmm0, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 736(%rsp)        # 16-byte Spill
	vaddpd	%xmm11, %xmm8, %xmm0
	vaddpd	%xmm3, %xmm0, %xmm0
	vaddpd	%xmm7, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 720(%rsp)        # 16-byte Spill
	movq	source_elms(%rip), %rax
	movl	$2, (%rax,%rbp,4)
	vmovddup	Src+8(%rip), %xmm0
	vmovapd	%xmm0, 832(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 816(%rsp)        # 16-byte Spill
	vmovapd	832(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 704(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	816(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 688(%rsp)        # 16-byte Spill
	vmovddup	Src(%rip), %xmm0
	vmovapd	%xmm0, 816(%rsp)        # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, 656(%rsp)        # 16-byte Spill
	vmovapd	816(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 672(%rsp)        # 16-byte Spill
	callq	sin
	vmovapd	656(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vmovapd	%xmm1, 656(%rsp)        # 16-byte Spill
	vmovapd	688(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 688(%rsp)        # 16-byte Spill
	vmovaps	832(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 832(%rsp)        # 16-byte Spill
	vmovapd	704(%rsp), %xmm0        # 16-byte Reload
	callq	sin
	vmovapd	832(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	656(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovapd	%xmm0, 832(%rsp)        # 16-byte Spill
	vmovaps	816(%rsp), %xmm0        # 16-byte Reload
	callq	cos
	vmovaps	%xmm0, 816(%rsp)        # 16-byte Spill
	vmovapd	672(%rsp), %xmm0        # 16-byte Reload
	callq	cos
	vmovdqa	768(%rsp), %xmm7        # 16-byte Reload
	vmovdqa	784(%rsp), %xmm12       # 16-byte Reload
	vmovapd	816(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovddup	Src+32(%rip), %xmm1
	vmovapd	688(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm1
	vmovddup	Src+40(%rip), %xmm2
	vmovapd	832(%rsp), %xmm4        # 16-byte Reload
	vmulpd	%xmm4, %xmm2, %xmm2
	vsubpd	%xmm2, %xmm1, %xmm1
	vmovddup	Src+48(%rip), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovapd	752(%rsp), %xmm2        # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm2
	vmovapd	736(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm3
	vsubpd	%xmm3, %xmm2, %xmm2
	vmovapd	720(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vsubpd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcmpnlepd	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_42
# BB#41:                                # %if.then175
                                        #   in Loop: Header=BB0_20 Depth=1
	movq	source_elms(%rip), %rax
	movl	$3, (%rax,%rbp,4)
.LBB0_42:                               # %for.inc180
                                        #   in Loop: Header=BB0_20 Depth=1
	vmovdqa	800(%rsp), %xmm4        # 16-byte Reload
	vpaddq	.LCPI0_4(%rip), %xmm4, %xmm4
	vmovd	ARCHelems(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_43
# BB#22:                                # %for.cond184.preheader.loopexit
	vpshufd	$8, %xmm12, %xmm0       # xmm0 = xmm12[0,2,0,0]
	vmovq	%xmm0, 2624(%rsp)
	vpshufd	$8, %xmm7, %xmm0        # xmm0 = xmm7[0,2,0,0]
	vmovq	%xmm0, 2628(%rsp)
	vpxor	%xmm3, %xmm3, %xmm3
.LBB0_23:                               # %for.cond184.preheader
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_70
# BB#24:                                # %for.cond188.preheader.lr.ph
	leaq	1376(%rsp), %rax
	vmovq	%rax, %xmm0
	vmovaps	%xmm0, 832(%rsp)        # 16-byte Spill
	leaq	1184(%rsp), %rax
	vmovq	%rax, %xmm0
	vmovaps	%xmm0, 816(%rsp)        # 16-byte Spill
	leaq	1392(%rsp), %rax
	vmovq	%rax, %xmm9
	leaq	1208(%rsp), %rax
	vmovq	%rax, %xmm12
	leaq	1408(%rsp), %rax
	vmovq	%rax, %xmm13
	leaq	1424(%rsp), %rax
	vmovq	%rax, %xmm14
	leaq	1232(%rsp), %rax
	vmovq	%rax, %xmm11
	leaq	1440(%rsp), %rax
	vmovq	%rax, %xmm10
	leaq	1280(%rsp), %rax
	vmovq	%rax, %xmm1
	leaq	1088(%rsp), %rax
	vmovq	%rax, %xmm2
	leaq	1296(%rsp), %rax
	vmovq	%rax, %xmm3
	leaq	1112(%rsp), %rax
	vmovq	%rax, %xmm4
	leaq	1312(%rsp), %rax
	vmovq	%rax, %xmm5
	leaq	1328(%rsp), %rax
	vmovdqa	576(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rcx
	movq	%rcx, 512(%rsp)         # 8-byte Spill
	vmovq	%rax, %xmm6
	leaq	1136(%rsp), %rax
	leaq	2632(%rsp), %rcx
	vmovdqa	592(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rbp
	movq	%rbp, 408(%rsp)         # 8-byte Spill
	vmovq	%rcx, %xmm7
	vmovlhps	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vpextrq	$1, %xmm7, %rcx
	movq	%rcx, 752(%rsp)         # 8-byte Spill
	vmovq	%rax, %xmm7
	leaq	1344(%rsp), %rax
	vmovdqa	608(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %rcx
	movq	%rcx, 520(%rsp)         # 8-byte Spill
	vmovq	%rax, %xmm8
	vpbroadcastq	ARCHvertex(%rip), %xmm15
	vmovaps	832(%rsp), %xmm0        # 16-byte Reload
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 736(%rsp)        # 16-byte Spill
	vmovaps	816(%rsp), %xmm0        # 16-byte Reload
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 496(%rsp)        # 16-byte Spill
	vmovlhps	%xmm9, %xmm9, %xmm0 # xmm0 = xmm9[0,0]
	vmovaps	%xmm0, 720(%rsp)        # 16-byte Spill
	vmovlhps	%xmm12, %xmm12, %xmm0 # xmm0 = xmm12[0,0]
	vmovaps	%xmm0, 480(%rsp)        # 16-byte Spill
	vmovlhps	%xmm13, %xmm13, %xmm0 # xmm0 = xmm13[0,0]
	vmovaps	%xmm0, 704(%rsp)        # 16-byte Spill
	vmovlhps	%xmm14, %xmm14, %xmm0 # xmm0 = xmm14[0,0]
	vmovaps	%xmm0, 688(%rsp)        # 16-byte Spill
	vxorps	%ymm9, %ymm9, %ymm9
	vmovlhps	%xmm11, %xmm11, %xmm0 # xmm0 = xmm11[0,0]
	vmovaps	%xmm0, 464(%rsp)        # 16-byte Spill
	vmovlhps	%xmm10, %xmm10, %xmm0 # xmm0 = xmm10[0,0]
	vmovaps	%xmm0, 672(%rsp)        # 16-byte Spill
	vmovlhps	%xmm1, %xmm1, %xmm0 # xmm0 = xmm1[0,0]
	vmovaps	%xmm0, 656(%rsp)        # 16-byte Spill
	vmovlhps	%xmm2, %xmm2, %xmm0 # xmm0 = xmm2[0,0]
	vmovaps	%xmm0, 448(%rsp)        # 16-byte Spill
	vmovlhps	%xmm3, %xmm3, %xmm0 # xmm0 = xmm3[0,0]
	vmovaps	%xmm0, 608(%rsp)        # 16-byte Spill
	vxorps	%xmm3, %xmm3, %xmm3
	vmovlhps	%xmm4, %xmm4, %xmm0 # xmm0 = xmm4[0,0]
	vmovaps	%xmm0, 432(%rsp)        # 16-byte Spill
	vmovlhps	%xmm5, %xmm5, %xmm0 # xmm0 = xmm5[0,0]
	vmovaps	%xmm0, 592(%rsp)        # 16-byte Spill
	vmovlhps	%xmm6, %xmm6, %xmm0 # xmm0 = xmm6[0,0]
	vmovaps	%xmm0, 576(%rsp)        # 16-byte Spill
	vmovlhps	%xmm7, %xmm7, %xmm0 # xmm0 = xmm7[0,0]
	vmovaps	%xmm0, 416(%rsp)        # 16-byte Spill
	vmovlhps	%xmm8, %xmm8, %xmm0 # xmm0 = xmm8[0,0]
	vmovaps	%xmm0, 560(%rsp)        # 16-byte Spill
.LBB0_25:                               # %for.cond188.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_52 Depth 2
                                        #     Child Loop BB0_55 Depth 2
                                        #     Child Loop BB0_58 Depth 2
                                        #     Child Loop BB0_60 Depth 2
                                        #       Child Loop BB0_61 Depth 3
                                        #         Child Loop BB0_63 Depth 4
	vmovaps	%xmm3, 528(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm3, %r12
	vpextrq	$1, %xmm15, %rbx
	vmovups	%ymm9, 64(%r15)
	vmovups	%ymm9, 32(%r15)
	vmovups	%ymm9, (%r15)
	vmovups	%ymm9, 64(%r13)
	vmovups	%ymm9, 32(%r13)
	vmovups	%ymm9, (%r13)
	leaq	976(%rsp), %rax
	vmovups	%ymm9, 64(%rax)
	vmovups	%ymm9, 32(%rax)
	vmovups	%ymm9, (%rax)
	xorl	%esi, %esi
	movl	$1152, %edx             # imm = 0x480
	leaq	1456(%rsp), %rdi
	vzeroupper
	callq	memset
	movq	(%rbx,%r12,8), %rax
	vmovups	(%rax), %xmm0
	vmovups	%xmm0, (%r14)
	movq	nodekind(%rip), %rax
	vpbroadcastq	(%rbp), %xmm2
	vpsllq	$32, %xmm2, %xmm0
	vpextrq	$1, %xmm0, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm0, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %r13
	vmovd	(%rax,%r13,4), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	.LCPI0_0(%rip), %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vmovdqa	.LCPI0_4(%rip), %xmm3
	vmovdqa	%xmm3, %xmm4
	vpcmpeqq	%xmm4, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm1, %xmm3
	jne	.LBB0_27
# BB#26:                                # %if.then235
                                        #   in Loop: Header=BB0_25 Depth=1
	movl	$0, 2608(%rsp)
	vmovdqa	%xmm4, %xmm0
.LBB0_27:                               # %for.inc240
                                        #   in Loop: Header=BB0_25 Depth=1
	vpextrq	$1, %xmm2, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm2, %rcx
	vmovdqa	%xmm2, 832(%rsp)        # 16-byte Spill
	sarq	$32, %rcx
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm1, %r14
	vmovd	(%rax,%r14,4), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpand	%xmm3, %xmm1, %xmm1
	vpcmpeqq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_29
# BB#28:                                # %if.then235.1
                                        #   in Loop: Header=BB0_25 Depth=1
	vpand	%xmm3, %xmm0, %xmm1
	vpaddq	%xmm4, %xmm0, %xmm0
	vpextrq	$1, %xmm1, %rcx
	movl	$1, 2608(%rsp,%rcx,4)
.LBB0_29:                               # %for.inc240.1
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	752(%rsp), %rcx         # 8-byte Reload
	vpbroadcastq	(%rcx), %xmm6
	vpsllq	$32, %xmm6, %xmm1
	vpextrq	$1, %xmm1, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm2
	vmovq	%xmm1, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm1, %rbx
	vmovd	(%rax,%rbx,4), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpand	%xmm3, %xmm1, %xmm1
	vpcmpeqq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_31
# BB#30:                                # %if.then235.2
                                        #   in Loop: Header=BB0_25 Depth=1
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm0, %rcx
	vpaddq	%xmm4, %xmm0, %xmm0
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm1, %rcx
	movl	$2, 2608(%rsp,%rcx,4)
.LBB0_31:                               # %for.inc240.2
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovdqa	.LCPI0_3(%rip), %xmm5
	vpextrq	$1, %xmm6, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm6, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm1, %rbp
	vmovd	(%rax,%rbp,4), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpand	%xmm3, %xmm1, %xmm1
	vpcmpeqq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB0_33
# BB#32:                                # %if.then235.3
                                        #   in Loop: Header=BB0_25 Depth=1
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	vpaddq	%xmm4, %xmm0, %xmm0
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm1, %rax
	movl	$3, 2608(%rsp,%rax,4)
.LBB0_33:                               # %for.inc240.3
                                        #   in Loop: Header=BB0_25 Depth=1
	vpand	%xmm3, %xmm0, %xmm0
	vpcmpeqq	%xmm5, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_35
# BB#34:                                # %for.cond246.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	ARCHcoord(%rip), %rax
	movq	520(%rsp), %rcx         # 8-byte Reload
	vpbroadcastq	(%rcx), %xmm0
	vpsllq	$32, %xmm0, %xmm1
	vpextrq	$1, %xmm1, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm2
	vmovq	%xmm1, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm1, %rcx
	vmovd	2624(%rsp,%rcx,4), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpextrq	$1, %xmm1, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm2
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm1, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmovddup	(%rcx), %xmm1
	vmovapd	%xmm1, 880(%rsp)
	vmovddup	8(%rcx), %xmm1
	vmovupd	%xmm1, 888(%rsp)
	vmovddup	16(%rcx), %xmm1
	vmovapd	%xmm1, 896(%rsp)
	vpextrq	$1, %xmm0, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm0, %rcx
	sarq	$32, %rcx
	vmovq	%rcx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rcx
	vmovd	2624(%rsp,%rcx,4), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmovddup	(%rcx), %xmm0
	vmovupd	%xmm0, 904(%rsp)
	vmovddup	8(%rcx), %xmm0
	vmovapd	%xmm0, 912(%rsp)
	vmovddup	16(%rcx), %xmm0
	vmovupd	%xmm0, 920(%rsp)
	vmovd	2616(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rcx
	vmovd	2624(%rsp,%rcx,4), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm1
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rcx
	movq	(%rax,%rcx,8), %rax
	vmovddup	(%rax), %xmm0
	vmovapd	%xmm0, 928(%rsp)
	vmovddup	8(%rax), %xmm0
	vmovupd	%xmm0, 936(%rsp)
	vmovddup	16(%rax), %xmm0
	vmovapd	%xmm0, 944(%rsp)
	leaq	880(%rsp), %rdi
	leaq	2608(%rsp), %rsi
	leaq	856(%rsp), %rdx
	leaq	1264(%rsp), %rcx
	vmovdqa	%xmm6, 800(%rsp)        # 16-byte Spill
	callq	abe_matrix
	vmovdqa	800(%rsp), %xmm6        # 16-byte Reload
.LBB0_35:                               # %for.cond276.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovdqa	%xmm6, 800(%rsp)        # 16-byte Spill
	vmovdqa	832(%rsp), %xmm0        # 16-byte Reload
	vpsrlq	$32, %xmm0, %xmm0
	vmovdqa	%xmm0, 816(%rsp)        # 16-byte Spill
	vpsrlq	$32, %xmm6, %xmm0
	vmovdqa	%xmm0, 784(%rsp)        # 16-byte Spill
	movq	ARCHcoord(%rip), %rax
	movq	(%rax,%r13,8), %rcx
	vmovddup	(%rcx), %xmm0
	vmovapd	%xmm0, 880(%rsp)
	vmovddup	8(%rcx), %xmm0
	vmovupd	%xmm0, 888(%rsp)
	vmovddup	16(%rcx), %xmm0
	vmovapd	%xmm0, 896(%rsp)
	movq	(%rax,%r14,8), %rcx
	vmovddup	(%rcx), %xmm0
	vmovupd	%xmm0, 904(%rsp)
	vmovddup	8(%rcx), %xmm0
	vmovapd	%xmm0, 912(%rsp)
	vmovddup	16(%rcx), %xmm0
	vmovupd	%xmm0, 920(%rsp)
	movq	(%rax,%rbx,8), %rcx
	vmovddup	(%rcx), %xmm0
	vmovapd	%xmm0, 928(%rsp)
	vmovddup	8(%rcx), %xmm0
	vmovupd	%xmm0, 936(%rsp)
	vmovddup	16(%rcx), %xmm0
	vmovapd	%xmm0, 944(%rsp)
	movq	(%rax,%rbp,8), %rax
	vmovddup	(%rax), %xmm0
	vmovupd	%xmm0, 952(%rsp)
	vmovddup	8(%rax), %xmm0
	vmovapd	%xmm0, 960(%rsp)
	vmovddup	16(%rax), %xmm0
	vmovupd	%xmm0, 968(%rsp)
	leaq	880(%rsp), %rdi
	leaq	856(%rsp), %rsi
	leaq	1456(%rsp), %rdx
	leaq	1360(%rsp), %rcx
	callq	element_matrices
	vmovddup	896(%rsp), %xmm0
	vmovddup	920(%rsp), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	944(%rsp), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	968(%rsp), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	.LCPI0_6(%rip), %xmm0, %xmm0
	vcmpltpd	.LCPI0_7(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_44
# BB#36:                                # %if.then308
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovddup	Damp(%rip), %xmm0
	vmulpd	.LCPI0_11(%rip), %xmm0, %xmm0
	vdivpd	.LCPI0_12(%rip), %xmm0, %xmm0
	vmovddup	Damp+24(%rip), %xmm1
	vmulpd	.LCPI0_13(%rip), %xmm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	jmp	.LBB0_45
	.align	16, 0x90
.LBB0_44:                               # %if.else
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovddup	Damp+8(%rip), %xmm0
	vmulpd	.LCPI0_8(%rip), %xmm0, %xmm0
	vmulpd	.LCPI0_9(%rip), %xmm0, %xmm0
	vmovddup	Damp+16(%rip), %xmm1
	vaddpd	.LCPI0_10(%rip), %xmm1, %xmm1
	vdivpd	%xmm1, %xmm0, %xmm0
.LBB0_45:                               # %if.end318
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovdqa	.LCPI0_0(%rip), %xmm12
	vmovdqa	.LCPI0_15(%rip), %xmm13
	vmovdqa	624(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rax
	vmovdqa	640(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rcx
	vmovapd	(%rcx), %xmm8
	vpermilpd	$3, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmulpd	%xmm0, %xmm8, %xmm1
	vaddpd	(%rax), %xmm1, %xmm7
	vmovapd	%xmm7, (%rax)
	vmovdqa	656(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rax
	vmovdqa	736(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rcx
	vmovapd	(%rcx), %xmm10
	vmulpd	%xmm0, %xmm10, %xmm1
	vaddpd	(%rax), %xmm1, %xmm9
	vmovapd	%xmm9, (%rax)
	vmovdqa	608(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rax
	vmovdqa	720(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rcx
	vmovapd	(%rcx), %xmm11
	vmulpd	%xmm0, %xmm11, %xmm1
	vaddpd	(%rax), %xmm1, %xmm15
	vmovapd	%xmm15, (%rax)
	vmovdqa	592(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rax
	vmovdqa	704(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rcx
	vmovapd	(%rcx), %xmm3
	vmulpd	%xmm0, %xmm3, %xmm2
	vaddpd	(%rax), %xmm2, %xmm4
	vmovapd	%xmm4, (%rax)
	vmovdqa	576(%rsp), %xmm2        # 16-byte Reload
	vpextrq	$1, %xmm2, %rax
	vmovdqa	688(%rsp), %xmm2        # 16-byte Reload
	vpextrq	$1, %xmm2, %rcx
	vmovapd	(%rcx), %xmm1
	vmulpd	%xmm0, %xmm1, %xmm2
	vaddpd	(%rax), %xmm2, %xmm5
	vmovapd	%xmm5, (%rax)
	vmovdqa	560(%rsp), %xmm2        # 16-byte Reload
	vpextrq	$1, %xmm2, %rax
	vmovdqa	672(%rsp), %xmm2        # 16-byte Reload
	vpextrq	$1, %xmm2, %rcx
	vmovapd	(%rcx), %xmm14
	vmulpd	%xmm0, %xmm14, %xmm0
	vaddpd	(%rax), %xmm0, %xmm6
	vmovapd	%xmm6, (%rax)
	movq	source_elms(%rip), %rax
	vmovd	(%rax,%r12,4), %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vpand	.LCPI0_14(%rip), %xmm2, %xmm0
	vpand	%xmm12, %xmm0, %xmm0
	vpcmpeqq	%xmm13, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_46
# BB#47:                                # %for.cond344.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovapd	%xmm3, 272(%rsp)        # 16-byte Spill
	vmovapd	%xmm1, 288(%rsp)        # 16-byte Spill
	vmovapd	%xmm11, 304(%rsp)       # 16-byte Spill
	vmovapd	%xmm10, 320(%rsp)       # 16-byte Spill
	vmovapd	%xmm8, 336(%rsp)        # 16-byte Spill
	vmovapd	%xmm6, 352(%rsp)        # 16-byte Spill
	vmovapd	%xmm5, 368(%rsp)        # 16-byte Spill
	vmovapd	%xmm4, 384(%rsp)        # 16-byte Spill
	vmovdqa	%xmm2, 768(%rsp)        # 16-byte Spill
	vmovdqa	832(%rsp), %xmm0        # 16-byte Reload
	vpand	%xmm12, %xmm0, %xmm2
	vmovd	Src+80(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	%xmm12, %xmm0, %xmm0
	vpcmpeqq	%xmm0, %xmm2, %xmm2
	vmovapd	%xmm9, %xmm13
	vptest	%xmm2, %xmm2
	je	.LBB0_49
# BB#48:                                # %if.then352
                                        #   in Loop: Header=BB0_25 Depth=1
	movabsq	$4625378267147479480, %rax # imm = 0x4030A507152329B8
	movq	%rax, 976(%rsp)
	movabsq	$4624674464442746497, %rax # imm = 0x402E24EC3EEE0681
	movq	%rax, 984(%rsp)
	movabsq	$4626139330413105075, %rax # imm = 0x40335935EEBC8FB3
	movq	%rax, 992(%rsp)
	vmovapd	.LCPI0_18(%rip), %xmm2
	vmovapd	%xmm2, %xmm3
	vmovaps	.LCPI0_17(%rip), %xmm2
	vmovaps	%xmm2, 224(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI0_16(%rip), %xmm2
	jmp	.LBB0_50
	.align	16, 0x90
.LBB0_46:                               # %if.end318.for.cond531.preheader_crit_edge
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	ARCHvertex(%rip), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm15 # xmm15 = xmm0[0,0]
	vpbroadcastq	(%rax,%r12,8), %xmm1
	vxorpd	%ymm9, %ymm9, %ymm9
	vmovdqa	.LCPI0_4(%rip), %xmm10
	vmovdqa	.LCPI0_3(%rip), %xmm11
	vmovdqa	.LCPI0_21(%rip), %xmm14
	jmp	.LBB0_59
	.align	16, 0x90
.LBB0_49:                               # %if.else367
                                        #   in Loop: Header=BB0_25 Depth=1
	vxorpd	%xmm3, %xmm3, %xmm3
	leaq	976(%rsp), %rax
	vmovapd	%xmm3, (%rax)
	movq	$0, 16(%rax)
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	%xmm2, 224(%rsp)        # 16-byte Spill
	vpxor	%xmm2, %xmm2, %xmm2
.LBB0_50:                               # %for.inc380
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovdqa	%xmm2, 832(%rsp)        # 16-byte Spill
	vmovapd	%xmm3, 256(%rsp)        # 16-byte Spill
	vmovdqa	816(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm12, %xmm1, %xmm4
	vunpckhpd	%xmm3, %xmm3, %xmm1 # xmm1 = xmm3[1,1]
	vmovapd	%xmm1, 176(%rsp)        # 16-byte Spill
	vpcmpeqq	%xmm0, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	vmovdqa	800(%rsp), %xmm3        # 16-byte Reload
	je	.LBB0_51
# BB#107:                               # %if.then352.1
                                        #   in Loop: Header=BB0_25 Depth=1
	movabsq	$4625378267147479480, %rax # imm = 0x4030A507152329B8
	movq	%rax, 1000(%rsp)
	movabsq	$4624674464442746497, %rax # imm = 0x402E24EC3EEE0681
	movq	%rax, 1008(%rsp)
	movabsq	$4626139330413105075, %rax # imm = 0x40335935EEBC8FB3
	movq	%rax, 1016(%rsp)
	vmovapd	.LCPI0_18(%rip), %xmm2
	vmovapd	%xmm2, %xmm6
	vmovdqa	.LCPI0_17(%rip), %xmm4
	vmovdqa	%xmm4, %xmm2
	vmovdqa	.LCPI0_16(%rip), %xmm5
	vmovdqa	%xmm5, %xmm4
	jmp	.LBB0_108
	.align	16, 0x90
.LBB0_51:                               # %if.else367.1
                                        #   in Loop: Header=BB0_25 Depth=1
	vxorpd	%xmm6, %xmm6, %xmm6
	leaq	1000(%rsp), %rax
	vmovupd	%xmm6, (%rax)
	movq	$0, 16(%rax)
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm4, %xmm4, %xmm4
.LBB0_108:                              # %for.inc380.1
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovdqa	%xmm2, 816(%rsp)        # 16-byte Spill
	vmovapd	%xmm6, 240(%rsp)        # 16-byte Spill
	vpand	%xmm12, %xmm3, %xmm2
	vunpckhpd	%xmm6, %xmm6, %xmm1 # xmm1 = xmm6[1,1]
	vmovapd	%xmm1, 128(%rsp)        # 16-byte Spill
	vunpckhpd	%xmm4, %xmm4, %xmm5 # xmm5 = xmm4[1,1]
	vpcmpeqq	%xmm0, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB0_109
# BB#110:                               # %if.then352.2
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovaps	%xmm4, 208(%rsp)        # 16-byte Spill
	movabsq	$4625378267147479480, %rax # imm = 0x4030A507152329B8
	movq	%rax, 1024(%rsp)
	movabsq	$4624674464442746497, %rax # imm = 0x402E24EC3EEE0681
	movq	%rax, 1032(%rsp)
	movabsq	$4626139330413105075, %rax # imm = 0x40335935EEBC8FB3
	movq	%rax, 1040(%rsp)
	vmovdqa	.LCPI0_18(%rip), %xmm8
	vmovdqa	%xmm8, %xmm3
	vmovapd	.LCPI0_17(%rip), %xmm11
	vmovapd	.LCPI0_16(%rip), %xmm10
	vmovapd	%xmm10, %xmm1
	jmp	.LBB0_111
	.align	16, 0x90
.LBB0_109:                              # %if.else367.2
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovaps	%xmm4, 208(%rsp)        # 16-byte Spill
	vpxor	%xmm3, %xmm3, %xmm3
	leaq	1024(%rsp), %rax
	vmovdqa	%xmm3, (%rax)
	movq	$0, 16(%rax)
	vxorpd	%xmm11, %xmm11, %xmm11
	vxorpd	%xmm1, %xmm1, %xmm1
.LBB0_111:                              # %for.inc380.2
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovapd	%xmm15, %xmm8
	vmovapd	%xmm13, 160(%rsp)       # 16-byte Spill
	vmovdqa	784(%rsp), %xmm2        # 16-byte Reload
	vpand	%xmm12, %xmm2, %xmm2
	vunpckhpd	%xmm3, %xmm3, %xmm4 # xmm4 = xmm3[1,1]
	vmovapd	%xmm4, 144(%rsp)        # 16-byte Spill
	vunpckhpd	%xmm1, %xmm1, %xmm6 # xmm6 = xmm1[1,1]
	vpcmpeqq	%xmm0, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	vmovapd	224(%rsp), %xmm9        # 16-byte Reload
	je	.LBB0_112
# BB#113:                               # %if.then352.3
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovapd	%xmm1, 192(%rsp)        # 16-byte Spill
	vmovaps	%xmm3, 784(%rsp)        # 16-byte Spill
	movabsq	$4625378267147479480, %rax # imm = 0x4030A507152329B8
	movq	%rax, 1048(%rsp)
	movabsq	$4624674464442746497, %rax # imm = 0x402E24EC3EEE0681
	movq	%rax, 1056(%rsp)
	movabsq	$4626139330413105075, %rax # imm = 0x40335935EEBC8FB3
	movq	%rax, 1064(%rsp)
	vmovdqa	.LCPI0_18(%rip), %xmm12
	vmovapd	.LCPI0_17(%rip), %xmm13
	vmovapd	%xmm13, %xmm10
	vmovapd	.LCPI0_16(%rip), %xmm15
	vmovapd	%xmm15, 800(%rsp)       # 16-byte Spill
	jmp	.LBB0_114
	.align	16, 0x90
.LBB0_112:                              # %if.else367.3
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovapd	%xmm1, 192(%rsp)        # 16-byte Spill
	vmovaps	%xmm3, 784(%rsp)        # 16-byte Spill
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	1048(%rsp), %rax
	vmovdqu	%xmm0, (%rax)
	vpxor	%xmm12, %xmm12, %xmm12
	movq	$0, 16(%rax)
	vxorpd	%xmm10, %xmm10, %xmm10
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, 800(%rsp)        # 16-byte Spill
.LBB0_114:                              # %for.inc380.3
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovapd	176(%rsp), %xmm0        # 16-byte Reload
	vunpcklpd	%xmm5, %xmm0, %xmm13 # xmm13 = xmm0[0],xmm5[0]
	vmovdqa	336(%rsp), %xmm3        # 16-byte Reload
	vpbroadcastq	%xmm3, %xmm0
	vmovapd	832(%rsp), %xmm2        # 16-byte Reload
	vmulpd	%xmm2, %xmm0, %xmm0
	vmovapd	%xmm0, 176(%rsp)        # 16-byte Spill
	vmovapd	%xmm0, 1168(%rsp)
	vunpckhpd	%xmm3, %xmm3, %xmm0 # xmm0 = xmm3[1,1]
	vpbroadcastq	%xmm0, %xmm0
	vmulpd	%xmm9, %xmm0, %xmm0
	vmovapd	%xmm0, 336(%rsp)        # 16-byte Spill
	vmovupd	%xmm0, 1176(%rsp)
	vmovapd	320(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm13, %xmm0, %xmm3
	vmovdqa	496(%rsp), %xmm5        # 16-byte Reload
	vpextrq	$1, %xmm5, %rax
	vmovapd	%xmm3, (%rax)
	vmovdqa	304(%rsp), %xmm5        # 16-byte Reload
	vpbroadcastq	%xmm5, %xmm3
	vmovapd	816(%rsp), %xmm4        # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovapd	%xmm3, 1200(%rsp)
	vmovapd	128(%rsp), %xmm0        # 16-byte Reload
	vunpcklpd	%xmm6, %xmm0, %xmm15 # xmm15 = xmm0[0],xmm6[0]
	vmovapd	272(%rsp), %xmm1        # 16-byte Reload
	vshufpd	$1, %xmm1, %xmm5, %xmm6 # xmm6 = xmm5[1],xmm1[0]
	vmulpd	%xmm15, %xmm6, %xmm6
	vmovdqa	480(%rsp), %xmm5        # 16-byte Reload
	vpextrq	$1, %xmm5, %rax
	vmovupd	%xmm6, (%rax)
	vunpckhpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmulpd	%xmm11, %xmm1, %xmm1
	vmovupd	%xmm1, 1224(%rsp)
	vmovapd	800(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,1]
	vmovapd	144(%rsp), %xmm0        # 16-byte Reload
	vunpcklpd	%xmm1, %xmm0, %xmm1 # xmm1 = xmm0[0],xmm1[0]
	vmovapd	288(%rsp), %xmm5        # 16-byte Reload
	vmulpd	%xmm1, %xmm5, %xmm6
	vmovdqa	464(%rsp), %xmm5        # 16-byte Reload
	vpextrq	$1, %xmm5, %rax
	vmovapd	%xmm6, (%rax)
	vpbroadcastq	%xmm14, %xmm6
	vmulpd	%xmm10, %xmm6, %xmm6
	vmovapd	%xmm6, 1248(%rsp)
	vunpckhpd	%xmm14, %xmm14, %xmm6 # xmm6 = xmm14[1,1]
	vpbroadcastq	%xmm6, %xmm6
	vmulpd	%xmm12, %xmm6, %xmm6
	vmovupd	%xmm6, 1256(%rsp)
	vmovapd	160(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm13, %xmm0, %xmm3
	vpbroadcastq	%xmm7, %xmm6
	vmulpd	%xmm2, %xmm6, %xmm0
	vmovapd	%xmm0, 304(%rsp)        # 16-byte Spill
	vmovapd	%xmm0, 1072(%rsp)
	vunpckhpd	%xmm7, %xmm7, %xmm6 # xmm6 = xmm7[1,1]
	vpbroadcastq	%xmm6, %xmm6
	vmulpd	%xmm9, %xmm6, %xmm0
	vmovapd	%xmm0, 320(%rsp)        # 16-byte Spill
	vmovupd	%xmm0, 1080(%rsp)
	vmovdqa	448(%rsp), %xmm5        # 16-byte Reload
	vpextrq	$1, %xmm5, %rax
	vmovapd	%xmm3, (%rax)
	vpbroadcastq	%xmm8, %xmm2
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovapd	%xmm2, 1104(%rsp)
	vmovapd	384(%rsp), %xmm5        # 16-byte Reload
	vshufpd	$1, %xmm5, %xmm8, %xmm2 # xmm2 = xmm8[1],xmm5[0]
	vmulpd	%xmm15, %xmm2, %xmm2
	vmovdqa	432(%rsp), %xmm3        # 16-byte Reload
	vpextrq	$1, %xmm3, %rax
	vmovupd	%xmm2, (%rax)
	vunpckhpd	%xmm5, %xmm5, %xmm2 # xmm2 = xmm5[1,1]
	vpbroadcastq	%xmm2, %xmm2
	vmulpd	%xmm11, %xmm2, %xmm2
	vmovapd	%xmm11, %xmm15
	vmovupd	%xmm2, 1128(%rsp)
	vmovapd	368(%rsp), %xmm2        # 16-byte Reload
	vmulpd	%xmm1, %xmm2, %xmm1
	vmovdqa	416(%rsp), %xmm2        # 16-byte Reload
	vpextrq	$1, %xmm2, %rax
	vmovapd	%xmm1, (%rax)
	vmovdqa	352(%rsp), %xmm2        # 16-byte Reload
	vpbroadcastq	%xmm2, %xmm1
	vmulpd	%xmm10, %xmm1, %xmm1
	vmovapd	%xmm1, 1152(%rsp)
	vunpckhpd	%xmm2, %xmm2, %xmm1 # xmm1 = xmm2[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmulpd	%xmm12, %xmm1, %xmm1
	vmovapd	%xmm12, %xmm6
	vmovupd	%xmm1, 1160(%rsp)
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovdqa	.LCPI0_4(%rip), %xmm7
	vmovdqa	.LCPI0_19(%rip), %xmm5
	vmovapd	%xmm9, %xmm8
	vmovapd	256(%rsp), %xmm4        # 16-byte Reload
	vmovapd	240(%rsp), %xmm11       # 16-byte Reload
	vmovapd	208(%rsp), %xmm9        # 16-byte Reload
	vmovapd	784(%rsp), %xmm12       # 16-byte Reload
	vmovapd	192(%rsp), %xmm13       # 16-byte Reload
	.align	16, 0x90
.LBB0_52:                               # %for.body.i
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm1, %rax
	leaq	(%rax,%rax,2), %rcx
	shlq	$5, %rcx
	vmovddup	1456(%rsp,%rcx), %xmm14
	vmovapd	832(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm14, %xmm0, %xmm2
	vmovddup	1464(%rsp,%rcx), %xmm3
	vaddpd	.LCPI0_24, %xmm2, %xmm2
	vmulpd	%xmm3, %xmm8, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1472(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm4, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1480(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm9, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1488(%rsp,%rcx), %xmm3
	vmovapd	816(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1496(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm11, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1504(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm13, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1512(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm15, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1520(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm12, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1528(%rsp,%rcx), %xmm3
	vmovapd	800(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1536(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm10, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovddup	1544(%rsp,%rcx), %xmm3
	vmulpd	%xmm3, %xmm6, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vpaddq	%xmm7, %xmm1, %xmm1
	vpcmpeqq	%xmm5, %xmm1, %xmm3
	vptest	%xmm3, %xmm3
	vmovupd	%xmm2, 2640(%rsp,%rax,8)
	je	.LBB0_52
# BB#53:                                # %mv12x12.exit
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	512(%rsp), %rax         # 8-byte Reload
	vmovups	(%rax), %ymm1
	vmovupd	32(%rax), %ymm2
	vmovups	64(%rax), %ymm3
	leaq	976(%rsp), %rax
	vmovups	%ymm3, 64(%rax)
	vmovupd	%ymm2, 32(%rax)
	vmovups	%ymm1, (%rax)
	vmovdqa	.LCPI0_0(%rip), %xmm12
	vmovdqa	768(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm12, %xmm1, %xmm1
	vmovdqa	.LCPI0_3(%rip), %xmm11
	vpcmpeqq	%xmm11, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	vmovdqa	%xmm7, %xmm10
	vmovdqa	.LCPI0_15(%rip), %xmm13
	vmovapd	.LCPI0_20(%rip), %xmm3
	je	.LBB0_57
# BB#54:                                # %for.body399.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovddup	976(%rsp), %xmm1
	vxorpd	%xmm3, %xmm1, %xmm1
	vmovapd	%xmm1, 976(%rsp)
	vmovapd	176(%rsp), %xmm0        # 16-byte Reload
	vxorpd	%xmm3, %xmm0, %xmm1
	vmovapd	%xmm1, 1168(%rsp)
	vmovapd	304(%rsp), %xmm0        # 16-byte Reload
	vxorpd	%xmm3, %xmm0, %xmm1
	vmovapd	%xmm1, 1072(%rsp)
	vmovdqa	%xmm10, %xmm1
	vmovapd	336(%rsp), %xmm0        # 16-byte Reload
	vmovapd	320(%rsp), %xmm4        # 16-byte Reload
	jmp	.LBB0_55
	.align	16, 0x90
.LBB0_56:                               # %for.body399.for.body399_crit_edge.for.body399.for.body399_crit_edge_crit_edge
                                        #   in Loop: Header=BB0_55 Depth=2
	vpextrq	$1, %xmm1, %rax
	vmovddup	1168(%rsp,%rax,8), %xmm0
	vmovddup	1072(%rsp,%rax,8), %xmm4
.LBB0_55:                               # %for.body399.for.body399_crit_edge
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm1, %rax
	vmovddup	976(%rsp,%rax,8), %xmm2
	vxorpd	%xmm3, %xmm2, %xmm2
	vmovupd	%xmm2, 976(%rsp,%rax,8)
	vxorpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm0, 1168(%rsp,%rax,8)
	vxorpd	%xmm3, %xmm4, %xmm0
	vmovupd	%xmm0, 1072(%rsp,%rax,8)
	vpaddq	%xmm10, %xmm1, %xmm1
	vpcmpeqq	%xmm5, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_56
.LBB0_57:                               # %for.cond418.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	movq	ARCHvertex(%rip), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm15 # xmm15 = xmm0[0,0]
	movq	(%rax,%r12,8), %r8
	vmovq	%r8, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm1 # xmm1 = xmm0[0,0]
	movq	V23(%rip), %rcx
	movq	M23(%rip), %rdx
	movq	C23(%rip), %rsi
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%ymm9, %ymm9, %ymm9
	vmovdqa	.LCPI0_21(%rip), %xmm14
	.align	16, 0x90
.LBB0_58:                               # %for.body421
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm2, %rdi
	vpmuludq	%xmm11, %xmm2, %xmm0
	vpsrlq	$32, %xmm11, %xmm3
	vpmuludq	%xmm3, %xmm2, %xmm3
	vpsrlq	$32, %xmm2, %xmm4
	vpsllq	$32, %xmm3, %xmm3
	vpmuludq	%xmm11, %xmm4, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vmovd	(%r8,%rdi,4), %xmm5
	vpaddq	%xmm3, %xmm0, %xmm0
	vpbroadcastq	%xmm5, %xmm3
	vpextrq	$1, %xmm3, %rdi
	movslq	%edi, %rdi
	vpaddq	%xmm4, %xmm0, %xmm0
	vmovq	%rdi, %xmm4
	vmovq	%xmm3, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm3
	vpunpcklqdq	%xmm4, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm4[0]
	vpextrq	$1, %xmm3, %rdi
	movq	(%rcx,%rdi,8), %rbp
	vpextrq	$1, %xmm0, %rbx
	vmovupd	976(%rsp,%rbx,8), %xmm3
	vaddpd	(%rbp), %xmm3, %xmm3
	vpaddq	%xmm13, %xmm0, %xmm0
	vmovupd	%xmm3, (%rbp)
	vpextrq	$1, %xmm0, %rax
	vmovddup	976(%rsp,%rax,8), %xmm0
	vmovddup	16(%rbp), %xmm3
	vaddpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rbp)
	movq	(%rdx,%rdi,8), %rbp
	vmovupd	1168(%rsp,%rbx,8), %xmm0
	vaddpd	(%rbp), %xmm0, %xmm0
	vmovupd	%xmm0, (%rbp)
	vmovddup	1168(%rsp,%rax,8), %xmm0
	vmovddup	16(%rbp), %xmm3
	vaddpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rbp)
	movq	(%rsi,%rdi,8), %rdi
	vmovupd	1072(%rsp,%rbx,8), %xmm0
	vaddpd	(%rdi), %xmm0, %xmm0
	vmovupd	%xmm0, (%rdi)
	vmovddup	1072(%rsp,%rax,8), %xmm0
	vmovddup	16(%rdi), %xmm3
	vaddpd	%xmm3, %xmm0, %xmm0
	vpaddq	%xmm10, %xmm2, %xmm2
	vpcmpeqq	%xmm14, %xmm2, %xmm3
	vptest	%xmm3, %xmm3
	vmovupd	%xmm0, 16(%rdi)
	je	.LBB0_58
.LBB0_59:                               # %for.cond531.preheader
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovdqa	%xmm12, %xmm5
	vpextrq	$1, %xmm1, %r9
	movq	M(%rip), %rax
	movq	%rax, 800(%rsp)         # 8-byte Spill
	movq	C(%rip), %rax
	movq	%rax, 784(%rsp)         # 8-byte Spill
	movq	ARCHmatrixindex(%rip), %rbp
	movq	ARCHmatrixcol(%rip), %rbx
	movq	K(%rip), %rax
	movq	%rax, 816(%rsp)         # 8-byte Spill
	vxorpd	%xmm8, %xmm8, %xmm8
	.align	16, 0x90
.LBB0_60:                               # %for.body534
                                        #   Parent Loop BB0_25 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_61 Depth 3
                                        #         Child Loop BB0_63 Depth 4
	vpextrq	$1, %xmm8, %rcx
	vpmuludq	%xmm11, %xmm8, %xmm0
	vpsrlq	$32, %xmm11, %xmm2
	vpmuludq	%xmm2, %xmm8, %xmm3
	vpsllq	$32, %xmm3, %xmm3
	vpaddq	%xmm3, %xmm0, %xmm0
	vpsrlq	$32, %xmm8, %xmm3
	vpmuludq	%xmm11, %xmm3, %xmm3
	vpsllq	$32, %xmm3, %xmm3
	vpaddq	%xmm3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %r11
	movl	(%r9,%rcx,4), %eax
	movl	%eax, 768(%rsp)         # 4-byte Spill
	vmovd	%eax, %xmm3
	vpbroadcastq	%xmm3, %xmm3
	vpextrq	$1, %xmm3, %r10
	movslq	%r10d, %rdx
	vmovq	%rdx, %xmm4
	vmovq	%xmm3, %r13
	movslq	%r13d, %rdx
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm4, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm4[0]
	vpextrq	$1, %xmm3, %r12
	movq	800(%rsp), %rax         # 8-byte Reload
	movq	(%rax,%r12,8), %rdx
	vpaddq	%xmm10, %xmm0, %xmm3
	vpextrq	$1, %xmm3, %rax
	movq	%rax, 832(%rsp)         # 8-byte Spill
	vmovupd	1360(%rsp,%r11,8), %xmm3
	vaddpd	(%rdx), %xmm3, %xmm3
	vmovupd	%xmm3, (%rdx)
	vpaddq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %r14
	vmovddup	1360(%rsp,%r14,8), %xmm0
	vmovddup	16(%rdx), %xmm3
	vaddpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rdx)
	movq	784(%rsp), %rax         # 8-byte Reload
	movq	(%rax,%r12,8), %rdx
	vmovupd	1264(%rsp,%r11,8), %xmm0
	vaddpd	(%rdx), %xmm0, %xmm0
	vmovupd	%xmm0, (%rdx)
	vmovddup	1264(%rsp,%r14,8), %xmm0
	vmovddup	16(%rdx), %xmm3
	vaddpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rdx)
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovdqa	%xmm5, %xmm1
	.align	16, 0x90
.LBB0_61:                               # %for.body608
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_60 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_63 Depth 4
	vpextrq	$1, %xmm3, %rdx
	movl	(%r9,%rdx,4), %edx
	vmovd	%edx, %xmm0
	vpbroadcastq	%xmm0, %xmm4
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm5
	vpunpcklqdq	%xmm0, %xmm5, %xmm0 # xmm0 = xmm5[0],xmm0[0]
	movslq	%r10d, %rax
	vmovq	%rax, %xmm5
	movslq	%r13d, %rax
	vmovq	%rax, %xmm6
	vpunpcklqdq	%xmm5, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm5[0]
	vpcmpgtq	%xmm0, %xmm5, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_67
# BB#62:                                # %if.then619
                                        #   in Loop: Header=BB0_61 Depth=3
	vmovd	(%rbp,%r12,4), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpaddq	%xmm10, %xmm4, %xmm5
	vpextrq	$1, %xmm5, %rax
	cltq
	vmovq	%rax, %xmm6
	vmovq	%xmm5, %rax
	cltq
	vmovq	%rax, %xmm5
	vpunpcklqdq	%xmm6, %xmm5, %xmm5 # xmm5 = xmm5[0],xmm6[0]
	vpextrq	$1, %xmm5, %r15
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm5
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm5, %xmm0, %xmm5 # xmm5 = xmm0[0],xmm5[0]
	.align	16, 0x90
.LBB0_63:                               # %while.cond
                                        #   Parent Loop BB0_25 Depth=1
                                        #     Parent Loop BB0_60 Depth=2
                                        #       Parent Loop BB0_61 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vpextrq	$1, %xmm5, %r8
	vmovd	(%rbx,%r8,4), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	%xmm1, %xmm0, %xmm0
	vpand	%xmm1, %xmm4, %xmm6
	vpcmpeqq	%xmm6, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_66
# BB#64:                                # %while.body
                                        #   in Loop: Header=BB0_63 Depth=4
	vpaddq	%xmm10, %xmm5, %xmm5
	vmovd	(%rbp,%r15,4), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm6
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm6, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm6[0]
	vpextrq	$1, %xmm5, %rax
	cltq
	vmovq	%rax, %xmm6
	vmovq	%xmm5, %rax
	cltq
	vmovq	%rax, %xmm7
	vpunpcklqdq	%xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0],xmm6[0]
	vpcmpgtq	%xmm6, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_63
	jmp	.LBB0_65
	.align	16, 0x90
.LBB0_66:                               # %for.cond655.loopexit
                                        #   in Loop: Header=BB0_61 Depth=3
	vpmuludq	%xmm11, %xmm3, %xmm0
	vpmuludq	%xmm2, %xmm3, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm0, %xmm0
	vpsrlq	$32, %xmm3, %xmm4
	vpmuludq	%xmm11, %xmm4, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %r15
	movq	816(%rsp), %rax         # 8-byte Reload
	movq	(%rax,%r8,8), %rdx
	movq	(%rdx), %rcx
	leaq	(%r11,%r11,2), %rsi
	shlq	$5, %rsi
	leaq	1456(%rsp,%rsi), %rsi
	vmovddup	(%rsi,%r15,8), %xmm4
	vmovddup	(%rcx), %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovupd	%xmm4, (%rcx)
	vpaddq	%xmm10, %xmm0, %xmm4
	vpextrq	$1, %xmm4, %rdi
	vmovddup	(%rsi,%rdi,8), %xmm4
	vmovddup	8(%rcx), %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovupd	%xmm4, 8(%rcx)
	vpaddq	%xmm13, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	vmovddup	(%rsi,%rax,8), %xmm0
	vmovddup	16(%rcx), %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rcx)
	movq	8(%rdx), %rcx
	movq	832(%rsp), %rsi         # 8-byte Reload
	leaq	(%rsi,%rsi,2), %rsi
	shlq	$5, %rsi
	leaq	1456(%rsp,%rsi), %rsi
	vmovddup	(%rsi,%r15,8), %xmm0
	vmovddup	(%rcx), %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, (%rcx)
	vmovddup	(%rsi,%rdi,8), %xmm0
	vmovddup	8(%rcx), %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, 8(%rcx)
	vmovddup	(%rsi,%rax,8), %xmm0
	vmovddup	16(%rcx), %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rcx)
	movq	16(%rdx), %rcx
	leaq	(%r14,%r14,2), %rdx
	shlq	$5, %rdx
	leaq	1456(%rsp,%rdx), %rdx
	vmovddup	(%rdx,%r15,8), %xmm0
	vmovddup	(%rcx), %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, (%rcx)
	vmovddup	(%rdx,%rdi,8), %xmm0
	vmovddup	8(%rcx), %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, 8(%rcx)
	vmovddup	(%rdx,%rax,8), %xmm0
	vmovddup	16(%rcx), %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rcx)
.LBB0_67:                               # %for.inc685
                                        #   in Loop: Header=BB0_61 Depth=3
	vpaddq	%xmm10, %xmm3, %xmm3
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm0, %xmm4, %xmm0 # xmm0 = xmm4[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm14, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_61
# BB#68:                                # %for.inc688
                                        #   in Loop: Header=BB0_60 Depth=2
	vmovdqa	%xmm1, %xmm5
	vpaddq	%xmm10, %xmm8, %xmm8
	vpextrq	$1, %xmm8, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm8, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpcmpgtq	%xmm0, %xmm14, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_60
# BB#69:                                # %for.inc691
                                        #   in Loop: Header=BB0_25 Depth=1
	vmovdqa	528(%rsp), %xmm3        # 16-byte Reload
	vpaddq	%xmm10, %xmm3, %xmm3
	vmovd	ARCHelems(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	leaq	2624(%rsp), %r14
	leaq	1360(%rsp), %r15
	leaq	1264(%rsp), %r13
	movq	408(%rsp), %rbp         # 8-byte Reload
	jne	.LBB0_25
.LBB0_70:                               # %for.end693
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	vzeroupper
	callq	fputc
	vmovdqa	544(%rsp), %xmm1        # 16-byte Reload
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	.LCPI0_4(%rip), %xmm4
	vpcmpgtq	%xmm0, %xmm4, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_104
# BB#71:
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LCPI0_15(%rip), %xmm0
	vxorps	%xmm8, %xmm8, %xmm8
	vmovdqa	.LCPI0_4(%rip), %xmm7
	vmovdqa	.LCPI0_0(%rip), %xmm9
	movabsq	$-8608480567731124087, %r14 # imm = 0x8888888888888889
	vmovdqa	%xmm4, 624(%rsp)        # 16-byte Spill
	jmp	.LBB0_72
.LBB0_97:                               # %if.then899
                                        #   in Loop: Header=BB0_72 Depth=1
	vmovdqa	624(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str16, %esi
	xorl	%eax, %eax
	callq	fprintf
	vpbroadcastq	Src+80(%rip), %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm0[0]
	vmovd	ARCHmine(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB0_99
# BB#98:                                #   in Loop: Header=BB0_72 Depth=1
	vpsrlq	$32, %xmm1, %xmm1
	jmp	.LBB0_100
.LBB0_99:                               # %if.then903
                                        #   in Loop: Header=BB0_72 Depth=1
	vpsllq	$32, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	sarq	$32, %rax
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	sarq	$32, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rax
	movq	ARCHglobalnode(%rip), %rcx
	movl	(%rcx,%rax,4), %esi
	movq	disp(%rip), %rcx
	movq	(%rcx,%r13,8), %rcx
	movq	(%rcx,%rax,8), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	vmovsd	16(%rax), %xmm2
	movl	$.L.str17, %edi
	movb	$3, %al
	callq	printf
	vmovd	Src+84(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovd	ARCHmine(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
.LBB0_100:                              # %if.end922
                                        #   in Loop: Header=BB0_72 Depth=1
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm2[0]
	vpextrq	$1, %xmm1, %rax
	movslq	%eax, %rcx
	vmovq	%rcx, %xmm2
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_102
# BB#101:                               # %if.then925
                                        #   in Loop: Header=BB0_72 Depth=1
	cltq
	vmovq	%rax, %xmm0
	movslq	%ecx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm0, %rax
	movq	ARCHglobalnode(%rip), %rcx
	movl	(%rcx,%rax,4), %esi
	movq	disp(%rip), %rcx
	movq	(%rcx,%r13,8), %rcx
	movq	(%rcx,%rax,8), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	vmovsd	16(%rax), %xmm2
	movl	$.L.str17, %edi
	movb	$3, %al
	callq	printf
.LBB0_102:                              # %if.end944
                                        #   in Loop: Header=BB0_72 Depth=1
	movq	stdout(%rip), %rdi
	callq	fflush
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqa	.LCPI0_4(%rip), %xmm7
	vmovdqa	.LCPI0_0(%rip), %xmm6
	vmovdqa	%xmm6, %xmm9
	jmp	.LBB0_103
	.align	16, 0x90
.LBB0_72:                               # %for.cond699.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_74 Depth 2
                                        #     Child Loop BB0_77 Depth 2
                                        #     Child Loop BB0_80 Depth 2
                                        #       Child Loop BB0_81 Depth 3
                                        #     Child Loop BB0_93 Depth 2
                                        #     Child Loop BB0_95 Depth 2
	vmovdqa	%xmm3, 576(%rsp)        # 16-byte Spill
	vmovdqa	%xmm0, 592(%rsp)        # 16-byte Spill
	movl	ARCHnodes(%rip), %edi
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpextrq	$1, %xmm2, %r13
	vpcmpgtq	%xmm8, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_75
# BB#73:                                # %for.cond703.preheader.lr.ph
                                        #   in Loop: Header=BB0_72 Depth=1
	movq	disp(%rip), %rax
	movq	(%rax,%r13,8), %rax
	vpxor	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB0_74:                               # %for.cond703.preheader
                                        #   Parent Loop BB0_72 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm1, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmovups	%xmm8, (%rcx)
	movq	$0, 16(%rcx)
	vpaddq	%xmm7, %xmm1, %xmm1
	vpand	%xmm9, %xmm1, %xmm2
	vpand	%xmm9, %xmm0, %xmm3
	vpcmpeqq	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB0_74
.LBB0_75:                               # %for.end718
                                        #   in Loop: Header=BB0_72 Depth=1
	movq	K(%rip), %rsi
	movq	ARCHmatrixcol(%rip), %rdx
	movq	ARCHmatrixindex(%rip), %rcx
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm4, %rax
	vmovdqa	%xmm4, 560(%rsp)        # 16-byte Spill
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm0, %rbx
	movq	disp(%rip), %rax
	movq	(%rax,%rbx,8), %r8
	movq	(%rax,%r13,8), %r9
	callq	smvp
	vmovdqa	.LCPI0_0(%rip), %xmm6
	vmovdqa	%xmm6, %xmm9
	vmovdqa	.LCPI0_4(%rip), %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqa	624(%rsp), %xmm0        # 16-byte Reload
	vpextrq	$1, %xmm0, %r12
	vmovq	%xmm0, 608(%rsp)        # 8-byte Folded Spill
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpcmpgtq	%xmm8, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB0_96
# BB#76:                                # %for.cond729.preheader.lr.ph
                                        #   in Loop: Header=BB0_72 Depth=1
	movslq	%r12d, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movq	608(%rsp), %rax         # 8-byte Reload
	cltq
	vcvtsi2sdq	%rax, %xmm0, %xmm2
	vunpcklpd	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vmovddup	Exc(%rip), %xmm3
	vmulpd	%xmm3, %xmm0, %xmm10
	vmovapd	%xmm10, 800(%rsp)       # 16-byte Spill
	movq	disp(%rip), %rax
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	movq	(%rax,%r13,8), %rax
	vpaddq	%xmm9, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	.LCPI0_20(%rip), %xmm5
	jmp	.LBB0_77
	.align	16, 0x90
.LBB0_78:                               # %for.cond729.preheader.for.cond729.preheader_crit_edge
                                        #   in Loop: Header=BB0_77 Depth=2
	vpaddq	%xmm7, %xmm2, %xmm2
	vmovddup	Exc(%rip), %xmm3
.LBB0_77:                               # %for.cond729.preheader
                                        #   Parent Loop BB0_72 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm2, %rcx
	movq	(%rax,%rcx,8), %rcx
	vmulpd	%xmm3, %xmm3, %xmm3
	vmovddup	(%rcx), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm3, %xmm3
	vmovupd	%xmm3, (%rcx)
	vmovddup	Exc(%rip), %xmm3
	vmulpd	%xmm3, %xmm3, %xmm3
	vmovddup	8(%rcx), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm3, %xmm3
	vmovupd	%xmm3, 8(%rcx)
	vmovddup	Exc(%rip), %xmm3
	vmulpd	%xmm3, %xmm3, %xmm3
	vmovddup	16(%rcx), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm3, %xmm3
	vmovupd	%xmm3, 16(%rcx)
	vpand	%xmm9, %xmm2, %xmm3
	vpand	%xmm9, %xmm1, %xmm4
	vpcmpeqq	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB0_78
# BB#79:                                # %for.cond752.preheader.lr.ph
                                        #   in Loop: Header=BB0_72 Depth=1
	vmovdqa	592(%rsp), %xmm2        # 16-byte Reload
	vpextrq	$1, %xmm2, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm2, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpextrq	$1, %xmm1, %rbp
	vmulpd	.LCPI0_13(%rip), %xmm10, %xmm1
	vmovapd	%xmm1, 784(%rsp)        # 16-byte Spill
	vpxor	%xmm2, %xmm2, %xmm2
	vmovapd	.LCPI0_22(%rip), %xmm5
	.align	16, 0x90
.LBB0_80:                               # %for.cond752.preheader
                                        #   Parent Loop BB0_72 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_81 Depth 3
	vmovdqa	%xmm2, 640(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm2, %r14
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB0_81:                               # %for.body755
                                        #   Parent Loop BB0_72 Depth=1
                                        #     Parent Loop BB0_80 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqa	%xmm2, 832(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	vpextrq	$1, %xmm2, %r15
	movq	M(%rip), %rcx
	movq	(%rcx,%r14,8), %rcx
	vmovddup	(%rcx,%r15,8), %xmm0
	vmulpd	.LCPI0_11(%rip), %xmm0, %xmm7
	movq	(%rax,%rbx,8), %rcx
	movq	(%rcx,%r14,8), %rcx
	vmovddup	(%rcx,%r15,8), %xmm4
	vmovddup	Exc(%rip), %xmm1
	vmovapd	%xmm1, 816(%rsp)        # 16-byte Spill
	vmulpd	%xmm5, %xmm1, %xmm1
	movq	C(%rip), %rcx
	movq	(%rcx,%r14,8), %rcx
	vmovddup	(%rcx,%r15,8), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm2
	movq	(%rax,%rbp,8), %rax
	movq	(%rax,%r14,8), %rax
	vmovddup	(%rax,%r15,8), %xmm6
	movq	M23(%rip), %rax
	movq	(%rax,%r14,8), %rax
	vmovddup	(%rax,%r15,8), %xmm3
	vmovddup	Exc+16(%rip), %xmm0
	vcmpnlepd	%xmm0, %xmm10, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_83
# BB#82:                                #   in Loop: Header=BB0_81 Depth=3
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.LBB0_84
	.align	16, 0x90
.LBB0_83:                               # %if.then.i
                                        #   in Loop: Header=BB0_81 Depth=3
	vmovapd	.LCPI0_13(%rip), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm1
	vdivpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 688(%rsp)        # 16-byte Spill
	vmovapd	784(%rsp), %xmm1        # 16-byte Reload
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 656(%rsp)        # 16-byte Spill
	vmovapd	%xmm7, 768(%rsp)        # 16-byte Spill
	vmovapd	%xmm4, 752(%rsp)        # 16-byte Spill
	vmovapd	%xmm2, 736(%rsp)        # 16-byte Spill
	vmovapd	%xmm6, 720(%rsp)        # 16-byte Spill
	vmovapd	%xmm3, 704(%rsp)        # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, 672(%rsp)        # 16-byte Spill
	vmovapd	656(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	sin
	vmovapd	704(%rsp), %xmm3        # 16-byte Reload
	vmovapd	720(%rsp), %xmm6        # 16-byte Reload
	vmovapd	736(%rsp), %xmm2        # 16-byte Reload
	vmovapd	752(%rsp), %xmm4        # 16-byte Reload
	vmovapd	768(%rsp), %xmm7        # 16-byte Reload
	vmovapd	800(%rsp), %xmm10       # 16-byte Reload
	vmovapd	.LCPI0_22(%rip), %xmm5
	vmovapd	672(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	688(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm1
	vmovddup	Exc+16(%rip), %xmm0
.LBB0_84:                               # %phi2.exit
                                        #   in Loop: Header=BB0_81 Depth=3
	vmulpd	%xmm4, %xmm7, %xmm7
	vmulpd	%xmm6, %xmm2, %xmm6
	vmulpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm5, %xmm1, %xmm8
	movq	C23(%rip), %rax
	movq	(%rax,%r14,8), %rax
	vmovddup	(%rax,%r15,8), %xmm4
	vcmpnlepd	%xmm0, %xmm10, %xmm1
	vptest	%xmm1, %xmm1
	vxorpd	%xmm3, %xmm3, %xmm3
	je	.LBB0_86
# BB#85:                                #   in Loop: Header=BB0_81 Depth=3
	vmovapd	.LCPI0_2(%rip), %xmm2
	jmp	.LBB0_87
	.align	16, 0x90
.LBB0_86:                               # %if.then.i1341
                                        #   in Loop: Header=BB0_81 Depth=3
	vmovapd	784(%rsp), %xmm1        # 16-byte Reload
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 688(%rsp)        # 16-byte Spill
	vmovapd	%xmm8, 768(%rsp)        # 16-byte Spill
	vmovapd	%xmm7, 752(%rsp)        # 16-byte Spill
	vmovapd	%xmm6, 736(%rsp)        # 16-byte Spill
	vmovapd	%xmm4, 720(%rsp)        # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 704(%rsp)        # 16-byte Spill
	vmovapd	688(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	cos
	vmovapd	720(%rsp), %xmm4        # 16-byte Reload
	vmovapd	736(%rsp), %xmm6        # 16-byte Reload
	vmovapd	752(%rsp), %xmm7        # 16-byte Reload
	vmovapd	768(%rsp), %xmm8        # 16-byte Reload
	vmovapd	800(%rsp), %xmm10       # 16-byte Reload
	vmovapd	.LCPI0_22(%rip), %xmm5
	vmovapd	704(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	.LCPI0_2(%rip), %xmm2
	vsubpd	%xmm0, %xmm2, %xmm1
	vmovddup	Exc+16(%rip), %xmm0
	vdivpd	%xmm0, %xmm1, %xmm3
.LBB0_87:                               # %phi1.exit
                                        #   in Loop: Header=BB0_81 Depth=3
	vsubpd	%xmm6, %xmm7, %xmm6
	vmovapd	816(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm1, %xmm1, %xmm7
	vmulpd	%xmm3, %xmm4, %xmm1
	vmulpd	%xmm5, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm8, %xmm3
	movq	V23(%rip), %rax
	movq	(%rax,%r14,8), %rax
	vmovddup	(%rax,%r15,8), %xmm4
	vcmpnlepd	%xmm0, %xmm10, %xmm1
	vptest	%xmm1, %xmm1
	vmovapd	%xmm2, %xmm1
	jne	.LBB0_89
# BB#88:                                # %if.then.i1349
                                        #   in Loop: Header=BB0_81 Depth=3
	vmovapd	784(%rsp), %xmm1        # 16-byte Reload
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 816(%rsp)        # 16-byte Spill
	vmovapd	%xmm6, 768(%rsp)        # 16-byte Spill
	vmovapd	%xmm7, 752(%rsp)        # 16-byte Spill
	vmovapd	%xmm3, 736(%rsp)        # 16-byte Spill
	vmovapd	%xmm4, 720(%rsp)        # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, 704(%rsp)        # 16-byte Spill
	vmovapd	816(%rsp), %xmm0        # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	sin
	vmovapd	720(%rsp), %xmm4        # 16-byte Reload
	vmovapd	736(%rsp), %xmm3        # 16-byte Reload
	vmovapd	752(%rsp), %xmm7        # 16-byte Reload
	vmovapd	768(%rsp), %xmm6        # 16-byte Reload
	vmovapd	800(%rsp), %xmm10       # 16-byte Reload
	vmovapd	.LCPI0_22(%rip), %xmm5
	vmovapd	704(%rsp), %xmm1        # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	816(%rsp), %xmm1        # 16-byte Reload
	vsubpd	%xmm0, %xmm1, %xmm0
	vmulpd	.LCPI0_23(%rip), %xmm0, %xmm1
.LBB0_89:                               # %phi0.exit
                                        #   in Loop: Header=BB0_81 Depth=3
	vmulpd	%xmm1, %xmm4, %xmm0
	vmulpd	%xmm5, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vmulpd	%xmm0, %xmm7, %xmm0
	vsubpd	%xmm0, %xmm6, %xmm1
	movq	disp(%rip), %rcx
	vmovq	%rcx, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	movq	(%rcx,%r13,8), %rax
	movq	(%rax,%r14,8), %rdx
	vmovddup	(%rdx,%r15,8), %xmm2
	vaddpd	%xmm1, %xmm2, %xmm1
	vmovupd	%xmm1, (%rdx,%r15,8)
	vmovdqa	.LCPI0_4(%rip), %xmm7
	vmovdqa	832(%rsp), %xmm2        # 16-byte Reload
	vpaddq	%xmm7, %xmm2, %xmm2
	vpcmpeqq	.LCPI0_3(%rip), %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB0_81
# BB#90:                                # %for.inc823
                                        #   in Loop: Header=BB0_80 Depth=2
	vmovdqa	640(%rsp), %xmm6        # 16-byte Reload
	vpaddq	%xmm7, %xmm6, %xmm6
	vmovd	ARCHnodes(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpextrq	$1, %xmm1, %rdx
	movslq	%edx, %rsi
	vmovq	%rsi, %xmm2
	vmovq	%xmm1, %rsi
	movslq	%esi, %rdi
	vmovq	%rdi, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpextrq	$1, %xmm6, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm3
	vmovq	%xmm6, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	vmovdqa	%xmm6, %xmm2
	vxorpd	%xmm8, %xmm8, %xmm8
	vmovdqa	.LCPI0_0(%rip), %xmm6
	vmovdqa	%xmm6, %xmm9
	jne	.LBB0_80
# BB#91:                                # %for.cond826.loopexit
                                        #   in Loop: Header=BB0_72 Depth=1
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm0
	movslq	%esi, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm0 # xmm0 = xmm2[0],xmm0[0]
	vpcmpgtq	%xmm8, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vmovapd	.LCPI0_22(%rip), %xmm0
	vmovapd	%xmm0, %xmm5
	movabsq	$-8608480567731124087, %r14 # imm = 0x8888888888888889
	je	.LBB0_96
# BB#92:                                # %for.cond830.preheader.lr.ph
                                        #   in Loop: Header=BB0_72 Depth=1
	movq	M(%rip), %r8
	movq	C(%rip), %rsi
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB0_93:                               # %for.cond830.preheader
                                        #   Parent Loop BB0_72 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm2, %rdi
	movq	(%rax,%rdi,8), %rbx
	movq	(%r8,%rdi,8), %rdx
	movq	(%rsi,%rdi,8), %rdi
	vmovddup	(%rbx), %xmm0
	vmovddup	(%rdx), %xmm3
	vmovddup	Exc(%rip), %xmm4
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	%xmm5, %xmm6
	vmovddup	(%rdi), %xmm5
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vdivpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm0, (%rbx)
	vmovddup	8(%rbx), %xmm0
	vmovddup	8(%rdx), %xmm3
	vmovddup	Exc(%rip), %xmm4
	vmulpd	%xmm6, %xmm4, %xmm4
	vmovddup	8(%rdi), %xmm5
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	%xmm6, %xmm5
	vaddpd	%xmm4, %xmm3, %xmm3
	vdivpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm0, 8(%rbx)
	vmovddup	16(%rdx), %xmm0
	vmovddup	Exc(%rip), %xmm3
	vmulpd	%xmm5, %xmm3, %xmm3
	vmovddup	16(%rdi), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovddup	16(%rbx), %xmm4
	vaddpd	%xmm3, %xmm0, %xmm0
	vdivpd	%xmm0, %xmm4, %xmm3
	vpaddq	%xmm7, %xmm2, %xmm2
	vpand	%xmm9, %xmm2, %xmm4
	vpand	%xmm9, %xmm1, %xmm0
	vpcmpeqq	%xmm0, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	vmovupd	%xmm3, 16(%rbx)
	je	.LBB0_93
# BB#94:                                # %for.cond868.preheader.lr.ph
                                        #   in Loop: Header=BB0_72 Depth=1
	movq	(%rcx,%rbp,8), %rcx
	movq	vel(%rip), %rdx
	vpxor	%xmm1, %xmm1, %xmm1
	.align	16, 0x90
.LBB0_95:                               # %for.cond868.preheader
                                        #   Parent Loop BB0_72 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm1, %rsi
	movq	(%rax,%rsi,8), %rdi
	movq	(%rcx,%rsi,8), %rbp
	vmovddup	Exc(%rip), %xmm2
	movq	(%rdx,%rsi,8), %rsi
	vdivpd	%xmm2, %xmm5, %xmm2
	vmovddup	(%rdi), %xmm3
	vmovddup	(%rbp), %xmm4
	vsubpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vmovupd	%xmm2, (%rsi)
	vmovddup	Exc(%rip), %xmm2
	vdivpd	%xmm2, %xmm5, %xmm2
	vmovddup	8(%rdi), %xmm3
	vmovddup	8(%rbp), %xmm4
	vsubpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vmovupd	%xmm2, 8(%rsi)
	vmovddup	Exc(%rip), %xmm2
	vdivpd	%xmm2, %xmm5, %xmm2
	vmovddup	16(%rdi), %xmm3
	vmovddup	16(%rbp), %xmm4
	vsubpd	%xmm4, %xmm3, %xmm3
	vpaddq	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm3, %xmm2, %xmm2
	vpand	%xmm9, %xmm1, %xmm3
	vpcmpeqq	%xmm0, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	vmovupd	%xmm2, 16(%rsi)
	je	.LBB0_95
.LBB0_96:                               # %for.end896
                                        #   in Loop: Header=BB0_72 Depth=1
	movslq	%r12d, %rcx
	movq	%rcx, %rax
	imulq	%r14
	addq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$4, %rdx
	addq	%rax, %rdx
	imulq	$30, %rdx, %rax
	subq	%rax, %rcx
	vmovq	%rcx, %xmm0
	movq	608(%rsp), %rax         # 8-byte Reload
	movslq	%eax, %rcx
	movq	%rcx, %rax
	imulq	%r14
	addq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$4, %rdx
	addq	%rax, %rdx
	imulq	$30, %rdx, %rax
	subq	%rax, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpand	%xmm9, %xmm0, %xmm0
	vpcmpeqq	%xmm8, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_97
.LBB0_103:                              # %if.end946
                                        #   in Loop: Header=BB0_72 Depth=1
	vmovdqa	624(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm9, %xmm1, %xmm0
	vpaddq	%xmm7, %xmm1, %xmm1
	vmovdqa	%xmm1, 624(%rsp)        # 16-byte Spill
	vmovdqa	544(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm9, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	560(%rsp), %xmm0        # 16-byte Reload
	vmovdqa	576(%rsp), %xmm4        # 16-byte Reload
	vmovdqa	592(%rsp), %xmm3        # 16-byte Reload
	je	.LBB0_72
.LBB0_104:                              # %for.end949
	movq	stderr(%rip), %rdi
	movq	progname(%rip), %rdx
	movl	ARCHglobalnodes(%rip), %ecx
	movl	ARCHglobalelems(%rip), %r8d
	movl	$.L.str18, %esi
	xorl	%eax, %eax
	movl	124(%rsp), %r9d         # 4-byte Reload
	callq	fprintf
	movq	stderr(%rip), %rsi
	movl	$10, %edi
	callq	fputc
	movq	stderr(%rip), %rdi
	callq	fflush
	vmovd	options(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI0_0(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB0_105
.LBB0_106:                              # %if.end956
	xorl	%eax, %eax
	addq	$2744, %rsp             # imm = 0xAB8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB0_14:                               # %if.then73
	vmovaps	%xmm8, 576(%rsp)        # 16-byte Spill
	vmovaps	%xmm9, 592(%rsp)        # 16-byte Spill
	vmovaps	%xmm6, 608(%rsp)        # 16-byte Spill
	movl	%ecx, 124(%rsp)         # 4-byte Spill
	movq	stderr(%rip), %rdi
	vpsllq	$32, %xmm1, %xmm0
	vpextrq	$1, %xmm0, %rax
	sarq	$32, %rax
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	sarq	$32, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm0, %rax
	movq	ARCHglobalnode(%rip), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	ARCHcoord(%rip), %rcx
	movq	(%rcx,%rax,8), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	vmovsd	16(%rax), %xmm2
	movl	$.L.str13, %esi
	movb	$3, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	callq	fflush
	vxorpd	%xmm7, %xmm7, %xmm7
	vmovd	Src+84(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovd	ARCHmine(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	jmp	.LBB0_15
.LBB0_16:                               # %if.then93
	movq	stderr(%rip), %rdi
	cltq
	vmovq	%rax, %xmm0
	movslq	%ecx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm0, %rax
	movq	ARCHglobalnode(%rip), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	ARCHcoord(%rip), %rcx
	movq	(%rcx,%rax,8), %rax
	vmovsd	(%rax), %xmm0
	vmovsd	8(%rax), %xmm1
	vmovsd	16(%rax), %xmm2
	movl	$.L.str14, %esi
	movb	$3, %al
	callq	fprintf
	movq	stderr(%rip), %rdi
	callq	fflush
	jmp	.LBB0_17
.LBB0_65:                               # %if.then644
	movl	$.L.str15, %edi
	xorl	%eax, %eax
	movl	768(%rsp), %esi         # 4-byte Reload
	vzeroupper
	callq	printf
	movl	$1, %edi
	callq	exit
.LBB0_105:                              # %if.then954
	movq	stderr(%rip), %rdi
	movq	progname(%rip), %rdx
	movl	$.L.str19, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB0_106
.Ltmp20:
	.size	main, .Ltmp20-main
	.cfi_endproc

	.globl	arch_init
	.align	16, 0x90
	.type	arch_init,@function
arch_init:                              # @arch_init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp23:
	.cfi_def_cfa_offset 16
.Ltmp24:
	.cfi_offset %rbx, -16
	movq	%rdx, %rbx
	vpbroadcastq	(%rsi), %xmm0
	vmovdqu	%xmm0, progname(%rip)
	callq	arch_parsecommandline
	movq	stdin(%rip), %rdi
	vmovq	%rdi, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, packfile(%rip)
	movq	%rbx, %rsi
	popq	%rbx
	jmp	readpackfile            # TAILCALL
.Ltmp25:
	.size	arch_init, .Ltmp25-arch_init
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI2_1:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI2_2:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI2_3:
	.zero	16
	.text
	.globl	mem_init
	.align	16, 0x90
	.type	mem_init,@function
mem_init:                               # @mem_init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp33:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp34:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp35:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp36:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp37:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp38:
	.cfi_def_cfa_offset 56
	subq	$152, %rsp
.Ltmp39:
	.cfi_def_cfa_offset 208
.Ltmp40:
	.cfi_offset %rbx, -56
.Ltmp41:
	.cfi_offset %r12, -48
.Ltmp42:
	.cfi_offset %r13, -40
.Ltmp43:
	.cfi_offset %r14, -32
.Ltmp44:
	.cfi_offset %r15, -24
.Ltmp45:
	.cfi_offset %rbp, -16
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %r15
	movslq	%r15d, %rax
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %r12
	movslq	%r12d, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vmovdqa	%xmm0, 128(%rsp)        # 16-byte Spill
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	movq	%rdi, 48(%rsp)          # 8-byte Spill
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, nodekindf(%rip)
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_1
# BB#2:                                 # %if.end
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpsllq	$2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, nodekind(%rip)
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_3
# BB#4:                                 # %if.end12
	vmovd	ARCHelems(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpsllq	$2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, source_elms(%rip)
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_5
# BB#6:                                 # %if.end21
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, vel(%rip)
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_9
# BB#7:                                 # %for.cond.preheader
	movslq	%r15d, %rax
	vmovq	%rax, %xmm1
	movslq	%r12d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpgtq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_19
# BB#8:
	movslq	%r15d, %r14
	movslq	%r12d, %r13
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB2_13:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm5, 112(%rsp)        # 16-byte Spill
	vmovdqa	%xmm4, 128(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm5, %rbx
	vpextrq	$1, %xmm0, %rbp
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbp,%rbx,8)
	movq	vel(%rip), %rax
	vpbroadcastq	(%rax,%rbx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_14
# BB#12:                                # %for.cond
                                        #   in Loop: Header=BB2_13 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vmovdqa	112(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm2, %xmm5, %xmm5
	vpunpckhqdq	%xmm5, %xmm5, %xmm1 # xmm1 = xmm5[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	128(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm2, %xmm4, %xmm4
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovq	%r14, %xmm2
	vmovq	%r13, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_13
.LBB2_19:                               # %for.end
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, M(%rip)
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_22
# BB#20:                                # %for.cond51.preheader
	movslq	%r15d, %rax
	vmovq	%rax, %xmm1
	movslq	%r12d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_27
# BB#21:
	movslq	%r15d, %r14
	movslq	%r12d, %r13
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB2_25:                               # %for.body54
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm5, 112(%rsp)        # 16-byte Spill
	vmovdqa	%xmm4, 128(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm5, %rbx
	vpextrq	$1, %xmm0, %rbp
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbp,%rbx,8)
	movq	M(%rip), %rax
	vpbroadcastq	(%rax,%rbx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_26
# BB#24:                                # %for.cond51
                                        #   in Loop: Header=BB2_25 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vmovdqa	112(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm2, %xmm5, %xmm5
	vpunpckhqdq	%xmm5, %xmm5, %xmm1 # xmm1 = xmm5[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	128(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm2, %xmm4, %xmm4
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovq	%r14, %xmm2
	vmovq	%r13, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_25
.LBB2_27:                               # %for.end68
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, C(%rip)
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_30
# BB#28:                                # %for.cond78.preheader
	movslq	%r15d, %rax
	vmovq	%rax, %xmm1
	movslq	%r12d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_34
# BB#29:
	movslq	%r15d, %r14
	movslq	%r12d, %r13
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB2_32:                               # %for.body81
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm5, 112(%rsp)        # 16-byte Spill
	vmovdqa	%xmm4, 128(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm5, %rbx
	vpextrq	$1, %xmm0, %rbp
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbp,%rbx,8)
	movq	C(%rip), %rax
	vpbroadcastq	(%rax,%rbx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_33
# BB#31:                                # %for.cond78
                                        #   in Loop: Header=BB2_32 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vmovdqa	112(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm2, %xmm5, %xmm5
	vpunpckhqdq	%xmm5, %xmm5, %xmm1 # xmm1 = xmm5[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	128(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm2, %xmm4, %xmm4
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovq	%r14, %xmm2
	vmovq	%r13, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_32
.LBB2_34:                               # %for.end95
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, M23(%rip)
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_37
# BB#35:                                # %for.cond105.preheader
	movslq	%r15d, %rax
	vmovq	%rax, %xmm1
	movslq	%r12d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_41
# BB#36:
	movslq	%r15d, %r14
	movslq	%r12d, %r13
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB2_39:                               # %for.body108
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm5, 112(%rsp)        # 16-byte Spill
	vmovdqa	%xmm4, 128(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm5, %rbx
	vpextrq	$1, %xmm0, %rbp
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbp,%rbx,8)
	movq	M23(%rip), %rax
	vpbroadcastq	(%rax,%rbx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_40
# BB#38:                                # %for.cond105
                                        #   in Loop: Header=BB2_39 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vmovdqa	112(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm2, %xmm5, %xmm5
	vpunpckhqdq	%xmm5, %xmm5, %xmm1 # xmm1 = xmm5[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	128(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm2, %xmm4, %xmm4
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovq	%r14, %xmm2
	vmovq	%r13, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_39
.LBB2_41:                               # %for.end122
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, C23(%rip)
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_44
# BB#42:                                # %for.cond132.preheader
	movslq	%r15d, %rax
	vmovq	%rax, %xmm1
	movslq	%r12d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_48
# BB#43:
	movslq	%r15d, %r14
	movslq	%r12d, %r13
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB2_46:                               # %for.body135
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm5, 112(%rsp)        # 16-byte Spill
	vmovdqa	%xmm4, 128(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm5, %rbx
	vpextrq	$1, %xmm0, %rbp
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbp,%rbx,8)
	movq	C23(%rip), %rax
	vpbroadcastq	(%rax,%rbx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_47
# BB#45:                                # %for.cond132
                                        #   in Loop: Header=BB2_46 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vmovdqa	112(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm2, %xmm5, %xmm5
	vpunpckhqdq	%xmm5, %xmm5, %xmm1 # xmm1 = xmm5[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	128(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm2, %xmm4, %xmm4
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovq	%r14, %xmm2
	vmovq	%r13, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_46
.LBB2_48:                               # %for.end149
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovups	%xmm0, V23(%rip)
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_51
# BB#49:                                # %for.cond159.preheader
	movslq	%r15d, %rax
	vmovq	%rax, %xmm0
	movslq	%r12d, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	%xmm0, 112(%rsp)        # 16-byte Spill
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpcmpgtq	.LCPI2_3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_55
# BB#50:
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	%xmm1, 112(%rsp)        # 16-byte Spill
	movslq	%r15d, %rbx
	movslq	%r12d, %rbp
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	128(%rsp), %xmm2        # 16-byte Reload
	.align	16, 0x90
.LBB2_53:                               # %for.body162
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm1, %rcx
	vpextrq	$1, %xmm2, %rax
	vmovups	%xmm0, (%rax,%rcx,8)
	movq	V23(%rip), %rax
	vpbroadcastq	(%rax,%rcx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_54
# BB#52:                                # %for.cond159
                                        #   in Loop: Header=BB2_53 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI2_0(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovdqa	%xmm1, 96(%rsp)         # 16-byte Spill
	vpunpckhqdq	%xmm1, %xmm1, %xmm0 # xmm0 = xmm1[1,1]
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	112(%rsp), %xmm1        # 16-byte Reload
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovdqa	%xmm1, 112(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vmovdqa	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovq	%rbx, %xmm0
	vmovq	%rbp, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	%xmm0, 64(%rsp)         # 16-byte Spill
	movl	$24, %edi
	callq	malloc
	vmovdqa	128(%rsp), %xmm2        # 16-byte Reload
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	64(%rsp), %xmm1         # 16-byte Reload
	vpcmpgtq	80(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vptest	%xmm1, %xmm1
	vmovdqa	96(%rsp), %xmm1         # 16-byte Reload
	jne	.LBB2_53
.LBB2_55:                               # %for.end176
	vmovups	%xmm0, disp(%rip)
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpeqq	%xmm3, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_63
# BB#56:                                # %for.body187.preheader
	movslq	%r15d, %rax
	vmovq	%rax, %xmm1
	movslq	%r12d, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_64
# BB#57:
	movslq	%r15d, %rbx
	movq	%r15, 64(%rsp)          # 8-byte Spill
	movslq	%r12d, %rbp
	movq	%r12, 24(%rsp)          # 8-byte Spill
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	%xmm1, 96(%rsp)         # 16-byte Spill
	.align	16, 0x90
.LBB2_58:                               # %for.body187.us
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_60 Depth 2
	vmovdqa	%xmm3, 80(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %r14
	vpextrq	$1, %xmm0, %r13
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%r13,%r14,8)
	movq	disp(%rip), %rax
	vpbroadcastq	(%rax,%r14,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_66
# BB#59:                                #   in Loop: Header=BB2_58 Depth=1
	vmovdqa	96(%rsp), %xmm0         # 16-byte Reload
	vpextrd	$2, %xmm0, %r13d
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpxor	%xmm5, %xmm5, %xmm5
	vpxor	%xmm4, %xmm4, %xmm4
	.align	16, 0x90
.LBB2_60:                               # %for.body204.us
                                        #   Parent Loop BB2_58 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqa	%xmm5, 112(%rsp)        # 16-byte Spill
	vmovdqa	%xmm4, 128(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm5, %r15
	vpextrq	$1, %xmm0, %r12
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	movq	(%r12,%r14,8), %rax
	vmovups	%xmm0, (%rax,%r15,8)
	movq	disp(%rip), %rax
	movq	(%rax,%r14,8), %rcx
	vpbroadcastq	(%rcx,%r15,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_67
# BB#61:                                # %for.cond201.us
                                        #   in Loop: Header=BB2_60 Depth=2
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	112(%rsp), %xmm5        # 16-byte Reload
	vpaddq	%xmm1, %xmm5, %xmm5
	vmovdqa	128(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm1, %xmm4, %xmm4
	vpextrq	$1, %xmm5, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm5, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovq	%rbx, %xmm2
	vmovq	%rbp, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_60
# BB#62:                                # %for.inc223.us
                                        #   in Loop: Header=BB2_58 Depth=1
	vmovdqa	80(%rsp), %xmm3         # 16-byte Reload
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vpaddq	%xmm2, %xmm3, %xmm3
	vmovdqa	96(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovdqa	%xmm1, 96(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovdqa	.LCPI2_1(%rip), %xmm2
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_58
	jmp	.LBB2_70
.LBB2_64:
	movq	%r12, 24(%rsp)          # 8-byte Spill
	movq	%r15, 64(%rsp)          # 8-byte Spill
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	%xmm1, 96(%rsp)         # 16-byte Spill
	.align	16, 0x90
.LBB2_65:                               # %for.body187
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm3, 80(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rbx
	vpextrq	$1, %xmm0, %rbp
	movq	48(%rsp), %rdi          # 8-byte Reload
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbp,%rbx,8)
	movq	disp(%rip), %rax
	vpbroadcastq	(%rax,%rbx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_66
# BB#69:                                # %for.inc223
                                        #   in Loop: Header=BB2_65 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vmovdqa	80(%rsp), %xmm3         # 16-byte Reload
	vpaddq	%xmm2, %xmm3, %xmm3
	vmovdqa	96(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovdqa	%xmm1, 96(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovdqa	.LCPI2_1(%rip), %xmm2
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_65
.LBB2_70:                               # %for.end225
	vmovd	ARCHmatrixlen(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rbx
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rbp
	movslq	%ebp, %rax
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, K(%rip)
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpeqq	%xmm4, %xmm0, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_75
# BB#71:                                # %for.cond235.preheader
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	movslq	%ebp, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm4, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_77
# BB#72:
	movslq	%ebx, %r12
	movslq	%ebp, %r14
	vpxor	%xmm5, %xmm5, %xmm5
	.align	16, 0x90
.LBB2_73:                               # %for.body238
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_90 Depth 2
	vmovdqa	%xmm5, 80(%rsp)         # 16-byte Spill
	vmovdqa	%xmm4, 96(%rsp)         # 16-byte Spill
	vpextrd	$2, %xmm4, %r15d
	vpextrq	$1, %xmm5, %r13
	vpextrq	$1, %xmm0, %rbx
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbx,%r13,8)
	movq	K(%rip), %rax
	vpbroadcastq	(%rax,%r13,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_88
# BB#74:                                #   in Loop: Header=BB2_73 Depth=1
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB2_90:                               # %for.body253
                                        #   Parent Loop BB2_73 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqa	%xmm4, 112(%rsp)        # 16-byte Spill
	vmovdqa	%xmm3, 128(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm4, %rbx
	vpextrq	$1, %xmm0, %rbp
	movl	$24, %edi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	movq	(%rbp,%r13,8), %rax
	vmovups	%xmm0, (%rax,%rbx,8)
	movq	K(%rip), %rax
	movq	(%rax,%r13,8), %rcx
	vpbroadcastq	(%rcx,%rbx,8), %xmm0
	vpcmpeqq	.LCPI2_3, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB2_91
# BB#89:                                # %for.cond250
                                        #   in Loop: Header=BB2_90 Depth=2
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	%xmm1, %xmm2
	vmovdqa	112(%rsp), %xmm4        # 16-byte Reload
	vpaddq	%xmm2, %xmm4, %xmm4
	vpunpckhqdq	%xmm4, %xmm4, %xmm1 # xmm1 = xmm4[1,1]
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	128(%rsp), %xmm3        # 16-byte Reload
	vpaddq	%xmm2, %xmm3, %xmm3
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vmovdqa	.LCPI2_1(%rip), %xmm2
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_90
# BB#76:                                # %for.inc272
                                        #   in Loop: Header=BB2_73 Depth=1
	vmovdqa	.LCPI2_0(%rip), %xmm1
	vmovdqa	80(%rsp), %xmm5         # 16-byte Reload
	vpaddq	%xmm1, %xmm5, %xmm5
	vmovdqa	96(%rsp), %xmm4         # 16-byte Reload
	vpaddq	%xmm1, %xmm4, %xmm4
	vpextrq	$1, %xmm5, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm5, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vmovq	%r12, %xmm2
	vmovq	%r14, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB2_73
.LBB2_77:                               # %for.cond275.preheader
	movq	64(%rsp), %rax          # 8-byte Reload
	cltq
	vmovq	%rax, %xmm1
	movq	24(%rsp), %rax          # 8-byte Reload
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm1[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm1, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	vmovdqa	32(%rsp), %xmm3         # 16-byte Reload
	je	.LBB2_81
# BB#78:                                # %for.body278.lr.ph
	movq	nodekind(%rip), %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	M(%rip), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	C(%rip), %r10
	movq	M23(%rip), %r11
	movq	C23(%rip), %r14
	movq	V23(%rip), %r15
	movq	disp(%rip), %rcx
	movq	(%rcx), %r12
	movq	8(%rcx), %r13
	movq	16(%rcx), %rcx
	vmovdqa	.LCPI2_0(%rip), %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB2_79:                               # %for.body278
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rdx
	movq	128(%rsp), %rax         # 8-byte Reload
	movl	$0, (%rax,%rdx,4)
	movq	112(%rsp), %rax         # 8-byte Reload
	movq	(%rax,%rdx,8), %rsi
	movq	(%r10,%rdx,8), %rdi
	movq	(%r11,%rdx,8), %rbp
	movq	(%r14,%rdx,8), %rbx
	movq	(%r15,%rdx,8), %rax
	movq	(%r12,%rdx,8), %r8
	movq	(%r13,%rdx,8), %r9
	movq	(%rcx,%rdx,8), %rdx
	movq	$0, (%rsi)
	movq	$0, (%rdi)
	movq	$0, (%rbp)
	movq	$0, (%rbx)
	movq	$0, (%rax)
	movq	$0, (%r8)
	movq	$0, (%r9)
	movq	$0, (%rdx)
	movq	$0, 8(%rsi)
	movq	$0, 8(%rdi)
	movq	$0, 8(%rbp)
	movq	$0, 8(%rbx)
	movq	$0, 8(%rax)
	movq	$0, 8(%r8)
	movq	$0, 8(%r9)
	movq	$0, 8(%rdx)
	movq	$0, 16(%rsi)
	movq	$0, 16(%rdi)
	movq	$0, 16(%rbp)
	movq	$0, 16(%rbx)
	movq	$0, 16(%rax)
	movq	$0, 16(%r8)
	movq	$0, 16(%r9)
	movq	$0, 16(%rdx)
	vpaddq	%xmm2, %xmm3, %xmm3
	vmovd	ARCHnodes(%rip), %xmm4
	vpbroadcastq	%xmm4, %xmm4
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm5
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm4
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm6
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm7
	vpunpcklqdq	%xmm5, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm5[0]
	vpunpcklqdq	%xmm6, %xmm7, %xmm5 # xmm5 = xmm7[0],xmm6[0]
	vpcmpgtq	%xmm5, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	jne	.LBB2_79
# BB#80:                                # %for.cond275.for.cond326.preheader_crit_edge
	vmovd	ARCHelems(%rip), %xmm2
	vpbroadcastq	%xmm2, %xmm3
.LBB2_81:                               # %for.cond326.preheader
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB2_84
# BB#82:                                # %for.body329.lr.ph
	movq	source_elms(%rip), %rax
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqa	.LCPI2_0(%rip), %xmm2
	.align	16, 0x90
.LBB2_83:                               # %for.body329
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm1, %rcx
	movl	$1, (%rax,%rcx,4)
	vpaddq	%xmm2, %xmm1, %xmm1
	vmovd	ARCHelems(%rip), %xmm3
	vpbroadcastq	%xmm3, %xmm3
	vpextrq	$1, %xmm3, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm4
	vmovq	%xmm3, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm4, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm4[0]
	vpextrq	$1, %xmm1, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm4
	vmovq	%xmm1, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm5
	vpunpcklqdq	%xmm4, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm4[0]
	vpcmpgtq	%xmm4, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	jne	.LBB2_83
.LBB2_84:                               # %for.cond335.preheader
	vmovd	ARCHmatrixlen(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm4
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm1[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm1, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB2_87
# BB#85:
	vpextrq	$1, %xmm0, %rax
	vxorps	%xmm0, %xmm0, %xmm0
	vmovdqa	.LCPI2_0(%rip), %xmm2
	vmovdqa	.LCPI2_2(%rip), %xmm3
	vpand	%xmm3, %xmm4, %xmm4
	.align	16, 0x90
.LBB2_86:                               # %for.cond339.preheader
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm1, %rcx
	movq	(%rax,%rcx,8), %rcx
	movq	(%rcx), %rdx
	vmovups	%xmm0, (%rdx)
	movq	$0, 16(%rdx)
	movq	8(%rcx), %rdx
	vmovups	%xmm0, (%rdx)
	movq	$0, 16(%rdx)
	movq	16(%rcx), %rcx
	vmovups	%xmm0, (%rcx)
	movq	$0, 16(%rcx)
	vpaddq	%xmm2, %xmm1, %xmm1
	vpand	%xmm3, %xmm1, %xmm5
	vpcmpeqq	%xmm4, %xmm5, %xmm5
	vptest	%xmm5, %xmm5
	je	.LBB2_86
.LBB2_87:                               # %for.end361
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB2_67:                               # %if.then216
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdi
	movl	$.L.str65, %esi
	xorl	%eax, %eax
	movl	%r13d, %edx
	jmp	.LBB2_68
.LBB2_91:                               # %if.then265
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdi
	movl	$.L.str68, %esi
	xorl	%eax, %eax
	movl	%r15d, %edx
.LBB2_68:                               # %if.then216
	callq	fprintf
	movq	stderr(%rip), %rdi
.LBB2_18:                               # %if.then38
	callq	fflush
	xorl	%edi, %edi
	callq	exit
.LBB2_1:                                # %if.then
	movq	stderr(%rip), %rax
	movl	$.L.str48, %edi
	movl	$28, %esi
	jmp	.LBB2_11
.LBB2_3:                                # %if.then9
	movq	stderr(%rip), %rax
	movl	$.L.str49, %edi
	movl	$27, %esi
	jmp	.LBB2_11
.LBB2_5:                                # %if.then18
	movq	stderr(%rip), %rax
	movl	$.L.str50, %edi
	movl	$30, %esi
	jmp	.LBB2_11
.LBB2_9:                                # %if.then27
	movq	stderr(%rip), %rax
	movl	$.L.str51, %edi
	jmp	.LBB2_10
.LBB2_14:                               # %if.then38
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdx
	movl	$.L.str52, %esi
	jmp	.LBB2_15
.LBB2_22:                               # %if.then47
	movq	stderr(%rip), %rax
	movl	$.L.str53, %edi
	movl	$20, %esi
	jmp	.LBB2_11
.LBB2_26:                               # %if.then62
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdx
	movl	$.L.str54, %esi
	jmp	.LBB2_15
.LBB2_30:                               # %if.then74
	movq	stderr(%rip), %rax
	movl	$.L.str55, %edi
	movl	$20, %esi
	jmp	.LBB2_11
.LBB2_33:                               # %if.then89
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdx
	movl	$.L.str56, %esi
	jmp	.LBB2_15
.LBB2_37:                               # %if.then101
	movq	stderr(%rip), %rax
	movl	$.L.str57, %edi
	jmp	.LBB2_10
.LBB2_40:                               # %if.then116
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdx
	movl	$.L.str58, %esi
	jmp	.LBB2_15
.LBB2_44:                               # %if.then128
	movq	stderr(%rip), %rax
	movl	$.L.str59, %edi
	jmp	.LBB2_10
.LBB2_47:                               # %if.then143
	vmovdqa	128(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdx
	movl	$.L.str60, %esi
	jmp	.LBB2_15
.LBB2_51:                               # %if.then155
	movq	stderr(%rip), %rax
	movl	$.L.str61, %edi
.LBB2_10:                               # %if.then27
	movl	$22, %esi
	jmp	.LBB2_11
.LBB2_54:                               # %if.then170
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdx
	movl	$.L.str62, %esi
	jmp	.LBB2_15
.LBB2_63:                               # %if.then180
	movq	stderr(%rip), %rax
	movl	$.L.str63, %edi
	movl	$23, %esi
	jmp	.LBB2_11
.LBB2_66:                               # %if.then197
	vmovdqa	96(%rsp), %xmm0         # 16-byte Reload
	vpextrd	$2, %xmm0, %ecx
	movq	stderr(%rip), %rdx
	movl	$.L.str64, %esi
.LBB2_15:                               # %if.then38
	xorl	%eax, %eax
	movq	%rdx, %rdi
	movl	%ecx, %edx
	jmp	.LBB2_16
.LBB2_75:                               # %if.then231
	movq	stderr(%rip), %rax
	movl	$.L.str66, %edi
	movl	$20, %esi
.LBB2_11:                               # %if.then27
	movl	$1, %edx
	movq	%rax, %rcx
	callq	fwrite
	jmp	.LBB2_17
.LBB2_88:                               # %if.then246
	movq	stderr(%rip), %rcx
	movl	$.L.str67, %esi
	xorl	%eax, %eax
	movq	%rcx, %rdi
	movl	%r15d, %edx
.LBB2_16:                               # %if.then38
	callq	fprintf
.LBB2_17:                               # %if.then38
	movq	stderr(%rip), %rax
	movq	%rax, %rdi
	jmp	.LBB2_18
.Ltmp46:
	.size	mem_init, .Ltmp46-mem_init
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI3_1:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI3_2:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	arch_readnodevector
	.align	16, 0x90
	.type	arch_readnodevector,@function
arch_readnodevector:                    # @arch_readnodevector
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp50:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp51:
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
.Ltmp52:
	.cfi_def_cfa_offset 64
.Ltmp53:
	.cfi_offset %rbx, -24
.Ltmp54:
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movq	%rdi, %rbx
	movq	packfile(%rip), %rdi
	leaq	36(%rsp), %rdx
	leaq	32(%rsp), %rcx
	movl	$.L.str28, %esi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	vmovd	36(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI3_1(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_1
# BB#3:                                 # %if.end
	vmovd	32(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI3_2(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB3_8
# BB#4:                                 # %for.cond.preheader
	vmovd	%ebp, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB3_7
# BB#5:
	vpand	.LCPI3_0(%rip), %xmm0, %xmm0
	vmovdqa	%xmm0, (%rsp)           # 16-byte Spill
	.align	16, 0x90
.LBB3_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm2, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm2, %rax
	movq	packfile(%rip), %rdi
	leaq	(%rbx,%rax,8), %rdx
	movl	$.L.str31, %esi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	vmovdqa	16(%rsp), %xmm2         # 16-byte Reload
	vpaddq	.LCPI3_2(%rip), %xmm2, %xmm2
	vpand	.LCPI3_0(%rip), %xmm2, %xmm0
	vpcmpeqq	(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vptest	%xmm0, %xmm0
	je	.LBB3_6
.LBB3_7:                                # %for.end
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
.LBB3_1:                                # %if.then
	movq	stderr(%rip), %rax
	movl	$.L.str29, %edi
	movl	$37, %esi
	jmp	.LBB3_2
.LBB3_8:                                # %if.then3
	movq	stderr(%rip), %rax
	movl	$.L.str30, %edi
	movl	$48, %esi
.LBB3_2:                                # %if.then
	movl	$1, %edx
	movq	%rax, %rcx
	callq	fwrite
	callq	arch_bail
.Ltmp55:
	.size	arch_readnodevector, .Ltmp55-arch_readnodevector
	.cfi_endproc

	.globl	slip
	.align	16, 0x90
	.type	slip,@function
slip:                                   # @slip
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp60:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp61:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp62:
	.cfi_def_cfa_offset 32
	subq	$96, %rsp
.Ltmp63:
	.cfi_def_cfa_offset 128
.Ltmp64:
	.cfi_offset %rbx, -32
.Ltmp65:
	.cfi_offset %r14, -24
.Ltmp66:
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	$0, (%r14)
	movq	$0, (%r15)
	movq	$0, (%rbx)
	vmovddup	Src+16(%rip), %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	80(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	vmovddup	Src+8(%rip), %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	vmovapd	64(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	callq	sin
	vmovapd	(%rsp), %xmm1           # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	vmovaps	80(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovapd	32(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovaps	64(%rsp), %xmm0         # 16-byte Reload
	callq	cos
	vmovaps	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	16(%rsp), %xmm0         # 16-byte Reload
	callq	cos
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovddup	Src(%rip), %xmm0
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	32(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	cos
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovapd	48(%rsp), %xmm1         # 16-byte Reload
	vsubpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, (%rbx)
	vmovddup	Src+16(%rip), %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	80(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	vmovddup	Src+8(%rip), %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	vmovapd	64(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	(%rsp), %xmm1           # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	vmovaps	80(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovapd	32(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovaps	64(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	16(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovddup	Src(%rip), %xmm0
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	32(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	cos
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovapd	48(%rsp), %xmm1         # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, (%r15)
	vmovddup	Src+16(%rip), %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovapd	64(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	sin
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovddup	Src(%rip), %xmm0
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	48(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	sin
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, (%r14)
	addq	$96, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
.Ltmp67:
	.size	slip, .Ltmp67-slip
	.cfi_endproc

	.globl	distance
	.align	16, 0x90
	.type	distance,@function
distance:                               # @distance
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	(%rdi), %xmm0
	vmovddup	(%rsi), %xmm1
	vsubpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vmovddup	8(%rdi), %xmm1
	vmovddup	8(%rsi), %xmm2
	vsubpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	16(%rdi), %xmm1
	vmovddup	16(%rsi), %xmm2
	vsubpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	ret
.Ltmp68:
	.size	distance, .Ltmp68-distance
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI6_0:
	.quad	4598175219545276416     # double 2.500000e-01
	.quad	4598175219545276416     # double 2.500000e-01
	.text
	.globl	centroid
	.align	16, 0x90
	.type	centroid,@function
centroid:                               # @centroid
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	(%rdi), %xmm0
	vmovddup	24(%rdi), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	48(%rdi), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	72(%rdi), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	.LCPI6_0(%rip), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, (%rsi)
	vmovddup	8(%rdi), %xmm0
	vmovddup	32(%rdi), %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmovddup	56(%rdi), %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmovddup	80(%rdi), %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 8(%rsi)
	vmovddup	16(%rdi), %xmm0
	vmovddup	40(%rdi), %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmovddup	64(%rdi), %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmovddup	88(%rdi), %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rsi)
	ret
.Ltmp69:
	.size	centroid, .Ltmp69-centroid
	.cfi_endproc

	.globl	point2fault
	.align	16, 0x90
	.type	point2fault,@function
point2fault:                            # @point2fault
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp72:
	.cfi_def_cfa_offset 16
	subq	$96, %rsp
.Ltmp73:
	.cfi_def_cfa_offset 112
.Ltmp74:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	vmovddup	Src+8(%rip), %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	80(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 48(%rsp)         # 16-byte Spill
	callq	cos
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vmovddup	Src(%rip), %xmm0
	vmovapd	%xmm0, 64(%rsp)         # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	vmovapd	64(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	callq	sin
	vmovapd	(%rsp), %xmm1           # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm0[0]
	vmovapd	%xmm1, (%rsp)           # 16-byte Spill
	vmovapd	32(%rsp), %xmm0         # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 32(%rsp)         # 16-byte Spill
	vmovaps	80(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovapd	48(%rsp), %xmm0         # 16-byte Reload
	callq	sin
	vmovapd	80(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmulpd	(%rsp), %xmm0, %xmm0    # 16-byte Folded Reload
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vmovaps	64(%rsp), %xmm0         # 16-byte Reload
	callq	cos
	vmovaps	%xmm0, 64(%rsp)         # 16-byte Spill
	vmovapd	16(%rsp), %xmm0         # 16-byte Reload
	callq	cos
	vmovapd	64(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovddup	Src+32(%rip), %xmm1
	vmovapd	32(%rsp), %xmm3         # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm1
	vmovddup	Src+40(%rip), %xmm2
	vmovapd	80(%rsp), %xmm4         # 16-byte Reload
	vmulpd	%xmm4, %xmm2, %xmm2
	vsubpd	%xmm2, %xmm1, %xmm1
	vmovddup	Src+48(%rip), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovddup	(%rbx), %xmm2
	vmulpd	%xmm2, %xmm3, %xmm2
	vmovddup	8(%rbx), %xmm3
	vmulpd	%xmm4, %xmm3, %xmm3
	vsubpd	%xmm3, %xmm2, %xmm2
	vmovddup	16(%rbx), %xmm3
	vmulpd	%xmm3, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm2, %xmm0
	vsubpd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	addq	$96, %rsp
	popq	%rbx
	ret
.Ltmp75:
	.size	point2fault, .Ltmp75-point2fault
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI8_0:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI8_1:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI8_2:
	.quad	4613937818241073152     # double 3.000000e+00
	.quad	4613937818241073152     # double 3.000000e+00
.LCPI8_3:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI8_4:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
	.text
	.globl	abe_matrix
	.align	16, 0x90
	.type	abe_matrix,@function
abe_matrix:                             # @abe_matrix
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	(%rdi), %xmm8
	vmovddup	24(%rdi), %xmm1
	vsubpd	%xmm1, %xmm8, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vmovddup	8(%rdi), %xmm3
	vmovddup	32(%rdi), %xmm4
	vsubpd	%xmm4, %xmm3, %xmm5
	vmulpd	%xmm5, %xmm5, %xmm5
	vmovddup	16(%rdi), %xmm6
	vmovddup	40(%rdi), %xmm7
	vsubpd	%xmm7, %xmm6, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm5, %xmm2, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm0
	vsqrtpd	%xmm0, %xmm9
	vmovddup	48(%rdi), %xmm2
	vsubpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vmovddup	56(%rdi), %xmm5
	vsubpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm4, %xmm4, %xmm4
	vmovddup	64(%rdi), %xmm0
	vsubpd	%xmm7, %xmm0, %xmm7
	vmulpd	%xmm7, %xmm7, %xmm7
	vaddpd	%xmm4, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vsqrtpd	%xmm1, %xmm1
	vsubpd	%xmm2, %xmm8, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vsubpd	%xmm5, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm3, %xmm3
	vsubpd	%xmm0, %xmm6, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vaddpd	%xmm1, %xmm9, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm2
	vmulpd	.LCPI8_0(%rip), %xmm2, %xmm2
	vsubpd	%xmm9, %xmm2, %xmm3
	vmulpd	%xmm3, %xmm2, %xmm3
	vsubpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm3, %xmm1, %xmm1
	vsubpd	%xmm0, %xmm2, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vmovd	(%rsi), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vmovdqa	.LCPI8_1(%rip), %xmm2
	vpmuludq	%xmm2, %xmm1, %xmm3
	vpsrlq	$32, %xmm2, %xmm4
	vpmuludq	%xmm4, %xmm1, %xmm5
	vpsllq	$32, %xmm5, %xmm5
	vpaddq	%xmm5, %xmm3, %xmm3
	vpsrlq	$32, %xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm3, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm5
	vpunpcklqdq	%xmm3, %xmm5, %xmm3 # xmm3 = xmm5[0],xmm3[0]
	vpextrq	$1, %xmm3, %rax
	vmovddup	(%rcx,%rax,8), %xmm3
	vmovddup	8(%rdx), %xmm5
	vmovddup	16(%rdx), %xmm6
	vmulpd	%xmm6, %xmm5, %xmm5
	vmulpd	%xmm5, %xmm0, %xmm5
	vmovapd	.LCPI8_2(%rip), %xmm6
	vdivpd	%xmm6, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm3, %xmm3
	vmovupd	%xmm3, (%rcx,%rax,8)
	vmovdqa	.LCPI8_3(%rip), %xmm8
	vpaddq	%xmm8, %xmm1, %xmm5
	vpextrq	$1, %xmm5, %rax
	cltq
	vmovq	%rax, %xmm7
	vmovq	%xmm5, %rax
	cltq
	vmovq	%rax, %xmm5
	vpunpcklqdq	%xmm7, %xmm5, %xmm5 # xmm5 = xmm5[0],xmm7[0]
	vpextrq	$1, %xmm5, %rax
	vmovddup	(%rcx,%rax,8), %xmm5
	vmovddup	8(%rdx), %xmm7
	vmovddup	16(%rdx), %xmm3
	vmulpd	%xmm3, %xmm7, %xmm3
	vmulpd	%xmm3, %xmm0, %xmm3
	vdivpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm5, %xmm3
	vmovupd	%xmm3, (%rcx,%rax,8)
	vmovdqa	.LCPI8_4(%rip), %xmm9
	vpaddq	%xmm9, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm5
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm5, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm5[0]
	vpextrq	$1, %xmm1, %rax
	vmovddup	(%rcx,%rax,8), %xmm1
	vmovddup	(%rdx), %xmm5
	vmovddup	16(%rdx), %xmm7
	vmulpd	%xmm7, %xmm5, %xmm5
	vmulpd	%xmm5, %xmm0, %xmm5
	vdivpd	%xmm6, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm1, %xmm1
	vmovupd	%xmm1, (%rcx,%rax,8)
	vmovd	4(%rsi), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm5
	vpmuludq	%xmm4, %xmm1, %xmm7
	vpsllq	$32, %xmm7, %xmm7
	vpaddq	%xmm7, %xmm5, %xmm5
	vpsrlq	$32, %xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm5, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm5
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm7
	vpunpcklqdq	%xmm5, %xmm7, %xmm5 # xmm5 = xmm7[0],xmm5[0]
	vpextrq	$1, %xmm5, %rax
	vmovddup	(%rcx,%rax,8), %xmm5
	vmovddup	8(%rdx), %xmm7
	vmovddup	16(%rdx), %xmm3
	vmulpd	%xmm3, %xmm7, %xmm3
	vmulpd	%xmm3, %xmm0, %xmm3
	vdivpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm5, %xmm3
	vmovupd	%xmm3, (%rcx,%rax,8)
	vpaddq	%xmm8, %xmm1, %xmm3
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm5
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm5, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm5[0]
	vpextrq	$1, %xmm3, %rax
	vmovddup	(%rcx,%rax,8), %xmm3
	vmovddup	8(%rdx), %xmm5
	vmovddup	16(%rdx), %xmm7
	vmulpd	%xmm7, %xmm5, %xmm5
	vmulpd	%xmm5, %xmm0, %xmm5
	vdivpd	%xmm6, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm3, %xmm3
	vmovupd	%xmm3, (%rcx,%rax,8)
	vpaddq	%xmm9, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm3, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm3[0]
	vpextrq	$1, %xmm1, %rax
	vmovddup	(%rcx,%rax,8), %xmm1
	vmovddup	(%rdx), %xmm3
	vmovddup	16(%rdx), %xmm5
	vmulpd	%xmm5, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm0, %xmm3
	vdivpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovupd	%xmm1, (%rcx,%rax,8)
	vmovd	8(%rsi), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm3
	vpmuludq	%xmm4, %xmm1, %xmm4
	vpsllq	$32, %xmm4, %xmm4
	vpaddq	%xmm4, %xmm3, %xmm3
	vpsrlq	$32, %xmm1, %xmm1
	vpmuludq	%xmm2, %xmm1, %xmm1
	vpsllq	$32, %xmm1, %xmm1
	vpaddq	%xmm1, %xmm3, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpextrq	$1, %xmm2, %rax
	vmovddup	(%rcx,%rax,8), %xmm2
	vmovddup	8(%rdx), %xmm3
	vmovddup	16(%rdx), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm0, %xmm3
	vdivpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovupd	%xmm2, (%rcx,%rax,8)
	vpaddq	%xmm8, %xmm1, %xmm2
	vpextrq	$1, %xmm2, %rax
	cltq
	vmovq	%rax, %xmm3
	vmovq	%xmm2, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm3, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm3[0]
	vpextrq	$1, %xmm2, %rax
	vmovddup	(%rcx,%rax,8), %xmm2
	vmovddup	8(%rdx), %xmm3
	vmovddup	16(%rdx), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm0, %xmm3
	vdivpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovupd	%xmm2, (%rcx,%rax,8)
	vpaddq	%xmm9, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	vpextrq	$1, %xmm1, %rax
	vmovddup	(%rcx,%rax,8), %xmm1
	vmovddup	(%rdx), %xmm2
	vmovddup	16(%rdx), %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm0, %xmm0
	vdivpd	%xmm6, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, (%rcx,%rax,8)
	ret
.Ltmp76:
	.size	abe_matrix, .Ltmp76-abe_matrix
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI9_0:
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
.LCPI9_1:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI9_2:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI9_3:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI9_4:
	.quad	4                       # 0x4
	.quad	4                       # 0x4
.LCPI9_5:
	.quad	4618441417868443648     # double 6.000000e+00
	.quad	4618441417868443648     # double 6.000000e+00
.LCPI9_6:
	.quad	-4611686018427387904    # double -2.000000e+00
	.quad	-4611686018427387904    # double -2.000000e+00
.LCPI9_7:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI9_8:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI9_9:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI9_10:
	.quad	2                       # 0x2
	.quad	2                       # 0x2
.LCPI9_11:
	.quad	4598175219545276416     # double 2.500000e-01
	.quad	4598175219545276416     # double 2.500000e-01
.LCPI9_12:
	.quad	5                       # 0x5
	.quad	5                       # 0x5
.LCPI9_13:
	.quad	6                       # 0x6
	.quad	6                       # 0x6
.LCPI9_14:
	.quad	7                       # 0x7
	.quad	7                       # 0x7
.LCPI9_15:
	.quad	8                       # 0x8
	.quad	8                       # 0x8
.LCPI9_16:
	.quad	9                       # 0x9
	.quad	9                       # 0x9
.LCPI9_17:
	.quad	10                      # 0xa
	.quad	10                      # 0xa
.LCPI9_18:
	.quad	11                      # 0xb
	.quad	11                      # 0xb
.LCPI9_19:
	.quad	12                      # 0xc
	.quad	12                      # 0xc
.LCPI9_20:
	.zero	16
	.text
	.globl	element_matrices
	.align	16, 0x90
	.type	element_matrices,@function
element_matrices:                       # @element_matrices
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp82:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp83:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp84:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp85:
	.cfi_def_cfa_offset 40
	subq	$360, %rsp              # imm = 0x168
.Ltmp86:
	.cfi_def_cfa_offset 400
.Ltmp87:
	.cfi_offset %rbx, -40
.Ltmp88:
	.cfi_offset %r12, -32
.Ltmp89:
	.cfi_offset %r14, -24
.Ltmp90:
	.cfi_offset %r15, -16
	movq	%rcx, %r14
	movq	%rdx, %r12
	movq	%rsi, %r15
	leaq	176(%rsp), %rax
	vmovq	%rax, %xmm1
	movabsq	$-4616189618054758400, %rax # imm = 0xBFF0000000000000
	movq	%rax, 256(%rsp)
	movq	%rax, 288(%rsp)
	movq	%rax, 320(%rsp)
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, 264(%rsp)
	movq	$0, 296(%rsp)
	movq	$0, 328(%rsp)
	movq	$0, 272(%rsp)
	movq	%rax, 304(%rsp)
	movq	$0, 336(%rsp)
	movq	$0, 280(%rsp)
	movq	$0, 312(%rsp)
	movq	%rax, 344(%rsp)
	vmovddup	(%rdi), %xmm0
	vmovapd	%xmm0, 160(%rsp)        # 16-byte Spill
	vmovddup	24(%rdi), %xmm0
	vmovapd	%xmm0, 144(%rsp)        # 16-byte Spill
	vmovddup	48(%rdi), %xmm0
	vmovapd	%xmm0, 128(%rsp)        # 16-byte Spill
	vmovddup	72(%rdi), %xmm0
	vmovapd	%xmm0, 112(%rsp)        # 16-byte Spill
	vmovddup	8(%rdi), %xmm0
	vmovapd	%xmm0, 96(%rsp)         # 16-byte Spill
	vmovddup	32(%rdi), %xmm14
	vmovddup	56(%rdi), %xmm15
	vmovddup	80(%rdi), %xmm12
	vmovddup	16(%rdi), %xmm13
	vmovddup	40(%rdi), %xmm2
	vmovddup	64(%rdi), %xmm3
	vmovddup	88(%rdi), %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	vmovapd	.LCPI9_0(%rip), %xmm8
	vmovapd	.LCPI9_1(%rip), %xmm7
	vxorpd	%xmm9, %xmm9, %xmm9
	vxorpd	%xmm10, %xmm10, %xmm10
	vpxor	%xmm6, %xmm6, %xmm6
	vmovlhps	%xmm1, %xmm1, %xmm0 # xmm0 = xmm1[0,0]
	vmovaps	%xmm0, 80(%rsp)         # 16-byte Spill
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_2:                                # %for.cond1.preheader.for.cond1.preheader_crit_edge
                                        #   in Loop: Header=BB9_1 Depth=1
	vpextrq	$1, %xmm6, %rax
	shlq	$5, %rax
	vmovddup	256(%rsp,%rax), %xmm8
	vmovddup	264(%rsp,%rax), %xmm7
	vmovddup	272(%rsp,%rax), %xmm10
	vmovddup	280(%rsp,%rax), %xmm9
.LBB9_1:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm6, %rax
	vmovapd	160(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm8, %xmm0, %xmm11
	vaddpd	%xmm5, %xmm11, %xmm0
	vmovapd	144(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm7, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	128(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm10, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	112(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm9, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, 176(%rsp,%rax,8)
	vmovapd	96(%rsp), %xmm0         # 16-byte Reload
	vmulpd	%xmm8, %xmm0, %xmm0
	vaddpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm7, %xmm14, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm10, %xmm15, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm9, %xmm12, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, 200(%rsp,%rax,8)
	vmulpd	%xmm8, %xmm13, %xmm0
	vaddpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm7, %xmm2, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm10, %xmm3, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmulpd	%xmm9, %xmm4, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, 224(%rsp,%rax,8)
	vpaddq	.LCPI9_2(%rip), %xmm6, %xmm6
	vpcmpeqq	.LCPI9_3(%rip), %xmm6, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB9_2
# BB#3:                                 # %for.end26
	vmovsd	208(%rsp), %xmm12
	vmovsd	192(%rsp), %xmm1
	vmovsd	232(%rsp), %xmm14
	vunpcklpd	%xmm14, %xmm12, %xmm8 # xmm8 = xmm12[0],xmm14[0]
	vmovsd	240(%rsp), %xmm4
	vunpcklpd	%xmm1, %xmm4, %xmm10 # xmm10 = xmm4[0],xmm1[0]
	vmulpd	%xmm10, %xmm8, %xmm9
	vmovsd	184(%rsp), %xmm7
	vunpcklpd	%xmm4, %xmm14, %xmm3 # xmm3 = xmm14[0],xmm4[0]
	vmovsd	216(%rsp), %xmm6
	vunpcklpd	%xmm7, %xmm6, %xmm5 # xmm5 = xmm6[0],xmm7[0]
	vmulpd	%xmm5, %xmm3, %xmm3
	vsubpd	%xmm3, %xmm9, %xmm11
	vunpcklpd	%xmm6, %xmm6, %xmm5 # xmm5 = xmm6[0,0]
	vmovsd	224(%rsp), %xmm3
	vunpcklpd	%xmm3, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm3[0]
	vmulpd	%xmm0, %xmm5, %xmm9
	vmovsd	200(%rsp), %xmm5
	vunpcklpd	%xmm4, %xmm12, %xmm4 # xmm4 = xmm12[0],xmm4[0]
	vunpcklpd	%xmm5, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm5[0]
	vmulpd	%xmm0, %xmm4, %xmm0
	vmovsd	176(%rsp), %xmm4
	vsubpd	%xmm0, %xmm9, %xmm13
	vunpcklpd	%xmm5, %xmm4, %xmm0 # xmm0 = xmm4[0],xmm5[0]
	vmulpd	%xmm0, %xmm10, %xmm0
	vunpcklpd	%xmm6, %xmm1, %xmm6 # xmm6 = xmm1[0],xmm6[0]
	vunpcklpd	%xmm4, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm4[0]
	vmulpd	%xmm2, %xmm6, %xmm6
	vsubpd	%xmm6, %xmm0, %xmm10
	vpermilpd	$0, %xmm12, %xmm0 # xmm0 = xmm12[0,0]
	vpermilpd	$0, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vunpcklpd	%xmm7, %xmm14, %xmm6 # xmm6 = xmm14[0],xmm7[0]
	vpermilpd	$0, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vunpcklpd	%xmm3, %xmm5, %xmm3 # xmm3 = xmm5[0],xmm3[0]
	vpermilpd	$0, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vpermilpd	$0, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vmulpd	%xmm3, %xmm6, %xmm3
	vmulpd	%xmm2, %xmm8, %xmm2
	vsubpd	%xmm2, %xmm3, %xmm6
	vmulpd	%xmm4, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm7, %xmm2
	vsubpd	%xmm2, %xmm0, %xmm5
	vpbroadcastq	%xmm11, %xmm0
	vmulpd	%xmm4, %xmm0, %xmm0
	vunpckhpd	%xmm13, %xmm13, %xmm2 # xmm2 = xmm13[1,1]
	vpbroadcastq	%xmm2, %xmm2
	vmulpd	%xmm2, %xmm7, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpbroadcastq	%xmm6, %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm9
	vmovapd	.LCPI9_1(%rip), %xmm14
	vdivpd	%xmm9, %xmm14, %xmm1
	vpermilpd	$3, %xmm1, %xmm4 # xmm4 = xmm1[1,1]
	vmulpd	%xmm4, %xmm11, %xmm11
	vmovdqa	80(%rsp), %xmm0         # 16-byte Reload
	vpextrq	$1, %xmm0, %rax
	vmovapd	%xmm11, (%rax)
	vmulpd	%xmm4, %xmm13, %xmm12
	vmovapd	%xmm12, 192(%rsp)
	vmulpd	%xmm4, %xmm10, %xmm13
	vmovapd	%xmm13, 208(%rsp)
	vmulpd	%xmm4, %xmm6, %xmm4
	vmovapd	%xmm4, 224(%rsp)
	vmulpd	%xmm5, %xmm1, %xmm8
	vmovapd	%xmm8, 240(%rsp)
	vxorpd	%xmm10, %xmm10, %xmm10
	vmovapd	.LCPI9_0(%rip), %xmm6
	vmovapd	%xmm6, %xmm1
	vmovapd	%xmm6, %xmm5
	vxorpd	%xmm7, %xmm7, %xmm7
	jmp	.LBB9_4
	.align	16, 0x90
.LBB9_5:                                # %for.cond31.preheader.for.cond31.preheader_crit_edge
                                        #   in Loop: Header=BB9_4 Depth=1
	vpextrq	$1, %xmm7, %rax
	vmovddup	256(%rsp,%rax,8), %xmm5
	vmovddup	288(%rsp,%rax,8), %xmm1
	vmovddup	320(%rsp,%rax,8), %xmm6
.LBB9_4:                                # %for.cond31.preheader
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm7, %rax
	vpbroadcastq	%xmm11, %xmm2
	vmulpd	%xmm5, %xmm2, %xmm2
	vaddpd	%xmm10, %xmm2, %xmm2
	vunpckhpd	%xmm12, %xmm12, %xmm0 # xmm0 = xmm12[1,1]
	vpbroadcastq	%xmm0, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vpbroadcastq	%xmm4, %xmm2
	vmulpd	%xmm6, %xmm2, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm0
	vunpckhpd	%xmm11, %xmm11, %xmm2 # xmm2 = xmm11[1,1]
	vpbroadcastq	%xmm2, %xmm2
	vmulpd	%xmm5, %xmm2, %xmm2
	vaddpd	%xmm10, %xmm2, %xmm2
	vpbroadcastq	%xmm13, %xmm3
	vmulpd	%xmm1, %xmm3, %xmm3
	vaddpd	%xmm2, %xmm3, %xmm2
	vunpckhpd	%xmm4, %xmm4, %xmm3 # xmm3 = xmm4[1,1]
	vpbroadcastq	%xmm3, %xmm3
	vmulpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm2, %xmm3, %xmm2
	vpbroadcastq	%xmm12, %xmm3
	vmulpd	%xmm5, %xmm3, %xmm3
	vaddpd	%xmm10, %xmm3, %xmm3
	vunpckhpd	%xmm13, %xmm13, %xmm5 # xmm5 = xmm13[1,1]
	vpbroadcastq	%xmm5, %xmm5
	vmulpd	%xmm1, %xmm5, %xmm1
	vaddpd	%xmm3, %xmm1, %xmm1
	vmulpd	%xmm6, %xmm8, %xmm3
	vaddpd	%xmm1, %xmm3, %xmm1
	vmovupd	%xmm0, 256(%rsp,%rax,8)
	vmovupd	%xmm2, 288(%rsp,%rax,8)
	vmovupd	%xmm1, 320(%rsp,%rax,8)
	vpaddq	.LCPI9_2(%rip), %xmm7, %xmm7
	vpcmpeqq	.LCPI9_4(%rip), %xmm7, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB9_5
# BB#6:                                 # %for.end73
	vdivpd	.LCPI9_5(%rip), %xmm9, %xmm6
	vpxor	%xmm0, %xmm0, %xmm0
	vcmpnlepd	%xmm0, %xmm6, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB9_7
.LBB9_8:                                # %if.end
	vmovapd	%xmm6, 16(%rsp)         # 16-byte Spill
	vmovddup	(%r15), %xmm0
	vmovddup	8(%r15), %xmm1
	vdivpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	.LCPI9_6(%rip), %xmm0, %xmm2
	vmulpd	.LCPI9_7(%rip), %xmm2, %xmm2
	vaddpd	.LCPI9_0(%rip), %xmm0, %xmm0
	vdivpd	%xmm0, %xmm2, %xmm0
	vmovddup	16(%r15), %xmm2
	vmovapd	.LCPI9_8(%rip), %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm1, %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm14, %xmm0, %xmm2
	vmulpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm3, %xmm2, %xmm4
	vmulpd	%xmm3, %xmm0, %xmm3
	vsubpd	%xmm3, %xmm14, %xmm3
	vmulpd	%xmm3, %xmm4, %xmm5
	vdivpd	%xmm5, %xmm1, %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vmovapd	%xmm5, 144(%rsp)        # 16-byte Spill
	vmulpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm3, %xmm2, %xmm2
	vdivpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm0, %xmm6, %xmm0
	vmovapd	%xmm0, 80(%rsp)         # 16-byte Spill
	vdivpd	%xmm4, %xmm1, %xmm0
	vmulpd	%xmm0, %xmm6, %xmm0
	vmovapd	%xmm0, 128(%rsp)        # 16-byte Spill
	vpcmpeqd	%xmm0, %xmm0, %xmm0
	vmovdqa	.LCPI9_9(%rip), %xmm7
	vmovdqa	.LCPI9_10(%rip), %xmm12
	vmovdqa	.LCPI9_2(%rip), %xmm10
	vmovdqa	%xmm10, 112(%rsp)       # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_3(%rip), %xmm6
	.align	16, 0x90
.LBB9_9:                                # %for.cond95.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_10 Depth 2
                                        #       Child Loop BB9_11 Depth 3
	vmovapd	%xmm2, 96(%rsp)         # 16-byte Spill
	vmovdqa	%xmm0, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm2, %rax
	vxorpd	%xmm8, %xmm8, %xmm8
	.align	16, 0x90
.LBB9_10:                               # %for.cond102.preheader.lr.ph
                                        #   Parent Loop BB9_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_11 Depth 3
	vmovapd	%xmm8, 64(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm8, %rdx
	vpaddq	%xmm10, %xmm0, %xmm0
	vmovdqa	%xmm0, 48(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm0, %rcx
	shlq	$5, %rdx
	leaq	256(%rsp,%rdx), %r8
	vmovddup	(%r8,%rax,8), %xmm0
	vmovapd	%xmm0, 160(%rsp)        # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm7, %xmm5
	.align	16, 0x90
.LBB9_11:                               # %for.cond102.preheader
                                        #   Parent Loop BB9_9 Depth=1
                                        #     Parent Loop BB9_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpand	%xmm7, %xmm2, %xmm1
	vpextrq	$1, %xmm0, %rsi
	vpand	%xmm7, %xmm0, %xmm2
	vpextrq	$1, %xmm5, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm3
	vmovq	%xmm5, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm13 # xmm13 = xmm4[0],xmm3[0]
	vpaddq	%xmm10, %xmm13, %xmm3
	vpextrq	$1, %xmm3, %rbx
	vmovddup	256(%rsp,%rsi,8), %xmm15
	vmovapd	160(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm15, %xmm3, %xmm11
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB9_12
# BB#14:                                # %for.cond102.preheader.split.us
                                        #   in Loop: Header=BB9_11 Depth=3
	vpand	%xmm7, %xmm8, %xmm1
	vpcmpeqq	.LCPI9_20, %xmm1, %xmm2
	vmovdqa	%xmm6, %xmm14
	vptest	%xmm2, %xmm2
	je	.LBB9_15
# BB#16:                                # %if.then116.us
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	256(%rsp,%rax,8), %xmm2
	vmulpd	%xmm2, %xmm15, %xmm2
	vmovddup	288(%rsp,%rax,8), %xmm6
	vmovddup	288(%rsp,%rsi,8), %xmm9
	vmulpd	%xmm9, %xmm6, %xmm6
	vaddpd	%xmm6, %xmm2, %xmm2
	vmovddup	320(%rsp,%rax,8), %xmm6
	vmovddup	320(%rsp,%rsi,8), %xmm7
	vmulpd	%xmm7, %xmm6, %xmm6
	vaddpd	%xmm6, %xmm2, %xmm2
	vmovapd	128(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm2, %xmm3, %xmm2
	jmp	.LBB9_17
	.align	16, 0x90
.LBB9_12:                               # %for.cond102.preheader.for.cond102.preheader.split_crit_edge
                                        #   in Loop: Header=BB9_11 Depth=3
	leaq	(%r8,%rsi,8), %rdi
	vpand	%xmm7, %xmm8, %xmm8
	vmovddup	256(%rsp,%rax,8), %xmm14
	vpcmpeqq	.LCPI9_20, %xmm8, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB9_19
# BB#13:                                # %if.then116
                                        #   in Loop: Header=BB9_11 Depth=3
	vmulpd	%xmm14, %xmm15, %xmm1
	vmovddup	288(%rsp,%rax,8), %xmm2
	vmovddup	288(%rsp,%rsi,8), %xmm9
	vmulpd	%xmm9, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovddup	320(%rsp,%rax,8), %xmm2
	vmovddup	320(%rsp,%rsi,8), %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovapd	144(%rsp), %xmm2        # 16-byte Reload
	jmp	.LBB9_20
	.align	16, 0x90
.LBB9_15:                               # %for.cond102.preheader.split.us.if.end158.us_crit_edge
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	288(%rsp,%rsi,8), %xmm9
	vpxor	%xmm2, %xmm2, %xmm2
.LBB9_17:                               # %if.end158.us
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovapd	144(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm11, %xmm3, %xmm6
	leaq	(%rcx,%rcx,2), %rdx
	shlq	$5, %rdx
	addq	%r12, %rdx
	vmovddup	(%rdx,%rbx,8), %xmm7
	vaddpd	%xmm7, %xmm6, %xmm6
	vaddpd	%xmm6, %xmm2, %xmm2
	vmovupd	%xmm2, (%rdx,%rbx,8)
	vmovdqa	%xmm12, %xmm4
	vpaddq	%xmm4, %xmm13, %xmm2
	vpextrq	$1, %xmm2, %rdi
	vmovapd	160(%rsp), %xmm2        # 16-byte Reload
	vmulpd	%xmm9, %xmm2, %xmm2
	vpcmpeqq	%xmm10, %xmm1, %xmm6
	vmovapd	%xmm8, %xmm11
	vptest	%xmm6, %xmm6
	je	.LBB9_18
# BB#52:                                # %if.then116.us.1
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	256(%rsp,%rax,8), %xmm6
	vmulpd	%xmm6, %xmm15, %xmm6
	vmovddup	288(%rsp,%rax,8), %xmm7
	vmulpd	%xmm7, %xmm9, %xmm7
	vaddpd	%xmm7, %xmm6, %xmm8
	vmovddup	320(%rsp,%rax,8), %xmm6
	vmovddup	320(%rsp,%rsi,8), %xmm7
	vmulpd	%xmm7, %xmm6, %xmm6
	vaddpd	%xmm6, %xmm8, %xmm6
	vmovapd	128(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm6, %xmm3, %xmm6
	jmp	.LBB9_53
	.align	16, 0x90
.LBB9_19:                               # %if.else145
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	(%rdi), %xmm1
	vmulpd	%xmm1, %xmm14, %xmm1
	vmovddup	288(%rsp,%rsi,8), %xmm9
	vmovapd	80(%rsp), %xmm2         # 16-byte Reload
.LBB9_20:                               # %if.end158
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovdqa	%xmm6, %xmm10
	vmovapd	128(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm1
	vmulpd	%xmm2, %xmm11, %xmm2
	leaq	(%rcx,%rcx,2), %rdx
	shlq	$5, %rdx
	addq	%r12, %rdx
	vmovddup	(%rdx,%rbx,8), %xmm3
	vaddpd	%xmm2, %xmm3, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovupd	%xmm1, (%rdx,%rbx,8)
	vmovdqa	%xmm12, %xmm4
	vpaddq	%xmm4, %xmm13, %xmm1
	vpextrq	$1, %xmm1, %rbx
	vmovapd	160(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm9, %xmm1, %xmm11
	vpcmpeqq	.LCPI9_2(%rip), %xmm8, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB9_21
# BB#47:                                # %if.then116.1
                                        #   in Loop: Header=BB9_11 Depth=3
	vmulpd	%xmm14, %xmm15, %xmm1
	vmovddup	288(%rsp,%rax,8), %xmm3
	vmulpd	%xmm3, %xmm9, %xmm6
	vaddpd	%xmm6, %xmm1, %xmm1
	vmovddup	320(%rsp,%rax,8), %xmm6
	vmovddup	320(%rsp,%rsi,8), %xmm7
	vmulpd	%xmm7, %xmm6, %xmm6
	vaddpd	%xmm6, %xmm1, %xmm1
	vmovapd	144(%rsp), %xmm6        # 16-byte Reload
	jmp	.LBB9_48
	.align	16, 0x90
.LBB9_18:                               # %if.end158.us.if.end158.us.1_crit_edge
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	320(%rsp,%rsi,8), %xmm7
	vpxor	%xmm6, %xmm6, %xmm6
.LBB9_53:                               # %if.end158.us.1
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovapd	144(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm2, %xmm3, %xmm2
	vmovddup	(%rdx,%rdi,8), %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm6, %xmm2
	vmovupd	%xmm2, (%rdx,%rdi,8)
	vmovdqa	%xmm14, %xmm6
	vpaddq	%xmm6, %xmm13, %xmm2
	vpextrq	$1, %xmm2, %rsi
	vmovapd	160(%rsp), %xmm2        # 16-byte Reload
	vmulpd	%xmm7, %xmm2, %xmm2
	vpcmpeqq	%xmm4, %xmm1, %xmm3
	vpxor	%xmm1, %xmm1, %xmm1
	vptest	%xmm3, %xmm3
	vmovapd	%xmm11, %xmm8
	je	.LBB9_55
# BB#54:                                # %if.then116.us.2
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	256(%rsp,%rax,8), %xmm1
	vmulpd	%xmm1, %xmm15, %xmm1
	vmovddup	288(%rsp,%rax,8), %xmm3
	vmulpd	%xmm3, %xmm9, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	320(%rsp,%rax,8), %xmm3
	vmulpd	%xmm3, %xmm7, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovapd	128(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm1
.LBB9_55:                               # %if.end158.us.2
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovapd	144(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm2, %xmm3, %xmm2
	vmovddup	(%rdx,%rsi,8), %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	jmp	.LBB9_56
	.align	16, 0x90
.LBB9_21:                               # %if.else145.1
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	288(%rsp,%rax,8), %xmm3
	vmovddup	(%rdi), %xmm1
	vmulpd	%xmm1, %xmm3, %xmm1
	vmovddup	320(%rsp,%rsi,8), %xmm7
	vmovapd	80(%rsp), %xmm6         # 16-byte Reload
.LBB9_48:                               # %if.end158.1
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovapd	128(%rsp), %xmm2        # 16-byte Reload
	vmulpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm6, %xmm11, %xmm2
	vmovddup	(%rdx,%rbx,8), %xmm6
	vaddpd	%xmm2, %xmm6, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovupd	%xmm1, (%rdx,%rbx,8)
	vmovdqa	%xmm10, %xmm6
	vpaddq	%xmm6, %xmm13, %xmm1
	vpextrq	$1, %xmm1, %rsi
	vmovapd	160(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm7, %xmm1, %xmm2
	vpcmpeqq	%xmm4, %xmm8, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB9_49
# BB#50:                                # %if.then116.2
                                        #   in Loop: Header=BB9_11 Depth=3
	vmulpd	%xmm14, %xmm15, %xmm1
	vmulpd	%xmm3, %xmm9, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovddup	320(%rsp,%rax,8), %xmm3
	vmulpd	%xmm3, %xmm7, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovapd	144(%rsp), %xmm3        # 16-byte Reload
	jmp	.LBB9_51
	.align	16, 0x90
.LBB9_49:                               # %if.else145.2
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovddup	320(%rsp,%rax,8), %xmm1
	vmovddup	(%rdi), %xmm3
	vmulpd	%xmm3, %xmm1, %xmm1
	vmovapd	80(%rsp), %xmm3         # 16-byte Reload
.LBB9_51:                               # %if.end158.2
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovdqa	.LCPI9_2(%rip), %xmm10
	vmovapd	64(%rsp), %xmm8         # 16-byte Reload
	vmovapd	128(%rsp), %xmm7        # 16-byte Reload
	vmulpd	%xmm1, %xmm7, %xmm1
	vmulpd	%xmm3, %xmm2, %xmm2
	vmovddup	(%rdx,%rsi,8), %xmm3
	vaddpd	%xmm2, %xmm3, %xmm2
.LBB9_56:                               # %for.inc172
                                        #   in Loop: Header=BB9_11 Depth=3
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovupd	%xmm1, (%rdx,%rsi,8)
# BB#22:                                # %for.inc172
                                        #   in Loop: Header=BB9_11 Depth=3
	vmovdqa	%xmm4, %xmm12
	vpaddq	%xmm6, %xmm5, %xmm5
	vpaddq	%xmm10, %xmm0, %xmm0
	vmovdqa	.LCPI9_9(%rip), %xmm7
	vpand	%xmm7, %xmm0, %xmm1
	vmovdqa	112(%rsp), %xmm2        # 16-byte Reload
	vpand	%xmm7, %xmm2, %xmm2
	vpcmpeqq	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	vmovdqa	96(%rsp), %xmm2         # 16-byte Reload
	je	.LBB9_11
# BB#23:                                # %for.inc175
                                        #   in Loop: Header=BB9_10 Depth=2
	vpaddq	%xmm10, %xmm8, %xmm8
	vpcmpeqq	%xmm6, %xmm8, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	48(%rsp), %xmm0         # 16-byte Reload
	je	.LBB9_10
# BB#24:                                # %for.inc178
                                        #   in Loop: Header=BB9_9 Depth=1
	vmovdqa	32(%rsp), %xmm1         # 16-byte Reload
	vpaddq	%xmm6, %xmm1, %xmm1
	vpaddq	%xmm10, %xmm2, %xmm2
	vmovdqa	112(%rsp), %xmm0        # 16-byte Reload
	vpaddq	%xmm10, %xmm0, %xmm0
	vmovdqa	%xmm0, 112(%rsp)        # 16-byte Spill
	vmovdqa	.LCPI9_4(%rip), %xmm5
	vpcmpeqq	%xmm5, %xmm2, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	%xmm1, %xmm0
	je	.LBB9_9
# BB#25:                                # %for.inc208
	vmovddup	16(%r15), %xmm0
	vmovapd	16(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmulpd	.LCPI9_11(%rip), %xmm0, %xmm0
	vmovupd	%xmm0, (%r14)
	vmovupd	%xmm0, 8(%r14)
	vmovupd	%xmm0, 16(%r14)
	vmovupd	%xmm0, 24(%r14)
	vmovupd	%xmm0, 32(%r14)
	vmovupd	%xmm0, 40(%r14)
	vmovupd	%xmm0, 48(%r14)
	vmovupd	%xmm0, 56(%r14)
	vmovupd	%xmm0, 64(%r14)
	vmovupd	%xmm0, 72(%r14)
	vmovupd	%xmm0, 80(%r14)
	vmovupd	%xmm0, 88(%r14)
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_2(%rip), %xmm0
	vmovdqa	.LCPI9_9(%rip), %xmm1
	vxorpd	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB9_26:                               # %for.body196.1
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm3, %rax
	vmovddup	96(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 8(%r12,%rax)
	vpaddq	%xmm0, %xmm3, %xmm3
	vpand	%xmm1, %xmm3, %xmm4
	vpcmpeqq	%xmm12, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_26
	.align	16, 0x90
.LBB9_27:                               # %for.body196.2
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	192(%r12,%rax,8), %xmm3
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm3, 16(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm3
	vpcmpeqq	%xmm6, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB9_27
# BB#28:
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB9_29:                               # %for.body196.3
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	288(%r12,%rax,8), %xmm3
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm3, 24(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm3
	vpcmpeqq	%xmm5, %xmm3, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB9_29
# BB#30:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_12(%rip), %xmm3
	.align	16, 0x90
.LBB9_31:                               # %for.body196.4
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	384(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 32(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_31
# BB#32:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_13(%rip), %xmm3
	.align	16, 0x90
.LBB9_33:                               # %for.body196.5
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	480(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 40(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_33
# BB#34:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_14(%rip), %xmm3
	.align	16, 0x90
.LBB9_35:                               # %for.body196.6
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	576(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 48(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_35
# BB#36:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_15(%rip), %xmm3
	.align	16, 0x90
.LBB9_37:                               # %for.body196.7
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	672(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 56(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_37
# BB#38:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_16(%rip), %xmm3
	.align	16, 0x90
.LBB9_39:                               # %for.body196.8
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	768(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 64(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_39
# BB#40:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_17(%rip), %xmm3
	.align	16, 0x90
.LBB9_41:                               # %for.body196.9
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	864(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 72(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_41
# BB#42:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_18(%rip), %xmm3
	.align	16, 0x90
.LBB9_43:                               # %for.body196.10
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	960(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 80(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_43
# BB#44:
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI9_19(%rip), %xmm3
	.align	16, 0x90
.LBB9_45:                               # %for.body196.11
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm2, %rax
	vmovddup	1056(%r12,%rax,8), %xmm4
	leaq	(%rax,%rax,2), %rax
	shlq	$5, %rax
	vmovupd	%xmm4, 88(%r12,%rax)
	vpaddq	%xmm0, %xmm2, %xmm2
	vpand	%xmm1, %xmm2, %xmm4
	vpcmpeqq	%xmm3, %xmm4, %xmm4
	vptest	%xmm4, %xmm4
	je	.LBB9_45
# BB#46:                                # %for.inc208.11
	addq	$360, %rsp              # imm = 0x168
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
.LBB9_7:                                # %if.then
	vunpckhpd	%xmm6, %xmm6, %xmm0 # xmm0 = xmm6[1,1]
	movq	stderr(%rip), %rdi
	movl	$.L.str20, %esi
	movb	$1, %al
	vmovapd	%xmm6, 16(%rsp)         # 16-byte Spill
	callq	fprintf
	vmovapd	.LCPI9_1(%rip), %xmm14
	vmovapd	16(%rsp), %xmm6         # 16-byte Reload
	jmp	.LBB9_8
.Ltmp91:
	.size	element_matrices, .Ltmp91-element_matrices
	.cfi_endproc

	.globl	vv12x12
	.align	16, 0x90
	.type	vv12x12,@function
vv12x12:                                # @vv12x12
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	(%rdi), %xmm0
	vmovddup	(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, (%rdx)
	vmovddup	8(%rdi), %xmm0
	vmovddup	8(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 8(%rdx)
	vmovddup	16(%rdi), %xmm0
	vmovddup	16(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%rdx)
	vmovddup	24(%rdi), %xmm0
	vmovddup	24(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 24(%rdx)
	vmovddup	32(%rdi), %xmm0
	vmovddup	32(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 32(%rdx)
	vmovddup	40(%rdi), %xmm0
	vmovddup	40(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 40(%rdx)
	vmovddup	48(%rdi), %xmm0
	vmovddup	48(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 48(%rdx)
	vmovddup	56(%rdi), %xmm0
	vmovddup	56(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 56(%rdx)
	vmovddup	64(%rdi), %xmm0
	vmovddup	64(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 64(%rdx)
	vmovddup	72(%rdi), %xmm0
	vmovddup	72(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 72(%rdx)
	vmovddup	80(%rdi), %xmm0
	vmovddup	80(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 80(%rdx)
	vmovddup	88(%rdi), %xmm0
	vmovddup	88(%rsi), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, 88(%rdx)
	ret
.Ltmp92:
	.size	vv12x12, .Ltmp92-vv12x12
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI11_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI11_1:
	.quad	12                      # 0xc
	.quad	12                      # 0xc
.LCPI11_2:
	.zero	16
	.text
	.globl	mv12x12
	.align	16, 0x90
	.type	mv12x12,@function
mv12x12:                                # @mv12x12
	.cfi_startproc
# BB#0:                                 # %entry
	vmovq	%rsi, %xmm4
	vmovddup	(%rsi), %xmm8
	vmovddup	8(%rsi), %xmm9
	vmovddup	16(%rsi), %xmm10
	vmovddup	24(%rsi), %xmm11
	vmovddup	32(%rsi), %xmm13
	vmovddup	40(%rsi), %xmm14
	vmovddup	48(%rsi), %xmm6
	vmovddup	56(%rsi), %xmm7
	vmovddup	64(%rsi), %xmm0
	vmovddup	72(%rsi), %xmm1
	vmovddup	80(%rsi), %xmm2
	vmovddup	88(%rsi), %xmm3
	vpxor	%xmm15, %xmm15, %xmm15
	vmovlhps	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vmovaps	%xmm4, -120(%rsp)       # 16-byte Spill
	leaq	-104(%rsp), %rax
	.align	16, 0x90
.LBB11_1:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm15, %rcx
	leaq	(%rcx,%rcx,2), %rdx
	shlq	$5, %rdx
	vmovddup	(%rdi,%rdx), %xmm12
	vmulpd	%xmm12, %xmm8, %xmm4
	vmovddup	8(%rdi,%rdx), %xmm5
	vaddpd	.LCPI11_2, %xmm4, %xmm4
	vmulpd	%xmm5, %xmm9, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	16(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm10, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	24(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm11, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	32(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm13, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	40(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm14, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	48(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm6, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	56(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm7, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	64(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm0, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	72(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm1, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	80(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm2, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovddup	88(%rdi,%rdx), %xmm5
	vmulpd	%xmm5, %xmm3, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vpaddq	.LCPI11_0(%rip), %xmm15, %xmm15
	vpcmpeqq	.LCPI11_1(%rip), %xmm15, %xmm5
	vptest	%xmm5, %xmm5
	vmovupd	%xmm4, -104(%rsp,%rcx,8)
	je	.LBB11_1
# BB#2:                                 # %for.cond15.preheader
	vmovdqa	-120(%rsp), %xmm0       # 16-byte Reload
	vpextrq	$1, %xmm0, %rcx
	vmovups	(%rax), %ymm0
	vmovups	32(%rax), %ymm1
	vmovups	64(%rax), %ymm2
	vmovups	%ymm2, 64(%rcx)
	vmovups	%ymm1, 32(%rcx)
	vmovups	%ymm0, (%rcx)
	ret
.Ltmp93:
	.size	mv12x12, .Ltmp93-mv12x12
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI12_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI12_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	smvp
	.align	16, 0x90
	.type	smvp,@function
smvp:                                   # @smvp
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp99:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp100:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp101:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp102:
	.cfi_def_cfa_offset 40
.Ltmp103:
	.cfi_offset %rbx, -40
.Ltmp104:
	.cfi_offset %r12, -32
.Ltmp105:
	.cfi_offset %r14, -24
.Ltmp106:
	.cfi_offset %r15, -16
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm8
	vmovdqa	%xmm8, -88(%rsp)        # 16-byte Spill
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpgtq	%xmm4, %xmm8, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB12_7
# BB#1:
	vmovdqa	.LCPI12_0(%rip), %xmm2
	.align	16, 0x90
.LBB12_2:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_4 Depth 2
	vpextrq	$1, %xmm4, %r10
	vmovd	(%rcx,%r10,4), %xmm0
	vpbroadcastq	%xmm0, %xmm13
	vpaddq	%xmm2, %xmm4, %xmm4
	vpextrq	$1, %xmm4, %rax
	vmovd	(%rcx,%rax,4), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, -56(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm9 # xmm9 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm13, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm13, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm0, %rax
	movq	(%rsi,%rax,8), %r11
	movq	(%r8,%r10,8), %r14
	vmovsd	(%r14), %xmm5
	vmovsd	8(%r14), %xmm6
	vpermilpd	$0, %xmm5, %xmm12 # xmm12 = xmm5[0,0]
	vpermilpd	$0, %xmm6, %xmm0 # xmm0 = xmm6[0,0]
	vmovsd	16(%r14), %xmm7
	vpermilpd	$0, %xmm7, %xmm1 # xmm1 = xmm7[0,0]
	movq	(%r11), %rax
	movq	8(%r11), %rbx
	vmovsd	(%rax), %xmm3
	vmovsd	8(%rax), %xmm14
	vmovhpd	(%rbx), %xmm3, %xmm3
	vunpcklpd	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vmulpd	%xmm5, %xmm3, %xmm3
	vmovhpd	8(%rbx), %xmm14, %xmm5
	vunpcklpd	%xmm6, %xmm6, %xmm6 # xmm6 = xmm6[0,0]
	vmulpd	%xmm6, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm3, %xmm3
	vmovsd	16(%rax), %xmm5
	vmovhpd	16(%rbx), %xmm5, %xmm5
	vunpcklpd	%xmm7, %xmm7, %xmm6 # xmm6 = xmm7[0,0]
	vmulpd	%xmm6, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm3, %xmm14
	movq	16(%r11), %rax
	vmovddup	(%rax), %xmm3
	vmulpd	%xmm3, %xmm12, %xmm3
	vmovddup	8(%rax), %xmm6
	vmulpd	%xmm6, %xmm0, %xmm6
	vaddpd	%xmm6, %xmm3, %xmm3
	vmovddup	16(%rax), %xmm6
	vmulpd	%xmm6, %xmm1, %xmm6
	vaddpd	%xmm6, %xmm3, %xmm15
	vpaddq	%xmm2, %xmm13, %xmm7
	vpextrq	$1, %xmm7, %r11
	movslq	%r11d, %rax
	vmovq	%rax, %xmm13
	vmovq	%xmm7, %rax
	movslq	%eax, %rbx
	vmovq	%rbx, %xmm3
	vpunpcklqdq	%xmm13, %xmm3, %xmm3 # xmm3 = xmm3[0],xmm13[0]
	vpcmpgtq	%xmm3, %xmm9, %xmm3
	vptest	%xmm3, %xmm3
	je	.LBB12_6
# BB#3:                                 # %while.body.lr.ph
                                        #   in Loop: Header=BB12_2 Depth=1
	vmovdqa	%xmm4, -72(%rsp)        # 16-byte Spill
	movslq	%r11d, %rbx
	vmovapd	%xmm12, -24(%rsp)       # 16-byte Spill
	vmovapd	%xmm0, -40(%rsp)        # 16-byte Spill
	vmovq	%rbx, %xmm0
	cltq
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm0, %xmm3, %xmm13 # xmm13 = xmm3[0],xmm0[0]
	vmovdqa	%xmm2, %xmm9
	vmovapd	%xmm1, %xmm12
	jmp	.LBB12_4
	.align	16, 0x90
.LBB12_8:                               # %while.body.while.body_crit_edge
                                        #   in Loop: Header=BB12_4 Depth=2
	vpaddq	%xmm2, %xmm13, %xmm13
	vmovddup	(%r14), %xmm0
	vmovapd	%xmm0, -24(%rsp)        # 16-byte Spill
	vmovddup	8(%r14), %xmm0
	vmovapd	%xmm0, -40(%rsp)        # 16-byte Spill
	vmovddup	16(%r14), %xmm12
	vmovdqa	%xmm2, %xmm9
.LBB12_4:                               # %while.body
                                        #   Parent Loop BB12_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm13, %rax
	vmovd	(%rdx,%rax,4), %xmm4
	vpbroadcastq	%xmm4, %xmm4
	movq	(%rsi,%rax,8), %r11
	movq	(%r11), %rbx
	movq	8(%r11), %r12
	vmovsd	(%rbx), %xmm8
	vmovsd	8(%rbx), %xmm1
	vpextrq	$1, %xmm4, %rax
	cltq
	vmovq	%rax, %xmm2
	vmovq	%xmm4, %rax
	cltq
	vmovq	%rax, %xmm4
	vpunpcklqdq	%xmm2, %xmm4, %xmm2 # xmm2 = xmm4[0],xmm2[0]
	vpextrq	$1, %xmm2, %r15
	movq	(%r8,%r15,8), %rax
	vmovsd	(%rax), %xmm2
	vmovsd	8(%rax), %xmm4
	vmovsd	16(%rax), %xmm3
	vmovsd	(%r12), %xmm5
	vunpcklpd	%xmm5, %xmm8, %xmm10 # xmm10 = xmm8[0],xmm5[0]
	vunpcklpd	%xmm2, %xmm2, %xmm11 # xmm11 = xmm2[0,0]
	vmulpd	%xmm11, %xmm10, %xmm6
	vmovhpd	8(%r12), %xmm1, %xmm1
	vunpcklpd	%xmm4, %xmm4, %xmm0 # xmm0 = xmm4[0,0]
	vmulpd	%xmm0, %xmm1, %xmm0
	vaddpd	%xmm0, %xmm6, %xmm0
	vmovsd	16(%rbx), %xmm1
	vmovhpd	16(%r12), %xmm1, %xmm1
	vunpcklpd	%xmm3, %xmm3, %xmm6 # xmm6 = xmm3[0,0]
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$0, %xmm2, %xmm1 # xmm1 = xmm2[0,0]
	vpermilpd	$0, %xmm4, %xmm2 # xmm2 = xmm4[0,0]
	vpermilpd	$0, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vaddpd	%xmm0, %xmm14, %xmm14
	movq	16(%r11), %rax
	vmovddup	8(%rax), %xmm0
	vmulpd	%xmm0, %xmm2, %xmm0
	vmovddup	(%rax), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovddup	16(%rax), %xmm1
	vmulpd	%xmm1, %xmm3, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm15, %xmm15
	vpermilpd	$0, %xmm8, %xmm0 # xmm0 = xmm8[0,0]
	vmovapd	-24(%rsp), %xmm1        # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vpermilpd	$0, %xmm5, %xmm1 # xmm1 = xmm5[0,0]
	vmovapd	-40(%rsp), %xmm3        # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm12, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	movq	(%r9,%r15,8), %rdi
	vmovddup	(%rdi), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, (%rdi)
	vmovddup	8(%rbx), %xmm0
	vmovddup	(%r14), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovddup	8(%r12), %xmm1
	vmovddup	8(%r14), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	8(%rax), %xmm1
	vmovddup	16(%r14), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	8(%rdi), %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, 8(%rdi)
	vmovddup	16(%rbx), %xmm0
	vmovddup	(%r14), %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovddup	16(%r12), %xmm1
	vmovddup	8(%r14), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	16(%rax), %xmm1
	vmovddup	16(%r14), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	16(%rdi), %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, 16(%rdi)
	vpaddq	%xmm9, %xmm7, %xmm7
	vmovdqa	.LCPI12_1(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm7, %xmm0
	vmovdqa	-56(%rsp), %xmm1        # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vmovdqa	%xmm9, %xmm2
	je	.LBB12_8
# BB#5:                                 #   in Loop: Header=BB12_2 Depth=1
	vmovdqa	-88(%rsp), %xmm8        # 16-byte Reload
	vmovdqa	-72(%rsp), %xmm4        # 16-byte Reload
.LBB12_6:                               # %while.end
                                        #   in Loop: Header=BB12_2 Depth=1
	movq	(%r9,%r10,8), %rax
	vaddpd	(%rax), %xmm14, %xmm0
	vmovupd	%xmm0, (%rax)
	vmovddup	16(%rax), %xmm0
	vaddpd	%xmm0, %xmm15, %xmm0
	vmovupd	%xmm0, 16(%rax)
	vmovdqa	.LCPI12_1(%rip), %xmm0
	vmovdqa	%xmm0, %xmm1
	vpand	%xmm1, %xmm4, %xmm0
	vpand	%xmm1, %xmm8, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB12_2
.LBB12_7:                               # %for.end
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
.Ltmp107:
	.size	smvp, .Ltmp107-smvp
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI13_0:
	.quad	4618760256179416344     # double 6.283185e+00
	.quad	4618760256179416344     # double 6.283185e+00
	.text
	.globl	phi2
	.align	16, 0x90
	.type	phi2,@function
phi2:                                   # @phi2
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp109:
	.cfi_def_cfa_offset 64
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovddup	Exc+16(%rip), %xmm1
	vcmpnlepd	%xmm1, %xmm0, %xmm3
	vxorpd	%xmm2, %xmm2, %xmm2
	vptest	%xmm3, %xmm3
	jne	.LBB13_2
# BB#1:                                 # %if.then
	vmovapd	.LCPI13_0(%rip), %xmm2
	vdivpd	%xmm1, %xmm2, %xmm3
	vdivpd	%xmm1, %xmm3, %xmm3
	vmovapd	%xmm3, 32(%rsp)         # 16-byte Spill
	vmulpd	%xmm2, %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	vmovapd	(%rsp), %xmm0           # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	sin
	vmovapd	16(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	32(%rsp), %xmm1         # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm2
.LBB13_2:                               # %return
	vunpckhpd	%xmm2, %xmm2, %xmm0 # xmm0 = xmm2[1,1]
	addq	$56, %rsp
	ret
.Ltmp110:
	.size	phi2, .Ltmp110-phi2
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI14_0:
	.quad	4618760256179416344     # double 6.283185e+00
	.quad	4618760256179416344     # double 6.283185e+00
.LCPI14_1:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.text
	.globl	phi1
	.align	16, 0x90
	.type	phi1,@function
phi1:                                   # @phi1
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp112:
	.cfi_def_cfa_offset 48
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovddup	Exc+16(%rip), %xmm1
	vcmpnlepd	%xmm1, %xmm0, %xmm3
	vxorpd	%xmm2, %xmm2, %xmm2
	vptest	%xmm3, %xmm3
	jne	.LBB14_2
# BB#1:                                 # %if.then
	vmulpd	.LCPI14_0(%rip), %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	callq	cos
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	vmovapd	(%rsp), %xmm0           # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	cos
	vmovapd	16(%rsp), %xmm1         # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	.LCPI14_1(%rip), %xmm1
	vsubpd	%xmm0, %xmm1, %xmm0
	vmovddup	Exc+16(%rip), %xmm1
	vdivpd	%xmm1, %xmm0, %xmm2
.LBB14_2:                               # %return
	vunpckhpd	%xmm2, %xmm2, %xmm0 # xmm0 = xmm2[1,1]
	addq	$40, %rsp
	ret
.Ltmp113:
	.size	phi1, .Ltmp113-phi1
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI15_0:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI15_1:
	.quad	4618760256179416344     # double 6.283185e+00
	.quad	4618760256179416344     # double 6.283185e+00
.LCPI15_2:
	.quad	4594902181429758083     # double 1.591549e-01
	.quad	4594902181429758083     # double 1.591549e-01
	.text
	.globl	phi0
	.align	16, 0x90
	.type	phi0,@function
phi0:                                   # @phi0
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp115:
	.cfi_def_cfa_offset 48
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovddup	Exc+16(%rip), %xmm1
	vcmpnlepd	%xmm1, %xmm0, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB15_2
# BB#1:
	vmovapd	.LCPI15_0(%rip), %xmm0
	jmp	.LBB15_3
.LBB15_2:                               # %if.then
	vmulpd	.LCPI15_1(%rip), %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, 16(%rsp)         # 16-byte Spill
	callq	sin
	vmovapd	%xmm0, (%rsp)           # 16-byte Spill
	vmovapd	16(%rsp), %xmm0         # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	callq	sin
	vmovapd	(%rsp), %xmm1           # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovapd	16(%rsp), %xmm1         # 16-byte Reload
	vsubpd	%xmm0, %xmm1, %xmm0
	vmulpd	.LCPI15_2(%rip), %xmm0, %xmm0
.LBB15_3:                               # %return
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	addq	$40, %rsp
	ret
.Ltmp116:
	.size	phi0, .Ltmp116-phi0
	.cfi_endproc

	.globl	shape_ders
	.align	16, 0x90
	.type	shape_ders,@function
shape_ders:                             # @shape_ders
	.cfi_startproc
# BB#0:                                 # %entry
	movabsq	$-4616189618054758400, %rax # imm = 0xBFF0000000000000
	movq	%rax, (%rdi)
	movq	%rax, 32(%rdi)
	movq	%rax, 64(%rdi)
	movabsq	$4607182418800017408, %rax # imm = 0x3FF0000000000000
	movq	%rax, 8(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 72(%rdi)
	movq	$0, 16(%rdi)
	movq	%rax, 48(%rdi)
	movq	$0, 80(%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 56(%rdi)
	movq	%rax, 88(%rdi)
	ret
.Ltmp117:
	.size	shape_ders, .Ltmp117-shape_ders
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI17_0:
	.quad	-4611686018427387904    # double -2.000000e+00
	.quad	-4611686018427387904    # double -2.000000e+00
.LCPI17_1:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI17_2:
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
.LCPI17_3:
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
.LCPI17_4:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.text
	.globl	get_Enu
	.align	16, 0x90
	.type	get_Enu,@function
get_Enu:                                # @get_Enu
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	(%rdi), %xmm0
	vmovddup	8(%rdi), %xmm1
	vdivpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	.LCPI17_0(%rip), %xmm0, %xmm1
	vmulpd	.LCPI17_1(%rip), %xmm1, %xmm1
	vaddpd	.LCPI17_2(%rip), %xmm0, %xmm0
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovupd	%xmm0, (%rdx)
	vmovddup	16(%rdi), %xmm1
	vmulpd	.LCPI17_3(%rip), %xmm1, %xmm1
	vmovddup	8(%rdi), %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm2, %xmm1
	vaddpd	.LCPI17_4(%rip), %xmm0, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovupd	%xmm0, (%rsi)
	ret
.Ltmp118:
	.size	get_Enu, .Ltmp118-get_Enu
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI18_0:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
	.text
	.globl	inv_J
	.align	16, 0x90
	.type	inv_J,@function
inv_J:                                  # @inv_J
	.cfi_startproc
# BB#0:                                 # %entry
	vmovsd	32(%rdi), %xmm9
	vmovsd	16(%rdi), %xmm13
	vmovsd	56(%rdi), %xmm2
	vunpcklpd	%xmm2, %xmm9, %xmm8 # xmm8 = xmm9[0],xmm2[0]
	vmovsd	64(%rdi), %xmm4
	vunpcklpd	%xmm13, %xmm4, %xmm11 # xmm11 = xmm4[0],xmm13[0]
	vmulpd	%xmm11, %xmm8, %xmm10
	vmovsd	8(%rdi), %xmm7
	vunpcklpd	%xmm4, %xmm2, %xmm3 # xmm3 = xmm2[0],xmm4[0]
	vmovsd	40(%rdi), %xmm0
	vunpcklpd	%xmm7, %xmm0, %xmm6 # xmm6 = xmm0[0],xmm7[0]
	vmulpd	%xmm6, %xmm3, %xmm3
	vsubpd	%xmm3, %xmm10, %xmm10
	vunpcklpd	%xmm0, %xmm0, %xmm6 # xmm6 = xmm0[0,0]
	vmovsd	48(%rdi), %xmm3
	vunpcklpd	%xmm3, %xmm7, %xmm5 # xmm5 = xmm7[0],xmm3[0]
	vmulpd	%xmm5, %xmm6, %xmm12
	vmovsd	24(%rdi), %xmm6
	vunpcklpd	%xmm4, %xmm9, %xmm4 # xmm4 = xmm9[0],xmm4[0]
	vunpcklpd	%xmm6, %xmm13, %xmm5 # xmm5 = xmm13[0],xmm6[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovsd	(%rdi), %xmm5
	vsubpd	%xmm4, %xmm12, %xmm12
	vunpcklpd	%xmm6, %xmm5, %xmm4 # xmm4 = xmm5[0],xmm6[0]
	vmulpd	%xmm4, %xmm11, %xmm4
	vunpcklpd	%xmm0, %xmm13, %xmm0 # xmm0 = xmm13[0],xmm0[0]
	vunpcklpd	%xmm5, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm5[0]
	vmulpd	%xmm1, %xmm0, %xmm0
	vsubpd	%xmm0, %xmm4, %xmm0
	vunpcklpd	%xmm7, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm7[0]
	vunpcklpd	%xmm3, %xmm6, %xmm3 # xmm3 = xmm6[0],xmm3[0]
	vmulpd	%xmm3, %xmm2, %xmm2
	vmulpd	%xmm1, %xmm8, %xmm1
	vsubpd	%xmm1, %xmm2, %xmm1
	vpermilpd	$0, %xmm9, %xmm2 # xmm2 = xmm9[0,0]
	vpermilpd	$0, %xmm7, %xmm3 # xmm3 = xmm7[0,0]
	vpermilpd	$0, %xmm6, %xmm4 # xmm4 = xmm6[0,0]
	vpermilpd	$0, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vmulpd	%xmm5, %xmm2, %xmm2
	vmulpd	%xmm4, %xmm3, %xmm4
	vsubpd	%xmm4, %xmm2, %xmm2
	vpbroadcastq	%xmm10, %xmm4
	vmulpd	%xmm5, %xmm4, %xmm4
	vunpckhpd	%xmm12, %xmm12, %xmm5 # xmm5 = xmm12[1,1]
	vpbroadcastq	%xmm5, %xmm5
	vmulpd	%xmm5, %xmm3, %xmm3
	vpermilpd	$0, %xmm13, %xmm5 # xmm5 = xmm13[0,0]
	vaddpd	%xmm3, %xmm4, %xmm3
	vpbroadcastq	%xmm1, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vaddpd	%xmm3, %xmm4, %xmm3
	vmovupd	%xmm3, (%rsi)
	vmovapd	.LCPI18_0(%rip), %xmm4
	vdivpd	%xmm3, %xmm4, %xmm3
	vpermilpd	$3, %xmm3, %xmm4 # xmm4 = xmm3[1,1]
	vmulpd	%xmm4, %xmm10, %xmm5
	vmovupd	%xmm5, (%rdi)
	vmulpd	%xmm4, %xmm12, %xmm5
	vmovupd	%xmm5, 16(%rdi)
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovupd	%xmm0, 32(%rdi)
	vmulpd	%xmm4, %xmm1, %xmm0
	vmovupd	%xmm0, 48(%rdi)
	vmulpd	%xmm2, %xmm3, %xmm0
	vmovupd	%xmm0, 64(%rdi)
	ret
.Ltmp119:
	.size	inv_J, .Ltmp119-inv_J
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI19_0:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
	.text
	.globl	area_triangle
	.align	16, 0x90
	.type	area_triangle,@function
area_triangle:                          # @area_triangle
	.cfi_startproc
# BB#0:                                 # %entry
	vmovddup	(%rdi), %xmm8
	vmovddup	24(%rdi), %xmm1
	vsubpd	%xmm1, %xmm8, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vmovddup	8(%rdi), %xmm3
	vmovddup	32(%rdi), %xmm4
	vsubpd	%xmm4, %xmm3, %xmm5
	vmulpd	%xmm5, %xmm5, %xmm5
	vmovddup	16(%rdi), %xmm6
	vmovddup	40(%rdi), %xmm7
	vsubpd	%xmm7, %xmm6, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm5, %xmm2, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm0
	vsqrtpd	%xmm0, %xmm9
	vmovddup	48(%rdi), %xmm2
	vsubpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vmovddup	56(%rdi), %xmm5
	vsubpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm4, %xmm4, %xmm4
	vmovddup	64(%rdi), %xmm0
	vsubpd	%xmm7, %xmm0, %xmm7
	vmulpd	%xmm7, %xmm7, %xmm7
	vaddpd	%xmm4, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vsqrtpd	%xmm1, %xmm1
	vsubpd	%xmm2, %xmm8, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vsubpd	%xmm5, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm3, %xmm3
	vsubpd	%xmm0, %xmm6, %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vaddpd	%xmm1, %xmm9, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm2
	vmulpd	.LCPI19_0(%rip), %xmm2, %xmm2
	vsubpd	%xmm9, %xmm2, %xmm3
	vmulpd	%xmm3, %xmm2, %xmm3
	vsubpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm3, %xmm1, %xmm1
	vsubpd	%xmm0, %xmm2, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[1,1]
	ret
.Ltmp120:
	.size	area_triangle, .Ltmp120-area_triangle
	.cfi_endproc

	.globl	arch_bail
	.align	16, 0x90
	.type	arch_bail,@function
arch_bail:                              # @arch_bail
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp122:
	.cfi_def_cfa_offset 16
	xorl	%edi, %edi
	callq	exit
.Ltmp123:
	.size	arch_bail, .Ltmp123-arch_bail
	.cfi_endproc

	.globl	arch_info
	.align	16, 0x90
	.type	arch_info,@function
arch_info:                              # @arch_info
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp125:
	.cfi_def_cfa_offset 16
	movl	$10, %edi
	callq	putchar
	movq	progname(%rip), %rsi
	movl	$.L.str21, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.Lstr, %edi
	callq	puts
	movq	progname(%rip), %rsi
	movl	$.L.str23, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.Lstr69, %edi
	callq	puts
	movl	$.Lstr70, %edi
	callq	puts
	movl	$.Lstr71, %edi
	callq	puts
	movl	$.Lstr72, %edi
	popq	%rax
	jmp	puts                    # TAILCALL
.Ltmp126:
	.size	arch_info, .Ltmp126-arch_info
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI22_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI22_1:
	.quad	255                     # 0xff
	.quad	255                     # 0xff
.LCPI22_2:
	.quad	45                      # 0x2d
	.quad	45                      # 0x2d
.LCPI22_3:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	arch_parsecommandline
	.align	16, 0x90
	.type	arch_parsecommandline,@function
arch_parsecommandline:                  # @arch_parsecommandline
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Ltmp128:
	.cfi_def_cfa_offset 16
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm1[0]
	movq	$0, (%rdx)
	vmovdqa	.LCPI22_0(%rip), %xmm1
	vpcmpgtq	%xmm1, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB22_12
# BB#1:
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LCPI22_1(%rip), %xmm8
	vmovdqa	.LCPI22_2(%rip), %xmm4
	vmovdqa	.LCPI22_0(%rip), %xmm5
	vmovdqa	.LCPI22_3(%rip), %xmm6
	.align	16, 0x90
.LBB22_2:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB22_3 Depth 2
	vpextrq	$1, %xmm1, %rax
	movq	(%rsi,%rax,8), %rax
	movzbl	(%rax), %ecx
	vmovd	%ecx, %xmm2
	vpbroadcastq	%xmm2, %xmm2
	vpand	%xmm8, %xmm2, %xmm2
	vpcmpeqq	%xmm4, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	vmovdqa	%xmm5, %xmm7
	je	.LBB22_10
	jmp	.LBB22_3
	.align	16, 0x90
.LBB22_9:                               # %for.inc
                                        #   in Loop: Header=BB22_3 Depth=2
	vpaddq	%xmm5, %xmm7, %xmm7
.LBB22_3:                               # %for.cond4
                                        #   Parent Loop BB22_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpextrq	$1, %xmm7, %rcx
	movzbl	(%rax,%rcx), %edi
	testb	%dil, %dil
	je	.LBB22_10
# BB#4:                                 # %for.cond4
                                        #   in Loop: Header=BB22_3 Depth=2
	cmpb	$81, %dil
	jne	.LBB22_5
# BB#6:                                 # %if.then20
                                        #   in Loop: Header=BB22_3 Depth=2
	movl	$1, (%rdx)
	movzbl	(%rax,%rcx), %ecx
	vmovd	%ecx, %xmm2
	jmp	.LBB22_7
	.align	16, 0x90
.LBB22_5:                               #   in Loop: Header=BB22_3 Depth=2
	vmovd	%edi, %xmm2
.LBB22_7:                               # %if.end
                                        #   in Loop: Header=BB22_3 Depth=2
	vpbroadcastq	%xmm2, %xmm2
	vpextrb	$8, %xmm2, %ecx
	orb	$32, %cl
	cmpb	$104, %cl
	jne	.LBB22_9
# BB#8:                                 # %if.then36
                                        #   in Loop: Header=BB22_3 Depth=2
	movl	$1, 4(%rdx)
	vmovdqa	%xmm5, %xmm3
	jmp	.LBB22_9
	.align	16, 0x90
.LBB22_10:                              # %for.inc40
                                        #   in Loop: Header=BB22_2 Depth=1
	vpaddq	%xmm5, %xmm1, %xmm1
	vpand	%xmm6, %xmm1, %xmm2
	vpand	%xmm6, %xmm0, %xmm7
	vpcmpeqq	%xmm7, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB22_2
# BB#11:                                # %for.end42
	vpand	.LCPI22_3(%rip), %xmm3, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB22_13
.LBB22_12:                              # %if.end45
	popq	%rax
	ret
.LBB22_13:                              # %if.then44
	movl	$10, %edi
	callq	putchar
	movq	progname(%rip), %rcx
	movl	$.L.str21, %edi
	xorl	%eax, %eax
	movq	%rcx, %rsi
	callq	printf
	movl	$.Lstr, %edi
	callq	puts
	movq	progname(%rip), %rcx
	movl	$.L.str23, %edi
	xorl	%eax, %eax
	movq	%rcx, %rsi
	callq	printf
	movl	$.Lstr69, %edi
	callq	puts
	movl	$.Lstr70, %edi
	callq	puts
	movl	$.Lstr71, %edi
	callq	puts
	movl	$.Lstr72, %edi
	callq	puts
	xorl	%edi, %edi
	callq	exit
.Ltmp129:
	.size	arch_parsecommandline, .Ltmp129-arch_parsecommandline
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI23_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI23_1:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	arch_readelemvector
	.align	16, 0x90
	.type	arch_readelemvector,@function
arch_readelemvector:                    # @arch_readelemvector
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp133:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp134:
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
.Ltmp135:
	.cfi_def_cfa_offset 64
.Ltmp136:
	.cfi_offset %rbx, -24
.Ltmp137:
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movq	%rdi, %rbx
	movq	packfile(%rip), %rdi
	leaq	36(%rsp), %rdx
	leaq	32(%rsp), %rcx
	movl	$.L.str28, %esi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	vmovd	36(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI23_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI23_1(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB23_1
# BB#3:                                 # %if.end
	vmovd	32(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI23_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI23_1(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB23_8
# BB#4:                                 # %for.cond.preheader
	vmovd	%ebp, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB23_7
# BB#5:
	vpand	.LCPI23_0(%rip), %xmm0, %xmm0
	vmovdqa	%xmm0, (%rsp)           # 16-byte Spill
	.align	16, 0x90
.LBB23_6:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm2, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm2, %rax
	movq	packfile(%rip), %rdi
	leaq	(%rbx,%rax,8), %rdx
	movl	$.L.str31, %esi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	vmovdqa	16(%rsp), %xmm2         # 16-byte Reload
	vpaddq	.LCPI23_1(%rip), %xmm2, %xmm2
	vpand	.LCPI23_0(%rip), %xmm2, %xmm0
	vpcmpeqq	(%rsp), %xmm0, %xmm0 # 16-byte Folded Reload
	vptest	%xmm0, %xmm0
	je	.LBB23_6
.LBB23_7:                               # %for.end
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
.LBB23_1:                               # %if.then
	movq	stderr(%rip), %rax
	movl	$.L.str32, %edi
	movl	$37, %esi
	jmp	.LBB23_2
.LBB23_8:                               # %if.then3
	movq	stderr(%rip), %rax
	movl	$.L.str33, %edi
	movl	$48, %esi
.LBB23_2:                               # %if.then
	movl	$1, %edx
	movq	%rax, %rcx
	callq	fwrite
	callq	arch_bail
.Ltmp138:
	.size	arch_readelemvector, .Ltmp138-arch_readelemvector
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI24_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI24_1:
	.quad	3                       # 0x3
	.quad	3                       # 0x3
.LCPI24_2:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.text
	.globl	arch_readdouble
	.align	16, 0x90
	.type	arch_readdouble,@function
arch_readdouble:                        # @arch_readdouble
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp141:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp142:
	.cfi_def_cfa_offset 32
.Ltmp143:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	packfile(%rip), %rdi
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rcx
	movl	$.L.str28, %esi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	vmovd	12(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI24_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI24_1(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB24_1
# BB#3:                                 # %if.end
	vmovd	8(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI24_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI24_2(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB24_4
# BB#5:                                 # %if.end5
	movq	packfile(%rip), %rdi
	movl	$.L.str31, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	callq	__isoc99_fscanf
	addq	$16, %rsp
	popq	%rbx
	ret
.LBB24_1:                               # %if.then
	movq	stderr(%rip), %rax
	movl	$.L.str34, %edi
	movl	$33, %esi
	jmp	.LBB24_2
.LBB24_4:                               # %if.then3
	movq	stderr(%rip), %rax
	movl	$.L.str35, %edi
	movl	$44, %esi
.LBB24_2:                               # %if.then
	movl	$1, %edx
	movq	%rax, %rcx
	callq	fwrite
	callq	arch_bail
.Ltmp144:
	.size	arch_readdouble, .Ltmp144-arch_readdouble
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI25_0:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
.LCPI25_1:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI25_2:
	.zero	16
	.text
	.globl	readpackfile
	.align	16, 0x90
	.type	readpackfile,@function
readpackfile:                           # @readpackfile
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp151:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp152:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp153:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp154:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp155:
	.cfi_def_cfa_offset 48
	subq	$64, %rsp
.Ltmp156:
	.cfi_def_cfa_offset 112
.Ltmp157:
	.cfi_offset %rbx, -48
.Ltmp158:
	.cfi_offset %r12, -40
.Ltmp159:
	.cfi_offset %r13, -32
.Ltmp160:
	.cfi_offset %r14, -24
.Ltmp161:
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r12
	movl	$.L.str36, %esi
	movl	$ARCHglobalnodes, %edx
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	movl	$.L.str36, %esi
	movl	$ARCHmesh_dim, %edx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	movl	$.L.str36, %esi
	movl	$ARCHglobalelems, %edx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	movl	$.L.str36, %esi
	movl	$ARCHcorners, %edx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	movl	$.L.str36, %esi
	movl	$ARCHsubdomains, %edx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	movl	$.L.str31, %esi
	movl	$ARCHduration, %edx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	movl	ARCHsubdomains(%rip), %ecx
	vmovd	%ecx, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI25_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI25_1(%rip), %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_48
# BB#1:                                 # %if.end
	vmovd	(%r14), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI25_0(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_2
.LBB25_3:                               # %if.end9
	movl	$.L.str39, %esi
	movl	$ARCHnodes, %edx
	movl	$ARCHmine, %ecx
	movl	$ARCHpriv, %r8d
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm1, %r13
	movslq	%r13d, %rax
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rbx
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	%xmm0, 32(%rsp)         # 16-byte Spill
	vpsllq	$2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, ARCHglobalnode(%rip)
	vpcmpeqq	.LCPI25_2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_4
# BB#7:                                 # %if.end17
	vmovdqa	32(%rsp), %xmm0         # 16-byte Reload
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	movq	%rax, %r15
	vmovq	%r15, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm2 # xmm2 = xmm0[0,0]
	vmovups	%xmm2, ARCHcoord(%rip)
	movslq	%r13d, %rax
	vmovq	%rax, %xmm0
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_15
# BB#8:                                 # %for.body.preheader
	movl	$24, %edi
	vmovaps	%xmm2, 32(%rsp)         # 16-byte Spill
	callq	malloc
	vmovdqa	32(%rsp), %xmm2         # 16-byte Reload
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%r15)
	movslq	%r13d, %rax
	vmovq	%rax, %xmm0
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	.LCPI25_1(%rip), %xmm4
	vpcmpgtq	%xmm4, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vpxor	%xmm3, %xmm3, %xmm3
	jne	.LBB25_9
	jmp	.LBB25_11
	.align	16, 0x90
.LBB25_49:                              # %for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge
                                        #   in Loop: Header=BB25_9 Depth=1
	vpbroadcastq	ARCHcoord(%rip), %xmm2
.LBB25_9:                               # %for.body.for.body_crit_edge
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm4, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm4, %r15
	vpextrq	$1, %xmm2, %rbx
	movl	$24, %edi
	callq	malloc
	vmovdqa	32(%rsp), %xmm4         # 16-byte Reload
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbx,%r15,8)
	vpaddq	.LCPI25_1(%rip), %xmm4, %xmm4
	vmovdqa	.LCPI25_0(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm4, %xmm0
	vmovdqa	16(%rsp), %xmm1         # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_49
# BB#10:
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB25_11:                              # %for.body27
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_13 Depth 2
	vmovdqa	%xmm3, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rbx
	movq	ARCHglobalnode(%rip), %rax
	leaq	(%rax,%rbx,4), %rdx
	movl	$.L.str36, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovd	ARCHmesh_dim(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpgtq	%xmm3, %xmm0, %xmm0
	jmp	.LBB25_13
	.align	16, 0x90
.LBB25_12:                              # %for.body34
                                        #   in Loop: Header=BB25_13 Depth=2
	vmovdqa	%xmm3, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rdx
	movq	ARCHcoord(%rip), %rax
	shlq	$3, %rdx
	addq	(%rax,%rbx,8), %rdx
	movl	$.L.str31, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovdqa	32(%rsp), %xmm3         # 16-byte Reload
	vpaddq	.LCPI25_1(%rip), %xmm3, %xmm3
	vmovd	ARCHmesh_dim(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
.LBB25_13:                              # %for.body34
                                        #   Parent Loop BB25_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vptest	%xmm0, %xmm0
	jne	.LBB25_12
# BB#14:                                # %for.inc43
                                        #   in Loop: Header=BB25_11 Depth=1
	vmovdqa	16(%rsp), %xmm3         # 16-byte Reload
	vpaddq	.LCPI25_1(%rip), %xmm3, %xmm3
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_11
.LBB25_15:                              # %for.end45
	vmovd	(%r14), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI25_0(%rip), %xmm0, %xmm0
	vpcmpeqq	.LCPI25_2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_16
.LBB25_17:                              # %if.end50
	movl	$.L.str36, %esi
	movl	$ARCHelems, %edx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovd	ARCHelems(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vmovdqa	%xmm1, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm1, %r13
	movslq	%r13d, %rax
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rbx
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	%xmm0, 32(%rsp)         # 16-byte Spill
	vpsllq	$2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, ARCHglobalelem(%rip)
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_18
# BB#19:                                # %if.end60
	vmovdqa	32(%rsp), %xmm0         # 16-byte Reload
	vpsllq	$3, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	movq	%rax, %r15
	vmovq	%r15, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm2 # xmm2 = xmm0[0,0]
	vmovups	%xmm2, ARCHvertex(%rip)
	movslq	%r13d, %rax
	vmovq	%rax, %xmm0
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	.LCPI25_2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_27
# BB#20:                                # %for.body67.preheader
	movl	$16, %edi
	vmovaps	%xmm2, 32(%rsp)         # 16-byte Spill
	callq	malloc
	vmovdqa	32(%rsp), %xmm2         # 16-byte Reload
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%r15)
	movslq	%r13d, %rax
	vmovq	%rax, %xmm0
	movslq	%ebx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	.LCPI25_1(%rip), %xmm4
	vpcmpgtq	%xmm4, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	vpxor	%xmm3, %xmm3, %xmm3
	jne	.LBB25_21
	jmp	.LBB25_23
	.align	16, 0x90
.LBB25_50:                              # %for.body67.for.body67_crit_edge.for.body67.for.body67_crit_edge_crit_edge
                                        #   in Loop: Header=BB25_21 Depth=1
	vpbroadcastq	ARCHvertex(%rip), %xmm2
.LBB25_21:                              # %for.body67.for.body67_crit_edge
                                        # =>This Inner Loop Header: Depth=1
	vmovdqa	%xmm4, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm4, %r15
	vpextrq	$1, %xmm2, %rbx
	movl	$16, %edi
	callq	malloc
	vmovdqa	32(%rsp), %xmm4         # 16-byte Reload
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, (%rbx,%r15,8)
	vpaddq	.LCPI25_1(%rip), %xmm4, %xmm4
	vmovdqa	.LCPI25_0(%rip), %xmm0
	vmovdqa	%xmm0, %xmm2
	vpand	%xmm2, %xmm4, %xmm0
	vmovdqa	16(%rsp), %xmm1         # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_50
# BB#22:
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB25_23:                              # %for.body77
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_25 Depth 2
	vmovdqa	%xmm3, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rbx
	movq	ARCHglobalelem(%rip), %rax
	leaq	(%rax,%rbx,4), %rdx
	movl	$.L.str36, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovd	ARCHcorners(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpcmpgtq	.LCPI25_2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_26
# BB#24:                                #   in Loop: Header=BB25_23 Depth=1
	vpxor	%xmm3, %xmm3, %xmm3
	.align	16, 0x90
.LBB25_25:                              # %for.body84
                                        #   Parent Loop BB25_23 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovdqa	%xmm3, 32(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm3, %rdx
	movq	ARCHvertex(%rip), %rax
	shlq	$2, %rdx
	addq	(%rax,%rbx,8), %rdx
	movl	$.L.str36, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovdqa	32(%rsp), %xmm3         # 16-byte Reload
	vpaddq	.LCPI25_1(%rip), %xmm3, %xmm3
	vmovd	ARCHcorners(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_25
.LBB25_26:                              # %for.inc93
                                        #   in Loop: Header=BB25_23 Depth=1
	vmovdqa	16(%rsp), %xmm3         # 16-byte Reload
	vpaddq	.LCPI25_1(%rip), %xmm3, %xmm3
	vmovd	ARCHelems(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_23
.LBB25_27:                              # %for.end95
	vmovd	(%r14), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI25_0(%rip), %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_28
.LBB25_29:                              # %if.end100
	movl	$.L.str44, %esi
	movl	$ARCHmatrixlen, %edx
	movl	$ARCHcholeskylen, %ecx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovd	ARCHmatrixlen(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	%xmm0, 32(%rsp)         # 16-byte Spill
	vpaddq	.LCPI25_1(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpsllq	$2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, ARCHmatrixcol(%rip)
	vpcmpeqq	.LCPI25_2, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_30
# BB#31:                                # %if.end110
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	%xmm0, 16(%rsp)         # 16-byte Spill
	vpaddq	.LCPI25_1(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vpsllq	$2, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rdi
	callq	malloc
	vmovq	%rax, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovups	%xmm0, ARCHmatrixindex(%rip)
	vpxor	%xmm6, %xmm6, %xmm6
	vpcmpeqq	%xmm6, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_34
# BB#32:                                # %for.cond121.preheader
	vmovdqa	32(%rsp), %xmm3         # 16-byte Reload
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpcmpgtq	%xmm6, %xmm0, %xmm0
	vmovdqa	.LCPI25_0(%rip), %xmm1
	vptest	%xmm0, %xmm0
	je	.LBB25_33
# BB#41:
	vmovdqa	%xmm1, 32(%rsp)         # 16-byte Spill
	leaq	60(%rsp), %r14
	.align	16, 0x90
.LBB25_42:                              # %for.body124
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_45 Depth 2
	vmovdqa	%xmm6, 16(%rsp)         # 16-byte Spill
	vpextrq	$1, %xmm6, %rbx
	movl	$.L.str36, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	movq	%r14, %rdx
	callq	__isoc99_fscanf
	movq	ARCHmatrixcol(%rip), %rax
	leaq	(%rax,%rbx,4), %rdx
	movl	$.L.str36, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	vmovd	60(%rsp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpextrq	$1, %xmm0, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm0, %rax
	cltq
	vmovq	%rax, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0]
	vmovdqa	32(%rsp), %xmm5         # 16-byte Reload
	vpextrq	$1, %xmm5, %rcx
	movslq	%ecx, %rax
	vmovq	%rax, %xmm1
	vmovq	%xmm5, %rdx
	movslq	%edx, %rax
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_43
# BB#44:                                # %while.body.lr.ph
                                        #   in Loop: Header=BB25_42 Depth=1
	movq	ARCHmatrixindex(%rip), %rax
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm0
	movslq	%edx, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovdqa	16(%rsp), %xmm6         # 16-byte Reload
	vmovdqa	.LCPI25_1(%rip), %xmm7
	.align	16, 0x90
.LBB25_45:                              # %while.body
                                        #   Parent Loop BB25_42 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpaddq	%xmm7, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	vpaddq	%xmm7, %xmm5, %xmm5
	vmovd	ARCHnodes(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpaddq	%xmm7, %xmm1, %xmm1
	vpextrq	$1, %xmm1, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm2
	vmovq	%xmm1, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	movslq	%ecx, %rdx
	vmovq	%rdx, %xmm3
	vmovq	%xmm0, %rdx
	movslq	%edx, %rsi
	vmovq	%rsi, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB25_51
# BB#46:                                # %if.end139
                                        #   in Loop: Header=BB25_45 Depth=2
	movslq	%ecx, %rsi
	vmovq	%rsi, %xmm1
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpshufd	$8, %xmm6, %xmm2        # xmm2 = xmm6[0,2,0,0]
	vmovq	%xmm2, (%rax,%rcx,4)
	vmovd	60(%rsp), %xmm2
	vpbroadcastq	%xmm2, %xmm2
	vpextrq	$1, %xmm2, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm3
	vmovq	%xmm2, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm2
	vpunpcklqdq	%xmm3, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm3[0]
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vptest	%xmm1, %xmm1
	jne	.LBB25_45
	jmp	.LBB25_47
	.align	16, 0x90
.LBB25_43:                              #   in Loop: Header=BB25_42 Depth=1
	vmovdqa	16(%rsp), %xmm6         # 16-byte Reload
	vmovdqa	.LCPI25_1(%rip), %xmm7
.LBB25_47:                              # %for.inc143
                                        #   in Loop: Header=BB25_42 Depth=1
	vmovdqa	%xmm5, 32(%rsp)         # 16-byte Spill
	vpaddq	%xmm7, %xmm6, %xmm6
	vmovd	ARCHmatrixlen(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm3
	vpextrq	$1, %xmm3, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm3, %rax
	cltq
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm6, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm6, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	jne	.LBB25_42
# BB#35:                                # %for.cond121.while.cond146.preheader_crit_edge
	vmovd	ARCHnodes(%rip), %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vmovdqa	32(%rsp), %xmm1         # 16-byte Reload
	jmp	.LBB25_36
.LBB25_33:
	vmovdqa	16(%rsp), %xmm2         # 16-byte Reload
.LBB25_36:                              # %while.cond146.preheader
	vpextrq	$1, %xmm1, %rcx
	movslq	%ecx, %rax
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rdx
	movslq	%edx, %rax
	vmovq	%rax, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpextrq	$1, %xmm2, %rax
	cltq
	vmovq	%rax, %xmm1
	vmovq	%xmm2, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm1, %xmm2, %xmm1 # xmm1 = xmm2[0],xmm1[0]
	vpcmpgtq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB25_40
# BB#37:                                # %while.body149.lr.ph
	movq	ARCHmatrixindex(%rip), %rax
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm0
	movslq	%edx, %rcx
	vmovq	%rcx, %xmm1
	vpunpcklqdq	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vpaddq	.LCPI25_1(%rip), %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	vpshufd	$8, %xmm3, %xmm1        # xmm1 = xmm3[0,2,0,0]
	vmovq	%xmm1, (%rax,%rcx,4)
	vmovd	ARCHnodes(%rip), %xmm1
	vpbroadcastq	%xmm1, %xmm1
	vpextrq	$1, %xmm1, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm2
	vmovq	%xmm1, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm1
	vpunpcklqdq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0]
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm2
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	vpcmpgtq	%xmm2, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB25_40
# BB#38:
	vmovdqa	.LCPI25_1(%rip), %xmm1
	.align	16, 0x90
.LBB25_39:                              # %while.body149.while.body149_crit_edge
                                        # =>This Inner Loop Header: Depth=1
	vmovd	ARCHmatrixlen(%rip), %xmm2
	vpbroadcastq	%xmm2, %xmm2
	vpaddq	%xmm1, %xmm0, %xmm0
	vpextrq	$1, %xmm0, %rcx
	vpshufd	$8, %xmm2, %xmm2        # xmm2 = xmm2[0,2,0,0]
	vmovq	%xmm2, (%rax,%rcx,4)
	vmovd	ARCHnodes(%rip), %xmm2
	vpbroadcastq	%xmm2, %xmm2
	vpextrq	$1, %xmm2, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm3
	vmovq	%xmm2, %rdx
	movslq	%edx, %rdx
	vmovq	%rdx, %xmm2
	vpunpcklqdq	%xmm3, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm3[0]
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm3
	vmovq	%xmm0, %rcx
	movslq	%ecx, %rcx
	vmovq	%rcx, %xmm4
	vpunpcklqdq	%xmm3, %xmm4, %xmm3 # xmm3 = xmm4[0],xmm3[0]
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	jne	.LBB25_39
.LBB25_40:                              # %while.end153
	leaq	56(%rsp), %rdx
	leaq	52(%rsp), %rcx
	movl	$.L.str44, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	__isoc99_fscanf
	addq	$64, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.LBB25_2:                               # %if.then7
	movq	stderr(%rip), %rdi
	movq	progname(%rip), %rdx
	movl	$.L.str38, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB25_3
.LBB25_16:                              # %if.then48
	movq	stderr(%rip), %rdi
	movq	progname(%rip), %rdx
	movl	$.L.str41, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB25_17
.LBB25_28:                              # %if.then98
	movq	stderr(%rip), %rdi
	movq	progname(%rip), %rdx
	movl	$.L.str43, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB25_29
.LBB25_51:                              # %if.then135
	vpextrd	$2, %xmm5, %edx
	vpextrd	$2, %xmm1, %ecx
	movq	progname(%rip), %rsi
	movl	$.L.str47, %edi
	xorl	%eax, %eax
	callq	printf
	callq	arch_bail
.LBB25_48:                              # %if.then
	movq	stderr(%rip), %rdx
	movq	progname(%rip), %rbx
	movl	$.L.str37, %esi
	xorl	%eax, %eax
	movq	%rdx, %rdi
	movq	%rbx, %rdx
	callq	fprintf
	callq	arch_bail
.LBB25_4:                               # %if.then14
	movq	stderr(%rip), %rax
	movl	$.L.str40, %edi
	jmp	.LBB25_5
.LBB25_18:                              # %if.then57
	movq	stderr(%rip), %rax
	movl	$.L.str42, %edi
.LBB25_5:                               # %if.then14
	movl	$33, %esi
	jmp	.LBB25_6
.LBB25_30:                              # %if.then107
	movq	stderr(%rip), %rax
	movl	$.L.str45, %edi
	movl	$32, %esi
	jmp	.LBB25_6
.LBB25_34:                              # %if.then117
	movq	stderr(%rip), %rax
	movl	$.L.str46, %edi
	movl	$34, %esi
.LBB25_6:                               # %if.then14
	movl	$1, %edx
	movq	%rax, %rcx
	callq	fwrite
	movq	stderr(%rip), %rax
	movq	%rax, %rdi
	callq	fflush
	xorl	%edi, %edi
	callq	exit
.Ltmp162:
	.size	readpackfile, .Ltmp162-readpackfile
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI26_0:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
.LCPI26_1:
	.quad	4294967295              # 0xffffffff
	.quad	4294967295              # 0xffffffff
	.text
	.globl	smvp_opt
	.align	16, 0x90
	.type	smvp_opt,@function
smvp_opt:                               # @smvp_opt
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Ltmp165:
	.cfi_def_cfa_offset 16
.Ltmp166:
	.cfi_offset %rbx, -16
	vmovd	%edi, %xmm0
	vpbroadcastq	%xmm0, %xmm1
	vpextrq	$1, %xmm1, %rax
	cltq
	vmovq	%rax, %xmm0
	vmovq	%xmm1, %rax
	cltq
	vmovq	%rax, %xmm2
	vpunpcklqdq	%xmm0, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm0[0]
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpgtq	%xmm0, %xmm2, %xmm2
	vptest	%xmm2, %xmm2
	je	.LBB26_8
# BB#1:
	vmovdqa	.LCPI26_0(%rip), %xmm5
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LCPI26_1(%rip), %xmm14
	vpand	%xmm14, %xmm1, %xmm3
	vmovdqa	%xmm3, -112(%rsp)       # 16-byte Spill
	.align	16, 0x90
.LBB26_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vpextrq	$1, %xmm0, %rax
	movq	(%r9,%rax,8), %rax
	vpaddq	%xmm5, %xmm0, %xmm0
	vmovdqu	%xmm2, (%rax)
	movq	$0, 16(%rax)
	vpand	%xmm14, %xmm0, %xmm1
	vpcmpeqq	%xmm3, %xmm1, %xmm1
	vptest	%xmm1, %xmm1
	je	.LBB26_2
# BB#3:                                 # %for.body10.lr.ph
	vmovd	(%rcx), %xmm0
	vpbroadcastq	%xmm0, %xmm7
	vpxor	%xmm2, %xmm2, %xmm2
	.align	16, 0x90
.LBB26_4:                               # %for.body10
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB26_6 Depth 2
	vmovdqa	%xmm7, %xmm0
	vpextrq	$1, %xmm2, %rax
	movq	(%r8,%rax,8), %rdi
	vmovsd	(%rdi), %xmm4
	vmovsd	8(%rdi), %xmm13
	vpermilpd	$0, %xmm4, %xmm6 # xmm6 = xmm4[0,0]
	vpermilpd	$0, %xmm13, %xmm9 # xmm9 = xmm13[0,0]
	vmovsd	16(%rdi), %xmm15
	vpermilpd	$0, %xmm15, %xmm11 # xmm11 = xmm15[0,0]
	vpaddq	%xmm5, %xmm2, %xmm2
	vmovdqa	%xmm2, -96(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm2, %rdi
	vmovd	(%rcx,%rdi,4), %xmm1
	vpextrq	$1, %xmm0, %r11
	vmovq	%xmm0, %rbx
	vpaddq	%xmm5, %xmm0, %xmm10
	vpbroadcastq	%xmm1, %xmm7
	vmovdqa	%xmm7, -48(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm7, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm1
	vmovq	%xmm7, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm8 # xmm8 = xmm0[0],xmm1[0]
	movq	(%r9,%rax,8), %r10
	movslq	%r11d, %rax
	vmovq	%rax, %xmm1
	movslq	%ebx, %rax
	vmovq	%rax, %xmm3
	vpunpcklqdq	%xmm1, %xmm3, %xmm1 # xmm1 = xmm3[0],xmm1[0]
	vpextrq	$1, %xmm1, %rax
	movq	(%rsi,%rax,8), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rbx
	vunpcklpd	%xmm4, %xmm4, %xmm1 # xmm1 = xmm4[0,0]
	vmovsd	(%rdi), %xmm3
	vmovsd	8(%rdi), %xmm0
	vmovhpd	(%rbx), %xmm3, %xmm3
	vmulpd	%xmm3, %xmm1, %xmm1
	vaddpd	(%r10), %xmm1, %xmm1
	vunpcklpd	%xmm13, %xmm13, %xmm3 # xmm3 = xmm13[0,0]
	vmovhpd	8(%rbx), %xmm0, %xmm0
	vmulpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vunpcklpd	%xmm15, %xmm15, %xmm1 # xmm1 = xmm15[0,0]
	vmovsd	16(%rdi), %xmm3
	vmovhpd	16(%rbx), %xmm3, %xmm3
	vmulpd	%xmm3, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm12
	vmovddup	16(%r10), %xmm0
	movq	16(%rax), %rax
	vmovddup	(%rax), %xmm1
	vmulpd	%xmm1, %xmm6, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	8(%rax), %xmm1
	vmulpd	%xmm1, %xmm9, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovddup	16(%rax), %xmm1
	vmulpd	%xmm1, %xmm11, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm2
	vpextrq	$1, %xmm10, %rdi
	movslq	%edi, %rax
	vmovq	%rax, %xmm13
	vmovq	%xmm10, %rax
	movslq	%eax, %rbx
	vmovq	%rbx, %xmm0
	vpunpcklqdq	%xmm13, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm13[0]
	vpcmpgtq	%xmm0, %xmm8, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB26_7
# BB#5:                                 # %while.body.lr.ph
                                        #   in Loop: Header=BB26_4 Depth=1
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm1
	cltq
	vmovq	%rax, %xmm0
	vmovapd	%xmm6, -64(%rsp)        # 16-byte Spill
	vmovapd	%xmm9, %xmm15
	vpunpcklqdq	%xmm1, %xmm0, %xmm9 # xmm9 = xmm0[0],xmm1[0]
	vmovapd	%xmm11, -80(%rsp)       # 16-byte Spill
	.align	16, 0x90
.LBB26_6:                               # %while.body
                                        #   Parent Loop BB26_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovapd	%xmm2, -16(%rsp)        # 16-byte Spill
	vpextrq	$1, %xmm9, %rax
	vmovd	(%rdx,%rax,4), %xmm4
	vpbroadcastq	%xmm4, %xmm4
	vpextrq	$1, %xmm4, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm5
	vmovq	%xmm4, %rdi
	movslq	%edi, %rdi
	vmovq	%rdi, %xmm4
	vpunpcklqdq	%xmm5, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm5[0]
	vpextrq	$1, %xmm4, %rdi
	movq	(%rsi,%rax,8), %r11
	movq	(%r11), %rbx
	movq	(%r8,%rdi,8), %rax
	vmovsd	(%rbx), %xmm4
	vmovsd	8(%rbx), %xmm5
	vmovsd	16(%rbx), %xmm6
	vmovsd	(%rax), %xmm13
	movq	8(%r11), %rbx
	vpermilpd	$0, %xmm4, %xmm1 # xmm1 = xmm4[0,0]
	movq	(%r9,%rdi,8), %rdi
	vmovddup	(%rdi), %xmm2
	vmovapd	-64(%rsp), %xmm0        # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm1
	vpermilpd	$0, %xmm5, %xmm3 # xmm3 = xmm5[0,0]
	vmovddup	8(%rdi), %xmm11
	vaddpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm3, %xmm0, %xmm2
	vpermilpd	$0, %xmm6, %xmm3 # xmm3 = xmm6[0,0]
	vmovddup	16(%rdi), %xmm8
	vaddpd	%xmm2, %xmm11, %xmm11
	vmulpd	%xmm3, %xmm0, %xmm3
	vmovsd	(%rbx), %xmm7
	vmovsd	8(%rbx), %xmm2
	vaddpd	%xmm3, %xmm8, %xmm14
	vpermilpd	$0, %xmm7, %xmm3 # xmm3 = xmm7[0,0]
	vunpcklpd	%xmm7, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm7[0]
	vunpcklpd	%xmm13, %xmm13, %xmm7 # xmm7 = xmm13[0,0]
	vmulpd	%xmm4, %xmm7, %xmm4
	vmulpd	%xmm3, %xmm15, %xmm3
	vaddpd	%xmm3, %xmm1, %xmm0
	vmovapd	%xmm0, -32(%rsp)        # 16-byte Spill
	vpermilpd	$0, %xmm2, %xmm3 # xmm3 = xmm2[0,0]
	vmovsd	8(%rax), %xmm7
	vunpcklpd	%xmm2, %xmm5, %xmm2 # xmm2 = xmm5[0],xmm2[0]
	vunpcklpd	%xmm7, %xmm7, %xmm5 # xmm5 = xmm7[0,0]
	vmulpd	%xmm2, %xmm5, %xmm2
	vmovsd	16(%rax), %xmm5
	vmulpd	%xmm3, %xmm15, %xmm3
	vaddpd	%xmm3, %xmm11, %xmm11
	vmovsd	16(%rbx), %xmm3
	vaddpd	%xmm4, %xmm12, %xmm4
	vunpcklpd	%xmm5, %xmm5, %xmm0 # xmm0 = xmm5[0,0]
	vunpcklpd	%xmm3, %xmm6, %xmm6 # xmm6 = xmm6[0],xmm3[0]
	vmulpd	%xmm6, %xmm0, %xmm0
	vmovdqa	.LCPI26_0(%rip), %xmm6
	vmovdqa	-48(%rsp), %xmm8        # 16-byte Reload
	vaddpd	%xmm2, %xmm4, %xmm2
	vaddpd	%xmm0, %xmm2, %xmm12
	vpermilpd	$0, %xmm3, %xmm0 # xmm0 = xmm3[0,0]
	vmulpd	%xmm0, %xmm15, %xmm0
	vpermilpd	$0, %xmm13, %xmm2 # xmm2 = xmm13[0,0]
	vaddpd	%xmm0, %xmm14, %xmm0
	movq	16(%r11), %rax
	vmovddup	(%rax), %xmm3
	vmulpd	%xmm3, %xmm2, %xmm2
	vmovapd	-16(%rsp), %xmm1        # 16-byte Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	-80(%rsp), %xmm4        # 16-byte Reload
	vmulpd	%xmm3, %xmm4, %xmm3
	vmovapd	-32(%rsp), %xmm1        # 16-byte Reload
	vaddpd	%xmm3, %xmm1, %xmm1
	vpermilpd	$0, %xmm7, %xmm3 # xmm3 = xmm7[0,0]
	vmovdqa	.LCPI26_1(%rip), %xmm7
	vmovdqa	%xmm7, %xmm14
	vmovupd	%xmm1, (%rdi)
	vmovddup	8(%rax), %xmm1
	vmulpd	%xmm1, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmulpd	%xmm1, %xmm4, %xmm1
	vaddpd	%xmm1, %xmm11, %xmm1
	vpermilpd	$0, %xmm5, %xmm3 # xmm3 = xmm5[0,0]
	vmovupd	%xmm1, 8(%rdi)
	vmovddup	16(%rax), %xmm1
	vmulpd	%xmm1, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmulpd	%xmm1, %xmm4, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpaddq	%xmm6, %xmm10, %xmm10
	vpand	%xmm14, %xmm10, %xmm1
	vmovupd	%xmm0, 16(%rdi)
	vpand	%xmm14, %xmm8, %xmm0
	vmovdqa	%xmm8, %xmm7
	vpcmpeqq	%xmm0, %xmm1, %xmm0
	vptest	%xmm0, %xmm0
	vpaddq	%xmm6, %xmm9, %xmm9
	vmovdqa	%xmm6, %xmm5
	je	.LBB26_6
.LBB26_7:                               # %while.end
                                        #   in Loop: Header=BB26_4 Depth=1
	vmovq	%r10, %xmm0
	vmovlhps	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vpextrq	$1, %xmm0, %rax
	vmovupd	%xmm12, (%rax)
	vmovupd	%xmm2, 16(%r10)
	vmovdqa	-96(%rsp), %xmm2        # 16-byte Reload
	vpand	%xmm14, %xmm2, %xmm0
	vmovdqa	-112(%rsp), %xmm1       # 16-byte Reload
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vptest	%xmm0, %xmm0
	je	.LBB26_4
.LBB26_8:                               # %for.end201
	popq	%rbx
	ret
.Ltmp167:
	.size	smvp_opt, .Ltmp167-smvp_opt
	.cfi_endproc

	.type	options,@object         # @options
	.comm	options,8,4
	.type	nodekindf,@object       # @nodekindf
	.comm	nodekindf,8,8
	.type	ARCHnodes,@object       # @ARCHnodes
	.comm	ARCHnodes,4,4
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s: Beginning simulation.\n"
	.size	.L.str, 27

	.type	Exc,@object             # @Exc
	.comm	Exc,24,8
	.type	ARCHduration,@object    # @ARCHduration
	.comm	ARCHduration,8,8
	.type	Damp,@object            # @Damp
	.comm	Damp,32,8
	.type	Src,@object             # @Src
	.comm	Src,88,8
	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"CASE SUMMARY\n"
	.size	.L.str2, 14

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"Fault information\n"
	.size	.L.str3, 19

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	"  Orientation:  strike: %f\n"
	.size	.L.str4, 28

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	"                   dip: %f\n"
	.size	.L.str5, 28

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	"                  rake: %f\n"
	.size	.L.str6, 28

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	"           dislocation: %f cm\n"
	.size	.L.str7, 31

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	"Hypocenter: (%f, %f, %f) Km\n"
	.size	.L.str8, 29

	.type	.L.str9,@object         # @.str9
.L.str9:
	.asciz	"Excitation characteristics\n"
	.size	.L.str9, 28

	.type	.L.str10,@object        # @.str10
.L.str10:
	.asciz	"     Time step: %f sec\n"
	.size	.L.str10, 24

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	"      Duration: %f sec\n"
	.size	.L.str11, 24

	.type	.L.str12,@object        # @.str12
.L.str12:
	.asciz	"     Rise time: %f sec\n"
	.size	.L.str12, 24

	.type	nodekind,@object        # @nodekind
	.comm	nodekind,8,8
	.type	ARCHcoord,@object       # @ARCHcoord
	.comm	ARCHcoord,8,8
	.type	ARCHmine,@object        # @ARCHmine
	.comm	ARCHmine,4,4
	.type	.L.str13,@object        # @.str13
.L.str13:
	.asciz	"The source is node %d at (%f  %f  %f)\n"
	.size	.L.str13, 39

	.type	ARCHglobalnode,@object  # @ARCHglobalnode
	.comm	ARCHglobalnode,8,8
	.type	.L.str14,@object        # @.str14
.L.str14:
	.asciz	"The epicenter is node %d at (%f  %f  %f)\n"
	.size	.L.str14, 42

	.type	ARCHelems,@object       # @ARCHelems
	.comm	ARCHelems,4,4
	.type	ARCHvertex,@object      # @ARCHvertex
	.comm	ARCHvertex,8,8
	.type	source_elms,@object     # @source_elms
	.comm	source_elms,8,8
	.type	V23,@object             # @V23
	.comm	V23,8,8
	.type	M23,@object             # @M23
	.comm	M23,8,8
	.type	C23,@object             # @C23
	.comm	C23,8,8
	.type	M,@object               # @M
	.comm	M,8,8
	.type	C,@object               # @C
	.comm	C,8,8
	.type	ARCHmatrixindex,@object # @ARCHmatrixindex
	.comm	ARCHmatrixindex,8,8
	.type	ARCHmatrixcol,@object   # @ARCHmatrixcol
	.comm	ARCHmatrixcol,8,8
	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	"K indexing error!!! %d %d\n"
	.size	.L.str15, 27

	.type	K,@object               # @K
	.comm	K,8,8
	.type	disp,@object            # @disp
	.comm	disp,8,8
	.type	vel,@object             # @vel
	.comm	vel,8,8
	.type	.L.str16,@object        # @.str16
.L.str16:
	.asciz	"Time step %d\n"
	.size	.L.str16, 14

	.type	.L.str17,@object        # @.str17
.L.str17:
	.asciz	"%d: %.2e %.2e %.2e\n"
	.size	.L.str17, 20

	.type	.L.str18,@object        # @.str18
.L.str18:
	.asciz	"%s: %d nodes %d elems %d timesteps\n"
	.size	.L.str18, 36

	.type	progname,@object        # @progname
	.comm	progname,8,8
	.type	ARCHglobalnodes,@object # @ARCHglobalnodes
	.comm	ARCHglobalnodes,4,4
	.type	ARCHglobalelems,@object # @ARCHglobalelems
	.comm	ARCHglobalelems,4,4
	.type	.L.str19,@object        # @.str19
.L.str19:
	.asciz	"%s: Done. Terminating the simulation.\n"
	.size	.L.str19, 39

	.type	.L.str20,@object        # @.str20
.L.str20:
	.asciz	"Warning: Element volume = %f !\n"
	.size	.L.str20, 32

	.type	.L.str21,@object        # @.str21
.L.str21:
	.asciz	"You are running an Archimedes finite element simulation called %s.\n\n"
	.size	.L.str21, 69

	.type	.L.str23,@object        # @.str23
.L.str23:
	.asciz	"%s [-Qh] < packfile\n\n"
	.size	.L.str23, 22

	.type	packfile,@object        # @packfile
	.comm	packfile,8,8
	.type	.L.str28,@object        # @.str28
.L.str28:
	.asciz	"%d %d\n"
	.size	.L.str28, 7

	.type	.L.str29,@object        # @.str29
.L.str29:
	.asciz	"READNODEVECTOR: unexpected data type\n"
	.size	.L.str29, 38

	.type	.L.str30,@object        # @.str30
.L.str30:
	.asciz	"READNODEVECTOR: unexpected number of attributes\n"
	.size	.L.str30, 49

	.type	.L.str31,@object        # @.str31
.L.str31:
	.asciz	"%lf"
	.size	.L.str31, 4

	.type	.L.str32,@object        # @.str32
.L.str32:
	.asciz	"READELEMVECTOR: unexpected data type\n"
	.size	.L.str32, 38

	.type	.L.str33,@object        # @.str33
.L.str33:
	.asciz	"READELEMVECTOR: unexpected number of attributes\n"
	.size	.L.str33, 49

	.type	.L.str34,@object        # @.str34
.L.str34:
	.asciz	"READDOUBLE: unexpected data type\n"
	.size	.L.str34, 34

	.type	.L.str35,@object        # @.str35
.L.str35:
	.asciz	"READDOUBLE: unexpected number of attributes\n"
	.size	.L.str35, 45

	.type	.L.str36,@object        # @.str36
.L.str36:
	.asciz	"%d"
	.size	.L.str36, 3

	.type	ARCHmesh_dim,@object    # @ARCHmesh_dim
	.comm	ARCHmesh_dim,4,4
	.type	ARCHcorners,@object     # @ARCHcorners
	.comm	ARCHcorners,4,4
	.type	ARCHsubdomains,@object  # @ARCHsubdomains
	.comm	ARCHsubdomains,4,4
	.type	.L.str37,@object        # @.str37
.L.str37:
	.asciz	"%s: too many subdomains(%d), rerun slice using -s1\n"
	.size	.L.str37, 52

	.type	.L.str38,@object        # @.str38
.L.str38:
	.asciz	"%s: Reading nodes.\n"
	.size	.L.str38, 20

	.type	.L.str39,@object        # @.str39
.L.str39:
	.asciz	"%d %d %d"
	.size	.L.str39, 9

	.type	ARCHpriv,@object        # @ARCHpriv
	.comm	ARCHpriv,4,4
	.type	.L.str40,@object        # @.str40
.L.str40:
	.asciz	"malloc failed for ARCHglobalnode\n"
	.size	.L.str40, 34

	.type	.L.str41,@object        # @.str41
.L.str41:
	.asciz	"%s: Reading elements.\n"
	.size	.L.str41, 23

	.type	ARCHglobalelem,@object  # @ARCHglobalelem
	.comm	ARCHglobalelem,8,8
	.type	.L.str42,@object        # @.str42
.L.str42:
	.asciz	"malloc failed for ARCHglobalelem\n"
	.size	.L.str42, 34

	.type	.L.str43,@object        # @.str43
.L.str43:
	.asciz	"%s: Reading sparse matrix structure.\n"
	.size	.L.str43, 38

	.type	.L.str44,@object        # @.str44
.L.str44:
	.asciz	"%d %d"
	.size	.L.str44, 6

	.type	ARCHmatrixlen,@object   # @ARCHmatrixlen
	.comm	ARCHmatrixlen,4,4
	.type	ARCHcholeskylen,@object # @ARCHcholeskylen
	.comm	ARCHcholeskylen,4,4
	.type	.L.str45,@object        # @.str45
.L.str45:
	.asciz	"malloc failed for ARCHmatrixcol\n"
	.size	.L.str45, 33

	.type	.L.str46,@object        # @.str46
.L.str46:
	.asciz	"malloc failed for ARCHmatrixindex\n"
	.size	.L.str46, 35

	.type	.L.str47,@object        # @.str47
.L.str47:
	.asciz	"%s: error: (1)idx buffer too small (%d >= %d)\n"
	.size	.L.str47, 47

	.type	.L.str48,@object        # @.str48
.L.str48:
	.asciz	"malloc failed for nodekindf\n"
	.size	.L.str48, 29

	.type	.L.str49,@object        # @.str49
.L.str49:
	.asciz	"malloc failed for nodekind\n"
	.size	.L.str49, 28

	.type	.L.str50,@object        # @.str50
.L.str50:
	.asciz	"malloc failed for source_elms\n"
	.size	.L.str50, 31

	.type	.L.str51,@object        # @.str51
.L.str51:
	.asciz	"malloc failed for vel\n"
	.size	.L.str51, 23

	.type	.L.str52,@object        # @.str52
.L.str52:
	.asciz	"malloc failed for vel[%d]\n"
	.size	.L.str52, 27

	.type	.L.str53,@object        # @.str53
.L.str53:
	.asciz	"malloc failed for M\n"
	.size	.L.str53, 21

	.type	.L.str54,@object        # @.str54
.L.str54:
	.asciz	"malloc failed for M[%d]\n"
	.size	.L.str54, 25

	.type	.L.str55,@object        # @.str55
.L.str55:
	.asciz	"malloc failed for C\n"
	.size	.L.str55, 21

	.type	.L.str56,@object        # @.str56
.L.str56:
	.asciz	"malloc failed for C[%d]\n"
	.size	.L.str56, 25

	.type	.L.str57,@object        # @.str57
.L.str57:
	.asciz	"malloc failed for M23\n"
	.size	.L.str57, 23

	.type	.L.str58,@object        # @.str58
.L.str58:
	.asciz	"malloc failed for M23[%d]\n"
	.size	.L.str58, 27

	.type	.L.str59,@object        # @.str59
.L.str59:
	.asciz	"malloc failed for C23\n"
	.size	.L.str59, 23

	.type	.L.str60,@object        # @.str60
.L.str60:
	.asciz	"malloc failed for C23[%d]\n"
	.size	.L.str60, 27

	.type	.L.str61,@object        # @.str61
.L.str61:
	.asciz	"malloc failed for V23\n"
	.size	.L.str61, 23

	.type	.L.str62,@object        # @.str62
.L.str62:
	.asciz	"malloc failed for V23[%d]\n"
	.size	.L.str62, 27

	.type	.L.str63,@object        # @.str63
.L.str63:
	.asciz	"malloc failed for disp\n"
	.size	.L.str63, 24

	.type	.L.str64,@object        # @.str64
.L.str64:
	.asciz	"malloc failed for disp[%d]\n"
	.size	.L.str64, 28

	.type	.L.str65,@object        # @.str65
.L.str65:
	.asciz	"malloc failed for disp[%d][%d]\n"
	.size	.L.str65, 32

	.type	.L.str66,@object        # @.str66
.L.str66:
	.asciz	"malloc failed for K\n"
	.size	.L.str66, 21

	.type	.L.str67,@object        # @.str67
.L.str67:
	.asciz	"malloc failed for K[%d]\n"
	.size	.L.str67, 25

	.type	.L.str68,@object        # @.str68
.L.str68:
	.asciz	"malloc failed for K[%d][%d]\n"
	.size	.L.str68, 29

	.type	.Lstr,@object           # @str
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr:
	.asciz	"The command syntax is:\n"
	.size	.Lstr, 24

	.type	.Lstr69,@object         # @str69
	.align	16
.Lstr69:
	.asciz	"Command line options:\n"
	.size	.Lstr69, 23

	.type	.Lstr70,@object         # @str70
	.align	16
.Lstr70:
	.asciz	"    -Q  Quietly suppress all explanation of what this program is doing"
	.size	.Lstr70, 71

	.type	.Lstr71,@object         # @str71
	.align	16
.Lstr71:
	.asciz	"        unless an error occurs."
	.size	.Lstr71, 32

	.type	.Lstr72,@object         # @str72
	.align	16
.Lstr72:
	.asciz	"    -h  Print this message and exit."
	.size	.Lstr72, 37


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
