; ModuleID = 'mandelbrot_dbl_opt.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"buf[%d] = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @_Z17mandelbrot_serialddddiiiPi(double %x0, double %y0, double %x1, double %y1, i32 %width, i32 %height, i32 %maxIterations, i32* nocapture %output) #0 {
entry:
  %sub = fsub fast double %x1, %x0
  %conv = sitofp i32 %width to double
  %div = fdiv fast double %sub, %conv
  %sub1 = fsub fast double %y1, %y0
  %conv2 = sitofp i32 %height to double
  %div3 = fdiv fast double %sub1, %conv2
  %cmp29 = icmp sgt i32 %height, 0
  %cmp527 = icmp sgt i32 %width, 0
  %or.cond = and i1 %cmp29, %cmp527
  br i1 %or.cond, label %for.cond4.preheader.lr.ph.split.us, label %for.end15

for.cond4.preheader.lr.ph.split.us:               ; preds = %entry
  %cmp21.i = icmp sgt i32 %maxIterations, 0
  %0 = add i32 %width, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 2
  %3 = add i64 %2, 4
  br i1 %cmp21.i, label %for.body.i.preheader.us.us.preheader.us, label %for.inc13.us

for.body.i.preheader.us.us.us:                    ; preds = %for.body.i.preheader.us.us.preheader.us, %_ZL6mandelddi.exit.us.us.us
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us, %_ZL6mandelddi.exit.us.us.us ], [ 0, %for.body.i.preheader.us.us.preheader.us ]
  %4 = trunc i64 %indvars.iv.us to i32
  %conv7.us.us.us = sitofp i32 %4 to double
  %mul.us.us.us = fmul fast double %div, %conv7.us.us.us
  %add.us.us.us = fadd fast double %mul.us.us.us, %x0
  %5 = add nsw i64 %indvars.iv.us, %8
  br label %for.body.i.us.us.us

for.body.i.us.us.us:                              ; preds = %if.end.i.us.us.us, %for.body.i.preheader.us.us.us
  %z_re.024.i.us.us.us = phi double [ %add7.i.us.us.us, %if.end.i.us.us.us ], [ %add.us.us.us, %for.body.i.preheader.us.us.us ]
  %z_im.023.i.us.us.us = phi double [ %add8.i.us.us.us, %if.end.i.us.us.us ], [ %add10.us.us, %for.body.i.preheader.us.us.us ]
  %cci.022.i.us.us.us = phi i32 [ %inc.i.us.us.us, %if.end.i.us.us.us ], [ 0, %for.body.i.preheader.us.us.us ]
  %mul.i.us.us.us = fmul fast double %z_re.024.i.us.us.us, %z_re.024.i.us.us.us
  %mul1.i.us.us.us = fmul fast double %z_im.023.i.us.us.us, %z_im.023.i.us.us.us
  %add.i.us.us.us = fadd fast double %mul.i.us.us.us, %mul1.i.us.us.us
  %cmp2.i.us.us.us = fcmp ogt double %add.i.us.us.us, 4.000000e+00
  br i1 %cmp2.i.us.us.us, label %_ZL6mandelddi.exit.us.us.us, label %if.end.i.us.us.us

if.end.i.us.us.us:                                ; preds = %for.body.i.us.us.us
  %sub.i.us.us.us = fsub fast double %mul.i.us.us.us, %mul1.i.us.us.us
  %mul5.i.us.us.us = fmul fast double %z_re.024.i.us.us.us, 2.000000e+00
  %mul6.i.us.us.us = fmul fast double %z_im.023.i.us.us.us, %mul5.i.us.us.us
  %add7.i.us.us.us = fadd fast double %add.us.us.us, %sub.i.us.us.us
  %add8.i.us.us.us = fadd fast double %add10.us.us, %mul6.i.us.us.us
  %inc.i.us.us.us = add nsw i32 %cci.022.i.us.us.us, 1
  %cmp.i.us.us.us = icmp slt i32 %inc.i.us.us.us, %maxIterations
  br i1 %cmp.i.us.us.us, label %for.body.i.us.us.us, label %_ZL6mandelddi.exit.us.us.us

_ZL6mandelddi.exit.us.us.us:                      ; preds = %if.end.i.us.us.us, %for.body.i.us.us.us
  %cci.0.lcssa.i.ph.us.us.us = phi i32 [ %cci.022.i.us.us.us, %for.body.i.us.us.us ], [ %inc.i.us.us.us, %if.end.i.us.us.us ]
  %arrayidx.us.us.us = getelementptr inbounds i32* %output, i64 %5
  store i32 %cci.0.lcssa.i.ph.us.us.us, i32* %arrayidx.us.us.us, align 4, !tbaa !1
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv.next.us to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %width
  br i1 %exitcond2, label %for.inc13.us.us, label %for.body.i.preheader.us.us.us

