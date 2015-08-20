; ModuleID = 'mandelbrot_dbl.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"buf[%d] = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @_Z17mandelbrot_serialddddxxxPx(double %x0, double %y0, double %x1, double %y1, i64 %width, i64 %height, i64 %maxIterations, i64* nocapture %output) #0 {
entry:
  %sub = fsub double %x1, %x0
  %conv = sitofp i64 %width to double
  %div = fdiv double %sub, %conv
  %sub1 = fsub double %y1, %y0
  %conv2 = sitofp i64 %height to double
  %div3 = fdiv double %sub1, %conv2
  %cmp29 = icmp sgt i64 %height, 0
  br i1 %cmp29, label %for.cond4.preheader.lr.ph, label %for.end15

for.cond4.preheader.lr.ph:                        ; preds = %entry
  %cmp527 = icmp sgt i64 %width, 0
  %cmp21.i = icmp sgt i64 %maxIterations, 0
  br i1 %cmp527, label %for.cond4.preheader.lr.ph.split.us, label %for.end15

for.cond4.preheader.lr.ph.split.us:               ; preds = %for.cond4.preheader.lr.ph
  %0 = shl i64 %width, 3
  br label %for.body6.lr.ph.us

for.inc13.us:                                     ; preds = %for.body6.lr.ph.for.body6.lr.ph.split_crit_edge.us, %_ZL6mandelddx.exit.us.us
  %inc14.us = add nsw i64 %j.030.us, 1
  %exitcond64 = icmp eq i64 %inc14.us, %height
  br i1 %exitcond64, label %for.end15, label %for.body6.lr.ph.us

for.body6.lr.ph.us:                               ; preds = %for.inc13.us, %for.cond4.preheader.lr.ph.split.us
  %j.030.us = phi i64 [ 0, %for.cond4.preheader.lr.ph.split.us ], [ %inc14.us, %for.inc13.us ]
  %1 = mul i64 %j.030.us, %width
  %conv8.us = sitofp i64 %j.030.us to double
  %mul9.us = fmul double %div3, %conv8.us
  %add10.us = fadd double %mul9.us, %y0
  br i1 %cmp21.i, label %for.body.i.preheader.us.us, label %for.body6.lr.ph.for.body6.lr.ph.split_crit_edge.us

_ZL6mandelddx.exit.us.us:                         ; preds = %if.end.i.us.us, %for.body.i.us.us
  %cci.0.lcssa.i.ph.us.us = phi i64 [ %cci.022.i.us.us, %for.body.i.us.us ], [ %inc.i.us.us, %if.end.i.us.us ]
  %arrayidx.us.us = getelementptr inbounds i64* %output, i64 %add12.us.us
  store i64 %cci.0.lcssa.i.ph.us.us, i64* %arrayidx.us.us, align 8, !tbaa !1
  %inc.us.us = add nsw i64 %i.028.us.us, 1
  %exitcond = icmp eq i64 %inc.us.us, %width
  br i1 %exitcond, label %for.inc13.us, label %for.body.i.preheader.us.us

for.body.i.preheader.us.us:                       ; preds = %_ZL6mandelddx.exit.us.us, %for.body6.lr.ph.us
  %i.028.us.us = phi i64 [ %inc.us.us, %_ZL6mandelddx.exit.us.us ], [ 0, %for.body6.lr.ph.us ]
  %conv7.us.us = sitofp i64 %i.028.us.us to double
  %mul.us.us = fmul double %div, %conv7.us.us
  %add.us.us = fadd double %mul.us.us, %x0
  %add12.us.us = add nsw i64 %i.028.us.us, %1
  br label %for.body.i.us.us

for.body.i.us.us:                                 ; preds = %if.end.i.us.us, %for.body.i.preheader.us.us
  %z_re.024.i.us.us = phi double [ %add7.i.us.us, %if.end.i.us.us ], [ %add.us.us, %for.body.i.preheader.us.us ]
  %z_im.023.i.us.us = phi double [ %add8.i.us.us, %if.end.i.us.us ], [ %add10.us, %for.body.i.preheader.us.us ]
  %cci.022.i.us.us = phi i64 [ %inc.i.us.us, %if.end.i.us.us ], [ 0, %for.body.i.preheader.us.us ]
  %mul.i.us.us = fmul double %z_re.024.i.us.us, %z_re.024.i.us.us
  %mul1.i.us.us = fmul double %z_im.023.i.us.us, %z_im.023.i.us.us
  %add.i.us.us = fadd double %mul.i.us.us, %mul1.i.us.us
  %cmp2.i.us.us = fcmp ogt double %add.i.us.us, 4.000000e+00
  br i1 %cmp2.i.us.us, label %_ZL6mandelddx.exit.us.us, label %if.end.i.us.us

