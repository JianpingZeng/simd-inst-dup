; ModuleID = 'test_novec.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.A = private unnamed_addr constant [100 x double] [double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00, double 1.000000e+01, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00], align 16
@main.B = private unnamed_addr constant [100 x double] [double 1.000000e-01, double 2.000000e-01, double 3.000000e-01, double 4.000000e-01, double 5.000000e-01, double 6.000000e-01, double 7.000000e-01, double 8.000000e-01, double 9.000000e-01, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00], align 16
@.str = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@str2 = private unnamed_addr constant [32 x i8] c"-------------------------------\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %C = alloca [100 x double], align 16
  %0 = bitcast [100 x double]* %C to i8*
  call void @llvm.lifetime.start(i64 800, i8* %0) #1
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv62 = phi i64 [ 0, %entry ], [ %indvars.iv.next63, %for.body ]
  %arrayidx = getelementptr inbounds [100 x double]* @main.A, i64 0, i64 %indvars.iv62
  %1 = load double* %arrayidx, align 8, !tbaa !1
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), double %1) #1
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next63, 100
  br i1 %exitcond64, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str2, i64 0, i64 0))
  br label %for.body4

for.body4:                                        ; preds = %for.body4, %for.end
  %indvars.iv59 = phi i64 [ 0, %for.end ], [ %indvars.iv.next60, %for.body4 ]
  %arrayidx6 = getelementptr inbounds [100 x double]* @main.B, i64 0, i64 %indvars.iv59
  %2 = load double* %arrayidx6, align 8, !tbaa !1
  %3 = trunc i64 %indvars.iv59 to i32
  %conv = sitofp i32 %3 to double
  %call7 = tail call double @pow(double %2, double %conv) #1
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), double %call7) #1
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next60, 100
  br i1 %exitcond61, label %for.end11, label %for.body4

for.end11:                                        ; preds = %for.body4
  %puts51 = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str2, i64 0, i64 0))
  br label %for.body16

for.body16:                                       ; preds = %for.body16, %for.end11
  %indvars.iv56 = phi i64 [ 0, %for.end11 ], [ %indvars.iv.next57, %for.body16 ]
  %arrayidx19 = getelementptr inbounds [100 x double]* @main.B, i64 0, i64 %indvars.iv56
  %4 = load double* %arrayidx19, align 8, !tbaa !1
  %5 = trunc i64 %indvars.iv56 to i32
  %conv20 = sitofp i32 %5 to double
  %call21 = tail call double @pow(double %4, double %conv20) #1
  %add = fadd double %call21, 1.000000e+00
  %arrayidx23 = getelementptr inbounds [100 x double]* %C, i64 0, i64 %indvars.iv56
  store double %add, double* %arrayidx23, align 8, !tbaa !1
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next57, 100
  br i1 %exitcond58, label %for.body30, label %for.body16

for.body30:                                       ; preds = %for.body30, %for.body16
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body30 ], [ 0, %for.body16 ]
  %arrayidx32 = getelementptr inbounds [100 x double]* %C, i64 0, i64 %indvars.iv
  %6 = load double* %arrayidx32, align 8, !tbaa !1
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), double %6) #1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %for.end36, label %for.body30

for.end36:                                        ; preds = %for.body30
  call void @llvm.lifetime.end(i64 800, i8* %0) #1
  ret i32 1
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"double", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
