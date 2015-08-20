	.file	"llvmprof.out"
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
	pushl	%esi
	subl	$712, %esp              # imm = 0x2C8
	movl	728(%esp), %eax
	movl	724(%esp), %ecx
	movl	720(%esp), %edx
	vmovsd	(%ecx), %xmm0
	vmovsd	(%eax), %xmm1
	vsubsd	%xmm1, %xmm0, %xmm2
	vsubsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	movl	%eax, 692(%esp)         # 4-byte Spill
	movl	%ecx, 688(%esp)         # 4-byte Spill
	movl	%edx, 684(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 672(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 664(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#1:                                 # %entry.split
	movl	688(%esp), %eax         # 4-byte Reload
	addl	$8, %eax
	movl	688(%esp), %ecx         # 4-byte Reload
	vmovsd	8(%ecx), %xmm0
	movl	692(%esp), %edx         # 4-byte Reload
	addl	$8, %edx
	movl	692(%esp), %esi         # 4-byte Reload
	vmovsd	8(%esi), %xmm1
	vsubsd	%xmm1, %xmm0, %xmm2
	vsubsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	movl	%eax, 660(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 648(%esp)        # 8-byte Spill
	movl	%edx, 644(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 632(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#2:                                 # %entry.split.split
	movl	688(%esp), %eax         # 4-byte Reload
	addl	$16, %eax
	movl	688(%esp), %ecx         # 4-byte Reload
	vmovsd	16(%ecx), %xmm0
	movl	692(%esp), %edx         # 4-byte Reload
	addl	$16, %edx
	movl	692(%esp), %esi         # 4-byte Reload
	vmovsd	16(%esi), %xmm1
	vsubsd	%xmm1, %xmm0, %xmm2
	vsubsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	movl	%eax, 628(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 616(%esp)        # 8-byte Spill
	movl	%edx, 612(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 600(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#3:                                 # %entry.split.split.split56
	movl	688(%esp), %eax         # 4-byte Reload
	addl	$24, %eax
	movl	688(%esp), %ecx         # 4-byte Reload
	vmovsd	24(%ecx), %xmm0
	addl	$32, %ecx
	movl	688(%esp), %edx         # 4-byte Reload
	vmovsd	32(%edx), %xmm1
	addl	$40, %edx
	movl	688(%esp), %esi         # 4-byte Reload
	vmovsd	40(%esi), %xmm2
	vmovsd	672(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm0, %xmm3, %xmm4
	vmovsd	664(%esp), %xmm5        # 8-byte Reload
	vmulsd	%xmm0, %xmm5, %xmm0
	vucomisd	%xmm4, %xmm0
	movl	%eax, 596(%esp)         # 4-byte Spill
	movl	%ecx, 592(%esp)         # 4-byte Spill
	movl	%edx, 588(%esp)         # 4-byte Spill
	vmovsd	%xmm1, 576(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 568(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 560(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 552(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#4:                                 # %entry.split.split.split
	vmovsd	648(%esp), %xmm0        # 8-byte Reload
	vmovsd	576(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmovsd	632(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm1, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, 544(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 536(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#5:                                 # %entry.split.split.split.split
	vmovsd	560(%esp), %xmm0        # 8-byte Reload
	vmovsd	544(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	552(%esp), %xmm3        # 8-byte Reload
	vmovsd	536(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 528(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 520(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#6:                                 # %entry.split.split.split.split.split
	vmovsd	616(%esp), %xmm0        # 8-byte Reload
	vmovsd	568(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmovsd	600(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm1, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, 512(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 504(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#7:                                 # %entry.split.split.split.split.split.split55
	vmovsd	528(%esp), %xmm0        # 8-byte Reload
	vmovsd	512(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	520(%esp), %xmm3        # 8-byte Reload
	vmovsd	504(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 496(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 488(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#8:                                 # %entry.split.split.split.split.split.split
	vmovsd	672(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	664(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 480(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 472(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#9:                                 # %entry.split.split.split.split.split.split.split54
	vmovsd	648(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	632(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 464(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 456(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#10:                                # %entry.split.split.split.split.split.split.split
	vmovsd	480(%esp), %xmm0        # 8-byte Reload
	vmovsd	464(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	472(%esp), %xmm3        # 8-byte Reload
	vmovsd	456(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 448(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 440(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#11:                                # %entry.split.split.split.split.split.split.split.split
	vmovsd	616(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	600(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 432(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 424(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#12:                                # %entry.split.split.split.split.split.split.split.split.split
	vmovsd	448(%esp), %xmm0        # 8-byte Reload
	vmovsd	432(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	440(%esp), %xmm3        # 8-byte Reload
	vmovsd	424(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 416(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 408(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#13:                                # %entry.split.split.split.split.split.split.split.split.split.split
	movl	692(%esp), %eax         # 4-byte Reload
	vmovsd	24(%eax), %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm1, 400(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 392(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#14:                                # %entry.split.split.split.split.split.split.split.split.split.split.split
	vmovsd	416(%esp), %xmm0        # 8-byte Reload
	vmovsd	400(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	408(%esp), %xmm3        # 8-byte Reload
	vmovsd	392(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 384(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 376(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#15:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split
	vmovsd	496(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	488(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 368(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 360(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#16:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split
	vmovsd	368(%esp), %xmm0        # 8-byte Reload
	vmovsd	384(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	360(%esp), %xmm3        # 8-byte Reload
	vmovsd	376(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm5, 352(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#17:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	352(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm0, %xmm1
	jbe	.LBB0_41
# BB#18:                                # %if.then
	vmovsd	.LCPI0_0, %xmm0
	vmovsd	488(%esp), %xmm1        # 8-byte Reload
	vxorpd	%xmm0, %xmm1, %xmm2
	vmovsd	496(%esp), %xmm3        # 8-byte Reload
	vxorpd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm0, %xmm2
	vmovsd	%xmm2, 344(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 336(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#19:                                # %if.then.split
	movl	%esp, %eax
	vmovsd	352(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	calll	sqrt
	fstpl	704(%esp)
	vmovsd	704(%esp), %xmm0
	vmovsd	336(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm0, %xmm1, %xmm2
	vmovsd	344(%esp), %xmm3        # 8-byte Reload
	vsubsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm2, 328(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 320(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#20:                                # %if.then.split.split
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	320(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm0, %xmm1
	jbe	.LBB0_41
# BB#21:                                # %land.lhs.true
	movl	684(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	320(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm1, %xmm0
	jbe	.LBB0_41
# BB#22:                                # %if.then24
	movl	684(%esp), %eax         # 4-byte Reload
	vmovsd	320(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	$1, 56(%eax)
	movl	688(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	596(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	328(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm4
	vmulsd	%xmm2, %xmm0, %xmm2
	vucomisd	%xmm4, %xmm2
	vmovsd	%xmm1, 312(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 304(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 296(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#23:                                # %if.then24.split57
	vmovsd	312(%esp), %xmm0        # 8-byte Reload
	vmovsd	304(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	296(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, 288(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 280(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#24:                                # %if.then24.split57.split59
	movl	684(%esp), %eax         # 4-byte Reload
	vmovsd	280(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 8(%eax)
	movl	660(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	592(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	328(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm4
	vmovsd	320(%esp), %xmm5        # 8-byte Reload
	vmulsd	%xmm2, %xmm5, %xmm2
	vucomisd	%xmm4, %xmm2
	vmovsd	%xmm1, 272(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 264(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 256(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#25:                                # %if.then24.split57.split59.split
	vmovsd	272(%esp), %xmm0        # 8-byte Reload
	vmovsd	264(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	256(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, 248(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 240(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#26:                                # %if.then24.split57.split59.split.split
	movl	684(%esp), %eax         # 4-byte Reload
	vmovsd	240(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 16(%eax)
	movl	628(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	588(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	328(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm4
	vmovsd	320(%esp), %xmm5        # 8-byte Reload
	vmulsd	%xmm2, %xmm5, %xmm2
	vucomisd	%xmm4, %xmm2
	vmovsd	%xmm1, 232(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 224(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 216(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#27:                                # %if.then24.split57.split
	vmovsd	232(%esp), %xmm0        # 8-byte Reload
	vmovsd	224(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	216(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, 208(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 200(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#28:                                # %if.then24.split57.split.split
	movl	684(%esp), %eax         # 4-byte Reload
	vmovsd	200(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 24(%eax)
	movl	692(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	288(%esp), %xmm2        # 8-byte Reload
	vsubsd	%xmm1, %xmm2, %xmm3
	vmovsd	280(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm1, %xmm4, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm3, 192(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 184(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#29:                                # %if.then24.split52
	movl	684(%esp), %eax         # 4-byte Reload
	addl	$32, %eax
	movl	684(%esp), %ecx         # 4-byte Reload
	vmovsd	184(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 32(%ecx)
	movl	644(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm1
	vmovsd	248(%esp), %xmm2        # 8-byte Reload
	vsubsd	%xmm1, %xmm2, %xmm3
	vmovsd	240(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm1, %xmm4, %xmm1
	vucomisd	%xmm3, %xmm1
	movl	%eax, 180(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 168(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 160(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#30:                                # %if.then24.split52.split
	movl	684(%esp), %eax         # 4-byte Reload
	addl	$40, %eax
	movl	684(%esp), %ecx         # 4-byte Reload
	vmovsd	160(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 40(%ecx)
	movl	612(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm1
	vmovsd	208(%esp), %xmm2        # 8-byte Reload
	vsubsd	%xmm1, %xmm2, %xmm3
	vmovsd	200(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm1, %xmm4, %xmm1
	vucomisd	%xmm3, %xmm1
	movl	%eax, 156(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 144(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 136(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#31:                                # %if.then24.split52.split.split53
	movl	684(%esp), %eax         # 4-byte Reload
	addl	$48, %eax
	movl	684(%esp), %ecx         # 4-byte Reload
	vmovsd	136(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 48(%ecx)
	vmovsd	192(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm1, %xmm2
	vmovsd	184(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm3, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	movl	%eax, 132(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 120(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 112(%esp)        # 8-byte Spill
	jne	.LBB0_42
# BB#32:                                # %if.then24.split52.split.split
	vmovsd	168(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	160(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 104(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 96(%esp)         # 8-byte Spill
	jne	.LBB0_42
# BB#33:                                # %if.then24.split52.split.split.split
	vmovsd	120(%esp), %xmm0        # 8-byte Reload
	vmovsd	104(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	112(%esp), %xmm3        # 8-byte Reload
	vmovsd	96(%esp), %xmm4         # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 88(%esp)         # 8-byte Spill
	vmovsd	%xmm5, 80(%esp)         # 8-byte Spill
	jne	.LBB0_42
# BB#34:                                # %if.then24.split
	vmovsd	144(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	136(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 72(%esp)         # 8-byte Spill
	vmovsd	%xmm3, 64(%esp)         # 8-byte Spill
	jne	.LBB0_42
# BB#35:                                # %if.then24.split.split
	vmovsd	72(%esp), %xmm0         # 8-byte Reload
	vmovsd	88(%esp), %xmm1         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	64(%esp), %xmm3         # 8-byte Reload
	vmovsd	80(%esp), %xmm4         # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm5, 56(%esp)         # 8-byte Spill
	jne	.LBB0_42
# BB#36:                                # %if.then24.split.split.split
	vmovsd	.LCPI0_1, %xmm0
	movl	%esp, %eax
	vmovsd	56(%esp), %xmm1         # 8-byte Reload
	vmovsd	%xmm1, (%eax)
	vmovsd	%xmm0, 48(%esp)         # 8-byte Spill
	calll	sqrt
	fstpl	696(%esp)
	vmovsd	696(%esp), %xmm0
	vmovsd	.LCPI0_2, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	vmovsd	48(%esp), %xmm2         # 8-byte Reload
	vucomisd	%xmm2, %xmm1
	vmovsd	%xmm0, 40(%esp)         # 8-byte Spill
	jbe	.LBB0_41
# BB#37:                                # %if.then.i
	movl	180(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	40(%esp), %xmm1         # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vdivsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	jne	.LBB0_42
# BB#38:                                # %if.then.i.split
	movl	180(%esp), %eax         # 4-byte Reload
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	156(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	40(%esp), %xmm2         # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vdivsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 24(%esp)         # 8-byte Spill
	jne	.LBB0_42
# BB#39:                                # %if.then.i.split.split58
	movl	156(%esp), %eax         # 4-byte Reload
	vmovsd	24(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	132(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	40(%esp), %xmm2         # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vdivsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 16(%esp)         # 8-byte Spill
	jne	.LBB0_42
# BB#40:                                # %if.then.i.split.split
	movl	132(%esp), %eax         # 4-byte Reload
	vmovsd	16(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, (%eax)
.LBB0_41:                               # %if.end69
	addl	$712, %esp              # imm = 0x2C8
	popl	%esi
	ret
.LBB0_42:                               # %relExit
	leal	.LrelFun, %eax
	leal	.Lfunc, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	movl	$1, %ecx
	movl	$1, (%esp)
	movl	%eax, 12(%esp)          # 4-byte Spill
	movl	%ecx, 8(%esp)           # 4-byte Spill
	calll	exit
	addl	$712, %esp              # imm = 0x2C8
	popl	%esi
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
	subl	$540, %esp              # imm = 0x21C
	movl	568(%esp), %eax
	movl	564(%esp), %ecx
	movl	560(%esp), %edx
	movl	%eax, %esi
	addl	$24, %esi
	vmovsd	24(%eax), %xmm0
	vmovsd	32(%eax), %xmm1
	vmovsd	40(%eax), %xmm2
	movl	%ecx, %edi
	addl	$24, %edi
	vmovsd	24(%ecx), %xmm3
	movl	%ecx, %ebx
	addl	$32, %ebx
	vmovsd	32(%ecx), %xmm4
	movl	%ecx, %ebp
	addl	$40, %ebp
	vmovsd	40(%ecx), %xmm5
	vmulsd	%xmm3, %xmm0, %xmm6
	vmulsd	%xmm3, %xmm0, %xmm3
	vucomisd	%xmm6, %xmm3
	movl	%eax, 536(%esp)         # 4-byte Spill
	movl	%ecx, 532(%esp)         # 4-byte Spill
	movl	%edx, 528(%esp)         # 4-byte Spill
	movl	%esi, 524(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 512(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 504(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 496(%esp)        # 8-byte Spill
	movl	%edi, 492(%esp)         # 4-byte Spill
	vmovsd	%xmm6, 480(%esp)        # 8-byte Spill
	movl	%ebx, 476(%esp)         # 4-byte Spill
	vmovsd	%xmm4, 464(%esp)        # 8-byte Spill
	movl	%ebp, 460(%esp)         # 4-byte Spill
	vmovsd	%xmm5, 448(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 440(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#1:                                 # %entry.split
	vmovsd	504(%esp), %xmm0        # 8-byte Reload
	vmovsd	464(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 432(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 424(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#2:                                 # %entry.split.split
	vmovsd	480(%esp), %xmm0        # 8-byte Reload
	vmovsd	432(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	440(%esp), %xmm3        # 8-byte Reload
	vmovsd	424(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 416(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 408(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#3:                                 # %entry.split.split.split
	vmovsd	496(%esp), %xmm0        # 8-byte Reload
	vmovsd	448(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 400(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 392(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#4:                                 # %entry.split.split.split.split
	vmovsd	416(%esp), %xmm0        # 8-byte Reload
	vmovsd	400(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	408(%esp), %xmm3        # 8-byte Reload
	vmovsd	392(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 384(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 376(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#5:                                 # %entry.split.split.split.split.split
	vmovsd	.LCPI1_0, %xmm0
	vmovsd	.LCPI1_1, %xmm1
	vmovsd	376(%esp), %xmm2        # 8-byte Reload
	vandpd	%xmm1, %xmm2, %xmm1
	vucomisd	%xmm1, %xmm0
	ja	.LBB1_28
# BB#6:                                 # %if.end
	movl	536(%esp), %eax         # 4-byte Reload
	addl	$16, %eax
	movl	536(%esp), %ecx         # 4-byte Reload
	vmovsd	8(%ecx), %xmm0
	vmovsd	(%ecx), %xmm1
	vmovsd	504(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm3, %xmm0
	movl	%eax, 372(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 360(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 352(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 344(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#7:                                 # %if.end.split24
	vmovsd	512(%esp), %xmm0        # 8-byte Reload
	vmovsd	352(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 336(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 328(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#8:                                 # %if.end.split24.split
	movl	372(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	496(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm2
	vmulsd	%xmm0, %xmm1, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm2, 320(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 312(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#9:                                 # %if.end.split24.split.split
	vmovsd	360(%esp), %xmm0        # 8-byte Reload
	vmovsd	336(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	344(%esp), %xmm3        # 8-byte Reload
	vmovsd	328(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 304(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 296(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#10:                                # %if.end.split24.split.split.split
	vmovsd	304(%esp), %xmm0        # 8-byte Reload
	vmovsd	320(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	296(%esp), %xmm3        # 8-byte Reload
	vmovsd	312(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 288(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 280(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#11:                                # %if.end.split24.split.split.split.split
	movl	532(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	addl	$8, %eax
	movl	532(%esp), %ecx         # 4-byte Reload
	vmovsd	8(%ecx), %xmm1
	addl	$16, %ecx
	movl	532(%esp), %edx         # 4-byte Reload
	vmovsd	16(%edx), %xmm2
	vmovsd	512(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm0, %xmm3, %xmm4
	vmulsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm4, %xmm0
	movl	%eax, 276(%esp)         # 4-byte Spill
	vmovsd	%xmm4, 264(%esp)        # 8-byte Spill
	movl	%ecx, 260(%esp)         # 4-byte Spill
	vmovsd	%xmm1, 248(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 240(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 232(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#12:                                # %if.end.split24.split.split.split.split.split
	vmovsd	504(%esp), %xmm0        # 8-byte Reload
	vmovsd	248(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 224(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 216(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#13:                                # %if.end.split24.split.split.split.split.split.split
	vmovsd	264(%esp), %xmm0        # 8-byte Reload
	vmovsd	224(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	232(%esp), %xmm3        # 8-byte Reload
	vmovsd	216(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 208(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 200(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#14:                                # %if.end.split24.split.split.split.split.split.split.split
	vmovsd	496(%esp), %xmm0        # 8-byte Reload
	vmovsd	240(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 192(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 184(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#15:                                # %if.end.split24.split.split.split.split.split.split.split.split
	vmovsd	208(%esp), %xmm0        # 8-byte Reload
	vmovsd	192(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	200(%esp), %xmm3        # 8-byte Reload
	vmovsd	184(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 176(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 168(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#16:                                # %if.end.split24.split.split.split.split.split.split.split.split.split
	vmovsd	176(%esp), %xmm0        # 8-byte Reload
	vmovsd	288(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	168(%esp), %xmm3        # 8-byte Reload
	vmovsd	280(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 160(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 152(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#17:                                # %if.end.split
	vmovsd	.LCPI1_2, %xmm0
	vmovsd	152(%esp), %xmm1        # 8-byte Reload
	vxorpd	%xmm0, %xmm1, %xmm2
	vmovsd	160(%esp), %xmm3        # 8-byte Reload
	vxorpd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm0, %xmm2
	vmovsd	%xmm2, 144(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 136(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#18:                                # %if.end.split.split
	vmovsd	136(%esp), %xmm0        # 8-byte Reload
	vmovsd	384(%esp), %xmm1        # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	144(%esp), %xmm3        # 8-byte Reload
	vmovsd	376(%esp), %xmm4        # 8-byte Reload
	vdivsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 128(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 120(%esp)        # 8-byte Spill
	jne	.LBB1_29
# BB#19:                                # %if.end.split.split.split
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	120(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm0, %xmm1
	jbe	.LBB1_28
# BB#20:                                # %land.lhs.true
	movl	528(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	120(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm1, %xmm0
	jbe	.LBB1_28
# BB#21:                                # %if.then10
	movl	528(%esp), %eax         # 4-byte Reload
	vmovsd	120(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	$1, 56(%eax)
	movl	532(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	492(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	128(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm4
	vmulsd	%xmm2, %xmm0, %xmm2
	vucomisd	%xmm4, %xmm2
	vmovsd	%xmm1, 112(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 104(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 96(%esp)         # 8-byte Spill
	jne	.LBB1_29
# BB#22:                                # %if.then10.split
	vmovsd	112(%esp), %xmm0        # 8-byte Reload
	vmovsd	104(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	96(%esp), %xmm3         # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 88(%esp)         # 8-byte Spill
	jne	.LBB1_29
# BB#23:                                # %if.then10.split.split
	movl	528(%esp), %eax         # 4-byte Reload
	vmovsd	88(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, 8(%eax)
	movl	276(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	476(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	128(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm4
	vmovsd	120(%esp), %xmm5        # 8-byte Reload
	vmulsd	%xmm2, %xmm5, %xmm2
	vucomisd	%xmm4, %xmm2
	vmovsd	%xmm1, 80(%esp)         # 8-byte Spill
	vmovsd	%xmm4, 72(%esp)         # 8-byte Spill
	vmovsd	%xmm2, 64(%esp)         # 8-byte Spill
	jne	.LBB1_29
# BB#24:                                # %if.then10.split.split.split
	vmovsd	80(%esp), %xmm0         # 8-byte Reload
	vmovsd	72(%esp), %xmm1         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	64(%esp), %xmm3         # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 56(%esp)         # 8-byte Spill
	jne	.LBB1_29
# BB#25:                                # %if.then10.split.split.split.split
	movl	528(%esp), %eax         # 4-byte Reload
	vmovsd	56(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, 16(%eax)
	movl	260(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	460(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	128(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm2, %xmm3, %xmm4
	vmovsd	120(%esp), %xmm5        # 8-byte Reload
	vmulsd	%xmm2, %xmm5, %xmm2
	vucomisd	%xmm4, %xmm2
	vmovsd	%xmm1, 48(%esp)         # 8-byte Spill
	vmovsd	%xmm4, 40(%esp)         # 8-byte Spill
	vmovsd	%xmm2, 32(%esp)         # 8-byte Spill
	jne	.LBB1_29
# BB#26:                                # %if.then10.split.split.split.split.split
	vmovsd	48(%esp), %xmm0         # 8-byte Reload
	vmovsd	40(%esp), %xmm1         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	32(%esp), %xmm3         # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 24(%esp)         # 8-byte Spill
	jne	.LBB1_29
# BB#27:                                # %if.then10.split.split.split.split.split.split
	movl	$24, %eax
	movl	528(%esp), %ecx         # 4-byte Reload
	vmovsd	24(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, 24(%ecx)
	addl	$32, %ecx
	movl	524(%esp), %edx         # 4-byte Reload
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	$24, 8(%esp)
	movl	%eax, 20(%esp)          # 4-byte Spill
	calll	memcpy
.LBB1_28:                               # %if.end34
	addl	$540, %esp              # imm = 0x21C
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.LBB1_29:                               # %relExit
	leal	.LrelFun, %eax
	leal	.Lfunc1, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	movl	$1, %ecx
	movl	$1, (%esp)
	movl	%eax, 16(%esp)          # 4-byte Spill
	movl	%ecx, 12(%esp)          # 4-byte Spill
	calll	exit
	addl	$540, %esp              # imm = 0x21C
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
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$800, %esp              # imm = 0x320
	leal	820(%esp), %eax
	movl	816(%esp), %ecx
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
	movl	%eax, 780(%esp)         # 4-byte Spill
	movl	%ecx, 776(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 768(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 760(%esp)        # 8-byte Spill
	movl	%edx, 756(%esp)         # 4-byte Spill
	movl	%esi, 752(%esp)         # 4-byte Spill
	calll	memcpy
	movl	776(%esp), %eax         # 4-byte Reload
	addl	$24, %eax
	movl	776(%esp), %ecx         # 4-byte Reload
	addl	$32, %ecx
	movl	776(%esp), %edx         # 4-byte Reload
	addl	$40, %edx
	movl	%eax, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%esi)
	movl	$0, 20(%esi)
	movl	$0, 16(%esi)
	movl	780(%esp), %esi         # 4-byte Reload
	vmovsd	(%esi), %xmm0
	vmovsd	760(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm0, %xmm1
	seta	%bl
	vmovsd	768(%esp), %xmm2        # 8-byte Reload
	vucomisd	%xmm2, %xmm0
	seta	%bh
	andb	%bh, %bl
	testb	$1, %bl
	movl	%eax, 748(%esp)         # 4-byte Spill
	movl	%ecx, 744(%esp)         # 4-byte Spill
	movl	%edx, 740(%esp)         # 4-byte Spill
	jne	.LBB2_1
	jmp	.LBB2_2
.LBB2_1:                                # %if.then
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$1, %eax
	vmovsd	.LCPI2_2, %xmm1
	movl	748(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm1, (%ecx)
	vmovaps	%xmm0, %xmm2
	vmovsd	%xmm2, 728(%esp)        # 8-byte Spill
	movl	%eax, 724(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 712(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 704(%esp)        # 8-byte Spill
	jmp	.LBB2_7
.LBB2_2:                                # %if.else
	vmovsd	.LCPI2_0, %xmm0
	vmovsd	.LCPI2_1, %xmm1
	movl	780(%esp), %eax         # 4-byte Reload
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
	movl	744(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm1, (%ecx)
	vmovaps	%xmm0, %xmm2
	vmovsd	%xmm1, 712(%esp)        # 8-byte Spill
	movl	%eax, 700(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 728(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 704(%esp)        # 8-byte Spill
	jmp	.LBB2_7
.LBB2_4:                                # %if.else17
	vmovsd	.LCPI2_0, %xmm0
	vmovsd	.LCPI2_1, %xmm1
	movl	780(%esp), %eax         # 4-byte Reload
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
	movl	740(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm0, (%ecx)
	vmovaps	%xmm1, %xmm2
	movl	%eax, 696(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 712(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 728(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 704(%esp)        # 8-byte Spill
	jmp	.LBB2_7
.LBB2_6:                                # %if.else26
	vxorps	%xmm0, %xmm0, %xmm0
	movl	$1, %eax
	vmovsd	.LCPI2_2, %xmm1
	movl	748(%esp), %ecx         # 4-byte Reload
	vmovsd	%xmm1, (%ecx)
	vmovaps	%xmm0, %xmm2
	vmovsd	%xmm2, 728(%esp)        # 8-byte Spill
	movl	%eax, 692(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 712(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 704(%esp)        # 8-byte Spill
.LBB2_7:                                # %if.end30
	vmovsd	728(%esp), %xmm0        # 8-byte Reload
	vmovsd	712(%esp), %xmm1        # 8-byte Reload
	vmovsd	704(%esp), %xmm2        # 8-byte Reload
	movl	752(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm3
	movl	776(%esp), %ecx         # 4-byte Reload
	addl	$56, %ecx
	movl	776(%esp), %edx         # 4-byte Reload
	vmovsd	56(%edx), %xmm4
	addl	$64, %edx
	movl	776(%esp), %esi         # 4-byte Reload
	vmovsd	64(%esi), %xmm5
	vmulsd	%xmm5, %xmm1, %xmm6
	vmulsd	%xmm5, %xmm1, %xmm7
	vucomisd	%xmm6, %xmm7
	vmovsd	%xmm0, 680(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 672(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 664(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 656(%esp)        # 8-byte Spill
	movl	%ecx, 652(%esp)         # 4-byte Spill
	movl	%edx, 648(%esp)         # 4-byte Spill
	vmovsd	%xmm4, 640(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 632(%esp)        # 8-byte Spill
	vmovsd	%xmm6, 624(%esp)        # 8-byte Spill
	vmovsd	%xmm7, 616(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#8:                                 # %if.end30.split
	vmovsd	680(%esp), %xmm0        # 8-byte Reload
	vmovsd	640(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 608(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 600(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#9:                                 # %if.end30.split.split
	vmovsd	624(%esp), %xmm0        # 8-byte Reload
	vmovsd	608(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	616(%esp), %xmm3        # 8-byte Reload
	vmovsd	600(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 592(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 584(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#10:                                # %if.end30.split.split.split
	movl	776(%esp), %eax         # 4-byte Reload
	vmovsd	584(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	680(%esp), %xmm1        # 8-byte Reload
	vmovsd	656(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm1, %xmm3
	vmulsd	%xmm2, %xmm1, %xmm4
	vucomisd	%xmm3, %xmm4
	vmovsd	%xmm3, 576(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 568(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#11:                                # %if.end30.split.split.split.split
	vmovsd	664(%esp), %xmm0        # 8-byte Reload
	vmovsd	632(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 560(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 552(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#12:                                # %if.end30.split.split.split.split.split
	vmovsd	576(%esp), %xmm0        # 8-byte Reload
	vmovsd	560(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	568(%esp), %xmm3        # 8-byte Reload
	vmovsd	552(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 544(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 536(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#13:                                # %if.end30.split.split.split.split.split.split
	movl	776(%esp), %eax         # 4-byte Reload
	addl	$8, %eax
	movl	776(%esp), %ecx         # 4-byte Reload
	vmovsd	536(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 8(%ecx)
	vmovsd	664(%esp), %xmm1        # 8-byte Reload
	vmovsd	640(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm1, %xmm3
	vmulsd	%xmm2, %xmm1, %xmm4
	vucomisd	%xmm3, %xmm4
	movl	%eax, 532(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 520(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 512(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#14:                                # %if.end30.split.split.split.split.split.split.split
	vmovsd	672(%esp), %xmm0        # 8-byte Reload
	vmovsd	656(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 504(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 496(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#15:                                # %if.end30.split.split.split.split.split.split.split.split
	vmovsd	520(%esp), %xmm0        # 8-byte Reload
	vmovsd	504(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	512(%esp), %xmm3        # 8-byte Reload
	vmovsd	496(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 488(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 480(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#16:                                # %if.end30.split.split.split.split.split.split.split.split.split
	movl	776(%esp), %eax         # 4-byte Reload
	addl	$16, %eax
	movl	776(%esp), %ecx         # 4-byte Reload
	vmovsd	480(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, 16(%ecx)
	vmovsd	592(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm1, %xmm2
	vmovsd	584(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm3, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	movl	%eax, 476(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 464(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 456(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#17:                                # %if.end30.split.split.split.split.split.split.split.split.split.split
	vmovsd	544(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	536(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 448(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 440(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#18:                                # %if.end30.split.split.split.split.split.split.split.split.split.split.split
	vmovsd	464(%esp), %xmm0        # 8-byte Reload
	vmovsd	448(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	456(%esp), %xmm3        # 8-byte Reload
	vmovsd	440(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 432(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 424(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#19:                                # %if.end30.split.split.split.split.split.split.split.split.split.split.split.split
	vmovsd	488(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	480(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 416(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 408(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#20:                                # %if.end30.split.split.split.split.split.split.split.split.split.split.split.split.split
	vmovsd	416(%esp), %xmm0        # 8-byte Reload
	vmovsd	432(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	408(%esp), %xmm3        # 8-byte Reload
	vmovsd	424(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm5, 400(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#21:                                # %if.end30.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	vmovsd	.LCPI2_3, %xmm0
	movl	%esp, %eax
	vmovsd	400(%esp), %xmm1        # 8-byte Reload
	vmovsd	%xmm1, (%eax)
	vmovsd	%xmm0, 392(%esp)        # 8-byte Spill
	calll	sqrt
	fstpl	792(%esp)
	vmovsd	792(%esp), %xmm0
	vmovsd	.LCPI2_4, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	movl	776(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm2
	vmovsd	392(%esp), %xmm3        # 8-byte Reload
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm0, 384(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 376(%esp)        # 8-byte Spill
	ja	.LBB2_23
# BB#22:                                # %if.end30.vnormalize.exit77_crit_edge
	movl	532(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	movl	476(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	376(%esp), %xmm2        # 8-byte Reload
	vmovsd	%xmm1, 368(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 360(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 352(%esp)        # 8-byte Spill
	jmp	.LBB2_27
.LBB2_23:                               # %if.then.i76
	vmovsd	376(%esp), %xmm0        # 8-byte Reload
	vmovsd	384(%esp), %xmm1        # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vdivsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm3, 344(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#24:                                # %if.then.i76.split36
	movl	776(%esp), %eax         # 4-byte Reload
	vmovsd	344(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	532(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	384(%esp), %xmm2        # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vdivsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 336(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#25:                                # %if.then.i76.split36.split
	movl	532(%esp), %eax         # 4-byte Reload
	vmovsd	336(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	476(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	384(%esp), %xmm2        # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vdivsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 328(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#26:                                # %if.then.i76.split
	movl	476(%esp), %eax         # 4-byte Reload
	vmovsd	328(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	336(%esp), %xmm1        # 8-byte Reload
	vmovsd	344(%esp), %xmm2        # 8-byte Reload
	vmovsd	%xmm0, 368(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 360(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 352(%esp)        # 8-byte Spill
.LBB2_27:                               # %vnormalize.exit77
	vmovsd	368(%esp), %xmm0        # 8-byte Reload
	vmovsd	360(%esp), %xmm1        # 8-byte Reload
	vmovsd	352(%esp), %xmm2        # 8-byte Reload
	movl	752(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm3
	movl	652(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm4
	movl	648(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm5
	vmulsd	%xmm0, %xmm4, %xmm6
	vmulsd	%xmm0, %xmm4, %xmm7
	vucomisd	%xmm6, %xmm7
	vmovsd	%xmm0, 320(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 312(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 304(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 296(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 288(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 280(%esp)        # 8-byte Spill
	vmovsd	%xmm6, 272(%esp)        # 8-byte Spill
	vmovsd	%xmm7, 264(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#28:                                # %vnormalize.exit77.split35
	vmovsd	280(%esp), %xmm0        # 8-byte Reload
	vmovsd	312(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 256(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 248(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#29:                                # %vnormalize.exit77.split35.split
	vmovsd	272(%esp), %xmm0        # 8-byte Reload
	vmovsd	256(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	264(%esp), %xmm3        # 8-byte Reload
	vmovsd	248(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 240(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 232(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#30:                                # %vnormalize.exit77.split34
	movl	748(%esp), %eax         # 4-byte Reload
	vmovsd	232(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	280(%esp), %xmm1        # 8-byte Reload
	vmovsd	304(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm1, %xmm3
	vmulsd	%xmm2, %xmm1, %xmm4
	vucomisd	%xmm3, %xmm4
	vmovsd	%xmm3, 224(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 216(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#31:                                # %vnormalize.exit77.split34.split
	vmovsd	296(%esp), %xmm0        # 8-byte Reload
	vmovsd	320(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 208(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 200(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#32:                                # %vnormalize.exit77.split
	vmovsd	224(%esp), %xmm0        # 8-byte Reload
	vmovsd	208(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	216(%esp), %xmm3        # 8-byte Reload
	vmovsd	200(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 192(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 184(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#33:                                # %vnormalize.exit77.split.split
	movl	744(%esp), %eax         # 4-byte Reload
	vmovsd	184(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	296(%esp), %xmm1        # 8-byte Reload
	vmovsd	312(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm1, %xmm3
	vmulsd	%xmm2, %xmm1, %xmm4
	vucomisd	%xmm3, %xmm4
	vmovsd	%xmm3, 176(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 168(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#34:                                # %vnormalize.exit77.split.split.split
	vmovsd	288(%esp), %xmm0        # 8-byte Reload
	vmovsd	304(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 160(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 152(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#35:                                # %vnormalize.exit77.split.split.split.split
	vmovsd	176(%esp), %xmm0        # 8-byte Reload
	vmovsd	160(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	168(%esp), %xmm3        # 8-byte Reload
	vmovsd	152(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 144(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 136(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#36:                                # %vnormalize.exit77.split.split.split.split.split
	movl	740(%esp), %eax         # 4-byte Reload
	vmovsd	136(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	240(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm1, %xmm2
	vmovsd	232(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm3, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, 128(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 120(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#37:                                # %vnormalize.exit77.split.split.split.split.split.split
	vmovsd	192(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	184(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 112(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 104(%esp)        # 8-byte Spill
	jne	.LBB2_47
# BB#38:                                # %vnormalize.exit77.split.split.split.split.split.split.split
	vmovsd	128(%esp), %xmm0        # 8-byte Reload
	vmovsd	112(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	120(%esp), %xmm3        # 8-byte Reload
	vmovsd	104(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 96(%esp)         # 8-byte Spill
	vmovsd	%xmm5, 88(%esp)         # 8-byte Spill
	jne	.LBB2_47
# BB#39:                                # %vnormalize.exit77.split.split.split.split.split.split.split.split
	vmovsd	144(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	136(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 80(%esp)         # 8-byte Spill
	vmovsd	%xmm3, 72(%esp)         # 8-byte Spill
	jne	.LBB2_47
# BB#40:                                # %vnormalize.exit77.split.split.split.split.split.split.split.split.split
	vmovsd	80(%esp), %xmm0         # 8-byte Reload
	vmovsd	96(%esp), %xmm1         # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	72(%esp), %xmm3         # 8-byte Reload
	vmovsd	88(%esp), %xmm4         # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm5, 64(%esp)         # 8-byte Spill
	jne	.LBB2_47
# BB#41:                                # %vnormalize.exit77.split.split.split.split.split.split.split.split.split.split
	vmovsd	.LCPI2_3, %xmm0
	movl	%esp, %eax
	vmovsd	64(%esp), %xmm1         # 8-byte Reload
	vmovsd	%xmm1, (%eax)
	vmovsd	%xmm0, 56(%esp)         # 8-byte Spill
	calll	sqrt
	fstpl	784(%esp)
	vmovsd	784(%esp), %xmm0
	vmovsd	.LCPI2_4, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	vmovsd	56(%esp), %xmm2         # 8-byte Reload
	vucomisd	%xmm2, %xmm1
	vmovsd	%xmm0, 48(%esp)         # 8-byte Spill
	jbe	.LBB2_46
# BB#42:                                # %if.then.i
	movl	748(%esp), %eax         # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	48(%esp), %xmm1         # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vdivsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm0, 40(%esp)         # 8-byte Spill
	jne	.LBB2_47
# BB#43:                                # %if.then.i.split
	movl	748(%esp), %eax         # 4-byte Reload
	vmovsd	40(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	744(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	48(%esp), %xmm2         # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vdivsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 32(%esp)         # 8-byte Spill
	jne	.LBB2_47
# BB#44:                                # %if.then.i.split.split
	movl	744(%esp), %eax         # 4-byte Reload
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	740(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	48(%esp), %xmm2         # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vdivsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 24(%esp)         # 8-byte Spill
	jne	.LBB2_47
# BB#45:                                # %if.then.i.split.split.split
	movl	740(%esp), %eax         # 4-byte Reload
	vmovsd	24(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, (%eax)
.LBB2_46:                               # %vnormalize.exit
	addl	$800, %esp              # imm = 0x320
	popl	%esi
	popl	%edi
	popl	%ebx
	ret
.LBB2_47:                               # %relExit
	leal	.LrelFun, %eax
	leal	.Lfunc2, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	movl	$1, %ecx
	movl	$1, (%esp)
	movl	%eax, 20(%esp)          # 4-byte Spill
	movl	%ecx, 16(%esp)          # 4-byte Spill
	calll	exit
	addl	$800, %esp              # imm = 0x320
	popl	%esi
	popl	%edi
	popl	%ebx
	ret
.Ltmp2:
	.size	orthoBasis, .Ltmp2-orthoBasis

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4547007122018943789     # double 1.0E-4
.LCPI3_22:
	.quad	4643211215818981376     # double 256
.LCPI3_23:
	.quad	4571153621781053440     # double 0.00390625
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
	.long	2                       # 0x2
	.long	2                       # 0x2
	.long	2                       # 0x2
	.long	2                       # 0x2
.LCPI3_9:
	.long	4                       # 0x4
	.long	4                       # 0x4
	.long	4                       # 0x4
	.long	4                       # 0x4
.LCPI3_10:
	.quad	-4670316376466915328    # double -2.418756e-04
	.quad	-4670316376466915328    # double -2.418756e-04
.LCPI3_11:
	.quad	-4727578748360681319    # double -3.774895e-08
	.quad	-4727578748360681319    # double -3.774895e-08
.LCPI3_12:
	.quad	4537832620275044031     # double 2.443316e-05
	.quad	4537832620275044031     # double 2.443316e-05
.LCPI3_13:
	.quad	-4659324819735196321    # double -1.388732e-03
	.quad	-4659324819735196321    # double -1.388732e-03
.LCPI3_14:
	.quad	4586165617514888335     # double 4.166665e-02
	.quad	4586165617514888335     # double 4.166665e-02
.LCPI3_15:
	.quad	4602678819172646912     # double 5.000000e-01
	.quad	4602678819172646912     # double 5.000000e-01
.LCPI3_16:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4607182418800017408     # double 1.000000e+00
.LCPI3_17:
	.quad	-4672040139461465492    # double -1.951530e-04
	.quad	-4672040139461465492    # double -1.951530e-04
.LCPI3_18:
	.quad	4575956785506562046     # double 8.332161e-03
	.quad	4575956785506562046     # double 8.332161e-03
.LCPI3_19:
	.quad	-4628199221404591395    # double -1.666665e-01
	.quad	-4628199221404591395    # double -1.666665e-01
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
	subl	$7932, %esp             # imm = 0x1EFC
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	vmovsd	.LCPI3_0, %xmm0
	vmovsd	8(%eax), %xmm1
	movl	%eax, %edx
	addl	$32, %edx
	vmovsd	32(%eax), %xmm2
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm3, %xmm0
	movl	%eax, -92(%ebp)         # 4-byte Spill
	movl	%ecx, -96(%ebp)         # 4-byte Spill
	vmovsd	%xmm3, -104(%ebp)       # 8-byte Spill
	vmovsd	%xmm1, -112(%ebp)       # 8-byte Spill
	movl	%edx, -116(%ebp)        # 4-byte Spill
	vmovsd	%xmm0, -128(%ebp)       # 8-byte Spill
	jne	.LBB3_230
# BB#1:                                 # %entry.split
	vmovsd	-112(%ebp), %xmm0       # 8-byte Reload
	vmovsd	-104(%ebp), %xmm1       # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	-128(%ebp), %xmm3       # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, -136(%ebp)       # 8-byte Spill
	vmovsd	%xmm4, -144(%ebp)       # 8-byte Spill
	jne	.LBB3_230
# BB#2:                                 # %entry.split.split
	vmovsd	.LCPI3_0, %xmm0
	movl	-92(%ebp), %eax         # 4-byte Reload
	vmovsd	16(%eax), %xmm1
	vmovsd	40(%eax), %xmm2
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm3, %xmm0
	vmovsd	%xmm3, -152(%ebp)       # 8-byte Spill
	vmovsd	%xmm1, -160(%ebp)       # 8-byte Spill
	vmovsd	%xmm0, -168(%ebp)       # 8-byte Spill
	jne	.LBB3_230
# BB#3:                                 # %entry.split.split.split
	vmovsd	-160(%ebp), %xmm0       # 8-byte Reload
	vmovsd	-152(%ebp), %xmm1       # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	-168(%ebp), %xmm3       # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, -176(%ebp)       # 8-byte Spill
	vmovsd	%xmm4, -184(%ebp)       # 8-byte Spill
	jne	.LBB3_230
# BB#4:                                 # %entry.split.split.split.split
	vmovsd	.LCPI3_0, %xmm0
	movl	-92(%ebp), %eax         # 4-byte Reload
	vmovsd	24(%eax), %xmm1
	vmovsd	48(%eax), %xmm2
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm3, %xmm0
	vmovsd	%xmm3, -192(%ebp)       # 8-byte Spill
	vmovsd	%xmm1, -200(%ebp)       # 8-byte Spill
	vmovsd	%xmm0, -208(%ebp)       # 8-byte Spill
	jne	.LBB3_230
# BB#5:                                 # %entry.split.split.split.split.split
	vmovsd	-200(%ebp), %xmm0       # 8-byte Reload
	vmovsd	-192(%ebp), %xmm1       # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	-208(%ebp), %xmm3       # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm2, -216(%ebp)       # 8-byte Spill
	vmovsd	%xmm4, -224(%ebp)       # 8-byte Spill
	jne	.LBB3_230
# BB#6:                                 # %entry.split.split.split.split.split.split
	movb	$0, %al
	leal	-88(%ebp), %ecx
	subl	$32, %esp
	movl	-116(%ebp), %edx        # 4-byte Reload
	vmovsd	16(%edx), %xmm0
	movl	%esp, %esi
	vmovsd	%xmm0, 20(%esi)
	vmovups	(%edx), %xmm0
	vmovups	%xmm0, 4(%esi)
	movl	%ecx, (%esi)
	movb	%al, -225(%ebp)         # 1-byte Spill
	calll	orthoBasis
	addl	$32, %esp
	vmovsd	-88(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	movb	-225(%ebp), %al         # 1-byte Reload
	testb	$1, %al
	vmovsd	%xmm0, -240(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -264(%ebp)       # 16-byte Spill
	vmovaps	%xmm1, -280(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#7:                                 # %entry.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-240(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-264(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-280(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -296(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -312(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#8:                                 # %entry.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-64(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -328(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -336(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -360(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#9:                                 # %entry.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-336(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-360(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-328(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -376(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -392(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#10:                                # %entry.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-40(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -408(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -416(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -440(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#11:                                # %entry.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-416(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-440(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-408(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -456(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -472(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#12:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-80(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -488(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -496(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -520(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#13:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-496(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-520(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-488(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -536(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -552(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#14:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-56(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -568(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -576(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -600(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#15:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-576(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-600(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-568(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -616(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -632(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#16:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-32(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -648(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -656(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -680(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#17:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-656(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-680(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-648(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -696(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -712(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#18:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-72(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -728(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -736(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -760(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#19:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-736(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-760(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-728(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -776(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -792(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#20:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-48(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -808(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -816(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -840(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#21:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-816(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-840(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-808(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -856(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -872(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#22:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-24(%ebp), %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -888(%ebp)       # 16-byte Spill
	vmovsd	%xmm0, -896(%ebp)       # 8-byte Spill
	vmovaps	%xmm2, -920(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#23:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-896(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-920(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-888(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -936(%ebp)       # 16-byte Spill
	vmovaps	%xmm2, -952(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#24:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-144(%ebp), %xmm0       # 8-byte Reload
	vmovsd	-136(%ebp), %xmm1       # 8-byte Reload
	testb	$1, %al
	vmovaps	%xmm1, -968(%ebp)       # 16-byte Spill
	vmovaps	%xmm0, -984(%ebp)       # 16-byte Spill
	jne	.LBB3_230
# BB#25:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-144(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-984(%ebp), %xmm1       # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovsd	-136(%ebp), %xmm2       # 8-byte Reload
	vmovaps	-968(%ebp), %xmm3       # 16-byte Reload
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	testb	$1, %al
	vmovaps	%xmm2, -1000(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1016(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#26:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-184(%ebp), %xmm0       # 8-byte Reload
	vmovsd	-176(%ebp), %xmm1       # 8-byte Reload
	testb	$1, %al
	vmovaps	%xmm1, -1032(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1048(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#27:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-184(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-1048(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovsd	-176(%ebp), %xmm2       # 8-byte Reload
	vmovaps	-1032(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	testb	$1, %al
	vmovaps	%xmm2, -1064(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1080(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#28:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-224(%ebp), %xmm0       # 8-byte Reload
	vmovsd	-216(%ebp), %xmm1       # 8-byte Reload
	testb	$1, %al
	vmovaps	%xmm1, -1096(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1112(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#29:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	movb	$0, %al
	vmovsd	-224(%ebp), %xmm0       # 8-byte Reload
	vmovaps	-1112(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovsd	-216(%ebp), %xmm2       # 8-byte Reload
	vmovaps	-1096(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	testb	$1, %al
	vmovaps	%xmm2, -1128(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1144(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#30:                                # %entry.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
	xorl	%eax, %eax
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -1160(%ebp)      # 16-byte Spill
	movl	%eax, -1164(%ebp)       # 4-byte Spill
.LBB3_31:                               # %for.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_111 Depth 2
	vmovaps	-1160(%ebp), %xmm0      # 16-byte Reload
	movl	-1164(%ebp), %eax       # 4-byte Reload
	movb	$0, %cl
	movl	%esp, %edx
	movl	%esp, %esi
	movl	%esi, %edi
	addl	$-128, %edi
	movl	%edi, %esp
	movl	%esp, %ebx
	movl	%eax, -1168(%ebp)       # 4-byte Spill
	movl	%ebx, %eax
	addl	$-128, %eax
	movl	%eax, %esp
	vmovaps	%xmm0, -1192(%ebp)      # 16-byte Spill
	movl	%eax, -1196(%ebp)       # 4-byte Spill
	movb	%cl, -1197(%ebp)        # 1-byte Spill
	movl	%edx, -1204(%ebp)       # 4-byte Spill
	movl	%esi, -1208(%ebp)       # 4-byte Spill
	movl	%edi, -1212(%ebp)       # 4-byte Spill
	movl	%ebx, -1216(%ebp)       # 4-byte Spill
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-128(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-128(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-120(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-120(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-112(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-112(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-104(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-104(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-96(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-96(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-88(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-88(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-80(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-80(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-72(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-72(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-64(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-64(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-56(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-56(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-48(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-48(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-40(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-40(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-32(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-32(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-24(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-24(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-16(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-16(%eax)
	calll	drand48
	movl	-1208(%ebp), %eax       # 4-byte Reload
	fstpl	-8(%eax)
	calll	drand48
	movl	-1216(%ebp), %eax       # 4-byte Reload
	fstpl	-8(%eax)
	vmovsd	spheres, %xmm0
	vmovaps	%xmm0, %xmm1
	movl	-1204(%ebp), %edx       # 4-byte Reload
	vmovaps	%xmm1, %xmm2
	movb	-1197(%ebp), %cl        # 1-byte Reload
	testb	$1, %cl
	vmovsd	%xmm0, -1224(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -1240(%ebp)      # 16-byte Spill
	movl	%edx, -1244(%ebp)       # 4-byte Spill
	vmovaps	%xmm1, -1272(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#32:                                # %for.body.split318
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-1224(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-1240(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-1272(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -1288(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1304(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#33:                                # %for.body.split318.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1000(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1288(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1016(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-1304(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -1320(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1336(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#34:                                # %for.body.split318.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+8, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -1352(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -1360(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -1384(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#35:                                # %for.body.split318.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-1360(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-1384(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-1352(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -1400(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1416(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#36:                                # %for.body.split318.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1064(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1400(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1080(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-1416(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -1432(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1448(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#37:                                # %for.body.split318.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+16, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -1464(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -1472(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -1496(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#38:                                # %for.body.split318.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-1472(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-1496(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-1464(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -1512(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1528(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#39:                                # %for.body.split318.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1128(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1512(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1144(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-1528(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -1544(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1560(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#40:                                # %for.body.split318.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1336(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-1320(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -1576(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -1592(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#41:                                # %for.body.split318.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1448(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-1432(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -1608(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -1624(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#42:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1560(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-1544(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -1640(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -1656(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#43:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1624(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1656(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1608(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-1640(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -1672(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1688(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#44:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1592(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1688(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1576(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-1672(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -1704(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1720(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#45:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	vmovsd	spheres+24, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm1, -1728(%ebp)      # 8-byte Spill
	vmovsd	%xmm0, -1736(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#46:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-1736(%ebp), %xmm0      # 8-byte Reload
	vmovsd	-1728(%ebp), %xmm1      # 8-byte Reload
	testb	$1, %al
	vmovaps	%xmm1, -1752(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1768(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#47:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-1736(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-1768(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovsd	-1728(%ebp), %xmm2      # 8-byte Reload
	vmovaps	-1752(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	testb	$1, %al
	vmovaps	%xmm2, -1784(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -1800(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#48:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1720(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1784(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1704(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-1800(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -1816(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1832(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#49:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+32, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -1848(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -1856(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -1880(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#50:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-1856(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-1880(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-1848(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -1896(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1912(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#51:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1000(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1896(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1016(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-1912(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -1928(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -1944(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#52:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+40, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -1960(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -1968(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -1992(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#53:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-1968(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-1992(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-1960(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -2008(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2024(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#54:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1064(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2008(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1080(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2024(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2040(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2056(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#55:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+48, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -2072(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -2080(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -2104(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#56:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2080(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-2104(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-2072(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -2120(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2136(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#57:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1128(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2120(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1144(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2136(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2152(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2168(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#58:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1944(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-1928(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -2184(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -2200(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#59:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2056(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-2040(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -2216(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -2232(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#60:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2168(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-2152(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -2248(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -2264(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#61:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2232(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2264(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-2216(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2248(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2280(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2296(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#62:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2200(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2296(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-2184(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2280(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2312(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2328(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#63:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	vmovsd	spheres+56, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm1, -2336(%ebp)      # 8-byte Spill
	vmovsd	%xmm0, -2344(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#64:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2344(%ebp), %xmm0      # 8-byte Reload
	vmovsd	-2336(%ebp), %xmm1      # 8-byte Reload
	testb	$1, %al
	vmovaps	%xmm1, -2360(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -2376(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#65:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2344(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-2376(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovsd	-2336(%ebp), %xmm2      # 8-byte Reload
	vmovaps	-2360(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	testb	$1, %al
	vmovaps	%xmm2, -2392(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -2408(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#66:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2328(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2392(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-2312(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2408(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2424(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2440(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#67:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+64, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -2456(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -2464(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -2488(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#68:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2464(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-2488(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-2456(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -2504(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2520(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#69:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1000(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2504(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1016(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2520(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2536(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2552(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#70:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+72, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -2568(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -2576(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -2600(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#71:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2576(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-2600(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-2568(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -2616(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2632(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#72:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1064(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2616(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1080(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2632(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2648(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2664(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#73:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	spheres+80, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -2680(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -2688(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -2712(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#74:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2688(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-2712(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-2680(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -2728(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2744(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#75:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1128(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2728(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1144(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2744(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2760(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2776(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#76:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2552(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-2536(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -2792(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -2808(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#77:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2664(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-2648(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -2824(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -2840(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#78:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2776(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-2760(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -2856(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -2872(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#79:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2840(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2872(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-2824(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2856(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2888(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2904(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#80:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2808(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2904(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-2792(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2888(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -2920(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -2936(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#81:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	vmovsd	spheres+88, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm1, -2944(%ebp)      # 8-byte Spill
	vmovsd	%xmm0, -2952(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#82:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2952(%ebp), %xmm0      # 8-byte Reload
	vmovsd	-2944(%ebp), %xmm1      # 8-byte Reload
	testb	$1, %al
	vmovaps	%xmm1, -2968(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -2984(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#83:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-2952(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-2984(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 # xmm0 = xmm1[0],xmm0[0]
	vmovsd	-2944(%ebp), %xmm2      # 8-byte Reload
	vmovaps	-2968(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm2, %xmm3, %xmm2 # xmm2 = xmm3[0],xmm2[0]
	testb	$1, %al
	vmovaps	%xmm2, -3000(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -3016(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#84:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-2936(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3000(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-2920(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3016(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3032(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3048(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#85:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	plane, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -3064(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -3072(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -3096(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#86:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-3072(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-3096(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-3064(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -3112(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3128(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#87:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	plane+24, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -3144(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -3152(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -3176(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#88:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-3152(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-3176(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-3144(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -3192(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3208(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#89:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3112(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3192(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3128(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3208(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3224(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3240(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#90:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	plane+8, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -3256(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -3264(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -3288(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#91:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-3264(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-3288(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-3256(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -3304(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3320(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#92:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	plane+32, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -3336(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -3344(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -3368(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#93:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-3344(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-3368(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-3336(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -3384(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3400(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#94:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3304(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3384(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3320(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3400(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3416(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3432(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#95:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	plane+16, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -3448(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -3456(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -3480(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#96:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-3456(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-3480(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-3448(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -3496(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3512(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#97:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	plane+40, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm1, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -3528(%ebp)      # 16-byte Spill
	vmovsd	%xmm0, -3536(%ebp)      # 8-byte Spill
	vmovaps	%xmm2, -3560(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#98:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovsd	-3536(%ebp), %xmm0      # 8-byte Reload
	vmovaps	-3560(%ebp), %xmm1      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm2 # xmm2 = xmm1[0],xmm0[0]
	vmovaps	-3528(%ebp), %xmm3      # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 # xmm0 = xmm3[0],xmm0[0]
	testb	$1, %al
	vmovaps	%xmm0, -3576(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3592(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#99:                                # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3496(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3576(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3512(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3592(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3608(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3624(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#100:                               # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3432(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3624(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3416(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3608(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3640(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3656(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#101:                               # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3240(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3656(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3224(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3640(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3672(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3688(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#102:                               # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-3672(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm2
	vmovaps	-3688(%ebp), %xmm3      # 16-byte Reload
	vpxor	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -3704(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3720(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -3736(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#103:                               # %for.body.split318.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1000(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3192(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1016(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3208(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3752(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3768(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#104:                               # %for.body.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1064(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3384(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1080(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3400(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3784(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3800(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#105:                               # %for.body.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-1128(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3576(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1144(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3592(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3816(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3832(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#106:                               # %for.body.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3800(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3832(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3784(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3816(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3848(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3864(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#107:                               # %for.body.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3768(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3864(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3752(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3848(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3880(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3896(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#108:                               # %for.body.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	-3896(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3736(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-3880(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3720(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -3912(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3928(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#109:                               # %for.body.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movb	$0, %al
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-3912(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm2
	vmovaps	-3928(%ebp), %xmm3      # 16-byte Reload
	vpxor	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -3944(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -3960(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -3976(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#110:                               # %for.body.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_31 Depth=1
	movl	$0, %eax
	vmovaps	-1192(%ebp), %xmm0      # 16-byte Reload
	movl	%eax, -3980(%ebp)       # 4-byte Spill
	vmovaps	%xmm0, -4008(%ebp)      # 16-byte Spill
	jmp	.LBB3_111
.LBB3_111:                              # %for.body27
                                        #   Parent Loop BB3_31 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-3980(%ebp), %eax       # 4-byte Reload
	vmovaps	-4008(%ebp), %xmm0      # 16-byte Reload
	movb	$0, %cl
	movl	-1196(%ebp), %edx       # 4-byte Reload
	vmovapd	(%edx,%eax,8), %xmm1
	vmovapd	.LCPI3_2, %xmm2
	vmulpd	%xmm2, %xmm1, %xmm1
	movl	-1212(%ebp), %esi       # 4-byte Reload
	vsqrtpd	(%esi,%eax,8), %xmm2
	vmovaps	%xmm1, %xmm3
	testb	$1, %cl
	movl	%eax, -4012(%ebp)       # 4-byte Spill
	vmovaps	%xmm0, -4040(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -4056(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -4072(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4088(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#112:                               # %for.body27.split311
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	.LCPI3_3, %xmm0
	vmovaps	-4072(%ebp), %xmm1      # 16-byte Reload
	vpand	%xmm0, %xmm1, %xmm2
	vmovaps	-4056(%ebp), %xmm3      # 16-byte Reload
	vpand	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -4104(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -4120(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -4136(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4152(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -4168(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#113:                               # %for.body27.split311.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_4, %xmm0
	vmovaps	-4152(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovaps	.LCPI3_1, %xmm2
	vmovaps	-4136(%ebp), %xmm3      # 16-byte Reload
	vpand	%xmm2, %xmm3, %xmm4
	vmovaps	-4120(%ebp), %xmm5      # 16-byte Reload
	vpand	%xmm2, %xmm5, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -4184(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -4200(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -4216(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#114:                               # %for.body27.split311.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4200(%ebp), %xmm0      # 16-byte Reload
	vcvttpd2dq	%xmm0, %xmm1
	vmovaps	.LCPI3_5, %xmm2
	vpaddd	%xmm2, %xmm1, %xmm1
	vmovaps	.LCPI3_6, %xmm2
	vpand	%xmm2, %xmm1, %xmm2
	vcvtdq2pd	%xmm2, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI3_7, %xmm5
	vmulpd	%xmm5, %xmm3, %xmm5
	vmovaps	.LCPI3_8, %xmm6
	vpand	%xmm6, %xmm1, %xmm6
	vpcmpeqd	%xmm4, %xmm6, %xmm4
	vmovaps	.LCPI3_9, %xmm6
	vpand	%xmm6, %xmm1, %xmm1
	vpslld	$29, %xmm1, %xmm1
	vmovaps	%xmm4, %xmm6
	vmovaps	%xmm5, %xmm7
	testb	$1, %al
	vmovaps	%xmm7, -4232(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -4248(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4264(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -4280(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -4296(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -4312(%ebp)      # 16-byte Spill
	vmovaps	%xmm6, -4328(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#115:                               # %for.body27.split311.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_10, %xmm0
	vmovaps	-4280(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -4344(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -4360(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#116:                               # %for.body27.split311.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_11, %xmm0
	vmovaps	-4280(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -4376(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -4392(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#117:                               # %for.body27.split311.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4232(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4168(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4296(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4152(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4408(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4424(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#118:                               # %for.body27.split311.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4344(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4424(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4360(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4408(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4440(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4456(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#119:                               # %for.body27.split311.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4376(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4456(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4392(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4440(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4472(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4488(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#120:                               # %for.body27.split311.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	.LCPI3_6, %xmm0
	vmovaps	-4264(%ebp), %xmm1      # 16-byte Reload
	vpaddd	%xmm0, %xmm1, %xmm0
	vmovaps	-4312(%ebp), %xmm2      # 16-byte Reload
	vpshufd	$98, %xmm2, %xmm3       # xmm3 = xmm2[2,0,2,1]
	vmovaps	-4216(%ebp), %xmm4      # 16-byte Reload
	vpxor	%xmm3, %xmm4, %xmm5
	vmovaps	-4184(%ebp), %xmm6      # 16-byte Reload
	vpxor	%xmm3, %xmm6, %xmm3
	vmovaps	.LCPI3_9, %xmm7
	vpandn	%xmm7, %xmm0, %xmm0
	vpslld	$29, %xmm0, %xmm0
	vmovaps	-4488(%ebp), %xmm7      # 16-byte Reload
	vmulpd	%xmm7, %xmm7, %xmm1
	vmovaps	-4472(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm2
	testb	$1, %al
	vmovaps	%xmm1, -4504(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -4520(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4536(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -4552(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -4568(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#121:                               # %for.body27.split311.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_12, %xmm0
	vmovaps	-4504(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4584(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4600(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#122:                               # %for.body27.split311.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_13, %xmm0
	vmovaps	-4600(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4584(%ebp), %xmm3      # 16-byte Reload
	vaddpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4616(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4632(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#123:                               # %for.body27.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4504(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4632(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4616(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4648(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4664(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#124:                               # %for.body27.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_14, %xmm0
	vmovaps	-4664(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4648(%ebp), %xmm3      # 16-byte Reload
	vaddpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4680(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4696(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#125:                               # %for.body27.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4504(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4696(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4680(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4712(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4728(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#126:                               # %for.body27.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4504(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4728(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4712(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4744(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4760(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#127:                               # %for.body27.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_15, %xmm0
	vmovaps	-4504(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4776(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4792(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#128:                               # %for.body27.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4760(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4792(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4744(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4776(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4808(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4824(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#129:                               # %for.body27.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_16, %xmm0
	vmovaps	-4824(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4808(%ebp), %xmm3      # 16-byte Reload
	vaddpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4840(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4856(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#130:                               # %for.body27.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_17, %xmm0
	vmovaps	-4504(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4872(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4888(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#131:                               # %for.body27.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_18, %xmm0
	vmovaps	-4888(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4872(%ebp), %xmm3      # 16-byte Reload
	vaddpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4904(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4920(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#132:                               # %for.body27.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4504(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4920(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4904(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -4936(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4952(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#133:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_19, %xmm0
	vmovaps	-4952(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm2
	vmovaps	-4936(%ebp), %xmm3      # 16-byte Reload
	vaddpd	%xmm0, %xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -4968(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -4984(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#134:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4504(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4984(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4536(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4968(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5000(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5016(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#135:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4488(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5016(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4472(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5000(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5032(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5048(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#136:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4488(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5048(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4472(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5032(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5064(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5080(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#137:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4248(%ebp), %xmm0      # 16-byte Reload
	vpshufd	$80, %xmm0, %xmm1       # xmm1 = xmm0[0,0,1,1]
	vmovaps	-5064(%ebp), %xmm2      # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm3
	vmovaps	-4328(%ebp), %xmm4      # 16-byte Reload
	vpshufd	$80, %xmm4, %xmm5       # xmm5 = xmm4[0,0,1,1]
	vmovaps	-5080(%ebp), %xmm6      # 16-byte Reload
	vpand	%xmm6, %xmm5, %xmm7
	vmovaps	%xmm3, %xmm0
	testb	$1, %al
	vmovaps	%xmm7, -5096(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -5112(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -5128(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -5144(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -5160(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#138:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5128(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4840(%ebp), %xmm1      # 16-byte Reload
	vpandn	%xmm1, %xmm0, %xmm2
	vmovaps	-5160(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4856(%ebp), %xmm4      # 16-byte Reload
	vpandn	%xmm4, %xmm3, %xmm5
	vmovaps	%xmm2, %xmm6
	testb	$1, %al
	vmovaps	%xmm6, -5176(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5192(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -5208(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#139:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5080(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5096(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5064(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5144(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5224(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5240(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#140:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4856(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5208(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	vmovaps	-4840(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5192(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5256(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5272(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#141:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5096(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5208(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5144(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5192(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5288(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5304(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#142:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5240(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5272(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5224(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5256(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5320(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5336(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#143:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5288(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-4552(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm1, %xmm0, %xmm2
	vmovaps	-5304(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-4520(%ebp), %xmm4      # 16-byte Reload
	vpxor	%xmm4, %xmm3, %xmm5
	vmovaps	%xmm2, %xmm6
	testb	$1, %al
	vmovaps	%xmm6, -5352(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5368(%ebp)      # 16-byte Spill
	vmovaps	%xmm5, -5384(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#144:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4568(%ebp), %xmm0      # 16-byte Reload
	vpshufd	$98, %xmm0, %xmm1       # xmm1 = xmm0[2,0,2,1]
	vmovaps	-5320(%ebp), %xmm2      # 16-byte Reload
	vpxor	%xmm1, %xmm2, %xmm3
	vmovaps	-5336(%ebp), %xmm4      # 16-byte Reload
	vpxor	%xmm1, %xmm4, %xmm1
	vmovaps	%xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5400(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -5416(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -5432(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#145:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4088(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5432(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5416(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -5448(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5464(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#146:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4088(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5384(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5368(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -5480(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5496(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#147:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4088(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmulpd	%xmm0, %xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -5512(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -5528(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#148:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_16, %xmm0
	vmovaps	-5512(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm0
	testb	$1, %al
	vmovaps	%xmm0, -5544(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#149:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5544(%ebp), %xmm0      # 16-byte Reload
	vsqrtpd	%xmm0, %xmm1
	vmovaps	-296(%ebp), %xmm2       # 16-byte Reload
	vmovaps	-5464(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm4
	vmovaps	-312(%ebp), %xmm5       # 16-byte Reload
	vmovaps	-5448(%ebp), %xmm6      # 16-byte Reload
	vmulpd	%xmm6, %xmm5, %xmm7
	testb	$1, %al
	vmovaps	%xmm7, -5560(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -5576(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -5592(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#150:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-376(%ebp), %xmm0       # 16-byte Reload
	vmovaps	-5496(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-392(%ebp), %xmm3       # 16-byte Reload
	vmovaps	-5480(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5608(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5624(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#151:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5576(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-456(%ebp), %xmm1       # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-472(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -5640(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5656(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#152:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5656(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5624(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5640(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5608(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5672(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5688(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#153:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5592(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5688(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5560(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5672(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5704(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5720(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#154:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-536(%ebp), %xmm0       # 16-byte Reload
	vmovaps	-5464(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-552(%ebp), %xmm3       # 16-byte Reload
	vmovaps	-5448(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5736(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5752(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#155:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-616(%ebp), %xmm0       # 16-byte Reload
	vmovaps	-5496(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-632(%ebp), %xmm3       # 16-byte Reload
	vmovaps	-5480(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5768(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5784(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#156:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5576(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-696(%ebp), %xmm1       # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-712(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -5800(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5816(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#157:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5816(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5784(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5800(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5768(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5832(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5848(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#158:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5752(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5848(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5736(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5832(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5864(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5880(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#159:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-776(%ebp), %xmm0       # 16-byte Reload
	vmovaps	-5464(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-792(%ebp), %xmm3       # 16-byte Reload
	vmovaps	-5448(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5896(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5912(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#160:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-856(%ebp), %xmm0       # 16-byte Reload
	vmovaps	-5496(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-872(%ebp), %xmm3       # 16-byte Reload
	vmovaps	-5480(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5928(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5944(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#161:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5576(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-936(%ebp), %xmm1       # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-952(%ebp), %xmm3       # 16-byte Reload
	vmulpd	%xmm3, %xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -5960(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -5976(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#162:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5976(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5944(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5960(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5928(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -5992(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6008(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#163:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5912(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6008(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5896(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5992(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6024(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6040(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#164:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-1336(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5720(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1320(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5704(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6056(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6072(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#165:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-1448(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-5880(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1432(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-5864(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6088(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6104(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#166:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-1560(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6040(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-1544(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-6024(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6120(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6136(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#167:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6104(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6136(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6088(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-6120(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6152(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6168(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#168:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6072(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6168(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6056(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-6152(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6184(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6200(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#169:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6200(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-6184(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -6216(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -6232(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#170:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6216(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-1816(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -6248(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#171:                               # %for.body27.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	-6248(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm2
	vmovmskpd	%xmm2, %eax
	vmovapd	.LCPI3_20, %xmm2
	testl	%eax, %eax
	vmovaps	%xmm2, -6264(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -6280(%ebp)      # 16-byte Spill
	je	.LBB3_178
	jmp	.LBB3_172
.LBB3_172:                              # %if.then.i315
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-6184(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm2
	vmovaps	-6200(%ebp), %xmm3      # 16-byte Reload
	vpxor	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -6296(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6312(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -6328(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#173:                               # %if.then.i315.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6248(%ebp), %xmm0      # 16-byte Reload
	vsqrtpd	%xmm0, %xmm1
	vmovaps	-6328(%ebp), %xmm2      # 16-byte Reload
	vsubpd	%xmm1, %xmm2, %xmm3
	vmovaps	-6312(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm1, %xmm4, %xmm1
	testb	$1, %al
	vmovaps	%xmm1, -6344(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -6360(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#174:                               # %if.then.i315.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	-6344(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vmovapd	.LCPI3_20, %xmm2
	vcmpltpd	%xmm2, %xmm1, %xmm2
	vandpd	%xmm2, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm2
	vmovaps	%xmm0, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -6376(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -6392(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6408(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#175:                               # %if.then.i315.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-6392(%ebp), %xmm0      # 16-byte Reload
	vmovmskpd	%xmm0, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vmovapd	.LCPI3_20, %xmm2
	testl	%eax, %eax
	vmovaps	%xmm2, -6264(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -6280(%ebp)      # 16-byte Spill
	je	.LBB3_178
	jmp	.LBB3_176
.LBB3_176:                              # %if.then37.i373
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	.LCPI3_20, %xmm0
	vmovaps	-6408(%ebp), %xmm1      # 16-byte Reload
	vpandn	%xmm0, %xmm1, %xmm0
	vmovaps	-6344(%ebp), %xmm2      # 16-byte Reload
	vpand	%xmm2, %xmm1, %xmm3
	vpor	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm0, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -6424(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -6440(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#177:                               # %if.then37.i373.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-6440(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6392(%ebp), %xmm1      # 16-byte Reload
	vmovaps	%xmm0, -6264(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -6280(%ebp)      # 16-byte Spill
	jmp	.LBB3_178
.LBB3_178:                              # %ray_sphere_intersect_simd.exit374
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-6264(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6280(%ebp), %xmm1      # 16-byte Reload
	movb	$0, %al
	vmovaps	-5720(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-1944(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm4
	vmovaps	-5704(%ebp), %xmm5      # 16-byte Reload
	vmovaps	-1928(%ebp), %xmm6      # 16-byte Reload
	vmulpd	%xmm6, %xmm5, %xmm7
	testb	$1, %al
	vmovaps	%xmm0, -6456(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -6472(%ebp)      # 16-byte Spill
	vmovaps	%xmm7, -6488(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -6504(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#179:                               # %ray_sphere_intersect_simd.exit374.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5880(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2056(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5864(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2040(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6520(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6536(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#180:                               # %ray_sphere_intersect_simd.exit374.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6040(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2168(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6024(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2152(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6552(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6568(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#181:                               # %ray_sphere_intersect_simd.exit374.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6536(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6568(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6520(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-6552(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6584(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6600(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#182:                               # %ray_sphere_intersect_simd.exit374.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6504(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6600(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6488(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-6584(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6616(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6632(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#183:                               # %ray_sphere_intersect_simd.exit374.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6632(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-6616(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -6648(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -6664(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#184:                               # %ray_sphere_intersect_simd.exit374.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6648(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2424(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -6680(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#185:                               # %ray_sphere_intersect_simd.exit374.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	-6680(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vmovmskpd	%xmm0, %eax
	cmpl	$0, %eax
	vmovaps	-6456(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6472(%ebp), %xmm2      # 16-byte Reload
	vmovaps	%xmm0, -6696(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6712(%ebp)      # 16-byte Spill
	je	.LBB3_193
# BB#186:                               # %if.then.i225
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-6616(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm2
	vmovaps	-6632(%ebp), %xmm3      # 16-byte Reload
	vpxor	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -6728(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6744(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -6760(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#187:                               # %if.then.i225.split313
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6680(%ebp), %xmm0      # 16-byte Reload
	vsqrtpd	%xmm0, %xmm1
	vmovaps	-6760(%ebp), %xmm2      # 16-byte Reload
	vsubpd	%xmm1, %xmm2, %xmm3
	vmovaps	-6744(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm1, %xmm4, %xmm1
	testb	$1, %al
	vmovaps	%xmm1, -6776(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -6792(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#188:                               # %if.then.i225.split312
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	-6776(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vmovaps	-6456(%ebp), %xmm2      # 16-byte Reload
	vcmpltpd	%xmm2, %xmm1, %xmm3
	vandpd	%xmm3, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -6808(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -6824(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -6840(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#189:                               # %if.then.i225.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-6824(%ebp), %xmm0      # 16-byte Reload
	vmovmskpd	%xmm0, %eax
	cmpl	$0, %eax
	vmovaps	-6456(%ebp), %xmm1      # 16-byte Reload
	vmovaps	-6472(%ebp), %xmm2      # 16-byte Reload
	vmovaps	%xmm1, -6696(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6712(%ebp)      # 16-byte Spill
	je	.LBB3_193
# BB#190:                               # %if.then37.i283
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6840(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6456(%ebp), %xmm1      # 16-byte Reload
	vpandn	%xmm1, %xmm0, %xmm2
	vmovaps	-6776(%ebp), %xmm3      # 16-byte Reload
	vpand	%xmm3, %xmm0, %xmm4
	vpor	%xmm2, %xmm4, %xmm2
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -6856(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6872(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#191:                               # %if.then37.i283.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6840(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6472(%ebp), %xmm1      # 16-byte Reload
	vpor	%xmm1, %xmm0, %xmm2
	vmovaps	%xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -6888(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -6904(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#192:                               # %if.then37.i283.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-6872(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6904(%ebp), %xmm1      # 16-byte Reload
	vmovaps	%xmm0, -6696(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -6712(%ebp)      # 16-byte Spill
	jmp	.LBB3_193
.LBB3_193:                              # %ray_sphere_intersect_simd.exit284
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-6696(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6712(%ebp), %xmm1      # 16-byte Reload
	movb	$0, %al
	vmovaps	-5720(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-2552(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm4
	vmovaps	-5704(%ebp), %xmm5      # 16-byte Reload
	vmovaps	-2536(%ebp), %xmm6      # 16-byte Reload
	vmulpd	%xmm6, %xmm5, %xmm7
	testb	$1, %al
	vmovaps	%xmm0, -6920(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -6936(%ebp)      # 16-byte Spill
	vmovaps	%xmm7, -6952(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -6968(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#194:                               # %ray_sphere_intersect_simd.exit284.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5880(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2664(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5864(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2648(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -6984(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7000(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#195:                               # %ray_sphere_intersect_simd.exit284.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6040(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-2776(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6024(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-2760(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -7016(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7032(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#196:                               # %ray_sphere_intersect_simd.exit284.split.split.split314
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7000(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7032(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6984(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-7016(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -7048(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7064(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#197:                               # %ray_sphere_intersect_simd.exit284.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6968(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7064(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6952(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-7048(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -7080(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7096(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#198:                               # %ray_sphere_intersect_simd.exit284.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7096(%ebp), %xmm0      # 16-byte Reload
	vmulpd	%xmm0, %xmm0, %xmm1
	vmovaps	-7080(%ebp), %xmm2      # 16-byte Reload
	vmulpd	%xmm2, %xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -7112(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -7128(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#199:                               # %ray_sphere_intersect_simd.exit284.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7112(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3032(%ebp), %xmm1      # 16-byte Reload
	vsubpd	%xmm1, %xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -7144(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#200:                               # %ray_sphere_intersect_simd.exit284.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	-7144(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vmovmskpd	%xmm0, %eax
	cmpl	$0, %eax
	vmovaps	-6920(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6936(%ebp), %xmm2      # 16-byte Reload
	vmovaps	%xmm0, -7160(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7176(%ebp)      # 16-byte Spill
	je	.LBB3_208
# BB#201:                               # %if.then.i189
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	.LCPI3_1, %xmm0
	vmovaps	-7080(%ebp), %xmm1      # 16-byte Reload
	vpxor	%xmm0, %xmm1, %xmm2
	vmovaps	-7096(%ebp), %xmm3      # 16-byte Reload
	vpxor	%xmm0, %xmm3, %xmm0
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -7192(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7208(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -7224(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#202:                               # %if.then.i189.split315
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7144(%ebp), %xmm0      # 16-byte Reload
	vsqrtpd	%xmm0, %xmm1
	vmovaps	-7224(%ebp), %xmm2      # 16-byte Reload
	vsubpd	%xmm1, %xmm2, %xmm3
	vmovaps	-7208(%ebp), %xmm4      # 16-byte Reload
	vsubpd	%xmm1, %xmm4, %xmm1
	testb	$1, %al
	vmovaps	%xmm1, -7240(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -7256(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#203:                               # %if.then.i189.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	-7240(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vmovaps	-6920(%ebp), %xmm2      # 16-byte Reload
	vcmpltpd	%xmm2, %xmm1, %xmm3
	vandpd	%xmm3, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -7272(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -7288(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -7304(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#204:                               # %if.then.i189.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-7288(%ebp), %xmm0      # 16-byte Reload
	vmovmskpd	%xmm0, %eax
	cmpl	$0, %eax
	vmovaps	-6920(%ebp), %xmm1      # 16-byte Reload
	vmovaps	-6936(%ebp), %xmm2      # 16-byte Reload
	vmovaps	%xmm1, -7160(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7176(%ebp)      # 16-byte Spill
	je	.LBB3_208
# BB#205:                               # %if.then37.i
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7304(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6920(%ebp), %xmm1      # 16-byte Reload
	vpandn	%xmm1, %xmm0, %xmm2
	vmovaps	-7240(%ebp), %xmm3      # 16-byte Reload
	vpand	%xmm3, %xmm0, %xmm4
	vpor	%xmm2, %xmm4, %xmm2
	vmovaps	%xmm2, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -7320(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7336(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#206:                               # %if.then37.i.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7304(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-6936(%ebp), %xmm1      # 16-byte Reload
	vpor	%xmm1, %xmm0, %xmm2
	vmovaps	%xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -7352(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7368(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#207:                               # %if.then37.i.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-7336(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7368(%ebp), %xmm1      # 16-byte Reload
	vmovaps	%xmm0, -7160(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -7176(%ebp)      # 16-byte Spill
	jmp	.LBB3_208
.LBB3_208:                              # %ray_sphere_intersect_simd.exit
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-7160(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7176(%ebp), %xmm1      # 16-byte Reload
	movb	$0, %al
	vmovaps	-5720(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-3192(%ebp), %xmm3      # 16-byte Reload
	vmulpd	%xmm3, %xmm2, %xmm4
	vmovaps	-5704(%ebp), %xmm5      # 16-byte Reload
	vmovaps	-3208(%ebp), %xmm6      # 16-byte Reload
	vmulpd	%xmm6, %xmm5, %xmm7
	testb	$1, %al
	vmovaps	%xmm0, -7384(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -7400(%ebp)      # 16-byte Spill
	vmovaps	%xmm7, -7416(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -7432(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#209:                               # %ray_sphere_intersect_simd.exit.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-5880(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3384(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-5864(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3400(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -7448(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7464(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#210:                               # %ray_sphere_intersect_simd.exit.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-6040(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-3576(%ebp), %xmm1      # 16-byte Reload
	vmulpd	%xmm1, %xmm0, %xmm2
	vmovaps	-6024(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-3592(%ebp), %xmm4      # 16-byte Reload
	vmulpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -7480(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7496(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#211:                               # %ray_sphere_intersect_simd.exit.split.split.split317
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7464(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7496(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-7448(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-7480(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -7512(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7528(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#212:                               # %ray_sphere_intersect_simd.exit.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7432(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7528(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-7416(%ebp), %xmm3      # 16-byte Reload
	vmovaps	-7512(%ebp), %xmm4      # 16-byte Reload
	vaddpd	%xmm4, %xmm3, %xmm5
	testb	$1, %al
	vmovaps	%xmm5, -7544(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7560(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#213:                               # %ray_sphere_intersect_simd.exit.split.split.split.split316
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	.LCPI3_3, %xmm0
	vmovaps	-7544(%ebp), %xmm1      # 16-byte Reload
	vpand	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -7576(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -7592(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#214:                               # %ray_sphere_intersect_simd.exit.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovapd	.LCPI3_21, %xmm0
	vmovaps	-7592(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vmovaps	-3976(%ebp), %xmm2      # 16-byte Reload
	vmovaps	-7560(%ebp), %xmm3      # 16-byte Reload
	vdivpd	%xmm3, %xmm2, %xmm4
	vmovaps	-3960(%ebp), %xmm5      # 16-byte Reload
	vmovaps	-7544(%ebp), %xmm6      # 16-byte Reload
	vdivpd	%xmm6, %xmm5, %xmm7
	testb	$1, %al
	vmovaps	%xmm7, -7608(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -7624(%ebp)      # 16-byte Spill
	vmovaps	%xmm4, -7640(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#215:                               # %ray_sphere_intersect_simd.exit.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7624(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7608(%ebp), %xmm1      # 16-byte Reload
	vandpd	%xmm1, %xmm0, %xmm2
	vmovaps	%xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -7656(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7672(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#216:                               # %ray_sphere_intersect_simd.exit.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	-7672(%ebp), %xmm1      # 16-byte Reload
	vcmpltpd	%xmm1, %xmm0, %xmm0
	vmovaps	-7384(%ebp), %xmm2      # 16-byte Reload
	vcmpltpd	%xmm2, %xmm1, %xmm3
	vandpd	%xmm3, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm3
	vmovaps	%xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -7688(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -7704(%ebp)      # 16-byte Spill
	vmovaps	%xmm3, -7720(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#217:                               # %ray_sphere_intersect_simd.exit.split.split.split.split.split.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-7704(%ebp), %xmm0      # 16-byte Reload
	vmovmskpd	%xmm0, %eax
	cmpl	$0, %eax
	vmovaps	-7400(%ebp), %xmm1      # 16-byte Reload
	vmovaps	%xmm1, -7736(%ebp)      # 16-byte Spill
	je	.LBB3_220
# BB#218:                               # %if.then.i
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-7720(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7400(%ebp), %xmm1      # 16-byte Reload
	vpor	%xmm1, %xmm0, %xmm2
	vmovaps	%xmm2, %xmm3
	testb	$1, %al
	vmovaps	%xmm3, -7752(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7768(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#219:                               # %if.then.i.split
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-7768(%ebp), %xmm0      # 16-byte Reload
	vmovaps	%xmm0, -7736(%ebp)      # 16-byte Spill
	jmp	.LBB3_220
.LBB3_220:                              # %ray_plane_intersect_simd.exit
                                        #   in Loop: Header=BB3_111 Depth=2
	vmovaps	-7736(%ebp), %xmm0      # 16-byte Reload
	movb	$0, %al
	vmovaps	.LCPI3_16, %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vmovaps	%xmm0, %xmm2
	testb	$1, %al
	vmovaps	%xmm2, -7784(%ebp)      # 16-byte Spill
	vmovaps	%xmm0, -7800(%ebp)      # 16-byte Spill
	vmovaps	%xmm1, -7816(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#221:                               # %ray_plane_intersect_simd.exit.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movb	$0, %al
	vmovaps	-4040(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7816(%ebp), %xmm1      # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm2
	vmovaps	-7800(%ebp), %xmm3      # 16-byte Reload
	vaddpd	%xmm3, %xmm0, %xmm4
	testb	$1, %al
	vmovaps	%xmm4, -7832(%ebp)      # 16-byte Spill
	vmovaps	%xmm2, -7848(%ebp)      # 16-byte Spill
	jne	.LBB3_230
# BB#222:                               # %ray_plane_intersect_simd.exit.split.split
                                        #   in Loop: Header=BB3_111 Depth=2
	movl	-4012(%ebp), %eax       # 4-byte Reload
	addl	$2, %eax
	cmpl	$16, %eax
	vmovaps	-7832(%ebp), %xmm0      # 16-byte Reload
	movl	%eax, -3980(%ebp)       # 4-byte Spill
	vmovaps	%xmm0, -4008(%ebp)      # 16-byte Spill
	jl	.LBB3_111
# BB#223:                               # %for.end99
                                        #   in Loop: Header=BB3_31 Depth=1
	movl	-1244(%ebp), %eax       # 4-byte Reload
	movl	%eax, %esp
	movl	-1168(%ebp), %ecx       # 4-byte Reload
	addl	$1, %ecx
	cmpl	$16, %ecx
	vmovaps	-7832(%ebp), %xmm0      # 16-byte Reload
	vmovaps	%xmm0, -1160(%ebp)      # 16-byte Spill
	movl	%ecx, -1164(%ebp)       # 4-byte Spill
	jne	.LBB3_31
# BB#224:                               # %for.end102
	vmovaps	-7848(%ebp), %xmm0      # 16-byte Reload
	vmovaps	-7832(%ebp), %xmm1      # 16-byte Reload
	vucomisd	%xmm0, %xmm1
	vmovsd	%xmm1, -7856(%ebp)      # 8-byte Spill
	vmovsd	%xmm0, -7864(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#225:                               # %for.end102.split319
	vmovaps	-7832(%ebp), %xmm0      # 16-byte Reload
	vunpckhpd	%xmm0, %xmm0, %xmm1 # xmm1 = xmm0[1,1]
	vmovaps	-7848(%ebp), %xmm2      # 16-byte Reload
	vunpckhpd	%xmm2, %xmm2, %xmm3 # xmm3 = xmm2[1,1]
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, -7872(%ebp)      # 8-byte Spill
	vmovsd	%xmm3, -7880(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#226:                               # %for.end102.split319.split
	vmovsd	-7864(%ebp), %xmm0      # 8-byte Reload
	vmovsd	-7880(%ebp), %xmm1      # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	-7856(%ebp), %xmm3      # 8-byte Reload
	vmovsd	-7872(%ebp), %xmm4      # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, -7888(%ebp)      # 8-byte Spill
	vmovsd	%xmm5, -7896(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#227:                               # %for.end102.split319.split.split
	movl	$256, %eax              # imm = 0x100
	vmovsd	.LCPI3_22, %xmm0
	vmovsd	-7888(%ebp), %xmm1      # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	-7896(%ebp), %xmm3      # 8-byte Reload
	vsubsd	%xmm3, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	movl	%eax, -7900(%ebp)       # 4-byte Spill
	vmovsd	%xmm2, -7912(%ebp)      # 8-byte Spill
	vmovsd	%xmm0, -7920(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#228:                               # %for.end102.split
	vmovsd	.LCPI3_23, %xmm0
	vmovsd	-7912(%ebp), %xmm1      # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm2
	vmovsd	-7920(%ebp), %xmm3      # 8-byte Reload
	vmulsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm0, -7928(%ebp)      # 8-byte Spill
	jne	.LBB3_230
# BB#229:                               # %for.end102.split.split
	movl	-96(%ebp), %eax         # 4-byte Reload
	vmovsd	-7928(%ebp), %xmm0      # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	%xmm0, 8(%eax)
	vmovsd	%xmm0, 16(%eax)
	leal	-12(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.LBB3_230:                              # %relExit
	leal	.LrelFun, %eax
	leal	.Lfunc3, %ecx
	subl	$16, %esp
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	addl	$16, %esp
	movl	$1, %ecx
	subl	$16, %esp
	movl	$1, (%esp)
	movl	%eax, -7932(%ebp)       # 4-byte Spill
	movl	%ecx, -7936(%ebp)       # 4-byte Spill
	calll	exit
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
	subl	$44, %esp
	vmovsd	48(%esp), %xmm0
	vmovsd	.LCPI4_0, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm0, 32(%esp)         # 8-byte Spill
	jne	.LBB4_2
# BB#1:                                 # %entry.split
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vcvttsd2si	%xmm0, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovsl	%ecx, %eax
	movl	%eax, %ecx
	movb	%cl, %dl
	movb	$-1, %dh
	subl	$255, %eax
	movl	%eax, 28(%esp)          # 4-byte Spill
	movb	%dl, 27(%esp)           # 1-byte Spill
	movb	%dh, 26(%esp)           # 1-byte Spill
	jg	.LBB4_4
# BB#3:                                 # %entry.split
	movb	27(%esp), %al           # 1-byte Reload
	movb	%al, 26(%esp)           # 1-byte Spill
.LBB4_4:                                # %entry.split
	movb	26(%esp), %al           # 1-byte Reload
	movzbl	%al, %eax
	addl	$44, %esp
	ret
.LBB4_2:                                # %relExit
	leal	.LrelFun, %eax
	leal	.Lfunc4, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	movl	$1, %ecx
	movl	$1, (%esp)
	movl	%eax, 20(%esp)          # 4-byte Spill
	movl	%ecx, 16(%esp)          # 4-byte Spill
	calll	exit
	movb	$0, %dl
	movzbl	%dl, %eax
	addl	$44, %esp
	ret
.Ltmp4:
	.size	clamp, .Ltmp4-clamp

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI5_0:
	.quad	4602678819172646912     # double 0.5
.LCPI5_2:
	.quad	-4616189618054758400    # double -1
.LCPI5_3:
	.quad	4607182418800017408     # double 1
.LCPI5_4:
	.quad	4352464011485697175     # double 1.0E-17
.LCPI5_6:
	.quad	4861130398305394688     # double 1.0E+17
.LCPI5_7:
	.quad	4643193623632936960     # double 255.5
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI5_1:
	.quad	-9223372036854775808    # double -0.000000e+00
	.quad	-9223372036854775808    # double -0.000000e+00
.LCPI5_5:
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
	subl	$1420, %esp             # imm = 0x58C
	movl	1452(%esp), %eax
	movl	1448(%esp), %ecx
	movl	1444(%esp), %edx
	movl	1440(%esp), %esi
	imull	$24, %edx, %edi
	imull	%ecx, %edi
	movl	%edi, (%esp)
	movl	%eax, 1268(%esp)        # 4-byte Spill
	movl	%ecx, 1264(%esp)        # 4-byte Spill
	movl	%edx, 1260(%esp)        # 4-byte Spill
	movl	%esi, 1256(%esp)        # 4-byte Spill
	movl	%edi, 1252(%esp)        # 4-byte Spill
	calll	malloc
	movl	$0, %ecx
	movl	%eax, %edx
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	1252(%esp), %eax        # 4-byte Reload
	movl	%eax, 8(%esp)
	movl	%edx, 1248(%esp)        # 4-byte Spill
	movl	%ecx, 1244(%esp)        # 4-byte Spill
	calll	memset
	movl	1264(%esp), %eax        # 4-byte Reload
	cmpl	$0, %eax
	jle	.LBB5_79
# BB#1:                                 # %for.cond6.preheader.lr.ph
                                        # implicit-def: XMM0
	movl	1268(%esp), %eax        # 4-byte Reload
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	testl	%eax, %eax
	setg	%cl
	movl	1260(%esp), %edx        # 4-byte Reload
	testl	%edx, %edx
	setg	%ch
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm0, 1232(%esp)       # 8-byte Spill
	movb	%cl, 1231(%esp)         # 1-byte Spill
	movb	%ch, 1230(%esp)         # 1-byte Spill
	vmovsd	%xmm1, 1216(%esp)       # 8-byte Spill
	jne	.LBB5_80
# BB#2:                                 # %for.cond6.preheader.lr.ph.split
                                        # implicit-def: XMM0
	movl	1260(%esp), %eax        # 4-byte Reload
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm0, 1208(%esp)       # 8-byte Spill
	vmovsd	%xmm1, 1200(%esp)       # 8-byte Spill
	jne	.LBB5_80
# BB#3:                                 # %for.cond6.preheader.lr.ph.split.split79
	vmovsd	.LCPI5_0, %xmm0
	vmovsd	1200(%esp), %xmm1       # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm2
	vmovsd	1208(%esp), %xmm3       # 8-byte Reload
	vmulsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm2, 1192(%esp)       # 8-byte Spill
	vmovsd	%xmm0, 1184(%esp)       # 8-byte Spill
	jne	.LBB5_80
# BB#4:                                 # %for.cond6.preheader.lr.ph.split.split75
                                        # implicit-def: XMM0
	movl	1264(%esp), %eax        # 4-byte Reload
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm0, 1176(%esp)       # 8-byte Spill
	vmovsd	%xmm1, 1168(%esp)       # 8-byte Spill
	jne	.LBB5_80
# BB#5:                                 # %for.cond6.preheader.lr.ph.split.split75.split77
	vmovsd	.LCPI5_0, %xmm0
	vmovsd	1168(%esp), %xmm1       # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm2
	vmovsd	1176(%esp), %xmm3       # 8-byte Reload
	vmulsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm2, 1160(%esp)       # 8-byte Spill
	vmovsd	%xmm0, 1152(%esp)       # 8-byte Spill
	jne	.LBB5_80
# BB#6:                                 # %for.cond6.preheader.lr.ph.split.split75.split
	leal	1368(%esp), %eax
	leal	1376(%esp), %ecx
	leal	1384(%esp), %edx
	leal	1392(%esp), %esi
	leal	1304(%esp), %edi
	leal	1360(%esp), %ebx
	leal	1280(%esp), %ebp
	movl	%eax, 1148(%esp)        # 4-byte Spill
	leal	1288(%esp), %eax
	movl	%eax, 1144(%esp)        # 4-byte Spill
	leal	1296(%esp), %eax
	movl	%eax, 1140(%esp)        # 4-byte Spill
	leal	1312(%esp), %eax
	movl	%eax, 1136(%esp)        # 4-byte Spill
	leal	1336(%esp), %eax
	movl	%eax, 1132(%esp)        # 4-byte Spill
	movl	1268(%esp), %eax        # 4-byte Reload
	imull	%eax, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	leal	1328(%esp), %eax
	movl	%eax, 1128(%esp)        # 4-byte Spill
	leal	1320(%esp), %eax
	movl	%eax, 1124(%esp)        # 4-byte Spill
	movl	%edi, %eax
	movl	%eax, 1120(%esp)        # 4-byte Spill
	leal	1408(%esp), %eax
	movl	%eax, 1116(%esp)        # 4-byte Spill
	leal	1400(%esp), %eax
	movl	%eax, 1112(%esp)        # 4-byte Spill
	movl	%esi, %eax
	movl	%eax, 1108(%esp)        # 4-byte Spill
	movl	1148(%esp), %eax        # 4-byte Reload
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	movl	%ebp, 1104(%esp)        # 4-byte Spill
	movl	%ecx, 1100(%esp)        # 4-byte Spill
	movl	%edx, 1096(%esp)        # 4-byte Spill
	movl	%esi, 1092(%esp)        # 4-byte Spill
	movl	%edi, 1088(%esp)        # 4-byte Spill
	movl	%ebx, 1084(%esp)        # 4-byte Spill
	vmovsd	%xmm0, 1072(%esp)       # 8-byte Spill
	movl	%eax, 1068(%esp)        # 4-byte Spill
	vmovsd	%xmm1, 1056(%esp)       # 8-byte Spill
	jne	.LBB5_80
# BB#7:                                 # %for.cond6.preheader.lr.ph.split.split
	movl	$0, %eax
	movl	%eax, 1052(%esp)        # 4-byte Spill
	jmp	.LBB5_8
.LBB5_8:                                # %for.cond6.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_11 Depth 2
                                        #       Child Loop BB5_64 Depth 3
                                        #         Child Loop BB5_16 Depth 4
	movl	1052(%esp), %eax        # 4-byte Reload
	movb	1230(%esp), %cl         # 1-byte Reload
	testb	$1, %cl
	movl	%eax, 1048(%esp)        # 4-byte Spill
	jne	.LBB5_9
	jmp	.LBB5_78
.LBB5_9:                                # %for.cond9.preheader.lr.ph
                                        #   in Loop: Header=BB5_8 Depth=1
                                        # implicit-def: XMM0
	movl	1048(%esp), %eax        # 4-byte Reload
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm0, 1040(%esp)       # 8-byte Spill
	vmovsd	%xmm1, 1032(%esp)       # 8-byte Spill
	jne	.LBB5_80
# BB#10:                                # %for.cond9.preheader.lr.ph.split
                                        #   in Loop: Header=BB5_8 Depth=1
	movl	$0, %eax
	movl	1048(%esp), %ecx        # 4-byte Reload
	movl	1260(%esp), %edx        # 4-byte Reload
	imull	%edx, %ecx
	movl	%ecx, 1028(%esp)        # 4-byte Spill
	movl	%eax, 1024(%esp)        # 4-byte Spill
.LBB5_11:                               # %for.cond9.preheader
                                        #   Parent Loop BB5_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_64 Depth 3
                                        #         Child Loop BB5_16 Depth 4
	movl	1024(%esp), %eax        # 4-byte Reload
	movb	1231(%esp), %cl         # 1-byte Reload
	testb	$1, %cl
	movl	%eax, 1020(%esp)        # 4-byte Spill
	jne	.LBB5_13
# BB#12:                                # %for.cond9.preheader.for.end67_crit_edge
                                        #   in Loop: Header=BB5_11 Depth=2
	movl	1020(%esp), %eax        # 4-byte Reload
	movl	1028(%esp), %ecx        # 4-byte Reload
	addl	%ecx, %eax
	imull	$3, %eax, %eax
	movl	%eax, %edx
	shll	$3, %edx
	movl	1248(%esp), %esi        # 4-byte Reload
	addl	%edx, %esi
	movl	%eax, %edx
	addl	$1, %edx
	movl	%edx, %edi
	shll	$3, %edi
	movl	1248(%esp), %ebx        # 4-byte Reload
	addl	%edi, %ebx
	movl	%eax, %edi
	addl	$2, %edi
	movl	%edi, %ebp
	shll	$3, %ebp
	movl	1248(%esp), %ecx        # 4-byte Reload
	addl	%ebp, %ecx
	movl	%ecx, 1016(%esp)        # 4-byte Spill
	movl	%esi, 1012(%esp)        # 4-byte Spill
	movl	%edx, 1008(%esp)        # 4-byte Spill
	movl	%ebx, 1004(%esp)        # 4-byte Spill
	movl	%edi, 1000(%esp)        # 4-byte Spill
	movl	%eax, 996(%esp)         # 4-byte Spill
	jmp	.LBB5_71
.LBB5_13:                               # %for.cond12.preheader.lr.ph.split.us
                                        #   in Loop: Header=BB5_11 Depth=2
                                        # implicit-def: XMM0
	movl	1020(%esp), %eax        # 4-byte Reload
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm0, 984(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 976(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#14:                                # %for.cond12.preheader.lr.ph.split.us.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movl	$0, %eax
	movl	1020(%esp), %ecx        # 4-byte Reload
	movl	1028(%esp), %edx        # 4-byte Reload
	addl	%edx, %ecx
	imull	$3, %ecx, %ecx
	movl	%ecx, %esi
	shll	$3, %esi
	movl	1248(%esp), %edi        # 4-byte Reload
	addl	%esi, %edi
	movl	%ecx, %esi
	addl	$1, %esi
	movl	%esi, %ebx
	shll	$3, %ebx
	movl	1248(%esp), %ebp        # 4-byte Reload
	addl	%ebx, %ebp
	movl	%ecx, %ebx
	addl	$2, %ebx
	movl	%ebx, %edx
	shll	$3, %edx
	movl	%eax, 972(%esp)         # 4-byte Spill
	movl	1248(%esp), %eax        # 4-byte Reload
	addl	%edx, %eax
	movl	972(%esp), %edx         # 4-byte Reload
	movl	%eax, 968(%esp)         # 4-byte Spill
	movl	%ebx, 964(%esp)         # 4-byte Spill
	movl	%ecx, 960(%esp)         # 4-byte Spill
	movl	%edi, 956(%esp)         # 4-byte Spill
	movl	%esi, 952(%esp)         # 4-byte Spill
	movl	%ebp, 948(%esp)         # 4-byte Spill
	movl	%edx, 944(%esp)         # 4-byte Spill
	jmp	.LBB5_64
.LBB5_15:                               # %for.inc65.us
                                        #   in Loop: Header=BB5_64 Depth=3
	movl	940(%esp), %eax         # 4-byte Reload
	addl	$1, %eax
	movl	1268(%esp), %ecx        # 4-byte Reload
	cmpl	%ecx, %eax
	movl	968(%esp), %edx         # 4-byte Reload
	movl	964(%esp), %esi         # 4-byte Reload
	movl	948(%esp), %edi         # 4-byte Reload
	movl	952(%esp), %ebx         # 4-byte Reload
	movl	956(%esp), %ebp         # 4-byte Reload
	movl	960(%esp), %ecx         # 4-byte Reload
	movl	%ecx, 996(%esp)         # 4-byte Spill
	movl	%eax, 944(%esp)         # 4-byte Spill
	movl	%edx, 1016(%esp)        # 4-byte Spill
	movl	%esi, 1000(%esp)        # 4-byte Spill
	movl	%edi, 1004(%esp)        # 4-byte Spill
	movl	%ebx, 1008(%esp)        # 4-byte Spill
	movl	%ebp, 1012(%esp)        # 4-byte Spill
	je	.LBB5_71
	jmp	.LBB5_64
.LBB5_16:                               # %for.body14.us
                                        #   Parent Loop BB5_8 Depth=1
                                        #     Parent Loop BB5_11 Depth=2
                                        #       Parent Loop BB5_64 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	936(%esp), %eax         # 4-byte Reload
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	movl	%eax, 932(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 920(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 912(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#17:                                # %for.body14.us.split68
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	912(%esp), %xmm0        # 8-byte Reload
	vmovsd	1216(%esp), %xmm1       # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	920(%esp), %xmm3        # 8-byte Reload
	vmovsd	1232(%esp), %xmm4       # 8-byte Reload
	vdivsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 904(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 896(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#18:                                # %for.body14.us.split67
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	976(%esp), %xmm0        # 8-byte Reload
	vmovsd	904(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	984(%esp), %xmm3        # 8-byte Reload
	vmovsd	896(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 888(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 880(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#19:                                # %for.body14.us.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	888(%esp), %xmm0        # 8-byte Reload
	vmovsd	1192(%esp), %xmm1       # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	880(%esp), %xmm3        # 8-byte Reload
	vmovsd	1184(%esp), %xmm4       # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 872(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 864(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#20:                                # %for.body14.us.split.split76
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	872(%esp), %xmm0        # 8-byte Reload
	vmovsd	1192(%esp), %xmm1       # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	864(%esp), %xmm3        # 8-byte Reload
	vmovsd	1184(%esp), %xmm4       # 8-byte Reload
	vdivsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 856(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 848(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#21:                                # %for.body14.us.split.split74
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	vmovsd	.LCPI5_2, %xmm0
	leal	1368(%esp), %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	vmovups	%xmm1, (%ecx)
	movl	$0, 20(%ecx)
	movl	$0, 16(%ecx)
	movl	1108(%esp), %ecx        # 4-byte Reload
	vmovsd	848(%esp), %xmm1        # 8-byte Reload
	vmovsd	%xmm1, (%ecx)
	movl	1112(%esp), %edx        # 4-byte Reload
	vmovsd	840(%esp), %xmm2        # 8-byte Reload
	vmovsd	%xmm2, (%edx)
	movl	1116(%esp), %esi        # 4-byte Reload
	vmovsd	%xmm0, (%esi)
	vmovsd	856(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm3
	vmulsd	%xmm1, %xmm1, %xmm4
	vucomisd	%xmm3, %xmm4
	movl	%eax, 836(%esp)         # 4-byte Spill
	vmovsd	%xmm3, 824(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 816(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#22:                                # %for.body14.us.split.split69
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	808(%esp), %xmm0        # 8-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	840(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm2, %xmm3
	vucomisd	%xmm1, %xmm3
	vmovsd	%xmm1, 800(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 792(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#23:                                # %for.body14.us.split.split66
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	824(%esp), %xmm0        # 8-byte Reload
	vmovsd	800(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	816(%esp), %xmm3        # 8-byte Reload
	vmovsd	792(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 784(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 776(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#24:                                # %for.body14.us.split.split66.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	$1, %eax
	vmovsd	.LCPI5_3, %xmm0
	vmovsd	784(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm0, %xmm1, %xmm2
	vmovsd	776(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm2, %xmm0
	movl	%eax, 772(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 760(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#25:                                # %for.body14.us.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	.LCPI5_4, %xmm0
	movl	%esp, %eax
	vmovsd	760(%esp), %xmm1        # 8-byte Reload
	vmovsd	%xmm1, (%eax)
	vmovsd	%xmm0, 752(%esp)        # 8-byte Spill
	calll	sqrt
	fstpl	1272(%esp)
	vmovsd	1272(%esp), %xmm0
	vmovsd	.LCPI5_5, %xmm1
	vandpd	%xmm1, %xmm0, %xmm1
	vmovsd	752(%esp), %xmm2        # 8-byte Reload
	vucomisd	%xmm2, %xmm1
	vmovsd	%xmm0, 744(%esp)        # 8-byte Spill
	jbe	.LBB5_30
# BB#26:                                # %if.then.i.us
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	856(%esp), %xmm0        # 8-byte Reload
	vmovsd	744(%esp), %xmm1        # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	848(%esp), %xmm3        # 8-byte Reload
	vdivsd	%xmm1, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 736(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#27:                                # %if.then.i.us.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1108(%esp), %eax        # 4-byte Reload
	vmovsd	736(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	808(%esp), %xmm1        # 8-byte Reload
	vmovsd	744(%esp), %xmm2        # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vmovsd	840(%esp), %xmm4        # 8-byte Reload
	vdivsd	%xmm2, %xmm4, %xmm5
	vucomisd	%xmm3, %xmm5
	vmovsd	%xmm5, 728(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#28:                                # %if.then.i.us.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	vmovsd	.LCPI5_2, %xmm0
	movl	1112(%esp), %ecx        # 4-byte Reload
	vmovsd	728(%esp), %xmm1        # 8-byte Reload
	vmovsd	%xmm1, (%ecx)
	vmovsd	744(%esp), %xmm2        # 8-byte Reload
	vdivsd	%xmm2, %xmm0, %xmm3
	vdivsd	%xmm2, %xmm0, %xmm0
	vucomisd	%xmm3, %xmm0
	movl	%eax, 724(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 712(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#29:                                # %if.then.i.us.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1116(%esp), %eax        # 4-byte Reload
	vmovsd	712(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
.LBB5_30:                               # %vnormalize.exit.us
                                        #   in Loop: Header=BB5_16 Depth=4
	leal	1304(%esp), %eax
	leal	1368(%esp), %ecx
	leal	spheres, %edx
	vmovsd	.LCPI5_6, %xmm0
	movl	1088(%esp), %esi        # 4-byte Reload
	vmovsd	%xmm0, (%esi)
	movl	1084(%esp), %edi        # 4-byte Reload
	movl	$0, (%edi)
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	ray_sphere_intersect
	leal	1304(%esp), %eax
	leal	1368(%esp), %ecx
	leal	spheres, %edx
	addl	$32, %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	ray_sphere_intersect
	leal	1304(%esp), %eax
	leal	1368(%esp), %ecx
	leal	spheres, %edx
	addl	$64, %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	ray_sphere_intersect
	vmovsd	plane+24, %xmm0
	vmovsd	plane+32, %xmm1
	vmovsd	plane+40, %xmm2
	movl	1092(%esp), %eax        # 4-byte Reload
	vmovsd	(%eax), %xmm3
	movl	1112(%esp), %ecx        # 4-byte Reload
	vmovsd	(%ecx), %xmm4
	movl	1116(%esp), %edx        # 4-byte Reload
	vmovsd	(%edx), %xmm5
	vmulsd	%xmm3, %xmm0, %xmm6
	vmulsd	%xmm3, %xmm0, %xmm7
	vucomisd	%xmm6, %xmm7
	vmovsd	%xmm0, 704(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 696(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 688(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 680(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 672(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 664(%esp)        # 8-byte Spill
	vmovsd	%xmm6, 656(%esp)        # 8-byte Spill
	vmovsd	%xmm7, 648(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#31:                                # %vnormalize.exit.us.split70
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	696(%esp), %xmm0        # 8-byte Reload
	vmovsd	672(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 640(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 632(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#32:                                # %vnormalize.exit.us.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	656(%esp), %xmm0        # 8-byte Reload
	vmovsd	640(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	648(%esp), %xmm3        # 8-byte Reload
	vmovsd	632(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 624(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 616(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#33:                                # %vnormalize.exit.us.split.split80
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	688(%esp), %xmm0        # 8-byte Reload
	vmovsd	664(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 608(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 600(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#34:                                # %vnormalize.exit.us.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	624(%esp), %xmm0        # 8-byte Reload
	vmovsd	608(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	616(%esp), %xmm3        # 8-byte Reload
	vmovsd	600(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 592(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 584(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#35:                                # %vnormalize.exit.us.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	.LCPI5_4, %xmm0
	vmovsd	.LCPI5_5, %xmm1
	vmovsd	584(%esp), %xmm2        # 8-byte Reload
	vandpd	%xmm1, %xmm2, %xmm1
	vucomisd	%xmm1, %xmm0
	ja	.LBB5_58
# BB#36:                                # %if.end.i.us
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	plane+8, %xmm0
	vmovsd	plane, %xmm1
	vmovsd	696(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm3, %xmm0
	vmovsd	%xmm3, 576(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 568(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 560(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#37:                                # %if.end.i.us.split73
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	704(%esp), %xmm0        # 8-byte Reload
	vmovsd	568(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 552(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 544(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#38:                                # %if.end.i.us.split72
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	plane+16, %xmm0
	vmovsd	688(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm0, %xmm1, %xmm2
	vmulsd	%xmm0, %xmm1, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm2, 536(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 528(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#39:                                # %if.end.i.us.split72.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	576(%esp), %xmm0        # 8-byte Reload
	vmovsd	552(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	560(%esp), %xmm3        # 8-byte Reload
	vmovsd	544(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 520(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 512(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#40:                                # %if.end.i.us.split72.split.split78
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	520(%esp), %xmm0        # 8-byte Reload
	vmovsd	536(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	512(%esp), %xmm3        # 8-byte Reload
	vmovsd	528(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 504(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 496(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#41:                                # %if.end.i.us.split72.split.split78.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1148(%esp), %eax        # 4-byte Reload
	vmovsd	(%eax), %xmm0
	movl	1100(%esp), %ecx        # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	1096(%esp), %edx        # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vmovsd	704(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm0, %xmm3, %xmm4
	vmulsd	%xmm0, %xmm3, %xmm5
	vucomisd	%xmm4, %xmm5
	vmovsd	%xmm0, 488(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 480(%esp)        # 8-byte Spill
	vmovsd	%xmm2, 472(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 464(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 456(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#42:                                # %if.end.i.us.split72.split.split78.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	696(%esp), %xmm0        # 8-byte Reload
	vmovsd	480(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 448(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 440(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#43:                                # %if.end.i.us.split72.split.split78.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	464(%esp), %xmm0        # 8-byte Reload
	vmovsd	448(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	456(%esp), %xmm3        # 8-byte Reload
	vmovsd	440(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 432(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 424(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#44:                                # %if.end.i.us.split72.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	688(%esp), %xmm0        # 8-byte Reload
	vmovsd	472(%esp), %xmm1        # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm3
	vucomisd	%xmm2, %xmm3
	vmovsd	%xmm2, 416(%esp)        # 8-byte Spill
	vmovsd	%xmm3, 408(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#45:                                # %if.end.i.us.split72.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	432(%esp), %xmm0        # 8-byte Reload
	vmovsd	416(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	424(%esp), %xmm3        # 8-byte Reload
	vmovsd	408(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 400(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 392(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#46:                                # %if.end.i.us.split72.split.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	400(%esp), %xmm0        # 8-byte Reload
	vmovsd	504(%esp), %xmm1        # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	392(%esp), %xmm3        # 8-byte Reload
	vmovsd	496(%esp), %xmm4        # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 384(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 376(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#47:                                # %if.end.i.us.split72.split.split.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	.LCPI5_1, %xmm0
	vmovsd	376(%esp), %xmm1        # 8-byte Reload
	vxorpd	%xmm0, %xmm1, %xmm2
	vmovsd	384(%esp), %xmm3        # 8-byte Reload
	vxorpd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm0, %xmm2
	vmovsd	%xmm2, 368(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 360(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#48:                                # %if.end.i.us.split72.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	360(%esp), %xmm0        # 8-byte Reload
	vmovsd	592(%esp), %xmm1        # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	368(%esp), %xmm3        # 8-byte Reload
	vmovsd	584(%esp), %xmm4        # 8-byte Reload
	vdivsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 352(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 344(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#49:                                # %if.end.i.us.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	344(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm0, %xmm1
	jbe	.LBB5_58
# BB#50:                                # %land.lhs.true.i.us
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1088(%esp), %eax        # 4-byte Reload
	vmovsd	(%eax), %xmm0
	vmovsd	344(%esp), %xmm1        # 8-byte Reload
	vucomisd	%xmm1, %xmm0
	jbe	.LBB5_58
# BB#51:                                # %if.then10.i.us
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1088(%esp), %eax        # 4-byte Reload
	vmovsd	344(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	1084(%esp), %ecx        # 4-byte Reload
	movl	$1, (%ecx)
	vmovsd	352(%esp), %xmm1        # 8-byte Reload
	vmovsd	680(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm1, %xmm3
	vmulsd	%xmm2, %xmm0, %xmm4
	vucomisd	%xmm3, %xmm4
	vmovsd	%xmm3, 336(%esp)        # 8-byte Spill
	vmovsd	%xmm4, 328(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#52:                                # %if.then10.i.us.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	488(%esp), %xmm0        # 8-byte Reload
	vmovsd	336(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	328(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 320(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#53:                                # %if.then10.i.us.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1136(%esp), %eax        # 4-byte Reload
	vmovsd	320(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	352(%esp), %xmm1        # 8-byte Reload
	vmovsd	672(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm1, %xmm3
	vmovsd	344(%esp), %xmm4        # 8-byte Reload
	vmulsd	%xmm2, %xmm4, %xmm5
	vucomisd	%xmm3, %xmm5
	vmovsd	%xmm3, 312(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 304(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#54:                                # %if.then10.i.us.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	480(%esp), %xmm0        # 8-byte Reload
	vmovsd	312(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	304(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 296(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#55:                                # %if.then10.i.us.split.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1124(%esp), %eax        # 4-byte Reload
	vmovsd	296(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	vmovsd	352(%esp), %xmm1        # 8-byte Reload
	vmovsd	664(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm2, %xmm1, %xmm3
	vmovsd	344(%esp), %xmm4        # 8-byte Reload
	vmulsd	%xmm2, %xmm4, %xmm5
	vucomisd	%xmm3, %xmm5
	vmovsd	%xmm3, 288(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 280(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#56:                                # %if.then10.i.us.split.split.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	vmovsd	472(%esp), %xmm0        # 8-byte Reload
	vmovsd	288(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	280(%esp), %xmm3        # 8-byte Reload
	vaddsd	%xmm3, %xmm0, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 272(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#57:                                # %if.then10.i.us.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	leal	plane, %eax
	addl	$24, %eax
	movl	$24, %ecx
	movl	1128(%esp), %edx        # 4-byte Reload
	vmovsd	272(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%edx)
	movl	1132(%esp), %esi        # 4-byte Reload
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	movl	$24, 8(%esp)
	movl	%ecx, 268(%esp)         # 4-byte Spill
	calll	memcpy
.LBB5_58:                               # %ray_plane_intersect.exit.us
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	1084(%esp), %eax        # 4-byte Reload
	cmpl	$0, (%eax)
	je	.LBB5_63
# BB#59:                                # %if.then.us
                                        #   in Loop: Header=BB5_16 Depth=4
	leal	1280(%esp), %eax
	leal	1304(%esp), %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	ambient_occlusion
	movl	1104(%esp), %eax        # 4-byte Reload
	vmovsd	(%eax), %xmm0
	movl	956(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vaddsd	%xmm1, %xmm0, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	vmovsd	%xmm0, 256(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#60:                                # %if.then.us.split71
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	956(%esp), %eax         # 4-byte Reload
	vmovsd	256(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	1144(%esp), %ecx        # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	948(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vaddsd	%xmm2, %xmm1, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 248(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#61:                                # %if.then.us.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	948(%esp), %eax         # 4-byte Reload
	vmovsd	248(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	1140(%esp), %ecx        # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	movl	968(%esp), %edx         # 4-byte Reload
	vmovsd	(%edx), %xmm2
	vaddsd	%xmm2, %xmm1, %xmm3
	vaddsd	%xmm2, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm1, 240(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#62:                                # %if.then.us.split.split
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	968(%esp), %eax         # 4-byte Reload
	vmovsd	240(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
.LBB5_63:                               # %if.end.us
                                        #   in Loop: Header=BB5_16 Depth=4
	movl	932(%esp), %eax         # 4-byte Reload
	addl	$1, %eax
	movl	1268(%esp), %ecx        # 4-byte Reload
	cmpl	%ecx, %eax
	movl	%eax, 936(%esp)         # 4-byte Spill
	je	.LBB5_15
	jmp	.LBB5_16
.LBB5_64:                               # %for.body14.lr.ph.us
                                        #   Parent Loop BB5_8 Depth=1
                                        #     Parent Loop BB5_11 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB5_16 Depth 4
	movl	944(%esp), %eax         # 4-byte Reload
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	movl	%eax, 940(%esp)         # 4-byte Spill
	vmovsd	%xmm0, 232(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 224(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#65:                                # %for.body14.lr.ph.us.split
                                        #   in Loop: Header=BB5_64 Depth=3
	vmovsd	224(%esp), %xmm0        # 8-byte Reload
	vmovsd	1216(%esp), %xmm1       # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	232(%esp), %xmm3        # 8-byte Reload
	vmovsd	1232(%esp), %xmm4       # 8-byte Reload
	vdivsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 216(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 208(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#66:                                # %for.body14.lr.ph.us.split.split
                                        #   in Loop: Header=BB5_64 Depth=3
	vmovsd	1032(%esp), %xmm0       # 8-byte Reload
	vmovsd	216(%esp), %xmm1        # 8-byte Reload
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	1040(%esp), %xmm3       # 8-byte Reload
	vmovsd	208(%esp), %xmm4        # 8-byte Reload
	vaddsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 200(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 192(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#67:                                # %for.body14.lr.ph.us.split.split.split
                                        #   in Loop: Header=BB5_64 Depth=3
	vmovsd	200(%esp), %xmm0        # 8-byte Reload
	vmovsd	1160(%esp), %xmm1       # 8-byte Reload
	vsubsd	%xmm1, %xmm0, %xmm2
	vmovsd	192(%esp), %xmm3        # 8-byte Reload
	vmovsd	1152(%esp), %xmm4       # 8-byte Reload
	vsubsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 184(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 176(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#68:                                # %for.body14.lr.ph.us.split.split.split.split
                                        #   in Loop: Header=BB5_64 Depth=3
	vmovsd	.LCPI5_1, %xmm0
	vmovsd	176(%esp), %xmm1        # 8-byte Reload
	vxorpd	%xmm0, %xmm1, %xmm2
	vmovsd	184(%esp), %xmm3        # 8-byte Reload
	vxorpd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm0, %xmm2
	vmovsd	%xmm2, 168(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 160(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#69:                                # %for.body14.lr.ph.us.split.split.split.split.split
                                        #   in Loop: Header=BB5_64 Depth=3
	vmovsd	160(%esp), %xmm0        # 8-byte Reload
	vmovsd	1160(%esp), %xmm1       # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	168(%esp), %xmm3        # 8-byte Reload
	vmovsd	1152(%esp), %xmm4       # 8-byte Reload
	vdivsd	%xmm4, %xmm3, %xmm5
	vucomisd	%xmm2, %xmm5
	vmovsd	%xmm2, 808(%esp)        # 8-byte Spill
	vmovsd	%xmm5, 840(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#70:                                # %for.body14.lr.ph.us.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_64 Depth=3
	movl	$0, %eax
	movl	%eax, 936(%esp)         # 4-byte Spill
	jmp	.LBB5_16
.LBB5_71:                               # %for.end67
                                        #   in Loop: Header=BB5_11 Depth=2
	movl	1016(%esp), %eax        # 4-byte Reload
	movl	1000(%esp), %ecx        # 4-byte Reload
	movl	1004(%esp), %edx        # 4-byte Reload
	movl	1008(%esp), %esi        # 4-byte Reload
	movl	1012(%esp), %edi        # 4-byte Reload
	movl	996(%esp), %ebx         # 4-byte Reload
	vmovsd	(%edi), %xmm0
	vmovsd	1056(%esp), %xmm1       # 8-byte Reload
	vdivsd	%xmm1, %xmm0, %xmm2
	vmovsd	1072(%esp), %xmm3       # 8-byte Reload
	vdivsd	%xmm3, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	movl	%eax, 156(%esp)         # 4-byte Spill
	movl	%ecx, 152(%esp)         # 4-byte Spill
	movl	%edx, 148(%esp)         # 4-byte Spill
	movl	%esi, 144(%esp)         # 4-byte Spill
	movl	%edi, 140(%esp)         # 4-byte Spill
	movl	%ebx, 136(%esp)         # 4-byte Spill
	vmovsd	%xmm2, 128(%esp)        # 8-byte Spill
	vmovsd	%xmm0, 120(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#72:                                # %for.end67.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movl	140(%esp), %eax         # 4-byte Reload
	vmovsd	120(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	148(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	1056(%esp), %xmm2       # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vmovsd	1072(%esp), %xmm4       # 8-byte Reload
	vdivsd	%xmm4, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm3, 112(%esp)        # 8-byte Spill
	vmovsd	%xmm1, 104(%esp)        # 8-byte Spill
	jne	.LBB5_80
# BB#73:                                # %for.end67.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movl	148(%esp), %eax         # 4-byte Reload
	vmovsd	104(%esp), %xmm0        # 8-byte Reload
	vmovsd	%xmm0, (%eax)
	movl	156(%esp), %ecx         # 4-byte Reload
	vmovsd	(%ecx), %xmm1
	vmovsd	1056(%esp), %xmm2       # 8-byte Reload
	vdivsd	%xmm2, %xmm1, %xmm3
	vmovsd	1072(%esp), %xmm4       # 8-byte Reload
	vdivsd	%xmm4, %xmm1, %xmm1
	vucomisd	%xmm3, %xmm1
	vmovsd	%xmm3, 96(%esp)         # 8-byte Spill
	vmovsd	%xmm1, 88(%esp)         # 8-byte Spill
	jne	.LBB5_80
# BB#74:                                # %for.end67.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	vmovsd	.LCPI5_7, %xmm0
	movl	156(%esp), %eax         # 4-byte Reload
	vmovsd	88(%esp), %xmm1         # 8-byte Reload
	vmovsd	%xmm1, (%eax)
	vmovsd	128(%esp), %xmm2        # 8-byte Reload
	vmulsd	%xmm0, %xmm2, %xmm3
	vmovsd	120(%esp), %xmm4        # 8-byte Reload
	vmulsd	%xmm0, %xmm4, %xmm0
	vucomisd	%xmm3, %xmm0
	vmovsd	%xmm0, 80(%esp)         # 8-byte Spill
	jne	.LBB5_80
# BB#75:                                # %for.end67.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	vmovsd	.LCPI5_7, %xmm0
	vmovsd	80(%esp), %xmm1         # 8-byte Reload
	vcvttsd2si	%xmm1, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovsl	%ecx, %eax
	movl	%eax, %ecx
	movb	%cl, %dl
	movb	$-1, %dh
	subl	$255, %eax
	vmovsd	%xmm0, 72(%esp)         # 8-byte Spill
	movl	%eax, 68(%esp)          # 4-byte Spill
	movb	%dl, 67(%esp)           # 1-byte Spill
	movb	%dh, 66(%esp)           # 1-byte Spill
	jg	.LBB5_82
# BB#81:                                # %for.end67.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movb	67(%esp), %al           # 1-byte Reload
	movb	%al, 66(%esp)           # 1-byte Spill
.LBB5_82:                               # %for.end67.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movb	66(%esp), %al           # 1-byte Reload
	movl	1256(%esp), %ecx        # 4-byte Reload
	movl	136(%esp), %edx         # 4-byte Reload
	movb	%al, (%ecx,%edx)
	vmovsd	112(%esp), %xmm0        # 8-byte Reload
	vmovsd	72(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmovsd	104(%esp), %xmm3        # 8-byte Reload
	vmulsd	%xmm1, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 56(%esp)         # 8-byte Spill
	jne	.LBB5_80
# BB#76:                                # %for.end67.split.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	vmovsd	.LCPI5_7, %xmm0
	vmovsd	56(%esp), %xmm1         # 8-byte Reload
	vcvttsd2si	%xmm1, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovsl	%ecx, %eax
	movl	%eax, %ecx
	movb	%cl, %dl
	movb	$-1, %dh
	subl	$255, %eax
	vmovsd	%xmm0, 48(%esp)         # 8-byte Spill
	movl	%eax, 44(%esp)          # 4-byte Spill
	movb	%dl, 43(%esp)           # 1-byte Spill
	movb	%dh, 42(%esp)           # 1-byte Spill
	jg	.LBB5_84
# BB#83:                                # %for.end67.split.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movb	43(%esp), %al           # 1-byte Reload
	movb	%al, 42(%esp)           # 1-byte Spill
.LBB5_84:                               # %for.end67.split.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movb	42(%esp), %al           # 1-byte Reload
	movl	1256(%esp), %ecx        # 4-byte Reload
	movl	144(%esp), %edx         # 4-byte Reload
	movb	%al, (%ecx,%edx)
	vmovsd	96(%esp), %xmm0         # 8-byte Reload
	vmovsd	48(%esp), %xmm1         # 8-byte Reload
	vmulsd	%xmm1, %xmm0, %xmm2
	vmovsd	88(%esp), %xmm3         # 8-byte Reload
	vmulsd	%xmm1, %xmm3, %xmm4
	vucomisd	%xmm2, %xmm4
	vmovsd	%xmm4, 32(%esp)         # 8-byte Spill
	jne	.LBB5_80
# BB#77:                                # %for.end67.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	vmovsd	32(%esp), %xmm0         # 8-byte Reload
	vcvttsd2si	%xmm0, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovsl	%ecx, %eax
	movl	%eax, %ecx
	movb	%cl, %dl
	movb	$-1, %dh
	subl	$255, %eax
	movl	%eax, 28(%esp)          # 4-byte Spill
	movb	%dl, 27(%esp)           # 1-byte Spill
	movb	%dh, 26(%esp)           # 1-byte Spill
	jg	.LBB5_86
# BB#85:                                # %for.end67.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movb	27(%esp), %al           # 1-byte Reload
	movb	%al, 26(%esp)           # 1-byte Spill
.LBB5_86:                               # %for.end67.split.split.split.split.split.split
                                        #   in Loop: Header=BB5_11 Depth=2
	movb	26(%esp), %al           # 1-byte Reload
	movl	1256(%esp), %ecx        # 4-byte Reload
	movl	152(%esp), %edx         # 4-byte Reload
	movb	%al, (%ecx,%edx)
	movl	1020(%esp), %esi        # 4-byte Reload
	addl	$1, %esi
	movl	1260(%esp), %edi        # 4-byte Reload
	cmpl	%edi, %esi
	movl	%esi, 1024(%esp)        # 4-byte Spill
	jne	.LBB5_11
.LBB5_78:                               # %for.inc128
                                        #   in Loop: Header=BB5_8 Depth=1
	movl	1048(%esp), %eax        # 4-byte Reload
	addl	$1, %eax
	movl	1264(%esp), %ecx        # 4-byte Reload
	cmpl	%ecx, %eax
	movl	%eax, 1052(%esp)        # 4-byte Spill
	jne	.LBB5_8
.LBB5_79:                               # %for.end130
	addl	$1420, %esp             # imm = 0x58C
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.LBB5_80:                               # %relExit
	leal	.LrelFun, %eax
	leal	.Lfunc5, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	movl	$1, %ecx
	movl	$1, (%esp)
	movl	%eax, 20(%esp)          # 4-byte Spill
	movl	%ecx, 16(%esp)          # 4-byte Spill
	calll	exit
	addl	$1420, %esp             # imm = 0x58C
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
	subl	$92, %esp
	movl	%esp, %eax
	movl	$786432, (%eax)         # imm = 0xC0000
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
	movl	%eax, 88(%esp)          # 4-byte Spill
	calll	clock
	movl	%esp, %ecx
	movl	88(%esp), %edx          # 4-byte Reload
	movl	%edx, (%ecx)
	movl	$4, 12(%ecx)
	movl	$512, 8(%ecx)           # imm = 0x200
	movl	$512, 4(%ecx)           # imm = 0x200
	movl	%eax, 84(%esp)          # 4-byte Spill
	calll	render
	calll	clock
	movl	84(%esp), %ecx          # 4-byte Reload
	subl	%ecx, %eax
                                        # implicit-def: XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movl	88(%esp), %eax          # 4-byte Reload
	vmovaps	%xmm0, %xmm1
	vucomisd	%xmm1, %xmm0
	vmovsd	%xmm0, 72(%esp)         # 8-byte Spill
	movl	%eax, 68(%esp)          # 4-byte Spill
	vmovsd	%xmm1, 56(%esp)         # 8-byte Spill
	jne	.LBB8_3
# BB#1:                                 # %entry.split3
	movl	$1000000, %eax          # imm = 0xF4240
	vmovsd	.LCPI8_0, %xmm0
	vmovsd	56(%esp), %xmm1         # 8-byte Reload
	vdivsd	%xmm0, %xmm1, %xmm2
	vmovsd	72(%esp), %xmm3         # 8-byte Reload
	vdivsd	%xmm0, %xmm3, %xmm0
	vucomisd	%xmm2, %xmm0
	movl	%eax, 52(%esp)          # 4-byte Spill
	vmovsd	%xmm0, 40(%esp)         # 8-byte Spill
	jne	.LBB8_3
# BB#2:                                 # %entry.split
	movl	%esp, %eax
	vmovsd	40(%esp), %xmm0         # 8-byte Reload
	vmovsd	%xmm0, 4(%eax)
	movl	$.L.str7, (%eax)
	calll	printf
	movl	%esp, %ecx
	movl	68(%esp), %edx          # 4-byte Reload
	movl	%edx, 12(%ecx)
	movl	$512, 8(%ecx)           # imm = 0x200
	movl	$512, 4(%ecx)           # imm = 0x200
	movl	$.L.str8, (%ecx)
	movl	%eax, 36(%esp)          # 4-byte Spill
	calll	saveppm
	movl	$0, %eax
	addl	$92, %esp
	ret
.LBB8_3:                                # %relExit
	leal	.LrelFun, %eax
	leal	.Lfunc8, %ecx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	calll	printf
	movl	$1, %ecx
	movl	$1, (%esp)
	movl	%eax, 32(%esp)          # 4-byte Spill
	movl	%ecx, 28(%esp)          # 4-byte Spill
	calll	exit
	movl	$0, %eax
	addl	$92, %esp
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

	.type	.LrelFun,@object        # @relFun
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.LrelFun:
	.asciz	 "Reliability CMP failed in function, exit directly %s\n"
	.size	.LrelFun, 54

	.type	.Lfunc,@object          # @func
	.align	16
.Lfunc:
	.asciz	 "ray_sphere_intersect"
	.size	.Lfunc, 21

	.type	.Lfunc1,@object         # @func1
	.align	16
.Lfunc1:
	.asciz	 "ray_plane_intersect"
	.size	.Lfunc1, 20

	.type	.Lfunc2,@object         # @func2
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc2:
	.asciz	 "orthoBasis"
	.size	.Lfunc2, 11

	.type	.Lfunc3,@object         # @func3
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lfunc3:
	.asciz	 "ambient_occlusion"
	.size	.Lfunc3, 18

	.type	.Lfunc4,@object         # @func4
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc4:
	.asciz	 "clamp"
	.size	.Lfunc4, 6

	.type	.Lfunc5,@object         # @func5
.Lfunc5:
	.asciz	 "render"
	.size	.Lfunc5, 7

	.type	.Lfunc6,@object         # @func6
.Lfunc6:
	.asciz	 "init_scene"
	.size	.Lfunc6, 11

	.type	.Lfunc7,@object         # @func7
.Lfunc7:
	.asciz	 "saveppm"
	.size	.Lfunc7, 8

	.type	.Lfunc8,@object         # @func8
.Lfunc8:
	.asciz	 "main"
	.size	.Lfunc8, 5


	.section	".note.GNU-stack","",@progbits
