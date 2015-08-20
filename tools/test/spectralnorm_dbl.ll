; ModuleID = 'spectralnorm_dbl.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@tmp = common global double* null, align 8
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind readonly uwtable
define double @dot(double* nocapture readonly %v, double* nocapture readonly %u, i32 %n) #0 {
entry:
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %sum.09 = phi double [ %add, %for.body ], [ 0.000000e+00, %entry ]
  %arrayidx = getelementptr inbounds double* %v, i64 %indvars.iv
  %0 = load double* %arrayidx, align 8, !tbaa !1
  %arrayidx2 = getelementptr inbounds double* %u, i64 %indvars.iv
  %1 = load double* %arrayidx2, align 8, !tbaa !1
  %mul = fmul double %0, %1
  %add = fadd double %sum.09, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %sum.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  ret double %sum.0.lcssa
}

; Function Attrs: nounwind uwtable
define void @mult_Av_serial(double* nocapture readonly %v, double* nocapture %out, i32 %n) #1 {
entry:
  %cmp20 = icmp sgt i32 %n, 0
  br i1 %cmp20, label %for.body3.lr.ph.us, label %for.end8

for.end.us:                                       ; preds = %for.body3.us
  %arrayidx5.us = getelementptr inbounds double* %out, i64 %indvars.iv26
  store double %add.us, double* %arrayidx5.us, align 8, !tbaa !1
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %lftr.wideiv28 = trunc i64 %indvars.iv.next27 to i32
  %exitcond29 = icmp eq i32 %lftr.wideiv28, %n
  br i1 %exitcond29, label %for.end8, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us ]
  %sum.019.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us ], [ %add.us, %for.body3.us ]
  %j.018.us = phi i32 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %arrayidx.us = getelementptr inbounds double* %v, i64 %indvars.iv
  %0 = load double* %arrayidx.us, align 8, !tbaa !1
  %1 = add nsw i64 %indvars.iv, %indvars.iv26
  %add.i.us = add nsw i32 %j.018.us, %3
  %add2.i.us = add nsw i32 %add.i.us, 1
  %2 = trunc i64 %1 to i32
  %mul.i.us = mul nsw i32 %add2.i.us, %2
  %conv.i.us = sitofp i32 %mul.i.us to double
  %div.i.us = fmul double %conv.i.us, 5.000000e-01
  %add4.i.us = fadd double %conv3.i.us, %div.i.us
  %add5.i.us = fadd double %add4.i.us, 1.000000e+00
  %div.us = fdiv double %0, %add5.i.us
  %add.us = fadd double %sum.019.us, %div.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %inc.us = add nsw i32 %j.018.us, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.end.us ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv26 to i32
  %conv3.i.us = sitofp i32 %3 to double
  br label %for.body3.us

for.end8:                                         ; preds = %for.end.us, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @mult_Atv_serial(double* nocapture readonly %v, double* nocapture %out, i32 %n) #1 {
entry:
  %cmp20 = icmp sgt i32 %n, 0
  br i1 %cmp20, label %for.body3.lr.ph.us, label %for.end8

for.end.us:                                       ; preds = %for.body3.us
  %arrayidx5.us = getelementptr inbounds double* %out, i64 %indvars.iv26
  store double %add.us, double* %arrayidx5.us, align 8, !tbaa !1
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %lftr.wideiv28 = trunc i64 %indvars.iv.next27 to i32
  %exitcond29 = icmp eq i32 %lftr.wideiv28, %n
  br i1 %exitcond29, label %for.end8, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us ]
  %sum.019.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us ], [ %add.us, %for.body3.us ]
  %j.018.us = phi i32 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %arrayidx.us = getelementptr inbounds double* %v, i64 %indvars.iv
  %0 = load double* %arrayidx.us, align 8, !tbaa !1
  %1 = add nsw i64 %indvars.iv, %indvars.iv26
  %add.i.us = add nsw i32 %j.018.us, %3
  %add2.i.us = add nsw i32 %add.i.us, 1
  %2 = trunc i64 %1 to i32
  %mul.i.us = mul nsw i32 %add2.i.us, %2
  %conv.i.us = sitofp i32 %mul.i.us to double
  %div.i.us = fmul double %conv.i.us, 5.000000e-01
  %add4.i.us = fadd double %conv3.i.us, %div.i.us
  %add5.i.us = fadd double %add4.i.us, 1.000000e+00
  %div.us = fdiv double %0, %add5.i.us
  %add.us = fadd double %sum.019.us, %div.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %inc.us = add nsw i32 %j.018.us, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.end.us ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv26 to i32
  %conv3.i.us = sitofp i32 %3 to double
  br label %for.body3.us

