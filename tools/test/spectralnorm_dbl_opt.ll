; ModuleID = 'spectralnorm_dbl_opt.bc'
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
  %lftr.wideiv1 = trunc i64 %indvars.iv.next to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %n
  br i1 %exitcond2, label %for.end, label %for.body

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
  %lftr.wideiv = trunc i64 %indvars.iv.next27 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end8, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us ]
  %sum.019.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us ], [ %add.us, %for.body3.us ]
  %j.018.us = phi i32 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %arrayidx.us = getelementptr inbounds double* %v, i64 %indvars.iv
  %0 = load double* %arrayidx.us, align 8, !tbaa !1
  %1 = add nsw i64 %indvars.iv, %indvars.iv26
  %add2.i.us = add i32 %add.i.us, %j.018.us
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
  %lftr.wideiv1 = trunc i64 %indvars.iv.next to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %n
  br i1 %exitcond2, label %for.end.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.end.us ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv26 to i32
  %conv3.i.us = sitofp i32 %3 to double
  %add.i.us = add i32 %3, 1
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
  %lftr.wideiv = trunc i64 %indvars.iv.next27 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end8, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us ]
  %sum.019.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us ], [ %add.us, %for.body3.us ]
  %j.018.us = phi i32 [ 0, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us ]
  %arrayidx.us = getelementptr inbounds double* %v, i64 %indvars.iv
  %0 = load double* %arrayidx.us, align 8, !tbaa !1
  %1 = add nsw i64 %indvars.iv, %indvars.iv26
  %add2.i.us = add i32 %add.i.us, %j.018.us
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
  %lftr.wideiv1 = trunc i64 %indvars.iv.next to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %n
  br i1 %exitcond2, label %for.end.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.end.us ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv26 to i32
  %conv3.i.us = sitofp i32 %3 to double
  %add.i.us = add i32 %3, 1
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
  %lftr.wideiv5 = trunc i64 %indvars.iv.next27.i to i32
  %exitcond6 = icmp eq i32 %lftr.wideiv5, %n
  br i1 %exitcond6, label %for.body3.lr.ph.us.i28, label %for.body3.lr.ph.us.i

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
  %lftr.wideiv3 = trunc i64 %indvars.iv.next.i to i32
  %exitcond4 = icmp eq i32 %lftr.wideiv3, %n
  br i1 %exitcond4, label %for.end.us.i, label %for.body3.us.i

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
  %lftr.wideiv = trunc i64 %indvars.iv.next27.i4 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %mult_Atv_serial.exit, label %for.body3.lr.ph.us.i28

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
  %lftr.wideiv1 = trunc i64 %indvars.iv.next.i21 to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %n
  br i1 %exitcond2, label %for.end.us.i7, label %for.body3.us.i25

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
  %.call.inc = add i32 %and, %.call
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
  br i1 %cmp10114, label %for.body.preheader, label %dot.exit

for.body.preheader:                               ; preds = %entry
  %4 = add i32 %.call.inc, -1
  %5 = zext i32 %4 to i64
  %6 = add i64 %5, 1
  %n.vec = and i64 %6, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.body.preheader ]
  %7 = getelementptr inbounds double* %1, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %8, align 8
  %.sum144 = or i64 %index, 2
  %9 = getelementptr double* %1, i64 %.sum144
  %10 = bitcast double* %9 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %10, align 8
  %index.next = add i64 %index, 4
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body, %for.body.preheader
  %resume.val = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %6, %resume.val
  br i1 %cmp.n, label %for.body17.preheader, label %for.body

for.body:                                         ; preds = %for.body, %middle.block
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %resume.val, %middle.block ]
  %arrayidx12 = getelementptr inbounds double* %1, i64 %indvars.iv
  store double 1.000000e+00, double* %arrayidx12, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv135 = trunc i64 %indvars.iv.next to i32
  %exitcond136 = icmp eq i32 %lftr.wideiv135, %.call.inc
  br i1 %exitcond136, label %for.body17.preheader, label %for.body, !llvm.loop !10

for.body17.preheader:                             ; preds = %for.body, %middle.block
  br i1 %cmp10114, label %for.body17.preheader.split.us, label %dot.exit

for.body17.preheader.split.us:                    ; preds = %for.body17.preheader
  %12 = and i32 %.call, 1
  %13 = add i32 %.call, %12
  br label %for.body3.lr.ph.us.i.i.preheader.us

