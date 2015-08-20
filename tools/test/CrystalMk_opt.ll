; ModuleID = 'CrystalMk_opt.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str2 = private unnamed_addr constant [17 x i8] c"returnVal = %f \0A\00", align 1
@.str3 = private unnamed_addr constant [44 x i8] c"i = %5d j = %5d    dtcdgd[i][j]   = %.18f \0A\00", align 1
@.str4 = private unnamed_addr constant [33 x i8] c"\0ATotal Wall time = %f seconds. \0A\00", align 1
@.str5 = private unnamed_addr constant [34 x i8] c"\0ATotal CPU  time = %f seconds. \0A\0A\00", align 1
@str = private unnamed_addr constant [31 x i8] c"\0ASequoia benchmark version 1.0\00"
@str6 = private unnamed_addr constant [16 x i8] c"\0A***** results \00"
@errors = global i32 0, align 4
@.str1 = private unnamed_addr constant [27 x i8] c"\0AWall time = %f seconds. \0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"\0ACPU  time = %f seconds. \0A\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"Number of errors is: %d\0A\00", align 1
@str5 = private unnamed_addr constant [31 x i8] c"\0A***** timing for Crystal_div \00"
@str66 = private unnamed_addr constant [31 x i8] c"\0A***** timing for Crystal_pow \00"
@str7 = private unnamed_addr constant [36 x i8] c"\0A***** timing for Crystal_Cholesky \00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %t0 = alloca %struct.timeval, align 8
  %t1 = alloca %struct.timeval, align 8
  %slipRate = alloca [40 x double], align 16
  %dSlipRate = alloca [40 x double], align 16
  %tau = alloca [40 x double], align 16
  %tauc = alloca [40 x double], align 16
  %rhs = alloca [40 x double], align 16
  %dtcdgd = alloca [40 x [40 x double]], align 16
  %dtdg = alloca [40 x [40 x double]], align 16
  %matrix = alloca [40 x [40 x double]], align 16
  %0 = bitcast [40 x [40 x double]]* %matrix to i8*
  %1 = bitcast [40 x double]* %slipRate to i8*
  call void @llvm.lifetime.start(i64 320, i8* %1) #1
  %2 = bitcast [40 x double]* %dSlipRate to i8*
  call void @llvm.lifetime.start(i64 320, i8* %2) #1
  %3 = bitcast [40 x double]* %tau to i8*
  call void @llvm.lifetime.start(i64 320, i8* %3) #1
  %4 = bitcast [40 x double]* %tauc to i8*
  call void @llvm.lifetime.start(i64 320, i8* %4) #1
  %5 = bitcast [40 x double]* %rhs to i8*
  call void @llvm.lifetime.start(i64 320, i8* %5) #1
  %6 = bitcast [40 x [40 x double]]* %dtcdgd to i8*
  call void @llvm.lifetime.start(i64 12800, i8* %6) #1
  %7 = bitcast [40 x [40 x double]]* %dtdg to i8*
  call void @llvm.lifetime.start(i64 12800, i8* %7) #1
  call void @llvm.lifetime.start(i64 12800, i8* %0) #1
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [40 x double]* %slipRate, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [40 x double]* %tau, i64 0, i64 0
  %arraydecay4 = getelementptr inbounds [40 x double]* %rhs, i64 0, i64 0
  %arraydecay6 = getelementptr inbounds [40 x [40 x double]]* %dtdg, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 12800, i32 16, i1 false)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc39.i, %entry
  %indvars.iv68.i = phi i64 [ 0, %entry ], [ %indvars.iv.next69.i, %for.inc39.i ]
  %8 = trunc i64 %indvars.iv68.i to i32
  %conv.i = sitofp i32 %8 to double
  %mul.i = fmul double %conv.i, 2.000000e-01
  %div.i = fdiv double %mul.i, 4.000000e+01
  %add.i = fadd double %div.i, 1.900000e+00
  %arrayidx.i = getelementptr inbounds [40 x double]* %slipRate, i64 0, i64 %indvars.iv68.i
  store double %add.i, double* %arrayidx.i, align 8, !tbaa !1
  %mul3.i = fmul double %add.i, 1.000000e-03
  %arrayidx5.i = getelementptr inbounds [40 x double]* %dSlipRate, i64 0, i64 %indvars.iv68.i
  store double %mul3.i, double* %arrayidx5.i, align 8, !tbaa !1
  %add7.i = fadd double %conv.i, 2.000000e+00
  %arrayidx9.i = getelementptr inbounds [40 x double]* %tau, i64 0, i64 %indvars.iv68.i
  store double %add7.i, double* %arrayidx9.i, align 8, !tbaa !1
  %arrayidx11.i = getelementptr inbounds [40 x double]* %tauc, i64 0, i64 %indvars.iv68.i
  store double 3.000000e+01, double* %arrayidx11.i, align 8, !tbaa !1
  %add13.i = fadd double %conv.i, 3.500000e+00
  %arrayidx15.i = getelementptr inbounds [40 x double]* %rhs, i64 0, i64 %indvars.iv68.i
  store double %add13.i, double* %arrayidx15.i, align 8, !tbaa !1
  %broadcast.splatinsert5 = insertelement <4 x double> undef, double %conv.i, i32 0
  %broadcast.splat6 = shufflevector <4 x double> %broadcast.splatinsert5, <4 x double> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert7 = insertelement <4 x i64> undef, i64 %indvars.iv68.i, i32 0
  %broadcast.splat8 = shufflevector <4 x i64> %broadcast.splatinsert7, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.i
  %index = phi i64 [ 0, %for.body.i ], [ %index.next, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %9 = trunc i64 %index to i32
  %broadcast.splatinsert2 = insertelement <4 x i32> undef, i32 %9, i32 0
  %broadcast.splat3 = shufflevector <4 x i32> %broadcast.splatinsert2, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction4 = add <4 x i32> %broadcast.splat3, <i32 0, i32 1, i32 2, i32 3>
  %10 = sitofp <4 x i32> %induction4 to <4 x double>
  %11 = fmul <4 x double> %10, <double 1.000000e-05, double 1.000000e-05, double 1.000000e-05, double 1.000000e-05>
  %12 = fmul <4 x double> %broadcast.splat6, %11
  %13 = fadd <4 x double> %12, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>
  %14 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 %indvars.iv68.i, i64 %index
  %15 = bitcast double* %14 to <4 x double>*
  store <4 x double> %13, <4 x double>* %15, align 16
  %16 = add nsw <4 x i64> %induction, %broadcast.splat8
  %17 = trunc <4 x i64> %16 to <4 x i32>
  %18 = sitofp <4 x i32> %17 to <4 x double>
  %19 = getelementptr inbounds [40 x [40 x double]]* %dtdg, i64 0, i64 %indvars.iv68.i, i64 %index
  %20 = bitcast double* %19 to <4 x double>*
  store <4 x double> %18, <4 x double>* %20, align 16
  %index.next = add i64 %index, 4
  %21 = icmp eq i64 %index.next, 40
  br i1 %21, label %for.inc39.i, label %vector.body, !llvm.loop !5

for.inc39.i:                                      ; preds = %vector.body
  %indvars.iv.next69.i = add nuw nsw i64 %indvars.iv68.i, 1
  %exitcond70.i = icmp eq i64 %indvars.iv.next69.i, 40
  br i1 %exitcond70.i, label %init.exit, label %for.body.i

init.exit:                                        ; preds = %for.inc39.i
  %arraydecay1 = getelementptr inbounds [40 x double]* %dSlipRate, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [40 x double]* %tauc, i64 0, i64 0
  %arraydecay5 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [40 x [40 x double]]* %matrix, i64 0, i64 0
  %call8 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call9 = tail call i64 @clock() #1
  %call18 = call double @SPEdriver(double* %arraydecay, double* %arraydecay1, double* %arraydecay2, double* %arraydecay3, double* %arraydecay4, [40 x double]* %arraydecay5, [40 x double]* %arraydecay6, [40 x double]* %arraydecay7) #1
  %call19 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call20 = tail call i64 @clock() #1
  %puts47 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str6, i64 0, i64 0))
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), double %call18) #1
  %arrayidx27 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 0
  %22 = load double* %arrayidx27, align 16, !tbaa !1
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 0, i32 0, double %22) #1
  %arrayidx27.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 13
  %23 = load double* %arrayidx27.1, align 8, !tbaa !1
  %call28.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 0, i32 13, double %23) #1
  %arrayidx27.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 26
  %24 = load double* %arrayidx27.2, align 16, !tbaa !1
  %call28.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 0, i32 26, double %24) #1
  %arrayidx27.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 39
  %25 = load double* %arrayidx27.3, align 8, !tbaa !1
  %call28.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 0, i32 39, double %25) #1
  %arrayidx27.150 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 0
  %26 = load double* %arrayidx27.150, align 16, !tbaa !1
  %call28.151 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 13, i32 0, double %26) #1
  %arrayidx27.1.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 13
  %27 = load double* %arrayidx27.1.1, align 8, !tbaa !1
  %call28.1.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 13, i32 13, double %27) #1
  %arrayidx27.2.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 26
  %28 = load double* %arrayidx27.2.1, align 16, !tbaa !1
  %call28.2.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 13, i32 26, double %28) #1
  %arrayidx27.3.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 39
  %29 = load double* %arrayidx27.3.1, align 8, !tbaa !1
  %call28.3.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 13, i32 39, double %29) #1
  %arrayidx27.252 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 0
  %30 = load double* %arrayidx27.252, align 16, !tbaa !1
  %call28.253 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 26, i32 0, double %30) #1
  %arrayidx27.1.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 13
  %31 = load double* %arrayidx27.1.2, align 8, !tbaa !1
  %call28.1.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 26, i32 13, double %31) #1
  %arrayidx27.2.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 26
  %32 = load double* %arrayidx27.2.2, align 16, !tbaa !1
  %call28.2.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 26, i32 26, double %32) #1
  %arrayidx27.3.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 39
  %33 = load double* %arrayidx27.3.2, align 8, !tbaa !1
  %call28.3.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 26, i32 39, double %33) #1
  %arrayidx27.354 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 0
  %34 = load double* %arrayidx27.354, align 16, !tbaa !1
  %call28.355 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 39, i32 0, double %34) #1
  %arrayidx27.1.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 13
  %35 = load double* %arrayidx27.1.3, align 8, !tbaa !1
  %call28.1.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 39, i32 13, double %35) #1
  %arrayidx27.2.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 26
  %36 = load double* %arrayidx27.2.3, align 16, !tbaa !1
  %call28.2.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 39, i32 26, double %36) #1
  %arrayidx27.3.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 39
  %37 = load double* %arrayidx27.3.3, align 8, !tbaa !1
  %call28.3.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i32 39, i32 39, double %37) #1
  %tv_sec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 0
  %38 = load i64* %tv_sec, align 8, !tbaa !8
  %tv_sec32 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 0
  %39 = load i64* %tv_sec32, align 8, !tbaa !8
  %sub = sub nsw i64 %38, %39
  %conv = sitofp i64 %sub to double
  %tv_usec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 1
  %40 = load i64* %tv_usec, align 8, !tbaa !11
  %tv_usec33 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 1
  %41 = load i64* %tv_usec33, align 8, !tbaa !11
  %sub34 = sub nsw i64 %40, %41
  %conv35 = sitofp i64 %sub34 to double
  %div = fdiv double %conv35, 1.000000e+06
  %add36 = fadd double %conv, %div
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str4, i64 0, i64 0), double %add36) #1
  %sub38 = sub nsw i64 %call20, %call9
  %conv39 = sitofp i64 %sub38 to double
  %div40 = fdiv double %conv39, 1.000000e+06
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str5, i64 0, i64 0), double %div40) #1
  call void @llvm.lifetime.end(i64 12800, i8* %0) #1
  call void @llvm.lifetime.end(i64 12800, i8* %7) #1
  call void @llvm.lifetime.end(i64 12800, i8* %6) #1
  call void @llvm.lifetime.end(i64 320, i8* %5) #1
  call void @llvm.lifetime.end(i64 320, i8* %4) #1
  call void @llvm.lifetime.end(i64 320, i8* %3) #1
  call void @llvm.lifetime.end(i64 320, i8* %2) #1
  call void @llvm.lifetime.end(i64 320, i8* %1) #1
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: nounwind
declare i64 @clock() #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