for.end8:                                         ; preds = %for.end.us, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @mult_AtAv_serial(double* nocapture readonly %v, double* nocapture %out, i32 %n) #1 {
entry:
  %0 = load double** @tmp, align 8, !tbaa !5
  %cmp20.i = icmp sgt i32 %n, 0
  br i1 %cmp20.i, label %for.body3.lr.ph.us.i, label %mult_Atv_serial.exit

for.end.us.i:                                     ; preds = %for.body3.us.i
  %arrayidx5.us.i = getelementptr inbounds double* %0, i64 %indvars.iv26.i
  store double %add.us.i, double* %arrayidx5.us.i, align 8, !tbaa !1
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1
  %lftr.wideiv33 = trunc i64 %indvars.iv.next27.i to i32
  %exitcond34 = icmp eq i32 %lftr.wideiv33, %n
  br i1 %exitcond34, label %for.body3.lr.ph.us.i28, label %for.body3.lr.ph.us.i

for.body3.us.i:                                   ; preds = %for.body3.lr.ph.us.i, %for.body3.us.i
  %indvars.iv.i = phi i64 [ 0, %for.body3.lr.ph.us.i ], [ %indvars.iv.next.i, %for.body3.us.i ]
  %sum.019.us.i = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i ], [ %add.us.i, %for.body3.us.i ]
  %j.018.us.i = phi i32 [ 0, %for.body3.lr.ph.us.i ], [ %inc.us.i, %for.body3.us.i ]
  %arrayidx.us.i = getelementptr inbounds double* %v, i64 %indvars.iv.i
  %1 = load double* %arrayidx.us.i, align 8, !tbaa !1
  %2 = add nsw i64 %indvars.iv.i, %indvars.iv26.i
  %add2.i.us.i = add i32 %add.i.us.i, %j.018.us.i
  %3 = trunc i64 %2 to i32
  %mul.i.us.i = mul nsw i32 %add2.i.us.i, %3
  %conv.i.us.i = sitofp i32 %mul.i.us.i to double
  %div.i.us.i = fmul double %conv.i.us.i, 5.000000e-01
  %add4.i.us.i = fadd double %conv3.i.us.i, %div.i.us.i
  %add5.i.us.i = fadd double %add4.i.us.i, 1.000000e+00
  %div.us.i = fdiv double %1, %add5.i.us.i
  %add.us.i = fadd double %sum.019.us.i, %div.us.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %inc.us.i = add nsw i32 %j.018.us.i, 1
  %lftr.wideiv31 = trunc i64 %indvars.iv.next.i to i32
  %exitcond32 = icmp eq i32 %lftr.wideiv31, %n
  br i1 %exitcond32, label %for.end.us.i, label %for.body3.us.i

for.body3.lr.ph.us.i:                             ; preds = %for.end.us.i, %entry
  %indvars.iv26.i = phi i64 [ %indvars.iv.next27.i, %for.end.us.i ], [ 0, %entry ]
  %4 = trunc i64 %indvars.iv26.i to i32
  %conv3.i.us.i = sitofp i32 %4 to double
  %add.i.us.i = add i32 %4, 1
  br label %for.body3.us.i

for.end.us.i7:                                    ; preds = %for.body3.us.i25
  %arrayidx5.us.i3 = getelementptr inbounds double* %out, i64 %indvars.iv26.i26
  store double %add.us.i20, double* %arrayidx5.us.i3, align 8, !tbaa !1
  %indvars.iv.next27.i4 = add nuw nsw i64 %indvars.iv26.i26, 1
  %lftr.wideiv29 = trunc i64 %indvars.iv.next27.i4 to i32
  %exitcond30 = icmp eq i32 %lftr.wideiv29, %n
  br i1 %exitcond30, label %mult_Atv_serial.exit, label %for.body3.lr.ph.us.i28