for.body3.lr.ph.us.i.i.us:                        ; preds = %for.body3.lr.ph.us.i.i.preheader.us, %for.end.us.i.i.us
  %indvars.iv26.i.i.us = phi i64 [ %indvars.iv.next27.i.i.us, %for.end.us.i.i.us ], [ 0, %for.body3.lr.ph.us.i.i.preheader.us ]
  %14 = trunc i64 %indvars.iv26.i.i.us to i32
  %conv3.i.us.i.i.us = sitofp i32 %14 to double
  %add.i.us.i.i.us = add i32 %14, 1
  br label %for.body3.us.i.i.us

for.body3.us.i.i.us:                              ; preds = %for.body3.us.i.i.us, %for.body3.lr.ph.us.i.i.us
  %indvars.iv.i.i.us = phi i64 [ 0, %for.body3.lr.ph.us.i.i.us ], [ %indvars.iv.next.i.i.us, %for.body3.us.i.i.us ]
  %sum.019.us.i.i.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i.i.us ], [ %add.us.i.i.us, %for.body3.us.i.i.us ]
  %j.018.us.i.i.us = phi i32 [ 0, %for.body3.lr.ph.us.i.i.us ], [ %inc.us.i.i.us, %for.body3.us.i.i.us ]
  %arrayidx.us.i.i.us = getelementptr inbounds double* %1, i64 %indvars.iv.i.i.us
  %15 = load double* %arrayidx.us.i.i.us, align 8, !tbaa !1
  %16 = add nsw i64 %indvars.iv.i.i.us, %indvars.iv26.i.i.us
  %add2.i.us.i.i.us = add i32 %add.i.us.i.i.us, %j.018.us.i.i.us
  %17 = trunc i64 %16 to i32
  %mul.i.us.i.i.us = mul nsw i32 %add2.i.us.i.i.us, %17
  %conv.i.us.i.i.us = sitofp i32 %mul.i.us.i.i.us to double
  %div.i.us.i.i.us = fmul double %conv.i.us.i.i.us, 5.000000e-01
  %add4.i.us.i.i.us = fadd double %conv3.i.us.i.i.us, %div.i.us.i.i.us
  %add5.i.us.i.i.us = fadd double %add4.i.us.i.i.us, 1.000000e+00
  %div.us.i.i.us = fdiv double %15, %add5.i.us.i.i.us
  %add.us.i.i.us = fadd double %sum.019.us.i.i.us, %div.us.i.i.us
  %indvars.iv.next.i.i.us = add nuw nsw i64 %indvars.iv.i.i.us, 1
  %inc.us.i.i.us = add nsw i32 %j.018.us.i.i.us, 1
  %lftr.wideiv4 = trunc i64 %indvars.iv.next.i.i.us to i32
  %exitcond5 = icmp eq i32 %lftr.wideiv4, %13
  br i1 %exitcond5, label %for.end.us.i.i.us, label %for.body3.us.i.i.us

for.end.us.i.i.us:                                ; preds = %for.body3.us.i.i.us
  %arrayidx5.us.i.i.us = getelementptr inbounds double* %3, i64 %indvars.iv26.i.i.us
  store double %add.us.i.i.us, double* %arrayidx5.us.i.i.us, align 8, !tbaa !1
  %indvars.iv.next27.i.i.us = add nuw nsw i64 %indvars.iv26.i.i.us, 1
  %lftr.wideiv6 = trunc i64 %indvars.iv.next27.i.i.us to i32
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %13
  br i1 %exitcond7, label %for.body3.lr.ph.us.i28.i.us, label %for.body3.lr.ph.us.i.i.us

for.body3.lr.ph.us.i28.i.us:                      ; preds = %for.end.us.i7.i.us, %for.end.us.i.i.us
  %indvars.iv26.i26.i.us = phi i64 [ %indvars.iv.next27.i4.i.us, %for.end.us.i7.i.us ], [ 0, %for.end.us.i.i.us ]
  %18 = trunc i64 %indvars.iv26.i26.i.us to i32
  %conv3.i.us.i27.i.us = sitofp i32 %18 to double
  %add.i.us.i12.i.us = add i32 %18, 1
  br label %for.body3.us.i25.i.us

