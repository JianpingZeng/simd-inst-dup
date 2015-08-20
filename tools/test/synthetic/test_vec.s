	.file	"test_vec.bc"
	.text
	.globl	init
	.align	16, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp5:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp6:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp7:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp8:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp9:
	.cfi_def_cfa_offset 48
.Ltmp10:
	.cfi_offset %rbx, -40
.Ltmp11:
	.cfi_offset %r12, -32
.Ltmp12:
	.cfi_offset %r14, -24
.Ltmp13:
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	.align	16, 0x90
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%r12,%rbx,4)
	callq	rand
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	%xmm0, (%r15,%rbx,4)
	callq	rand
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	%xmm0, (%r14,%rbx,4)
	incq	%rbx
	cmpq	$1000, %rbx             # imm = 0x3E8
	jne	.LBB0_1
# BB#2:                                 # %for.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
.Ltmp14:
	.size	init, .Ltmp14-init
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp18:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp19:
	.cfi_def_cfa_offset 24
	subq	$12008, %rsp            # imm = 0x2EE8
.Ltmp20:
	.cfi_def_cfa_offset 12032
.Ltmp21:
	.cfi_offset %rbx, -24
.Ltmp22:
	.cfi_offset %r14, -16
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 8000(%rsp,%rbx,4)
	callq	rand
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	%xmm0, 4000(%rsp,%rbx,4)
	callq	rand
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	vmovss	%xmm0, (%rsp,%rbx,4)
	incq	%rbx
	cmpq	$1000, %rbx             # imm = 0x3E8
	jne	.LBB1_1
# BB#2:
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	vmovss	8000(%rsp,%r14,4), %xmm0
	vaddss	4000(%rsp,%r14,4), %xmm0, %xmm0
	vmovss	%xmm0, (%rsp,%r14,4)
	addq	$2, %r14
	cmpl	$1000, %r14d            # imm = 0x3E8
	jl	.LBB1_3
	.align	16, 0x90
.LBB1_4:                                # %for.body10
                                        # =>This Inner Loop Header: Depth=1
	vcvtss2sd	(%rsp,%rbx,4), %xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	incq	%rbx
	cmpq	$1000, %rbx             # imm = 0x3E8
	jne	.LBB1_4
# BB#5:                                 # %for.end14
	movl	$1, %eax
	addq	$12008, %rsp            # imm = 0x2EE8
	popq	%rbx
	popq	%r14
	ret
.Ltmp23:
	.size	main, .Ltmp23-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lf "
	.size	.L.str, 5


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
	.section	".note.GNU-stack","",@progbits