if.end.i.us.us:                                   ; preds = %for.body.i.us.us
  %sub.i.us.us = fsub double %mul.i.us.us, %mul1.i.us.us
  %mul5.i.us.us = fmul double %z_re.024.i.us.us, 2.000000e+00
  %mul6.i.us.us = fmul double %z_im.023.i.us.us, %mul5.i.us.us
  %add7.i.us.us = fadd double %add.us.us, %sub.i.us.us
  %add8.i.us.us = fadd double %add10.us, %mul6.i.us.us
  %inc.i.us.us = add nsw i64 %cci.022.i.us.us, 1
  %cmp.i.us.us = icmp slt i64 %inc.i.us.us, %maxIterations
  br i1 %cmp.i.us.us, label %for.body.i.us.us, label %_ZL6mandelddx.exit.us.us

for.body6.lr.ph.for.body6.lr.ph.split_crit_edge.us: ; preds = %for.body6.lr.ph.us
  %scevgep = getelementptr i64* %output, i64 %1
  %scevgep63 = bitcast i64* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep63, i8 0, i64 %0, i32 8, i1 false)
  br label %for.inc13.us

for.end15:                                        ; preds = %for.inc13.us, %for.cond4.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: uwtable
define i32 @main() #1 {
entry:
  %call = tail call noalias i8* @_Znam(i64 2147483648) #5
  %0 = bitcast i8* %call to i64*
  br label %for.body6.lr.ph.us.i

for.inc13.us.i:                                   ; preds = %_ZL6mandelddx.exit.us.us.i
  %inc14.us.i = add nsw i64 %j.030.us.i, 1
  %exitcond64.i = icmp eq i64 %inc14.us.i, 16384
  br i1 %exitcond64.i, label %for.body6.lr.ph.us.i.1, label %for.body6.lr.ph.us.i

for.body6.lr.ph.us.i:                             ; preds = %for.inc13.us.i, %entry
  %j.030.us.i = phi i64 [ %inc14.us.i, %for.inc13.us.i ], [ 0, %entry ]
  %1 = shl i64 %j.030.us.i, 14
  %conv8.us.i = sitofp i64 %j.030.us.i to double
  %mul9.us.i = fmul double %conv8.us.i, 0x3F20000000000000
  %add10.us.i = fadd double %mul9.us.i, -1.000000e+00
  br label %for.body.i.preheader.us.us.i

_ZL6mandelddx.exit.us.us.i:                       ; preds = %if.end.i.us.us.i, %for.body.i.us.us.i
  %cci.0.lcssa.i.ph.us.us.i = phi i64 [ %cci.022.i.us.us.i, %for.body.i.us.us.i ], [ %inc.i.us.us.i, %if.end.i.us.us.i ]
  %arrayidx.us.us.i = getelementptr inbounds i64* %0, i64 %add12.us.us.i
  store i64 %cci.0.lcssa.i.ph.us.us.i, i64* %arrayidx.us.us.i, align 8, !tbaa !1
  %inc.us.us.i = add nsw i64 %i.028.us.us.i, 1
  %exitcond.i = icmp eq i64 %inc.us.us.i, 16384
  br i1 %exitcond.i, label %for.inc13.us.i, label %for.body.i.preheader.us.us.i

for.body.i.preheader.us.us.i:                     ; preds = %_ZL6mandelddx.exit.us.us.i, %for.body6.lr.ph.us.i
  %i.028.us.us.i = phi i64 [ %inc.us.us.i, %_ZL6mandelddx.exit.us.us.i ], [ 0, %for.body6.lr.ph.us.i ]
  %conv7.us.us.i = sitofp i64 %i.028.us.us.i to double
  %mul.us.us.i = fmul double %conv7.us.us.i, 0x3F28000000000000
  %add.us.us.i = fadd double %mul.us.us.i, -2.000000e+00
  %add12.us.us.i = add nsw i64 %i.028.us.us.i, %1
  br label %for.body.i.us.us.i

