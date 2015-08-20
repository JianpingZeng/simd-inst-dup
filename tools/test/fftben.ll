; ModuleID = 'fftben.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [24 x i8] c"Usage: ./fft n outfile\0A\00", align 1
@.str1 = private unnamed_addr constant [85 x i8] c"A_re != ((void*)0) && A_im != ((void*)0) && W_re != ((void*)0) && W_im != ((void*)0)\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"driver.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"%n ??????????????????\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str5 = private unnamed_addr constant [30 x i8] c"could not open %s for output\0A\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"%.16f %.16f\0A\00", align 1
@.str7 = private unnamed_addr constant [15 x i8] c"%n  fffffffff\0A\00", align 1
@.str8 = private unnamed_addr constant [15 x i8] c"%f  fffffffff\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"%f, %f  fffffffff\0A\00", align 1
@.str11 = private unnamed_addr constant [41 x i8] c"af %d %d %d (u,t) %g %g %g %g (w) %g %g\0A\00", align 1
@str = private unnamed_addr constant [16 x i8] c"?????????????? \00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %cmp = icmp slt i32 %argc, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8]* @.str, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %0) #7
  tail call void @exit(i32 -1) #8
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %2 = load i8** %arrayidx, align 8, !tbaa !1
  %call1 = tail call i32 (i8*, ...)* bitcast (i32 (...)* @atoi to i32 (i8*, ...)*)(i8* %2) #6
  %conv = sext i32 %call1 to i64
  %mul = shl nsw i64 %conv, 3
  %call2 = tail call i8* @malloc(i64 %mul) #6
  %3 = bitcast i8* %call2 to double*
  %call5 = tail call i8* @malloc(i64 %mul) #6
  %4 = bitcast i8* %call5 to double*
  %5 = shl nsw i64 %conv, 2
  %div = and i64 %5, 9223372036854775804
  %call8 = tail call i8* @malloc(i64 %div) #6
  %6 = bitcast i8* %call8 to double*
  %call12 = tail call i8* @malloc(i64 %div) #6
  %7 = bitcast i8* %call12 to double*
  %cmp13 = icmp ne i8* %call2, null
  %cmp15 = icmp ne i8* %call5, null
  %or.cond = and i1 %cmp13, %cmp15
  %cmp18 = icmp ne i8* %call8, null
  %or.cond29 = and i1 %or.cond, %cmp18
  %cmp21 = icmp ne i8* %call12, null
  %or.cond30 = and i1 %or.cond29, %cmp21
  br i1 %or.cond30, label %cond.end, label %cond.false