for.body3.us.i25.i.us:                            ; preds = %for.body3.us.i25.i.us, %for.body3.lr.ph.us.i28.i.us
  %indvars.iv.i8.i.us = phi i64 [ 0, %for.body3.lr.ph.us.i28.i.us ], [ %indvars.iv.next.i21.i.us, %for.body3.us.i25.i.us ]
  %sum.019.us.i9.i.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i28.i.us ], [ %add.us.i20.i.us, %for.body3.us.i25.i.us ]
  %j.018.us.i10.i.us = phi i32 [ 0, %for.body3.lr.ph.us.i28.i.us ], [ %inc.us.i22.i.us, %for.body3.us.i25.i.us ]
  %arrayidx.us.i11.i.us = getelementptr inbounds double* %3, i64 %indvars.iv.i8.i.us
  %19 = load double* %arrayidx.us.i11.i.us, align 8, !tbaa !1
  %20 = add nsw i64 %indvars.iv.i8.i.us, %indvars.iv26.i26.i.us
  %add2.i.us.i13.i.us = add i32 %add.i.us.i12.i.us, %j.018.us.i10.i.us
  %21 = trunc i64 %20 to i32
  %mul.i.us.i14.i.us = mul nsw i32 %add2.i.us.i13.i.us, %21
  %conv.i.us.i15.i.us = sitofp i32 %mul.i.us.i14.i.us to double
  %div.i.us.i16.i.us = fmul double %conv.i.us.i15.i.us, 5.000000e-01
  %add4.i.us.i17.i.us = fadd double %conv3.i.us.i27.i.us, %div.i.us.i16.i.us
  %add5.i.us.i18.i.us = fadd double %add4.i.us.i17.i.us, 1.000000e+00
  %div.us.i19.i.us = fdiv double %19, %add5.i.us.i18.i.us
  %add.us.i20.i.us = fadd double %sum.019.us.i9.i.us, %div.us.i19.i.us
  %indvars.iv.next.i21.i.us = add nuw nsw i64 %indvars.iv.i8.i.us, 1
  %inc.us.i22.i.us = add nsw i32 %j.018.us.i10.i.us, 1
  %lftr.wideiv8 = trunc i64 %indvars.iv.next.i21.i.us to i32
  %exitcond9 = icmp eq i32 %lftr.wideiv8, %13
  br i1 %exitcond9, label %for.end.us.i7.i.us, label %for.body3.us.i25.i.us

for.end.us.i7.i.us:                               ; preds = %for.body3.us.i25.i.us
  %arrayidx5.us.i3.i.us = getelementptr inbounds double* %2, i64 %indvars.iv26.i26.i.us
  store double %add.us.i20.i.us, double* %arrayidx5.us.i3.i.us, align 8, !tbaa !1
  %indvars.iv.next27.i4.i.us = add nuw nsw i64 %indvars.iv26.i26.i.us, 1
  %lftr.wideiv10 = trunc i64 %indvars.iv.next27.i4.i.us to i32
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %13
  br i1 %exitcond11, label %for.body3.lr.ph.us.i.i84.us, label %for.body3.lr.ph.us.i28.i.us

for.body3.lr.ph.us.i.i84.us:                      ; preds = %for.end.us.i.i63.us, %for.end.us.i7.i.us
  %indvars.iv26.i.i81.us = phi i64 [ %indvars.iv.next27.i.i60.us, %for.end.us.i.i63.us ], [ 0, %for.end.us.i7.i.us ]
  %22 = trunc i64 %indvars.iv26.i.i81.us to i32
  %conv3.i.us.i.i82.us = sitofp i32 %22 to double
  %add.i.us.i.i83.us = add i32 %22, 1
  br label %for.body3.us.i.i80.us

for.body3.us.i.i80.us:                            ; preds = %for.body3.us.i.i80.us, %for.body3.lr.ph.us.i.i84.us
  %indvars.iv.i.i64.us = phi i64 [ 0, %for.body3.lr.ph.us.i.i84.us ], [ %indvars.iv.next.i.i76.us, %for.body3.us.i.i80.us ]
  %sum.019.us.i.i65.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i.i84.us ], [ %add.us.i.i75.us, %for.body3.us.i.i80.us ]
  %j.018.us.i.i66.us = phi i32 [ 0, %for.body3.lr.ph.us.i.i84.us ], [ %inc.us.i.i77.us, %for.body3.us.i.i80.us ]
  %arrayidx.us.i.i67.us = getelementptr inbounds double* %2, i64 %indvars.iv.i.i64.us
  %23 = load double* %arrayidx.us.i.i67.us, align 8, !tbaa !1
  %24 = add nsw i64 %indvars.iv.i.i64.us, %indvars.iv26.i.i81.us
  %add2.i.us.i.i68.us = add i32 %add.i.us.i.i83.us, %j.018.us.i.i66.us
  %25 = trunc i64 %24 to i32
  %mul.i.us.i.i69.us = mul nsw i32 %add2.i.us.i.i68.us, %25
  %conv.i.us.i.i70.us = sitofp i32 %mul.i.us.i.i69.us to double
  %div.i.us.i.i71.us = fmul double %conv.i.us.i.i70.us, 5.000000e-01
  %add4.i.us.i.i72.us = fadd double %conv3.i.us.i.i82.us, %div.i.us.i.i71.us
  %add5.i.us.i.i73.us = fadd double %add4.i.us.i.i72.us, 1.000000e+00
  %div.us.i.i74.us = fdiv double %23, %add5.i.us.i.i73.us
  %add.us.i.i75.us = fadd double %sum.019.us.i.i65.us, %div.us.i.i74.us
  %indvars.iv.next.i.i76.us = add nuw nsw i64 %indvars.iv.i.i64.us, 1
  %inc.us.i.i77.us = add nsw i32 %j.018.us.i.i66.us, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv.next.i.i76.us to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %13
  br i1 %exitcond13, label %for.end.us.i.i63.us, label %for.body3.us.i.i80.us

