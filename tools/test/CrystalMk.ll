; ModuleID = 'CrystalMk.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str2 = private unnamed_addr constant [17 x i8] c"returnVal = %f \0A\00", align 1
@.str3 = private unnamed_addr constant [41 x i8] c"i = %5d j = %5d    dtcdgd[i][j]   = %e \0A\00", align 1
@.str4 = private unnamed_addr constant [33 x i8] c"\0ATotal Wall time = %f seconds. \0A\00", align 1
@.str5 = private unnamed_addr constant [34 x i8] c"\0ATotal CPU  time = %f seconds. \0A\0A\00", align 1
@str = private unnamed_addr constant [31 x i8] c"\0ASequoia benchmark version 1.0\00"
@str6 = private unnamed_addr constant [16 x i8] c"\0A***** results \00"
@.str1 = private unnamed_addr constant [27 x i8] c"\0AWall time = %f seconds. \0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"\0ACPU  time = %f seconds. \0A\0A\00", align 1
@str4 = private unnamed_addr constant [31 x i8] c"\0A***** timing for Crystal_div \00"
@str5 = private unnamed_addr constant [31 x i8] c"\0A***** timing for Crystal_pow \00"
@str65 = private unnamed_addr constant [36 x i8] c"\0A***** timing for Crystal_Cholesky \00"

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
  %0 = bitcast [40 x double]* %slipRate to i8*
  call void @llvm.lifetime.start(i64 320, i8* %0) #1
  %1 = bitcast [40 x double]* %dSlipRate to i8*
  call void @llvm.lifetime.start(i64 320, i8* %1) #1
  %2 = bitcast [40 x double]* %tau to i8*
  call void @llvm.lifetime.start(i64 320, i8* %2) #1
  %3 = bitcast [40 x double]* %tauc to i8*
  call void @llvm.lifetime.start(i64 320, i8* %3) #1
  %4 = bitcast [40 x double]* %rhs to i8*
  call void @llvm.lifetime.start(i64 320, i8* %4) #1
  %5 = bitcast [40 x [40 x double]]* %dtcdgd to i8*
  call void @llvm.lifetime.start(i64 12800, i8* %5) #1
  %6 = bitcast [40 x [40 x double]]* %dtdg to i8*
  call void @llvm.lifetime.start(i64 12800, i8* %6) #1
  %7 = bitcast [40 x [40 x double]]* %matrix to i8*
  call void @llvm.lifetime.start(i64 12800, i8* %7) #1
  %puts = call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [40 x double]* %slipRate, i64 0, i64 0
  %arraydecay1 = getelementptr inbounds [40 x double]* %dSlipRate, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [40 x double]* %tau, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [40 x double]* %tauc, i64 0, i64 0
  %arraydecay4 = getelementptr inbounds [40 x double]* %rhs, i64 0, i64 0
  %arraydecay5 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0
  %arraydecay6 = getelementptr inbounds [40 x [40 x double]]* %dtdg, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [40 x [40 x double]]* %matrix, i64 0, i64 0
  call void @init(double* %arraydecay, double* %arraydecay1, double* %arraydecay2, double* %arraydecay3, double* %arraydecay4, [40 x double]* %arraydecay5, [40 x double]* %arraydecay6, [40 x double]* %arraydecay7) #1
  %call8 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call9 = call i64 @clock() #1
  %call18 = call double @SPEdriver(double* %arraydecay, double* %arraydecay1, double* %arraydecay2, double* %arraydecay3, double* %arraydecay4, [40 x double]* %arraydecay5, [40 x double]* %arraydecay6, [40 x double]* %arraydecay7) #1
  %call19 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call20 = call i64 @clock() #1
  %puts47 = call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str6, i64 0, i64 0))
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), double %call18) #1
  %arrayidx27 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 0
  %8 = load double* %arrayidx27, align 16, !tbaa !1
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 0, double %8) #1
  %arrayidx27.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 13
  %9 = load double* %arrayidx27.1, align 8, !tbaa !1
  %call28.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 13, double %9) #1
  %arrayidx27.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 26
  %10 = load double* %arrayidx27.2, align 16, !tbaa !1
  %call28.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 26, double %10) #1
  %arrayidx27.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 39
  %11 = load double* %arrayidx27.3, align 8, !tbaa !1
  %call28.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 39, double %11) #1
  %arrayidx27.150 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 0
  %12 = load double* %arrayidx27.150, align 16, !tbaa !1
  %call28.151 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 0, double %12) #1
  %arrayidx27.1.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 13
  %13 = load double* %arrayidx27.1.1, align 8, !tbaa !1
  %call28.1.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 13, double %13) #1
  %arrayidx27.2.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 26
  %14 = load double* %arrayidx27.2.1, align 16, !tbaa !1
  %call28.2.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 26, double %14) #1
  %arrayidx27.3.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 39
  %15 = load double* %arrayidx27.3.1, align 8, !tbaa !1
  %call28.3.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 39, double %15) #1
  %arrayidx27.252 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 0
  %16 = load double* %arrayidx27.252, align 16, !tbaa !1
  %call28.253 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 0, double %16) #1
  %arrayidx27.1.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 13
  %17 = load double* %arrayidx27.1.2, align 8, !tbaa !1
  %call28.1.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 13, double %17) #1
  %arrayidx27.2.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 26
  %18 = load double* %arrayidx27.2.2, align 16, !tbaa !1
  %call28.2.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 26, double %18) #1
  %arrayidx27.3.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 39
  %19 = load double* %arrayidx27.3.2, align 8, !tbaa !1
  %call28.3.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 39, double %19) #1
  %arrayidx27.354 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 0
  %20 = load double* %arrayidx27.354, align 16, !tbaa !1
  %call28.355 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 0, double %20) #1
  %arrayidx27.1.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 13
  %21 = load double* %arrayidx27.1.3, align 8, !tbaa !1
  %call28.1.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 13, double %21) #1
  %arrayidx27.2.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 26
  %22 = load double* %arrayidx27.2.3, align 16, !tbaa !1
  %call28.2.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 26, double %22) #1
  %arrayidx27.3.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 39
  %23 = load double* %arrayidx27.3.3, align 8, !tbaa !1
  %call28.3.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 39, double %23) #1
  %tv_sec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 0
  %24 = load i64* %tv_sec, align 8, !tbaa !5
  %tv_sec32 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 0
  %25 = load i64* %tv_sec32, align 8, !tbaa !5
  %sub = sub nsw i64 %24, %25
  %conv = sitofp i64 %sub to double
  %tv_usec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 1
  %26 = load i64* %tv_usec, align 8, !tbaa !8
  %tv_usec33 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 1
  %27 = load i64* %tv_usec33, align 8, !tbaa !8
  %sub34 = sub nsw i64 %26, %27
  %conv35 = sitofp i64 %sub34 to double
  %div = fdiv double %conv35, 1.000000e+06
  %add36 = fadd double %conv, %div
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str4, i64 0, i64 0), double %add36) #1
  %sub38 = sub nsw i64 %call20, %call9
  %conv39 = sitofp i64 %sub38 to double
  %div40 = fdiv double %conv39, 1.000000e+06
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str5, i64 0, i64 0), double %div40) #1
  call void @llvm.lifetime.end(i64 12800, i8* %7) #1
  call void @llvm.lifetime.end(i64 12800, i8* %6) #1
  call void @llvm.lifetime.end(i64 12800, i8* %5) #1
  call void @llvm.lifetime.end(i64 320, i8* %4) #1
  call void @llvm.lifetime.end(i64 320, i8* %3) #1
  call void @llvm.lifetime.end(i64 320, i8* %2) #1
  call void @llvm.lifetime.end(i64 320, i8* %1) #1
  call void @llvm.lifetime.end(i64 320, i8* %0) #1
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
  br label %for.body19