cond.false:                                       ; preds = %if.end
  tail call void @__assert_fail(i8* getelementptr inbounds ([85 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 42, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8
  unreachable

cond.end:                                         ; preds = %if.end
  %cmp14.i = icmp sgt i32 %call1, 0
  br i1 %cmp14.i, label %for.body.i, label %compute_W.exit

for.body.i:                                       ; preds = %for.inc.i, %cond.end
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.inc.i ], [ 0, %cond.end ]
  %8 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %8, 1
  %arrayidx.i = getelementptr inbounds double* %3, i64 %indvars.iv.i
  br i1 %cmp1.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.body.i
  store double 1.000000e+00, double* %arrayidx.i, align 8, !tbaa !5
  %arrayidx3.i = getelementptr inbounds double* %4, i64 %indvars.iv.i
  store double 0.000000e+00, double* %arrayidx3.i, align 8, !tbaa !5
  br label %for.inc.i

if.else.i:                                        ; preds = %for.body.i
  store double 0.000000e+00, double* %arrayidx.i, align 8, !tbaa !5
  %arrayidx7.i = getelementptr inbounds double* %4, i64 %indvars.iv.i
  store double 0.000000e+00, double* %arrayidx7.i, align 8, !tbaa !5
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.else.i, %if.then.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %call1
  br i1 %exitcond, label %init_array.exit, label %for.body.i

init_array.exit:                                  ; preds = %for.inc.i
  %cmp3.i.i = icmp sgt i32 %call1, 1
  br i1 %cmp3.i.i, label %for.body.i.i, label %compute_W.exit

for.body.i.i:                                     ; preds = %for.body.i.i, %init_array.exit
  %res.05.i.i = phi i32 [ %inc.i.i, %for.body.i.i ], [ 0, %init_array.exit ]
  %n.addr.04.i.i = phi i32 [ %shr.i.i, %for.body.i.i ], [ %call1, %init_array.exit ]
  %shr.i.i = ashr i32 %n.addr.04.i.i, 1
  %inc.i.i = add nsw i32 %res.05.i.i, 1
  %cmp.i.i = icmp sgt i32 %shr.i.i, 1
  br i1 %cmp.i.i, label %for.body.i.i, label %for.body.lr.ph.i

for.body.lr.ph.i:                                 ; preds = %for.body.i.i
  %div.i = sdiv i32 %call1, 2
  %cmp3.i22.i = icmp sgt i32 %res.05.i.i, 0
  %conv3.i = sitofp i32 %call1 to double
  br i1 %cmp3.i22.i, label %for.body.i25.preheader.us.i, label %bitrev.exit.i

for.body.i25.us.i:                                ; preds = %for.body.i25.preheader.us.i, %for.body.i25.us.i
  %rev.06.i.us.i = phi i32 [ %or.i.us.i, %for.body.i25.us.i ], [ 0, %for.body.i25.preheader.us.i ]
  %i.05.i.us.i = phi i32 [ %inc.i24.us.i, %for.body.i25.us.i ], [ 0, %for.body.i25.preheader.us.i ]
  %inp.addr.04.i.us.i = phi i32 [ %shr.i23.us.i, %for.body.i25.us.i ], [ %i.027.us.i, %for.body.i25.preheader.us.i ]
  %shl.i.us.i = shl i32 %rev.06.i.us.i, 1
  %and.i.us.i = and i32 %inp.addr.04.i.us.i, 1
  %or.i.us.i = or i32 %and.i.us.i, %shl.i.us.i
  %shr.i23.us.i = ashr i32 %inp.addr.04.i.us.i, 1
  %inc.i24.us.i = add nsw i32 %i.05.i.us.i, 1
  %exitcond.i.us.i = icmp eq i32 %inc.i24.us.i, %res.05.i.i
  br i1 %exitcond.i.us.i, label %bitrev.exit.us.i, label %for.body.i25.us.i

bitrev.exit.us.i:                                 ; preds = %for.body.i25.us.i
  %phitmp.i = sext i32 %or.i.us.i to i64
  %conv.us.i = sitofp i32 %i.027.us.i to double
  %mul.us.i = fmul double %conv.us.i, 2.000000e+00
  %mul2.us.i = fmul double %mul.us.i, 0x400921FB54442D18
  %div4.us.i = fdiv double %mul2.us.i, %conv3.i
  %call5.us.i = tail call double @cos(double %div4.us.i) #6
  %arrayidx.us.i = getelementptr inbounds double* %6, i64 %phitmp.i
  store double %call5.us.i, double* %arrayidx.us.i, align 8, !tbaa !5
  %call11.us.i = tail call double @sin(double %div4.us.i) #6
  %arrayidx13.us.i = getelementptr inbounds double* %7, i64 %phitmp.i
  store double %call11.us.i, double* %arrayidx13.us.i, align 8, !tbaa !5
  %inc.us.i = add nsw i32 %i.027.us.i, 1
  %cmp.us.i = icmp slt i32 %inc.us.i, %div.i
  br i1 %cmp.us.i, label %for.body.i25.preheader.us.i, label %compute_W.exit

for.body.i25.preheader.us.i:                      ; preds = %bitrev.exit.us.i, %for.body.lr.ph.i
  %i.027.us.i = phi i32 [ %inc.us.i, %bitrev.exit.us.i ], [ 0, %for.body.lr.ph.i ]
  br label %for.body.i25.us.i

bitrev.exit.i:                                    ; preds = %bitrev.exit.i, %for.body.lr.ph.i
  %i.027.i = phi i32 [ %inc.i, %bitrev.exit.i ], [ 0, %for.body.lr.ph.i ]
  %conv.i = sitofp i32 %i.027.i to double
  %mul.i = fmul double %conv.i, 2.000000e+00
  %mul2.i = fmul double %mul.i, 0x400921FB54442D18
  %div4.i = fdiv double %mul2.i, %conv3.i
  %call5.i = tail call double @cos(double %div4.i) #6
  store double %call5.i, double* %6, align 8, !tbaa !5
  %call11.i = tail call double @sin(double %div4.i) #6
  store double %call11.i, double* %7, align 8, !tbaa !5
  %inc.i = add nsw i32 %i.027.i, 1
  %cmp.i = icmp slt i32 %inc.i, %div.i
  br i1 %cmp.i, label %bitrev.exit.i, label %compute_W.exit

compute_W.exit:                                   ; preds = %bitrev.exit.i, %bitrev.exit.us.i, %init_array.exit, %cond.end
  %call23 = tail call i32 (i32, double*, double*, double*, double*, ...)* bitcast (void (i32, double*, double*, double*, double*)* @fft to i32 (i32, double*, double*, double*, double*, ...)*)(i32 %call1, double* %3, double* %4, double* %6, double* %7) #6
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %call1) #6
  tail call void @permute_bitrev(i32 %call1, double* %3, double* %4)
  %call25 = tail call i32 (double*, ...)* bitcast (i32 (...)* @free to i32 (double*, ...)*)(double* %3) #6
  %call26 = tail call i32 (double*, ...)* bitcast (i32 (...)* @free to i32 (double*, ...)*)(double* %4) #6
  %call27 = tail call i32 (double*, ...)* bitcast (i32 (...)* @free to i32 (double*, ...)*)(double* %6) #6
  %call28 = tail call i32 (double*, ...)* bitcast (i32 (...)* @free to i32 (double*, ...)*)(double* %7) #6
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

declare i32 @atoi(...) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind uwtable
define void @init_array(i32 %n, double* nocapture %A_re, double* nocapture %A_im) #0 {
entry:
  %cmp14 = icmp sgt i32 %n, 0
  br i1 %cmp14, label %for.body, label %for.end

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp1 = icmp eq i32 %0, 1
  %arrayidx = getelementptr inbounds double* %A_re, i64 %indvars.iv
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store double 1.000000e+00, double* %arrayidx, align 8, !tbaa !5
  %arrayidx3 = getelementptr inbounds double* %A_im, i64 %indvars.iv
  store double 0.000000e+00, double* %arrayidx3, align 8, !tbaa !5
  br label %for.inc

if.else:                                          ; preds = %for.body
  store double 0.000000e+00, double* %arrayidx, align 8, !tbaa !5
  %arrayidx7 = getelementptr inbounds double* %A_im, i64 %indvars.iv
  store double 0.000000e+00, double* %arrayidx7, align 8, !tbaa !5
  br label %for.inc

for.inc:                                          ; preds = %if.else, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @compute_W(i32 %n, double* nocapture %W_re, double* nocapture %W_im) #0 {
entry:
  %cmp3.i = icmp sgt i32 %n, 1
  br i1 %cmp3.i, label %for.body.i, label %for.end

for.body.i:                                       ; preds = %for.body.i, %entry
  %res.05.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %entry ]
  %n.addr.04.i = phi i32 [ %shr.i, %for.body.i ], [ %n, %entry ]
  %shr.i = ashr i32 %n.addr.04.i, 1
  %inc.i = add nsw i32 %res.05.i, 1
  %cmp.i = icmp sgt i32 %shr.i, 1
  br i1 %cmp.i, label %for.body.i, label %log_2.exit