for.end.us.i.i63.us:                              ; preds = %for.body3.us.i.i80.us
  %arrayidx5.us.i.i59.us = getelementptr inbounds double* %3, i64 %indvars.iv26.i.i81.us
  store double %add.us.i.i75.us, double* %arrayidx5.us.i.i59.us, align 8, !tbaa !1
  %indvars.iv.next27.i.i60.us = add nuw nsw i64 %indvars.iv26.i.i81.us, 1
  %lftr.wideiv14 = trunc i64 %indvars.iv.next27.i.i60.us to i32
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %13
  br i1 %exitcond15, label %for.body3.lr.ph.us.i28.i110.us, label %for.body3.lr.ph.us.i.i84.us

for.body3.lr.ph.us.i28.i110.us:                   ; preds = %for.end.us.i7.i89.us, %for.end.us.i.i63.us
  %indvars.iv26.i26.i107.us = phi i64 [ %indvars.iv.next27.i4.i86.us, %for.end.us.i7.i89.us ], [ 0, %for.end.us.i.i63.us ]
  %26 = trunc i64 %indvars.iv26.i26.i107.us to i32
  %conv3.i.us.i27.i108.us = sitofp i32 %26 to double
  %add.i.us.i12.i109.us = add i32 %26, 1
  br label %for.body3.us.i25.i106.us

for.body3.us.i25.i106.us:                         ; preds = %for.body3.us.i25.i106.us, %for.body3.lr.ph.us.i28.i110.us
  %indvars.iv.i8.i90.us = phi i64 [ 0, %for.body3.lr.ph.us.i28.i110.us ], [ %indvars.iv.next.i21.i102.us, %for.body3.us.i25.i106.us ]
  %sum.019.us.i9.i91.us = phi double [ 0.000000e+00, %for.body3.lr.ph.us.i28.i110.us ], [ %add.us.i20.i101.us, %for.body3.us.i25.i106.us ]
  %j.018.us.i10.i92.us = phi i32 [ 0, %for.body3.lr.ph.us.i28.i110.us ], [ %inc.us.i22.i103.us, %for.body3.us.i25.i106.us ]
  %arrayidx.us.i11.i93.us = getelementptr inbounds double* %3, i64 %indvars.iv.i8.i90.us
  %27 = load double* %arrayidx.us.i11.i93.us, align 8, !tbaa !1
  %28 = add nsw i64 %indvars.iv.i8.i90.us, %indvars.iv26.i26.i107.us
  %add2.i.us.i13.i94.us = add i32 %add.i.us.i12.i109.us, %j.018.us.i10.i92.us
  %29 = trunc i64 %28 to i32
  %mul.i.us.i14.i95.us = mul nsw i32 %add2.i.us.i13.i94.us, %29
  %conv.i.us.i15.i96.us = sitofp i32 %mul.i.us.i14.i95.us to double
  %div.i.us.i16.i97.us = fmul double %conv.i.us.i15.i96.us, 5.000000e-01
  %add4.i.us.i17.i98.us = fadd double %conv3.i.us.i27.i108.us, %div.i.us.i16.i97.us
  %add5.i.us.i18.i99.us = fadd double %add4.i.us.i17.i98.us, 1.000000e+00
  %div.us.i19.i100.us = fdiv double %27, %add5.i.us.i18.i99.us
  %add.us.i20.i101.us = fadd double %sum.019.us.i9.i91.us, %div.us.i19.i100.us
  %indvars.iv.next.i21.i102.us = add nuw nsw i64 %indvars.iv.i8.i90.us, 1
  %inc.us.i22.i103.us = add nsw i32 %j.018.us.i10.i92.us, 1
  %lftr.wideiv16 = trunc i64 %indvars.iv.next.i21.i102.us to i32
  %exitcond17 = icmp eq i32 %lftr.wideiv16, %13
  br i1 %exitcond17, label %for.end.us.i7.i89.us, label %for.body3.us.i25.i106.us

