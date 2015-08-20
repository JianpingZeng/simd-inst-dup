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
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$116, %esp
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#1:                                 # %entry.split43
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#2:                                 # %entry.split43.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#3:                                 # %entry.split43.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#4:                                 # %entry.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#5:                                 # %entry.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#6:                                 # %entry.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#7:                                 # %entry.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#8:                                 # %entry.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#9:                                 # %entry.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#10:                                # %entry.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#11:                                # %entry.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#12:                                # %entry.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#13:                                # %entry.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#14:                                # %entry.split.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#15:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#16:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#17:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#18:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movl	12(%ebp), %edx
	vmovddup	(%edx), %xmm0
	movl	16(%ebp), %ecx
	vmovddup	(%ecx), %xmm1
	vsubpd	%xmm1, %xmm0, %xmm1
	vmovddup	8(%edx), %xmm0
	vmovddup	8(%ecx), %xmm2
	vsubpd	%xmm2, %xmm0, %xmm2
	vmovddup	16(%edx), %xmm0
	vmovddup	16(%ecx), %xmm3
	vsubpd	%xmm3, %xmm0, %xmm3
	vmovddup	24(%edx), %xmm0
	vmovddup	32(%edx), %xmm4
	vmovddup	40(%edx), %xmm5
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
	vmovddup	24(%ecx), %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vsubpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm2
	vsubpd	%xmm1, %xmm2, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vcmpltpd	%xmm1, %xmm2, %xmm2
	vpextrd	$2, %xmm2, %eax
	andl	$1, %eax
	movb	%al, -42(%ebp)
	vmovd	%xmm2, %eax
	andl	$1, %eax
	movb	%al, -42(%ebp)
	movb	-42(%ebp), %al
	testb	%al, %al
	je	.LBB0_48
# BB#19:                                # %if.then
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#20:                                # %if.then.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#21:                                # %if.then.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#22:                                # %if.then.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#23:                                # %if.then.split.split.split.split
	vxorpd	.LCPI0_0, %xmm0, %xmm0
	vsqrtpd	%xmm1, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcmpltpd	%xmm0, %xmm1, %xmm1
	vpextrd	$2, %xmm1, %eax
	andl	$1, %eax
	movb	%al, -52(%ebp)
	vmovd	%xmm1, %eax
	andl	$1, %eax
	movb	%al, -52(%ebp)
	movb	-52(%ebp), %al
	testb	%al, %al
	je	.LBB0_48
# BB#24:                                # %land.lhs.true
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_49
# BB#25:                                # %land.lhs.true.split
	movl	8(%ebp), %eax
	vmovddup	(%eax), %xmm1
	vcmpltpd	%xmm1, %xmm0, %xmm1
	vpextrd	$2, %xmm1, %ebx
	andl	$1, %ebx
	movb	%bl, -56(%ebp)
	vmovd	%xmm1, %ebx
	andl	$1, %ebx
	movb	%bl, -56(%ebp)
	movb	-56(%ebp), %bl
	testb	%bl, %bl
	je	.LBB0_48
# BB#26:                                # %if.then24
	vmovhpd	%xmm0, (%eax)
	movl	$1, 56(%eax)
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB0_49
# BB#27:                                # %if.then24.split45
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB0_49
# BB#28:                                # %if.then24.split45.split
	vmovddup	(%edx), %xmm1
	vmovddup	24(%edx), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovhpd	%xmm1, 8(%eax)
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB0_49
# BB#29:                                # %if.then24.split45.split.split
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB0_49
# BB#30:                                # %if.then24.split45.split.split.split
	vmovddup	8(%edx), %xmm2
	vmovddup	32(%edx), %xmm3
	vmulpd	%xmm3, %xmm0, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vmovhpd	%xmm2, 16(%eax)
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB0_49
# BB#31:                                # %if.then24.split44
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB0_49
# BB#32:                                # %if.then24.split44.split
	vmovddup	16(%edx), %xmm3
	vmovddup	40(%edx), %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm3
	vmovhpd	%xmm3, 24(%eax)
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB0_49
# BB#33:                                # %if.then24.split44.split.split
	vmovddup	(%ecx), %xmm0
	vsubpd	%xmm0, %xmm1, %xmm0
	vmovhpd	%xmm0, 32(%eax)
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB0_49
# BB#34:                                # %if.then24.split44.split.split.split
	vmovddup	8(%ecx), %xmm1
	vsubpd	%xmm1, %xmm2, %xmm1
	vmovhpd	%xmm1, 40(%eax)
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB0_49
# BB#35:                                # %if.then24.split
	vmovddup	16(%ecx), %xmm2
	vsubpd	%xmm2, %xmm3, %xmm2
	vmovhpd	%xmm2, 48(%eax)
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#36:                                # %if.then24.split.split47
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#37:                                # %if.then24.split.split46
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#38:                                # %if.then24.split.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#39:                                # %if.then24.split.split.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#40:                                # %if.then24.split.split.split.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#41:                                # %if.then24.split.split.split.split.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#42:                                # %if.then24.split.split.split.split.split.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#43:                                # %if.then24.split.split.split.split.split.split.split
	vmulpd	%xmm0, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm2, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vandpd	.LCPI0_1, %xmm0, %xmm1
	vmovapd	.LCPI0_2, %xmm2
	vcmpltpd	%xmm1, %xmm2, %xmm1
	vpextrd	$2, %xmm1, %ecx
	andl	$1, %ecx
	movb	%cl, -92(%ebp)
	vmovd	%xmm1, %ecx
	andl	$1, %ecx
	movb	%cl, -92(%ebp)
	movb	-92(%ebp), %cl
	testb	%cl, %cl
	je	.LBB0_48
# BB#44:                                # %if.then.i
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#45:                                # %if.then.i.split
	vmovddup	32(%eax), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm1
	vmovhpd	%xmm1, 32(%eax)
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB0_49
# BB#46:                                # %if.then.i.split.split
	vmovddup	40(%eax), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm1
	vmovhpd	%xmm1, 40(%eax)
	xorl	%ecx, %ecx
	testb	%cl, %cl
	je	.LBB0_47
.LBB0_49:                               # %relExit
	movl	$.Lfunc, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB0_48:                               # %if.end69
	addl	$116, %esp
	popl	%ebx
	popl	%ebp
	ret
.LBB0_47:                               # %if.then.i.split.split.split
	vmovddup	48(%eax), %xmm1
	vdivpd	%xmm0, %xmm1, %xmm0
	vmovhpd	%xmm0, 48(%eax)
	jmp	.LBB0_48
.Ltmp0:
	.size	ray_sphere_intersect, .Ltmp0-ray_sphere_intersect

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
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$84, %esp
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_33
# BB#1:                                 # %entry.split29
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_33
# BB#2:                                 # %entry.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_33
# BB#3:                                 # %entry.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_33
# BB#4:                                 # %entry.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_33
# BB#5:                                 # %entry.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_33
# BB#6:                                 # %entry.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB1_33
# BB#7:                                 # %entry.split.split.split.split.split.split
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	vmovddup	24(%eax), %xmm1
	vmovddup	32(%eax), %xmm2
	vmovddup	40(%eax), %xmm0
	vmovddup	24(%ecx), %xmm3
	vmovddup	32(%ecx), %xmm4
	vmovddup	40(%ecx), %xmm5
	vmulpd	%xmm3, %xmm1, %xmm3
	vmulpd	%xmm4, %xmm2, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmulpd	%xmm5, %xmm0, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vandpd	.LCPI1_0, %xmm3, %xmm4
	vcmpltpd	.LCPI1_1, %xmm4, %xmm4
	vpextrd	$2, %xmm4, %edx
	andl	$1, %edx
	movb	%dl, -20(%ebp)
	vmovd	%xmm4, %edx
	andl	$1, %edx
	movb	%dl, -20(%ebp)
	movb	-20(%ebp), %dl
	testb	%dl, %dl
	jne	.LBB1_32
# BB#8:                                 # %if.end
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#9:                                 # %if.end.split28
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#10:                                # %if.end.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#11:                                # %if.end.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#12:                                # %if.end.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#13:                                # %if.end.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#14:                                # %if.end.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#15:                                # %if.end.split.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#16:                                # %if.end.split.split.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#17:                                # %if.end.split.split.split.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#18:                                # %if.end.split.split.split.split.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#19:                                # %if.end.split.split.split.split.split.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#20:                                # %if.end.split.split.split.split.split.split.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#21:                                # %if.end.split.split.split.split.split.split.split.split.split.split.split.split
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#22:                                # %if.end.split.split.split.split.split.split.split.split.split.split.split.split.split
	vmovddup	8(%eax), %xmm4
	vmovddup	(%eax), %xmm5
	vmulpd	%xmm4, %xmm2, %xmm4
	vmulpd	%xmm5, %xmm1, %xmm5
	vmovddup	16(%eax), %xmm6
	vmulpd	%xmm6, %xmm0, %xmm6
	vaddpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmovddup	(%ecx), %xmm5
	vmovddup	8(%ecx), %xmm6
	vmovddup	16(%ecx), %xmm7
	vmulpd	%xmm5, %xmm1, %xmm1
	vmulpd	%xmm6, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmulpd	%xmm7, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vsubpd	%xmm4, %xmm0, %xmm0
	vxorpd	.LCPI1_2, %xmm0, %xmm0
	vdivpd	%xmm3, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcmpltpd	%xmm0, %xmm1, %xmm1
	vpextrd	$2, %xmm1, %edx
	andl	$1, %edx
	movb	%dl, -50(%ebp)
	vmovd	%xmm1, %edx
	andl	$1, %edx
	movb	%dl, -50(%ebp)
	movb	-50(%ebp), %dl
	testb	%dl, %dl
	je	.LBB1_32
# BB#23:                                # %land.lhs.true
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB1_33
# BB#24:                                # %land.lhs.true.split
	movl	8(%ebp), %edx
	vmovddup	(%edx), %xmm1
	vcmpltpd	%xmm1, %xmm0, %xmm1
	vpextrd	$2, %xmm1, %ebx
	andl	$1, %ebx
	movb	%bl, -54(%ebp)
	vmovd	%xmm1, %ebx
	andl	$1, %ebx
	movb	%bl, -54(%ebp)
	movb	-54(%ebp), %bl
	testb	%bl, %bl
	je	.LBB1_32
# BB#25:                                # %if.then10
	vmovhpd	%xmm0, (%edx)
	movl	$1, 56(%edx)
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB1_33
# BB#26:                                # %if.then10.split30
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB1_33
# BB#27:                                # %if.then10.split30.split
	vmovddup	(%ecx), %xmm1
	vmovddup	24(%ecx), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovhpd	%xmm1, 8(%edx)
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB1_33
# BB#28:                                # %if.then10.split30.split.split
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB1_33
# BB#29:                                # %if.then10.split30.split.split.split
	vmovddup	8(%ecx), %xmm1
	vmovddup	32(%ecx), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovhpd	%xmm1, 16(%edx)
	xorl	%ebx, %ebx
	testb	%bl, %bl
	jne	.LBB1_33
# BB#30:                                # %if.then10.split30.split.split.split.split
	xorl	%ebx, %ebx
	testb	%bl, %bl
	je	.LBB1_31
.LBB1_33:                               # %relExit
	movl	$.Lfunc1, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB1_32:                               # %if.end34
	addl	$84, %esp
	popl	%ebx
	popl	%ebp
	ret
.LBB1_31:                               # %if.then10.split
	addl	$24, %eax
	vmovddup	16(%ecx), %xmm1
	vmovddup	40(%ecx), %xmm2
	vmulpd	%xmm2, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovhpd	%xmm0, 24(%edx)
	vmovsd	16(%eax), %xmm0
	vmovsd	%xmm0, 48(%edx)
	vmovupd	(%eax), %xmm0
	vmovupd	%xmm0, 32(%edx)
	jmp	.LBB1_32