log_2.exit:                                       ; preds = %for.body.i
  %div = sdiv i32 %n, 2
  br i1 %cmp3.i, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %log_2.exit
  %cmp3.i22 = icmp sgt i32 %res.05.i, 0
  %conv3 = sitofp i32 %n to double
  br i1 %cmp3.i22, label %for.body.i25.preheader.us, label %bitrev.exit

for.body.i25.us:                                  ; preds = %for.body.i25.preheader.us, %for.body.i25.us
  %rev.06.i.us = phi i32 [ %or.i.us, %for.body.i25.us ], [ 0, %for.body.i25.preheader.us ]
  %i.05.i.us = phi i32 [ %inc.i24.us, %for.body.i25.us ], [ 0, %for.body.i25.preheader.us ]
  %inp.addr.04.i.us = phi i32 [ %shr.i23.us, %for.body.i25.us ], [ %i.027.us, %for.body.i25.preheader.us ]
  %shl.i.us = shl i32 %rev.06.i.us, 1
  %and.i.us = and i32 %inp.addr.04.i.us, 1
  %or.i.us = or i32 %and.i.us, %shl.i.us
  %shr.i23.us = ashr i32 %inp.addr.04.i.us, 1
  %inc.i24.us = add nsw i32 %i.05.i.us, 1
  %exitcond.i.us = icmp eq i32 %inc.i24.us, %res.05.i
  br i1 %exitcond.i.us, label %bitrev.exit.us, label %for.body.i25.us