for.body19:                                       ; preds = %for.body19, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body19 ]
  %1 = trunc i64 %indvars.iv to i32
  %conv20 = sitofp i32 %1 to double
  %mul21 = fmul double %conv20, 1.000000e-05
  %mul23 = fmul double %conv, %mul21
  %add24 = fadd double %mul23, 1.000000e-02
  %arrayidx28 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv68, i64 %indvars.iv
  store double %add24, double* %arrayidx28, align 8, !tbaa !1
  %2 = add nsw i64 %indvars.iv, %indvars.iv68
  %3 = trunc i64 %2 to i32
  %conv30 = sitofp i32 %3 to double
  %arrayidx34 = getelementptr inbounds [40 x double]* %dtdg, i64 %indvars.iv68, i64 %indvars.iv
  store double %conv30, double* %arrayidx34, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv68, i64 %indvars.iv
  store double 0.000000e+00, double* %arrayidx38, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 40
  br i1 %exitcond, label %for.inc39, label %for.body19

for.inc39:                                        ; preds = %for.body19
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next69, 40
  br i1 %exitcond70, label %for.end41, label %for.body

for.end41:                                        ; preds = %for.inc39
  ret void
}

; Function Attrs: nounwind uwtable
define double @SPEdriver(double* %slipRate, double* %dSlipRate, double* %tau, double* %tauc, double* %rhs, [40 x double]* %dtcdgd, [40 x double]* %dtdg, [40 x double]* %matrix) #0 {
entry:
  %t0 = alloca %struct.timeval, align 8
  %t1 = alloca %struct.timeval, align 8
  %call = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call5 = tail call i64 @clock() #1
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.0156 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Crystal_div(i32 40, double 1.000000e-02, double* %slipRate, double* %dSlipRate, double* %tau, double* %tauc, double* %rhs, [40 x double]* %dtcdgd, [40 x double]* %dtdg, [40 x double]* %matrix) #1
  %inc = add nsw i32 %i.0156, 1
  %exitcond170 = icmp eq i32 %inc, 1000000
  br i1 %exitcond170, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %call6 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call7 = tail call i64 @clock() #1
  %tv_sec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 0
  %0 = load i64* %tv_sec, align 8, !tbaa !5
  %tv_sec8 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 0
  %1 = load i64* %tv_sec8, align 8, !tbaa !5
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %tv_usec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 1
  %2 = load i64* %tv_usec, align 8, !tbaa !8
  %tv_usec9 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 1
  %3 = load i64* %tv_usec9, align 8, !tbaa !8
  %sub10 = sub nsw i64 %2, %3
  %conv11 = sitofp i64 %sub10 to double
  %div = fdiv double %conv11, 1.000000e+06
  %add = fadd double %conv, %div
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str4, i64 0, i64 0))
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %add) #1
  %sub14 = sub nsw i64 %call7, %call5
  %conv15 = sitofp i64 %sub14 to double
  %div16 = fdiv double %conv15, 1.000000e+06
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %div16) #1
  %call18 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call19 = tail call i64 @clock() #1
  br label %for.body23