.Ltmp1:
	.size	ray_plane_intersect, .Ltmp1-ray_plane_intersect

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_0:
	.quad	-4619792497756654797    # double -6.000000e-01
	.quad	-4619792497756654797    # double -6.000000e-01
.LCPI2_1:
	.quad	4603579539098121011     # double 6.000000e-01
	.quad	4603579539098121011     # double 6.000000e-01
.LCPI2_2:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI2_4:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI2_5:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_3:
	.quad	4607182418800017408     # double 1
	.text
	.globl	orthoBasis
	.align	16, 0x90
	.type	orthoBasis,@function
orthoBasis:                             # @orthoBasis
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$256, %esp              # imm = 0x100
	movl	8(%ebp), %esi
	vmovsd	28(%ebp), %xmm0
	vmovsd	%xmm0, 64(%esi)
	vmovupd	12(%ebp), %xmm0
	vmovupd	%xmm0, 48(%esi)
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%xmm0, 24(%esi)
	movl	$0, 44(%esi)
	movl	$0, 40(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#1:                                 # %entry.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#2:                                 # %entry.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#3:                                 # %entry.split.split.split
	leal	24(%esi), %edi
	vmovddup	12(%ebp), %xmm1
	vmovapd	.LCPI2_0, %xmm0
	vcmpltpd	%xmm1, %xmm0, %xmm2
	vcmpltpd	.LCPI2_1, %xmm1, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vpextrd	$2, %xmm1, %eax
	andl	$1, %eax
	movb	%al, -16(%ebp)
	vmovd	%xmm1, %eax
	andl	$1, %eax
	movb	%al, -16(%ebp)
	movb	-16(%ebp), %al
	testb	%al, %al
	jne	.LBB2_15
# BB#4:                                 # %if.else
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#5:                                 # %if.else.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#6:                                 # %if.else.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#7:                                 # %if.else.split.split.split
	leal	12(%ebp), %eax
	vmovddup	8(%eax), %xmm1
	vcmpltpd	%xmm1, %xmm0, %xmm2
	vcmpltpd	.LCPI2_1, %xmm1, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vpextrd	$2, %xmm1, %ecx
	andl	$1, %ecx
	movb	%cl, -24(%ebp)
	vmovd	%xmm1, %ecx
	andl	$1, %ecx
	movb	%cl, -24(%ebp)
	movb	-24(%ebp), %cl
	testb	%cl, %cl
	je	.LBB2_10
# BB#8:                                 # %if.then14
	movl	$1072693248, 36(%esi)   # imm = 0x3FF00000
	movl	$0, 32(%esi)
	vmovapd	.LCPI2_2, %xmm3
	vmovsd	.LCPI2_3, %xmm0
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm1, %xmm1, %xmm1
.LBB2_9:                                # %if.end30
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm4, %xmm4, %xmm4
	jmp	.LBB2_16
.LBB2_10:                               # %if.else17
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB2_62
# BB#11:                                # %if.else17.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB2_62
# BB#12:                                # %if.else17.split.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB2_62
# BB#13:                                # %if.else17.split.split.split
	vmovddup	16(%eax), %xmm1
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vcmpltpd	.LCPI2_1, %xmm1, %xmm1
	vandpd	%xmm0, %xmm1, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -32(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -32(%ebp)
	movb	-32(%ebp), %al
	testb	%al, %al
	je	.LBB2_15
# BB#14:                                # %if.then23
	movl	$1072693248, 44(%esi)   # imm = 0x3FF00000
	movl	$0, 40(%esi)
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI2_2, %xmm6
	vmovsd	.LCPI2_3, %xmm1
	jmp	.LBB2_9
.LBB2_15:                               # %if.else26
	movl	$1072693248, 4(%edi)    # imm = 0x3FF00000
	movl	$0, (%edi)
	vmovapd	.LCPI2_2, %xmm4
	vmovsd	.LCPI2_3, %xmm2
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
.LBB2_16:                               # %if.end30
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#17:                                # %if.end30.split50
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#18:                                # %if.end30.split50.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#19:                                # %if.end30.split50.split.split
	vmovsd	56(%esi), %xmm5
	vmovapd	%xmm5, -168(%ebp)       # 16-byte Spill
	vpermilpd	$0, %xmm5, %xmm7 # xmm7 = xmm5[0,0]
	vmovapd	%xmm7, -200(%ebp)       # 16-byte Spill
	vmovsd	64(%esi), %xmm5
	vmovapd	%xmm5, -184(%ebp)       # 16-byte Spill
	vpermilpd	$0, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vmovapd	%xmm5, -152(%ebp)       # 16-byte Spill
	vmulpd	%xmm5, %xmm3, %xmm5
	vmulpd	%xmm7, %xmm6, %xmm7
	vsubpd	%xmm7, %xmm5, %xmm7
	vmovsd	48(%esi), %xmm5
	vmovhpd	%xmm7, (%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#20:                                # %if.end30.split50.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#21:                                # %if.end30.split50.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#22:                                # %if.end30.split50.split.split.split.split.split
	vmovapd	%xmm7, -232(%ebp)       # 16-byte Spill
	vpermilpd	$0, %xmm5, %xmm7 # xmm7 = xmm5[0,0]
	vmovapd	%xmm7, -216(%ebp)       # 16-byte Spill
	vmovapd	%xmm5, -248(%ebp)       # 16-byte Spill
	vmulpd	-216(%ebp), %xmm6, %xmm5 # 16-byte Folded Reload
	vmulpd	-152(%ebp), %xmm4, %xmm6 # 16-byte Folded Reload
	vsubpd	%xmm6, %xmm5, %xmm5
	vmovapd	%xmm5, -152(%ebp)       # 16-byte Spill
	vmovhpd	%xmm5, 8(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#23:                                # %if.end30.split50.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#24:                                # %if.end30.split50.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#25:                                # %if.end30.split50.split.split.split.split.split.split.split.split
	vmulpd	-200(%ebp), %xmm4, %xmm4 # 16-byte Folded Reload
	vmulpd	-216(%ebp), %xmm3, %xmm3 # 16-byte Folded Reload
	vsubpd	%xmm3, %xmm4, %xmm3
	vmovapd	%xmm3, -200(%ebp)       # 16-byte Spill
	vmovhpd	%xmm3, 16(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#26:                                # %if.end30.split50.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#27:                                # %if.end30.split50.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#28:                                # %if.end30.split50.split.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#29:                                # %if.end30.split50.split.split.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#30:                                # %if.end30.split49
	vmovapd	-184(%ebp), %xmm6       # 16-byte Reload
	vmulsd	%xmm6, %xmm0, %xmm3
	vmovapd	-168(%ebp), %xmm5       # 16-byte Reload
	vmulsd	%xmm5, %xmm1, %xmm4
	vsubsd	%xmm4, %xmm3, %xmm3
	vmulsd	-248(%ebp), %xmm1, %xmm1 # 16-byte Folded Reload
	vmulsd	%xmm6, %xmm2, %xmm4
	vsubsd	%xmm4, %xmm1, %xmm1
	vmulsd	%xmm5, %xmm2, %xmm2
	vmulsd	-248(%ebp), %xmm0, %xmm0 # 16-byte Folded Reload
	vsubsd	%xmm0, %xmm2, %xmm0
	vmulsd	%xmm3, %xmm3, %xmm2
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%esp)
	calll	sqrt
	vmovapd	-232(%ebp), %xmm0       # 16-byte Reload
	fstpl	-72(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#31:                                # %if.end30.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#32:                                # %if.end30.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#33:                                # %if.end30.split.split.split
	vmulpd	%xmm0, %xmm0, %xmm0
	vmovapd	-152(%ebp), %xmm1       # 16-byte Reload
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	-200(%ebp), %xmm1       # 16-byte Reload
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vsqrtpd	%xmm0, %xmm2
	vandpd	.LCPI2_4, %xmm2, %xmm1
	vmovapd	.LCPI2_5, %xmm0
	vcmpltpd	%xmm1, %xmm0, %xmm1
	vpextrd	$2, %xmm1, %eax
	andl	$1, %eax
	movb	%al, -78(%ebp)
	vmovd	%xmm1, %eax
	andl	$1, %eax
	movb	%al, -78(%ebp)
	movb	-78(%ebp), %al
	vmovsd	(%esi), %xmm1
	vpermilpd	$0, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	testb	%al, %al
	je	.LBB2_34
# BB#35:                                # %if.then.i76
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#36:                                # %if.then.i76.split
	vdivpd	%xmm2, %xmm1, %xmm1
	vmovhpd	%xmm1, (%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#37:                                # %if.then.i76.split.split
	vmovsd	8(%esi), %xmm3
	vpermilpd	$0, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vdivpd	%xmm2, %xmm3, %xmm3
	vmovhpd	%xmm3, 8(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#38:                                # %if.then.i76.split.split.split
	vmovsd	16(%esi), %xmm4
	vpermilpd	$0, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vdivpd	%xmm2, %xmm4, %xmm4
	vmovhpd	%xmm4, 16(%esi)
	jmp	.LBB2_39
.LBB2_34:                               # %if.end30.vnormalize.exit77_crit_edge
	vmovsd	8(%esi), %xmm2
	vmovsd	16(%esi), %xmm4
	vpermilpd	$0, %xmm2, %xmm3 # xmm3 = xmm2[0,0]
	vpermilpd	$0, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
.LBB2_39:                               # %vnormalize.exit77
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#40:                                # %vnormalize.exit77.split51
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#41:                                # %vnormalize.exit77.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#42:                                # %vnormalize.exit77.split.split
	vmovddup	48(%esi), %xmm5
	vmovddup	56(%esi), %xmm6
	vmovddup	64(%esi), %xmm7
	vmulpd	%xmm6, %xmm4, %xmm2
	vmulpd	%xmm7, %xmm3, %xmm0
	vsubpd	%xmm0, %xmm2, %xmm2
	vmovhpd	%xmm2, (%edi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#43:                                # %vnormalize.exit77.split.split.split53
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#44:                                # %vnormalize.exit77.split.split.split53.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#45:                                # %vnormalize.exit77.split.split.split53.split.split
	vmulpd	%xmm7, %xmm1, %xmm0
	vmulpd	%xmm5, %xmm4, %xmm4
	vsubpd	%xmm4, %xmm0, %xmm4
	vmovhpd	%xmm4, 32(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#46:                                # %vnormalize.exit77.split.split.split53.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#47:                                # %vnormalize.exit77.split.split.split53.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#48:                                # %vnormalize.exit77.split.split.split53.split.split.split.split.split
	vmulpd	%xmm5, %xmm3, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm1
	vmovhpd	%xmm1, 40(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#49:                                # %vnormalize.exit77.split.split.split53.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#50:                                # %vnormalize.exit77.split.split.split52
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#51:                                # %vnormalize.exit77.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#52:                                # %vnormalize.exit77.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#53:                                # %vnormalize.exit77.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#54:                                # %vnormalize.exit77.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#55:                                # %vnormalize.exit77.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#56:                                # %vnormalize.exit77.split.split.split.split.split.split.split.split
	vmulpd	%xmm2, %xmm2, %xmm0
	vmulpd	%xmm4, %xmm4, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vsqrtpd	%xmm0, %xmm1
	vandpd	.LCPI2_4, %xmm1, %xmm0
	vmovapd	.LCPI2_5, %xmm2
	vcmpltpd	%xmm0, %xmm2, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -120(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -120(%ebp)
	movb	-120(%ebp), %al
	testb	%al, %al
	je	.LBB2_61
# BB#57:                                # %if.then.i
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#58:                                # %if.then.i.split
	vmovddup	(%edi), %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, 24(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB2_62
# BB#59:                                # %if.then.i.split.split
	vmovddup	32(%esi), %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, 32(%esi)
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB2_60
.LBB2_62:                               # %relExit
	movl	$.Lfunc2, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB2_61:                               # %vnormalize.exit
	addl	$256, %esp              # imm = 0x100
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.LBB2_60:                               # %if.then.i.split.split.split
	vmovddup	40(%esi), %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, 40(%esi)
	jmp	.LBB2_61
.Ltmp2:
	.size	orthoBasis, .Ltmp2-orthoBasis

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
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
.LCPI3_8:
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	0                       # 0x0
.LCPI3_9:
	.long	16                      # 0x10
	.long	0                       # 0x0
	.long	16                      # 0x10
	.long	0                       # 0x0
.LCPI3_10:
	.quad	4643211215818981376     # double 2.560000e+02
	.quad	4643211215818981376     # double 2.560000e+02
.LCPI3_11:
	.quad	4571153621781053440     # double 3.906250e-03
	.quad	4571153621781053440     # double 3.906250e-03
.LCPI3_12:
	.zero	16
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_7:
	.quad	4607182418800017408     # double 1
	.text
	.globl	ambient_occlusion
	.align	16, 0x90
	.type	ambient_occlusion,@function
ambient_occlusion:                      # @ambient_occlusion
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$748, %esp              # imm = 0x2EC
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB3_78
# BB#1:                                 # %entry.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB3_78
# BB#2:                                 # %entry.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB3_78
# BB#3:                                 # %entry.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB3_78
# BB#4:                                 # %entry.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB3_78
# BB#5:                                 # %entry.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB3_78
# BB#6:                                 # %entry.split.split.split.split.split.split
	movl	12(%ebp), %eax
	vmovddup	8(%eax), %xmm0
	vmovddup	32(%eax), %xmm1
	vmulpd	.LCPI3_0, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, -488(%ebp)       # 16-byte Spill
	vmovddup	16(%eax), %xmm0
	vmovddup	40(%eax), %xmm1
	vmulpd	.LCPI3_0, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, -504(%ebp)       # 16-byte Spill
	vmovddup	24(%eax), %xmm0
	vmovddup	48(%eax), %xmm1
	leal	32(%eax), %eax
	vmulpd	.LCPI3_0, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	%xmm0, -520(%ebp)       # 16-byte Spill
	vmovsd	16(%eax), %xmm0
	vmovsd	%xmm0, 20(%esp)
	vmovups	(%eax), %xmm0
	vmovups	%xmm0, 4(%esp)
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	calll	orthoBasis
	vmovddup	-88(%ebp), %xmm0
	vmovapd	%xmm0, -536(%ebp)       # 16-byte Spill
	vmovddup	-64(%ebp), %xmm0
	vmovapd	%xmm0, -552(%ebp)       # 16-byte Spill
	vmovddup	-40(%ebp), %xmm0
	vmovapd	%xmm0, -568(%ebp)       # 16-byte Spill
	vmovddup	-80(%ebp), %xmm0
	vmovapd	%xmm0, -584(%ebp)       # 16-byte Spill
	vmovddup	-56(%ebp), %xmm0
	vmovapd	%xmm0, -600(%ebp)       # 16-byte Spill
	vmovddup	-32(%ebp), %xmm0
	vmovapd	%xmm0, -616(%ebp)       # 16-byte Spill
	vmovddup	-72(%ebp), %xmm0
	vmovapd	%xmm0, -632(%ebp)       # 16-byte Spill
	vmovddup	-48(%ebp), %xmm0
	vmovapd	%xmm0, -648(%ebp)       # 16-byte Spill
	vmovddup	-24(%ebp), %xmm0
	vmovapd	%xmm0, -664(%ebp)       # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -688(%ebp)       # 8-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -728(%ebp)       # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -712(%ebp)       # 16-byte Spill
	xorl	%ebx, %ebx
	leal	-136(%ebp), %esi
	leal	-200(%ebp), %edi
.LBB3_7:                                # %for.cond17.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -680(%ebp)       # 16-byte Spill
.LBB3_8:                                # %for.body19
                                        #   Parent Loop BB3_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	calll	drand48
	fstpl	-224(%ebp)
	testb	%bl, %bl
	jne	.LBB3_78
# BB#9:                                 # %for.body19.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovsd	-224(%ebp), %xmm0
	vmovapd	%xmm0, -456(%ebp)       # 16-byte Spill
	calll	drand48
	fstpl	-240(%ebp)
	testb	%bl, %bl
	jne	.LBB3_78
# BB#10:                                # %for.body19.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovsd	-240(%ebp), %xmm0
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmulpd	.LCPI3_1, %xmm0, %xmm0
	vmovapd	%xmm0, -440(%ebp)       # 16-byte Spill
	vmovlpd	%xmm0, (%esp)
	calll	cos
	vmovapd	-440(%ebp), %xmm0       # 16-byte Reload
	vmovhpd	%xmm0, (%esp)
	fstpl	-256(%ebp)
	calll	cos
	fstpl	-264(%ebp)
	testb	%bl, %bl
	jne	.LBB3_78
# BB#11:                                # %for.body19.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#12:                                # %for.body19.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovsd	-256(%ebp), %xmm0
	vmovhpd	-264(%ebp), %xmm0, %xmm0
	vmovapd	%xmm0, -472(%ebp)       # 16-byte Spill
	vmovapd	-440(%ebp), %xmm0       # 16-byte Reload
	vmovlpd	%xmm0, (%esp)
	calll	sin
	vmovapd	-440(%ebp), %xmm0       # 16-byte Reload
	vmovhpd	%xmm0, (%esp)
	fstpl	-280(%ebp)
	calll	sin
	fstpl	-288(%ebp)
	testb	%bl, %bl
	jne	.LBB3_78
# BB#13:                                # %for.body19.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#14:                                # %for.body19.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#15:                                # %for.body19.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#16:                                # %for.body19.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#17:                                # %for.body19.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#18:                                # %for.body19.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#19:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#20:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#21:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#22:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#23:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#24:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#25:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#26:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#27:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#28:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#29:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#30:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#31:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#32:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vpermilpd	$0, -456(%ebp), %xmm0 # 16-byte Folded Reload
                                        # xmm0 = mem[0,0]
	vsqrtpd	%xmm0, %xmm0
	vmulpd	-472(%ebp), %xmm0, %xmm1 # 16-byte Folded Reload
	vmovsd	-280(%ebp), %xmm2
	vmovhpd	-288(%ebp), %xmm2, %xmm2
	vmulpd	%xmm2, %xmm0, %xmm2
	vmulpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI3_2, %xmm3
	vsubpd	%xmm0, %xmm3, %xmm0
	vsqrtpd	%xmm0, %xmm0
	vmovapd	-536(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm3
	vmovapd	-552(%ebp), %xmm4       # 16-byte Reload
	vmulpd	%xmm2, %xmm4, %xmm4
	vaddpd	%xmm4, %xmm3, %xmm3
	vmovapd	-568(%ebp), %xmm4       # 16-byte Reload
	vmulpd	%xmm0, %xmm4, %xmm4
	vaddpd	%xmm3, %xmm4, %xmm3
	vmovapd	-584(%ebp), %xmm4       # 16-byte Reload
	vmulpd	%xmm1, %xmm4, %xmm4
	vmovapd	-600(%ebp), %xmm5       # 16-byte Reload
	vmulpd	%xmm2, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm4
	vmovapd	-616(%ebp), %xmm5       # 16-byte Reload
	vmulpd	%xmm0, %xmm5, %xmm5
	vaddpd	%xmm4, %xmm5, %xmm4
	vmovapd	-632(%ebp), %xmm5       # 16-byte Reload
	vmulpd	%xmm1, %xmm5, %xmm1
	vmovapd	-648(%ebp), %xmm5       # 16-byte Reload
	vmulpd	%xmm2, %xmm5, %xmm2
	vaddpd	%xmm2, %xmm1, %xmm1
	vmovapd	-664(%ebp), %xmm2       # 16-byte Reload
	vmulpd	%xmm0, %xmm2, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovapd	-488(%ebp), %xmm1       # 16-byte Reload
	vmovhpd	%xmm1, -136(%ebp)
	vmovapd	-504(%ebp), %xmm1       # 16-byte Reload
	vmovhpd	%xmm1, -128(%ebp)
	vmovapd	-520(%ebp), %xmm1       # 16-byte Reload
	vmovhpd	%xmm1, -120(%ebp)
	vmovhpd	%xmm3, -112(%ebp)
	vmovhpd	%xmm4, -104(%ebp)
	vmovhpd	%xmm0, -96(%ebp)
	movl	$1131820119, -196(%ebp) # imm = 0x43763457
	movl	$-2049400832, -200(%ebp) # imm = 0xFFFFFFFF85D8A000
	movl	$0, -144(%ebp)
	movl	%esi, 4(%esp)
	movl	%edi, (%esp)
	movl	$spheres, 8(%esp)
	calll	ray_sphere_intersect
	movl	%esi, 4(%esp)
	movl	%edi, (%esp)
	movl	$spheres+32, 8(%esp)
	calll	ray_sphere_intersect
	movl	%esi, 4(%esp)
	movl	%edi, (%esp)
	movl	$spheres+64, 8(%esp)
	calll	ray_sphere_intersect
	testb	%bl, %bl
	jne	.LBB3_78
# BB#33:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#34:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#35:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#36:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#37:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#38:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#39:                                # %for.body19.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovddup	plane+24, %xmm4
	vmovddup	plane+32, %xmm5
	vmovddup	plane+40, %xmm3
	vmovddup	-112(%ebp), %xmm2
	vmovddup	-104(%ebp), %xmm1
	vmovddup	-96(%ebp), %xmm0
	vmulpd	%xmm2, %xmm4, %xmm6
	vmulpd	%xmm1, %xmm5, %xmm7
	vaddpd	%xmm7, %xmm6, %xmm6
	vmulpd	%xmm0, %xmm3, %xmm7
	vaddpd	%xmm7, %xmm6, %xmm6
	vandpd	.LCPI3_3, %xmm6, %xmm7
	vcmpltpd	.LCPI3_4, %xmm7, %xmm7
	vpextrd	$2, %xmm7, %eax
	vmovd	%xmm7, %ecx
	andl	$1, %eax
	movb	%al, -342(%ebp)
	andl	$1, %ecx
	movb	%cl, -342(%ebp)
	movb	-342(%ebp), %al
	testb	%al, %al
	jne	.LBB3_64
# BB#40:                                # %if.end.i
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#41:                                # %if.end.i.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#42:                                # %if.end.i.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#43:                                # %if.end.i.split.split.split68
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#44:                                # %if.end.i.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#45:                                # %if.end.i.split.split.split.split69
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#46:                                # %if.end.i.split.split.split.split69.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#47:                                # %if.end.i.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#48:                                # %if.end.i.split.split.split.split.split70
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#49:                                # %if.end.i.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#50:                                # %if.end.i.split.split.split.split.split.split71
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#51:                                # %if.end.i.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#52:                                # %if.end.i.split.split.split.split.split.split.split72
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#53:                                # %if.end.i.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#54:                                # %if.end.i.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#55:                                # %if.end.i.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#56:                                # %if.end.i.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovddup	plane+8, %xmm7
	vmovapd	%xmm7, -440(%ebp)       # 16-byte Spill
	vmovddup	plane, %xmm7
	vmovapd	%xmm7, -456(%ebp)       # 16-byte Spill
	vmulpd	-440(%ebp), %xmm5, %xmm7 # 16-byte Folded Reload
	vmovapd	%xmm7, -440(%ebp)       # 16-byte Spill
	vmulpd	-456(%ebp), %xmm4, %xmm7 # 16-byte Folded Reload
	vmovapd	%xmm7, -456(%ebp)       # 16-byte Spill
	vmovddup	plane+16, %xmm7
	vmulpd	%xmm7, %xmm3, %xmm7
	vmovapd	%xmm7, -472(%ebp)       # 16-byte Spill
	vmovapd	-440(%ebp), %xmm7       # 16-byte Reload
	vaddpd	-456(%ebp), %xmm7, %xmm7 # 16-byte Folded Reload
	vaddpd	-472(%ebp), %xmm7, %xmm7 # 16-byte Folded Reload
	vmovapd	%xmm7, -456(%ebp)       # 16-byte Spill
	vmovddup	-136(%ebp), %xmm7
	vmovapd	%xmm7, -440(%ebp)       # 16-byte Spill
	vmovddup	-128(%ebp), %xmm7
	vmulpd	-440(%ebp), %xmm4, %xmm4 # 16-byte Folded Reload
	vmulpd	%xmm7, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm5
	vmovddup	-120(%ebp), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm5, %xmm3
	vsubpd	-456(%ebp), %xmm3, %xmm3 # 16-byte Folded Reload
	vxorpd	.LCPI3_5, %xmm3, %xmm3
	vdivpd	%xmm6, %xmm3, %xmm3
	vmovddup	-200(%ebp), %xmm5
	vcmpltpd	%xmm5, %xmm3, %xmm5
	vxorpd	%xmm6, %xmm6, %xmm6
	vcmpltpd	%xmm3, %xmm6, %xmm6
	vandpd	%xmm5, %xmm6, %xmm5
	vpextrd	$2, %xmm5, %eax
	vmovd	%xmm5, %ecx
	andl	$1, %eax
	movb	%al, -376(%ebp)
	andl	$1, %ecx
	movb	%cl, -376(%ebp)
	movb	-376(%ebp), %al
	testb	%al, %al
	je	.LBB3_64
# BB#57:                                # %if.then10.i
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovhpd	%xmm3, -200(%ebp)
	movl	$1, -144(%ebp)
	testb	%bl, %bl
	jne	.LBB3_78
# BB#58:                                # %if.then10.i.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#59:                                # %if.then10.i.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmulpd	%xmm3, %xmm2, %xmm2
	vmovapd	-440(%ebp), %xmm5       # 16-byte Reload
	vaddpd	%xmm2, %xmm5, %xmm2
	vmovhpd	%xmm2, -192(%ebp)
	testb	%bl, %bl
	jne	.LBB3_78
# BB#60:                                # %if.then10.i.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#61:                                # %if.then10.i.split.split.split.split67
                                        #   in Loop: Header=BB3_8 Depth=2
	vmulpd	%xmm3, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm7, %xmm1
	vmovhpd	%xmm1, -184(%ebp)
	testb	%bl, %bl
	jne	.LBB3_78
# BB#62:                                # %if.then10.i.split.split.split.split67.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#63:                                # %if.then10.i.split.split.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmulpd	%xmm3, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vmovhpd	%xmm0, -176(%ebp)
	vmovsd	plane+40, %xmm0
	leal	-168(%ebp), %eax
	vmovsd	%xmm0, 16(%eax)
	vmovupd	plane+24, %xmm0
	vmovupd	%xmm0, (%eax)
.LBB3_64:                               # %ray_plane_intersect.exit
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#65:                                # %ray_plane_intersect.exit.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovd	-144(%ebp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI3_6, %xmm0, %xmm0
	vpcmpeqq	.LCPI3_12, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -392(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -392(%ebp)
	movb	-392(%ebp), %al
	testb	%al, %al
	jne	.LBB3_68
# BB#66:                                # %if.then
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#67:                                #   in Loop: Header=BB3_8 Depth=2
	vmovsd	-688(%ebp), %xmm0       # 8-byte Reload
	vaddsd	.LCPI3_7, %xmm0, %xmm0
	vmovsd	%xmm0, -688(%ebp)       # 8-byte Spill
	vmovapd	-712(%ebp), %xmm0       # 16-byte Reload
	vaddpd	.LCPI3_2, %xmm0, %xmm0
	vmovapd	%xmm0, -712(%ebp)       # 16-byte Spill
.LBB3_68:                               # %if.end
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#69:                                # %if.end.split
                                        #   in Loop: Header=BB3_8 Depth=2
	testb	%bl, %bl
	jne	.LBB3_78
# BB#70:                                # %if.end.split.split
                                        #   in Loop: Header=BB3_8 Depth=2
	vmovdqa	-680(%ebp), %xmm0       # 16-byte Reload
	vpaddq	.LCPI3_8, %xmm0, %xmm0
	vmovdqa	%xmm0, -680(%ebp)       # 16-byte Spill
	vpand	.LCPI3_6, %xmm0, %xmm0
	vpcmpeqq	.LCPI3_9, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -400(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -400(%ebp)
	movb	-400(%ebp), %al
	testb	%al, %al
	je	.LBB3_8
# BB#71:                                # %for.inc71
                                        #   in Loop: Header=BB3_7 Depth=1
	testb	%bl, %bl
	jne	.LBB3_78
# BB#72:                                # %for.inc71.split
                                        #   in Loop: Header=BB3_7 Depth=1
	testb	%bl, %bl
	jne	.LBB3_78
# BB#73:                                # %for.inc71.split.split
                                        #   in Loop: Header=BB3_7 Depth=1
	vmovdqa	-728(%ebp), %xmm0       # 16-byte Reload
	vpaddq	.LCPI3_8, %xmm0, %xmm0
	vmovdqa	%xmm0, -728(%ebp)       # 16-byte Spill
	vpand	.LCPI3_6, %xmm0, %xmm0
	vpcmpeqq	.LCPI3_9, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -406(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -406(%ebp)
	movb	-406(%ebp), %al
	testb	%al, %al
	je	.LBB3_7
# BB#74:                                # %for.end73
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB3_78
# BB#75:                                # %for.end73.split
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB3_76
.LBB3_78:                               # %relExit
	movl	$.Lfunc3, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB3_77:                               # %for.end73.split.split
	addl	$748, %esp              # imm = 0x2EC
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.LBB3_76:                               # %for.end73.split.split
	vmovapd	.LCPI3_10, %xmm0
	vsubpd	-712(%ebp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmulpd	.LCPI3_11, %xmm0, %xmm0
	movl	8(%ebp), %eax
	vmovhpd	%xmm0, (%eax)
	vmovhpd	%xmm0, 8(%eax)
	vmovhpd	%xmm0, 16(%eax)
	jmp	.LBB3_77
.Ltmp3:
	.size	ambient_occlusion, .Ltmp3-ambient_occlusion

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI4_0:
	.quad	4643193623632936960     # double 255.5
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI4_1:
	.quad	4643193623632936960     # double 2.555000e+02
	.quad	4643193623632936960     # double 2.555000e+02
	.text
	.globl	clamp
	.align	16, 0x90
	.type	clamp,@function
clamp:                                  # @clamp
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB4_9
# BB#1:                                 # %entry.split7
	vmovsd	8(%ebp), %xmm0
	vpermilpd	$0, %xmm0, %xmm1 # xmm1 = xmm0[0,0]
	vmulpd	.LCPI4_1, %xmm1, %xmm1
	vmovlpd	%xmm1, -16(%ebp)
	vmovhpd	%xmm1, -32(%ebp)
	fldl	-16(%ebp)
	fisttpll	-24(%ebp)
	fldl	-32(%ebp)
	fisttpll	-40(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB4_9
# BB#2:                                 # %entry.split6
	xorl	%ecx, %ecx
	testb	%cl, %cl
	jne	.LBB4_9
# BB#3:                                 # %entry.split5
	vmulsd	.LCPI4_0, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %eax
	testl	%eax, %eax
	cmovsl	%ecx, %eax
	testb	%cl, %cl
	jne	.LBB4_9
# BB#4:                                 # %entry.split
	xorl	%ecx, %ecx
	testb	%cl, %cl
	je	.LBB4_5
.LBB4_9:                                # %relExit
	movl	$.Lfunc4, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
	xorl	%eax, %eax
.LBB4_8:                                # %entry.split.split
	addl	$56, %esp
	popl	%ebp
	ret
.LBB4_5:                                # %entry.split.split
	movb	$-1, %cl
	cmpl	$255, %eax
	jg	.LBB4_7
# BB#6:                                 # %entry.split.split
	movb	%al, %cl
.LBB4_7:                                # %entry.split.split
	movzbl	%cl, %eax
	jmp	.LBB4_8
.Ltmp4:
	.size	clamp, .Ltmp4-clamp

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_0:
	.long	24                      # 0x18
	.long	0                       # 0x0
	.long	24                      # 0x18
	.long	0                       # 0x0
.LCPI5_1:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI5_3:
	.long	3                       # 0x3
	.long	0                       # 0x0
	.long	3                       # 0x3
	.long	0                       # 0x0
.LCPI5_4:
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	0                       # 0x0
.LCPI5_5:
	.long	2                       # 0x2
	.long	0                       # 0x0
	.long	2                       # 0x2
	.long	0                       # 0x0
.LCPI5_6:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI5_7:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI5_8:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
.LCPI5_9:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
.LCPI5_10:
	.quad	-4616189618054758400    # double -1.000000e+00
	.quad	-4616189618054758400    # double -1.000000e+00
.LCPI5_11:
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
.LCPI5_12:
	.quad	4643193623632936960     # double 2.555000e+02
	.quad	4643193623632936960     # double 2.555000e+02
.LCPI5_13:
	.long	255                     # 0xff
	.long	0                       # 0x0
	.long	255                     # 0xff
	.long	0                       # 0x0
.LCPI5_14:
	.zero	16
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI5_2:
	.quad	4602678819172646912     # double 0.5
	.text
	.globl	render
	.align	16, 0x90
	.type	render,@function
render:                                 # @render
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$1244, %esp             # imm = 0x4DC
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#1:                                 # %entry.split116
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#2:                                 # %entry.split114
	movl	16(%ebp), %ebx
	imull	$24, 12(%ebp), %edi
	imull	%ebx, %edi
	movl	%edi, (%esp)
	calll	malloc
	movl	%eax, %esi
	movl	%edi, 8(%esp)
	movl	%esi, (%esp)
	movl	$0, 4(%esp)
	calll	memset
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#3:                                 # %entry.split
	vmovd	%ebx, %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vmovd	%xmm2, %ecx
	sarl	$31, %ecx
	vpinsrd	$1, %ecx, %xmm2, %xmm0
	vpextrd	$2, %xmm2, %edx
	sarl	$31, %edx
	vpinsrd	$3, %edx, %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpgtq	%xmm1, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -168(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -168(%ebp)
	movb	-168(%ebp), %al
	testb	%al, %al
	je	.LBB5_48
# BB#4:                                 # %for.cond6.preheader.lr.ph
	vmovdqa	%xmm2, %xmm1
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#5:                                 # %for.cond6.preheader.lr.ph.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#6:                                 # %for.cond6.preheader.lr.ph.split.split
	vmovd	20(%ebp), %xmm0
	vpbroadcastq	%xmm0, %xmm2
	vpextrd	$2, %xmm2, %eax
	sarl	$31, %eax
	movl	%eax, -776(%ebp)        # 4-byte Spill
	vmovd	%xmm2, %edi
	sarl	$31, %edi
	movl	%edi, -780(%ebp)        # 4-byte Spill
	vmovd	%xmm2, -184(%ebp)
	movl	%edi, -180(%ebp)
	vpextrd	$2, %xmm2, -200(%ebp)
	movl	%eax, -196(%ebp)
	fildll	-184(%ebp)
	fstpl	-192(%ebp)
	fildll	-200(%ebp)
	fstpl	-208(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#7:                                 # %for.cond6.preheader.lr.ph.split.split.split
	vmovd	12(%ebp), %xmm0
	vpbroadcastq	%xmm0, %xmm3
	vmovdqa	%xmm3, -808(%ebp)       # 16-byte Spill
	vmovsd	-192(%ebp), %xmm0
	vmovhpd	-208(%ebp), %xmm0, %xmm0
	vmovapd	%xmm0, -824(%ebp)       # 16-byte Spill
	vpextrd	$2, %xmm3, %edi
	sarl	$31, %edi
	vmovd	%xmm3, %eax
	sarl	$31, %eax
	movl	%eax, -828(%ebp)        # 4-byte Spill
	vmovd	%xmm3, -224(%ebp)
	movl	%eax, -220(%ebp)
	vpextrd	$2, %xmm3, -240(%ebp)
	movl	%edi, -236(%ebp)
	fildll	-224(%ebp)
	fstpl	-232(%ebp)
	fildll	-240(%ebp)
	fstpl	-248(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#8:                                 # %for.cond6.preheader.lr.ph.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#9:                                 # %for.cond6.preheader.lr.ph.split.split.split.split.split
	vmovsd	-232(%ebp), %xmm0
	vmovhpd	-248(%ebp), %xmm0, %xmm0
	vmovd	%xmm1, -264(%ebp)
	movl	%ecx, -260(%ebp)
	vpextrd	$2, %xmm1, -280(%ebp)
	vmovdqa	%xmm1, %xmm4
	movl	%edx, -276(%ebp)
	fildll	-264(%ebp)
	fstpl	-272(%ebp)
	fildll	-280(%ebp)
	fstpl	-288(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#10:                                # %for.cond6.preheader.lr.ph.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#11:                                # %for.cond6.preheader.lr.ph.split.split.split.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#12:                                # %for.cond6.preheader.lr.ph.split.split.split.split.split.split.split.split
	vmovsd	-272(%ebp), %xmm1
	vmovhpd	-288(%ebp), %xmm1, %xmm1
	vmovdqa	%xmm2, %xmm3
	vmovdqa	%xmm3, -872(%ebp)       # 16-byte Spill
	vpsrlq	$32, %xmm3, %xmm2
	vpmuludq	%xmm2, %xmm3, %xmm2
	vpsllq	$32, %xmm2, %xmm2
	vpmuludq	%xmm3, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm3, %xmm3
	vpaddq	%xmm2, %xmm3, %xmm2
	vmovd	%xmm2, -304(%ebp)
	vmovd	%xmm2, %eax
	sarl	$31, %eax
	movl	%eax, -300(%ebp)
	vpextrd	$2, %xmm2, -320(%ebp)
	vpextrd	$2, %xmm2, %eax
	sarl	$31, %eax
	movl	%eax, -316(%ebp)
	fildll	-304(%ebp)
	fstpl	-312(%ebp)
	fildll	-320(%ebp)
	fstpl	-328(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	movl	$0, -876(%ebp)          # 4-byte Folded Spill
	jne	.LBB5_116
# BB#13:
	vcvtsi2sdl	20(%ebp), %xmm0, %xmm2
	vmovsd	%xmm2, -888(%ebp)       # 8-byte Spill
	vcvtsi2sdl	%ebx, %xmm0, %xmm2
	vmovsd	-312(%ebp), %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	vmovapd	%xmm5, -904(%ebp)       # 16-byte Spill
	movl	8(%ebp), %ebx
	vmulpd	.LCPI5_1, %xmm0, %xmm0
	vmovapd	%xmm0, -952(%ebp)       # 16-byte Spill
	vmulsd	.LCPI5_2, %xmm2, %xmm0
	vmovsd	%xmm0, -960(%ebp)       # 8-byte Spill
	vmulpd	.LCPI5_1, %xmm1, %xmm0
	vmovapd	%xmm0, -984(%ebp)       # 16-byte Spill
	vmovhpd	-328(%ebp), %xmm3, %xmm0
	vmovapd	%xmm0, -1016(%ebp)      # 16-byte Spill
	vmovdqa	%xmm4, %xmm0
	vmovdqa	%xmm0, -856(%ebp)       # 16-byte Spill
.LBB5_14:                               # %for.cond6.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_18 Depth 2
                                        #       Child Loop BB5_55 Depth 3
                                        #         Child Loop BB5_56 Depth 4
	vmovdqa	-808(%ebp), %xmm0       # 16-byte Reload
	movl	-828(%ebp), %eax        # 4-byte Reload
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpinsrd	$3, %edi, %xmm0, %xmm0
	vpcmpgtq	.LCPI5_14, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -330(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -330(%ebp)
	movb	-330(%ebp), %al
	testb	%al, %al
	je	.LBB5_45
# BB#15:                                # %for.cond9.preheader.lr.ph
                                        #   in Loop: Header=BB5_14 Depth=1
	vmovdqa	-904(%ebp), %xmm0       # 16-byte Reload
	vmovd	%xmm0, -344(%ebp)
	vmovd	%xmm0, %eax
	sarl	$31, %eax
	movl	%eax, -340(%ebp)
	vpextrd	$2, %xmm0, -360(%ebp)
	vpextrd	$2, %xmm0, %eax
	sarl	$31, %eax
	movl	%eax, -356(%ebp)
	fildll	-344(%ebp)
	fstpl	-352(%ebp)
	fildll	-360(%ebp)
	fstpl	-368(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#16:                                # %for.cond9.preheader.lr.ph.split
                                        #   in Loop: Header=BB5_14 Depth=1
	xorl	%eax, %eax
	testb	%al, %al
	movl	$0, %ecx
	jne	.LBB5_116
# BB#17:                                #   in Loop: Header=BB5_14 Depth=1
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, -1080(%ebp)      # 16-byte Spill
	movl	-876(%ebp), %eax        # 4-byte Reload
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, -1088(%ebp)      # 8-byte Spill
	vmovsd	-352(%ebp), %xmm0
	vmovhpd	-368(%ebp), %xmm0, %xmm0
	vmovapd	%xmm0, -1112(%ebp)      # 16-byte Spill
	imull	12(%ebp), %eax
	movl	%eax, -1116(%ebp)       # 4-byte Spill
.LBB5_18:                               # %for.cond9.preheader
                                        #   Parent Loop BB5_14 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_55 Depth 3
                                        #         Child Loop BB5_56 Depth 4
	vmovdqa	-872(%ebp), %xmm0       # 16-byte Reload
	movl	-780(%ebp), %eax        # 4-byte Reload
	vpinsrd	$1, %eax, %xmm0, %xmm0
	movl	-776(%ebp), %eax        # 4-byte Reload
	vpinsrd	$3, %eax, %xmm0, %xmm0
	vpcmpgtq	.LCPI5_14, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -372(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -372(%ebp)
	movb	-372(%ebp), %al
	testb	%al, %al
	je	.LBB5_19
# BB#49:                                # %for.cond12.preheader.lr.ph.split.us
                                        #   in Loop: Header=BB5_18 Depth=2
	vmovdqa	-1080(%ebp), %xmm0      # 16-byte Reload
	vmovd	%xmm0, -392(%ebp)
	vmovd	%xmm0, %eax
	sarl	$31, %eax
	movl	%eax, -388(%ebp)
	vpextrd	$2, %xmm0, -408(%ebp)
	vpextrd	$2, %xmm0, %eax
	sarl	$31, %eax
	movl	%eax, -404(%ebp)
	fildll	-392(%ebp)
	fstpl	-400(%ebp)
	fildll	-408(%ebp)
	fstpl	-416(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#50:                                # %for.cond12.preheader.lr.ph.split.us.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#51:                                # %for.cond12.preheader.lr.ph.split.us.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#52:                                # %for.cond12.preheader.lr.ph.split.us.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#53:                                # %for.cond12.preheader.lr.ph.split.us.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#54:                                # %for.cond12.preheader.lr.ph.split.us.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	%ecx, %eax
	movl	%eax, -1052(%ebp)       # 4-byte Spill
	movl	-1116(%ebp), %ecx       # 4-byte Reload
	leal	(%eax,%ecx), %eax
	leal	(%eax,%eax,2), %ecx
	movl	%ecx, -1128(%ebp)       # 4-byte Spill
	leal	(%esi,%ecx,8), %eax
	movl	%eax, -1140(%ebp)       # 4-byte Spill
	leal	1(%ecx), %eax
	movl	%eax, -1124(%ebp)       # 4-byte Spill
	leal	(%esi,%eax,8), %eax
	movl	%eax, -1136(%ebp)       # 4-byte Spill
	leal	2(%ecx), %eax
	movl	%eax, -1120(%ebp)       # 4-byte Spill
	leal	(%esi,%eax,8), %eax
	movl	%eax, -1132(%ebp)       # 4-byte Spill
	movl	$0, -1144(%ebp)         # 4-byte Folded Spill
	vmovsd	-400(%ebp), %xmm0
	vmovhpd	-416(%ebp), %xmm0, %xmm0
	vmovapd	%xmm0, -1160(%ebp)      # 16-byte Spill
	vpxor	%xmm2, %xmm2, %xmm2
.LBB5_55:                               # %for.body14.lr.ph.us
                                        #   Parent Loop BB5_14 Depth=1
                                        #     Parent Loop BB5_18 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_56 Depth 4
	vmovdqa	%xmm2, -1176(%ebp)      # 16-byte Spill
	vcvtsi2sdl	-1144(%ebp), %xmm0, %xmm0 # 4-byte Folded Reload
	vmovdqa	%xmm2, %xmm1
	vmovd	%xmm1, -432(%ebp)
	vmovd	%xmm1, %eax
	sarl	$31, %eax
	movl	%eax, -428(%ebp)
	vpextrd	$2, %xmm1, -448(%ebp)
	vpextrd	$2, %xmm1, %eax
	sarl	$31, %eax
	movl	%eax, -444(%ebp)
	fildll	-432(%ebp)
	fstpl	-440(%ebp)
	fildll	-448(%ebp)
	fstpl	-456(%ebp)
	vmovsd	-440(%ebp), %xmm1
	vmovhpd	-456(%ebp), %xmm1, %xmm1
	vdivsd	-888(%ebp), %xmm0, %xmm0 # 8-byte Folded Reload
	vdivpd	-824(%ebp), %xmm1, %xmm1 # 16-byte Folded Reload
	vmovsd	-1088(%ebp), %xmm2      # 8-byte Reload
	vaddsd	%xmm0, %xmm2, %xmm0
	vmovapd	-1112(%ebp), %xmm2      # 16-byte Reload
	vaddpd	%xmm1, %xmm2, %xmm1
	vmovsd	-960(%ebp), %xmm2       # 8-byte Reload
	vsubsd	%xmm2, %xmm0, %xmm0
	vmovapd	-984(%ebp), %xmm3       # 16-byte Reload
	vsubpd	%xmm3, %xmm1, %xmm1
	vxorpd	.LCPI5_6, %xmm0, %xmm0
	vxorpd	.LCPI5_6, %xmm1, %xmm1
	vdivsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, -1184(%ebp)      # 8-byte Spill
	vdivpd	%xmm3, %xmm1, %xmm0
	vmovapd	%xmm0, -1208(%ebp)      # 16-byte Spill
	vmulpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -1224(%ebp)      # 16-byte Spill
	vpxor	%xmm2, %xmm2, %xmm2
.LBB5_56:                               # %for.body14.us
                                        #   Parent Loop BB5_14 Depth=1
                                        #     Parent Loop BB5_18 Depth=2
                                        #       Parent Loop BB5_55 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovdqa	%xmm2, -1240(%ebp)      # 16-byte Spill
	vmovdqa	%xmm2, %xmm0
	vmovd	%xmm0, -472(%ebp)
	vmovd	%xmm0, %eax
	sarl	$31, %eax
	movl	%eax, -468(%ebp)
	vpextrd	$2, %xmm0, -488(%ebp)
	vpextrd	$2, %xmm0, %eax
	sarl	$31, %eax
	movl	%eax, -484(%ebp)
	fildll	-472(%ebp)
	fstpl	-480(%ebp)
	fildll	-488(%ebp)
	fstpl	-496(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#57:                                # %for.body14.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#58:                                # %for.body14.us.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#59:                                # %for.body14.us.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#60:                                # %for.body14.us.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#61:                                # %for.body14.us.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovsd	-480(%ebp), %xmm0
	vmovhpd	-496(%ebp), %xmm0, %xmm0
	vdivpd	-824(%ebp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovapd	-1160(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovapd	-952(%ebp), %xmm1       # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, -72(%ebp)
	movl	$0, -52(%ebp)
	movl	$0, -56(%ebp)
	vmovhpd	%xmm0, -48(%ebp)
	vmovsd	-1184(%ebp), %xmm1      # 8-byte Reload
	vmovsd	%xmm1, -40(%ebp)
	movl	$-1074790400, -28(%ebp) # imm = 0xFFFFFFFFBFF00000
	movl	$0, -32(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#62:                                # %for.body14.us.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#63:                                # %for.body14.us.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#64:                                # %for.body14.us.split.split.split.split.split.split.split.split117
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#65:                                # %for.body14.us.split.split.split.split.split.split.split.split117.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#66:                                # %for.body14.us.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#67:                                # %for.body14.us.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovapd	-1224(%ebp), %xmm2      # 16-byte Reload
	vaddpd	%xmm1, %xmm2, %xmm1
	vaddpd	.LCPI5_7, %xmm1, %xmm1
	vsqrtpd	%xmm1, %xmm1
	vandpd	.LCPI5_8, %xmm1, %xmm2
	vmovapd	.LCPI5_9, %xmm3
	vcmpltpd	%xmm2, %xmm3, %xmm2
	vpextrd	$2, %xmm2, %eax
	andl	$1, %eax
	movb	%al, -518(%ebp)
	vmovd	%xmm2, %eax
	andl	$1, %eax
	movb	%al, -518(%ebp)
	movb	-518(%ebp), %al
	testb	%al, %al
	je	.LBB5_72
# BB#68:                                # %if.then.i.us
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#69:                                # %if.then.i.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, -48(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#70:                                # %if.then.i.us.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovapd	-1208(%ebp), %xmm0      # 16-byte Reload
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, -40(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#71:                                # %if.then.i.us.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovapd	.LCPI5_10, %xmm0
	vdivpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, -32(%ebp)
.LBB5_72:                               # %vnormalize.exit.us
                                        #   in Loop: Header=BB5_56 Depth=4
	movl	$1131820119, -132(%ebp) # imm = 0x43763457
	movl	$-2049400832, -136(%ebp) # imm = 0xFFFFFFFF85D8A000
	movl	$0, -80(%ebp)
	leal	-72(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-136(%ebp), %eax
	movl	%eax, (%esp)
	movl	$spheres, 8(%esp)
	calll	ray_sphere_intersect
	leal	-72(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-136(%ebp), %eax
	movl	%eax, (%esp)
	movl	$spheres+32, 8(%esp)
	calll	ray_sphere_intersect
	leal	-72(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-136(%ebp), %eax
	movl	%eax, (%esp)
	movl	$spheres+64, 8(%esp)
	calll	ray_sphere_intersect
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#73:                                # %vnormalize.exit.us.split118
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#74:                                # %vnormalize.exit.us.split115
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#75:                                # %vnormalize.exit.us.split115.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#76:                                # %vnormalize.exit.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#77:                                # %vnormalize.exit.us.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#78:                                # %vnormalize.exit.us.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#79:                                # %vnormalize.exit.us.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovddup	plane+24, %xmm4
	vmovddup	plane+32, %xmm5
	vmovddup	plane+40, %xmm3
	vmovddup	-48(%ebp), %xmm2
	vmovddup	-40(%ebp), %xmm1
	vmovddup	-32(%ebp), %xmm0
	vmovapd	%xmm0, -1032(%ebp)      # 16-byte Spill
	vmulpd	%xmm2, %xmm4, %xmm6
	vmulpd	%xmm1, %xmm5, %xmm7
	vaddpd	%xmm7, %xmm6, %xmm6
	vmulpd	%xmm0, %xmm3, %xmm7
	vaddpd	%xmm7, %xmm6, %xmm6
	vandpd	.LCPI5_8, %xmm6, %xmm7
	vcmpltpd	.LCPI5_9, %xmm7, %xmm7
	vpextrd	$2, %xmm7, %eax
	vmovd	%xmm7, %ecx
	andl	$1, %eax
	movb	%al, -540(%ebp)
	andl	$1, %ecx
	movb	%cl, -540(%ebp)
	movb	-540(%ebp), %al
	testb	%al, %al
	jne	.LBB5_104
# BB#80:                                # %if.end.i.us
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#81:                                # %if.end.i.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#82:                                # %if.end.i.us.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#83:                                # %if.end.i.us.split.split.split119
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#84:                                # %if.end.i.us.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#85:                                # %if.end.i.us.split.split.split.split120
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#86:                                # %if.end.i.us.split.split.split.split120.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#87:                                # %if.end.i.us.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#88:                                # %if.end.i.us.split.split.split.split.split121
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#89:                                # %if.end.i.us.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#90:                                # %if.end.i.us.split.split.split.split.split.split122
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#91:                                # %if.end.i.us.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#92:                                # %if.end.i.us.split.split.split.split.split.split.split123
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#93:                                # %if.end.i.us.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#94:                                # %if.end.i.us.split.split.split.split.split.split.split.split124
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#95:                                # %if.end.i.us.split.split.split.split.split.split.split.split124.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#96:                                # %if.end.i.us.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovddup	plane+8, %xmm7
	vmovddup	plane, %xmm0
	vmulpd	%xmm7, %xmm5, %xmm7
	vmulpd	%xmm0, %xmm4, %xmm0
	vmovapd	%xmm0, -1048(%ebp)      # 16-byte Spill
	vmovddup	plane+16, %xmm0
	vmulpd	%xmm0, %xmm3, %xmm0
	vaddpd	-1048(%ebp), %xmm7, %xmm7 # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm7, %xmm0
	vmovddup	-72(%ebp), %xmm7
	vmovapd	%xmm7, -1048(%ebp)      # 16-byte Spill
	vmovddup	-64(%ebp), %xmm7
	vmulpd	-1048(%ebp), %xmm4, %xmm4 # 16-byte Folded Reload
	vmulpd	%xmm7, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm4, %xmm5
	vmovddup	-56(%ebp), %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm5, %xmm3
	vsubpd	%xmm0, %xmm3, %xmm0
	vxorpd	.LCPI5_6, %xmm0, %xmm0
	vdivpd	%xmm6, %xmm0, %xmm3
	vmovddup	-136(%ebp), %xmm0
	vcmpltpd	%xmm0, %xmm3, %xmm0
	vxorpd	%xmm5, %xmm5, %xmm5
	vcmpltpd	%xmm3, %xmm5, %xmm5
	vandpd	%xmm0, %xmm5, %xmm0
	vpextrd	$2, %xmm0, %eax
	vmovd	%xmm0, %ecx
	andl	$1, %eax
	movb	%al, -574(%ebp)
	andl	$1, %ecx
	movb	%cl, -574(%ebp)
	movb	-574(%ebp), %al
	testb	%al, %al
	je	.LBB5_104
# BB#97:                                # %if.then10.i.us
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovhpd	%xmm3, -136(%ebp)
	movl	$1, -80(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#98:                                # %if.then10.i.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#99:                                # %if.then10.i.us.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmulpd	%xmm3, %xmm2, %xmm0
	vmovapd	-1048(%ebp), %xmm2      # 16-byte Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vmovhpd	%xmm0, -128(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#100:                               # %if.then10.i.us.split.split.split125
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#101:                               # %if.then10.i.us.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmulpd	%xmm3, %xmm1, %xmm0
	vaddpd	%xmm0, %xmm7, %xmm0
	vmovhpd	%xmm0, -120(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#102:                               # %if.then10.i.us.split.split.split.split126
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#103:                               # %if.then10.i.us.split.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovapd	-1032(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vmovhpd	%xmm0, -112(%ebp)
	vmovsd	plane+40, %xmm0
	leal	-104(%ebp), %eax
	vmovsd	%xmm0, 16(%eax)
	vmovupd	plane+24, %xmm0
	vmovupd	%xmm0, (%eax)
.LBB5_104:                              # %ray_plane_intersect.exit.us
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#105:                               # %ray_plane_intersect.exit.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovd	-80(%ebp), %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI5_11, %xmm0, %xmm0
	vpcmpeqq	.LCPI5_14, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -590(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -590(%ebp)
	movb	-590(%ebp), %al
	testb	%al, %al
	jne	.LBB5_110
# BB#106:                               # %if.then.us
                                        #   in Loop: Header=BB5_56 Depth=4
	leal	-136(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-160(%ebp), %eax
	movl	%eax, (%esp)
	calll	ambient_occlusion
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#107:                               # %if.then.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovddup	-160(%ebp), %xmm0
	movl	-1140(%ebp), %eax       # 4-byte Reload
	vmovddup	(%eax), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#108:                               # %if.then.us.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovddup	-152(%ebp), %xmm0
	movl	-1136(%ebp), %eax       # 4-byte Reload
	vmovddup	(%eax), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#109:                               # %if.then.us.split.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovddup	-144(%ebp), %xmm0
	movl	-1132(%ebp), %eax       # 4-byte Reload
	vmovddup	(%eax), %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovhpd	%xmm0, (%eax)
.LBB5_110:                              # %if.end.us
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#111:                               # %if.end.us.split
                                        #   in Loop: Header=BB5_56 Depth=4
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#112:                               # %if.end.us.split.split
                                        #   in Loop: Header=BB5_56 Depth=4
	vmovdqa	-1240(%ebp), %xmm2      # 16-byte Reload
	vpaddq	.LCPI5_4, %xmm2, %xmm2
	vmovdqa	-872(%ebp), %xmm0       # 16-byte Reload
	vmovdqa	.LCPI5_11, %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vpand	%xmm1, %xmm2, %xmm1
	vpcmpeqq	%xmm0, %xmm1, %xmm1
	vpextrd	$2, %xmm1, %eax
	andl	$1, %eax
	movb	%al, -602(%ebp)
	vmovd	%xmm1, %eax
	andl	$1, %eax
	movb	%al, -602(%ebp)
	movb	-602(%ebp), %al
	testb	%al, %al
	je	.LBB5_56
# BB#113:                               # %for.inc65.us
                                        #   in Loop: Header=BB5_55 Depth=3
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#114:                               # %for.inc65.us.split
                                        #   in Loop: Header=BB5_55 Depth=3
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#115:                               # %for.inc65.us.split.split
                                        #   in Loop: Header=BB5_55 Depth=3
	incl	-1144(%ebp)             # 4-byte Folded Spill
	vmovdqa	-1176(%ebp), %xmm2      # 16-byte Reload
	vpaddq	.LCPI5_4, %xmm2, %xmm2
	vpand	.LCPI5_11, %xmm2, %xmm1
	vpcmpeqq	%xmm0, %xmm1, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -608(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -608(%ebp)
	movb	-608(%ebp), %al
	testb	%al, %al
	je	.LBB5_55
	jmp	.LBB5_24
.LBB5_19:                               # %for.cond9.preheader.for.end67_crit_edge
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#20:                                # %for.cond9.preheader.for.end67_crit_edge.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#21:                                # %for.cond9.preheader.for.end67_crit_edge.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#22:                                # %for.cond9.preheader.for.end67_crit_edge.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#23:                                # %for.cond9.preheader.for.end67_crit_edge.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	%ecx, %eax
	movl	%eax, -1052(%ebp)       # 4-byte Spill
	movl	-1116(%ebp), %ecx       # 4-byte Reload
	leal	(%eax,%ecx), %eax
	leal	(%eax,%eax,2), %ecx
	movl	%ecx, -1128(%ebp)       # 4-byte Spill
	leal	(%esi,%ecx,8), %eax
	movl	%eax, -1140(%ebp)       # 4-byte Spill
	leal	1(%ecx), %eax
	movl	%eax, -1124(%ebp)       # 4-byte Spill
	leal	(%esi,%eax,8), %eax
	movl	%eax, -1136(%ebp)       # 4-byte Spill
	leal	2(%ecx), %eax
	movl	%eax, -1120(%ebp)       # 4-byte Spill
	leal	(%esi,%eax,8), %eax
	movl	%eax, -1132(%ebp)       # 4-byte Spill
.LBB5_24:                               # %for.end67
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#25:                                # %for.end67.split
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	-1140(%ebp), %eax       # 4-byte Reload
	vmovddup	(%eax), %xmm0
	vdivpd	-1016(%ebp), %xmm0, %xmm2 # 16-byte Folded Reload
	vmovhpd	%xmm2, (%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#26:                                # %for.end67.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	-1136(%ebp), %eax       # 4-byte Reload
	vmovddup	(%eax), %xmm0
	vdivpd	-1016(%ebp), %xmm0, %xmm1 # 16-byte Folded Reload
	vmovhpd	%xmm1, (%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#27:                                # %for.end67.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	-1132(%ebp), %eax       # 4-byte Reload
	vmovddup	(%eax), %xmm0
	vdivpd	-1016(%ebp), %xmm0, %xmm0 # 16-byte Folded Reload
	vmovhpd	%xmm0, (%eax)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#28:                                # %for.end67.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	vmulpd	.LCPI5_12, %xmm2, %xmm2
	vmovlpd	%xmm2, -632(%ebp)
	vmovhpd	%xmm2, -648(%ebp)
	fldl	-632(%ebp)
	fisttpll	-640(%ebp)
	fldl	-648(%ebp)
	fisttpll	-656(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#29:                                # %for.end67.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#30:                                # %for.end67.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#31:                                # %for.end67.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#32:                                # %for.end67.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	vmovd	-640(%ebp), %xmm2
	vpinsrd	$1, -636(%ebp), %xmm2, %xmm2
	vpinsrd	$2, -656(%ebp), %xmm2, %xmm2
	vpinsrd	$3, -652(%ebp), %xmm2, %xmm2
	vmovd	%xmm2, %eax
	sarl	$31, %eax
	vpinsrd	$1, %eax, %xmm2, %xmm3
	vpextrd	$2, %xmm2, %eax
	sarl	$31, %eax
	vpinsrd	$3, %eax, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	vpcmpgtq	%xmm3, %xmm4, %xmm3
	vpandn	%xmm2, %xmm3, %xmm2
	vmovd	%xmm2, %eax
	sarl	$31, %eax
	vpinsrd	$1, %eax, %xmm2, %xmm3
	vpextrd	$2, %xmm2, %eax
	sarl	$31, %eax
	vpinsrd	$3, %eax, %xmm3, %xmm3
	vmovdqa	.LCPI5_13, %xmm4
	vpcmpgtq	%xmm4, %xmm3, %xmm3
	vpsllq	$63, %xmm3, %xmm3
	vblendvpd	%xmm3, %xmm4, %xmm2, %xmm2
	vpextrb	$8, %xmm2, %eax
	movl	-1128(%ebp), %ecx       # 4-byte Reload
	movb	%al, (%ebx,%ecx)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#33:                                # %for.end67.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	vmulpd	.LCPI5_12, %xmm1, %xmm1
	vmovlpd	%xmm1, -680(%ebp)
	vmovhpd	%xmm1, -696(%ebp)
	fldl	-680(%ebp)
	fisttpll	-688(%ebp)
	fldl	-696(%ebp)
	fisttpll	-704(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#34:                                # %for.end67.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#35:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#36:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#37:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	vmovd	-688(%ebp), %xmm1
	vpinsrd	$1, -684(%ebp), %xmm1, %xmm1
	vpinsrd	$2, -704(%ebp), %xmm1, %xmm1
	vpinsrd	$3, -700(%ebp), %xmm1, %xmm1
	vmovd	%xmm1, %eax
	sarl	$31, %eax
	vpinsrd	$1, %eax, %xmm1, %xmm2
	vpextrd	$2, %xmm1, %eax
	sarl	$31, %eax
	vpinsrd	$3, %eax, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpcmpgtq	%xmm2, %xmm3, %xmm2
	vpandn	%xmm1, %xmm2, %xmm1
	vmovd	%xmm1, %eax
	sarl	$31, %eax
	vpinsrd	$1, %eax, %xmm1, %xmm2
	vpextrd	$2, %xmm1, %eax
	sarl	$31, %eax
	vpinsrd	$3, %eax, %xmm2, %xmm2
	vmovdqa	%xmm4, %xmm3
	vpcmpgtq	%xmm3, %xmm2, %xmm2
	vpsllq	$63, %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm3, %xmm1, %xmm1
	vpextrb	$8, %xmm1, %eax
	movl	-1124(%ebp), %ecx       # 4-byte Reload
	movb	%al, (%ebx,%ecx)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#38:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	vmulpd	.LCPI5_12, %xmm0, %xmm0
	vmovlpd	%xmm0, -728(%ebp)
	vmovhpd	%xmm0, -744(%ebp)
	fldl	-728(%ebp)
	fisttpll	-736(%ebp)
	fldl	-744(%ebp)
	fisttpll	-752(%ebp)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#39:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#40:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#41:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#42:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	vmovd	-736(%ebp), %xmm0
	vpinsrd	$1, -732(%ebp), %xmm0, %xmm0
	vpinsrd	$2, -752(%ebp), %xmm0, %xmm0
	vpinsrd	$3, -748(%ebp), %xmm0, %xmm0
	vmovd	%xmm0, %eax
	sarl	$31, %eax
	vpinsrd	$1, %eax, %xmm0, %xmm1
	vpextrd	$2, %xmm0, %eax
	sarl	$31, %eax
	vpinsrd	$3, %eax, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpcmpgtq	%xmm1, %xmm2, %xmm1
	vpandn	%xmm0, %xmm1, %xmm0
	vmovd	%xmm0, %eax
	sarl	$31, %eax
	vpinsrd	$1, %eax, %xmm0, %xmm1
	vpextrd	$2, %xmm0, %eax
	sarl	$31, %eax
	vpinsrd	$3, %eax, %xmm1, %xmm1
	vmovdqa	%xmm3, %xmm2
	vpcmpgtq	%xmm2, %xmm1, %xmm1
	vpsllq	$63, %xmm1, %xmm1
	vblendvpd	%xmm1, %xmm2, %xmm0, %xmm0
	vpextrb	$8, %xmm0, %eax
	movl	-1120(%ebp), %ecx       # 4-byte Reload
	movb	%al, (%ebx,%ecx)
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#43:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#44:                                # %for.end67.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_18 Depth=2
	movl	-1052(%ebp), %eax       # 4-byte Reload
	incl	%eax
	movl	%eax, %ecx
	vmovdqa	-1080(%ebp), %xmm2      # 16-byte Reload
	vpaddq	.LCPI5_4, %xmm2, %xmm2
	vmovdqa	%xmm2, -1080(%ebp)      # 16-byte Spill
	vmovdqa	-808(%ebp), %xmm0       # 16-byte Reload
	vmovdqa	.LCPI5_11, %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vpand	%xmm1, %xmm2, %xmm1
	vpcmpeqq	%xmm0, %xmm1, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -764(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -764(%ebp)
	movb	-764(%ebp), %al
	testb	%al, %al
	je	.LBB5_18
.LBB5_45:                               # %for.inc128
                                        #   in Loop: Header=BB5_14 Depth=1
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#46:                                # %for.inc128.split
                                        #   in Loop: Header=BB5_14 Depth=1
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB5_116
# BB#47:                                # %for.inc128.split.split
                                        #   in Loop: Header=BB5_14 Depth=1
	incl	-876(%ebp)              # 4-byte Folded Spill
	vmovdqa	-904(%ebp), %xmm1       # 16-byte Reload
	vpaddq	.LCPI5_4, %xmm1, %xmm1
	vmovdqa	%xmm1, -904(%ebp)       # 16-byte Spill
	vmovdqa	-856(%ebp), %xmm0       # 16-byte Reload
	vmovdqa	.LCPI5_11, %xmm2
	vpand	%xmm2, %xmm0, %xmm0
	vpand	%xmm2, %xmm1, %xmm1
	vpcmpeqq	%xmm0, %xmm1, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -770(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -770(%ebp)
	movb	-770(%ebp), %al
	testb	%al, %al
	je	.LBB5_14
	jmp	.LBB5_48
.LBB5_116:                              # %relExit
	movl	$.Lfunc5, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB5_48:                               # %for.end130
	addl	$1244, %esp             # imm = 0x4DC
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp5:
	.size	render, .Ltmp5-render

	.globl	init_scene
	.align	16, 0x90
	.type	init_scene,@function
init_scene:                             # @init_scene
# BB#0:                                 # %entry
	movl	$-1073741824, spheres+4 # imm = 0xFFFFFFFFC0000000
	movl	$0, spheres
	movl	$0, spheres+12
	movl	$0, spheres+8
	movl	$-1072955392, spheres+20 # imm = 0xFFFFFFFFC00C0000
	movl	$0, spheres+16
	movl	$1071644672, spheres+28 # imm = 0x3FE00000
	movl	$0, spheres+24
	movl	$-1075838976, spheres+36 # imm = 0xFFFFFFFFBFE00000
	movl	$0, spheres+32
	movl	$0, spheres+44
	movl	$0, spheres+40
	movl	$-1073217536, spheres+52 # imm = 0xFFFFFFFFC0080000
	movl	$0, spheres+48
	movl	$1071644672, spheres+60 # imm = 0x3FE00000
	movl	$0, spheres+56
	movl	$1072693248, spheres+68 # imm = 0x3FF00000
	movl	$0, spheres+64
	movl	$0, spheres+76
	movl	$0, spheres+72
	movl	$-1073636967, spheres+84 # imm = 0xFFFFFFFFC0019999
	movl	$-1717986918, spheres+80 # imm = 0xFFFFFFFF9999999A
	movl	$1071644672, spheres+92 # imm = 0x3FE00000
	movl	$0, spheres+88
	movl	$0, plane+4
	movl	$0, plane
	movl	$-1075838976, plane+12  # imm = 0xFFFFFFFFBFE00000
	movl	$0, plane+8
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, plane+16
	movl	$1072693248, plane+36   # imm = 0x3FF00000
	movl	$0, plane+32
	movl	$0, plane+44
	movl	$0, plane+40
	ret
.Ltmp6:
	.size	init_scene, .Ltmp6-init_scene

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	0                       # 0x0
.LCPI7_1:
	.long	3                       # 0x3
	.long	0                       # 0x0
	.long	3                       # 0x3
	.long	0                       # 0x0
	.text
	.globl	saveppm
	.align	16, 0x90
	.type	saveppm,@function
saveppm:                                # @saveppm
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	movl	$.L.str, 4(%esp)
	calll	fopen
	movl	%eax, %esi
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB7_5
# BB#1:                                 # %entry.split
	vmovd	%esi, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpand	.LCPI7_0, %xmm0, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqq	%xmm1, %xmm0, %xmm0
	vpextrd	$2, %xmm0, %eax
	andl	$1, %eax
	movb	%al, -16(%ebp)
	vmovd	%xmm0, %eax
	andl	$1, %eax
	movb	%al, -16(%ebp)
	movb	-16(%ebp), %al
	testb	%al, %al
	jne	.LBB7_7
# BB#2:                                 # %cond.end
	movl	16(%ebp), %edi
	movl	12(%ebp), %ebx
	movl	%esi, 12(%esp)
	movl	$1, 8(%esp)
	movl	$3, 4(%esp)
	movl	$.L.str3, (%esp)
	calll	fwrite
	movl	%edi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%esi, (%esp)
	movl	$.L.str4, 4(%esp)
	calll	fprintf
	movl	%esi, 12(%esp)
	movl	$1, 8(%esp)
	movl	$4, 4(%esp)
	movl	$.L.str5, (%esp)
	calll	fwrite
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB7_5
# BB#3:                                 # %cond.end.split3
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB7_4
.LBB7_5:                                # %relExit
	movl	$.Lfunc7, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB7_6:                                # %relExit
	addl	$28, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.LBB7_4:                                # %cond.end.split
	movl	20(%ebp), %eax
	leal	(%ebx,%ebx,2), %ecx
	imull	%edi, %ecx
	movl	%esi, 12(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 8(%esp)
	calll	fwrite
	movl	%esi, (%esp)
	calll	fclose
	jmp	.LBB7_6
.LBB7_7:                                # %cond.false
	movl	$.L__PRETTY_FUNCTION__.saveppm, 12(%esp)
	movl	$326, 8(%esp)           # imm = 0x146
	movl	$.L.str2, 4(%esp)
	movl	$.L.str1, (%esp)
	calll	__assert_fail
.Ltmp7:
	.size	saveppm, .Ltmp7-saveppm

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI8_0:
	.long	1000000                 # 0xf4240
	.long	0                       # 0x0
	.long	1000000                 # 0xf4240
	.long	0                       # 0x0
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$92, %esp
	movl	$786432, (%esp)         # imm = 0xC0000
	calll	malloc
	movl	%eax, %esi
	movl	$-1073741824, spheres+4 # imm = 0xFFFFFFFFC0000000
	movl	$0, spheres
	movl	$0, spheres+12
	movl	$0, spheres+8
	movl	$-1072955392, spheres+20 # imm = 0xFFFFFFFFC00C0000
	movl	$0, spheres+16
	movl	$1071644672, spheres+28 # imm = 0x3FE00000
	movl	$0, spheres+24
	movl	$-1075838976, spheres+36 # imm = 0xFFFFFFFFBFE00000
	movl	$0, spheres+32
	movl	$0, spheres+44
	movl	$0, spheres+40
	movl	$-1073217536, spheres+52 # imm = 0xFFFFFFFFC0080000
	movl	$0, spheres+48
	movl	$1071644672, spheres+60 # imm = 0x3FE00000
	movl	$0, spheres+56
	movl	$1072693248, spheres+68 # imm = 0x3FF00000
	movl	$0, spheres+64
	movl	$0, spheres+76
	movl	$0, spheres+72
	movl	$-1073636967, spheres+84 # imm = 0xFFFFFFFFC0019999
	movl	$-1717986918, spheres+80 # imm = 0xFFFFFFFF9999999A
	movl	$1071644672, spheres+92 # imm = 0x3FE00000
	movl	$0, spheres+88
	movl	$0, plane+4
	movl	$0, plane
	movl	$-1075838976, plane+12  # imm = 0xFFFFFFFFBFE00000
	movl	$0, plane+8
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%xmm0, plane+16
	movl	$1072693248, plane+36   # imm = 0x3FF00000
	movl	$0, plane+32
	movl	$0, plane+44
	movl	$0, plane+40
	leal	-24(%ebp), %edi
	movl	%edi, 4(%esp)
	movl	$1, (%esp)
	calll	clock_gettime
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB8_12
# BB#1:                                 # %entry.split11
	movl	-24(%ebp), %eax
	movl	%eax, -76(%ebp)         # 4-byte Spill
	movl	-20(%ebp), %eax
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	%xmm0, -72(%ebp)        # 16-byte Spill
	vpextrd	$2, %xmm0, %ebx
	sarl	$31, %ebx
	vmovd	%xmm0, %ecx
	sarl	$31, %ecx
	movl	$274877907, %edx        # imm = 0x10624DD3
	imull	%edx
	movl	%edx, -80(%ebp)         # 4-byte Spill
	vmovd	%xmm0, (%esp)
	movl	%ecx, 4(%esp)
	movl	$0, 12(%esp)
	movl	$1000, 8(%esp)          # imm = 0x3E8
	calll	__divdi3
	vmovdqa	-72(%ebp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, (%esp)
	movl	%ebx, 4(%esp)
	movl	$0, 12(%esp)
	movl	$1000, 8(%esp)          # imm = 0x3E8
	calll	__divdi3
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB8_12
# BB#2:                                 # %entry.split11.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB8_12
# BB#3:                                 # %entry.split11.split.split
	movl	%esi, (%esp)
	movl	$4, 12(%esp)
	movl	$512, 8(%esp)           # imm = 0x200
	movl	$512, 4(%esp)           # imm = 0x200
	calll	render
	movl	%edi, 4(%esp)
	movl	$1, (%esp)
	calll	clock_gettime
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB8_12
# BB#4:                                 # %entry.split11.split.split.split
	movl	-24(%ebp), %eax
	movl	%eax, -84(%ebp)         # 4-byte Spill
	movl	-20(%ebp), %eax
	vmovd	%eax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vmovdqa	%xmm0, -72(%ebp)        # 16-byte Spill
	vpextrd	$2, %xmm0, %edi
	sarl	$31, %edi
	vmovd	%xmm0, %ecx
	sarl	$31, %ecx
	movl	$274877907, %edx        # imm = 0x10624DD3
	imull	%edx
	movl	%edx, %ebx
	vmovd	%xmm0, (%esp)
	movl	%ecx, 4(%esp)
	movl	$0, 12(%esp)
	movl	$1000, 8(%esp)          # imm = 0x3E8
	calll	__divdi3
	vmovdqa	-72(%ebp), %xmm0        # 16-byte Reload
	vpextrd	$2, %xmm0, (%esp)
	movl	%edi, 4(%esp)
	movl	$0, 12(%esp)
	movl	$1000, 8(%esp)          # imm = 0x3E8
	calll	__divdi3
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB8_12
# BB#5:                                 # %entry.split11.split.split.split.split
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB8_12
# BB#6:                                 # %entry.split
	movl	%ebx, -72(%ebp)         # 4-byte Spill
	movl	-76(%ebp), %eax         # 4-byte Reload
	sarl	$31, %eax
	movl	%eax, -88(%ebp)         # 4-byte Spill
	movl	-84(%ebp), %ebx         # 4-byte Reload
	movl	%ebx, %edi
	sarl	$31, %edi
	movl	%esi, 12(%esp)
	movl	$512, 8(%esp)           # imm = 0x200
	movl	$512, 4(%esp)           # imm = 0x200
	movl	$.L.str6, (%esp)
	calll	saveppm
	subl	-76(%ebp), %ebx         # 4-byte Folded Reload
	movl	%ebx, %edx
	sbbl	-88(%ebp), %edi         # 4-byte Folded Reload
	movl	%edi, %ecx
	movl	-72(%ebp), %esi         # 4-byte Reload
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB8_12
# BB#7:                                 # %entry.split.split
	movl	$1000000, %eax          # imm = 0xF4240
	mulxl	%eax, %ebx, %eax
	xorl	%edx, %edx
	testb	%dl, %dl
	jne	.LBB8_12
# BB#8:                                 # %entry.split.split.split
	movl	%esi, %edi
	movl	%ebx, -76(%ebp)         # 4-byte Spill
	movl	-80(%ebp), %ebx         # 4-byte Reload
	movl	%ebx, %edx
	shrl	$31, %edx
	sarl	$6, %ebx
	addl	%edx, %ebx
	movl	%ebx, %esi
	sarl	$31, %esi
	movl	%edi, %edx
	shrl	$31, %edx
	sarl	$6, %edi
	addl	%edx, %edi
	movl	%edi, %edx
	sarl	$31, %edx
	subl	%ebx, %edi
	sbbl	%esi, %edx
	xorl	%ebx, %ebx
	testb	%bl, %bl
	movl	-76(%ebp), %ebx         # 4-byte Reload
	jne	.LBB8_12
# BB#9:                                 # %entry.split.split.split.split
	imull	$1000000, %ecx, %esi    # imm = 0xF4240
	addl	%esi, %eax
	addl	%ebx, %edi
	adcl	%eax, %edx
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB8_10
.LBB8_12:                               # %relExit
	movl	$.Lfunc8, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB8_11:                               # %entry.split.split.split.split.split
	xorl	%eax, %eax
	addl	$92, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.LBB8_10:                               # %entry.split.split.split.split.split
	movl	%edx, 8(%esp)
	movl	%edi, 4(%esp)
	movl	$.L.str7, (%esp)
	calll	printf
	jmp	.LBB8_11
.Ltmp8:
	.size	main, .Ltmp8-main

	.type	spheres,@object         # @spheres
	.comm	spheres,96,4
	.type	plane,@object           # @plane
	.comm	plane,48,4
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

	.type	.LrelFun,@object        # @relFun
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.LrelFun:
	.asciz	"Reliability CMP failed in function, exit directly %s\n"
	.size	.LrelFun, 54

	.type	.Lfunc,@object          # @func
	.align	16
.Lfunc:
	.asciz	"ray_sphere_intersect"
	.size	.Lfunc, 21

	.type	.Lfunc1,@object         # @func1
	.align	16
.Lfunc1:
	.asciz	"ray_plane_intersect"
	.size	.Lfunc1, 20

	.type	.Lfunc2,@object         # @func2
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc2:
	.asciz	"orthoBasis"
	.size	.Lfunc2, 11

	.type	.Lfunc3,@object         # @func3
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lfunc3:
	.asciz	"ambient_occlusion"
	.size	.Lfunc3, 18

	.type	.Lfunc4,@object         # @func4
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc4:
	.asciz	"clamp"
	.size	.Lfunc4, 6

	.type	.Lfunc5,@object         # @func5
.Lfunc5:
	.asciz	"render"
	.size	.Lfunc5, 7

	.type	.Lfunc6,@object         # @func6
.Lfunc6:
	.asciz	"init_scene"
	.size	.Lfunc6, 11

	.type	.Lfunc7,@object         # @func7
.Lfunc7:
	.asciz	"saveppm"
	.size	.Lfunc7, 8

	.type	.Lfunc8,@object         # @func8
.Lfunc8:
	.asciz	"main"
	.size	.Lfunc8, 5


	.section	".note.GNU-stack","",@progbits