for.body.i.us.us.i:                               ; preds = %if.end.i.us.us.i, %for.body.i.preheader.us.us.i
  %z_re.024.i.us.us.i = phi double [ %add7.i.us.us.i, %if.end.i.us.us.i ], [ %add.us.us.i, %for.body.i.preheader.us.us.i ]
  %z_im.023.i.us.us.i = phi double [ %add8.i.us.us.i, %if.end.i.us.us.i ], [ %add10.us.i, %for.body.i.preheader.us.us.i ]
  %cci.022.i.us.us.i = phi i64 [ %inc.i.us.us.i, %if.end.i.us.us.i ], [ 0, %for.body.i.preheader.us.us.i ]
  %mul.i.us.us.i = fmul double %z_re.024.i.us.us.i, %z_re.024.i.us.us.i
  %mul1.i.us.us.i = fmul double %z_im.023.i.us.us.i, %z_im.023.i.us.us.i
  %add.i.us.us.i = fadd double %mul.i.us.us.i, %mul1.i.us.us.i
  %cmp2.i.us.us.i = fcmp ogt double %add.i.us.us.i, 4.000000e+00
  br i1 %cmp2.i.us.us.i, label %_ZL6mandelddx.exit.us.us.i, label %if.end.i.us.us.i

if.end.i.us.us.i:                                 ; preds = %for.body.i.us.us.i
  %sub.i.us.us.i = fsub double %mul.i.us.us.i, %mul1.i.us.us.i
  %mul5.i.us.us.i = fmul double %z_re.024.i.us.us.i, 2.000000e+00
  %mul6.i.us.us.i = fmul double %z_im.023.i.us.us.i, %mul5.i.us.us.i
  %add7.i.us.us.i = fadd double %add.us.us.i, %sub.i.us.us.i
  %add8.i.us.us.i = fadd double %add10.us.i, %mul6.i.us.us.i
  %inc.i.us.us.i = add nsw i64 %cci.022.i.us.us.i, 1
  %cmp.i.us.us.i = icmp slt i64 %inc.i.us.us.i, 10
  br i1 %cmp.i.us.us.i, label %for.body.i.us.us.i, label %_ZL6mandelddx.exit.us.us.i

for.body6.lr.ph.us.i.1:                           ; preds = %for.inc13.us.i.1, %for.inc13.us.i
  %j.030.us.i.1 = phi i64 [ %inc14.us.i.1, %for.inc13.us.i.1 ], [ 0, %for.inc13.us.i ]
  %2 = shl i64 %j.030.us.i.1, 14
  %conv8.us.i.1 = sitofp i64 %j.030.us.i.1 to double
  %mul9.us.i.1 = fmul double %conv8.us.i.1, 0x3F20000000000000
  %add10.us.i.1 = fadd double %mul9.us.i.1, -1.000000e+00
  br label %for.body.i.preheader.us.us.i.1

for.body.i.preheader.us.us.i.1:                   ; preds = %_ZL6mandelddx.exit.us.us.i.1, %for.body6.lr.ph.us.i.1
  %i.028.us.us.i.1 = phi i64 [ %inc.us.us.i.1, %_ZL6mandelddx.exit.us.us.i.1 ], [ 0, %for.body6.lr.ph.us.i.1 ]
  %conv7.us.us.i.1 = sitofp i64 %i.028.us.us.i.1 to double
  %mul.us.us.i.1 = fmul double %conv7.us.us.i.1, 0x3F28000000000000
  %add.us.us.i.1 = fadd double %mul.us.us.i.1, -2.000000e+00
  %add12.us.us.i.1 = add nsw i64 %i.028.us.us.i.1, %2
  br label %for.body.i.us.us.i.1

for.body.i.us.us.i.1:                             ; preds = %if.end.i.us.us.i.1, %for.body.i.preheader.us.us.i.1
  %z_re.024.i.us.us.i.1 = phi double [ %add7.i.us.us.i.1, %if.end.i.us.us.i.1 ], [ %add.us.us.i.1, %for.body.i.preheader.us.us.i.1 ]
  %z_im.023.i.us.us.i.1 = phi double [ %add8.i.us.us.i.1, %if.end.i.us.us.i.1 ], [ %add10.us.i.1, %for.body.i.preheader.us.us.i.1 ]
  %cci.022.i.us.us.i.1 = phi i64 [ %inc.i.us.us.i.1, %if.end.i.us.us.i.1 ], [ 0, %for.body.i.preheader.us.us.i.1 ]
  %mul.i.us.us.i.1 = fmul double %z_re.024.i.us.us.i.1, %z_re.024.i.us.us.i.1
  %mul1.i.us.us.i.1 = fmul double %z_im.023.i.us.us.i.1, %z_im.023.i.us.us.i.1
  %add.i.us.us.i.1 = fadd double %mul.i.us.us.i.1, %mul1.i.us.us.i.1
  %cmp2.i.us.us.i.1 = fcmp ogt double %add.i.us.us.i.1, 4.000000e+00
  br i1 %cmp2.i.us.us.i.1, label %_ZL6mandelddx.exit.us.us.i.1, label %if.end.i.us.us.i.1