for.body23:                                       ; preds = %for.body23, %for.end
  %i.1155 = phi i32 [ 0, %for.end ], [ %inc26, %for.body23 ]
  %call24 = tail call double @Crystal_pow(i32 40, double* %slipRate) #1
  %inc26 = add nsw i32 %i.1155, 1
  %exitcond169 = icmp eq i32 %inc26, 1000000
  br i1 %exitcond169, label %for.end27, label %for.body23

for.end27:                                        ; preds = %for.body23
  %call28 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call29 = tail call i64 @clock() #1
  %4 = load i64* %tv_sec, align 8, !tbaa !5
  %5 = load i64* %tv_sec8, align 8, !tbaa !5
  %sub32 = sub nsw i64 %4, %5
  %conv33 = sitofp i64 %sub32 to double
  %6 = load i64* %tv_usec, align 8, !tbaa !8
  %7 = load i64* %tv_usec9, align 8, !tbaa !8
  %sub36 = sub nsw i64 %6, %7
  %conv37 = sitofp i64 %sub36 to double
  %div38 = fdiv double %conv37, 1.000000e+06
  %add39 = fadd double %conv33, %div38
  %puts148 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str5, i64 0, i64 0))
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %add39) #1
  %sub42 = sub nsw i64 %call29, %call19
  %conv43 = sitofp i64 %sub42 to double
  %div44 = fdiv double %conv43, 1.000000e+06
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %div44) #1
  %call46 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call47 = tail call i64 @clock() #1
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.inc65, %for.end27
  %indvars.iv166 = phi i64 [ 0, %for.end27 ], [ %indvars.iv.next167, %for.inc65 ]
  br label %for.body55

for.body55:                                       ; preds = %for.body55, %for.cond52.preheader
  %indvars.iv162 = phi i64 [ 0, %for.cond52.preheader ], [ %indvars.iv.next163, %for.body55 ]
  %arrayidx57 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv166, i64 %indvars.iv162
  %8 = load double* %arrayidx57, align 8, !tbaa !1
  %arrayidx61 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv166, i64 %indvars.iv162
  store double %8, double* %arrayidx61, align 8, !tbaa !1
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond164 = icmp eq i64 %indvars.iv.next163, 40
  br i1 %exitcond164, label %for.inc65, label %for.body55

for.inc65:                                        ; preds = %for.body55
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next167, 40
  br i1 %exitcond168, label %for.cond72.preheader, label %for.cond52.preheader

for.cond72.preheader:                             ; preds = %for.end93, %for.inc65
  %i.3152 = phi i32 [ %inc95, %for.end93 ], [ 0, %for.inc65 ]
  br label %for.cond76.preheader

for.cond76.preheader:                             ; preds = %for.inc91, %for.cond72.preheader
  %indvars.iv158 = phi i64 [ 0, %for.cond72.preheader ], [ %indvars.iv.next159, %for.inc91 ]
  br label %for.body79

for.body79:                                       ; preds = %for.body79, %for.cond76.preheader
  %indvars.iv = phi i64 [ 0, %for.cond76.preheader ], [ %indvars.iv.next, %for.body79 ]
  %arrayidx83 = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv158, i64 %indvars.iv
  %9 = load double* %arrayidx83, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv158, i64 %indvars.iv
  store double %9, double* %arrayidx87, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 40
  br i1 %exitcond, label %for.inc91, label %for.body79

for.inc91:                                        ; preds = %for.body79
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next159, 40
  br i1 %exitcond160, label %for.end93, label %for.cond76.preheader

for.end93:                                        ; preds = %for.inc91
  tail call void @Crystal_Cholesky(i32 40, [40 x double]* %dtcdgd, double* %tau, double* %rhs) #1
  %inc95 = add nsw i32 %i.3152, 1
  %exitcond161 = icmp eq i32 %inc95, 1000000
  br i1 %exitcond161, label %for.end96, label %for.cond72.preheader

for.end96:                                        ; preds = %for.end93
  %call97 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call98 = tail call i64 @clock() #1
  %10 = load i64* %tv_sec, align 8, !tbaa !5
  %11 = load i64* %tv_sec8, align 8, !tbaa !5
  %sub101 = sub nsw i64 %10, %11
  %conv102 = sitofp i64 %sub101 to double
  %12 = load i64* %tv_usec, align 8, !tbaa !8
  %13 = load i64* %tv_usec9, align 8, !tbaa !8
  %sub105 = sub nsw i64 %12, %13
  %conv106 = sitofp i64 %sub105 to double
  %div107 = fdiv double %conv106, 1.000000e+06
  %add108 = fadd double %conv102, %div107
  %puts149 = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @str65, i64 0, i64 0))
  %call110 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %add108) #1
  %sub111 = sub nsw i64 %call98, %call47
  %conv112 = sitofp i64 %sub111 to double
  %div113 = fdiv double %conv112, 1.000000e+06
  %call114 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %div113) #1
  ret double %call24
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
  br i1 %cmp206, label %for.body, label %for.end131