for.body3.us.i25:                                 ; preds = %for.body3.lr.ph.us.i28, %for.body3.us.i25
  %indvars.iv.i8 = phi i64 [ 0, %for.body3.lr.ph.us.i28 ], [ %indvars.iv.next.i21, %for.body3.us.i25 ]
  %sum.019.us.i9 = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i28 ], [ %add.us.i20, %for.body3.us.i25 ]
  %j.018.us.i10 = phi i32 [ 0, %for.body3.lr.ph.us.i28 ], [ %inc.us.i22, %for.body3.us.i25 ]
  %arrayidx.us.i11 = getelementptr inbounds double* %0, i64 %indvars.iv.i8
  %5 = load double* %arrayidx.us.i11, align 8, !tbaa !1
  %6 = add nsw i64 %indvars.iv.i8, %indvars.iv26.i26
  %add2.i.us.i13 = add i32 %add.i.us.i12, %j.018.us.i10
  %7 = trunc i64 %6 to i32
  %mul.i.us.i14 = mul nsw i32 %add2.i.us.i13, %7
  %conv.i.us.i15 = sitofp i32 %mul.i.us.i14 to double
  %div.i.us.i16 = fmul double %conv.i.us.i15, 5.000000e-01
  %add4.i.us.i17 = fadd double %conv3.i.us.i27, %div.i.us.i16
  %add5.i.us.i18 = fadd double %add4.i.us.i17, 1.000000e+00
  %div.us.i19 = fdiv double %5, %add5.i.us.i18
  %add.us.i20 = fadd double %sum.019.us.i9, %div.us.i19
  %indvars.iv.next.i21 = add nuw nsw i64 %indvars.iv.i8, 1
  %inc.us.i22 = add nsw i32 %j.018.us.i10, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i21 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end.us.i7, label %for.body3.us.i25

for.body3.lr.ph.us.i28:                           ; preds = %for.end.us.i7, %for.end.us.i
  %indvars.iv26.i26 = phi i64 [ %indvars.iv.next27.i4, %for.end.us.i7 ], [ 0, %for.end.us.i ]
  %8 = trunc i64 %indvars.iv26.i26 to i32
  %conv3.i.us.i27 = sitofp i32 %8 to double
  %add.i.us.i12 = add i32 %8, 1
  br label %for.body3.us.i25

mult_Atv_serial.exit:                             ; preds = %for.end.us.i7, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %0 = load i8** %arrayidx, align 8, !tbaa !5
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #3
  %conv.i = trunc i64 %call.i to i32
  %cmp = icmp slt i32 %conv.i, 1
  %.call = select i1 %cmp, i32 2000, i32 %conv.i
  %and = and i32 %.call, 1
  %.call.inc = add nsw i32 %and, %.call
  %conv = sext i32 %.call.inc to i64
  %mul = shl nsw i64 %conv, 3
  %call3 = tail call noalias i8* @memalign(i64 32, i64 %mul) #3
  %1 = bitcast i8* %call3 to double*
  %call6 = tail call noalias i8* @memalign(i64 32, i64 %mul) #3
  %2 = bitcast i8* %call6 to double*
  %call9 = tail call noalias i8* @memalign(i64 32, i64 %mul) #3
  %3 = bitcast i8* %call9 to double*
  store double* %3, double** @tmp, align 8, !tbaa !5
  %cmp10114 = icmp sgt i32 %.call.inc, 0
  %4 = and i32 %.call, 1
  %5 = add i32 %.call, %4
  br i1 %cmp10114, label %for.body.preheader, label %for.body17

for.body.preheader:                               ; preds = %entry
  %6 = and i32 %.call, 1
  %7 = add i32 %.call, %6
  %8 = add i32 %7, -1
  %9 = zext i32 %8 to i64
  %10 = add i64 %9, 1
  %end.idx = add i64 %9, 1
  %n.vec = and i64 %10, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.body.preheader ]
  %11 = getelementptr inbounds double* %1, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %12, align 8
  %.sum144 = or i64 %index, 2
  %13 = getelementptr double* %1, i64 %.sum144
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %14, align 8
  %index.next = add i64 %index, 4
  %15 = icmp eq i64 %index.next, %n.vec
  br i1 %15, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body, %for.body.preheader
  %resume.val = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.body17, label %for.body

for.body:                                         ; preds = %for.body, %middle.block
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %resume.val, %middle.block ]
  %arrayidx12 = getelementptr inbounds double* %1, i64 %indvars.iv
  store double 1.000000e+00, double* %arrayidx12, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv135 = trunc i64 %indvars.iv.next to i32
  %exitcond136 = icmp eq i32 %lftr.wideiv135, %5
  br i1 %exitcond136, label %for.body17, label %for.body, !llvm.loop !10

