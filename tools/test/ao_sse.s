	.file	"ao_sse.bc"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI0_2:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_1:
	.quad	4352464011485697175     # double 1.0E-17
	.text
	.globl	ray_sphere_intersect
	.align	16, 0x90
	.type	ray_sphere_intersect,@function
ray_sphere_intersect:                   # @ray_sphere_intersect
# BB#0:                                 # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$140, %esp
	movl	168(%esp), %eax
	movl	164(%esp), %ecx
	movl	160(%esp), %edx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	(%ecx), %xmm1
	vsubsd	(%eax), %xmm1, %xmm1
	movl	%ecx, %esi
	addl	$8, %esi
	vmovsd	8(%ecx), %xmm2
	movl	%eax, %edi
	addl	$8, %edi
	vsubsd	8(%eax), %xmm2, %xmm2
	movl	%ecx, %ebx
	addl	$16, %ebx
	vmovsd	16(%ecx), %xmm3
	movl	%eax, %ebp
	addl	$16, %ebp
	vsubsd	16(%eax), %xmm3, %xmm3
	movl	%eax, 116(%esp)         # 4-byte Spill
	movl	%ecx, %eax
	addl	$24, %eax
	vmovsd	24(%ecx), %xmm4
	movl	%eax, 112(%esp)         # 4-byte Spill
	movl	%ecx, %eax
	addl	$32, %eax
	vmovsd	32(%ecx), %xmm5
	movl	%eax, 108(%esp)         # 4-byte Spill
	movl	%ecx, %eax
	addl	$40, %eax
	vmovsd	40(%ecx), %xmm6
	vmulsd	%xmm4, %xmm1, %xmm4
	vmulsd	%xmm5, %xmm2, %xmm5
	vaddsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm6, %xmm3, %xmm5
	vaddsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	movl	%eax, 104(%esp)         # 4-byte Spill
	movl	116(%esp), %eax         # 4-byte Reload
	vmovsd	24(%eax), %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm4, %xmm4, %xmm2
	vsubsd	%xmm1, %xmm2, %xmm1
	vucomisd	%xmm0, %xmm1
	movl	%ecx, 100(%esp)         # 4-byte Spill
	movl	%edx, 96(%esp)          # 4-byte Spill
	vmovsd	%xmm1, 88(%esp)         # 8-byte Spill
	vmovsd	%xmm4, 80(%esp)         # 8-byte Spill
	movl	%esi, 76(%esp)          # 4-byte Spill
	movl	%edi, 72(%esp)          # 4-byte Spill
	movl	%ebp, 68(%esp)          # 4-byte Spill
	movl	%ebx, 64(%esp)          # 4-byte Spill
	jbe	.LBB0_5
# BB#1:                                 # %if.then
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI0_0, %xmm1
	vmovsd	80(%esp), %xmm2         # 8-byte Reload
	vxorpd	%xmm1, %xmm2, %xmm1
	movl	%esp, %eax
	vmovsd	88(%esp), %xmm3         # 8-byte Reload
	vmovsd	%xmm3, (%eax)
	vmovsd	%xmm0, 56(%esp)         # 8-byte Spill
	vmovsd	%xmm1, 48(%esp)         # 8-byte Spill
	calll	sqrt
	fstpl	128(%esp)
	vmovsd	128(%esp), %xmm0
	vmovsd	48(%esp), %xmm1         # 8-byte Reload
	vsubsd	%xmm0, %xmm1, %xmm0
	vmovsd	56(%esp), %xmm1         # 8-byte Reload
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm0, 40(%esp)         # 8-byte Spill
	jbe	.LBB0_5
# BB#2:                                 # %land.lhs.true
	movl	96(%esp), %eax          # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	40(%esp), %xmm1         # 8-byte Reload
	vucomisd	%xmm1, %xmm0
	jbe	.LBB0_5
# BB#3:                                 # %if.then24
	vmovsd	.LCPI0_1, %xmm0
	movl	96(%esp), %eax          # 4-byte Reload
	vmovsd	40(%esp), %xmm1         # 8-byte Reload
	vmovsd	%xmm1, (%eax)
	movl	$1, 56(%eax)
	movl	100(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm2
	movl	112(%esp), %edx         # 4-byte Reload
	vmulsd	(%edx), %xmm1, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vmovsd	%xmm2, 8(%eax)
	movl	76(%esp), %esi          # 4-byte Reload
	vmovsd	(%esi), %xmm3
	movl	108(%esp), %edi         # 4-byte Reload
	vmulsd	(%edi), %xmm1, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vmovsd	%xmm3, 16(%eax)
	movl	64(%esp), %ebx          # 4-byte Reload
	vmovsd	(%ebx), %xmm4
	movl	104(%esp), %ebp         # 4-byte Reload
	vmulsd	(%ebp), %xmm1, %xmm5
	vaddsd	%xmm5, %xmm4, %xmm4
	vmovsd	%xmm4, 24(%eax)
	movl	116(%esp), %eax         # 4-byte Reload
	vsubsd	(%eax), %xmm2, %xmm2
	movl	96(%esp), %eax          # 4-byte Reload
	addl	$32, %eax
	movl	96(%esp), %ecx          # 4-byte Reload
	vmovsd	%xmm2, 32(%ecx)
	movl	72(%esp), %ecx          # 4-byte Reload
	vsubsd	(%ecx), %xmm3, %xmm3
	movl	96(%esp), %ecx          # 4-byte Reload
	addl	$40, %ecx
	movl	96(%esp), %edx          # 4-byte Reload
	vmovsd	%xmm3, 40(%edx)
	movl	68(%esp), %edx          # 4-byte Reload
	vsubsd	(%edx), %xmm4, %xmm4
	movl	96(%esp), %edx          # 4-byte Reload
	addl	$48, %edx
	movl	96(%esp), %esi          # 4-byte Reload
	vmovsd	%xmm4, 48(%esi)
	vmulsd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm4, %xmm4, %xmm3
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	%esp, %esi
	vmovsd	%xmm2, (%esi)
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	movl	%eax, 28(%esp)          # 4-byte Spill
	movl	%ecx, 24(%esp)          # 4-byte Spill
	movl	%edx, 20(%esp)          # 4-byte Spill
	calll	sqrt
	fstpl	120(%esp)
	vmovsd	120(%esp), %xmm0
	vmovsd	.LCPI0_2, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	vmovsd	32(%esp), %xmm2         # 8-byte Reload
	vucomisd	%xmm2, %xmm1
	vmovsd	%xmm0, 8(%esp)          # 8-byte Spill
	jbe	.LBB0_5
# BB#4:                                 # %if.then.i
	movl	28(%esp), %eax          # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	8(%esp), %xmm1          # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%eax)
	movl	24(%esp), %ecx          # 4-byte Reload
	vmovsd	(%ecx), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%ecx)
	movl	20(%esp), %edx          # 4-byte Reload
	vmovsd	(%edx), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%edx)
.LBB0_5:                                # %if.end69
	addl	$140, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp0:
	.size	ray_sphere_intersect, .Ltmp0-ray_sphere_intersect

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI1_0:
	.quad	4352464011485697175     # double 1.0E-17
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI1_1:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
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
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$108, %esp
	movl	136(%esp), %eax
	movl	132(%esp), %ecx
	movl	128(%esp), %edx
	vmovsd	.LCPI1_0, %xmm0
	movl	%eax, %esi
	addl	$24, %esi
	vmovsd	24(%eax), %xmm1
	vmovsd	32(%eax), %xmm2
	vmovsd	40(%eax), %xmm3
	movl	%ecx, %edi
	addl	$24, %edi
	vmovsd	24(%ecx), %xmm4
	movl	%ecx, %ebx
	addl	$32, %ebx
	vmovsd	32(%ecx), %xmm5
	movl	%ecx, %ebp
	addl	$40, %ebp
	vmovsd	40(%ecx), %xmm6
	vmulsd	%xmm4, %xmm1, %xmm4
	vmulsd	%xmm5, %xmm2, %xmm5
	vaddsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm6, %xmm3, %xmm5
	vaddsd	%xmm5, %xmm4, %xmm4
	vmovsd	.LCPI1_1, %xmm5
	vandpd	%xmm5, %xmm4, %xmm5
	vucomisd	%xmm5, %xmm0
	movl	%eax, 104(%esp)         # 4-byte Spill
	movl	%ecx, 100(%esp)         # 4-byte Spill
	movl	%edx, 96(%esp)          # 4-byte Spill
	vmovsd	%xmm4, 88(%esp)         # 8-byte Spill
	movl	%esi, 84(%esp)          # 4-byte Spill
	vmovsd	%xmm1, 72(%esp)         # 8-byte Spill
	vmovsd	%xmm2, 64(%esp)         # 8-byte Spill
	vmovsd	%xmm3, 56(%esp)         # 8-byte Spill
	movl	%edi, 52(%esp)          # 4-byte Spill
	movl	%ebp, 48(%esp)          # 4-byte Spill
	movl	%ebx, 44(%esp)          # 4-byte Spill
	ja	.LBB1_4