; Function Attrs: nounwind uwtable
define void @init(double* nocapture %slipRate, double* nocapture %dSlipRate, double* nocapture %tau, double* nocapture %tauc, double* nocapture %rhs, [40 x double]* nocapture %dtcdgd, [40 x double]* nocapture %dtdg, [40 x double]* nocapture %matrix) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc39, %entry
  %indvars.iv68 = phi i64 [ 0, %entry ], [ %indvars.iv.next69, %for.inc39 ]
  %scevgep = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv68, i64 0
  %scevgep3 = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv68, i64 39
  %scevgep5 = getelementptr [40 x double]* %dtdg, i64 %indvars.iv68, i64 0
  %scevgep7 = getelementptr [40 x double]* %dtdg, i64 %indvars.iv68, i64 39
  %scevgep9 = getelementptr [40 x double]* %matrix, i64 %indvars.iv68, i64 0
  %scevgep11 = getelementptr [40 x double]* %matrix, i64 %indvars.iv68, i64 39
  %0 = trunc i64 %indvars.iv68 to i32
  %conv = sitofp i32 %0 to double
  %mul = fmul double %conv, 2.000000e-01
  %div = fdiv double %mul, 4.000000e+01
  %add = fadd double %div, 1.900000e+00
  %arrayidx = getelementptr inbounds double* %slipRate, i64 %indvars.iv68
  store double %add, double* %arrayidx, align 8, !tbaa !1
  %mul3 = fmul double %add, 1.000000e-03
  %arrayidx5 = getelementptr inbounds double* %dSlipRate, i64 %indvars.iv68
  store double %mul3, double* %arrayidx5, align 8, !tbaa !1
  %add7 = fadd double %conv, 2.000000e+00
  %arrayidx9 = getelementptr inbounds double* %tau, i64 %indvars.iv68
  store double %add7, double* %arrayidx9, align 8, !tbaa !1
  %arrayidx11 = getelementptr inbounds double* %tauc, i64 %indvars.iv68
  store double 3.000000e+01, double* %arrayidx11, align 8, !tbaa !1
  %add13 = fadd double %conv, 3.500000e+00
  %arrayidx15 = getelementptr inbounds double* %rhs, i64 %indvars.iv68
  store double %add13, double* %arrayidx15, align 8, !tbaa !1
  %bound114 = icmp ule double* %scevgep9, %scevgep3
  %bound013 = icmp ule double* %scevgep, %scevgep11
  %bound1 = icmp ule double* %scevgep5, %scevgep3
  %bound0 = icmp ule double* %scevgep, %scevgep7
  %bound117 = icmp ule double* %scevgep9, %scevgep7
  %bound016 = icmp ule double* %scevgep5, %scevgep11
  %found.conflict15 = and i1 %bound013, %bound114
  %found.conflict = and i1 %bound0, %bound1
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  br i1 %conflict.rdx19, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %for.body
  %broadcast.splatinsert23 = insertelement <4 x double> undef, double %conv, i32 0
  %broadcast.splat24 = shufflevector <4 x double> %broadcast.splatinsert23, <4 x double> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert25 = insertelement <4 x i64> undef, i64 %indvars.iv68, i32 0
  %broadcast.splat26 = shufflevector <4 x i64> %broadcast.splatinsert25, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %1 = trunc i64 %index to i32
  %broadcast.splatinsert20 = insertelement <4 x i32> undef, i32 %1, i32 0
  %broadcast.splat21 = shufflevector <4 x i32> %broadcast.splatinsert20, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction22 = add <4 x i32> %broadcast.splat21, <i32 0, i32 1, i32 2, i32 3>
  %2 = sitofp <4 x i32> %induction22 to <4 x double>
  %3 = fmul <4 x double> %2, <double 1.000000e-05, double 1.000000e-05, double 1.000000e-05, double 1.000000e-05>
  %4 = fmul <4 x double> %broadcast.splat24, %3
  %5 = fadd <4 x double> %4, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>
  %6 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv68, i64 %index
  %7 = bitcast double* %6 to <4 x double>*
  store <4 x double> %5, <4 x double>* %7, align 8
  %8 = add nsw <4 x i64> %induction, %broadcast.splat26
  %9 = trunc <4 x i64> %8 to <4 x i32>
  %10 = sitofp <4 x i32> %9 to <4 x double>
  %11 = getelementptr inbounds [40 x double]* %dtdg, i64 %indvars.iv68, i64 %index
  %12 = bitcast double* %11 to <4 x double>*
  store <4 x double> %10, <4 x double>* %12, align 8
  %13 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv68, i64 %index
  %14 = bitcast double* %13 to <4 x double>*
  store <4 x double> zeroinitializer, <4 x double>* %14, align 8
  %index.next = add i64 %index, 4
  %15 = icmp eq i64 %index.next, 40
  br i1 %15, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body, %for.body
  %resume.val = phi i1 [ false, %for.body ], [ true, %vector.body ]
  %trunc.resume.val = phi i64 [ 0, %for.body ], [ 40, %vector.body ]
  br i1 %resume.val, label %for.inc39, label %for.body19