for.body17:                                       ; preds = %mult_AtAv_serial.exit111, %for.body, %middle.block, %entry
  %i.1113 = phi i32 [ %inc19, %mult_AtAv_serial.exit111 ], [ 0, %for.body ], [ 0, %middle.block ], [ 0, %entry ]
  br i1 %cmp10114, label %for.body3.lr.ph.us.i.i, label %mult_AtAv_serial.exit111

for.end.us.i.i:                                   ; preds = %for.body3.us.i.i
  %arrayidx5.us.i.i = getelementptr inbounds double* %3, i64 %indvars.iv26.i.i
  store double %add.us.i.i, double* %arrayidx5.us.i.i, align 8, !tbaa !1
  %indvars.iv.next27.i.i = add nuw nsw i64 %indvars.iv26.i.i, 1
  %lftr.wideiv120 = trunc i64 %indvars.iv.next27.i.i to i32
  %exitcond121 = icmp eq i32 %lftr.wideiv120, %5
  br i1 %exitcond121, label %for.body3.lr.ph.us.i28.i, label %for.body3.lr.ph.us.i.i

for.body3.us.i.i:                                 ; preds = %for.body3.lr.ph.us.i.i, %for.body3.us.i.i
  %indvars.iv.i.i = phi i64 [ 0, %for.body3.lr.ph.us.i.i ], [ %indvars.iv.next.i.i, %for.body3.us.i.i ]
  %sum.019.us.i.i = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i.i ], [ %add.us.i.i, %for.body3.us.i.i ]
  %j.018.us.i.i = phi i32 [ 0, %for.body3.lr.ph.us.i.i ], [ %inc.us.i.i, %for.body3.us.i.i ]
  %arrayidx.us.i.i = getelementptr inbounds double* %1, i64 %indvars.iv.i.i
  %16 = load double* %arrayidx.us.i.i, align 8, !tbaa !1
  %17 = add nsw i64 %indvars.iv.i.i, %indvars.iv26.i.i
  %add2.i.us.i.i = add i32 %add.i.us.i.i, %j.018.us.i.i
  %18 = trunc i64 %17 to i32
  %mul.i.us.i.i = mul nsw i32 %add2.i.us.i.i, %18
  %conv.i.us.i.i = sitofp i32 %mul.i.us.i.i to double
  %div.i.us.i.i = fmul double %conv.i.us.i.i, 5.000000e-01
  %add4.i.us.i.i = fadd double %conv3.i.us.i.i, %div.i.us.i.i
  %add5.i.us.i.i = fadd double %add4.i.us.i.i, 1.000000e+00
  %div.us.i.i = fdiv double %16, %add5.i.us.i.i
  %add.us.i.i = fadd double %sum.019.us.i.i, %div.us.i.i
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %inc.us.i.i = add nsw i32 %j.018.us.i.i, 1
  %lftr.wideiv118 = trunc i64 %indvars.iv.next.i.i to i32
  %exitcond119 = icmp eq i32 %lftr.wideiv118, %5
  br i1 %exitcond119, label %for.end.us.i.i, label %for.body3.us.i.i

for.body3.lr.ph.us.i.i:                           ; preds = %for.end.us.i.i, %for.body17
  %indvars.iv26.i.i = phi i64 [ %indvars.iv.next27.i.i, %for.end.us.i.i ], [ 0, %for.body17 ]
  %19 = trunc i64 %indvars.iv26.i.i to i32
  %conv3.i.us.i.i = sitofp i32 %19 to double
  %add.i.us.i.i = add i32 %19, 1
  br label %for.body3.us.i.i

for.end.us.i7.i:                                  ; preds = %for.body3.us.i25.i
  %arrayidx5.us.i3.i = getelementptr inbounds double* %2, i64 %indvars.iv26.i26.i
  store double %add.us.i20.i, double* %arrayidx5.us.i3.i, align 8, !tbaa !1
  %indvars.iv.next27.i4.i = add nuw nsw i64 %indvars.iv26.i26.i, 1
  %lftr.wideiv124 = trunc i64 %indvars.iv.next27.i4.i to i32
  %exitcond125 = icmp eq i32 %lftr.wideiv124, %5
  br i1 %exitcond125, label %for.body3.lr.ph.us.i.i84, label %for.body3.lr.ph.us.i28.i