# BB#1:                                 # %if.end
	vxorps	%xmm0, %xmm0, %xmm0
	movl	104(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm1
	vmovsd	8(%eax), %xmm2
	vmovsd	64(%esp), %xmm3         # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm2
	vmovsd	72(%esp), %xmm4         # 8-byte Reload
	vmulsd	%xmm1, %xmm4, %xmm1
	vmovsd	16(%eax), %xmm5
	vmovsd	56(%esp), %xmm6         # 8-byte Reload
	vmulsd	%xmm5, %xmm6, %xmm5
	vaddsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm5, %xmm1, %xmm1
	movl	100(%esp), %ecx         # 4-byte Reload
	addl	$8, %ecx
	movl	100(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	8(%edx), %xmm5
	addl	$16, %edx
	movl	100(%esp), %esi         # 4-byte Reload
	vmovsd	16(%esi), %xmm7
	vmulsd	%xmm2, %xmm4, %xmm2
	vmulsd	%xmm5, %xmm3, %xmm5
	vaddsd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm7, %xmm6, %xmm5
	vaddsd	%xmm5, %xmm2, %xmm2
	vsubsd	%xmm1, %xmm2, %xmm1
	vmovsd	.LCPI1_2, %xmm2
	vxorpd	%xmm2, %xmm1, %xmm1
	vmovsd	88(%esp), %xmm2         # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	vmovsd	%xmm1, 32(%esp)         # 8-byte Spill
	movl	%esi, 28(%esp)          # 4-byte Spill
	movl	%ecx, 24(%esp)          # 4-byte Spill
	movl	%edx, 20(%esp)          # 4-byte Spill
	jbe	.LBB1_4
# BB#2:                                 # %land.lhs.true
	movl	96(%esp), %eax          # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	32(%esp), %xmm1         # 8-byte Reload
	vucomisd	%xmm1, %xmm0
	jbe	.LBB1_4
# BB#3:                                 # %if.then10
	movl	$24, %eax
	movl	96(%esp), %ecx          # 4-byte Reload
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, (%ecx)
	movl	$1, 56(%ecx)
	movl	28(%esp), %edx          # 4-byte Reload
	vmovsd	(%edx), %xmm1
	movl	52(%esp), %esi          # 4-byte Reload
	vmulsd	(%esi), %xmm0, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 8(%ecx)
	movl	24(%esp), %edi          # 4-byte Reload
	vmovsd	(%edi), %xmm1
	movl	44(%esp), %ebx          # 4-byte Reload
	vmulsd	(%ebx), %xmm0, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	%xmm1, 16(%ecx)
	movl	20(%esp), %ebp          # 4-byte Reload
	vmovsd	(%ebp), %xmm1
	movl	48(%esp), %ecx          # 4-byte Reload
	vmulsd	(%ecx), %xmm0, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	movl	96(%esp), %ecx          # 4-byte Reload
	vmovsd	%xmm1, 24(%ecx)
	addl	$32, %ecx
	movl	84(%esp), %edx          # 4-byte Reload
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	$24, 8(%esp)
	movl	%eax, 16(%esp)          # 4-byte Spill
	calll	memcpy
.LBB1_4:                                # %if.end34
	addl	$108, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp1:
	.size	ray_plane_intersect, .Ltmp1-ray_plane_intersect

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	-4619792497756654797    # double -0.6
.LCPI2_1:
	.quad	4603579539098121011     # double 0.6
.LCPI2_2:
	.quad	4607182418800017408     # double 1
.LCPI2_3:
	.quad	4352464011485697175     # double 1.0E-17
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI2_4:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.text
	.globl	orthoBasis
	.align	16, 0x90
	.type	orthoBasis,@function
orthoBasis:                             # @orthoBasis
# BB#0:                                 # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$236, %esp
	leal	260(%esp), %eax
	movl	256(%esp), %ecx
	vmovsd	.LCPI2_0, %xmm0
	vmovsd	.LCPI2_1, %xmm1
	movl	$24, %edx
	movl	%ecx, %esi
	addl	$48, %esi
	movl	%esi, %edi
	movl	%eax, %ebx
	movl	%edi, (%esp)
	movl	%ebx, 4(%esp)
	movl	$24, 8(%esp)
	movl	%eax, 212(%esp)         # 4-byte Spill
	movl	%ecx, 208(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 200(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 192(%esp)        # 8-byte Spill
	movl	%edx, 188(%esp)         # 4-byte Spill
	movl	%esi, 184(%esp)         # 4-byte Spill
	calll	memcpy
	movl	208(%esp), %eax         # 4-byte Reload
	addl	$24, %eax
	movl	208(%esp), %ecx         # 4-byte Reload
	addl	$32, %ecx
	movl	208(%esp), %edx         # 4-byte Reload
	addl	$40, %edx
	movl	%eax, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%esi)
	movl	$0, 20(%esi)
	movl	$0, 16(%esi)
	movl	212(%esp), %esi         # 4-byte Reload
	vmovsd	(%esi), %xmm0
	vmovsd	192(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm0, %xmm1
	seta	%bl
	vmovsd	200(%esp), %xmm2        # 8-byte Reload
	vucomisd	%xmm2, %xmm0
	seta	%bh
	andb	%bh, %bl
	testb	$1, %bl
	movl	%eax, 180(%esp)         # 4-byte Spill
	movl	%ecx, 176(%esp)         # 4-byte Spill
	movl	%edx, 172(%esp)         # 4-byte Spill
	jne	.LBB2_1
	jmp	.LBB2_2
.LBB2_1:                                # %if.then
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$1, %eax
	vmovsd	.LCPI2_2, %xmm1
	movl	180(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm1, (%ecx)
	vmovaps	%xmm0, %xmm2
	vmovsd	%xmm2, 160(%esp)        # 8-byte Spill
	movl	%eax, 156(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 144(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 136(%esp)        # 8-byte Spill
	jmp	.LBB2_7
.LBB2_2:                                # %if.else
	vmovsd	.LCPI2_0, %xmm0
	vmovsd	.LCPI2_1, %xmm1
	movl	212(%esp), %eax         # 4-byte Reload
	vmovsd	8(%eax), %xmm2
	vucomisd	%xmm2, %xmm1
	seta	%cl
	vucomisd	%xmm0, %xmm2
	seta	%dl
	andb	%dl, %cl
	testb	$1, %cl
	jne	.LBB2_3
	jmp	.LBB2_4
.LBB2_3:                                # %if.then14
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$1, %eax
	vmovsd	.LCPI2_2, %xmm1
	movl	176(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm1, (%ecx)
	vmovaps	%xmm0, %xmm2
	vmovsd	%xmm1, 144(%esp)        # 8-byte Spill
	movl	%eax, 132(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 160(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 136(%esp)        # 8-byte Spill
	jmp	.LBB2_7
.LBB2_4:                                # %if.else17
	vmovsd	.LCPI2_0, %xmm0
	vmovsd	.LCPI2_1, %xmm1
	movl	212(%esp), %eax         # 4-byte Reload
	vmovsd	16(%eax), %xmm2
	vucomisd	%xmm2, %xmm1
	seta	%cl
	vucomisd	%xmm0, %xmm2
	seta	%dl
	andb	%dl, %cl
	testb	$1, %cl
	jne	.LBB2_5
	jmp	.LBB2_6
.LBB2_5:                                # %if.then23
	movl	$1, %eax
	vmovsd	.LCPI2_2, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	movl	172(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm0, (%ecx)
	vmovaps	%xmm1, %xmm2
	movl	%eax, 128(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 144(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 160(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 136(%esp)        # 8-byte Spill
	jmp	.LBB2_7
.LBB2_6:                                # %if.else26
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$1, %eax
	vmovsd	.LCPI2_2, %xmm1
	movl	180(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm1, (%ecx)
	vmovaps	%xmm0, %xmm2
	vmovsd	%xmm2, 160(%esp)        # 8-byte Spill
	movl	%eax, 124(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 144(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 136(%esp)        # 8-byte Spill
.LBB2_7:                                # %if.end30
	vmovsd	160(%esp), %xmm0        # 8-byte Reload
	vmovsd	144(%esp), %xmm1        # 8-byte Reload
	vmovsd	136(%esp), %xmm2        # 8-byte Reload
	vmovsd	.LCPI2_3, %xmm3
	movl	184(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm4
	movl	208(%esp), %ecx         # 4-byte Reload
	addl	$56, %ecx
	movl	208(%esp), %edx         # 4-byte Reload
	vmovsd	56(%edx), %xmm5
	addl	$64, %edx
	movl	208(%esp), %esi         # 4-byte Reload
	vmovsd	64(%esi), %xmm6
	vmulsd	%xmm6, %xmm1, %xmm7
	vmovsd	%xmm0, 112(%esp)        # 8-byte Spill
	vmulsd	%xmm5, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm7, %xmm0
	vmovsd	%xmm0, (%esi)
	vmovsd	112(%esp), %xmm7        # 8-byte Reload
	vmulsd	%xmm4, %xmm7, %xmm7
	vmulsd	%xmm6, %xmm2, %xmm6
	vsubsd	%xmm6, %xmm7, %xmm6
	addl	$8, %esi
	movl	208(%esp), %edi         # 4-byte Reload
	vmovsd	%xmm6, 8(%edi)
	vmulsd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm4, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm2, %xmm1
	addl	$16, %edi
	movl	208(%esp), %ebx         # 4-byte Reload
	vmovsd	%xmm1, 16(%ebx)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm6, %xmm6, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	movl	%esp, %ebp
	vmovsd	%xmm0, (%ebp)
	movl	%edx, 108(%esp)         # 4-byte Spill
	movl	%edi, 104(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 96(%esp)         # 8-byte Spill
	movl	%esi, 92(%esp)          # 4-byte Spill
	movl	%ecx, 88(%esp)          # 4-byte Spill
	calll	sqrt
	fstpl	224(%esp)
	vmovsd	224(%esp), %xmm0
	vmovsd	.LCPI2_4, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	movl	208(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm2
	vmovsd	96(%esp), %xmm3         # 8-byte Reload
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm0, 80(%esp)         # 8-byte Spill
	vmovsd	%xmm2, 72(%esp)         # 8-byte Spill
	ja	.LBB2_9
# BB#8:                                 # %if.end30.vnormalize.exit77_crit_edge
	movl	92(%esp), %eax          # 4-byte Reload
	vmovsd	(%eax), %xmm0
	movl	104(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	72(%esp), %xmm2         # 8-byte Reload
	vmovsd	%xmm1, 64(%esp)         # 8-byte Spill
	vmovsd	%xmm0, 56(%esp)         # 8-byte Spill
	vmovsd	%xmm2, 48(%esp)         # 8-byte Spill
	jmp	.LBB2_10
.LBB2_9:                                # %if.then.i76
	vmovsd	72(%esp), %xmm0         # 8-byte Reload
	vmovsd	80(%esp), %xmm1         # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	movl	208(%esp), %eax         # 4-byte Reload
	vmovsd	%xmm2, (%eax)
	movl	92(%esp), %ecx          # 4-byte Reload
	vmovsd	(%ecx), %xmm3
	vdivsd	%xmm1, %xmm3, %xmm3
	vmovsd	%xmm3, (%ecx)
	movl	104(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm4
	vdivsd	%xmm1, %xmm4, %xmm4
	vmovsd	%xmm4, (%edx)
	vmovsd	%xmm3, 56(%esp)         # 8-byte Spill
	vmovsd	%xmm4, 64(%esp)         # 8-byte Spill
	vmovsd	%xmm2, 48(%esp)         # 8-byte Spill
.LBB2_10:                               # %vnormalize.exit77
	vmovsd	64(%esp), %xmm0         # 8-byte Reload
	vmovsd	56(%esp), %xmm1         # 8-byte Reload
	vmovsd	48(%esp), %xmm2         # 8-byte Reload
	vmovsd	.LCPI2_3, %xmm3
	movl	184(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm4
	movl	88(%esp), %ecx          # 4-byte Reload
	vmovsd	(%ecx), %xmm5
	movl	108(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm6
	vmulsd	%xmm0, %xmm5, %xmm7
	vmovsd	%xmm0, 40(%esp)         # 8-byte Spill
	vmulsd	%xmm1, %xmm6, %xmm0
	vsubsd	%xmm0, %xmm7, %xmm0
	movl	180(%esp), %esi         # 4-byte Reload
	vmovsd	%xmm0, (%esi)
	vmulsd	%xmm2, %xmm6, %xmm6
	vmovsd	40(%esp), %xmm7         # 8-byte Reload
	vmulsd	%xmm7, %xmm4, %xmm7
	vsubsd	%xmm7, %xmm6, %xmm6
	movl	176(%esp), %edi         # 4-byte Reload
	vmovsd	%xmm6, (%edi)
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm2, %xmm5, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	movl	172(%esp), %ebx         # 4-byte Reload
	vmovsd	%xmm1, (%ebx)
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm6, %xmm6, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	movl	%esp, %ebp
	vmovsd	%xmm0, (%ebp)
	vmovsd	%xmm3, 32(%esp)         # 8-byte Spill
	calll	sqrt
	fstpl	216(%esp)
	vmovsd	216(%esp), %xmm0
	vmovsd	.LCPI2_4, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	vmovsd	32(%esp), %xmm2         # 8-byte Reload
	vucomisd	%xmm2, %xmm1
	vmovsd	%xmm0, 24(%esp)         # 8-byte Spill
	jbe	.LBB2_12
# BB#11:                                # %if.then.i
	movl	180(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	24(%esp), %xmm1         # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%eax)
	movl	176(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%ecx)
	movl	172(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%edx)
.LBB2_12:                               # %vnormalize.exit
	addl	$236, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp2:
	.size	orthoBasis, .Ltmp2-orthoBasis

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4547007122018943789     # double 1.0E-4
.LCPI3_22:
	.quad	4571153621781053440     # double 0.00390625
.LCPI3_23:
	.quad	4643211215818981376     # double 256
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_1:
	.long	0                       # 0x0
	.long	2147483648              # 0x80000000
	.long	0                       # 0x0
	.long	2147483648              # 0x80000000
.LCPI3_2:
	.quad	4618760256179416344     # double 6.283185e+00
	.quad	4618760256179416344     # double 6.283185e+00
.LCPI3_3:
	.long	4294967295              # 0xffffffff
	.long	2147483647              # 0x7fffffff
	.long	4294967295              # 0xffffffff
	.long	2147483647              # 0x7fffffff
.LCPI3_4:
	.quad	4608412980311869559     # double 1.273240e+00
	.quad	4608412980311869559     # double 1.273240e+00
.LCPI3_5:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
.LCPI3_6:
	.long	4294967294              # 0xfffffffe
	.long	4294967294              # 0xfffffffe
	.long	4294967294              # 0xfffffffe
	.long	4294967294              # 0xfffffffe
.LCPI3_7:
	.quad	-4618124758519644160    # double -7.851562e-01
	.quad	-4618124758519644160    # double -7.851562e-01
.LCPI3_8:
	.quad	-4670316376466915328    # double -2.418756e-04
	.quad	-4670316376466915328    # double -2.418756e-04
.LCPI3_9:
	.quad	-4727578748360681319    # double -3.774895e-08
	.quad	-4727578748360681319    # double -3.774895e-08
.LCPI3_10:
	.quad	4537832620275044031     # double 2.443316e-05
	.quad	4537832620275044031     # double 2.443316e-05
.LCPI3_11:
	.quad	-4659324819735196321    # double -1.388732e-03
	.quad	-4659324819735196321    # double -1.388732e-03
.LCPI3_12:
	.quad	4586165617514888335     # double 4.166665e-02
	.quad	4586165617514888335     # double 4.166665e-02
.LCPI3_13:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI3_14:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI3_15:
	.quad	-4672040139461465492    # double -1.951530e-04
	.quad	-4672040139461465492    # double -1.951530e-04
.LCPI3_16:
	.quad	4575956785506562046     # double 8.332161e-03
	.quad	4575956785506562046     # double 8.332161e-03
.LCPI3_17:
	.quad	-4628199221404591395    # double -1.666665e-01
	.quad	-4628199221404591395    # double -1.666665e-01
.LCPI3_18:
	.long	2                       # 0x2
	.long	2                       # 0x2
	.long	2                       # 0x2
	.long	2                       # 0x2
.LCPI3_19:
	.long	4                       # 0x4
	.long	4                       # 0x4
	.long	4                       # 0x4
	.long	4                       # 0x4
.LCPI3_20:
	.quad	4861130398305394688     # double 1.000000e+17
	.quad	4861130398305394688     # double 1.000000e+17
.LCPI3_21:
	.quad	4352464011485697175     # double 1.000000e-17
	.quad	4352464011485697175     # double 1.000000e-17
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
	subl	$1660, %esp             # imm = 0x67C
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	vmovsd	32(%eax), %xmm0
	vmovsd	.LCPI3_0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	8(%eax), %xmm2
	vmovsd	16(%eax), %xmm3
	vaddsd	%xmm0, %xmm2, %xmm0
	vmovsd	40(%eax), %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm3, %xmm2
	vmovsd	24(%eax), %xmm3
	vmovsd	48(%eax), %xmm4
	vmulsd	%xmm1, %xmm4, %xmm1
	vaddsd	%xmm1, %xmm3, %xmm1
	leal	-88(%ebp), %edx
	subl	$32, %esp
	vmovsd	48(%eax), %xmm3
	movl	%esp, %esi
	vmovsd	%xmm3, 20(%esi)
	vmovups	32(%eax), %xmm3
	vmovups	%xmm3, 4(%esi)
	movl	%edx, (%esi)
	vmovsd	%xmm1, -96(%ebp)        # 8-byte Spill
	movl	%ecx, -100(%ebp)        # 4-byte Spill
	vmovsd	%xmm2, -112(%ebp)       # 8-byte Spill
	vmovsd	%xmm0, -120(%ebp)       # 8-byte Spill
	calll	orthoBasis
	addl	$32, %esp
	xorl	%eax, %eax
	vmovsd	-96(%ebp), %xmm0        # 8-byte Reload
	vpermilpd	$0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovsd	-112(%ebp), %xmm1       # 8-byte Reload
	vpermilpd	$0, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovsd	-120(%ebp), %xmm2       # 8-byte Reload
	vpermilpd	$0, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	vmovsd	-24(%ebp), %xmm3
	vunpcklpd	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vmovsd	-48(%ebp), %xmm4
	vunpcklpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vmovsd	-72(%ebp), %xmm5
	vunpcklpd	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vmovsd	-32(%ebp), %xmm6
	vunpcklpd	%xmm6, %xmm6, %xmm6 # xmm6 = xmm6[0,0]
	vmovsd	-56(%ebp), %xmm7
	vunpcklpd	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm0, -136(%ebp)       # 16-byte Spill
	vmovsd	-88(%ebp), %xmm0
	vmovsd	%xmm0, -144(%ebp)       # 8-byte Spill
	vmovsd	-80(%ebp), %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, -168(%ebp)       # 16-byte Spill
	vmovsd	-40(%ebp), %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, -184(%ebp)       # 16-byte Spill
	vmovsd	-64(%ebp), %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, -200(%ebp)       # 16-byte Spill
	vmovsd	-144(%ebp), %xmm0       # 8-byte Reload
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, -216(%ebp)       # 16-byte Spill
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -232(%ebp)       # 16-byte Spill
	vmovaps	%xmm7, -248(%ebp)       # 16-byte Spill
	vmovaps	%xmm1, -264(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -280(%ebp)       # 16-byte Spill
	vmovaps	%xmm3, -296(%ebp)       # 16-byte Spill
	vmovaps	%xmm4, -312(%ebp)       # 16-byte Spill
	vmovaps	%xmm5, -328(%ebp)       # 16-byte Spill
	vmovaps	%xmm6, -344(%ebp)       # 16-byte Spill
	movl	%eax, -348(%ebp)        # 4-byte Spill
.LBB3_1:                                # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	vmovaps	-232(%ebp), %xmm0       # 16-byte Reload
	movl	-348(%ebp), %eax        # 4-byte Reload
	movl	$0, %ecx
	movl	%esp, %edx
	movl	%esp, %esi
	movl	%esi, %edi
	addl	$-128, %edi
	movl	%edi, %esp
	movl	%esp, %ebx
	movl	%eax, -352(%ebp)        # 4-byte Spill
	movl	%ebx, %eax
	addl	$-128, %eax
	movl	%eax, %esp
	vmovaps	%xmm0, -376(%ebp)       # 16-byte Spill
	movl	%eax, -380(%ebp)        # 4-byte Spill
	movl	%ecx, -384(%ebp)        # 4-byte Spill
	movl	%edx, -388(%ebp)        # 4-byte Spill
	movl	%esi, -392(%ebp)        # 4-byte Spill
	movl	%edi, -396(%ebp)        # 4-byte Spill
	movl	%ebx, -400(%ebp)        # 4-byte Spill
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-128(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-128(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-120(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-120(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-112(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-112(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-104(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-104(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-96(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-96(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-88(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-88(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-80(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-80(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-72(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-72(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-64(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-64(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-56(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-56(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-48(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-48(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-40(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-40(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-32(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-32(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-24(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-24(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-16(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-16(%eax)
	calll	drand48
	movl	-392(%ebp), %eax        # 4-byte Reload
	fstpl	-8(%eax)
	calll	drand48
	movl	-400(%ebp), %eax        # 4-byte Reload
	fstpl	-8(%eax)
	vmovsd	spheres, %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	-280(%ebp), %xmm1       # 16-byte Reload
	vsubpd	%xmm0, %xmm1, %xmm0
	vmovsd	spheres+8, %xmm2
	vunpcklpd	%xmm2, %xmm2, %xmm2 # xmm2 = xmm2[0,0]
	vmovaps	-264(%ebp), %xmm3       # 16-byte Reload
	vsubpd	%xmm2, %xmm3, %xmm2
	vmovsd	spheres+16, %xmm4
	vunpcklpd	%xmm4, %xmm4, %xmm4 # xmm4 = xmm4[0,0]
	vmovaps	-136(%ebp), %xmm5       # 16-byte Reload
	vsubpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm0, %xmm0, %xmm6
	vmulpd	%xmm2, %xmm2, %xmm7
	vmulpd	%xmm4, %xmm4, %xmm1
	vaddpd	%xmm1, %xmm7, %xmm1
	vaddpd	%xmm1, %xmm6, %xmm1
	vmovsd	spheres+24, %xmm6
	vmulsd	%xmm6, %xmm6, %xmm6
	vpermilpd	$0, %xmm6, %xmm6 # xmm6 = xmm6[0,0]
	vsubpd	%xmm6, %xmm1, %xmm1
	vmovsd	spheres+32, %xmm6
	vunpcklpd	%xmm6, %xmm6, %xmm6 # xmm6 = xmm6[0,0]
	vmovaps	-280(%ebp), %xmm7       # 16-byte Reload
	vsubpd	%xmm6, %xmm7, %xmm6
	vmovsd	spheres+40, %xmm3
	vunpcklpd	%xmm3, %xmm3, %xmm3 # xmm3 = xmm3[0,0]
	vmovaps	-264(%ebp), %xmm5       # 16-byte Reload
	vsubpd	%xmm3, %xmm5, %xmm3
	vmovsd	spheres+48, %xmm5
	vunpcklpd	%xmm5, %xmm5, %xmm5 # xmm5 = xmm5[0,0]
	vmovaps	-136(%ebp), %xmm7       # 16-byte Reload
	vsubpd	%xmm5, %xmm7, %xmm5
	vmulpd	%xmm6, %xmm6, %xmm7
	vmovaps	%xmm0, -424(%ebp)       # 16-byte Spill
	vmulpd	%xmm3, %xmm3, %xmm0
	vmovaps	%xmm0, -440(%ebp)       # 16-byte Spill
	vmulpd	%xmm5, %xmm5, %xmm0
	vmovaps	%xmm0, -456(%ebp)       # 16-byte Spill
	vmovaps	-440(%ebp), %xmm0       # 16-byte Reload
	vmovaps	%xmm1, -472(%ebp)       # 16-byte Spill
	vmovaps	-456(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm7, %xmm0
	vmovsd	spheres+56, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vpermilpd	$0, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vsubpd	%xmm1, %xmm0, %xmm0
	vmovsd	spheres+64, %xmm1
	vunpcklpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	-280(%ebp), %xmm7       # 16-byte Reload
	vsubpd	%xmm1, %xmm7, %xmm1
	vmovsd	spheres+72, %xmm7
	vunpcklpd	%xmm7, %xmm7, %xmm7 # xmm7 = xmm7[0,0]
	vmovaps	%xmm0, -488(%ebp)       # 16-byte Spill
	vmovaps	-264(%ebp), %xmm0       # 16-byte Reload
	vsubpd	%xmm7, %xmm0, %xmm7
	vmovsd	spheres+80, %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, -504(%ebp)       # 16-byte Spill
	vmovaps	-136(%ebp), %xmm0       # 16-byte Reload
	vmovaps	%xmm1, -520(%ebp)       # 16-byte Spill
	vmovaps	-504(%ebp), %xmm1       # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm1
	vmovaps	-520(%ebp), %xmm0       # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -536(%ebp)       # 16-byte Spill
	vmulpd	%xmm7, %xmm7, %xmm0
	vmovaps	%xmm0, -552(%ebp)       # 16-byte Spill
	vmulpd	%xmm1, %xmm1, %xmm0
	vmovaps	%xmm0, -568(%ebp)       # 16-byte Spill
	vmovaps	-552(%ebp), %xmm0       # 16-byte Reload
	vmovaps	%xmm1, -584(%ebp)       # 16-byte Spill
	vmovaps	-568(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovaps	-536(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovsd	spheres+88, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm1
	vpermilpd	$0, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vsubpd	%xmm1, %xmm0, %xmm0
	vmovsd	plane+24, %xmm1
	vunpcklpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm0, -600(%ebp)       # 16-byte Spill
	vmovsd	plane, %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -616(%ebp)       # 16-byte Spill
	vmovsd	plane+32, %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm0, -632(%ebp)       # 16-byte Spill
	vmovsd	plane+8, %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmovaps	%xmm1, -648(%ebp)       # 16-byte Spill
	vmovaps	-632(%ebp), %xmm1       # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovsd	plane+40, %xmm1
	vunpcklpd	%xmm1, %xmm1, %xmm1 # xmm1 = xmm1[0,0]
	vmovaps	%xmm0, -664(%ebp)       # 16-byte Spill
	vmovsd	plane+16, %xmm0
	vunpcklpd	%xmm0, %xmm0, %xmm0 # xmm0 = xmm0[0,0]
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -680(%ebp)       # 16-byte Spill
	vmovaps	-664(%ebp), %xmm0       # 16-byte Reload
	vmovaps	%xmm1, -696(%ebp)       # 16-byte Spill
	vmovaps	-680(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovaps	-616(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovaps	-280(%ebp), %xmm1       # 16-byte Reload
	vmovaps	%xmm0, -712(%ebp)       # 16-byte Spill
	vmovaps	-648(%ebp), %xmm0       # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovaps	-264(%ebp), %xmm1       # 16-byte Reload
	vmovaps	%xmm0, -728(%ebp)       # 16-byte Spill
	vmovaps	-632(%ebp), %xmm0       # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovaps	-136(%ebp), %xmm1       # 16-byte Reload
	vmovaps	%xmm0, -744(%ebp)       # 16-byte Spill
	vmovaps	-696(%ebp), %xmm0       # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovaps	-744(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovaps	-728(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovaps	.LCPI3_1, %xmm1
	vmovaps	%xmm0, -760(%ebp)       # 16-byte Spill
	vmovaps	-712(%ebp), %xmm0       # 16-byte Reload
	vpxor	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -776(%ebp)       # 16-byte Spill
	vmovaps	-760(%ebp), %xmm0       # 16-byte Reload
	vmovaps	%xmm1, -792(%ebp)       # 16-byte Spill
	vmovaps	-776(%ebp), %xmm1       # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm0
	vmovaps	-792(%ebp), %xmm1       # 16-byte Reload
	vpxor	%xmm1, %xmm0, %xmm0
	movl	-388(%ebp), %ecx        # 4-byte Reload
	vmovaps	%xmm0, %xmm1
	movl	-384(%ebp), %edx        # 4-byte Reload
	vmovaps	%xmm0, -808(%ebp)       # 16-byte Spill
	vmovaps	-376(%ebp), %xmm0       # 16-byte Reload
	vmovaps	%xmm4, -824(%ebp)       # 16-byte Spill
	vmovaps	%xmm5, -840(%ebp)       # 16-byte Spill
	vmovaps	%xmm6, -856(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -872(%ebp)       # 16-byte Spill
	vmovaps	%xmm3, -888(%ebp)       # 16-byte Spill
	vmovaps	%xmm7, -904(%ebp)       # 16-byte Spill
	vmovaps	%xmm1, -920(%ebp)       # 16-byte Spill
	vmovaps	%xmm0, -936(%ebp)       # 16-byte Spill
	movl	%ecx, -940(%ebp)        # 4-byte Spill
	movl	%edx, -944(%ebp)        # 4-byte Spill
.LBB3_2:                                # %for.body27
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-944(%ebp), %eax        # 4-byte Reload
	vmovaps	-936(%ebp), %xmm0       # 16-byte Reload
	movl	-380(%ebp), %ecx        # 4-byte Reload
	vmovapd	(%ecx,%eax,8), %xmm1
	vmovapd	.LCPI3_2, %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	vmovaps	.LCPI3_3, %xmm2
	vpand	%xmm2, %xmm1, %xmm2
	vmovapd	.LCPI3_4, %xmm3
	vmulpd	%xmm3, %xmm2, %xmm3
	vcvttpd2dq	%xmm3, %xmm3
	vmovaps	.LCPI3_5, %xmm4
	vpaddd	%xmm4, %xmm3, %xmm3
	vmovaps	.LCPI3_6, %xmm4
	vpand	%xmm4, %xmm3, %xmm5
	vcvtdq2pd	%xmm5, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vmovaps	%xmm0, -968(%ebp)       # 16-byte Spill
	vmovapd	.LCPI3_7, %xmm0
	vmulpd	%xmm0, %xmm6, %xmm0
	vmovaps	%xmm0, -984(%ebp)       # 16-byte Spill
	vmovapd	.LCPI3_8, %xmm0
	vmulpd	%xmm0, %xmm6, %xmm0
	vmovaps	%xmm0, -1000(%ebp)      # 16-byte Spill
	vmovapd	.LCPI3_9, %xmm0
	vmulpd	%xmm0, %xmm6, %xmm0
	vmovaps	-984(%ebp), %xmm6       # 16-byte Reload
	vaddpd	%xmm2, %xmm6, %xmm2
	vmovaps	-1000(%ebp), %xmm6      # 16-byte Reload
	vaddpd	%xmm2, %xmm6, %xmm2
	vaddpd	%xmm2, %xmm0, %xmm0
	vpaddd	%xmm4, %xmm5, %xmm2
	vmulpd	%xmm0, %xmm0, %xmm4
	vmovapd	.LCPI3_10, %xmm5
	vmulpd	%xmm5, %xmm4, %xmm5
	vmovapd	.LCPI3_11, %xmm6
	vaddpd	%xmm6, %xmm5, %xmm5
	vmulpd	%xmm5, %xmm4, %xmm5
	vmovapd	.LCPI3_12, %xmm6
	vaddpd	%xmm6, %xmm5, %xmm5
	vmulpd	%xmm5, %xmm4, %xmm5
	vmulpd	%xmm5, %xmm4, %xmm5
	vmovapd	.LCPI3_13, %xmm6
	vmulpd	%xmm6, %xmm4, %xmm6
	vsubpd	%xmm6, %xmm5, %xmm5
	vmovapd	.LCPI3_14, %xmm6
	vaddpd	%xmm6, %xmm5, %xmm5
	vmovaps	%xmm0, -1016(%ebp)      # 16-byte Spill
	vmovapd	.LCPI3_15, %xmm0
	vmulpd	%xmm0, %xmm4, %xmm0
	vmovaps	%xmm0, -1032(%ebp)      # 16-byte Spill
	vmovapd	.LCPI3_16, %xmm0
	vmovaps	%xmm0, -1048(%ebp)      # 16-byte Spill
	vmovaps	-1032(%ebp), %xmm0      # 16-byte Reload
	vmovaps	%xmm1, -1064(%ebp)      # 16-byte Spill
	vmovaps	-1048(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm0, %xmm4, %xmm0
	vmovapd	.LCPI3_17, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	%xmm0, %xmm4, %xmm0
	vmovaps	-1016(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vaddpd	%xmm0, %xmm1, %xmm0
	vmovaps	.LCPI3_18, %xmm4
	vpand	%xmm4, %xmm3, %xmm4
	vpcmpeqd	%xmm7, %xmm4, %xmm4
	vpshufd	$80, %xmm4, %xmm4       # xmm4 = xmm4[0,0,1,1]
	vpand	%xmm0, %xmm4, %xmm1
	vsubpd	%xmm1, %xmm0, %xmm0
	vpandn	%xmm5, %xmm4, %xmm4
	vsubpd	%xmm4, %xmm5, %xmm5
	vaddpd	%xmm4, %xmm1, %xmm1
	vaddpd	%xmm5, %xmm0, %xmm0
	vmovaps	.LCPI3_19, %xmm4
	vpandn	%xmm4, %xmm2, %xmm2
	vpslld	$29, %xmm2, %xmm2
	vpshufd	$98, %xmm2, %xmm2       # xmm2 = xmm2[2,0,2,1]
	vpxor	%xmm2, %xmm0, %xmm0
	movl	-396(%ebp), %edx        # 4-byte Reload
	vsqrtpd	(%edx,%eax,8), %xmm2
	vmulpd	%xmm0, %xmm2, %xmm0
	vmovaps	.LCPI3_1, %xmm5
	vmovaps	%xmm0, -1080(%ebp)      # 16-byte Spill
	vmovaps	-1064(%ebp), %xmm0      # 16-byte Reload
	vpand	%xmm5, %xmm0, %xmm5
	vpand	%xmm4, %xmm3, %xmm3
	vpslld	$29, %xmm3, %xmm3
	vpshufd	$98, %xmm3, %xmm3       # xmm3 = xmm3[2,0,2,1]
	vpxor	%xmm3, %xmm5, %xmm3
	vpxor	%xmm3, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm2, %xmm1
	vmulpd	%xmm2, %xmm2, %xmm2
	vsubpd	%xmm2, %xmm6, %xmm2
	vmovaps	-216(%ebp), %xmm3       # 16-byte Reload
	vmovaps	-1080(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	vmovaps	-200(%ebp), %xmm6       # 16-byte Reload
	vmulpd	%xmm1, %xmm6, %xmm0
	vsqrtpd	%xmm2, %xmm2
	vmovaps	-184(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm3
	vaddpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vmovaps	-168(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	vmovaps	-248(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm1, %xmm3, %xmm3
	vmovaps	-344(%ebp), %xmm4       # 16-byte Reload
	vmulpd	%xmm4, %xmm2, %xmm4
	vaddpd	%xmm3, %xmm4, %xmm3
	vaddpd	%xmm3, %xmm5, %xmm3
	vmovaps	-328(%ebp), %xmm4       # 16-byte Reload
	vmovaps	-1080(%ebp), %xmm5      # 16-byte Reload
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovaps	-312(%ebp), %xmm5       # 16-byte Reload
	vmulpd	%xmm1, %xmm5, %xmm1
	vmovaps	-296(%ebp), %xmm5       # 16-byte Reload
	vmulpd	%xmm5, %xmm2, %xmm2
	vaddpd	%xmm1, %xmm2, %xmm1
	vaddpd	%xmm1, %xmm4, %xmm1
	vmovaps	-424(%ebp), %xmm2       # 16-byte Reload
	vmulpd	%xmm0, %xmm2, %xmm4
	vmovaps	-872(%ebp), %xmm2       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm2
	vmovaps	-824(%ebp), %xmm5       # 16-byte Reload
	vmulpd	%xmm1, %xmm5, %xmm5
	vaddpd	%xmm5, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm4, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm4
	vmovaps	-472(%ebp), %xmm5       # 16-byte Reload
	vsubpd	%xmm5, %xmm4, %xmm4
	vcmpltpd	%xmm4, %xmm7, %xmm5
	vmovmskpd	%xmm5, %esi
	vmovapd	.LCPI3_20, %xmm5
	testl	%esi, %esi
	movl	%eax, -1084(%ebp)       # 4-byte Spill
	vmovaps	%xmm5, -1112(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1128(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -1144(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -1160(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1176(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -1192(%ebp)      # 16-byte Spill
	vmovaps	%xmm7, -1208(%ebp)      # 16-byte Spill
	je	.LBB3_5
	jmp	.LBB3_3
.LBB3_3:                                # %if.then.i315
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-1176(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm0
	vmovaps	-1192(%ebp), %xmm2      # 16-byte Reload
	vsqrtpd	%xmm2, %xmm3
	vsubpd	%xmm3, %xmm0, %xmm0
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm0, %xmm3, %xmm4
	vmovapd	.LCPI3_20, %xmm5
	vcmpltpd	%xmm5, %xmm0, %xmm6
	vandpd	%xmm6, %xmm4, %xmm4
	vmovmskpd	%xmm4, %eax
	vmovaps	%xmm4, %xmm6
	testl	%eax, %eax
	vmovaps	%xmm0, -1224(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -1112(%ebp)      # 16-byte Spill
	vmovaps	%xmm6, -1240(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -1256(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -1208(%ebp)      # 16-byte Spill
	je	.LBB3_5
	jmp	.LBB3_4
.LBB3_4:                                # %if.then37.i373
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	.LCPI3_20, %xmm0
	vmovaps	-1240(%ebp), %xmm1      # 16-byte Reload
	vpandn	%xmm0, %xmm1, %xmm0
	vmovaps	-1224(%ebp), %xmm2      # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm3
	vpor	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm0, %xmm3
	vmovaps	-1256(%ebp), %xmm4      # 16-byte Reload
	vmovaps	%xmm3, -1272(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1112(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -1208(%ebp)      # 16-byte Spill
.LBB3_5:                                # %ray_sphere_intersect_simd.exit374
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	-1112(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1208(%ebp), %xmm1      # 16-byte Reload
	vmovaps	-1128(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-856(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm4
	vmovaps	-1160(%ebp), %xmm5      # 16-byte Reload
	vmovaps	-888(%ebp), %xmm6       # 16-byte Reload
	vmulpd	%xmm6, %xmm5, %xmm7
	vmovaps	-1144(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-840(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm7, %xmm2
	vaddpd	%xmm2, %xmm4, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm4
	vmovaps	-488(%ebp), %xmm7       # 16-byte Reload
	vsubpd	%xmm7, %xmm4, %xmm4
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm4, %xmm3, %xmm3
	vmovmskpd	%xmm3, %eax
	cmpl	$0, %eax
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm1, %xmm5
	vmovaps	%xmm0, -1288(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -1304(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -1320(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -1336(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1352(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -1368(%ebp)      # 16-byte Spill
	je	.LBB3_8
# BB#6:                                 # %if.then.i225
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-1352(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm0
	vmovaps	-1320(%ebp), %xmm2      # 16-byte Reload
	vsqrtpd	%xmm2, %xmm3
	vsubpd	%xmm3, %xmm0, %xmm0
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm0, %xmm3, %xmm3
	vmovaps	-1288(%ebp), %xmm4      # 16-byte Reload
	vcmpltpd	%xmm4, %xmm0, %xmm5
	vandpd	%xmm5, %xmm3, %xmm3
	vmovaps	%xmm3, %xmm5
	vmovmskpd	%xmm3, %eax
	cmpl	$0, %eax
	vmovaps	-1304(%ebp), %xmm3      # 16-byte Reload
	vmovaps	%xmm0, -1384(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -1368(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -1400(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -1336(%ebp)      # 16-byte Spill
	je	.LBB3_8
# BB#7:                                 # %if.then37.i283
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	-1400(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1288(%ebp), %xmm1      # 16-byte Reload
	vpandn	%xmm1, %xmm0, %xmm2
	vmovaps	-1384(%ebp), %xmm3      # 16-byte Reload
	vpand	%xmm3, %xmm0, %xmm4
	vpor	%xmm2, %xmm4, %xmm2
	vmovaps	-1304(%ebp), %xmm4      # 16-byte Reload
	vpor	%xmm4, %xmm0, %xmm5
	vmovaps	%xmm5, %xmm6
	vmovaps	%xmm6, -1416(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1368(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -1336(%ebp)      # 16-byte Spill
.LBB3_8:                                # %ray_sphere_intersect_simd.exit284
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	-1368(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1336(%ebp), %xmm1      # 16-byte Reload
	vmovaps	-1128(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-520(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm4
	vmovaps	-1160(%ebp), %xmm5      # 16-byte Reload
	vmovaps	-904(%ebp), %xmm6       # 16-byte Reload
	vmulpd	%xmm6, %xmm5, %xmm7
	vmovaps	-1144(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-584(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm7, %xmm2
	vaddpd	%xmm2, %xmm4, %xmm2
	vmulpd	%xmm2, %xmm2, %xmm4
	vmovaps	-600(%ebp), %xmm7       # 16-byte Reload
	vsubpd	%xmm7, %xmm4, %xmm4
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm4, %xmm3, %xmm3
	vmovmskpd	%xmm3, %eax
	cmpl	$0, %eax
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm1, %xmm5
	vmovaps	%xmm0, -1432(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -1448(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -1464(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -1480(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1496(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -1512(%ebp)      # 16-byte Spill
	je	.LBB3_11
# BB#9:                                 # %if.then.i189
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-1496(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm0
	vmovaps	-1464(%ebp), %xmm2      # 16-byte Reload
	vsqrtpd	%xmm2, %xmm3
	vsubpd	%xmm3, %xmm0, %xmm0
	vxorps	%xmm3, %xmm3, %xmm3
	vcmpltpd	%xmm0, %xmm3, %xmm3
	vmovaps	-1432(%ebp), %xmm4      # 16-byte Reload
	vcmpltpd	%xmm4, %xmm0, %xmm5
	vandpd	%xmm5, %xmm3, %xmm3
	vmovaps	%xmm3, %xmm5
	vmovmskpd	%xmm3, %eax
	cmpl	$0, %eax
	vmovaps	-1448(%ebp), %xmm3      # 16-byte Reload
	vmovaps	%xmm0, -1528(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -1512(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -1544(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -1480(%ebp)      # 16-byte Spill
	je	.LBB3_11
# BB#10:                                # %if.then37.i
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	-1544(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1432(%ebp), %xmm1      # 16-byte Reload
	vpandn	%xmm1, %xmm0, %xmm2
	vmovaps	-1528(%ebp), %xmm3      # 16-byte Reload
	vpand	%xmm3, %xmm0, %xmm4
	vpor	%xmm2, %xmm4, %xmm2
	vmovaps	-1448(%ebp), %xmm4      # 16-byte Reload
	vpor	%xmm4, %xmm0, %xmm5
	vmovaps	%xmm5, %xmm6
	vmovaps	%xmm6, -1560(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1512(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -1480(%ebp)      # 16-byte Spill
.LBB3_11:                               # %ray_sphere_intersect_simd.exit
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	-1512(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1480(%ebp), %xmm1      # 16-byte Reload
	vmovaps	-1128(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-648(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm4
	vmovaps	-1160(%ebp), %xmm5      # 16-byte Reload
	vmovaps	-632(%ebp), %xmm6       # 16-byte Reload
	vmulpd	%xmm6, %xmm5, %xmm7
	vmovaps	-1144(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-696(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm2
	vaddpd	%xmm2, %xmm7, %xmm2
	vaddpd	%xmm2, %xmm4, %xmm2
	vmovaps	.LCPI3_3, %xmm4
	vpand	%xmm4, %xmm2, %xmm4
	vmovapd	.LCPI3_21, %xmm7
	vcmpltpd	%xmm4, %xmm7, %xmm4
	vmovaps	-808(%ebp), %xmm7       # 16-byte Reload
	vdivpd	%xmm2, %xmm7, %xmm2
	vandpd	%xmm2, %xmm4, %xmm2
	vxorps	%xmm4, %xmm4, %xmm4
	vcmpltpd	%xmm2, %xmm4, %xmm4
	vcmpltpd	%xmm0, %xmm2, %xmm0
	vandpd	%xmm0, %xmm4, %xmm0
	vmovaps	%xmm0, %xmm2
	vmovmskpd	%xmm0, %eax
	cmpl	$0, %eax
	vmovaps	%xmm1, %xmm0
	vmovaps	%xmm1, -1576(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1592(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1608(%ebp)      # 16-byte Spill
	je	.LBB3_13
# BB#12:                                # %if.then.i
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	-1592(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1576(%ebp), %xmm1      # 16-byte Reload
	vpor	%xmm1, %xmm0, %xmm2
	vmovaps	%xmm2, %xmm3
	vmovaps	%xmm3, -1624(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1608(%ebp)      # 16-byte Spill
.LBB3_13:                               # %ray_plane_intersect_simd.exit
                                        #   in Loop: Header=BB3_2 Depth=2
	vmovaps	-1608(%ebp), %xmm0      # 16-byte Reload
	vmovaps	.LCPI3_14, %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	-968(%ebp), %xmm2       # 16-byte Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	movl	-1084(%ebp), %eax       # 4-byte Reload
	addl	$2, %eax
	cmpl	$16, %eax
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm1, -1640(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1656(%ebp)      # 16-byte Spill
	movl	%eax, -944(%ebp)        # 4-byte Spill
	vmovaps	%xmm3, -936(%ebp)       # 16-byte Spill
	jl	.LBB3_2
# BB#14:                                # %for.end99
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-940(%ebp), %eax        # 4-byte Reload
	movl	%eax, %esp
	movl	-352(%ebp), %ecx        # 4-byte Reload
	addl	$1, %ecx
	cmpl	$16, %ecx
	vmovaps	-1656(%ebp), %xmm0      # 16-byte Reload
	vmovaps	%xmm0, -232(%ebp)       # 16-byte Spill
	movl	%ecx, -348(%ebp)        # 4-byte Spill
	jne	.LBB3_1
# BB#15:                                # %for.end102
	vmovsd	.LCPI3_22, %xmm0
	movl	$256, %eax              # imm = 0x100
	vmovsd	.LCPI3_23, %xmm1
	vmovaps	-1656(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-1656(%ebp), %xmm3      # 16-byte Reload
	vunpckhpd	%xmm3, %xmm3, %xmm4 # xmm4 = xmm3[1,1]
	vaddsd	%xmm4, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	movl	-100(%ebp), %ecx        # 4-byte Reload
	vmovsd	%xmm0, (%ecx)
	vmovsd	%xmm0, 8(%ecx)
	vmovsd	%xmm0, 16(%ecx)
	movl	%eax, -1660(%ebp)       # 4-byte Spill
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp3:
	.size	ambient_occlusion, .Ltmp3-ambient_occlusion

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI4_0:
	.quad	4643193623632936960     # double 255.5
	.text
	.globl	clamp
	.align	16, 0x90
	.type	clamp,@function
clamp:                                  # @clamp
# BB#0:                                 # %entry
	subl	$8, %esp
	vmovsd	12(%esp), %xmm0
	vmovsd	.LCPI4_0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovsl	%ecx, %eax
	movl	%eax, %ecx
	movb	%cl, %dl
	movb	$-1, %dh
	subl	$255, %eax
	movl	%eax, 4(%esp)           # 4-byte Spill
	movb	%dl, 3(%esp)            # 1-byte Spill
	movb	%dh, 2(%esp)            # 1-byte Spill
	jg	.LBB4_2
# BB#1:                                 # %entry
	movb	3(%esp), %al            # 1-byte Reload
	movb	%al, 2(%esp)            # 1-byte Spill
.LBB4_2:                                # %entry
	movb	2(%esp), %al            # 1-byte Reload
	movzbl	%al, %eax
	addl	$8, %esp
	ret
.Ltmp4:
	.size	clamp, .Ltmp4-clamp

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI5_0:
	.quad	4602678819172646912     # double 0.5
.LCPI5_2:
	.quad	4352464011485697175     # double 1.0E-17
.LCPI5_4:
	.quad	4607182418800017408     # double 1
.LCPI5_5:
	.quad	-4616189618054758400    # double -1
.LCPI5_6:
	.quad	4861130398305394688     # double 1.0E+17
.LCPI5_7:
	.quad	4643193623632936960     # double 255.5
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_1:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI5_3:
	.quad	9223372036854775807     # double nan
	.quad	9223372036854775807     # double nan
	.text
	.globl	render
	.align	16, 0x90
	.type	render,@function
render:                                 # @render
# BB#0:                                 # %entry
	pushl	%ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$668, %esp              # imm = 0x29C
	movl	700(%esp), %eax
	movl	696(%esp), %ecx
	movl	692(%esp), %edx
	movl	688(%esp), %esi
	imull	$24, %edx, %edi
	imull	%ecx, %edi
	movl	%edi, (%esp)
	movl	%eax, 516(%esp)         # 4-byte Spill
	movl	%ecx, 512(%esp)         # 4-byte Spill
	movl	%edx, 508(%esp)         # 4-byte Spill
	movl	%esi, 504(%esp)         # 4-byte Spill
	movl	%edi, 500(%esp)         # 4-byte Spill
	calll	malloc
	movl	$0, %ecx
	movl	%eax, %edx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	500(%esp), %eax         # 4-byte Reload
	movl	%eax, 8(%esp)
	movl	%edx, 496(%esp)         # 4-byte Spill
	movl	%ecx, 492(%esp)         # 4-byte Spill
	calll	memset
	movl	512(%esp), %eax         # 4-byte Reload
	cmpl	$0, %eax
	jle	.LBB5_20
# BB#1:                                 # %for.cond6.preheader.lr.ph
	movl	$0, %eax
                                        # implicit-def: XMM0
	movl	516(%esp), %ecx         # 4-byte Reload
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
                                        # implicit-def: XMM1
	movl	508(%esp), %edx         # 4-byte Reload
	vcvtsi2sdl	%edx, %xmm1, %xmm1
	vmovsd	.LCPI5_0, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
                                        # implicit-def: XMM3
	movl	512(%esp), %esi         # 4-byte Reload
	vcvtsi2sdl	%esi, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	leal	616(%esp), %edi
	leal	624(%esp), %ebx
	leal	632(%esp), %ebp
	leal	640(%esp), %ecx
	leal	552(%esp), %edx
	leal	608(%esp), %esi
	movl	%eax, 488(%esp)         # 4-byte Spill
	leal	528(%esp), %eax
	movl	%eax, 484(%esp)         # 4-byte Spill
	leal	536(%esp), %eax
	movl	%eax, 480(%esp)         # 4-byte Spill
	leal	544(%esp), %eax
	movl	%eax, 476(%esp)         # 4-byte Spill
	leal	560(%esp), %eax
	movl	%eax, 472(%esp)         # 4-byte Spill
	leal	584(%esp), %eax
	movl	%eax, 468(%esp)         # 4-byte Spill
	movl	516(%esp), %eax         # 4-byte Reload
	imull	%eax, %eax
                                        # implicit-def: XMM3
	vcvtsi2sdl	%eax, %xmm3, %xmm3
	movl	516(%esp), %eax         # 4-byte Reload
	testl	%eax, %eax
	setg	%al
	movb	%al, 467(%esp)          # 1-byte Spill
	movl	508(%esp), %eax         # 4-byte Reload
	testl	%eax, %eax
	setg	%al
	movb	%al, 466(%esp)          # 1-byte Spill
	leal	576(%esp), %eax
	movl	%eax, 460(%esp)         # 4-byte Spill
	leal	568(%esp), %eax
	movl	%eax, 456(%esp)         # 4-byte Spill
	movl	%edx, %eax
	movl	%eax, 452(%esp)         # 4-byte Spill
	leal	656(%esp), %eax
	movl	%eax, 448(%esp)         # 4-byte Spill
	leal	648(%esp), %eax
	movl	%eax, 444(%esp)         # 4-byte Spill
	movl	%ecx, %eax
	movl	%eax, 440(%esp)         # 4-byte Spill
	movl	%edi, %eax
	movl	%eax, 436(%esp)         # 4-byte Spill
	movl	488(%esp), %eax         # 4-byte Reload
	movl	%ebp, 432(%esp)         # 4-byte Spill
	movl	%ecx, 428(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 416(%esp)        # 8-byte Spill
	movl	%edx, 412(%esp)         # 4-byte Spill
	movl	%esi, 408(%esp)         # 4-byte Spill
	vmovsd	%xmm1, 400(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 392(%esp)        # 8-byte Spill
	movl	%edi, 388(%esp)         # 4-byte Spill
	movl	%ebx, 384(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 376(%esp)        # 8-byte Spill
	movl	%eax, 372(%esp)         # 4-byte Spill
.LBB5_2:                                # %for.cond6.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_4 Depth 2
                                        #       Child Loop BB5_17 Depth 3
                                        #         Child Loop BB5_8 Depth 4
	movl	372(%esp), %eax         # 4-byte Reload
	movb	466(%esp), %cl          # 1-byte Reload
	testb	$1, %cl
	movl	%eax, 368(%esp)         # 4-byte Spill
	jne	.LBB5_3
	jmp	.LBB5_19
.LBB5_3:                                # %for.cond9.preheader.lr.ph
                                        #   in Loop: Header=BB5_2 Depth=1
	movl	$0, %eax
                                        # implicit-def: XMM0
	movl	368(%esp), %ecx         # 4-byte Reload
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	movl	508(%esp), %edx         # 4-byte Reload
	imull	%edx, %ecx
	movl	%ecx, 364(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 352(%esp)        # 8-byte Spill
	movl	%eax, 348(%esp)         # 4-byte Spill
.LBB5_4:                                # %for.cond9.preheader
                                        #   Parent Loop BB5_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_17 Depth 3
                                        #         Child Loop BB5_8 Depth 4
	movl	348(%esp), %eax         # 4-byte Reload
	movb	467(%esp), %cl          # 1-byte Reload
	testb	$1, %cl
	movl	%eax, 344(%esp)         # 4-byte Spill
	jne	.LBB5_6
# BB#5:                                 # %for.cond9.preheader.for.end67_crit_edge
                                        #   in Loop: Header=BB5_4 Depth=2
	movl	344(%esp), %eax         # 4-byte Reload
	movl	364(%esp), %ecx         # 4-byte Reload
	addl	%ecx, %eax
	imull	$3, %eax, %eax
	movl	%eax, %edx
	shll	$3, %edx
	movl	496(%esp), %esi         # 4-byte Reload
	addl	%edx, %esi
	movl	%eax, %edx
	addl	$1, %edx
	movl	%edx, %edi
	shll	$3, %edi
	movl	496(%esp), %ebx         # 4-byte Reload
	addl	%edi, %ebx
	movl	%eax, %edi
	addl	$2, %edi
	movl	%edi, %ebp
	shll	$3, %ebp
	movl	496(%esp), %ecx         # 4-byte Reload
	addl	%ebp, %ecx
	movl	%ecx, 340(%esp)         # 4-byte Spill
	movl	%esi, 336(%esp)         # 4-byte Spill
	movl	%edx, 332(%esp)         # 4-byte Spill
	movl	%ebx, 328(%esp)         # 4-byte Spill
	movl	%edi, 324(%esp)         # 4-byte Spill
	movl	%eax, 320(%esp)         # 4-byte Spill
	jmp	.LBB5_18
.LBB5_6:                                # %for.cond12.preheader.lr.ph.split.us
                                        #   in Loop: Header=BB5_4 Depth=2
	movl	$0, %eax
                                        # implicit-def: XMM0
	movl	344(%esp), %ecx         # 4-byte Reload
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	movl	364(%esp), %edx         # 4-byte Reload
	addl	%edx, %ecx
	imull	$3, %ecx, %ecx
	movl	%ecx, %esi
	shll	$3, %esi
	movl	496(%esp), %edi         # 4-byte Reload
	addl	%esi, %edi
	movl	%ecx, %esi
	addl	$1, %esi
	movl	%esi, %ebx
	shll	$3, %ebx
	movl	496(%esp), %ebp         # 4-byte Reload
	addl	%ebx, %ebp
	movl	%ecx, %ebx
	addl	$2, %ebx
	movl	%ebx, %edx
	shll	$3, %edx
	movl	%eax, 316(%esp)         # 4-byte Spill
	movl	496(%esp), %eax         # 4-byte Reload
	addl	%edx, %eax
	movl	316(%esp), %edx         # 4-byte Reload
	movl	%eax, 312(%esp)         # 4-byte Spill
	movl	%ebx, 308(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 296(%esp)        # 8-byte Spill
	movl	%ecx, 292(%esp)         # 4-byte Spill
	movl	%edi, 288(%esp)         # 4-byte Spill
	movl	%esi, 284(%esp)         # 4-byte Spill
	movl	%ebp, 280(%esp)         # 4-byte Spill
	movl	%edx, 276(%esp)         # 4-byte Spill
	jmp	.LBB5_17
.LBB5_7:                                # %for.inc65.us
                                        #   in Loop: Header=BB5_17 Depth=3
	movl	272(%esp), %eax         # 4-byte Reload
	addl	$1, %eax
	movl	516(%esp), %ecx         # 4-byte Reload
	cmpl	%ecx, %eax
	movl	312(%esp), %edx         # 4-byte Reload
	movl	308(%esp), %esi         # 4-byte Reload
	movl	280(%esp), %edi         # 4-byte Reload
	movl	284(%esp), %ebx         # 4-byte Reload
	movl	288(%esp), %ebp         # 4-byte Reload
	movl	292(%esp), %ecx         # 4-byte Reload
	movl	%ecx, 320(%esp)         # 4-byte Spill
	movl	%eax, 276(%esp)         # 4-byte Spill
	movl	%edx, 340(%esp)         # 4-byte Spill
	movl	%esi, 324(%esp)         # 4-byte Spill
	movl	%edi, 328(%esp)         # 4-byte Spill
	movl	%ebx, 332(%esp)         # 4-byte Spill
	movl	%ebp, 336(%esp)         # 4-byte Spill
	je	.LBB5_18
	jmp	.LBB5_17
.LBB5_8:                                # %for.body14.us
                                        #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        #       Parent Loop BB5_17 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	268(%esp), %eax         # 4-byte Reload
	vmovsd	.LCPI5_2, %xmm0
	movl	$1, %ecx
	vmovsd	.LCPI5_4, %xmm1
	movl	$4294967295, %edx       # imm = 0xFFFFFFFF
	vmovsd	.LCPI5_5, %xmm2
	leal	616(%esp), %esi
                                        # implicit-def: XMM3
	vcvtsi2sdl	%eax, %xmm3, %xmm3
	vmovsd	416(%esp), %xmm4        # 8-byte Reload
	vdivsd	%xmm4, %xmm3, %xmm3
	vmovsd	296(%esp), %xmm5        # 8-byte Reload
	vaddsd	%xmm3, %xmm5, %xmm3
	vmovsd	400(%esp), %xmm6        # 8-byte Reload
	vsubsd	%xmm6, %xmm3, %xmm3
	vdivsd	%xmm6, %xmm3, %xmm3
	vxorps	%xmm7, %xmm7, %xmm7
	vmovups	%xmm7, (%esi)
	movl	$0, 20(%esi)
	movl	$0, 16(%esi)
	movl	440(%esp), %esi         # 4-byte Reload
	vmovsd	%xmm3, (%esi)
	movl	444(%esp), %edi         # 4-byte Reload
	vmovsd	256(%esp), %xmm7        # 8-byte Reload
	vmovsd	%xmm7, (%edi)
	movl	448(%esp), %ebx         # 4-byte Reload
	vmovsd	%xmm2, (%ebx)
	vmulsd	%xmm3, %xmm3, %xmm2
	vmulsd	%xmm7, %xmm7, %xmm4
	vaddsd	%xmm4, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	movl	%esp, %ebp
	vmovsd	%xmm1, (%ebp)
	movl	%eax, 252(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 240(%esp)        # 8-byte Spill
	movl	%ecx, 236(%esp)         # 4-byte Spill
	movl	%edx, 232(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 224(%esp)        # 8-byte Spill
	calll	sqrt
	fstpl	520(%esp)
	vmovsd	520(%esp), %xmm0
	vmovsd	.LCPI5_3, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	vmovsd	240(%esp), %xmm2        # 8-byte Reload
	vucomisd	%xmm2, %xmm1
	vmovsd	%xmm0, 216(%esp)        # 8-byte Spill
	jbe	.LBB5_10
# BB#9:                                 # %if.then.i.us
                                        #   in Loop: Header=BB5_8 Depth=4
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	vmovsd	.LCPI5_5, %xmm0
	vmovsd	224(%esp), %xmm1        # 8-byte Reload
	vmovsd	216(%esp), %xmm2        # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	movl	440(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm3, (%ecx)
	vmovsd	256(%esp), %xmm3        # 8-byte Reload
	vdivsd	%xmm2, %xmm3, %xmm4
	movl	444(%esp), %edx         # 4-byte Reload
	vmovsd	%xmm4, (%edx)
	vdivsd	%xmm2, %xmm0, %xmm0
	movl	448(%esp), %esi         # 4-byte Reload
	vmovsd	%xmm0, (%esi)
	movl	%eax, 212(%esp)         # 4-byte Spill
.LBB5_10:                               # %vnormalize.exit.us
                                        #   in Loop: Header=BB5_8 Depth=4
	leal	552(%esp), %eax
	leal	616(%esp), %ecx
	leal	spheres, %edx
	vmovsd	.LCPI5_6, %xmm0
	movl	412(%esp), %esi         # 4-byte Reload
	vmovsd	%xmm0, (%esi)
	movl	408(%esp), %edi         # 4-byte Reload
	movl	$0, (%edi)
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	ray_sphere_intersect
	leal	552(%esp), %eax
	leal	616(%esp), %ecx
	leal	spheres, %edx
	addl	$32, %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	ray_sphere_intersect
	leal	552(%esp), %eax
	leal	616(%esp), %ecx
	leal	spheres, %edx
	addl	$64, %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	ray_sphere_intersect
	vmovsd	.LCPI5_2, %xmm0
	vmovsd	plane+24, %xmm1
	vmovsd	plane+32, %xmm2
	vmovsd	plane+40, %xmm3
	movl	428(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm4
	movl	444(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm5
	movl	448(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm6
	vmulsd	%xmm4, %xmm1, %xmm7
	vmovsd	%xmm0, 200(%esp)        # 8-byte Spill
	vmulsd	%xmm5, %xmm2, %xmm0
	vaddsd	%xmm0, %xmm7, %xmm0
	vmulsd	%xmm6, %xmm3, %xmm7
	vaddsd	%xmm7, %xmm0, %xmm0
	vmovsd	.LCPI5_3, %xmm7
	vandpd	%xmm7, %xmm0, %xmm7
	vmovsd	%xmm0, 192(%esp)        # 8-byte Spill
	vmovsd	200(%esp), %xmm0        # 8-byte Reload
	vucomisd	%xmm7, %xmm0
	vmovsd	%xmm6, 184(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 176(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 168(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 160(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 152(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 144(%esp)        # 8-byte Spill
	ja	.LBB5_14
# BB#11:                                # %if.end.i.us
                                        #   in Loop: Header=BB5_8 Depth=4
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	plane+8, %xmm1
	vmovsd	plane, %xmm2
	vmovsd	168(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm1, %xmm3, %xmm1
	vmovsd	176(%esp), %xmm4        # 8-byte Reload
	vmulsd	%xmm2, %xmm4, %xmm2
	vmovsd	plane+16, %xmm5
	vmovsd	160(%esp), %xmm6        # 8-byte Reload
	vmulsd	%xmm5, %xmm6, %xmm5
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm5, %xmm1, %xmm1
	movl	388(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm2
	movl	384(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm5
	movl	432(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm7
	vmulsd	%xmm2, %xmm4, %xmm3
	vmovsd	168(%esp), %xmm4        # 8-byte Reload
	vmulsd	%xmm5, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vmulsd	%xmm7, %xmm6, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vsubsd	%xmm1, %xmm3, %xmm1
	vmovsd	.LCPI5_1, %xmm3
	vxorpd	%xmm3, %xmm1, %xmm1
	vmovsd	192(%esp), %xmm3        # 8-byte Reload
	vdivsd	%xmm3, %xmm1, %xmm1
	vucomisd	%xmm0, %xmm1
	vmovsd	%xmm1, 136(%esp)        # 8-byte Spill
	vmovsd	%xmm7, 128(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 120(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 112(%esp)        # 8-byte Spill
	jbe	.LBB5_14
# BB#12:                                # %land.lhs.true.i.us
                                        #   in Loop: Header=BB5_8 Depth=4
	movl	412(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	136(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm1, %xmm0
	jbe	.LBB5_14
# BB#13:                                # %if.then10.i.us
                                        #   in Loop: Header=BB5_8 Depth=4
	leal	plane, %eax
	addl	$24, %eax
	movl	$24, %ecx
	movl	412(%esp), %edx         # 4-byte Reload
	vmovsd	136(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%edx)
	movl	408(%esp), %esi         # 4-byte Reload
	movl	$1, (%esi)
	vmovsd	152(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmovsd	112(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm2, %xmm3, %xmm2
	movl	472(%esp), %edi         # 4-byte Reload
	vmovsd	%xmm2, (%edi)
	vmovsd	144(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm0, %xmm4
	vmovsd	120(%esp), %xmm5        # 8-byte Reload
	vaddsd	%xmm4, %xmm5, %xmm4
	movl	456(%esp), %ebx         # 4-byte Reload
	vmovsd	%xmm4, (%ebx)
	vmovsd	184(%esp), %xmm4        # 8-byte Reload
	vmulsd	%xmm4, %xmm0, %xmm6
	vmovsd	128(%esp), %xmm7        # 8-byte Reload
	vaddsd	%xmm6, %xmm7, %xmm6
	movl	460(%esp), %ebp         # 4-byte Reload
	vmovsd	%xmm6, (%ebp)
	movl	468(%esp), %edx         # 4-byte Reload
	movl	%edx, (%esp)
	movl	%eax, 4(%esp)
	movl	$24, 8(%esp)
	movl	%ecx, 108(%esp)         # 4-byte Spill
	calll	memcpy
.LBB5_14:                               # %ray_plane_intersect.exit.us
                                        #   in Loop: Header=BB5_8 Depth=4
	movl	408(%esp), %eax         # 4-byte Reload
	cmpl	$0, (%eax)
	je	.LBB5_16
# BB#15:                                # %if.then.us
                                        #   in Loop: Header=BB5_8 Depth=4
	leal	528(%esp), %eax
	leal	552(%esp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	ambient_occlusion
	movl	484(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	movl	288(%esp), %ecx         # 4-byte Reload
	vaddsd	(%ecx), %xmm0, %xmm0
	vmovsd	%xmm0, (%ecx)
	movl	480(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm0
	movl	280(%esp), %esi         # 4-byte Reload
	vaddsd	(%esi), %xmm0, %xmm0
	vmovsd	%xmm0, (%esi)
	movl	476(%esp), %edi         # 4-byte Reload
	vmovsd	(%edi), %xmm0
	movl	312(%esp), %ebx         # 4-byte Reload
	vaddsd	(%ebx), %xmm0, %xmm0
	vmovsd	%xmm0, (%ebx)
.LBB5_16:                               # %if.end.us
                                        #   in Loop: Header=BB5_8 Depth=4
	movl	252(%esp), %eax         # 4-byte Reload
	addl	$1, %eax
	movl	516(%esp), %ecx         # 4-byte Reload
	cmpl	%ecx, %eax
	movl	%eax, 268(%esp)         # 4-byte Spill
	je	.LBB5_7
	jmp	.LBB5_8
.LBB5_17:                               # %for.body14.lr.ph.us
                                        #   Parent Loop BB5_2 Depth=1
                                        #     Parent Loop BB5_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_8 Depth 4
	movl	276(%esp), %eax         # 4-byte Reload
	movl	$0, %ecx
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovsd	416(%esp), %xmm1        # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	352(%esp), %xmm2        # 8-byte Reload
	vaddsd	%xmm0, %xmm2, %xmm0
	vmovsd	392(%esp), %xmm3        # 8-byte Reload
	vsubsd	%xmm3, %xmm0, %xmm0
	vmovsd	.LCPI5_1, %xmm4
	vxorpd	%xmm4, %xmm0, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm0
	movl	%eax, 272(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 256(%esp)        # 8-byte Spill
	movl	%ecx, 268(%esp)         # 4-byte Spill
	jmp	.LBB5_8
.LBB5_18:                               # %for.end67
                                        #   in Loop: Header=BB5_4 Depth=2
	movl	340(%esp), %eax         # 4-byte Reload
	movl	324(%esp), %ecx         # 4-byte Reload
	movl	328(%esp), %edx         # 4-byte Reload
	movl	332(%esp), %esi         # 4-byte Reload
	movl	336(%esp), %edi         # 4-byte Reload
	movl	320(%esp), %ebx         # 4-byte Reload
	vmovsd	(%edi), %xmm0
	vmovsd	376(%esp), %xmm1        # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%edi)
	vmovsd	(%edx), %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vmovsd	%xmm2, (%edx)
	vmovsd	(%eax), %xmm3
	vdivsd	%xmm1, %xmm3, %xmm3
	vmovsd	%xmm3, (%eax)
	vmovsd	.LCPI5_7, %xmm4
	vmulsd	%xmm4, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %eax
	xorl	%edx, %edx
	testl	%eax, %eax
	cmovsl	%edx, %eax
	movl	%eax, 104(%esp)         # 4-byte Spill
                                        # kill: AL<def> AL<kill> EAX<kill>
	movb	$-1, %ah
	movl	104(%esp), %edi         # 4-byte Reload
	subl	$255, %edi
	movb	%al, 103(%esp)          # 1-byte Spill
	movb	%ah, %al
	vmovsd	%xmm3, 88(%esp)         # 8-byte Spill
	movl	%ecx, 84(%esp)          # 4-byte Spill
	vmovsd	%xmm2, 72(%esp)         # 8-byte Spill
	movl	%esi, 68(%esp)          # 4-byte Spill
	vmovsd	%xmm4, 56(%esp)         # 8-byte Spill
	movl	%ebx, 52(%esp)          # 4-byte Spill
	movl	%edx, 48(%esp)          # 4-byte Spill
	movb	%al, 47(%esp)           # 1-byte Spill
	movb	%ah, 46(%esp)           # 1-byte Spill
	movl	%edi, 40(%esp)          # 4-byte Spill
	jg	.LBB5_22
# BB#21:                                # %for.end67
                                        #   in Loop: Header=BB5_4 Depth=2
	movb	103(%esp), %al          # 1-byte Reload
	movb	%al, 47(%esp)           # 1-byte Spill
.LBB5_22:                               # %for.end67
                                        #   in Loop: Header=BB5_4 Depth=2
	movb	47(%esp), %al           # 1-byte Reload
	movl	504(%esp), %ecx         # 4-byte Reload
	movl	52(%esp), %edx          # 4-byte Reload
	movb	%al, (%ecx,%edx)
	vmovsd	72(%esp), %xmm0         # 8-byte Reload
	vmovsd	56(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vcvttsd2si	%xmm2, %esi
	testl	%esi, %esi
	movl	48(%esp), %edi          # 4-byte Reload
	cmovsl	%edi, %esi
	movl	%esi, %ebx
	movb	%bl, %al
	subl	$255, %esi
	movb	46(%esp), %ah           # 1-byte Reload
	movb	%al, 39(%esp)           # 1-byte Spill
	movl	%esi, 32(%esp)          # 4-byte Spill
	movb	%ah, 31(%esp)           # 1-byte Spill
	jg	.LBB5_24
# BB#23:                                # %for.end67
                                        #   in Loop: Header=BB5_4 Depth=2
	movb	39(%esp), %al           # 1-byte Reload
	movb	%al, 31(%esp)           # 1-byte Spill
.LBB5_24:                               # %for.end67
                                        #   in Loop: Header=BB5_4 Depth=2
	movb	31(%esp), %al           # 1-byte Reload
	movl	504(%esp), %ecx         # 4-byte Reload
	movl	68(%esp), %edx          # 4-byte Reload
	movb	%al, (%ecx,%edx)
	vmovsd	88(%esp), %xmm0         # 8-byte Reload
	vmovsd	56(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vcvttsd2si	%xmm2, %esi
	testl	%esi, %esi
	movl	48(%esp), %edi          # 4-byte Reload
	cmovsl	%edi, %esi
	movl	%esi, %ebx
	movb	%bl, %al
	subl	$255, %esi
	movb	46(%esp), %ah           # 1-byte Reload
	movb	%al, 30(%esp)           # 1-byte Spill
	movl	%esi, 24(%esp)          # 4-byte Spill
	movb	%ah, 23(%esp)           # 1-byte Spill
	jg	.LBB5_26
# BB#25:                                # %for.end67
                                        #   in Loop: Header=BB5_4 Depth=2
	movb	30(%esp), %al           # 1-byte Reload
	movb	%al, 23(%esp)           # 1-byte Spill
.LBB5_26:                               # %for.end67
                                        #   in Loop: Header=BB5_4 Depth=2
	movb	23(%esp), %al           # 1-byte Reload
	movl	504(%esp), %ecx         # 4-byte Reload
	movl	84(%esp), %edx          # 4-byte Reload
	movb	%al, (%ecx,%edx)
	movl	344(%esp), %esi         # 4-byte Reload
	addl	$1, %esi
	movl	508(%esp), %edi         # 4-byte Reload
	cmpl	%edi, %esi
	movl	%esi, 348(%esp)         # 4-byte Spill
	jne	.LBB5_4
.LBB5_19:                               # %for.inc128
                                        #   in Loop: Header=BB5_2 Depth=1
	movl	368(%esp), %eax         # 4-byte Reload
	addl	$1, %eax
	movl	512(%esp), %ecx         # 4-byte Reload
	cmpl	%ecx, %eax
	movl	%eax, 372(%esp)         # 4-byte Spill
	jne	.LBB5_2
.LBB5_20:                               # %for.end130
	addl	$668, %esp              # imm = 0x29C
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp5:
	.size	render, .Ltmp5-render

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI6_0:
	.quad	4607182418800017408     # double 1
.LCPI6_1:
	.quad	-4620693217682128896    # double -0.5
.LCPI6_2:
	.quad	4602678819172646912     # double 0.5
.LCPI6_3:
	.quad	-4611235658464650854    # double -2.2
.LCPI6_4:
	.quad	-4609434218613702656    # double -3
.LCPI6_5:
	.quad	-4608308318706860032    # double -3.5
.LCPI6_6:
	.quad	-4611686018427387904    # double -2
	.text
	.globl	init_scene
	.align	16, 0x90
	.type	init_scene,@function
init_scene:                             # @init_scene
# BB#0:                                 # %entry
	subl	$12, %esp
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$1, %eax
	vmovsd	.LCPI6_0, %xmm1
	vmovsd	.LCPI6_1, %xmm2
	vmovsd	.LCPI6_2, %xmm3
	vmovsd	.LCPI6_3, %xmm4
	movl	$4294967293, %ecx       # imm = 0xFFFFFFFD
	vmovsd	.LCPI6_4, %xmm5
	vmovsd	.LCPI6_5, %xmm6
	movl	$4294967294, %edx       # imm = 0xFFFFFFFE
	vmovsd	.LCPI6_6, %xmm7
	vmovsd	%xmm7, spheres
	vmovsd	%xmm0, spheres+8
	vmovsd	%xmm6, spheres+16
	vmovsd	%xmm3, spheres+24
	vmovsd	%xmm2, spheres+32
	vmovsd	%xmm0, spheres+40
	vmovsd	%xmm5, spheres+48
	vmovsd	%xmm3, spheres+56
	vmovsd	%xmm1, spheres+64
	vmovsd	%xmm0, spheres+72
	vmovsd	%xmm4, spheres+80
	vmovsd	%xmm3, spheres+88
	vmovsd	%xmm0, plane
	vmovsd	%xmm2, plane+8
	vxorps	%xmm2, %xmm2, %xmm2
	vmovups	%xmm2, plane+16
	vmovsd	%xmm1, plane+32
	vmovsd	%xmm0, plane+40
	movl	%edx, 8(%esp)           # 4-byte Spill
	movl	%eax, 4(%esp)           # 4-byte Spill
	movl	%ecx, (%esp)            # 4-byte Spill
	addl	$12, %esp
	ret
.Ltmp6:
	.size	init_scene, .Ltmp6-init_scene

	.globl	saveppm
	.align	16, 0x90
	.type	saveppm,@function
saveppm:                                # @saveppm
# BB#0:                                 # %entry
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$64, %esp
	movl	92(%esp), %eax
	movl	88(%esp), %ecx
	movl	84(%esp), %edx
	movl	80(%esp), %esi
	movl	%esp, %edi
	movl	%esi, (%edi)
	movl	$.L.str2, 4(%edi)
	movl	%eax, 60(%esp)          # 4-byte Spill
	movl	%ecx, 56(%esp)          # 4-byte Spill
	movl	%edx, 52(%esp)          # 4-byte Spill
	calll	fopen
	cmpl	$0, %eax
	movl	%eax, 48(%esp)          # 4-byte Spill
	jne	.LBB7_2
# BB#1:                                 # %cond.false
	movl	%esp, %eax
	movl	$.L__PRETTY_FUNCTION__.saveppm, 12(%eax)
	movl	$460, 8(%eax)           # imm = 0x1CC
	movl	$.L.str1, 4(%eax)
	movl	$.L.str3, (%eax)
	calll	__assert_fail
.LBB7_2:                                # %cond.end
	movl	%esp, %eax
	movl	48(%esp), %ecx          # 4-byte Reload
	movl	%ecx, 12(%eax)
	movl	$1, 8(%eax)
	movl	$3, 4(%eax)
	movl	$.L.str4, (%eax)
	calll	fwrite
	movl	%esp, %ecx
	movl	56(%esp), %edx          # 4-byte Reload
	movl	%edx, 12(%ecx)
	movl	52(%esp), %esi          # 4-byte Reload
	movl	%esi, 8(%ecx)
	movl	48(%esp), %edi          # 4-byte Reload
	movl	%edi, (%ecx)
	movl	$.L.str5, 4(%ecx)
	movl	%eax, 44(%esp)          # 4-byte Spill
	calll	fprintf
	movl	%esp, %ecx
	movl	48(%esp), %edx          # 4-byte Reload
	movl	%edx, 12(%ecx)
	movl	$1, 8(%ecx)
	movl	$4, 4(%ecx)
	movl	$.L.str6, (%ecx)
	movl	%eax, 40(%esp)          # 4-byte Spill
	calll	fwrite
	movl	52(%esp), %ecx          # 4-byte Reload
	imull	$3, %ecx, %edx
	movl	56(%esp), %esi          # 4-byte Reload
	imull	%esi, %edx
	movl	%esp, %edi
	movl	48(%esp), %ebx          # 4-byte Reload
	movl	%ebx, 12(%edi)
	movl	%edx, 4(%edi)
	movl	60(%esp), %edx          # 4-byte Reload
	movl	%edx, (%edi)
	movl	$1, 8(%edi)
	movl	%eax, 36(%esp)          # 4-byte Spill
	calll	fwrite
	movl	%esp, %ecx
	movl	48(%esp), %edx          # 4-byte Reload
	movl	%edx, (%ecx)
	movl	%eax, 32(%esp)          # 4-byte Spill
	calll	fclose
	movl	%eax, 28(%esp)          # 4-byte Spill
	addl	$64, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	ret
.Ltmp7:
	.size	saveppm, .Ltmp7-saveppm

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI8_0:
	.quad	4696837146684686336     # double 1.0E+6
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
# BB#0:                                 # %entry
	subl	$44, %esp
	movl	$1000000, %eax          # imm = 0xF4240
	vmovsd	.LCPI8_0, %xmm0
	movl	%esp, %ecx
	movl	$786432, (%ecx)         # imm = 0xC0000
	movl	%eax, 40(%esp)          # 4-byte Spill
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	calll	malloc
	vxorps	%xmm0, %xmm0, %xmm0
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
	vmovups	%xmm0, plane+16
	movl	$1072693248, plane+36   # imm = 0x3FF00000
	movl	$0, plane+32
	movl	$0, plane+44
	movl	$0, plane+40
	movl	%eax, 28(%esp)          # 4-byte Spill
	calll	clock
	movl	%esp, %ecx
	movl	28(%esp), %edx          # 4-byte Reload
	movl	%edx, (%ecx)
	movl	$4, 12(%ecx)
	movl	$512, 8(%ecx)           # imm = 0x200
	movl	$512, 4(%ecx)           # imm = 0x200
	movl	%eax, 24(%esp)          # 4-byte Spill
	calll	render
	calll	clock
	movl	24(%esp), %ecx          # 4-byte Reload
	subl	%ecx, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movl	28(%esp), %eax          # 4-byte Reload
	vmovsd	32(%esp), %xmm1         # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm0
	movl	%esp, %edx
	vmovsd	%xmm0, 4(%edx)
	movl	$.L.str7, (%edx)
	movl	%eax, 20(%esp)          # 4-byte Spill
	calll	printf
	movl	%esp, %ecx
	movl	20(%esp), %edx          # 4-byte Reload
	movl	%edx, 12(%ecx)
	movl	$512, 8(%ecx)           # imm = 0x200
	movl	$512, 4(%ecx)           # imm = 0x200
	movl	$.L.str8, (%ecx)
	movl	%eax, 16(%esp)          # 4-byte Spill
	calll	saveppm
	movl	$0, %eax
	addl	$44, %esp
	ret
.Ltmp8:
	.size	main, .Ltmp8-main

	.type	.L.str1,@object         # @.str1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str1:
	.asciz	 "ao_simd_soa.c"
	.size	.L.str1, 14

	.type	spheres,@object         # @spheres
	.comm	spheres,96,4
	.type	plane,@object           # @plane
	.comm	plane,48,4
	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "wb"
	.size	.L.str2, 3

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "fp"
	.size	.L.str3, 3

	.type	.L__PRETTY_FUNCTION__.saveppm,@object # @__PRETTY_FUNCTION__.saveppm
.L__PRETTY_FUNCTION__.saveppm:
	.asciz	 "void saveppm(const char *, int, int, unsigned char *)"
	.size	.L__PRETTY_FUNCTION__.saveppm, 54

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "P6\n"
	.size	.L.str4, 4

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "%d %d\n"
	.size	.L.str5, 7

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "255\n"
	.size	.L.str6, 5

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "%.2f sec\n"
	.size	.L.str7, 10

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	 "ao.ppm"
	.size	.L.str8, 7


	.section	".note.GNU-stack","",@progbits