bitrev.exit.us:                                   ; preds = %for.body.i25.us
  %phitmp = sext i32 %or.i.us to i64
  %conv.us = sitofp i32 %i.027.us to double
  %mul.us = fmul double %conv.us, 2.000000e+00
  %mul2.us = fmul double %mul.us, 0x400921FB54442D18
  %div4.us = fdiv double %mul2.us, %conv3
  %call5.us = tail call double @cos(double %div4.us) #6
  %arrayidx.us = getelementptr inbounds double* %W_re, i64 %phitmp
  store double %call5.us, double* %arrayidx.us, align 8, !tbaa !5
  %call11.us = tail call double @sin(double %div4.us) #6
  %arrayidx13.us = getelementptr inbounds double* %W_im, i64 %phitmp
  store double %call11.us, double* %arrayidx13.us, align 8, !tbaa !5
  %inc.us = add nsw i32 %i.027.us, 1
  %cmp.us = icmp slt i32 %inc.us, %div
  br i1 %cmp.us, label %for.body.i25.preheader.us, label %for.end

for.body.i25.preheader.us:                        ; preds = %bitrev.exit.us, %for.body.lr.ph
  %i.027.us = phi i32 [ %inc.us, %bitrev.exit.us ], [ 0, %for.body.lr.ph ]
  br label %for.body.i25.us

bitrev.exit:                                      ; preds = %bitrev.exit, %for.body.lr.ph
  %i.027 = phi i32 [ %inc, %bitrev.exit ], [ 0, %for.body.lr.ph ]
  %conv = sitofp i32 %i.027 to double
  %mul = fmul double %conv, 2.000000e+00
  %mul2 = fmul double %mul, 0x400921FB54442D18
  %div4 = fdiv double %mul2, %conv3
  %call5 = tail call double @cos(double %div4) #6
  store double %call5, double* %W_re, align 8, !tbaa !5
  %call11 = tail call double @sin(double %div4) #6
  store double %call11, double* %W_im, align 8, !tbaa !5
  %inc = add nsw i32 %i.027, 1
  %cmp = icmp slt i32 %inc, %div
  br i1 %cmp, label %bitrev.exit, label %for.end

for.end:                                          ; preds = %bitrev.exit, %bitrev.exit.us, %log_2.exit, %entry
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define void @permute_bitrev(i32 %n, double* nocapture %A_re, double* nocapture %A_im) #0 {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str7, i64 0, i64 0), i32 %n) #6
  %cmp3.i = icmp sgt i32 %n, 1
  br i1 %cmp3.i, label %for.body.i, label %log_2.exit

for.body.i:                                       ; preds = %for.body.i, %entry
  %res.05.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %entry ]
  %n.addr.04.i = phi i32 [ %shr.i, %for.body.i ], [ %n, %entry ]
  %shr.i = ashr i32 %n.addr.04.i, 1
  %inc.i = add nsw i32 %res.05.i, 1
  %cmp.i = icmp sgt i32 %shr.i, 1
  br i1 %cmp.i, label %for.body.i, label %log_2.exit