for.inc13.us.us:                                  ; preds = %_ZL6mandelddi.exit.us.us.us
  %indvars.iv.next68.us = add nuw nsw i64 %indvars.iv67.us, 1
  %lftr.wideiv3 = trunc i64 %indvars.iv.next68.us to i32
  %exitcond4 = icmp eq i32 %lftr.wideiv3, %height
  br i1 %exitcond4, label %for.end15, label %for.body.i.preheader.us.us.preheader.us

for.body.i.preheader.us.us.preheader.us:          ; preds = %for.inc13.us.us, %for.cond4.preheader.lr.ph.split.us
  %indvars.iv67.us = phi i64 [ %indvars.iv.next68.us, %for.inc13.us.us ], [ 0, %for.cond4.preheader.lr.ph.split.us ]
  %6 = trunc i64 %indvars.iv67.us to i32
  %7 = mul i32 %6, %width
  %8 = sext i32 %7 to i64
  %conv8.us.us = sitofp i32 %6 to double
  %mul9.us.us = fmul fast double %div3, %conv8.us.us
  %add10.us.us = fadd fast double %mul9.us.us, %y0
  br label %for.body.i.preheader.us.us.us

for.inc13.us:                                     ; preds = %for.inc13.us, %for.cond4.preheader.lr.ph.split.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc13.us ], [ 0, %for.cond4.preheader.lr.ph.split.us ]
  %9 = trunc i64 %indvars.iv67 to i32
  %10 = mul i32 %9, %width
  %11 = sext i32 %10 to i64
  %scevgep = getelementptr i32* %output, i64 %11
  %scevgep65 = bitcast i32* %scevgep to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep65, i8 0, i64 %3, i32 4, i1 false)
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next68 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %height
  br i1 %exitcond, label %for.end15, label %for.inc13.us

for.end15:                                        ; preds = %for.inc13.us, %for.inc13.us.us, %entry
  ret void
}

; Function Attrs: uwtable
define i32 @main() #1 {
entry:
  %call = tail call noalias i8* @_Znam(i64 1073741824) #5
  %0 = bitcast i8* %call to i32*
  br label %for.body6.lr.ph.us.i

for.inc13.us.i:                                   ; preds = %_ZL6mandelddi.exit.us.us.i
  %indvars.iv.next68.i = add nuw nsw i64 %indvars.iv67.i, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next68.i, 16384
  br i1 %exitcond9, label %for.body6.lr.ph.us.i.1, label %for.body6.lr.ph.us.i

for.body6.lr.ph.us.i:                             ; preds = %for.inc13.us.i, %entry
  %indvars.iv67.i = phi i64 [ %indvars.iv.next68.i, %for.inc13.us.i ], [ 0, %entry ]
  %1 = trunc i64 %indvars.iv67.i to i32
  %2 = shl i32 %1, 14
  %3 = sext i32 %2 to i64
  %conv8.us.i = sitofp i32 %1 to double
  %mul9.us.i = fmul fast double %conv8.us.i, 0x3F20000000000000
  %add10.us.i = fadd fast double %mul9.us.i, -1.000000e+00
  br label %for.body.i.preheader.us.us.i

_ZL6mandelddi.exit.us.us.i:                       ; preds = %if.end.i.us.us.i, %for.body.i.us.us.i
  %cci.0.lcssa.i.ph.us.us.i = phi i32 [ %cci.022.i.us.us.i, %for.body.i.us.us.i ], [ %inc.i.us.us.i, %if.end.i.us.us.i ]
  %arrayidx.us.us.i = getelementptr inbounds i32* %0, i64 %5
  store i32 %cci.0.lcssa.i.ph.us.us.i, i32* %arrayidx.us.us.i, align 4, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond = icmp eq i64 %indvars.iv.next.i, 16384
  br i1 %exitcond, label %for.inc13.us.i, label %for.body.i.preheader.us.us.i

for.body.i.preheader.us.us.i:                     ; preds = %_ZL6mandelddi.exit.us.us.i, %for.body6.lr.ph.us.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %_ZL6mandelddi.exit.us.us.i ], [ 0, %for.body6.lr.ph.us.i ]
  %4 = trunc i64 %indvars.iv.i to i32
  %conv7.us.us.i = sitofp i32 %4 to double
  %mul.us.us.i = fmul fast double %conv7.us.us.i, 0x3F28000000000000
  %add.us.us.i = fadd fast double %mul.us.us.i, -2.000000e+00
  %5 = add nsw i64 %indvars.iv.i, %3
  br label %for.body.i.us.us.i