for.cond3.preheader:                              ; preds = %for.body
  br i1 %cmp206, label %for.body6, label %for.end131

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv220 = phi i64 [ %indvars.iv.next221, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv220
  store double 1.000000e+00, double* %arrayidx, align 8, !tbaa !1
  %3 = trunc i64 %indvars.iv220 to i32
  %conv = sitofp i32 %3 to double
  %mul = fmul double %conv, 2.000000e-01
  %div = fdiv double %mul, 4.000000e+01
  %add = fadd double %div, 9.000000e-01
  %arrayidx2 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv220
  store double %add, double* %arrayidx2, align 8, !tbaa !1
  %indvars.iv.next221 = add nuw nsw i64 %indvars.iv220, 1
  %lftr.wideiv222 = trunc i64 %indvars.iv.next221 to i32
  %exitcond223 = icmp eq i32 %lftr.wideiv222, %nSlip
  br i1 %exitcond223, label %for.cond3.preheader, label %for.body

for.cond19.preheader:                             ; preds = %for.body6
  br i1 %cmp206, label %for.body22.lr.ph.split.us, label %for.end131

for.body22.lr.ph.split.us:                        ; preds = %for.cond19.preheader
  %mul35 = fmul double %deltaTime, 1.200000e+00
  br label %for.body34.lr.ph.us

for.end45.us:                                     ; preds = %for.body34.us
  %.pre = load double* %arrayidx30.us, align 8, !tbaa !1
  %mul48.us = fmul double %.pre, 1.000000e-02
  %mul51.us = fmul double %mul48.us, %7
  %arrayidx53.us = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv236
  %4 = load double* %arrayidx53.us, align 8, !tbaa !1
  %mul54.us = fmul double %mul51.us, %4
  %arrayidx58.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %indvars.iv236
  %5 = load double* %arrayidx58.us, align 8, !tbaa !1
  %add59.us = fadd double %5, %mul54.us
  store double %add59.us, double* %arrayidx58.us, align 8, !tbaa !1
  %indvars.iv.next237 = add nuw nsw i64 %indvars.iv236, 1
  %lftr.wideiv238 = trunc i64 %indvars.iv.next237 to i32
  %exitcond239 = icmp eq i32 %lftr.wideiv238, %nSlip
  br i1 %exitcond239, label %for.cond63.preheader, label %for.body34.lr.ph.us

for.body34.us:                                    ; preds = %for.body34.lr.ph.us, %for.body34.us
  %indvars.iv232 = phi i64 [ 0, %for.body34.lr.ph.us ], [ %indvars.iv.next233, %for.body34.us ]
  %arrayidx42.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv236, i64 %indvars.iv232
  store double %mul38.us, double* %arrayidx42.us, align 8, !tbaa !1
  %indvars.iv.next233 = add nuw nsw i64 %indvars.iv232, 1
  %lftr.wideiv234 = trunc i64 %indvars.iv.next233 to i32
  %exitcond235 = icmp eq i32 %lftr.wideiv234, %nSlip
  br i1 %exitcond235, label %for.end45.us, label %for.body34.us

for.body34.lr.ph.us:                              ; preds = %for.end45.us, %for.body22.lr.ph.split.us
  %indvars.iv236 = phi i64 [ %indvars.iv.next237, %for.end45.us ], [ 0, %for.body22.lr.ph.split.us ]
  %arrayidx24.us = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv236
  %6 = load double* %arrayidx24.us, align 8, !tbaa !1
  %mul25.us = fmul double %6, 3.000000e+01
  %arrayidx27.us = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv236
  %7 = load double* %arrayidx27.us, align 8, !tbaa !1
  %mul28.us = fmul double %mul25.us, %7
  %arrayidx30.us = getelementptr inbounds double* %tau, i64 %indvars.iv236
  store double %mul28.us, double* %arrayidx30.us, align 8, !tbaa !1
  %mul38.us = fmul double %mul35, %6
  br label %for.body34.us

for.body6:                                        ; preds = %for.body6, %for.cond3.preheader
  %indvars.iv216 = phi i64 [ %indvars.iv.next217, %for.body6 ], [ 0, %for.cond3.preheader ]
  %arrayidx8 = getelementptr inbounds double* %slipRate, i64 %indvars.iv216
  %8 = load double* %arrayidx8, align 8, !tbaa !1
  %arrayidx10 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv216
  %9 = load double* %arrayidx10, align 8, !tbaa !1
  %mul11 = fmul double %8, %9
  %add12 = fadd double %mul11, 1.000000e-06
  %div13 = fdiv double 1.000000e+00, %add12
  %arrayidx15 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv216
  store double %div13, double* %arrayidx15, align 8, !tbaa !1
  %indvars.iv.next217 = add nuw nsw i64 %indvars.iv216, 1
  %lftr.wideiv218 = trunc i64 %indvars.iv.next217 to i32
  %exitcond219 = icmp eq i32 %lftr.wideiv218, %nSlip
  br i1 %exitcond219, label %for.cond19.preheader, label %for.body6

for.cond63.preheader:                             ; preds = %for.end45.us
  br i1 %cmp206, label %for.body66, label %for.end131

for.cond77.preheader:                             ; preds = %for.body66
  br i1 %cmp206, label %for.body88.lr.ph.us, label %for.end131

for.end114.us:                                    ; preds = %for.body88.us
  %arrayidx118.us = getelementptr inbounds double* %tauc, i64 %indvars.iv228
  %10 = load double* %arrayidx118.us, align 8, !tbaa !1
  %sub119.us = fsub double %add99.us, %10
  %mul126.us = fmul double %sub119.us, %16
  %arrayidx128.us = getelementptr inbounds double* %rhs, i64 %indvars.iv228
  store double %mul126.us, double* %arrayidx128.us, align 8, !tbaa !1
  %indvars.iv.next229 = add nuw nsw i64 %indvars.iv228, 1
  %lftr.wideiv230 = trunc i64 %indvars.iv.next229 to i32
  %exitcond231 = icmp eq i32 %lftr.wideiv230, %nSlip
  br i1 %exitcond231, label %for.end131, label %for.body88.lr.ph.us

for.body88.us:                                    ; preds = %for.body88.lr.ph.us, %for.body88.us
  %indvars.iv224 = phi i64 [ 0, %for.body88.lr.ph.us ], [ %indvars.iv.next225, %for.body88.us ]
  %11 = phi double [ %15, %for.body88.lr.ph.us ], [ %add99.us, %for.body88.us ]
  %arrayidx92.us = getelementptr inbounds [40 x double]* %dtdg, i64 %indvars.iv228, i64 %indvars.iv224
  %12 = load double* %arrayidx92.us, align 8, !tbaa !1
  %mul93.us = fmul double %12, %deltaTime
  %arrayidx95.us = getelementptr inbounds double* %dSlipRate, i64 %indvars.iv224
  %13 = load double* %arrayidx95.us, align 8, !tbaa !1
  %mul96.us = fmul double %mul93.us, %13
  %add99.us = fadd double %11, %mul96.us
  %arrayidx103.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv228, i64 %indvars.iv224
  %14 = load double* %arrayidx103.us, align 8, !tbaa !1
  %add104.us = fsub double %14, %mul93.us
  %mul107.us = fmul double %add104.us, %16
  %arrayidx111.us = getelementptr inbounds [40 x double]* %matrix, i64 %indvars.iv228, i64 %indvars.iv224
  store double %mul107.us, double* %arrayidx111.us, align 8, !tbaa !1
  %indvars.iv.next225 = add nuw nsw i64 %indvars.iv224, 1
  %lftr.wideiv226 = trunc i64 %indvars.iv.next225 to i32
  %exitcond227 = icmp eq i32 %lftr.wideiv226, %nSlip
  br i1 %exitcond227, label %for.end114.us, label %for.body88.us

for.body88.lr.ph.us:                              ; preds = %for.end114.us, %for.cond77.preheader
  %indvars.iv228 = phi i64 [ %indvars.iv.next229, %for.end114.us ], [ 0, %for.cond77.preheader ]
  %arrayidx82.us = getelementptr inbounds double* %tau, i64 %indvars.iv228
  %15 = load double* %arrayidx82.us, align 8, !tbaa !1
  %arrayidx106.us = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv228
  %16 = load double* %arrayidx106.us, align 8, !tbaa !1
  br label %for.body88.us

for.body66:                                       ; preds = %for.body66, %for.cond63.preheader
  %indvars.iv208 = phi i64 [ %indvars.iv.next209, %for.body66 ], [ 0, %for.cond63.preheader ]
  %arrayidx70 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %indvars.iv208, i64 %indvars.iv208
  %17 = load double* %arrayidx70, align 8, !tbaa !1
  %div71 = fdiv double 1.000000e+00, %17
  %arrayidx73 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %indvars.iv208
  store double %div71, double* %arrayidx73, align 8, !tbaa !1
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %lftr.wideiv210 = trunc i64 %indvars.iv.next209 to i32
  %exitcond211 = icmp eq i32 %lftr.wideiv210, %nSlip
  br i1 %exitcond211, label %for.cond77.preheader, label %for.body66

for.end131:                                       ; preds = %for.end114.us, %for.cond77.preheader, %for.cond63.preheader, %for.cond19.preheader, %for.cond3.preheader, %entry
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
  br i1 %cmp34, label %for.body, label %for.end20

for.cond4.preheader:                              ; preds = %for.body
  br i1 %cmp34, label %for.body7, label %for.end20

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv36
  store double 1.000000e+00, double* %arrayidx, align 8, !tbaa !1
  %2 = trunc i64 %indvars.iv36 to i32
  %conv = sitofp i32 %2 to double
  %mul = fmul double %conv, 2.000000e-01
  %mul1 = fmul double %mul, 9.000000e-01
  %div = fdiv double %mul1, 4.000000e+01
  %arrayidx3 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv36
  store double %div, double* %arrayidx3, align 8, !tbaa !1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %lftr.wideiv38 = trunc i64 %indvars.iv.next37 to i32
  %exitcond39 = icmp eq i32 %lftr.wideiv38, %nSlip
  br i1 %exitcond39, label %for.cond4.preheader, label %for.body

for.body7:                                        ; preds = %for.body7, %for.cond4.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7 ], [ 0, %for.cond4.preheader ]
  %arrayidx10 = getelementptr inbounds double* %slipRate, i64 %indvars.iv
  %3 = load double* %arrayidx10, align 8, !tbaa !1
  %arrayidx12 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %indvars.iv
  %4 = load double* %arrayidx12, align 8, !tbaa !1
  %mul13 = fmul double %3, %4
  %add = fadd double %mul13, 1.000000e-06
  %div14 = fmul double %add, 5.000000e-01
  %call = tail call double @pow(double %div14, double 1.000000e-02) #1
  %mul15 = fmul double %call, 1.200000e+00
  %arrayidx17 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %indvars.iv
  store double %mul15, double* %arrayidx17, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %nSlip
  br i1 %exitcond, label %for.end20, label %for.body7