for.body3.us.i25.i:                               ; preds = %for.body3.lr.ph.us.i28.i, %for.body3.us.i25.i
  %indvars.iv.i8.i = phi i64 [ 0, %for.body3.lr.ph.us.i28.i ], [ %indvars.iv.next.i21.i, %for.body3.us.i25.i ]
  %sum.019.us.i9.i = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i28.i ], [ %add.us.i20.i, %for.body3.us.i25.i ]
  %j.018.us.i10.i = phi i32 [ 0, %for.body3.lr.ph.us.i28.i ], [ %inc.us.i22.i, %for.body3.us.i25.i ]
  %arrayidx.us.i11.i = getelementptr inbounds double* %3, i64 %indvars.iv.i8.i
  %20 = load double* %arrayidx.us.i11.i, align 8, !tbaa !1
  %21 = add nsw i64 %indvars.iv.i8.i, %indvars.iv26.i26.i
  %add2.i.us.i13.i = add i32 %add.i.us.i12.i, %j.018.us.i10.i
  %22 = trunc i64 %21 to i32
  %mul.i.us.i14.i = mul nsw i32 %add2.i.us.i13.i, %22
  %conv.i.us.i15.i = sitofp i32 %mul.i.us.i14.i to double
  %div.i.us.i16.i = fmul double %conv.i.us.i15.i, 5.000000e-01
  %add4.i.us.i17.i = fadd double %conv3.i.us.i27.i, %div.i.us.i16.i
  %add5.i.us.i18.i = fadd double %add4.i.us.i17.i, 1.000000e+00
  %div.us.i19.i = fdiv double %20, %add5.i.us.i18.i
  %add.us.i20.i = fadd double %sum.019.us.i9.i, %div.us.i19.i
  %indvars.iv.next.i21.i = add nuw nsw i64 %indvars.iv.i8.i, 1
  %inc.us.i22.i = add nsw i32 %j.018.us.i10.i, 1
  %lftr.wideiv122 = trunc i64 %indvars.iv.next.i21.i to i32
  %exitcond123 = icmp eq i32 %lftr.wideiv122, %5
  br i1 %exitcond123, label %for.end.us.i7.i, label %for.body3.us.i25.i

for.body3.lr.ph.us.i28.i:                         ; preds = %for.end.us.i7.i, %for.end.us.i.i
  %indvars.iv26.i26.i = phi i64 [ %indvars.iv.next27.i4.i, %for.end.us.i7.i ], [ 0, %for.end.us.i.i ]
  %23 = trunc i64 %indvars.iv26.i26.i to i32
  %conv3.i.us.i27.i = sitofp i32 %23 to double
  %add.i.us.i12.i = add i32 %23, 1
  br label %for.body3.us.i25.i

for.end.us.i.i63:                                 ; preds = %for.body3.us.i.i80
  %arrayidx5.us.i.i59 = getelementptr inbounds double* %3, i64 %indvars.iv26.i.i81
  store double %add.us.i.i75, double* %arrayidx5.us.i.i59, align 8, !tbaa !1
  %indvars.iv.next27.i.i60 = add nuw nsw i64 %indvars.iv26.i.i81, 1
  %lftr.wideiv128 = trunc i64 %indvars.iv.next27.i.i60 to i32
  %exitcond129 = icmp eq i32 %lftr.wideiv128, %5
  br i1 %exitcond129, label %for.body3.lr.ph.us.i28.i110, label %for.body3.lr.ph.us.i.i84