for.body.i.us.us.i:                               ; preds = %if.end.i.us.us.i, %for.body.i.preheader.us.us.i
  %z_re.024.i.us.us.i = phi double [ %add7.i.us.us.i, %if.end.i.us.us.i ], [ %add.us.us.i, %for.body.i.preheader.us.us.i ]
  %z_im.023.i.us.us.i = phi double [ %add8.i.us.us.i, %if.end.i.us.us.i ], [ %add10.us.i, %for.body.i.preheader.us.us.i ]
  %cci.022.i.us.us.i = phi i32 [ %inc.i.us.us.i, %if.end.i.us.us.i ], [ 0, %for.body.i.preheader.us.us.i ]
  %mul.i.us.us.i = fmul fast double %z_re.024.i.us.us.i, %z_re.024.i.us.us.i
  %mul1.i.us.us.i = fmul fast double %z_im.023.i.us.us.i, %z_im.023.i.us.us.i
  %add.i.us.us.i = fadd fast double %mul.i.us.us.i, %mul1.i.us.us.i
  %cmp2.i.us.us.i = fcmp ogt double %add.i.us.us.i, 4.000000e+00
  br i1 %cmp2.i.us.us.i, label %_ZL6mandelddi.exit.us.us.i, label %if.end.i.us.us.i

if.end.i.us.us.i:                                 ; preds = %for.body.i.us.us.i
  %sub.i.us.us.i = fsub fast double %mul.i.us.us.i, %mul1.i.us.us.i
  %mul5.i.us.us.i = fmul fast double %z_re.024.i.us.us.i, 2.000000e+00
  %mul6.i.us.us.i = fmul fast double %z_im.023.i.us.us.i, %mul5.i.us.us.i
  %add7.i.us.us.i = fadd fast double %add.us.us.i, %sub.i.us.us.i
  %add8.i.us.us.i = fadd fast double %add10.us.i, %mul6.i.us.us.i
  %inc.i.us.us.i = add nsw i32 %cci.022.i.us.us.i, 1
  %cmp.i.us.us.i = icmp slt i32 %inc.i.us.us.i, 10
  br i1 %cmp.i.us.us.i, label %for.body.i.us.us.i, label %_ZL6mandelddi.exit.us.us.i

for.body6.lr.ph.us.i.1:                           ; preds = %for.inc13.us.i.1, %for.inc13.us.i
  %indvars.iv67.i.1 = phi i64 [ %indvars.iv.next68.i.1, %for.inc13.us.i.1 ], [ 0, %for.inc13.us.i ]
  %6 = trunc i64 %indvars.iv67.i.1 to i32
  %7 = shl i32 %6, 14
  %8 = sext i32 %7 to i64
  %conv8.us.i.1 = sitofp i32 %6 to double
  %mul9.us.i.1 = fmul fast double %conv8.us.i.1, 0x3F20000000000000
  %add10.us.i.1 = fadd fast double %mul9.us.i.1, -1.000000e+00
  br label %for.body.i.preheader.us.us.i.1

for.body.i.preheader.us.us.i.1:                   ; preds = %_ZL6mandelddi.exit.us.us.i.1, %for.body6.lr.ph.us.i.1
  %indvars.iv.i.1 = phi i64 [ %indvars.iv.next.i.1, %_ZL6mandelddi.exit.us.us.i.1 ], [ 0, %for.body6.lr.ph.us.i.1 ]
  %9 = trunc i64 %indvars.iv.i.1 to i32
  %conv7.us.us.i.1 = sitofp i32 %9 to double
  %mul.us.us.i.1 = fmul fast double %conv7.us.us.i.1, 0x3F28000000000000
  %add.us.us.i.1 = fadd fast double %mul.us.us.i.1, -2.000000e+00
  %10 = add nsw i64 %indvars.iv.i.1, %8
  br label %for.body.i.us.us.i.1