if.end.i.us.us.i.1:                               ; preds = %for.body.i.us.us.i.1
  %sub.i.us.us.i.1 = fsub double %mul.i.us.us.i.1, %mul1.i.us.us.i.1
  %mul5.i.us.us.i.1 = fmul double %z_re.024.i.us.us.i.1, 2.000000e+00
  %mul6.i.us.us.i.1 = fmul double %z_im.023.i.us.us.i.1, %mul5.i.us.us.i.1
  %add7.i.us.us.i.1 = fadd double %add.us.us.i.1, %sub.i.us.us.i.1
  %add8.i.us.us.i.1 = fadd double %add10.us.i.1, %mul6.i.us.us.i.1
  %inc.i.us.us.i.1 = add nsw i64 %cci.022.i.us.us.i.1, 1
  %cmp.i.us.us.i.1 = icmp slt i64 %inc.i.us.us.i.1, 10
  br i1 %cmp.i.us.us.i.1, label %for.body.i.us.us.i.1, label %_ZL6mandelddx.exit.us.us.i.1

_ZL6mandelddx.exit.us.us.i.1:                     ; preds = %if.end.i.us.us.i.1, %for.body.i.us.us.i.1
  %cci.0.lcssa.i.ph.us.us.i.1 = phi i64 [ %cci.022.i.us.us.i.1, %for.body.i.us.us.i.1 ], [ %inc.i.us.us.i.1, %if.end.i.us.us.i.1 ]
  %arrayidx.us.us.i.1 = getelementptr inbounds i64* %0, i64 %add12.us.us.i.1
  store i64 %cci.0.lcssa.i.ph.us.us.i.1, i64* %arrayidx.us.us.i.1, align 8, !tbaa !1
  %inc.us.us.i.1 = add nsw i64 %i.028.us.us.i.1, 1
  %exitcond.i.1 = icmp eq i64 %inc.us.us.i.1, 16384
  br i1 %exitcond.i.1, label %for.inc13.us.i.1, label %for.body.i.preheader.us.us.i.1

for.inc13.us.i.1:                                 ; preds = %_ZL6mandelddx.exit.us.us.i.1
  %inc14.us.i.1 = add nsw i64 %j.030.us.i.1, 1
  %exitcond64.i.1 = icmp eq i64 %inc14.us.i.1, 16384
  br i1 %exitcond64.i.1, label %for.body6.lr.ph.us.i.2, label %for.body6.lr.ph.us.i.1

for.body6.lr.ph.us.i.2:                           ; preds = %for.inc13.us.i.2, %for.inc13.us.i.1
  %j.030.us.i.2 = phi i64 [ %inc14.us.i.2, %for.inc13.us.i.2 ], [ 0, %for.inc13.us.i.1 ]
  %3 = shl i64 %j.030.us.i.2, 14
  %conv8.us.i.2 = sitofp i64 %j.030.us.i.2 to double
  %mul9.us.i.2 = fmul double %conv8.us.i.2, 0x3F20000000000000
  %add10.us.i.2 = fadd double %mul9.us.i.2, -1.000000e+00
  br label %for.body.i.preheader.us.us.i.2

for.body.i.preheader.us.us.i.2:                   ; preds = %_ZL6mandelddx.exit.us.us.i.2, %for.body6.lr.ph.us.i.2
  %i.028.us.us.i.2 = phi i64 [ %inc.us.us.i.2, %_ZL6mandelddx.exit.us.us.i.2 ], [ 0, %for.body6.lr.ph.us.i.2 ]
  %conv7.us.us.i.2 = sitofp i64 %i.028.us.us.i.2 to double
  %mul.us.us.i.2 = fmul double %conv7.us.us.i.2, 0x3F28000000000000
  %add.us.us.i.2 = fadd double %mul.us.us.i.2, -2.000000e+00
  %add12.us.us.i.2 = add nsw i64 %i.028.us.us.i.2, %3
  br label %for.body.i.us.us.i.2