for.body19:                                       ; preds = %for.body19, %middle.block
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body19 ], [ %trunc.resume.val, %middle.block ]
  %16 = trunc i64 %indvars.iv to i32
  %conv20 = sitofp i32 %16 to double
  %mul21 = fmul double %conv20, 1.000000e-05
  %mul23 = fmul double %conv, %mul21
  %add24 = fadd double %mul23, 1.000000e-02
  %arrayidx28 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv68, i64 %indvars.iv
  store double %add24, double* %arrayidx28, align 8, !tbaa !1
  %17 = add nsw i64 %indvars.iv, %indvars.iv68
  %18 = trunc i64 %17 to i32
  %conv30 = sitofp i32 %18 to double
  %arrayidx34 = getelementptr inbounds [40 x double]* %dtdg, i64 %indvars.iv68, i64 %indvars.iv
  store double %conv30, double* %arrayidx34, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv68, i64 %indvars.iv
  store double 0.000000e+00, double* %arrayidx38, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 40
  br i1 %exitcond, label %for.inc39, label %for.body19, !llvm.loop !13

for.inc39:                                        ; preds = %for.body19, %middle.block
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next69, 40
  br i1 %exitcond70, label %for.end41, label %for.body

for.end41:                                        ; preds = %for.inc39
  ret void
}

; Function Attrs: nounwind uwtable
define double @SPEdriver(double* nocapture readonly %slipRate, double* nocapture readonly %dSlipRate, double* nocapture %tau, double* nocapture readonly %tauc, double* nocapture %rhs, [40 x double]* nocapture %dtcdgd, [40 x double]* nocapture readonly %dtdg, [40 x double]* nocapture %matrix) #0 {
entry:
  %rateFact.i = alloca [40 x double], align 16
  %sgn.i = alloca [40 x double], align 16
  %t0 = alloca %struct.timeval, align 8
  %t1 = alloca %struct.timeval, align 8
  %call = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call5 = tail call i64 @clock() #1
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.0157 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Crystal_div(i32 40, double 1.000000e-02, double* %slipRate, double* %dSlipRate, double* %tau, double* %tauc, double* %rhs, [40 x double]* %dtcdgd, [40 x double]* %dtdg, [40 x double]* %matrix) #1
  %inc = add nsw i32 %i.0157, 1
  %exitcond171 = icmp eq i32 %inc, 1000000
  br i1 %exitcond171, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %call6 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call7 = tail call i64 @clock() #1
  %tv_sec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 0
  %0 = load i64* %tv_sec, align 8, !tbaa !8
  %tv_sec8 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 0
  %1 = load i64* %tv_sec8, align 8, !tbaa !8
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %tv_usec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 1
  %2 = load i64* %tv_usec, align 8, !tbaa !11
  %tv_usec9 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 1
  %3 = load i64* %tv_usec9, align 8, !tbaa !11
  %sub10 = sub nsw i64 %2, %3
  %conv11 = sitofp i64 %sub10 to double
  %div = fdiv double %conv11, 1.000000e+06
  %add = fadd double %conv, %div
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str5, i64 0, i64 0))
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %add) #1
  %sub14 = sub nsw i64 %call7, %call5
  %conv15 = sitofp i64 %sub14 to double
  %div16 = fdiv double %conv15, 1.000000e+06
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %div16) #1
  %call18 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call19 = tail call i64 @clock() #1
  %arrayidx21.i = getelementptr inbounds [40 x double]* %rateFact.i, i64 0, i64 3
  %4 = bitcast [40 x double]* %rateFact.i to i8*
  %5 = bitcast [40 x double]* %sgn.i to i8*
  br label %vector.ph38

vector.ph38:                                      ; preds = %Crystal_pow.exit, %for.end
  %i.1156 = phi i32 [ 0, %for.end ], [ %inc26, %Crystal_pow.exit ]
  call void @llvm.lifetime.start(i64 320, i8* %4) #1
  call void @llvm.lifetime.start(i64 320, i8* %5) #1
  br label %vector.body39

vector.body39:                                    ; preds = %vector.body39, %vector.ph38
  %index42 = phi i64 [ 0, %vector.ph38 ], [ %index.next46, %vector.body39 ]
  %6 = getelementptr inbounds [40 x double]* %sgn.i, i64 0, i64 %index42
  %7 = bitcast double* %6 to <4 x double>*
  store <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, <4 x double>* %7, align 16
  %8 = trunc i64 %index42 to i32
  %broadcast.splatinsert50 = insertelement <4 x i32> undef, i32 %8, i32 0
  %broadcast.splat51 = shufflevector <4 x i32> %broadcast.splatinsert50, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction52 = add <4 x i32> %broadcast.splat51, <i32 0, i32 1, i32 2, i32 3>
  %9 = sitofp <4 x i32> %induction52 to <4 x double>
  %10 = fmul <4 x double> %9, <double 2.000000e-01, double 2.000000e-01, double 2.000000e-01, double 2.000000e-01>
  %11 = fmul <4 x double> %10, <double 9.000000e-01, double 9.000000e-01, double 9.000000e-01, double 9.000000e-01>
  %12 = fdiv <4 x double> %11, <double 4.000000e+01, double 4.000000e+01, double 4.000000e+01, double 4.000000e+01>
  %13 = getelementptr inbounds [40 x double]* %rateFact.i, i64 0, i64 %index42
  %14 = bitcast double* %13 to <4 x double>*
  store <4 x double> %12, <4 x double>* %14, align 16
  %index.next46 = add i64 %index42, 4
  %15 = icmp eq i64 %index.next46, 40
  br i1 %15, label %for.body7.i, label %vector.body39, !llvm.loop !14

for.body7.i:                                      ; preds = %for.body7.i, %vector.body39
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body7.i ], [ 0, %vector.body39 ]
  %arrayidx10.i = getelementptr inbounds double* %slipRate, i64 %indvars.iv.i
  %16 = load double* %arrayidx10.i, align 8, !tbaa !1
  %arrayidx12.i = getelementptr inbounds [40 x double]* %sgn.i, i64 0, i64 %indvars.iv.i
  %17 = load double* %arrayidx12.i, align 8, !tbaa !1
  %mul13.i = fmul double %16, %17
  %add.i = fadd double %mul13.i, 1.000000e-06
  %div14.i = fmul double %add.i, 5.000000e-01
  %call.i = tail call double @pow(double %div14.i, double 1.000000e-02) #1
  %mul15.i = fmul double %call.i, 1.200000e+00
  %arrayidx17.i = getelementptr inbounds [40 x double]* %rateFact.i, i64 0, i64 %indvars.iv.i
  store double %mul15.i, double* %arrayidx17.i, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next.i, 40
  br i1 %exitcond4, label %Crystal_pow.exit, label %for.body7.i

Crystal_pow.exit:                                 ; preds = %for.body7.i
  %18 = load double* %arrayidx21.i, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 320, i8* %5) #1
  call void @llvm.lifetime.end(i64 320, i8* %4) #1
  %inc26 = add nsw i32 %i.1156, 1
  %exitcond170 = icmp eq i32 %inc26, 1000000
  br i1 %exitcond170, label %for.end27, label %vector.ph38

for.end27:                                        ; preds = %Crystal_pow.exit
  %call28 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call29 = tail call i64 @clock() #1
  %19 = load i64* %tv_sec, align 8, !tbaa !8
  %20 = load i64* %tv_sec8, align 8, !tbaa !8
  %sub32 = sub nsw i64 %19, %20
  %conv33 = sitofp i64 %sub32 to double
  %21 = load i64* %tv_usec, align 8, !tbaa !11
  %22 = load i64* %tv_usec9, align 8, !tbaa !11
  %sub36 = sub nsw i64 %21, %22
  %conv37 = sitofp i64 %sub36 to double
  %div38 = fdiv double %conv37, 1.000000e+06
  %add39 = fadd double %conv33, %div38
  %puts149 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str66, i64 0, i64 0))
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %add39) #1
  %sub42 = sub nsw i64 %call29, %call19
  %conv43 = sitofp i64 %sub42 to double
  %div44 = fdiv double %conv43, 1.000000e+06
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %div44) #1
  %call46 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call47 = tail call i64 @clock() #1
  br label %vector.memcheck29

vector.memcheck29:                                ; preds = %for.inc65, %for.end27
  %indvars.iv167 = phi i64 [ 0, %for.end27 ], [ %indvars.iv.next168, %for.inc65 ]
  %scevgep23 = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv167, i64 39
  %scevgep21 = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv167, i64 0
  %scevgep19 = getelementptr [40 x double]* %matrix, i64 %indvars.iv167, i64 39
  %scevgep17 = getelementptr [40 x double]* %matrix, i64 %indvars.iv167, i64 0
  %bound126 = icmp ule double* %scevgep21, %scevgep19
  %bound025 = icmp ule double* %scevgep17, %scevgep23
  %memcheck.conflict28 = and i1 %bound025, %bound126
  br i1 %memcheck.conflict28, label %middle.block14, label %vector.body13