for.body.i.us.us.i.1:                             ; preds = %if.end.i.us.us.i.1, %for.body.i.preheader.us.us.i.1
  %z_re.024.i.us.us.i.1 = phi double [ %add7.i.us.us.i.1, %if.end.i.us.us.i.1 ], [ %add.us.us.i.1, %for.body.i.preheader.us.us.i.1 ]
  %z_im.023.i.us.us.i.1 = phi double [ %add8.i.us.us.i.1, %if.end.i.us.us.i.1 ], [ %add10.us.i.1, %for.body.i.preheader.us.us.i.1 ]
  %cci.022.i.us.us.i.1 = phi i32 [ %inc.i.us.us.i.1, %if.end.i.us.us.i.1 ], [ 0, %for.body.i.preheader.us.us.i.1 ]
  %mul.i.us.us.i.1 = fmul fast double %z_re.024.i.us.us.i.1, %z_re.024.i.us.us.i.1
  %mul1.i.us.us.i.1 = fmul fast double %z_im.023.i.us.us.i.1, %z_im.023.i.us.us.i.1
  %add.i.us.us.i.1 = fadd fast double %mul.i.us.us.i.1, %mul1.i.us.us.i.1
  %cmp2.i.us.us.i.1 = fcmp ogt double %add.i.us.us.i.1, 4.000000e+00
  br i1 %cmp2.i.us.us.i.1, label %_ZL6mandelddi.exit.us.us.i.1, label %if.end.i.us.us.i.1

if.end.i.us.us.i.1:                               ; preds = %for.body.i.us.us.i.1
  %sub.i.us.us.i.1 = fsub fast double %mul.i.us.us.i.1, %mul1.i.us.us.i.1
  %mul5.i.us.us.i.1 = fmul fast double %z_re.024.i.us.us.i.1, 2.000000e+00
  %mul6.i.us.us.i.1 = fmul fast double %z_im.023.i.us.us.i.1, %mul5.i.us.us.i.1
  %add7.i.us.us.i.1 = fadd fast double %add.us.us.i.1, %sub.i.us.us.i.1
  %add8.i.us.us.i.1 = fadd fast double %add10.us.i.1, %mul6.i.us.us.i.1
  %inc.i.us.us.i.1 = add nsw i32 %cci.022.i.us.us.i.1, 1
  %cmp.i.us.us.i.1 = icmp slt i32 %inc.i.us.us.i.1, 10
  br i1 %cmp.i.us.us.i.1, label %for.body.i.us.us.i.1, label %_ZL6mandelddi.exit.us.us.i.1

_ZL6mandelddi.exit.us.us.i.1:                     ; preds = %if.end.i.us.us.i.1, %for.body.i.us.us.i.1
  %cci.0.lcssa.i.ph.us.us.i.1 = phi i32 [ %cci.022.i.us.us.i.1, %for.body.i.us.us.i.1 ], [ %inc.i.us.us.i.1, %if.end.i.us.us.i.1 ]
  %arrayidx.us.us.i.1 = getelementptr inbounds i32* %0, i64 %10
  store i32 %cci.0.lcssa.i.ph.us.us.i.1, i32* %arrayidx.us.us.i.1, align 4, !tbaa !1
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i.1, 1
  %exitcond.1 = icmp eq i64 %indvars.iv.next.i.1, 16384
  br i1 %exitcond.1, label %for.inc13.us.i.1, label %for.body.i.preheader.us.us.i.1

for.inc13.us.i.1:                                 ; preds = %_ZL6mandelddi.exit.us.us.i.1
  %indvars.iv.next68.i.1 = add nuw nsw i64 %indvars.iv67.i.1, 1
  %exitcond9.1 = icmp eq i64 %indvars.iv.next68.i.1, 16384
  br i1 %exitcond9.1, label %for.body6.lr.ph.us.i.2, label %for.body6.lr.ph.us.i.1

for.body6.lr.ph.us.i.2:                           ; preds = %for.inc13.us.i.2, %for.inc13.us.i.1
  %indvars.iv67.i.2 = phi i64 [ %indvars.iv.next68.i.2, %for.inc13.us.i.2 ], [ 0, %for.inc13.us.i.1 ]
  %11 = trunc i64 %indvars.iv67.i.2 to i32
  %12 = shl i32 %11, 14
  %13 = sext i32 %12 to i64
  %conv8.us.i.2 = sitofp i32 %11 to double
  %mul9.us.i.2 = fmul fast double %conv8.us.i.2, 0x3F20000000000000
  %add10.us.i.2 = fadd fast double %mul9.us.i.2, -1.000000e+00
  br label %for.body.i.preheader.us.us.i.2

for.body.i.preheader.us.us.i.2:                   ; preds = %_ZL6mandelddi.exit.us.us.i.2, %for.body6.lr.ph.us.i.2
  %indvars.iv.i.2 = phi i64 [ %indvars.iv.next.i.2, %_ZL6mandelddi.exit.us.us.i.2 ], [ 0, %for.body6.lr.ph.us.i.2 ]
  %14 = trunc i64 %indvars.iv.i.2 to i32
  %conv7.us.us.i.2 = sitofp i32 %14 to double
  %mul.us.us.i.2 = fmul fast double %conv7.us.us.i.2, 0x3F28000000000000
  %add.us.us.i.2 = fadd fast double %mul.us.us.i.2, -2.000000e+00
  %15 = add nsw i64 %indvars.iv.i.2, %13
  br label %for.body.i.us.us.i.2