log_2.exit:                                       ; preds = %for.body.i, %entry
  %res.0.lcssa.i = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str8, i64 0, i64 0), i32 %res.0.lcssa.i) #6
  %cmp52 = icmp sgt i32 %n, 0
  br i1 %cmp52, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %log_2.exit
  %cmp3.i48 = icmp sgt i32 %res.0.lcssa.i, 0
  br i1 %cmp3.i48, label %for.body.i51.preheader.us, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.body.lr.ph
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = add i64 %1, 1
  %end.idx = add i64 %1, 1
  %n.vec = and i64 %2, 8589934560
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %for.inc.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.inc.preheader ]
  %index.next = add i64 %index, 32
  %3 = icmp eq i64 %index.next, %n.vec
  br i1 %3, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body, %for.inc.preheader
  %resume.val = phi i64 [ 0, %for.inc.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end, label %for.inc

for.body.i51.us:                                  ; preds = %for.body.i51.preheader.us, %for.body.i51.us
  %rev.06.i.us = phi i32 [ %or.i.us, %for.body.i51.us ], [ 0, %for.body.i51.preheader.us ]
  %i.05.i.us = phi i32 [ %inc.i50.us, %for.body.i51.us ], [ 0, %for.body.i51.preheader.us ]
  %inp.addr.04.i.us = phi i32 [ %shr.i49.us, %for.body.i51.us ], [ %i.053.us, %for.body.i51.preheader.us ]
  %shl.i.us = shl i32 %rev.06.i.us, 1
  %and.i.us = and i32 %inp.addr.04.i.us, 1
  %or.i.us = or i32 %and.i.us, %shl.i.us
  %shr.i49.us = ashr i32 %inp.addr.04.i.us, 1
  %inc.i50.us = add nsw i32 %i.05.i.us, 1
  %exitcond.i.us = icmp eq i32 %inc.i50.us, %res.0.lcssa.i
  br i1 %exitcond.i.us, label %bitrev.exit.us, label %for.body.i51.us

bitrev.exit.us:                                   ; preds = %for.body.i51.us
  %4 = trunc i64 %indvars.iv54 to i32
  %cmp4.us = icmp sgt i32 %or.i.us, %4
  br i1 %cmp4.us, label %if.end.us, label %for.inc.us

if.end.us:                                        ; preds = %bitrev.exit.us
  %arrayidx.us = getelementptr inbounds double* %A_re, i64 %indvars.iv54
  %5 = load double* %arrayidx.us, align 8, !tbaa !5
  %arrayidx6.us = getelementptr inbounds double* %A_im, i64 %indvars.iv54
  %6 = load double* %arrayidx6.us, align 8, !tbaa !5
  %idxprom7.us = sext i32 %or.i.us to i64
  %arrayidx8.us = getelementptr inbounds double* %A_re, i64 %idxprom7.us
  %7 = load double* %arrayidx8.us, align 8, !tbaa !5
  store double %7, double* %arrayidx.us, align 8, !tbaa !5
  %arrayidx12.us = getelementptr inbounds double* %A_im, i64 %idxprom7.us
  %8 = load double* %arrayidx12.us, align 8, !tbaa !5
  store double %8, double* %arrayidx6.us, align 8, !tbaa !5
  store double %5, double* %arrayidx8.us, align 8, !tbaa !5
  store double %6, double* %arrayidx12.us, align 8, !tbaa !5
  %9 = load double* %arrayidx8.us, align 8, !tbaa !5
  %call23.us = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str9, i64 0, i64 0), double %9, double %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.end.us, %bitrev.exit.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %inc.us = add nsw i32 %i.053.us, 1
  %lftr.wideiv56 = trunc i64 %indvars.iv.next55 to i32
  %exitcond57 = icmp eq i32 %lftr.wideiv56, %n
  br i1 %exitcond57, label %for.end, label %for.body.i51.preheader.us