vector.body13:                                    ; preds = %vector.body13, %vector.memcheck29
  %index16 = phi i64 [ %index.next33, %vector.body13 ], [ 0, %vector.memcheck29 ]
  %23 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv167, i64 %index16
  %24 = bitcast double* %23 to <4 x double>*
  %wide.load37 = load <4 x double>* %24, align 8
  %25 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv167, i64 %index16
  %26 = bitcast double* %25 to <4 x double>*
  store <4 x double> %wide.load37, <4 x double>* %26, align 8
  %index.next33 = add i64 %index16, 4
  %27 = icmp eq i64 %index.next33, 40
  br i1 %27, label %middle.block14, label %vector.body13, !llvm.loop !15

middle.block14:                                   ; preds = %vector.body13, %vector.memcheck29
  %resume.val30 = phi i1 [ false, %vector.memcheck29 ], [ true, %vector.body13 ]
  %trunc.resume.val31 = phi i64 [ 0, %vector.memcheck29 ], [ 40, %vector.body13 ]
  br i1 %resume.val30, label %for.inc65, label %for.body55

for.body55:                                       ; preds = %for.body55, %middle.block14
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %for.body55 ], [ %trunc.resume.val31, %middle.block14 ]
  %arrayidx57 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv167, i64 %indvars.iv163
  %28 = load double* %arrayidx57, align 8, !tbaa !1
  %arrayidx61 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv167, i64 %indvars.iv163
  store double %28, double* %arrayidx61, align 8, !tbaa !1
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %exitcond165 = icmp eq i64 %indvars.iv.next164, 40
  br i1 %exitcond165, label %for.inc65, label %for.body55, !llvm.loop !16

for.inc65:                                        ; preds = %for.body55, %middle.block14
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next168, 40
  br i1 %exitcond169, label %for.cond72.preheader, label %vector.memcheck29

for.cond72.preheader:                             ; preds = %for.end93, %for.inc65
  %i.3153 = phi i32 [ %inc95, %for.end93 ], [ 0, %for.inc65 ]
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.inc91, %for.cond72.preheader
  %indvars.iv159 = phi i64 [ 0, %for.cond72.preheader ], [ %indvars.iv.next160, %for.inc91 ]
  %scevgep10 = getelementptr [40 x double]* %matrix, i64 %indvars.iv159, i64 39
  %scevgep8 = getelementptr [40 x double]* %matrix, i64 %indvars.iv159, i64 0
  %scevgep6 = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv159, i64 39
  %scevgep = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv159, i64 0
  %bound1 = icmp ule double* %scevgep8, %scevgep6
  %bound0 = icmp ule double* %scevgep, %scevgep10
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %29 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv159, i64 %index
  %30 = bitcast double* %29 to <4 x double>*
  %wide.load = load <4 x double>* %30, align 8
  %31 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv159, i64 %index
  %32 = bitcast double* %31 to <4 x double>*
  store <4 x double> %wide.load, <4 x double>* %32, align 8
  %index.next = add i64 %index, 4
  %33 = icmp eq i64 %index.next, 40
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body, %vector.memcheck
  %resume.val = phi i1 [ false, %vector.memcheck ], [ true, %vector.body ]
  %trunc.resume.val = phi i64 [ 0, %vector.memcheck ], [ 40, %vector.body ]
  br i1 %resume.val, label %for.inc91, label %for.body79

for.body79:                                       ; preds = %for.body79, %middle.block
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body79 ], [ %trunc.resume.val, %middle.block ]
  %arrayidx83 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv159, i64 %indvars.iv
  %34 = load double* %arrayidx83, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv159, i64 %indvars.iv
  store double %34, double* %arrayidx87, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 40
  br i1 %exitcond, label %for.inc91, label %for.body79, !llvm.loop !18

for.inc91:                                        ; preds = %for.body79, %middle.block
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next160, 40
  br i1 %exitcond161, label %for.end93, label %vector.memcheck

for.end93:                                        ; preds = %for.inc91
  tail call void @Crystal_Cholesky(i32 40, [40 x double]* %dtcdgd, double* %tau, double* %rhs) #1
  %inc95 = add nsw i32 %i.3153, 1
  %exitcond162 = icmp eq i32 %inc95, 1000000
  br i1 %exitcond162, label %for.end96, label %for.cond72.preheader

for.end96:                                        ; preds = %for.end93
  %call97 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call98 = tail call i64 @clock() #1
  %35 = load i64* %tv_sec, align 8, !tbaa !8
  %36 = load i64* %tv_sec8, align 8, !tbaa !8
  %sub101 = sub nsw i64 %35, %36
  %conv102 = sitofp i64 %sub101 to double
  %37 = load i64* %tv_usec, align 8, !tbaa !11
  %38 = load i64* %tv_usec9, align 8, !tbaa !11
  %sub105 = sub nsw i64 %37, %38
  %conv106 = sitofp i64 %sub105 to double
  %div107 = fdiv double %conv106, 1.000000e+06
  %add108 = fadd double %conv102, %div107
  %puts150 = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @str7, i64 0, i64 0))
  %call110 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %add108) #1
  %sub111 = sub nsw i64 %call98, %call47
  %conv112 = sitofp i64 %sub111 to double
  %div113 = fdiv double %conv112, 1.000000e+06
  %call114 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %div113) #1
  %39 = load i32* @errors, align 4, !tbaa !19
  %call115 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i64 0, i64 0), i32 %39) #1
  ret double %18
}

; Function Attrs: nounwind uwtable
define void @Crystal_div(i32 %nSlip, double %deltaTime, double* nocapture readonly %slipRate, double* nocapture readonly %dSlipRate, double* nocapture %tau, double* nocapture readonly %tauc, double* nocapture %rhs, [40 x double]* nocapture %dtcdgd, [40 x double]* nocapture readonly %dtdg, [40 x double]* nocapture %matrix) #0 {
entry:
  %bor_array = alloca [40 x double], align 16
  %sgn = alloca [40 x double], align 16
  %rateFact = alloca [40 x double], align 16
  %0 = bitcast [40 x double]* %bor_array to i8*
  call void @llvm.lifetime.start(i64 320, i8* %0) #1
  %1 = bitcast [40 x double]* %sgn to i8*
  call void @llvm.lifetime.start(i64 320, i8* %1) #1
  %2 = bitcast [40 x double]* %rateFact to i8*
  call void @llvm.lifetime.start(i64 320, i8* %2) #1
  %cmp206 = icmp sgt i32 %nSlip, 0
  br i1 %cmp206, label %for.body.preheader, label %for.end131

for.body.preheader:                               ; preds = %entry
  %3 = add i32 %nSlip, -1
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 1
  %end.idx45 = add i64 %4, 1
  %n.vec47 = and i64 %5, 8589934588
  %cmp.zero49 = icmp eq i64 %n.vec47, 0
  br i1 %cmp.zero49, label %middle.block42, label %vector.body41

vector.body41:                                    ; preds = %vector.body41, %for.body.preheader
  %index44 = phi i64 [ %index.next53, %vector.body41 ], [ 0, %for.body.preheader ]
  %6 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %index44
  %7 = bitcast double* %6 to <4 x double>*
  store <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, <4 x double>* %7, align 16
  %8 = trunc i64 %index44 to i32
  %broadcast.splatinsert57 = insertelement <4 x i32> undef, i32 %8, i32 0
  %broadcast.splat58 = shufflevector <4 x i32> %broadcast.splatinsert57, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction59 = add <4 x i32> %broadcast.splat58, <i32 0, i32 1, i32 2, i32 3>
  %9 = sitofp <4 x i32> %induction59 to <4 x double>
  %10 = fmul <4 x double> %9, <double 2.000000e-01, double 2.000000e-01, double 2.000000e-01, double 2.000000e-01>
  %11 = fdiv <4 x double> %10, <double 4.000000e+01, double 4.000000e+01, double 4.000000e+01, double 4.000000e+01>
  %12 = fadd <4 x double> %11, <double 9.000000e-01, double 9.000000e-01, double 9.000000e-01, double 9.000000e-01>
  %13 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %index44
  %14 = bitcast double* %13 to <4 x double>*
  store <4 x double> %12, <4 x double>* %14, align 16
  %index.next53 = add i64 %index44, 4
  %15 = icmp eq i64 %index.next53, %n.vec47
  br i1 %15, label %middle.block42, label %vector.body41, !llvm.loop !21