for.body3.us.i.i80:                               ; preds = %for.body3.lr.ph.us.i.i84, %for.body3.us.i.i80
  %indvars.iv.i.i64 = phi i64 [ 0, %for.body3.lr.ph.us.i.i84 ], [ %indvars.iv.next.i.i76, %for.body3.us.i.i80 ]
  %sum.019.us.i.i65 = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i.i84 ], [ %add.us.i.i75, %for.body3.us.i.i80 ]
  %j.018.us.i.i66 = phi i32 [ 0, %for.body3.lr.ph.us.i.i84 ], [ %inc.us.i.i77, %for.body3.us.i.i80 ]
  %arrayidx.us.i.i67 = getelementptr inbounds double* %2, i64 %indvars.iv.i.i64
  %24 = load double* %arrayidx.us.i.i67, align 8, !tbaa !1
  %25 = add nsw i64 %indvars.iv.i.i64, %indvars.iv26.i.i81
  %add2.i.us.i.i68 = add i32 %add.i.us.i.i83, %j.018.us.i.i66
  %26 = trunc i64 %25 to i32
  %mul.i.us.i.i69 = mul nsw i32 %add2.i.us.i.i68, %26
  %conv.i.us.i.i70 = sitofp i32 %mul.i.us.i.i69 to double
  %div.i.us.i.i71 = fmul double %conv.i.us.i.i70, 5.000000e-01
  %add4.i.us.i.i72 = fadd double %conv3.i.us.i.i82, %div.i.us.i.i71
  %add5.i.us.i.i73 = fadd double %add4.i.us.i.i72, 1.000000e+00
  %div.us.i.i74 = fdiv double %24, %add5.i.us.i.i73
  %add.us.i.i75 = fadd double %sum.019.us.i.i65, %div.us.i.i74
  %indvars.iv.next.i.i76 = add nuw nsw i64 %indvars.iv.i.i64, 1
  %inc.us.i.i77 = add nsw i32 %j.018.us.i.i66, 1
  %lftr.wideiv126 = trunc i64 %indvars.iv.next.i.i76 to i32
  %exitcond127 = icmp eq i32 %lftr.wideiv126, %5
  br i1 %exitcond127, label %for.end.us.i.i63, label %for.body3.us.i.i80

for.body3.lr.ph.us.i.i84:                         ; preds = %for.end.us.i.i63, %for.end.us.i7.i
  %indvars.iv26.i.i81 = phi i64 [ %indvars.iv.next27.i.i60, %for.end.us.i.i63 ], [ 0, %for.end.us.i7.i ]
  %27 = trunc i64 %indvars.iv26.i.i81 to i32
  %conv3.i.us.i.i82 = sitofp i32 %27 to double
  %add.i.us.i.i83 = add i32 %27, 1
  br label %for.body3.us.i.i80

for.end.us.i7.i89:                                ; preds = %for.body3.us.i25.i106
  %arrayidx5.us.i3.i85 = getelementptr inbounds double* %1, i64 %indvars.iv26.i26.i107
  store double %add.us.i20.i101, double* %arrayidx5.us.i3.i85, align 8, !tbaa !1
  %indvars.iv.next27.i4.i86 = add nuw nsw i64 %indvars.iv26.i26.i107, 1
  %lftr.wideiv132 = trunc i64 %indvars.iv.next27.i4.i86 to i32
  %exitcond133 = icmp eq i32 %lftr.wideiv132, %5
  br i1 %exitcond133, label %mult_AtAv_serial.exit111, label %for.body3.lr.ph.us.i28.i110

for.body3.us.i25.i106:                            ; preds = %for.body3.lr.ph.us.i28.i110, %for.body3.us.i25.i106
  %indvars.iv.i8.i90 = phi i64 [ 0, %for.body3.lr.ph.us.i28.i110 ], [ %indvars.iv.next.i21.i102, %for.body3.us.i25.i106 ]
  %sum.019.us.i9.i91 = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i28.i110 ], [ %add.us.i20.i101, %for.body3.us.i25.i106 ]
  %j.018.us.i10.i92 = phi i32 [ 0, %for.body3.lr.ph.us.i28.i110 ], [ %inc.us.i22.i103, %for.body3.us.i25.i106 ]
  %arrayidx.us.i11.i93 = getelementptr inbounds double* %3, i64 %indvars.iv.i8.i90
  %28 = load double* %arrayidx.us.i11.i93, align 8, !tbaa !1
  %29 = add nsw i64 %indvars.iv.i8.i90, %indvars.iv26.i26.i107
  %add2.i.us.i13.i94 = add i32 %add.i.us.i12.i109, %j.018.us.i10.i92
  %30 = trunc i64 %29 to i32
  %mul.i.us.i14.i95 = mul nsw i32 %add2.i.us.i13.i94, %30
  %conv.i.us.i15.i96 = sitofp i32 %mul.i.us.i14.i95 to double
  %div.i.us.i16.i97 = fmul double %conv.i.us.i15.i96, 5.000000e-01
  %add4.i.us.i17.i98 = fadd double %conv3.i.us.i27.i108, %div.i.us.i16.i97
  %add5.i.us.i18.i99 = fadd double %add4.i.us.i17.i98, 1.000000e+00
  %div.us.i19.i100 = fdiv double %28, %add5.i.us.i18.i99
  %add.us.i20.i101 = fadd double %sum.019.us.i9.i91, %div.us.i19.i100
  %indvars.iv.next.i21.i102 = add nuw nsw i64 %indvars.iv.i8.i90, 1
  %inc.us.i22.i103 = add nsw i32 %j.018.us.i10.i92, 1
  %lftr.wideiv130 = trunc i64 %indvars.iv.next.i21.i102 to i32
  %exitcond131 = icmp eq i32 %lftr.wideiv130, %5
  br i1 %exitcond131, label %for.end.us.i7.i89, label %for.body3.us.i25.i106