for.body.i51.preheader.us:                        ; preds = %for.inc.us, %for.body.lr.ph
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.inc.us ], [ 0, %for.body.lr.ph ]
  %i.053.us = phi i32 [ %inc.us, %for.inc.us ], [ 0, %for.body.lr.ph ]
  br label %for.body.i51.us

for.inc:                                          ; preds = %for.inc, %middle.block
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %resume.val, %middle.block ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end, label %for.inc, !llvm.loop !10

for.end:                                          ; preds = %for.inc, %for.inc.us, %middle.block, %log_2.exit
  ret void
}

declare i32 @free(...) #3

; Function Attrs: nounwind readnone uwtable
define i32 @log_2(i32 %n) #5 {
entry:
  %cmp3 = icmp sgt i32 %n, 1
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %res.05 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %n.addr.04 = phi i32 [ %shr, %for.body ], [ %n, %entry ]
  %shr = ashr i32 %n.addr.04, 1
  %inc = add nsw i32 %res.05, 1
  %cmp = icmp sgt i32 %shr, 1
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %res.0.lcssa = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  ret i32 %res.0.lcssa
}

; Function Attrs: nounwind readnone uwtable
define i32 @bitrev(i32 %inp, i32 %numbits) #5 {
entry:
  %cmp3 = icmp sgt i32 %numbits, 0
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %rev.06 = phi i32 [ %or, %for.body ], [ 0, %entry ]
  %i.05 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %inp.addr.04 = phi i32 [ %shr, %for.body ], [ %inp, %entry ]
  %shl = shl i32 %rev.06, 1
  %and = and i32 %inp.addr.04, 1
  %or = or i32 %shl, %and
  %shr = ashr i32 %inp.addr.04, 1
  %inc = add nsw i32 %i.05, 1
  %exitcond = icmp eq i32 %inc, %numbits
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %rev.0.lcssa = phi i32 [ 0, %entry ], [ %or, %for.body ]
  ret i32 %rev.0.lcssa
}

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind uwtable
define void @output_array(i32 %n, double* nocapture readonly %A_re, double* nocapture readonly %A_im, i8* %outfile) #0 {
entry:
  %call = tail call %struct._IO_FILE* @fopen(i8* %outfile, i8* getelementptr inbounds ([2 x i8]* @.str4, i64 0, i64 0)) #6
  %cmp = icmp eq %struct._IO_FILE* %call, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp212 = icmp sgt i32 %n, 0
  br i1 %cmp212, label %for.body, label %for.end

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str5, i64 0, i64 0), i8* %outfile) #6
  tail call void @exit(i32 -1) #8
  unreachable

for.body:                                         ; preds = %for.body, %for.cond.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.cond.preheader ]
  %arrayidx = getelementptr inbounds double* %A_re, i64 %indvars.iv
  %0 = load double* %arrayidx, align 8, !tbaa !5
  %arrayidx4 = getelementptr inbounds double* %A_im, i64 %indvars.iv
  %1 = load double* %arrayidx4, align 8, !tbaa !5
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), double %0, double %1) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %for.cond.preheader
  %call6 = tail call i32 @fclose(%struct._IO_FILE* %call) #6
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: nounwind uwtable
define void @fft(i32 %n, double* nocapture %A_re, double* nocapture %A_im, double* nocapture readonly %W_re, double* nocapture readonly %W_im) #0 {
entry:
  %cmp121 = icmp sgt i32 %n, 1
  br i1 %cmp121, label %for.body3.lr.ph.us, label %for.end60

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.inc54.us
  %indvars.iv127 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next128, %for.inc54.us ]
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.inc54.us ]
  %g.0119.us = phi i32 [ 0, %for.body3.lr.ph.us ], [ %add55.us, %for.inc54.us ]
  %puts.us = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str, i64 0, i64 0))
  %arrayidx.us = getelementptr inbounds double* %W_re, i64 %indvars.iv127
  %0 = load double* %arrayidx.us, align 8, !tbaa !5
  %arrayidx5.us = getelementptr inbounds double* %W_im, i64 %indvars.iv127
  %1 = load double* %arrayidx5.us, align 8, !tbaa !5
  %add.us = add nsw i32 %g.0119.us, %shr.us
  %cmp7116.us = icmp sgt i32 %shr.us, 0
  br i1 %cmp7116.us, label %for.body8.us, label %for.inc54.us