middle.block42:                                   ; preds = %vector.body41, %for.body.preheader
  %resume.val50 = phi i64 [ 0, %for.body.preheader ], [ %n.vec47, %vector.body41 ]
  %cmp.n52 = icmp eq i64 %end.idx45, %resume.val50
  br i1 %cmp.n52, label %for.body6.preheader, label %for.body

for.body:                                         ; preds = %for.body, %middle.block42
  %indvars.iv220 = phi i64 [ %indvars.iv.next221, %for.body ], [ %resume.val50, %middle.block42 ]
  %arrayidx = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv220
  store double 1.000000e+00, double* %arrayidx, align 8, !tbaa !1
  %16 = trunc i64 %indvars.iv220 to i32
  %conv = sitofp i32 %16 to double
  %mul = fmul double %conv, 2.000000e-01
  %div = fdiv double %mul, 4.000000e+01
  %add = fadd double %div, 9.000000e-01
  %arrayidx2 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv220
  store double %add, double* %arrayidx2, align 8, !tbaa !1
  %indvars.iv.next221 = add nuw nsw i64 %indvars.iv220, 1
  %lftr.wideiv11 = trunc i64 %indvars.iv.next221 to i32
  %exitcond12 = icmp eq i32 %lftr.wideiv11, %nSlip
  br i1 %exitcond12, label %for.body6.preheader, label %for.body, !llvm.loop !22

for.body6.preheader:                              ; preds = %for.body, %middle.block42
  %17 = add i32 %nSlip, -1
  %18 = zext i32 %17 to i64
  %19 = add i64 %18, 1
  %end.idx25 = add i64 %18, 1
  %n.vec27 = and i64 %19, 8589934588
  %cmp.zero29 = icmp eq i64 %n.vec27, 0
  br i1 %cmp.zero29, label %middle.block22, label %vector.body21

vector.body21:                                    ; preds = %vector.body21, %for.body6.preheader
  %index24 = phi i64 [ %index.next33, %vector.body21 ], [ 0, %for.body6.preheader ]
  %20 = getelementptr inbounds double* %slipRate, i64 %index24
  %21 = bitcast double* %20 to <4 x double>*
  %wide.load = load <4 x double>* %21, align 8
  %22 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %index24
  %23 = bitcast double* %22 to <4 x double>*
  %wide.load37 = load <4 x double>* %23, align 16
  %24 = fmul <4 x double> %wide.load, %wide.load37
  %25 = fadd <4 x double> %24, <double 1.000000e-06, double 1.000000e-06, double 1.000000e-06, double 1.000000e-06>
  %26 = fdiv <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %25
  %27 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %index24
  %28 = bitcast double* %27 to <4 x double>*
  store <4 x double> %26, <4 x double>* %28, align 16
  %index.next33 = add i64 %index24, 4
  %29 = icmp eq i64 %index.next33, %n.vec27
  br i1 %29, label %middle.block22, label %vector.body21, !llvm.loop !23

middle.block22:                                   ; preds = %vector.body21, %for.body6.preheader
  %resume.val30 = phi i64 [ 0, %for.body6.preheader ], [ %n.vec27, %vector.body21 ]
  %cmp.n32 = icmp eq i64 %end.idx25, %resume.val30
  br i1 %cmp.n32, label %for.body22.lr.ph.split.us, label %for.body6

for.body22.lr.ph.split.us:                        ; preds = %for.body6, %middle.block22
  %mul35 = fmul double %deltaTime, 1.200000e+00
  %30 = add i32 %nSlip, -1
  %31 = zext i32 %30 to i64
  %32 = add i64 %31, 1
  br label %for.body34.lr.ph.us

for.end45.us:                                     ; preds = %middle.block, %for.body34.us
  %.pre = load double* %arrayidx30.us, align 8, !tbaa !1
  %mul48.us = fmul double %.pre, 1.000000e-02
  %mul51.us = fmul double %36, %mul48.us
  %arrayidx53.us = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv236
  %33 = load double* %arrayidx53.us, align 8, !tbaa !1
  %mul54.us = fmul double %33, %mul51.us
  %arrayidx58.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %indvars.iv236
  %34 = load double* %arrayidx58.us, align 8, !tbaa !1
  %add59.us = fadd double %34, %mul54.us
  store double %add59.us, double* %arrayidx58.us, align 8, !tbaa !1
  %indvars.iv.next237 = add nuw nsw i64 %indvars.iv236, 1
  %lftr.wideiv7 = trunc i64 %indvars.iv.next237 to i32
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %nSlip
  br i1 %exitcond8, label %for.body66, label %for.body34.lr.ph.us

for.body34.us:                                    ; preds = %middle.block, %for.body34.us
  %indvars.iv232 = phi i64 [ %indvars.iv.next233, %for.body34.us ], [ %resume.val, %middle.block ]
  %arrayidx42.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %indvars.iv232
  store double %mul38.us, double* %arrayidx42.us, align 8, !tbaa !1
  %indvars.iv.next233 = add nuw nsw i64 %indvars.iv232, 1
  %lftr.wideiv5 = trunc i64 %indvars.iv.next233 to i32
  %exitcond6 = icmp eq i32 %lftr.wideiv5, %nSlip
  br i1 %exitcond6, label %for.end45.us, label %for.body34.us, !llvm.loop !24