for.body.i.us.us.i.2:                             ; preds = %if.end.i.us.us.i.2, %for.body.i.preheader.us.us.i.2
  %z_re.024.i.us.us.i.2 = phi double [ %add7.i.us.us.i.2, %if.end.i.us.us.i.2 ], [ %add.us.us.i.2, %for.body.i.preheader.us.us.i.2 ]
  %z_im.023.i.us.us.i.2 = phi double [ %add8.i.us.us.i.2, %if.end.i.us.us.i.2 ], [ %add10.us.i.2, %for.body.i.preheader.us.us.i.2 ]
  %cci.022.i.us.us.i.2 = phi i32 [ %inc.i.us.us.i.2, %if.end.i.us.us.i.2 ], [ 0, %for.body.i.preheader.us.us.i.2 ]
  %mul.i.us.us.i.2 = fmul fast double %z_re.024.i.us.us.i.2, %z_re.024.i.us.us.i.2
  %mul1.i.us.us.i.2 = fmul fast double %z_im.023.i.us.us.i.2, %z_im.023.i.us.us.i.2
  %add.i.us.us.i.2 = fadd fast double %mul.i.us.us.i.2, %mul1.i.us.us.i.2
  %cmp2.i.us.us.i.2 = fcmp ogt double %add.i.us.us.i.2, 4.000000e+00
  br i1 %cmp2.i.us.us.i.2, label %_ZL6mandelddi.exit.us.us.i.2, label %if.end.i.us.us.i.2

if.end.i.us.us.i.2:                               ; preds = %for.body.i.us.us.i.2
  %sub.i.us.us.i.2 = fsub fast double %mul.i.us.us.i.2, %mul1.i.us.us.i.2
  %mul5.i.us.us.i.2 = fmul fast double %z_re.024.i.us.us.i.2, 2.000000e+00
  %mul6.i.us.us.i.2 = fmul fast double %z_im.023.i.us.us.i.2, %mul5.i.us.us.i.2
  %add7.i.us.us.i.2 = fadd fast double %add.us.us.i.2, %sub.i.us.us.i.2
  %add8.i.us.us.i.2 = fadd fast double %add10.us.i.2, %mul6.i.us.us.i.2
  %inc.i.us.us.i.2 = add nsw i32 %cci.022.i.us.us.i.2, 1
  %cmp.i.us.us.i.2 = icmp slt i32 %inc.i.us.us.i.2, 10
  br i1 %cmp.i.us.us.i.2, label %for.body.i.us.us.i.2, label %_ZL6mandelddi.exit.us.us.i.2

_ZL6mandelddi.exit.us.us.i.2:                     ; preds = %if.end.i.us.us.i.2, %for.body.i.us.us.i.2
  %cci.0.lcssa.i.ph.us.us.i.2 = phi i32 [ %cci.022.i.us.us.i.2, %for.body.i.us.us.i.2 ], [ %inc.i.us.us.i.2, %if.end.i.us.us.i.2 ]
  %arrayidx.us.us.i.2 = getelementptr inbounds i32* %0, i64 %15
  store i32 %cci.0.lcssa.i.ph.us.us.i.2, i32* %arrayidx.us.us.i.2, align 4, !tbaa !1
  %indvars.iv.next.i.2 = add nuw nsw i64 %indvars.iv.i.2, 1
  %exitcond.2 = icmp eq i64 %indvars.iv.next.i.2, 16384
  br i1 %exitcond.2, label %for.inc13.us.i.2, label %for.body.i.preheader.us.us.i.2

for.inc13.us.i.2:                                 ; preds = %_ZL6mandelddi.exit.us.us.i.2
  %indvars.iv.next68.i.2 = add nuw nsw i64 %indvars.iv67.i.2, 1
  %exitcond9.2 = icmp eq i64 %indvars.iv.next68.i.2, 16384
  br i1 %exitcond9.2, label %_Z17mandelbrot_serialddddiiiPi.exit.2, label %for.body6.lr.ph.us.i.2

_Z17mandelbrot_serialddddiiiPi.exit.2:            ; preds = %for.inc13.us.i.2
  %arrayidx = getelementptr inbounds i8* %call, i64 65536
  %16 = bitcast i8* %arrayidx to i32*
  %17 = load i32* %16, align 4, !tbaa !1
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i32 16384, i32 %17)
  ret i32 0
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { builtin }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"int", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