for.inc54.us:                                     ; preds = %for.body8.us, %for.body3.us
  %add55.us = add nsw i32 %g.0119.us, %m.0122.us
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %cmp2.us = icmp slt i32 %add55.us, %n
  %indvars.iv.next = add nsw i64 %indvars.iv, %11
  br i1 %cmp2.us, label %for.body3.us, label %for.cond.loopexit.us

for.body8.us:                                     ; preds = %for.body8.us, %for.body3.us
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.body8.us ], [ %indvars.iv, %for.body3.us ]
  %b.0117.us = phi i32 [ %inc.us, %for.body8.us ], [ %g.0119.us, %for.body3.us ]
  %2 = add nsw i64 %indvars.iv123, %12
  %arrayidx11.us = getelementptr inbounds double* %A_re, i64 %2
  %3 = load double* %arrayidx11.us, align 8, !tbaa !5
  %mul.us = fmul double %0, %3
  %arrayidx14.us = getelementptr inbounds double* %A_im, i64 %2
  %4 = load double* %arrayidx14.us, align 8, !tbaa !5
  %mul15.us = fmul double %1, %4
  %sub.us = fsub double %mul.us, %mul15.us
  %mul19.us = fmul double %0, %4
  %mul23.us = fmul double %1, %3
  %add24.us = fadd double %mul23.us, %mul19.us
  %arrayidx26.us = getelementptr inbounds double* %A_re, i64 %indvars.iv123
  %5 = load double* %arrayidx26.us, align 8, !tbaa !5
  %arrayidx28.us = getelementptr inbounds double* %A_im, i64 %indvars.iv123
  %6 = load double* %arrayidx28.us, align 8, !tbaa !5
  %add29.us = fadd double %5, %sub.us
  store double %add29.us, double* %arrayidx26.us, align 8, !tbaa !5
  %add32.us = fadd double %6, %add24.us
  store double %add32.us, double* %arrayidx28.us, align 8, !tbaa !5
  %sub35.us = fsub double %5, %sub.us
  store double %sub35.us, double* %arrayidx11.us, align 8, !tbaa !5
  %sub39.us = fsub double %6, %add24.us
  store double %sub39.us, double* %arrayidx14.us, align 8, !tbaa !5
  %7 = load double* %arrayidx26.us, align 8, !tbaa !5
  %8 = load double* %arrayidx28.us, align 8, !tbaa !5
  %9 = load double* %arrayidx11.us, align 8, !tbaa !5
  %10 = trunc i64 %indvars.iv123 to i32
  %call53.us = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str11, i64 0, i64 0), i32 %m.0122.us, i32 %g.0119.us, i32 %10, double %7, double %8, double %9, double %sub39.us, double %0, double %1) #6
  %inc.us = add nsw i32 %b.0117.us, 1
  %cmp7.us = icmp slt i32 %inc.us, %add.us
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  br i1 %cmp7.us, label %for.body8.us, label %for.inc54.us

for.cond.loopexit.us:                             ; preds = %for.inc54.us
  %cmp.us = icmp sgt i32 %shr.us, 1
  br i1 %cmp.us, label %for.body3.lr.ph.us, label %for.end60

for.body3.lr.ph.us:                               ; preds = %for.cond.loopexit.us, %entry
  %m.0122.us = phi i32 [ %shr.us, %for.cond.loopexit.us ], [ %n, %entry ]
  %shr.us = ashr i32 %m.0122.us, 1
  %11 = sext i32 %m.0122.us to i64
  %12 = sext i32 %shr.us to i64
  br label %for.body3.us

for.end60:                                        ; preds = %for.cond.loopexit.us, %entry
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0, !0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"any pointer", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"double", metadata !3, i64 0}
!7 = metadata !{metadata !7, metadata !8, metadata !9}
!8 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!9 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!10 = metadata !{metadata !10, metadata !8, metadata !9}