for.body34.lr.ph.us:                              ; preds = %for.end45.us, %for.body22.lr.ph.split.us
  %indvars.iv236 = phi i64 [ %indvars.iv.next237, %for.end45.us ], [ 0, %for.body22.lr.ph.split.us ]
  %arrayidx24.us = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv236
  %35 = load double* %arrayidx24.us, align 8, !tbaa !1
  %mul25.us = fmul double %35, 3.000000e+01
  %arrayidx27.us = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv236
  %36 = load double* %arrayidx27.us, align 8, !tbaa !1
  %mul28.us = fmul double %mul25.us, %36
  %arrayidx30.us = getelementptr inbounds double* %tau, i64 %indvars.iv236
  store double %mul28.us, double* %arrayidx30.us, align 8, !tbaa !1
  %mul38.us = fmul double %mul35, %35
  %end.idx = add i64 %31, 1
  %n.vec = and i64 %32, 8589934576
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %for.body34.lr.ph.us
  %broadcast.splatinsert16 = insertelement <4 x double> undef, double %mul38.us, i32 0
  %broadcast.splat17 = shufflevector <4 x double> %broadcast.splatinsert16, <4 x double> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %37 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %index
  %38 = bitcast double* %37 to <4 x double>*
  store <4 x double> %broadcast.splat17, <4 x double>* %38, align 8
  %.sum62 = or i64 %index, 4
  %39 = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %.sum62
  %40 = bitcast double* %39 to <4 x double>*
  store <4 x double> %broadcast.splat17, <4 x double>* %40, align 8
  %.sum63 = or i64 %index, 8
  %41 = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %.sum63
  %42 = bitcast double* %41 to <4 x double>*
  store <4 x double> %broadcast.splat17, <4 x double>* %42, align 8
  %.sum64 = or i64 %index, 12
  %43 = getelementptr [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %.sum64
  %44 = bitcast double* %43 to <4 x double>*
  store <4 x double> %broadcast.splat17, <4 x double>* %44, align 8
  %index.next = add i64 %index, 16
  %45 = icmp eq i64 %index.next, %n.vec
  br i1 %45, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body, %for.body34.lr.ph.us
  %resume.val = phi i64 [ 0, %for.body34.lr.ph.us ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end45.us, label %for.body34.us

for.body6:                                        ; preds = %for.body6, %middle.block22
  %indvars.iv216 = phi i64 [ %indvars.iv.next217, %for.body6 ], [ %resume.val30, %middle.block22 ]
  %arrayidx8 = getelementptr inbounds double* %slipRate, i64 %indvars.iv216
  %46 = load double* %arrayidx8, align 8, !tbaa !1
  %arrayidx10 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv216
  %47 = load double* %arrayidx10, align 8, !tbaa !1
  %mul11 = fmul double %46, %47
  %add12 = fadd double %mul11, 1.000000e-06
  %div13 = fdiv double 1.000000e+00, %add12
  %arrayidx15 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv216
  store double %div13, double* %arrayidx15, align 8, !tbaa !1
  %indvars.iv.next217 = add nuw nsw i64 %indvars.iv216, 1
  %lftr.wideiv9 = trunc i64 %indvars.iv.next217 to i32
  %exitcond10 = icmp eq i32 %lftr.wideiv9, %nSlip
  br i1 %exitcond10, label %for.body22.lr.ph.split.us, label %for.body6, !llvm.loop !26

for.end114.us:                                    ; preds = %for.body88.us
  %arrayidx118.us = getelementptr inbounds double* %tauc, i64 %indvars.iv228
  %48 = load double* %arrayidx118.us, align 8, !tbaa !1
  %sub119.us = fsub double %add99.us, %48
  %mul126.us = fmul double %54, %sub119.us
  %arrayidx128.us = getelementptr inbounds double* %rhs, i64 %indvars.iv228
  store double %mul126.us, double* %arrayidx128.us, align 8, !tbaa !1
  %indvars.iv.next229 = add nuw nsw i64 %indvars.iv228, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv.next229 to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %nSlip
  br i1 %exitcond2, label %for.end131, label %for.body88.lr.ph.us

for.body88.us:                                    ; preds = %for.body88.lr.ph.us, %for.body88.us
  %indvars.iv224 = phi i64 [ 0, %for.body88.lr.ph.us ], [ %indvars.iv.next225, %for.body88.us ]
  %49 = phi double [ %53, %for.body88.lr.ph.us ], [ %add99.us, %for.body88.us ]
  %arrayidx92.us = getelementptr inbounds [40 x double]* %dtdg, i64 %indvars.iv228, i64 %indvars.iv224
  %50 = load double* %arrayidx92.us, align 8, !tbaa !1
  %mul93.us = fmul double %50, %deltaTime
  %arrayidx95.us = getelementptr inbounds double* %dSlipRate, i64 %indvars.iv224
  %51 = load double* %arrayidx95.us, align 8, !tbaa !1
  %mul96.us = fmul double %mul93.us, %51
  %add99.us = fadd double %49, %mul96.us
  %arrayidx103.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv228, i64 %indvars.iv224
  %52 = load double* %arrayidx103.us, align 8, !tbaa !1
  %add104.us = fsub double %52, %mul93.us
  %mul107.us = fmul double %54, %add104.us
  %arrayidx111.us = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv228, i64 %indvars.iv224
  store double %mul107.us, double* %arrayidx111.us, align 8, !tbaa !1
  %indvars.iv.next225 = add nuw nsw i64 %indvars.iv224, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next225 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %nSlip
  br i1 %exitcond, label %for.end114.us, label %for.body88.us

for.body88.lr.ph.us:                              ; preds = %for.body66, %for.end114.us
  %indvars.iv228 = phi i64 [ %indvars.iv.next229, %for.end114.us ], [ 0, %for.body66 ]
  %arrayidx82.us = getelementptr inbounds double* %tau, i64 %indvars.iv228
  %53 = load double* %arrayidx82.us, align 8, !tbaa !1
  %arrayidx106.us = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv228
  %54 = load double* %arrayidx106.us, align 8, !tbaa !1
  br label %for.body88.us

for.body66:                                       ; preds = %for.body66, %for.end45.us
  %indvars.iv208 = phi i64 [ %indvars.iv.next209, %for.body66 ], [ 0, %for.end45.us ]
  %arrayidx70 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv208, i64 %indvars.iv208
  %55 = load double* %arrayidx70, align 8, !tbaa !1
  %div71 = fdiv double 1.000000e+00, %55
  %arrayidx73 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv208
  store double %div71, double* %arrayidx73, align 8, !tbaa !1
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %lftr.wideiv3 = trunc i64 %indvars.iv.next209 to i32
  %exitcond4 = icmp eq i32 %lftr.wideiv3, %nSlip
  br i1 %exitcond4, label %for.body88.lr.ph.us, label %for.body66

for.end131:                                       ; preds = %for.end114.us, %entry
  call void @llvm.lifetime.end(i64 320, i8* %2) #1
  call void @llvm.lifetime.end(i64 320, i8* %1) #1
  call void @llvm.lifetime.end(i64 320, i8* %0) #1
  ret void
}

; Function Attrs: nounwind uwtable
define double @Crystal_pow(i32 %nSlip, double* nocapture readonly %slipRate) #0 {
entry:
  %rateFact = alloca [40 x double], align 16
  %sgn = alloca [40 x double], align 16
  %0 = bitcast [40 x double]* %rateFact to i8*
  call void @llvm.lifetime.start(i64 320, i8* %0) #1
  %1 = bitcast [40 x double]* %sgn to i8*
  call void @llvm.lifetime.start(i64 320, i8* %1) #1
  %cmp34 = icmp sgt i32 %nSlip, 0
  br i1 %cmp34, label %for.body.preheader, label %for.end20

for.body.preheader:                               ; preds = %entry
  %2 = add i32 %nSlip, -1
  %3 = zext i32 %2 to i64
  %4 = add i64 %3, 1
  %end.idx = add i64 %3, 1
  %n.vec = and i64 %4, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.body.preheader ]
  %5 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %index
  %6 = bitcast double* %5 to <4 x double>*
  store <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, <4 x double>* %6, align 16
  %7 = trunc i64 %index to i32
  %broadcast.splatinsert3 = insertelement <4 x i32> undef, i32 %7, i32 0
  %broadcast.splat4 = shufflevector <4 x i32> %broadcast.splatinsert3, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction5 = add <4 x i32> %broadcast.splat4, <i32 0, i32 1, i32 2, i32 3>
  %8 = sitofp <4 x i32> %induction5 to <4 x double>
  %9 = fmul <4 x double> %8, <double 2.000000e-01, double 2.000000e-01, double 2.000000e-01, double 2.000000e-01>
  %10 = fmul <4 x double> %9, <double 9.000000e-01, double 9.000000e-01, double 9.000000e-01, double 9.000000e-01>
  %11 = fdiv <4 x double> %10, <double 4.000000e+01, double 4.000000e+01, double 4.000000e+01, double 4.000000e+01>
  %12 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %index
  %13 = bitcast double* %12 to <4 x double>*
  store <4 x double> %11, <4 x double>* %13, align 16
  %index.next = add i64 %index, 4
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body, %for.body.preheader
  %resume.val = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.body7, label %for.body

for.body:                                         ; preds = %for.body, %middle.block
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.body ], [ %resume.val, %middle.block ]
  %arrayidx = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv36
  store double 1.000000e+00, double* %arrayidx, align 8, !tbaa !1
  %15 = trunc i64 %indvars.iv36 to i32
  %conv = sitofp i32 %15 to double
  %mul = fmul double %conv, 2.000000e-01
  %mul1 = fmul double %mul, 9.000000e-01
  %div = fdiv double %mul1, 4.000000e+01
  %arrayidx3 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv36
  store double %div, double* %arrayidx3, align 8, !tbaa !1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next37 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %nSlip
  br i1 %exitcond, label %for.body7, label %for.body, !llvm.loop !28

for.body7:                                        ; preds = %for.body7, %for.body, %middle.block
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7 ], [ 0, %middle.block ], [ 0, %for.body ]
  %arrayidx10 = getelementptr inbounds double* %slipRate, i64 %indvars.iv
  %16 = load double* %arrayidx10, align 8, !tbaa !1
  %arrayidx12 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv
  %17 = load double* %arrayidx12, align 8, !tbaa !1
  %mul13 = fmul double %16, %17
  %add = fadd double %mul13, 1.000000e-06
  %div14 = fmul double %add, 5.000000e-01
  %call = tail call double @pow(double %div14, double 1.000000e-02) #1
  %mul15 = fmul double %call, 1.200000e+00
  %arrayidx17 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv
  store double %mul15, double* %arrayidx17, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv.next to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %nSlip
  br i1 %exitcond2, label %for.end20, label %for.body7

for.end20:                                        ; preds = %for.body7, %entry
  %arrayidx21 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 3
  %18 = load double* %arrayidx21, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 320, i8* %1) #1
  call void @llvm.lifetime.end(i64 320, i8* %0) #1
  ret double %18
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind uwtable
define void @Crystal_Cholesky(i32 %nSlip, [40 x double]* nocapture %a, double* nocapture readonly %r, double* nocapture %g) #0 {
entry:
  %cmp359 = icmp sgt i32 %nSlip, 0
  br i1 %cmp359, label %for.body.preheader, label %for.end130

