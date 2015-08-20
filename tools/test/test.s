	.file	"llvmprof.out"
	.section	.text.startup,"ax",@progbits
	.align	16, 0x90
	.type	__cxx_global_var_init,@function
__cxx_global_var_init:                  # @__cxx_global_var_init
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp1:
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, (%esp)
	calll	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, 8(%esp)
	movl	$_ZStL8__ioinit, 4(%esp)
	movl	$_ZNSt8ios_base4InitD1Ev, (%esp)
	calll	__cxa_atexit
	addl	$12, %esp
	ret
.Ltmp2:
	.size	__cxx_global_var_init, .Ltmp2-__cxx_global_var_init
	.cfi_endproc

	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%ebp
.Ltmp6:
	.cfi_def_cfa_offset 8
.Ltmp7:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp8:
	.cfi_def_cfa_register %ebp
	pushl	%ebx
	subl	$196, %esp
.Ltmp9:
	.cfi_offset %ebx, -12
	movl	$0, -8(%ebp)
	vmovups	.L_ZZ4mainE1A+16, %xmm0
	vmovaps	%xmm0, -72(%ebp)
	vmovups	.L_ZZ4mainE1A, %xmm0
	vmovaps	%xmm0, -88(%ebp)
	vmovups	.L_ZZ4mainE1A+32, %xmm0
	vmovaps	%xmm0, -56(%ebp)
	vmovups	.L_ZZ4mainE1A+64, %xmm0
	vmovaps	%xmm0, -24(%ebp)
	vmovups	.L_ZZ4mainE1A+48, %xmm0
	vmovaps	%xmm0, -40(%ebp)
	vmovups	.L_ZZ4mainE1B+16, %xmm0
	vmovaps	%xmm0, -152(%ebp)
	vmovups	.L_ZZ4mainE1B, %xmm0
	vmovaps	%xmm0, -168(%ebp)
	vmovups	.L_ZZ4mainE1B+32, %xmm0
	vmovaps	%xmm0, -136(%ebp)
	vmovups	.L_ZZ4mainE1B+64, %xmm0
	vmovaps	%xmm0, -104(%ebp)
	vmovups	.L_ZZ4mainE1B+48, %xmm0
	vmovaps	%xmm0, -120(%ebp)
	movl	$0, -172(%ebp)
	xorb	%al, %al
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_5:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-172(%ebp), %ecx
	vmovsd	-168(%ebp,%ecx,8), %xmm0
	movl	-172(%ebp), %ecx
	vaddsd	-88(%ebp,%ecx,8), %xmm0, %xmm0
	vmovsd	%xmm0, -88(%ebp,%ecx,8)
	incl	-172(%ebp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$9, -172(%ebp)
	jg	.LBB1_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	testb	%al, %al
	jne	.LBB1_12
# BB#3:                                 # %for.body.split4
                                        #   in Loop: Header=BB1_1 Depth=1
	jne	.LBB1_12
# BB#4:                                 # %for.body.split
                                        #   in Loop: Header=BB1_1 Depth=1
	testb	%al, %al
	jne	.LBB1_12
	jmp	.LBB1_5
.LBB1_6:                                # %for.end
	movl	$0, -176(%ebp)
	xorb	%bl, %bl
	jmp	.LBB1_7
	.align	16, 0x90
.LBB1_9:                                # %for.inc8
                                        #   in Loop: Header=BB1_7 Depth=1
	movl	-176(%ebp), %eax
	vmovsd	-88(%ebp,%eax,8), %xmm0
	vmovsd	%xmm0, 4(%esp)
	movl	$_ZSt4cout, (%esp)
	calll	_ZNSolsEd
	movl	%eax, (%esp)
	movl	$.L.str, 4(%esp)
	calll	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	incl	-176(%ebp)
.LBB1_7:                                # %for.cond3
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$9, -176(%ebp)
	jg	.LBB1_10
# BB#8:                                 # %for.body5
                                        #   in Loop: Header=BB1_7 Depth=1
	testb	%bl, %bl
	je	.LBB1_9
.LBB1_12:                               # %relExit
	movl	$.Lfunc1, 4(%esp)
	movl	$.LrelFun, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	exit
.LBB1_11:                               # %for.end10
	xorl	%eax, %eax
	addl	$196, %esp
	popl	%ebx
	popl	%ebp
	ret
.LBB1_10:                               # %for.end10
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, 4(%esp)
	movl	$_ZSt4cout, (%esp)
	calll	_ZNSolsEPFRSoS_E
	jmp	.LBB1_11
.Ltmp10:
	.size	main, .Ltmp10-main
	.cfi_endproc

	.section	.text.startup,"ax",@progbits
	.align	16, 0x90
	.type	_GLOBAL__I_a,@function
_GLOBAL__I_a:                           # @_GLOBAL__I_a
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%ebp
.Ltmp13:
	.cfi_def_cfa_offset 8
.Ltmp14:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
.Ltmp15:
	.cfi_def_cfa_register %ebp
	subl	$8, %esp
	calll	__cxx_global_var_init
	addl	$8, %esp
	popl	%ebp
	ret
.Ltmp16:
	.size	_GLOBAL__I_a, .Ltmp16-_GLOBAL__I_a
	.cfi_endproc

	.type	_ZStL8__ioinit,@object  # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.type	.L_ZZ4mainE1A,@object   # @_ZZ4mainE1A
	.section	.rodata,"a",@progbits
	.align	4
.L_ZZ4mainE1A:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4611686018427387904     # double 2.000000e+00
	.quad	4613937818241073152     # double 3.000000e+00
	.quad	4616189618054758400     # double 4.000000e+00
	.quad	4617315517961601024     # double 5.000000e+00
	.quad	4618441417868443648     # double 6.000000e+00
	.quad	4619567317775286272     # double 7.000000e+00
	.quad	4620693217682128896     # double 8.000000e+00
	.quad	4621256167635550208     # double 9.000000e+00
	.quad	4621819117588971520     # double 1.000000e+01
	.size	.L_ZZ4mainE1A, 80

	.type	.L_ZZ4mainE1B,@object   # @_ZZ4mainE1B
	.align	4
.L_ZZ4mainE1B:
	.quad	4607182418800017408     # double 1.000000e+00
	.quad	4613937818241073152     # double 3.000000e+00
	.quad	4617315517961601024     # double 5.000000e+00
	.quad	4619567317775286272     # double 7.000000e+00
	.quad	4621256167635550208     # double 9.000000e+00
	.quad	4622382067542392832     # double 1.100000e+01
	.quad	4623507967449235456     # double 1.300000e+01
	.quad	4624633867356078080     # double 1.500000e+01
	.quad	4625478292286210048     # double 1.700000e+01
	.quad	4626041242239631360     # double 1.900000e+01
	.size	.L_ZZ4mainE1B, 80

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 " "
	.size	.L.str, 2

	.section	.ctors,"aw",@progbits
	.align	4
	.long	_GLOBAL__I_a
	.type	.LrelFun,@object        # @relFun
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.LrelFun:
	.asciz	 "Reliability CMP failed in function %s\n"
	.size	.LrelFun, 39

	.type	.Lfunc,@object          # @func
	.align	16
.Lfunc:
	.asciz	 "__cxx_global_var_init"
	.size	.Lfunc, 22

	.type	.Lfunc1,@object         # @func1
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfunc1:
	.asciz	 "main"
	.size	.Lfunc1, 5

	.type	.Lfunc2,@object         # @func2
.Lfunc2:
	.asciz	 "_GLOBAL__I_a"
	.size	.Lfunc2, 13


	.section	".note.GNU-stack","",@progbits