for.end20:                                        ; preds = %for.body7, %for.cond4.preheader, %entry
  %arrayidx21 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 3
  %5 = load double* %arrayidx21, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 320, i8* %1) #1
  call void @llvm.lifetime.end(i64 320, i8* %0) #1
  ret double %5
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind uwtable
define void @Crystal_Cholesky(i32 %nSlip, [40 x double]* nocapture %a, double* nocapture readonly %r, double* nocapture %g) #0 {
entry:
  %cmp359 = icmp sgt i32 %nSlip, 0
  br i1 %cmp359, label %for.body, label %for.end130

for.cond3.preheader:                              ; preds = %for.body
  %cmp4357 = icmp sgt i32 %nSlip, 1
  br i1 %cmp4357, label %for.body5.lr.ph, label %for.end130

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  %arrayidx10 = getelementptr inbounds [40 x double]* %a, i64 0, i64 0
  br label %for.body5

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv430 = phi i64 [ %indvars.iv.next431, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double* %r, i64 %indvars.iv430
  %0 = load double* %arrayidx, align 8, !tbaa !1
  %arrayidx2 = getelementptr inbounds double* %g, i64 %indvars.iv430
  store double %0, double* %arrayidx2, align 8, !tbaa !1
  %indvars.iv.next431 = add nuw nsw i64 %indvars.iv430, 1
  %lftr.wideiv432 = trunc i64 %indvars.iv.next431 to i32
  %exitcond433 = icmp eq i32 %lftr.wideiv432, %nSlip
  br i1 %exitcond433, label %for.cond3.preheader, label %for.body

for.cond17.preheader:                             ; preds = %for.body5
  br i1 %cmp4357, label %for.body22.lr.ph, label %for.end130

for.body5:                                        ; preds = %for.body5, %for.body5.lr.ph
  %indvars.iv426 = phi i64 [ 1, %for.body5.lr.ph ], [ %indvars.iv.next427, %for.body5 ]
  %arrayidx8 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv426, i64 0
  %1 = load double* %arrayidx8, align 8, !tbaa !1
  %2 = load double* %arrayidx10, align 8, !tbaa !1
  %div = fdiv double %1, %2
  store double %div, double* %arrayidx8, align 8, !tbaa !1
  %indvars.iv.next427 = add nuw nsw i64 %indvars.iv426, 1
  %lftr.wideiv428 = trunc i64 %indvars.iv.next427 to i32
  %exitcond429 = icmp eq i32 %lftr.wideiv428, %nSlip
  br i1 %exitcond429, label %for.cond17.preheader, label %for.body5

for.cond17.loopexit:                              ; preds = %for.end86.us, %for.end33
  %indvars.iv.next416 = add nuw nsw i64 %indvars.iv415, 1
  %exitcond425 = icmp eq i32 %6, %nSlip
  br i1 %exitcond425, label %for.body112.lr.ph, label %for.body22.lr.ph

for.body22.lr.ph:                                 ; preds = %for.cond17.loopexit, %for.cond17.preheader
  %indvars.iv422 = phi i64 [ %indvars.iv.next423, %for.cond17.loopexit ], [ 1, %for.cond17.preheader ]
  %indvars.iv415 = phi i64 [ %indvars.iv.next416, %for.cond17.loopexit ], [ 2, %for.cond17.preheader ]
  %indvars.iv411 = phi i32 [ %indvars.iv.next412, %for.cond17.loopexit ], [ 1, %for.cond17.preheader ]
  br label %for.body22

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %indvars.iv377 = phi i64 [ 0, %for.body22.lr.ph ], [ %indvars.iv.next378, %for.body22 ]
  %fdot.0302 = phi double [ 0.000000e+00, %for.body22.lr.ph ], [ %add, %for.body22 ]
  %arrayidx26 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv377
  %3 = load double* %arrayidx26, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv377, i64 %indvars.iv422
  %4 = load double* %arrayidx30, align 8, !tbaa !1
  %mul = fmul double %3, %4
  %add = fadd double %fdot.0302, %mul
  %indvars.iv.next378 = add nuw nsw i64 %indvars.iv377, 1
  %lftr.wideiv381 = trunc i64 %indvars.iv.next378 to i32
  %exitcond382 = icmp eq i32 %lftr.wideiv381, %indvars.iv411
  br i1 %exitcond382, label %for.end33, label %for.body22

for.end33:                                        ; preds = %for.body22
  %arrayidx37 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv422
  %5 = load double* %arrayidx37, align 8, !tbaa !1
  %sub = fsub double %5, %add
  store double %sub, double* %arrayidx37, align 8, !tbaa !1
  %indvars.iv.next423 = add nuw nsw i64 %indvars.iv422, 1
  %indvars.iv.next412 = add nuw nsw i32 %indvars.iv411, 1
  %6 = trunc i64 %indvars.iv.next423 to i32
  %cmp44312 = icmp slt i32 %6, %nSlip
  br i1 %cmp44312, label %for.body48.lr.ph.us, label %for.cond17.loopexit

for.end86.us:                                     ; preds = %for.body73.us
  %arrayidx90.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv404, i64 %indvars.iv422
  %7 = load double* %arrayidx90.us, align 8, !tbaa !1
  %sub91.us = fsub double %7, %add83.us
  %8 = load double* %arrayidx37, align 8, !tbaa !1
  %div96.us = fdiv double %sub91.us, %8
  store double %div96.us, double* %arrayidx90.us, align 8, !tbaa !1
  %indvars.iv.next405 = add nuw nsw i64 %indvars.iv404, 1
  %lftr.wideiv407 = trunc i64 %indvars.iv.next405 to i32
  %exitcond408 = icmp eq i32 %lftr.wideiv407, %nSlip
  br i1 %exitcond408, label %for.cond17.loopexit, label %for.body48.lr.ph.us

for.body73.us:                                    ; preds = %for.body73.lr.ph.us, %for.body73.us
  %indvars.iv396 = phi i64 [ 0, %for.body73.lr.ph.us ], [ %indvars.iv.next397, %for.body73.us ]
  %fdot.2310.us = phi double [ 0.000000e+00, %for.body73.lr.ph.us ], [ %add83.us, %for.body73.us ]
  %arrayidx77.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv404, i64 %indvars.iv396
  %9 = load double* %arrayidx77.us, align 8, !tbaa !1
  %arrayidx81.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv396, i64 %indvars.iv422
  %10 = load double* %arrayidx81.us, align 8, !tbaa !1
  %mul82.us = fmul double %9, %10
  %add83.us = fadd double %fdot.2310.us, %mul82.us
  %indvars.iv.next397 = add nuw nsw i64 %indvars.iv396, 1
  %lftr.wideiv400 = trunc i64 %indvars.iv.next397 to i32
  %exitcond401 = icmp eq i32 %lftr.wideiv400, %indvars.iv411
  br i1 %exitcond401, label %for.end86.us, label %for.body73.us

for.body48.us:                                    ; preds = %for.body48.lr.ph.us, %for.body48.us
  %indvars.iv390 = phi i64 [ 0, %for.body48.lr.ph.us ], [ %indvars.iv.next391, %for.body48.us ]
  %fdot.1306.us = phi double [ 0.000000e+00, %for.body48.lr.ph.us ], [ %add58.us, %for.body48.us ]
  %arrayidx52.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv390
  %11 = load double* %arrayidx52.us, align 8, !tbaa !1
  %arrayidx56.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv390, i64 %indvars.iv404
  %12 = load double* %arrayidx56.us, align 8, !tbaa !1
  %mul57.us = fmul double %11, %12
  %add58.us = fadd double %fdot.1306.us, %mul57.us
  %indvars.iv.next391 = add nuw nsw i64 %indvars.iv390, 1
  %lftr.wideiv394 = trunc i64 %indvars.iv.next391 to i32
  %exitcond395 = icmp eq i32 %lftr.wideiv394, %indvars.iv411
  br i1 %exitcond395, label %for.body73.lr.ph.us, label %for.body48.us

for.body48.lr.ph.us:                              ; preds = %for.end86.us, %for.end33
  %indvars.iv404 = phi i64 [ %indvars.iv.next405, %for.end86.us ], [ %indvars.iv415, %for.end33 ]
  br label %for.body48.us

for.body73.lr.ph.us:                              ; preds = %for.body48.us
  %arrayidx65.us = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv422, i64 %indvars.iv404
  %13 = load double* %arrayidx65.us, align 8, !tbaa !1
  %sub66.us = fsub double %13, %add58.us
  store double %sub66.us, double* %arrayidx65.us, align 8, !tbaa !1
  br label %for.body73.us

for.body112.lr.ph:                                ; preds = %for.inc128, %for.cond17.loopexit
  %indvars.iv373 = phi i64 [ %indvars.iv.next374, %for.inc128 ], [ 1, %for.cond17.loopexit ]
  %indvars.iv370 = phi i32 [ %indvars.iv.next371, %for.inc128 ], [ 1, %for.cond17.loopexit ]
  %arrayidx114 = getelementptr inbounds double* %g, i64 %indvars.iv373
  %.pre = load double* %arrayidx114, align 8, !tbaa !1
  br label %for.body112

for.body112:                                      ; preds = %for.body112, %for.body112.lr.ph
  %14 = phi double [ %.pre, %for.body112.lr.ph ], [ %sub122, %for.body112 ]
  %indvars.iv368 = phi i64 [ 0, %for.body112.lr.ph ], [ %indvars.iv.next369, %for.body112 ]
  %arrayidx118 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv373, i64 %indvars.iv368
  %15 = load double* %arrayidx118, align 8, !tbaa !1
  %arrayidx120 = getelementptr inbounds double* %g, i64 %indvars.iv368
  %16 = load double* %arrayidx120, align 8, !tbaa !1
  %mul121 = fmul double %15, %16
  %sub122 = fsub double %14, %mul121
  store double %sub122, double* %arrayidx114, align 8, !tbaa !1
  %indvars.iv.next369 = add nuw nsw i64 %indvars.iv368, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next369 to i32
  %exitcond372 = icmp eq i32 %lftr.wideiv, %indvars.iv370
  br i1 %exitcond372, label %for.inc128, label %for.body112

for.inc128:                                       ; preds = %for.body112
  %indvars.iv.next374 = add nuw nsw i64 %indvars.iv373, 1
  %indvars.iv.next371 = add nuw nsw i32 %indvars.iv370, 1
  %lftr.wideiv375 = trunc i64 %indvars.iv.next374 to i32
  %exitcond376 = icmp eq i32 %lftr.wideiv375, %nSlip
  br i1 %exitcond376, label %for.end130, label %for.body112.lr.ph

for.end130:                                       ; preds = %for.inc128, %for.cond17.preheader, %for.cond3.preheader, %entry
  %sub131 = add i32 %nSlip, -1
  %idxprom132 = sext i32 %sub131 to i64
  %arrayidx133 = getelementptr inbounds double* %g, i64 %idxprom132
  %17 = load double* %arrayidx133, align 8, !tbaa !1
  %arrayidx139 = getelementptr inbounds [40 x double]* %a, i64 %idxprom132, i64 %idxprom132
  %18 = load double* %arrayidx139, align 8, !tbaa !1
  %div140 = fdiv double %17, %18
  store double %div140, double* %arrayidx133, align 8, !tbaa !1
  %sub144 = add i32 %nSlip, -2
  %cmp146294 = icmp sgt i32 %sub144, -1
  br i1 %cmp146294, label %for.cond149.preheader.lr.ph, label %for.end178

for.cond149.preheader.lr.ph:                      ; preds = %for.end130
  %19 = sext i32 %sub144 to i64
  br label %for.cond149.preheader

for.cond149.preheader:                            ; preds = %for.end166, %for.cond149.preheader.lr.ph
  %indvars.iv364 = phi i64 [ %19, %for.cond149.preheader.lr.ph ], [ %indvars.iv.next365, %for.end166 ]
  %indvars.iv = phi i32 [ %sub131, %for.cond149.preheader.lr.ph ], [ %indvars.iv.next, %for.end166 ]
  %i.4295 = phi i32 [ %sub144, %for.cond149.preheader.lr.ph ], [ %sub177, %for.end166 ]
  %20 = add nsw i64 %indvars.iv364, 1
  %21 = trunc i64 %20 to i32
  %cmp150290 = icmp slt i32 %21, %nSlip
  %arrayidx153 = getelementptr inbounds double* %g, i64 %indvars.iv364
  %22 = load double* %arrayidx153, align 8, !tbaa !1
  br i1 %cmp150290, label %for.body151.lr.ph, label %for.end166

for.body151.lr.ph:                                ; preds = %for.cond149.preheader
  %k.4289 = add nsw i32 %i.4295, 1
  %23 = sext i32 %indvars.iv to i64
  br label %for.body151

for.body151:                                      ; preds = %for.body151, %for.body151.lr.ph
  %indvars.iv361 = phi i64 [ %23, %for.body151.lr.ph ], [ %indvars.iv.next362, %for.body151 ]
  %24 = phi double [ %22, %for.body151.lr.ph ], [ %sub161, %for.body151 ]
  %k.4291 = phi i32 [ %k.4289, %for.body151.lr.ph ], [ %k.4, %for.body151 ]
  %arrayidx157 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv364, i64 %indvars.iv361
  %25 = load double* %arrayidx157, align 8, !tbaa !1
  %arrayidx159 = getelementptr inbounds double* %g, i64 %indvars.iv361
  %26 = load double* %arrayidx159, align 8, !tbaa !1
  %mul160 = fmul double %25, %26
  %sub161 = fsub double %24, %mul160
  store double %sub161, double* %arrayidx153, align 8, !tbaa !1
  %k.4 = add nsw i32 %k.4291, 1
  %indvars.iv.next362 = add nsw i64 %indvars.iv361, 1
  %exitcond = icmp eq i32 %k.4, %nSlip
  br i1 %exitcond, label %for.end166, label %for.body151

for.end166:                                       ; preds = %for.body151, %for.cond149.preheader
  %.lcssa = phi double [ %22, %for.cond149.preheader ], [ %sub161, %for.body151 ]
  %arrayidx172 = getelementptr inbounds [40 x double]* %a, i64 %indvars.iv364, i64 %indvars.iv364
  %27 = load double* %arrayidx172, align 8, !tbaa !1
  %div173 = fdiv double %.lcssa, %27
  store double %div173, double* %arrayidx153, align 8, !tbaa !1
  %sub177 = add nsw i32 %i.4295, -1
  %28 = trunc i64 %indvars.iv364 to i32
  %cmp146 = icmp sgt i32 %28, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvars.iv.next365 = add nsw i64 %indvars.iv364, -1
  br i1 %cmp146, label %for.cond149.preheader, label %for.end178

for.end178:                                       ; preds = %for.end166, %for.end130
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"double", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !7, i64 0}
!6 = metadata !{metadata !"timeval", metadata !7, i64 0, metadata !7, i64 8}
!7 = metadata !{metadata !"long", metadata !3, i64 0}
!8 = metadata !{metadata !6, metadata !7, i64 8}