for.body.preheader:                               ; preds = %entry
  %0 = add i32 %nSlip, -1
  %1 = zext i32 %0 to i64
  %2 = add i64 %1, 1
  %end.idx = add i64 %1, 1
  %n.vec = and i64 %2, 8589934576
  %cmp.zero = icmp eq i64 %n.vec, 0
  %3 = add i32 %nSlip, -1
  %4 = zext i32 %3 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %scevgep30 = getelementptr double* %r, i64 %4
  %scevgep = getelementptr double* %g, i64 %4
  %bound1 = icmp uge double* %scevgep, %r
  %bound0 = icmp uge double* %scevgep30, %g
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %5 = getelementptr inbounds double* %r, i64 %index
  %6 = bitcast double* %5 to <4 x double>*
  %wide.load = load <4 x double>* %6, align 8
  %.sum40 = or i64 %index, 4
  %7 = getelementptr double* %r, i64 %.sum40
  %8 = bitcast double* %7 to <4 x double>*
  %wide.load35 = load <4 x double>* %8, align 8
  %.sum41 = or i64 %index, 8
  %9 = getelementptr double* %r, i64 %.sum41
  %10 = bitcast double* %9 to <4 x double>*
  %wide.load36 = load <4 x double>* %10, align 8
  %.sum42 = or i64 %index, 12
  %11 = getelementptr double* %r, i64 %.sum42
  %12 = bitcast double* %11 to <4 x double>*
  %wide.load37 = load <4 x double>* %12, align 8
  %13 = getelementptr inbounds double* %g, i64 %index
  %14 = bitcast double* %13 to <4 x double>*
  store <4 x double> %wide.load, <4 x double>* %14, align 8
  %.sum43 = or i64 %index, 4
  %15 = getelementptr double* %g, i64 %.sum43
  %16 = bitcast double* %15 to <4 x double>*
  store <4 x double> %wide.load35, <4 x double>* %16, align 8
  %.sum44 = or i64 %index, 8
  %17 = getelementptr double* %g, i64 %.sum44
  %18 = bitcast double* %17 to <4 x double>*
  store <4 x double> %wide.load36, <4 x double>* %18, align 8
  %.sum45 = or i64 %index, 12
  %19 = getelementptr double* %g, i64 %.sum45
  %20 = bitcast double* %19 to <4 x double>*
  store <4 x double> %wide.load37, <4 x double>* %20, align 8
  %index.next = add i64 %index, 16
  %21 = icmp eq i64 %index.next, %n.vec
  br i1 %21, label %middle.block, label %vector.body, !llvm.loop !29

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %for.body.preheader
  %resume.val = phi i64 [ 0, %for.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond3.preheader, label %for.body

for.cond3.preheader:                              ; preds = %for.body, %middle.block
  %cmp4357 = icmp sgt i32 %nSlip, 1
  br i1 %cmp4357, label %for.body5.lr.ph, label %for.end130

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  %arrayidx10 = getelementptr inbounds [40 x double]* %a, i64 0, i64 0
  br label %for.body5

for.body:                                         ; preds = %for.body, %middle.block
  %indvars.iv430 = phi i64 [ %indvars.iv.next431, %for.body ], [ %resume.val, %middle.block ]
  %arrayidx = getelementptr inbounds double* %r, i64 %indvars.iv430
  %22 = load double* %arrayidx, align 8, !tbaa !1
  %arrayidx2 = getelementptr inbounds double* %g, i64 %indvars.iv430
  store double %22, double* %arrayidx2, align 8, !tbaa !1
  %indvars.iv.next431 = add nuw nsw i64 %indvars.iv430, 1
  %lftr.wideiv24 = trunc i64 %indvars.iv.next431 to i32
  %exitcond25 = icmp eq i32 %lftr.wideiv24, %nSlip
  br i1 %exitcond25, label %for.cond3.preheader, label %for.body, !llvm.loop !30

for.body5:                                        ; preds = %for.body5, %for.body5.lr.ph
  %indvars.iv426 = phi i64 [ 1, %for.body5.lr.ph ], [ %indvars.iv.next427, %for.body5 ]
  %arrayidx8 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv426, i64 0
  %23 = load double* %arrayidx8, align 8, !tbaa !1
  %24 = load double* %arrayidx10, align 8, !tbaa !1
  %div = fdiv double %23, %24
  store double %div, double* %arrayidx8, align 8, !tbaa !1
  %indvars.iv.next427 = add nuw nsw i64 %indvars.iv426, 1
  %lftr.wideiv22 = trunc i64 %indvars.iv.next427 to i32
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %nSlip
  br i1 %exitcond23, label %for.body22.lr.ph, label %for.body5

for.cond17.loopexit:                              ; preds = %for.end86.us, %for.end33
  %indvars.iv.next416 = add nuw nsw i64 %indvars.iv415, 1
  %exitcond21 = icmp eq i32 %28, %nSlip
  br i1 %exitcond21, label %for.body112.lr.ph, label %for.body22.lr.ph

for.body22.lr.ph:                                 ; preds = %for.cond17.loopexit, %for.body5
  %indvars.iv14 = phi i32 [ %indvars.iv.next15, %for.cond17.loopexit ], [ 1, %for.body5 ]
  %indvars.iv422 = phi i64 [ %indvars.iv.next423, %for.cond17.loopexit ], [ 1, %for.body5 ]
  %indvars.iv415 = phi i64 [ %indvars.iv.next416, %for.cond17.loopexit ], [ 2, %for.body5 ]
  br label %for.body22

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %indvars.iv377 = phi i64 [ 0, %for.body22.lr.ph ], [ %indvars.iv.next378, %for.body22 ]
  %fdot.0302 = phi double [ 0.000000e+00, %for.body22.lr.ph ], [ %add, %for.body22 ]
  %arrayidx26 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv377
  %25 = load double* %arrayidx26, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv377, i64 %indvars.iv422
  %26 = load double* %arrayidx30, align 8, !tbaa !1
  %mul = fmul double %25, %26
  %add = fadd double %fdot.0302, %mul
  %indvars.iv.next378 = add nuw nsw i64 %indvars.iv377, 1
  %lftr.wideiv8 = trunc i64 %indvars.iv.next378 to i32
  %exitcond9 = icmp eq i32 %lftr.wideiv8, %indvars.iv14
  br i1 %exitcond9, label %for.end33, label %for.body22

for.end33:                                        ; preds = %for.body22
  %arrayidx37 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv422
  %27 = load double* %arrayidx37, align 8, !tbaa !1
  %sub = fsub double %27, %add
  store double %sub, double* %arrayidx37, align 8, !tbaa !1
  %indvars.iv.next423 = add nuw nsw i64 %indvars.iv422, 1
  %indvars.iv.next15 = add nuw nsw i32 %indvars.iv14, 1
  %28 = trunc i64 %indvars.iv.next423 to i32
  %cmp44312 = icmp slt i32 %28, %nSlip
  br i1 %cmp44312, label %for.body48.lr.ph.us, label %for.cond17.loopexit

for.end86.us:                                     ; preds = %for.body73.us
  %arrayidx90.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv404, i64 %indvars.iv422
  %29 = load double* %arrayidx90.us, align 8, !tbaa !1
  %sub91.us = fsub double %29, %add83.us
  %30 = load double* %arrayidx37, align 8, !tbaa !1
  %div96.us = fdiv double %sub91.us, %30
  store double %div96.us, double* %arrayidx90.us, align 8, !tbaa !1
  %indvars.iv.next405 = add nuw nsw i64 %indvars.iv404, 1
  %lftr.wideiv18 = trunc i64 %indvars.iv.next405 to i32
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %nSlip
  br i1 %exitcond19, label %for.cond17.loopexit, label %for.body48.lr.ph.us

for.body73.us:                                    ; preds = %for.body73.lr.ph.us, %for.body73.us
  %indvars.iv396 = phi i64 [ 0, %for.body73.lr.ph.us ], [ %indvars.iv.next397, %for.body73.us ]
  %fdot.2310.us = phi double [ 0.000000e+00, %for.body73.lr.ph.us ], [ %add83.us, %for.body73.us ]
  %arrayidx77.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv404, i64 %indvars.iv396
  %31 = load double* %arrayidx77.us, align 8, !tbaa !1
  %arrayidx81.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv396, i64 %indvars.iv422
  %32 = load double* %arrayidx81.us, align 8, !tbaa !1
  %mul82.us = fmul double %31, %32
  %add83.us = fadd double %fdot.2310.us, %mul82.us
  %indvars.iv.next397 = add nuw nsw i64 %indvars.iv396, 1
  %lftr.wideiv16 = trunc i64 %indvars.iv.next397 to i32
  %exitcond17 = icmp eq i32 %lftr.wideiv16, %indvars.iv14
  br i1 %exitcond17, label %for.end86.us, label %for.body73.us

for.body48.us:                                    ; preds = %for.body48.lr.ph.us, %for.body48.us
  %indvars.iv390 = phi i64 [ 0, %for.body48.lr.ph.us ], [ %indvars.iv.next391, %for.body48.us ]
  %fdot.1306.us = phi double [ 0.000000e+00, %for.body48.lr.ph.us ], [ %add58.us, %for.body48.us ]
  %arrayidx52.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv390
  %33 = load double* %arrayidx52.us, align 8, !tbaa !1
  %arrayidx56.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv390, i64 %indvars.iv404
  %34 = load double* %arrayidx56.us, align 8, !tbaa !1
  %mul57.us = fmul double %33, %34
  %add58.us = fadd double %fdot.1306.us, %mul57.us
  %indvars.iv.next391 = add nuw nsw i64 %indvars.iv390, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv.next391 to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %indvars.iv14
  br i1 %exitcond13, label %for.body73.lr.ph.us, label %for.body48.us

for.body48.lr.ph.us:                              ; preds = %for.end86.us, %for.end33
  %indvars.iv404 = phi i64 [ %indvars.iv.next405, %for.end86.us ], [ %indvars.iv415, %for.end33 ]
  br label %for.body48.us

for.body73.lr.ph.us:                              ; preds = %for.body48.us
  %arrayidx65.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv404
  %35 = load double* %arrayidx65.us, align 8, !tbaa !1
  %sub66.us = fsub double %35, %add58.us
  store double %sub66.us, double* %arrayidx65.us, align 8, !tbaa !1
  br label %for.body73.us

for.body112.lr.ph:                                ; preds = %for.inc128, %for.cond17.loopexit
  %indvars.iv1 = phi i32 [ %indvars.iv.next2, %for.inc128 ], [ 1, %for.cond17.loopexit ]
  %indvars.iv373 = phi i64 [ %indvars.iv.next374, %for.inc128 ], [ 1, %for.cond17.loopexit ]
  %arrayidx114 = getelementptr inbounds double* %g, i64 %indvars.iv373
  %.pre = load double* %arrayidx114, align 8, !tbaa !1
  br label %for.body112

for.body112:                                      ; preds = %for.body112, %for.body112.lr.ph
  %36 = phi double [ %.pre, %for.body112.lr.ph ], [ %sub122, %for.body112 ]
  %indvars.iv368 = phi i64 [ 0, %for.body112.lr.ph ], [ %indvars.iv.next369, %for.body112 ]
  %arrayidx118 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv373, i64 %indvars.iv368
  %37 = load double* %arrayidx118, align 8, !tbaa !1
  %arrayidx120 = getelementptr inbounds double* %g, i64 %indvars.iv368
  %38 = load double* %arrayidx120, align 8, !tbaa !1
  %mul121 = fmul double %37, %38
  %sub122 = fsub double %36, %mul121
  store double %sub122, double* %arrayidx114, align 8, !tbaa !1
  %indvars.iv.next369 = add nuw nsw i64 %indvars.iv368, 1
  %lftr.wideiv3 = trunc i64 %indvars.iv.next369 to i32
  %exitcond4 = icmp eq i32 %lftr.wideiv3, %indvars.iv1
  br i1 %exitcond4, label %for.inc128, label %for.body112

for.inc128:                                       ; preds = %for.body112
  %indvars.iv.next374 = add nuw nsw i64 %indvars.iv373, 1
  %indvars.iv.next2 = add nuw nsw i32 %indvars.iv1, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next374 to i32
  %exitcond5 = icmp eq i32 %lftr.wideiv, %nSlip
  br i1 %exitcond5, label %for.end130, label %for.body112.lr.ph

for.end130:                                       ; preds = %for.inc128, %for.cond3.preheader, %entry
  %sub131 = add i32 %nSlip, -1
  %idxprom132 = sext i32 %sub131 to i64
  %arrayidx133 = getelementptr inbounds double* %g, i64 %idxprom132
  %39 = load double* %arrayidx133, align 8, !tbaa !1
  %arrayidx139 = getelementptr inbounds [40 x double]* %a, i64 %idxprom132, i64 %idxprom132
  %40 = load double* %arrayidx139, align 8, !tbaa !1
  %div140 = fdiv double %39, %40
  store double %div140, double* %arrayidx133, align 8, !tbaa !1
  %sub144 = add i32 %nSlip, -2
  %cmp146294 = icmp sgt i32 %sub144, -1
  br i1 %cmp146294, label %for.cond149.preheader.lr.ph, label %for.end178

for.cond149.preheader.lr.ph:                      ; preds = %for.end130
  %41 = sext i32 %sub144 to i64
  br label %for.cond149.preheader

for.cond149.preheader:                            ; preds = %for.end166, %for.cond149.preheader.lr.ph
  %indvars.iv364 = phi i64 [ %41, %for.cond149.preheader.lr.ph ], [ %indvars.iv.next365, %for.end166 ]
  %indvars.iv = phi i32 [ %sub131, %for.cond149.preheader.lr.ph ], [ %indvars.iv.next, %for.end166 ]
  %i.4295 = phi i32 [ %sub144, %for.cond149.preheader.lr.ph ], [ %sub177, %for.end166 ]
  %42 = add nsw i64 %indvars.iv364, 1
  %43 = trunc i64 %42 to i32
  %cmp150290 = icmp slt i32 %43, %nSlip
  %arrayidx153 = getelementptr inbounds double* %g, i64 %indvars.iv364
  %44 = load double* %arrayidx153, align 8, !tbaa !1
  br i1 %cmp150290, label %for.body151.lr.ph, label %for.end166

for.body151.lr.ph:                                ; preds = %for.cond149.preheader
  %k.4289 = add nsw i32 %i.4295, 1
  %45 = sext i32 %indvars.iv to i64
  br label %for.body151

for.body151:                                      ; preds = %for.body151, %for.body151.lr.ph
  %indvars.iv361 = phi i64 [ %45, %for.body151.lr.ph ], [ %indvars.iv.next362, %for.body151 ]
  %46 = phi double [ %44, %for.body151.lr.ph ], [ %sub161, %for.body151 ]
  %k.4291 = phi i32 [ %k.4289, %for.body151.lr.ph ], [ %k.4, %for.body151 ]
  %arrayidx157 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv364, i64 %indvars.iv361
  %47 = load double* %arrayidx157, align 8, !tbaa !1
  %arrayidx159 = getelementptr inbounds double* %g, i64 %indvars.iv361
  %48 = load double* %arrayidx159, align 8, !tbaa !1
  %mul160 = fmul double %47, %48
  %sub161 = fsub double %46, %mul160
  store double %sub161, double* %arrayidx153, align 8, !tbaa !1
  %k.4 = add nsw i32 %k.4291, 1
  %indvars.iv.next362 = add nsw i64 %indvars.iv361, 1
  %exitcond = icmp eq i32 %k.4, %nSlip
  br i1 %exitcond, label %for.end166, label %for.body151

for.end166:                                       ; preds = %for.body151, %for.cond149.preheader
  %.lcssa = phi double [ %44, %for.cond149.preheader ], [ %sub161, %for.body151 ]
  %arrayidx172 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv364, i64 %indvars.iv364
  %49 = load double* %arrayidx172, align 8, !tbaa !1
  %div173 = fdiv double %.lcssa, %49
  store double %div173, double* %arrayidx153, align 8, !tbaa !1
  %sub177 = add nsw i32 %i.4295, -1
  %50 = trunc i64 %indvars.iv364 to i32
  %cmp146 = icmp sgt i32 %50, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvars.iv.next365 = add nsw i64 %indvars.iv364, -1
  br i1 %cmp146, label %for.cond149.preheader, label %for.end178

for.end178:                                       ; preds = %for.end166, %for.end130
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"double", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !5, metadata !6, metadata !7}
!6 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!7 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!8 = metadata !{metadata !9, metadata !10, i64 0}
!9 = metadata !{metadata !"timeval", metadata !10, i64 0, metadata !10, i64 8}
!10 = metadata !{metadata !"long", metadata !3, i64 0}
!11 = metadata !{metadata !9, metadata !10, i64 8}
!12 = metadata !{metadata !12, metadata !6, metadata !7}
!13 = metadata !{metadata !13, metadata !6, metadata !7}
!14 = metadata !{metadata !14, metadata !6, metadata !7}
!15 = metadata !{metadata !15, metadata !6, metadata !7}
!16 = metadata !{metadata !16, metadata !6, metadata !7}
!17 = metadata !{metadata !17, metadata !6, metadata !7}
!18 = metadata !{metadata !18, metadata !6, metadata !7}
!19 = metadata !{metadata !20, metadata !20, i64 0}
!20 = metadata !{metadata !"int", metadata !3, i64 0}
!21 = metadata !{metadata !21, metadata !6, metadata !7}
!22 = metadata !{metadata !22, metadata !6, metadata !7}
!23 = metadata !{metadata !23, metadata !6, metadata !7}
!24 = metadata !{metadata !24, metadata !6, metadata !7}
!25 = metadata !{metadata !25, metadata !6, metadata !7}
!26 = metadata !{metadata !26, metadata !6, metadata !7}
!27 = metadata !{metadata !27, metadata !6, metadata !7}
!28 = metadata !{metadata !28, metadata !6, metadata !7}
!29 = metadata !{metadata !29, metadata !6, metadata !7}
!30 = metadata !{metadata !30, metadata !6, metadata !7}
