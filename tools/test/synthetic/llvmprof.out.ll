; ModuleID = 'llvmprof.out'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.A = private unnamed_addr constant [100 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00, double 1.000000e+01, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00], align 16
@main.B = private unnamed_addr constant [100 x double] [double 1.000000e-01, double 2.000000e-01, double 3.000000e-01, double 4.000000e-01, double 5.000000e-01, double 6.000000e-01, double 7.000000e-01, double 8.000000e-01, double 9.000000e-01, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00], align 16
@.str = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@relFun = private unnamed_addr constant [54 x i8] c"Reliability CMP failed in function, exit directly %s\0A\00"
@func = private unnamed_addr constant [5 x i8] c"main\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %C = alloca [100 x double], align 16
  %splatCS1_D.splatinsert = insertelement <2 x [100 x double]*> undef, [100 x double]* %C, i32 0
  %splatCS1_D.splat = shufflevector <2 x [100 x double]*> %splatCS1_D.splatinsert, <2 x [100 x double]*> undef, <2 x i32> zeroinitializer
  %bitcastS1_D = bitcast <2 x [100 x double]*> %splatCS1_D.splat to <2 x i8*>
  br label %vector.body

vector.body:                                      ; preds = %vector.body.split.split.split, %entry
  %VPhiS4_D = phi <2 x i64> [ zeroinitializer, %entry ], [ %index.nextS15_D, %vector.body.split.split.split ]
  %extractS5_D = extractelement <2 x i64> %VPhiS4_D, i32 1
  %0 = getelementptr inbounds [100 x double]* @main.A, i64 0, i64 %extractS5_D
  %splatS6_D.splatinsert = insertelement <2 x double*> undef, double* %0, i32 0
  %splatS6_D.splat = shufflevector <2 x double*> %splatS6_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS6_D = bitcast <2 x double*> %splatS6_D.splat to <2 x <4 x double>*>
  %extbitcastS6_D = extractelement <2 x <4 x double>*> %bitcastS6_D, i32 1
  %wide.load = load <4 x double>* %extbitcastS6_D, align 16
  %1 = getelementptr inbounds [100 x double]* @main.B, i64 0, i64 %extractS5_D
  %splatS9_D.splatinsert = insertelement <2 x double*> undef, double* %1, i32 0
  %splatS9_D.splat = shufflevector <2 x double*> %splatS9_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS9_D = bitcast <2 x double*> %splatS9_D.splat to <2 x <4 x double>*>
  %extbitcastS9_D = extractelement <2 x <4 x double>*> %bitcastS9_D, i32 1
  %wide.load1 = load <4 x double>* %extbitcastS9_D, align 16
  %V11_D = fadd <4 x double> %wide.load, %wide.load1
  %2 = fadd <4 x double> %wide.load, %wide.load1
  %EDCS0x7fff0d431a18 = fcmp one <4 x double> %2, %V11_D
  %3 = sext <4 x i1> %EDCS0x7fff0d431a18 to <4 x i64>
  %4 = bitcast <4 x i64> %3 to i256
  %5 = icmp ne i256 %4, 0
  br i1 %5, label %relExit, label %vector.body.split

vector.body.split:                                ; preds = %vector.body
  %6 = getelementptr inbounds [100 x double]* %C, i64 0, i64 %extractS5_D
  %splatS13_D.splatinsert = insertelement <2 x double*> undef, double* %6, i32 0
  %splatS13_D.splat = shufflevector <2 x double*> %splatS13_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS13_D = bitcast <2 x double*> %splatS13_D.splat to <2 x <4 x double>*>
  %extbitcastS13_D = extractelement <2 x <4 x double>*> %bitcastS13_D, i32 1
  store <4 x double> %2, <4 x double>* %extbitcastS13_D, align 16
  %index.nextS15_D = add <2 x i64> %VPhiS4_D, <i64 4, i64 4>
  %SFS15_D = shufflevector <2 x i64> %index.nextS15_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fff0d431a18 = icmp ne <2 x i64> %index.nextS15_D, %SFS15_D
  %7 = sext <2 x i1> %EDCV0x7fff0d431a18 to <2 x i64>
  %8 = bitcast <2 x i64> %7 to i128
  %9 = icmp ne i128 %8, 0
  br i1 %9, label %relExit, label %vector.body.split.split