for.body3.lr.ph.us.i28.i110:                      ; preds = %for.end.us.i7.i89, %for.end.us.i.i63
  %indvars.iv26.i26.i107 = phi i64 [ %indvars.iv.next27.i4.i86, %for.end.us.i7.i89 ], [ 0, %for.end.us.i.i63 ]
  %31 = trunc i64 %indvars.iv26.i26.i107 to i32
  %conv3.i.us.i27.i108 = sitofp i32 %31 to double
  %add.i.us.i12.i109 = add i32 %31, 1
  br label %for.body3.us.i25.i106

mult_AtAv_serial.exit111:                         ; preds = %for.end.us.i7.i89, %for.body17
  %inc19 = add nsw i32 %i.1113, 1
  %exitcond134 = icmp eq i32 %inc19, 10
  br i1 %exitcond134, label %for.end20, label %for.body17

for.end20:                                        ; preds = %mult_AtAv_serial.exit111
  br i1 %cmp10114, label %for.body.i55, label %dot.exit

for.body.i55:                                     ; preds = %for.body.i55, %for.end20
  %indvars.iv.i46 = phi i64 [ %indvars.iv.next.i52, %for.body.i55 ], [ 0, %for.end20 ]
  %sum.09.i47 = phi double [ %add.i51, %for.body.i55 ], [ 0.000000e+00, %for.end20 ]
  %arrayidx.i48 = getelementptr inbounds double* %1, i64 %indvars.iv.i46
  %32 = load double* %arrayidx.i48, align 8, !tbaa !1
  %arrayidx2.i49 = getelementptr inbounds double* %2, i64 %indvars.iv.i46
  %33 = load double* %arrayidx2.i49, align 8, !tbaa !1
  %mul.i50 = fmul double %32, %33
  %add.i51 = fadd double %sum.09.i47, %mul.i50
  %indvars.iv.next.i52 = add nuw nsw i64 %indvars.iv.i46, 1
  %lftr.wideiv116 = trunc i64 %indvars.iv.next.i52 to i32
  %exitcond117 = icmp eq i32 %lftr.wideiv116, %5
  br i1 %exitcond117, label %for.body.i, label %for.body.i55

for.body.i:                                       ; preds = %for.body.i, %for.body.i55
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.i55 ]
  %sum.09.i = phi double [ %add.i, %for.body.i ], [ 0.000000e+00, %for.body.i55 ]
  %arrayidx.i = getelementptr inbounds double* %2, i64 %indvars.iv.i
  %34 = load double* %arrayidx.i, align 8, !tbaa !1
  %mul.i = fmul double %34, %34
  %add.i = fadd double %sum.09.i, %mul.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %5
  br i1 %exitcond, label %dot.exit, label %for.body.i

dot.exit:                                         ; preds = %for.body.i, %for.end20
  %sum.0.lcssa.i56112 = phi double [ 0.000000e+00, %for.end20 ], [ %add.i51, %for.body.i ]
  %sum.0.lcssa.i = phi double [ 0.000000e+00, %for.end20 ], [ %add.i, %for.body.i ]
  %div = fdiv double %sum.0.lcssa.i56112, %sum.0.lcssa.i
  %call23 = tail call double @sqrt(double %div) #3
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %call23) #3
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @memalign(i64, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"double", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"any pointer", metadata !3, i64 0}
!7 = metadata !{metadata !7, metadata !8, metadata !9}
!8 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!9 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!10 = metadata !{metadata !10, metadata !8, metadata !9}