for.end.us.i7.i89.us:                             ; preds = %for.body3.us.i25.i106.us
  %arrayidx5.us.i3.i85.us = getelementptr inbounds double* %1, i64 %indvars.iv26.i26.i107.us
  store double %add.us.i20.i101.us, double* %arrayidx5.us.i3.i85.us, align 8, !tbaa !1
  %indvars.iv.next27.i4.i86.us = add nuw nsw i64 %indvars.iv26.i26.i107.us, 1
  %lftr.wideiv18 = trunc i64 %indvars.iv.next27.i4.i86.us to i32
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %13
  br i1 %exitcond19, label %mult_AtAv_serial.exit111.us, label %for.body3.lr.ph.us.i28.i110.us

mult_AtAv_serial.exit111.us:                      ; preds = %for.end.us.i7.i89.us
  %inc19.us = add nsw i32 %i.1113.us, 1
  %exitcond134.us = icmp eq i32 %inc19.us, 10
  br i1 %exitcond134.us, label %for.end20, label %for.body3.lr.ph.us.i.i.preheader.us

for.body3.lr.ph.us.i.i.preheader.us:              ; preds = %mult_AtAv_serial.exit111.us, %for.body17.preheader.split.us
  %i.1113.us = phi i32 [ %inc19.us, %mult_AtAv_serial.exit111.us ], [ 0, %for.body17.preheader.split.us ]
  br label %for.body3.lr.ph.us.i.i.us

for.end20:                                        ; preds = %mult_AtAv_serial.exit111.us
  br i1 %cmp10114, label %for.body.i55.preheader, label %dot.exit

for.body.i55.preheader:                           ; preds = %for.end20
  %30 = and i32 %.call, 1
  %31 = add i32 %.call, %30
  br label %for.body.i55

for.body.i55:                                     ; preds = %for.body.i55, %for.body.i55.preheader
  %indvars.iv.i46 = phi i64 [ %indvars.iv.next.i52, %for.body.i55 ], [ 0, %for.body.i55.preheader ]
  %sum.09.i47 = phi double [ %add.i51, %for.body.i55 ], [ 0.000000e+00, %for.body.i55.preheader ]
  %arrayidx.i48 = getelementptr inbounds double* %1, i64 %indvars.iv.i46
  %32 = load double* %arrayidx.i48, align 8, !tbaa !1
  %arrayidx2.i49 = getelementptr inbounds double* %2, i64 %indvars.iv.i46
  %33 = load double* %arrayidx2.i49, align 8, !tbaa !1
  %mul.i50 = fmul double %32, %33
  %add.i51 = fadd double %sum.09.i47, %mul.i50
  %indvars.iv.next.i52 = add nuw nsw i64 %indvars.iv.i46, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i52 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %31
  br i1 %exitcond, label %for.body.i, label %for.body.i55

for.body.i:                                       ; preds = %for.body.i, %for.body.i55
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.i55 ]
  %sum.09.i = phi double [ %add.i, %for.body.i ], [ 0.000000e+00, %for.body.i55 ]
  %arrayidx.i = getelementptr inbounds double* %2, i64 %indvars.iv.i
  %34 = load double* %arrayidx.i, align 8, !tbaa !1
  %mul.i = fmul double %34, %34
  %add.i = fadd double %sum.09.i, %mul.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %lftr.wideiv2 = trunc i64 %indvars.iv.next.i to i32
  %exitcond3 = icmp eq i32 %lftr.wideiv2, %31
  br i1 %exitcond3, label %dot.exit, label %for.body.i

dot.exit:                                         ; preds = %for.body.i, %for.end20, %for.body17.preheader, %entry
  %sum.0.lcssa.i56112 = phi double [ 0.000000e+00, %for.end20 ], [ 0.000000e+00, %for.body17.preheader ], [ 0.000000e+00, %entry ], [ %add.i51, %for.body.i ]
  %sum.0.lcssa.i = phi double [ 0.000000e+00, %for.end20 ], [ 0.000000e+00, %for.body17.preheader ], [ 0.000000e+00, %entry ], [ %add.i, %for.body.i ]
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