for.body.i.us.us.i.2:                             ; preds = %if.end.i.us.us.i.2, %for.body.i.preheader.us.us.i.2
  %z_re.024.i.us.us.i.2 = phi double [ %add7.i.us.us.i.2, %if.end.i.us.us.i.2 ], [ %add.us.us.i.2, %for.body.i.preheader.us.us.i.2 ]
  %z_im.023.i.us.us.i.2 = phi double [ %add8.i.us.us.i.2, %if.end.i.us.us.i.2 ], [ %add10.us.i.2, %for.body.i.preheader.us.us.i.2 ]
  %cci.022.i.us.us.i.2 = phi i64 [ %inc.i.us.us.i.2, %if.end.i.us.us.i.2 ], [ 0, %for.body.i.preheader.us.us.i.2 ]
  %mul.i.us.us.i.2 = fmul double %z_re.024.i.us.us.i.2, %z_re.024.i.us.us.i.2
  %mul1.i.us.us.i.2 = fmul double %z_im.023.i.us.us.i.2, %z_im.023.i.us.us.i.2
  %add.i.us.us.i.2 = fadd double %mul.i.us.us.i.2, %mul1.i.us.us.i.2
  %cmp2.i.us.us.i.2 = fcmp ogt double %add.i.us.us.i.2, 4.000000e+00
  br i1 %cmp2.i.us.us.i.2, label %_ZL6mandelddx.exit.us.us.i.2, label %if.end.i.us.us.i.2

if.end.i.us.us.i.2:                               ; preds = %for.body.i.us.us.i.2
  %sub.i.us.us.i.2 = fsub double %mul.i.us.us.i.2, %mul1.i.us.us.i.2
  %mul5.i.us.us.i.2 = fmul double %z_re.024.i.us.us.i.2, 2.000000e+00
  %mul6.i.us.us.i.2 = fmul double %z_im.023.i.us.us.i.2, %mul5.i.us.us.i.2
  %add7.i.us.us.i.2 = fadd double %add.us.us.i.2, %sub.i.us.us.i.2
  %add8.i.us.us.i.2 = fadd double %add10.us.i.2, %mul6.i.us.us.i.2
  %inc.i.us.us.i.2 = add nsw i64 %cci.022.i.us.us.i.2, 1
  %cmp.i.us.us.i.2 = icmp slt i64 %inc.i.us.us.i.2, 10
  br i1 %cmp.i.us.us.i.2, label %for.body.i.us.us.i.2, label %_ZL6mandelddx.exit.us.us.i.2

_ZL6mandelddx.exit.us.us.i.2:                     ; preds = %if.end.i.us.us.i.2, %for.body.i.us.us.i.2
  %cci.0.lcssa.i.ph.us.us.i.2 = phi i64 [ %cci.022.i.us.us.i.2, %for.body.i.us.us.i.2 ], [ %inc.i.us.us.i.2, %if.end.i.us.us.i.2 ]
  %arrayidx.us.us.i.2 = getelementptr inbounds i64* %0, i64 %add12.us.us.i.2
  store i64 %cci.0.lcssa.i.ph.us.us.i.2, i64* %arrayidx.us.us.i.2, align 8, !tbaa !1
  %inc.us.us.i.2 = add nsw i64 %i.028.us.us.i.2, 1
  %exitcond.i.2 = icmp eq i64 %inc.us.us.i.2, 16384
  br i1 %exitcond.i.2, label %for.inc13.us.i.2, label %for.body.i.preheader.us.us.i.2

for.inc13.us.i.2:                                 ; preds = %_ZL6mandelddx.exit.us.us.i.2
  %inc14.us.i.2 = add nsw i64 %j.030.us.i.2, 1
  %exitcond64.i.2 = icmp eq i64 %inc14.us.i.2, 16384
  br i1 %exitcond64.i.2, label %_Z17mandelbrot_serialddddxxxPx.exit.2, label %for.body6.lr.ph.us.i.2

_Z17mandelbrot_serialddddxxxPx.exit.2:            ; preds = %for.inc13.us.i.2
  %arrayidx = getelementptr inbounds i8* %call, i64 131072
  %4 = bitcast i8* %arrayidx to i64*
  %5 = load i64* %4, align 8, !tbaa !1
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i64 16384, i64 %5)
  ret i32 0
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { builtin }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"long long", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