vector.body.split.split:                          ; preds = %vector.body.split
  %S16_D = icmp eq <2 x i64> %index.nextS15_D, <i64 100, i64 100>
  %SFS16_D = shufflevector <2 x i1> %S16_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fff0d431a1810 = icmp ne <2 x i1> %S16_D, %SFS16_D
  %10 = bitcast <2 x i1> %EDCV0x7fff0d431a1810 to i2
  %11 = icmp ne i2 %10, 0
  br i1 %11, label %relExit, label %vector.body.split.split.split

vector.body.split.split.split:                    ; preds = %vector.body.split.split
  %sextS17_D = sext <2 x i1> %S16_D to <2 x i64>
  %BCS17_D = bitcast <2 x i64> %sextS17_D to i128
  %mskS17_D = icmp ne i128 %BCS17_D, 0
  br i1 %mskS17_D, label %for.body7, label %vector.body, !llvm.loop !1

for.body7:                                        ; preds = %for.body7.split.split, %vector.body.split.split.split
  %VPhiS18_D = phi <2 x i64> [ %indvars.iv.nextS22_D, %for.body7.split.split ], [ zeroinitializer, %vector.body.split.split.split ]
  %extractS19_D = extractelement <2 x i64> %VPhiS18_D, i32 1
  %arrayidx9 = getelementptr inbounds [100 x double]* %C, i64 0, i64 %extractS19_D
  %12 = load double* %arrayidx9, align 8, !tbaa !4
  %splatS20_D.splatinsert = insertelement <2 x double> undef, double %12, i32 0
  %splatS20_D.splat = shufflevector <2 x double> %splatS20_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), double %12) #1
  %indvars.iv.nextS22_D = add <2 x i64> %VPhiS18_D, <i64 1, i64 1>
  %SFS22_D = shufflevector <2 x i64> %indvars.iv.nextS22_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fff0d431a1811 = icmp ne <2 x i64> %indvars.iv.nextS22_D, %SFS22_D
  %13 = sext <2 x i1> %EDCV0x7fff0d431a1811 to <2 x i64>
  %14 = bitcast <2 x i64> %13 to i128
  %15 = icmp ne i128 %14, 0
  br i1 %15, label %relExit, label %for.body7.split

for.body7.split:                                  ; preds = %for.body7
  %exitcondS23_D = icmp eq <2 x i64> %indvars.iv.nextS22_D, <i64 100, i64 100>
  %SFS23_D = shufflevector <2 x i1> %exitcondS23_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fff0d431a1812 = icmp ne <2 x i1> %exitcondS23_D, %SFS23_D
  %16 = bitcast <2 x i1> %EDCV0x7fff0d431a1812 to i2
  %17 = icmp ne i2 %16, 0
  br i1 %17, label %relExit, label %for.body7.split.split

for.body7.split.split:                            ; preds = %for.body7.split
  %sextS24_D = sext <2 x i1> %exitcondS23_D to <2 x i64>
  %BCS24_D = bitcast <2 x i64> %sextS24_D to i128
  %mskS24_D = icmp ne i128 %BCS24_D, 0
  br i1 %mskS24_D, label %for.end12, label %for.body7

for.end12:                                        ; preds = %for.body7.split.split
  ret i32 1

relExit:                                          ; preds = %for.body7.split, %for.body7, %vector.body.split.split, %vector.body.split, %vector.body
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @relFun, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @func, i32 0, i32 0))
  call void @exit(i32 1)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

declare void @exit(i32)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !1, metadata !2, metadata !3}
!2 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!3 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!4 = metadata !{metadata !5, metadata !5, i64 0}
!5 = metadata !{metadata !"double", metadata !6, i64 0}
!6 = metadata !{metadata !"omnipotent char", metadata !7, i64 0}
!7 = metadata !{metadata !"Simple C/C++ TBAA"}
