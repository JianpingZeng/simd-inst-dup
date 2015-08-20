; ModuleID = 'llvmprof.out'
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
@relFun = private unnamed_addr constant [54 x i8] c"Reliability CMP failed in function, exit directly %s\0A\00"
@func = private unnamed_addr constant [5 x i8] c"main\00"
@func1 = private unnamed_addr constant [5 x i8] c"init\00"
@func2 = private unnamed_addr constant [10 x i8] c"SPEdriver\00"
@func3 = private unnamed_addr constant [12 x i8] c"Crystal_div\00"
@func4 = private unnamed_addr constant [12 x i8] c"Crystal_pow\00"
@func5 = private unnamed_addr constant [17 x i8] c"Crystal_Cholesky\00"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %t0 = alloca %struct.timeval, align 8
  %t1 = alloca %struct.timeval, align 8
  %slipRate = alloca [40 x double], align 16
  %splatslipRateS11_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %slipRate, i32 0
  %splatslipRateS11_D.splat = shufflevector <2 x [40 x double]*> %splatslipRateS11_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %dSlipRate = alloca [40 x double], align 16
  %splatdSlipRateS13_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %dSlipRate, i32 0
  %splatdSlipRateS13_D.splat = shufflevector <2 x [40 x double]*> %splatdSlipRateS13_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %tau = alloca [40 x double], align 16
  %splattauS15_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %tau, i32 0
  %splattauS15_D.splat = shufflevector <2 x [40 x double]*> %splattauS15_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %tauc = alloca [40 x double], align 16
  %splattaucS17_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %tauc, i32 0
  %splattaucS17_D.splat = shufflevector <2 x [40 x double]*> %splattaucS17_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %rhs = alloca [40 x double], align 16
  %splatrhsS19_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %rhs, i32 0
  %splatrhsS19_D.splat = shufflevector <2 x [40 x double]*> %splatrhsS19_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %dtcdgd = alloca [40 x [40 x double]], align 16
  %splatdtcdgdS21_D.splatinsert = insertelement <2 x [40 x [40 x double]]*> undef, [40 x [40 x double]]* %dtcdgd, i32 0
  %splatdtcdgdS21_D.splat = shufflevector <2 x [40 x [40 x double]]*> %splatdtcdgdS21_D.splatinsert, <2 x [40 x [40 x double]]*> undef, <2 x i32> zeroinitializer
  %dtdg = alloca [40 x [40 x double]], align 16
  %splatdtdgS23_D.splatinsert = insertelement <2 x [40 x [40 x double]]*> undef, [40 x [40 x double]]* %dtdg, i32 0
  %splatdtdgS23_D.splat = shufflevector <2 x [40 x [40 x double]]*> %splatdtdgS23_D.splatinsert, <2 x [40 x [40 x double]]*> undef, <2 x i32> zeroinitializer
  %matrix = alloca [40 x [40 x double]], align 16
  %splatmatrixS10_D.splatinsert = insertelement <2 x [40 x [40 x double]]*> undef, [40 x [40 x double]]* %matrix, i32 0
  %splatmatrixS10_D.splat = shufflevector <2 x [40 x [40 x double]]*> %splatmatrixS10_D.splatinsert, <2 x [40 x [40 x double]]*> undef, <2 x i32> zeroinitializer
  %bitcastS10_D = bitcast <2 x [40 x [40 x double]]*> %splatmatrixS10_D.splat to <2 x i8*>
  %extbitcastS10_D = extractelement <2 x i8*> %bitcastS10_D, i32 1
  %bitcastS11_D = bitcast <2 x [40 x double]*> %splatslipRateS11_D.splat to <2 x i8*>
  %bitcastS13_D = bitcast <2 x [40 x double]*> %splatdSlipRateS13_D.splat to <2 x i8*>
  %bitcastS15_D = bitcast <2 x [40 x double]*> %splattauS15_D.splat to <2 x i8*>
  %bitcastS17_D = bitcast <2 x [40 x double]*> %splattaucS17_D.splat to <2 x i8*>
  %bitcastS19_D = bitcast <2 x [40 x double]*> %splatrhsS19_D.splat to <2 x i8*>
  %bitcastS21_D = bitcast <2 x [40 x [40 x double]]*> %splatdtcdgdS21_D.splat to <2 x i8*>
  %bitcastS23_D = bitcast <2 x [40 x [40 x double]]*> %splatdtdgS23_D.splat to <2 x i8*>
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [40 x double]* %slipRate, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [40 x double]* %tau, i64 0, i64 0
  %arraydecay4 = getelementptr inbounds [40 x double]* %rhs, i64 0, i64 0
  %arraydecay6 = getelementptr inbounds [40 x [40 x double]]* %dtdg, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %extbitcastS10_D, i8 0, i64 12800, i32 16, i1 false)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc39.i.split.split, %entry
  %VPhiS33_D = phi <2 x i64> [ zeroinitializer, %entry ], [ %indvars.iv.next69.iS69_D, %for.inc39.i.split.split ]
  %extractS39_D = extractelement <2 x i64> %VPhiS33_D, i32 1
  %S34_D = trunc <2 x i64> %VPhiS33_D to <2 x i32>
  %SFS34_D = shufflevector <2 x i32> %S34_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130 = icmp ne <2 x i32> %S34_D, %SFS34_D
  %0 = sext <2 x i1> %EDCV0x7fffd3a9d130 to <2 x i32>
  %1 = bitcast <2 x i32> %0 to i64
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %relExit, label %for.body.i.split

for.body.i.split:                                 ; preds = %for.body.i
  %conv.iS35_D = sitofp <2 x i32> %S34_D to <2 x double>
  %SFS35_D = shufflevector <2 x double> %conv.iS35_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13018 = fcmp one <2 x double> %conv.iS35_D, %SFS35_D
  %3 = sext <2 x i1> %EDCV0x7fffd3a9d13018 to <2 x i64>
  %4 = bitcast <2 x i64> %3 to i128
  %5 = icmp ne i128 %4, 0
  br i1 %5, label %relExit, label %for.body.i.split.split

for.body.i.split.split:                           ; preds = %for.body.i.split
  %mul.iS36_D = fmul <2 x double> %conv.iS35_D, <double 2.000000e-01, double 2.000000e-01>
  %SFS36_D = shufflevector <2 x double> %mul.iS36_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13019 = fcmp one <2 x double> %mul.iS36_D, %SFS36_D
  %6 = sext <2 x i1> %EDCV0x7fffd3a9d13019 to <2 x i64>
  %7 = bitcast <2 x i64> %6 to i128
  %8 = icmp ne i128 %7, 0
  br i1 %8, label %relExit, label %for.body.i.split.split.split

for.body.i.split.split.split:                     ; preds = %for.body.i.split.split
  %div.iS37_D = fdiv <2 x double> %mul.iS36_D, <double 4.000000e+01, double 4.000000e+01>
  %SFS37_D = shufflevector <2 x double> %div.iS37_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13020 = fcmp one <2 x double> %div.iS37_D, %SFS37_D
  %9 = sext <2 x i1> %EDCV0x7fffd3a9d13020 to <2 x i64>
  %10 = bitcast <2 x i64> %9 to i128
  %11 = icmp ne i128 %10, 0
  br i1 %11, label %relExit, label %for.body.i.split.split.split.split

for.body.i.split.split.split.split:               ; preds = %for.body.i.split.split.split
  %add.iS38_D = fadd <2 x double> %div.iS37_D, <double 1.900000e+00, double 1.900000e+00>
  %extractS40_D = extractelement <2 x double> %add.iS38_D, i32 1
  %SFS38_D = shufflevector <2 x double> %add.iS38_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13021 = fcmp one <2 x double> %add.iS38_D, %SFS38_D
  %12 = sext <2 x i1> %EDCV0x7fffd3a9d13021 to <2 x i64>
  %13 = bitcast <2 x i64> %12 to i128
  %14 = icmp ne i128 %13, 0
  br i1 %14, label %relExit, label %for.body.i.split.split.split.split.split

for.body.i.split.split.split.split.split:         ; preds = %for.body.i.split.split.split.split
  %arrayidx.i = getelementptr inbounds [40 x double]* %slipRate, i64 0, i64 %extractS39_D
  store double %extractS40_D, double* %arrayidx.i, align 8
  %mul3.iS41_D = fmul <2 x double> %add.iS38_D, <double 1.000000e-03, double 1.000000e-03>
  %extractS43_D = extractelement <2 x double> %mul3.iS41_D, i32 1
  %SFS41_D = shufflevector <2 x double> %mul3.iS41_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13022 = fcmp one <2 x double> %mul3.iS41_D, %SFS41_D
  %15 = sext <2 x i1> %EDCV0x7fffd3a9d13022 to <2 x i64>
  %16 = bitcast <2 x i64> %15 to i128
  %17 = icmp ne i128 %16, 0
  br i1 %17, label %relExit, label %for.body.i.split.split.split.split.split.split

for.body.i.split.split.split.split.split.split:   ; preds = %for.body.i.split.split.split.split.split
  %arrayidx5.i = getelementptr inbounds [40 x double]* %dSlipRate, i64 0, i64 %extractS39_D
  store double %extractS43_D, double* %arrayidx5.i, align 8
  %add7.iS44_D = fadd <2 x double> %conv.iS35_D, <double 2.000000e+00, double 2.000000e+00>
  %extractS46_D = extractelement <2 x double> %add7.iS44_D, i32 1
  %SFS44_D = shufflevector <2 x double> %add7.iS44_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13023 = fcmp one <2 x double> %add7.iS44_D, %SFS44_D
  %18 = sext <2 x i1> %EDCV0x7fffd3a9d13023 to <2 x i64>
  %19 = bitcast <2 x i64> %18 to i128
  %20 = icmp ne i128 %19, 0
  br i1 %20, label %relExit, label %for.body.i.split.split.split.split.split.split.split

for.body.i.split.split.split.split.split.split.split: ; preds = %for.body.i.split.split.split.split.split.split
  %arrayidx9.i = getelementptr inbounds [40 x double]* %tau, i64 0, i64 %extractS39_D
  store double %extractS46_D, double* %arrayidx9.i, align 8
  %arrayidx11.i = getelementptr inbounds [40 x double]* %tauc, i64 0, i64 %extractS39_D
  store double 3.000000e+01, double* %arrayidx11.i, align 8, !tbaa !1
  %add13.iS49_D = fadd <2 x double> %conv.iS35_D, <double 3.500000e+00, double 3.500000e+00>
  %extractS51_D = extractelement <2 x double> %add13.iS49_D, i32 1
  %SFS49_D = shufflevector <2 x double> %add13.iS49_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13024 = fcmp one <2 x double> %add13.iS49_D, %SFS49_D
  %21 = sext <2 x i1> %EDCV0x7fffd3a9d13024 to <2 x i64>
  %22 = bitcast <2 x i64> %21 to i128
  %23 = icmp ne i128 %22, 0
  br i1 %23, label %relExit, label %for.body.i.split.split.split.split.split.split.split.split

for.body.i.split.split.split.split.split.split.split.split: ; preds = %for.body.i.split.split.split.split.split.split.split
  %arrayidx15.i = getelementptr inbounds [40 x double]* %rhs, i64 0, i64 %extractS39_D
  store double %extractS51_D, double* %arrayidx15.i, align 8
  br label %for.body19.i

for.body19.i:                                     ; preds = %for.body19.i.split.split.split.split.split.split.split.split, %for.body.i.split.split.split.split.split.split.split.split
  %VPhiS53_D = phi <2 x i64> [ zeroinitializer, %for.body.i.split.split.split.split.split.split.split.split ], [ %indvars.iv.next.iS66_D, %for.body19.i.split.split.split.split.split.split.split.split ]
  %extractS59_D = extractelement <2 x i64> %VPhiS53_D, i32 1
  %S54_D = trunc <2 x i64> %VPhiS53_D to <2 x i32>
  %SFS54_D = shufflevector <2 x i32> %S54_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13025 = icmp ne <2 x i32> %S54_D, %SFS54_D
  %24 = sext <2 x i1> %EDCV0x7fffd3a9d13025 to <2 x i32>
  %25 = bitcast <2 x i32> %24 to i64
  %26 = icmp ne i64 %25, 0
  br i1 %26, label %relExit, label %for.body19.i.split46

for.body19.i.split46:                             ; preds = %for.body19.i
  %conv20.iS55_D = sitofp <2 x i32> %S54_D to <2 x double>
  %SFS55_D = shufflevector <2 x double> %conv20.iS55_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13026 = fcmp one <2 x double> %conv20.iS55_D, %SFS55_D
  %27 = sext <2 x i1> %EDCV0x7fffd3a9d13026 to <2 x i64>
  %28 = bitcast <2 x i64> %27 to i128
  %29 = icmp ne i128 %28, 0
  br i1 %29, label %relExit, label %for.body19.i.split46.split

for.body19.i.split46.split:                       ; preds = %for.body19.i.split46
  %mul21.iS56_D = fmul <2 x double> %conv20.iS55_D, <double 1.000000e-05, double 1.000000e-05>
  %SFS56_D = shufflevector <2 x double> %mul21.iS56_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13027 = fcmp one <2 x double> %mul21.iS56_D, %SFS56_D
  %30 = sext <2 x i1> %EDCV0x7fffd3a9d13027 to <2 x i64>
  %31 = bitcast <2 x i64> %30 to i128
  %32 = icmp ne i128 %31, 0
  br i1 %32, label %relExit, label %for.body19.i.split

for.body19.i.split:                               ; preds = %for.body19.i.split46.split
  %mul23.iS57_D = fmul <2 x double> %conv.iS35_D, %mul21.iS56_D
  %SFS57_D = shufflevector <2 x double> %mul23.iS57_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13028 = fcmp one <2 x double> %mul23.iS57_D, %SFS57_D
  %33 = sext <2 x i1> %EDCV0x7fffd3a9d13028 to <2 x i64>
  %34 = bitcast <2 x i64> %33 to i128
  %35 = icmp ne i128 %34, 0
  br i1 %35, label %relExit, label %for.body19.i.split.split

for.body19.i.split.split:                         ; preds = %for.body19.i.split
  %add24.iS58_D = fadd <2 x double> %mul23.iS57_D, <double 1.000000e-02, double 1.000000e-02>
  %extractS60_D = extractelement <2 x double> %add24.iS58_D, i32 1
  %SFS58_D = shufflevector <2 x double> %add24.iS58_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13029 = fcmp one <2 x double> %add24.iS58_D, %SFS58_D
  %36 = sext <2 x i1> %EDCV0x7fffd3a9d13029 to <2 x i64>
  %37 = bitcast <2 x i64> %36 to i128
  %38 = icmp ne i128 %37, 0
  br i1 %38, label %relExit, label %for.body19.i.split.split.split

for.body19.i.split.split.split:                   ; preds = %for.body19.i.split.split
  %arrayidx28.i = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 %extractS39_D, i64 %extractS59_D
  store double %extractS60_D, double* %arrayidx28.i, align 8
  %S61_D = add <2 x i64> %VPhiS53_D, %VPhiS33_D
  %SFS61_D = shufflevector <2 x i64> %S61_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13030 = icmp ne <2 x i64> %S61_D, %SFS61_D
  %39 = sext <2 x i1> %EDCV0x7fffd3a9d13030 to <2 x i64>
  %40 = bitcast <2 x i64> %39 to i128
  %41 = icmp ne i128 %40, 0
  br i1 %41, label %relExit, label %for.body19.i.split.split.split.split

for.body19.i.split.split.split.split:             ; preds = %for.body19.i.split.split.split
  %S62_D = trunc <2 x i64> %S61_D to <2 x i32>
  %SFS62_D = shufflevector <2 x i32> %S62_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13031 = icmp ne <2 x i32> %S62_D, %SFS62_D
  %42 = sext <2 x i1> %EDCV0x7fffd3a9d13031 to <2 x i32>
  %43 = bitcast <2 x i32> %42 to i64
  %44 = icmp ne i64 %43, 0
  br i1 %44, label %relExit, label %for.body19.i.split.split.split.split.split

for.body19.i.split.split.split.split.split:       ; preds = %for.body19.i.split.split.split.split
  %conv30.iS63_D = sitofp <2 x i32> %S62_D to <2 x double>
  %extractS65_D = extractelement <2 x double> %conv30.iS63_D, i32 1
  %SFS63_D = shufflevector <2 x double> %conv30.iS63_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13032 = fcmp one <2 x double> %conv30.iS63_D, %SFS63_D
  %45 = sext <2 x i1> %EDCV0x7fffd3a9d13032 to <2 x i64>
  %46 = bitcast <2 x i64> %45 to i128
  %47 = icmp ne i128 %46, 0
  br i1 %47, label %relExit, label %for.body19.i.split.split.split.split.split.split

for.body19.i.split.split.split.split.split.split: ; preds = %for.body19.i.split.split.split.split.split
  %arrayidx34.i = getelementptr inbounds [40 x [40 x double]]* %dtdg, i64 0, i64 %extractS39_D, i64 %extractS59_D
  store double %extractS65_D, double* %arrayidx34.i, align 8
  %indvars.iv.next.iS66_D = add <2 x i64> %VPhiS53_D, <i64 1, i64 1>
  %SFS66_D = shufflevector <2 x i64> %indvars.iv.next.iS66_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13033 = icmp ne <2 x i64> %indvars.iv.next.iS66_D, %SFS66_D
  %48 = sext <2 x i1> %EDCV0x7fffd3a9d13033 to <2 x i64>
  %49 = bitcast <2 x i64> %48 to i128
  %50 = icmp ne i128 %49, 0
  br i1 %50, label %relExit, label %for.body19.i.split.split.split.split.split.split.split

for.body19.i.split.split.split.split.split.split.split: ; preds = %for.body19.i.split.split.split.split.split.split
  %exitcond.iS67_D = icmp eq <2 x i64> %indvars.iv.next.iS66_D, <i64 40, i64 40>
  %SFS67_D = shufflevector <2 x i1> %exitcond.iS67_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13034 = icmp ne <2 x i1> %exitcond.iS67_D, %SFS67_D
  %51 = bitcast <2 x i1> %EDCV0x7fffd3a9d13034 to i2
  %52 = icmp ne i2 %51, 0
  br i1 %52, label %relExit, label %for.body19.i.split.split.split.split.split.split.split.split

for.body19.i.split.split.split.split.split.split.split.split: ; preds = %for.body19.i.split.split.split.split.split.split.split
  %sextS68_D = sext <2 x i1> %exitcond.iS67_D to <2 x i64>
  %BCS68_D = bitcast <2 x i64> %sextS68_D to i128
  %mskS68_D = icmp ne i128 %BCS68_D, 0
  br i1 %mskS68_D, label %for.inc39.i, label %for.body19.i

for.inc39.i:                                      ; preds = %for.body19.i.split.split.split.split.split.split.split.split
  %indvars.iv.next69.iS69_D = add <2 x i64> %VPhiS33_D, <i64 1, i64 1>
  %SFS69_D = shufflevector <2 x i64> %indvars.iv.next69.iS69_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13035 = icmp ne <2 x i64> %indvars.iv.next69.iS69_D, %SFS69_D
  %53 = sext <2 x i1> %EDCV0x7fffd3a9d13035 to <2 x i64>
  %54 = bitcast <2 x i64> %53 to i128
  %55 = icmp ne i128 %54, 0
  br i1 %55, label %relExit, label %for.inc39.i.split

for.inc39.i.split:                                ; preds = %for.inc39.i
  %exitcond70.iS70_D = icmp eq <2 x i64> %indvars.iv.next69.iS69_D, <i64 40, i64 40>
  %SFS70_D = shufflevector <2 x i1> %exitcond70.iS70_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13036 = icmp ne <2 x i1> %exitcond70.iS70_D, %SFS70_D
  %56 = bitcast <2 x i1> %EDCV0x7fffd3a9d13036 to i2
  %57 = icmp ne i2 %56, 0
  br i1 %57, label %relExit, label %for.inc39.i.split.split

for.inc39.i.split.split:                          ; preds = %for.inc39.i.split
  %sextS71_D = sext <2 x i1> %exitcond70.iS70_D to <2 x i64>
  %BCS71_D = bitcast <2 x i64> %sextS71_D to i128
  %mskS71_D = icmp ne i128 %BCS71_D, 0
  br i1 %mskS71_D, label %init.exit, label %for.body.i

init.exit:                                        ; preds = %for.inc39.i.split.split
  %arraydecay1 = getelementptr inbounds [40 x double]* %dSlipRate, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [40 x double]* %tauc, i64 0, i64 0
  %arraydecay5 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [40 x [40 x double]]* %matrix, i64 0, i64 0
  %call8 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call9 = tail call i64 @clock() #1
  %splatS77_D.splatinsert = insertelement <2 x i64> undef, i64 %call9, i32 0
  %splatS77_D.splat = shufflevector <2 x i64> %splatS77_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %call18 = call double @SPEdriver(double* %arraydecay, double* %arraydecay1, double* %arraydecay2, double* %arraydecay3, double* %arraydecay4, [40 x double]* %arraydecay5, [40 x double]* %arraydecay6, [40 x double]* %arraydecay7) #1
  %splatS78_D.splatinsert = insertelement <2 x double> undef, double %call18, i32 0
  %splatS78_D.splat = shufflevector <2 x double> %splatS78_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call19 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call20 = tail call i64 @clock() #1
  %splatS80_D.splatinsert = insertelement <2 x i64> undef, i64 %call20, i32 0
  %splatS80_D.splat = shufflevector <2 x i64> %splatS80_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %puts47 = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str6, i64 0, i64 0))
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), double %call18) #1
  %arrayidx27 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 0
  %58 = load double* %arrayidx27, align 16, !tbaa !1
  %splatS84_D.splatinsert = insertelement <2 x double> undef, double %58, i32 0
  %splatS84_D.splat = shufflevector <2 x double> %splatS84_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 0, double %58) #1
  %arrayidx27.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 13
  %59 = load double* %arrayidx27.1, align 8, !tbaa !1
  %splatS87_D.splatinsert = insertelement <2 x double> undef, double %59, i32 0
  %splatS87_D.splat = shufflevector <2 x double> %splatS87_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 13, double %59) #1
  %arrayidx27.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 26
  %60 = load double* %arrayidx27.2, align 16, !tbaa !1
  %splatS90_D.splatinsert = insertelement <2 x double> undef, double %60, i32 0
  %splatS90_D.splat = shufflevector <2 x double> %splatS90_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 26, double %60) #1
  %arrayidx27.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 0, i64 39
  %61 = load double* %arrayidx27.3, align 8, !tbaa !1
  %splatS93_D.splatinsert = insertelement <2 x double> undef, double %61, i32 0
  %splatS93_D.splat = shufflevector <2 x double> %splatS93_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 0, i32 39, double %61) #1
  %arrayidx27.150 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 0
  %62 = load double* %arrayidx27.150, align 16, !tbaa !1
  %splatS96_D.splatinsert = insertelement <2 x double> undef, double %62, i32 0
  %splatS96_D.splat = shufflevector <2 x double> %splatS96_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.151 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 0, double %62) #1
  %arrayidx27.1.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 13
  %63 = load double* %arrayidx27.1.1, align 8, !tbaa !1
  %splatS99_D.splatinsert = insertelement <2 x double> undef, double %63, i32 0
  %splatS99_D.splat = shufflevector <2 x double> %splatS99_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.1.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 13, double %63) #1
  %arrayidx27.2.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 26
  %64 = load double* %arrayidx27.2.1, align 16, !tbaa !1
  %splatS102_D.splatinsert = insertelement <2 x double> undef, double %64, i32 0
  %splatS102_D.splat = shufflevector <2 x double> %splatS102_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.2.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 26, double %64) #1
  %arrayidx27.3.1 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 13, i64 39
  %65 = load double* %arrayidx27.3.1, align 8, !tbaa !1
  %splatS105_D.splatinsert = insertelement <2 x double> undef, double %65, i32 0
  %splatS105_D.splat = shufflevector <2 x double> %splatS105_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.3.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 13, i32 39, double %65) #1
  %arrayidx27.252 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 0
  %66 = load double* %arrayidx27.252, align 16, !tbaa !1
  %splatS108_D.splatinsert = insertelement <2 x double> undef, double %66, i32 0
  %splatS108_D.splat = shufflevector <2 x double> %splatS108_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.253 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 0, double %66) #1
  %arrayidx27.1.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 13
  %67 = load double* %arrayidx27.1.2, align 8, !tbaa !1
  %splatS111_D.splatinsert = insertelement <2 x double> undef, double %67, i32 0
  %splatS111_D.splat = shufflevector <2 x double> %splatS111_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.1.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 13, double %67) #1
  %arrayidx27.2.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 26
  %68 = load double* %arrayidx27.2.2, align 16, !tbaa !1
  %splatS114_D.splatinsert = insertelement <2 x double> undef, double %68, i32 0
  %splatS114_D.splat = shufflevector <2 x double> %splatS114_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.2.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 26, double %68) #1
  %arrayidx27.3.2 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 26, i64 39
  %69 = load double* %arrayidx27.3.2, align 8, !tbaa !1
  %splatS117_D.splatinsert = insertelement <2 x double> undef, double %69, i32 0
  %splatS117_D.splat = shufflevector <2 x double> %splatS117_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.3.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 26, i32 39, double %69) #1
  %arrayidx27.354 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 0
  %70 = load double* %arrayidx27.354, align 16, !tbaa !1
  %splatS120_D.splatinsert = insertelement <2 x double> undef, double %70, i32 0
  %splatS120_D.splat = shufflevector <2 x double> %splatS120_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.355 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 0, double %70) #1
  %arrayidx27.1.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 13
  %71 = load double* %arrayidx27.1.3, align 8, !tbaa !1
  %splatS123_D.splatinsert = insertelement <2 x double> undef, double %71, i32 0
  %splatS123_D.splat = shufflevector <2 x double> %splatS123_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.1.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 13, double %71) #1
  %arrayidx27.2.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 26
  %72 = load double* %arrayidx27.2.3, align 16, !tbaa !1
  %splatS126_D.splatinsert = insertelement <2 x double> undef, double %72, i32 0
  %splatS126_D.splat = shufflevector <2 x double> %splatS126_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.2.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 26, double %72) #1
  %arrayidx27.3.3 = getelementptr inbounds [40 x [40 x double]]* %dtcdgd, i64 0, i64 39, i64 39
  %73 = load double* %arrayidx27.3.3, align 8, !tbaa !1
  %splatS129_D.splatinsert = insertelement <2 x double> undef, double %73, i32 0
  %splatS129_D.splat = shufflevector <2 x double> %splatS129_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %call28.3.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 39, i32 39, double %73) #1
  %tv_sec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 0
  %74 = load i64* %tv_sec, align 8, !tbaa !5
  %splatS132_D.splatinsert = insertelement <2 x i64> undef, i64 %74, i32 0
  %splatS132_D.splat = shufflevector <2 x i64> %splatS132_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %tv_sec32 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 0
  %75 = load i64* %tv_sec32, align 8, !tbaa !5
  %splatS134_D.splatinsert = insertelement <2 x i64> undef, i64 %75, i32 0
  %splatS134_D.splat = shufflevector <2 x i64> %splatS134_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %subS135_D = sub <2 x i64> %splatS132_D.splat, %splatS134_D.splat
  %SFS135_D = shufflevector <2 x i64> %subS135_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13037 = icmp ne <2 x i64> %subS135_D, %SFS135_D
  %76 = sext <2 x i1> %EDCV0x7fffd3a9d13037 to <2 x i64>
  %77 = bitcast <2 x i64> %76 to i128
  %78 = icmp ne i128 %77, 0
  br i1 %78, label %relExit, label %init.exit.split47

init.exit.split47:                                ; preds = %init.exit
  %convS136_D = sitofp <2 x i64> %subS135_D to <2 x double>
  %SFS136_D = shufflevector <2 x double> %convS136_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13038 = fcmp one <2 x double> %convS136_D, %SFS136_D
  %79 = sext <2 x i1> %EDCV0x7fffd3a9d13038 to <2 x i64>
  %80 = bitcast <2 x i64> %79 to i128
  %81 = icmp ne i128 %80, 0
  br i1 %81, label %relExit, label %init.exit.split47.split

init.exit.split47.split:                          ; preds = %init.exit.split47
  %tv_usec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 1
  %82 = load i64* %tv_usec, align 8, !tbaa !8
  %splatS138_D.splatinsert = insertelement <2 x i64> undef, i64 %82, i32 0
  %splatS138_D.splat = shufflevector <2 x i64> %splatS138_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %tv_usec33 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 1
  %83 = load i64* %tv_usec33, align 8, !tbaa !8
  %splatS140_D.splatinsert = insertelement <2 x i64> undef, i64 %83, i32 0
  %splatS140_D.splat = shufflevector <2 x i64> %splatS140_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %sub34S141_D = sub <2 x i64> %splatS138_D.splat, %splatS140_D.splat
  %SFS141_D = shufflevector <2 x i64> %sub34S141_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13039 = icmp ne <2 x i64> %sub34S141_D, %SFS141_D
  %84 = sext <2 x i1> %EDCV0x7fffd3a9d13039 to <2 x i64>
  %85 = bitcast <2 x i64> %84 to i128
  %86 = icmp ne i128 %85, 0
  br i1 %86, label %relExit, label %init.exit.split47.split.split48

init.exit.split47.split.split48:                  ; preds = %init.exit.split47.split
  %conv35S142_D = sitofp <2 x i64> %sub34S141_D to <2 x double>
  %SFS142_D = shufflevector <2 x double> %conv35S142_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13040 = fcmp one <2 x double> %conv35S142_D, %SFS142_D
  %87 = sext <2 x i1> %EDCV0x7fffd3a9d13040 to <2 x i64>
  %88 = bitcast <2 x i64> %87 to i128
  %89 = icmp ne i128 %88, 0
  br i1 %89, label %relExit, label %init.exit.split47.split.split48.split

init.exit.split47.split.split48.split:            ; preds = %init.exit.split47.split.split48
  %divS143_D = fdiv <2 x double> %conv35S142_D, <double 1.000000e+06, double 1.000000e+06>
  %SFS143_D = shufflevector <2 x double> %divS143_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13041 = fcmp one <2 x double> %divS143_D, %SFS143_D
  %90 = sext <2 x i1> %EDCV0x7fffd3a9d13041 to <2 x i64>
  %91 = bitcast <2 x i64> %90 to i128
  %92 = icmp ne i128 %91, 0
  br i1 %92, label %relExit, label %init.exit.split47.split.split

init.exit.split47.split.split:                    ; preds = %init.exit.split47.split.split48.split
  %add36S144_D = fadd <2 x double> %convS136_D, %divS143_D
  %extadd36S144_D = extractelement <2 x double> %add36S144_D, i32 1
  %SFS144_D = shufflevector <2 x double> %add36S144_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13042 = fcmp one <2 x double> %add36S144_D, %SFS144_D
  %93 = sext <2 x i1> %EDCV0x7fffd3a9d13042 to <2 x i64>
  %94 = bitcast <2 x i64> %93 to i128
  %95 = icmp ne i128 %94, 0
  br i1 %95, label %relExit, label %init.exit.split47.split.split.split

init.exit.split47.split.split.split:              ; preds = %init.exit.split47.split.split
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str4, i64 0, i64 0), double %extadd36S144_D) #1
  %sub38S146_D = sub <2 x i64> %splatS80_D.splat, %splatS77_D.splat
  %SFS146_D = shufflevector <2 x i64> %sub38S146_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13043 = icmp ne <2 x i64> %sub38S146_D, %SFS146_D
  %96 = sext <2 x i1> %EDCV0x7fffd3a9d13043 to <2 x i64>
  %97 = bitcast <2 x i64> %96 to i128
  %98 = icmp ne i128 %97, 0
  br i1 %98, label %relExit, label %init.exit.split47.split.split.split.split

init.exit.split47.split.split.split.split:        ; preds = %init.exit.split47.split.split.split
  %conv39S147_D = sitofp <2 x i64> %sub38S146_D to <2 x double>
  %SFS147_D = shufflevector <2 x double> %conv39S147_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13044 = fcmp one <2 x double> %conv39S147_D, %SFS147_D
  %99 = sext <2 x i1> %EDCV0x7fffd3a9d13044 to <2 x i64>
  %100 = bitcast <2 x i64> %99 to i128
  %101 = icmp ne i128 %100, 0
  br i1 %101, label %relExit, label %init.exit.split47.split.split.split.split.split

init.exit.split47.split.split.split.split.split:  ; preds = %init.exit.split47.split.split.split.split
  %div40S148_D = fdiv <2 x double> %conv39S147_D, <double 1.000000e+06, double 1.000000e+06>
  %extdiv40S148_D = extractelement <2 x double> %div40S148_D, i32 1
  %SFS148_D = shufflevector <2 x double> %div40S148_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13045 = fcmp one <2 x double> %div40S148_D, %SFS148_D
  %102 = sext <2 x i1> %EDCV0x7fffd3a9d13045 to <2 x i64>
  %103 = bitcast <2 x i64> %102 to i128
  %104 = icmp ne i128 %103, 0
  br i1 %104, label %relExit, label %init.exit.split

init.exit.split:                                  ; preds = %init.exit.split47.split.split.split.split.split
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str5, i64 0, i64 0), double %extdiv40S148_D) #1
  ret i32 0

relExit:                                          ; preds = %init.exit.split47.split.split.split.split.split, %init.exit.split47.split.split.split.split, %init.exit.split47.split.split.split, %init.exit.split47.split.split, %init.exit.split47.split.split48.split, %init.exit.split47.split.split48, %init.exit.split47.split, %init.exit.split47, %init.exit, %for.inc39.i.split, %for.inc39.i, %for.body19.i.split.split.split.split.split.split.split, %for.body19.i.split.split.split.split.split.split, %for.body19.i.split.split.split.split.split, %for.body19.i.split.split.split.split, %for.body19.i.split.split.split, %for.body19.i.split.split, %for.body19.i.split, %for.body19.i.split46.split, %for.body19.i.split46, %for.body19.i, %for.body.i.split.split.split.split.split.split.split, %for.body.i.split.split.split.split.split.split, %for.body.i.split.split.split.split.split, %for.body.i.split.split.split.split, %for.body.i.split.split.split, %for.body.i.split.split, %for.body.i.split, %for.body.i
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @relFun, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @func, i32 0, i32 0))
  call void @exit(i32 1)
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

for.body:                                         ; preds = %for.inc39.split.split, %entry
  %VPhiS1_D = phi <2 x i64> [ zeroinitializer, %entry ], [ %indvars.iv.next69S39_D, %for.inc39.split.split ]
  %extractS7_D = extractelement <2 x i64> %VPhiS1_D, i32 1
  %S2_D = trunc <2 x i64> %VPhiS1_D to <2 x i32>
  %SFS2_D = shufflevector <2 x i32> %S2_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130 = icmp ne <2 x i32> %S2_D, %SFS2_D
  %0 = sext <2 x i1> %EDCV0x7fffd3a9d130 to <2 x i32>
  %1 = bitcast <2 x i32> %0 to i64
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %relExit, label %for.body.split25

for.body.split25:                                 ; preds = %for.body
  %convS3_D = sitofp <2 x i32> %S2_D to <2 x double>
  %SFS3_D = shufflevector <2 x double> %convS3_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1302 = fcmp one <2 x double> %convS3_D, %SFS3_D
  %3 = sext <2 x i1> %EDCV0x7fffd3a9d1302 to <2 x i64>
  %4 = bitcast <2 x i64> %3 to i128
  %5 = icmp ne i128 %4, 0
  br i1 %5, label %relExit, label %for.body.split25.split

for.body.split25.split:                           ; preds = %for.body.split25
  %mulS4_D = fmul <2 x double> %convS3_D, <double 2.000000e-01, double 2.000000e-01>
  %SFS4_D = shufflevector <2 x double> %mulS4_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1303 = fcmp one <2 x double> %mulS4_D, %SFS4_D
  %6 = sext <2 x i1> %EDCV0x7fffd3a9d1303 to <2 x i64>
  %7 = bitcast <2 x i64> %6 to i128
  %8 = icmp ne i128 %7, 0
  br i1 %8, label %relExit, label %for.body.split24

for.body.split24:                                 ; preds = %for.body.split25.split
  %divS5_D = fdiv <2 x double> %mulS4_D, <double 4.000000e+01, double 4.000000e+01>
  %SFS5_D = shufflevector <2 x double> %divS5_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1304 = fcmp one <2 x double> %divS5_D, %SFS5_D
  %9 = sext <2 x i1> %EDCV0x7fffd3a9d1304 to <2 x i64>
  %10 = bitcast <2 x i64> %9 to i128
  %11 = icmp ne i128 %10, 0
  br i1 %11, label %relExit, label %for.body.split21

for.body.split21:                                 ; preds = %for.body.split24
  %addS6_D = fadd <2 x double> %divS5_D, <double 1.900000e+00, double 1.900000e+00>
  %extractS8_D = extractelement <2 x double> %addS6_D, i32 1
  %SFS6_D = shufflevector <2 x double> %addS6_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1305 = fcmp one <2 x double> %addS6_D, %SFS6_D
  %12 = sext <2 x i1> %EDCV0x7fffd3a9d1305 to <2 x i64>
  %13 = bitcast <2 x i64> %12 to i128
  %14 = icmp ne i128 %13, 0
  br i1 %14, label %relExit, label %for.body.split

for.body.split:                                   ; preds = %for.body.split21
  %arrayidx = getelementptr inbounds double* %slipRate, i64 %extractS7_D
  store double %extractS8_D, double* %arrayidx, align 8
  %mul3S9_D = fmul <2 x double> %addS6_D, <double 1.000000e-03, double 1.000000e-03>
  %extractS11_D = extractelement <2 x double> %mul3S9_D, i32 1
  %SFS9_D = shufflevector <2 x double> %mul3S9_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1306 = fcmp one <2 x double> %mul3S9_D, %SFS9_D
  %15 = sext <2 x i1> %EDCV0x7fffd3a9d1306 to <2 x i64>
  %16 = bitcast <2 x i64> %15 to i128
  %17 = icmp ne i128 %16, 0
  br i1 %17, label %relExit, label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %arrayidx5 = getelementptr inbounds double* %dSlipRate, i64 %extractS7_D
  store double %extractS11_D, double* %arrayidx5, align 8
  %add7S12_D = fadd <2 x double> %convS3_D, <double 2.000000e+00, double 2.000000e+00>
  %extractS14_D = extractelement <2 x double> %add7S12_D, i32 1
  %SFS12_D = shufflevector <2 x double> %add7S12_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1307 = fcmp one <2 x double> %add7S12_D, %SFS12_D
  %18 = sext <2 x i1> %EDCV0x7fffd3a9d1307 to <2 x i64>
  %19 = bitcast <2 x i64> %18 to i128
  %20 = icmp ne i128 %19, 0
  br i1 %20, label %relExit, label %for.body.split.split.split

for.body.split.split.split:                       ; preds = %for.body.split.split
  %arrayidx9 = getelementptr inbounds double* %tau, i64 %extractS7_D
  store double %extractS14_D, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double* %tauc, i64 %extractS7_D
  store double 3.000000e+01, double* %arrayidx11, align 8, !tbaa !1
  %add13S17_D = fadd <2 x double> %convS3_D, <double 3.500000e+00, double 3.500000e+00>
  %extractS19_D = extractelement <2 x double> %add13S17_D, i32 1
  %SFS17_D = shufflevector <2 x double> %add13S17_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1308 = fcmp one <2 x double> %add13S17_D, %SFS17_D
  %21 = sext <2 x i1> %EDCV0x7fffd3a9d1308 to <2 x i64>
  %22 = bitcast <2 x i64> %21 to i128
  %23 = icmp ne i128 %22, 0
  br i1 %23, label %relExit, label %for.body.split.split.split.split

for.body.split.split.split.split:                 ; preds = %for.body.split.split.split
  %arrayidx15 = getelementptr inbounds double* %rhs, i64 %extractS7_D
  store double %extractS19_D, double* %arrayidx15, align 8
  br label %for.body19

for.body19:                                       ; preds = %for.body19.split.split.split.split.split.split, %for.body.split.split.split.split
  %VPhiS21_D = phi <2 x i64> [ zeroinitializer, %for.body.split.split.split.split ], [ %indvars.iv.nextS36_D, %for.body19.split.split.split.split.split.split ]
  %extractS27_D = extractelement <2 x i64> %VPhiS21_D, i32 1
  %S22_D = trunc <2 x i64> %VPhiS21_D to <2 x i32>
  %SFS22_D = shufflevector <2 x i32> %S22_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1309 = icmp ne <2 x i32> %S22_D, %SFS22_D
  %24 = sext <2 x i1> %EDCV0x7fffd3a9d1309 to <2 x i32>
  %25 = bitcast <2 x i32> %24 to i64
  %26 = icmp ne i64 %25, 0
  br i1 %26, label %relExit, label %for.body19.split

for.body19.split:                                 ; preds = %for.body19
  %conv20S23_D = sitofp <2 x i32> %S22_D to <2 x double>
  %SFS23_D = shufflevector <2 x double> %conv20S23_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13010 = fcmp one <2 x double> %conv20S23_D, %SFS23_D
  %27 = sext <2 x i1> %EDCV0x7fffd3a9d13010 to <2 x i64>
  %28 = bitcast <2 x i64> %27 to i128
  %29 = icmp ne i128 %28, 0
  br i1 %29, label %relExit, label %for.body19.split.split

for.body19.split.split:                           ; preds = %for.body19.split
  %mul21S24_D = fmul <2 x double> %conv20S23_D, <double 1.000000e-05, double 1.000000e-05>
  %SFS24_D = shufflevector <2 x double> %mul21S24_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13011 = fcmp one <2 x double> %mul21S24_D, %SFS24_D
  %30 = sext <2 x i1> %EDCV0x7fffd3a9d13011 to <2 x i64>
  %31 = bitcast <2 x i64> %30 to i128
  %32 = icmp ne i128 %31, 0
  br i1 %32, label %relExit, label %for.body19.split.split.split

for.body19.split.split.split:                     ; preds = %for.body19.split.split
  %mul23S25_D = fmul <2 x double> %convS3_D, %mul21S24_D
  %SFS25_D = shufflevector <2 x double> %mul23S25_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13012 = fcmp one <2 x double> %mul23S25_D, %SFS25_D
  %33 = sext <2 x i1> %EDCV0x7fffd3a9d13012 to <2 x i64>
  %34 = bitcast <2 x i64> %33 to i128
  %35 = icmp ne i128 %34, 0
  br i1 %35, label %relExit, label %for.body19.split.split.split.split23

for.body19.split.split.split.split23:             ; preds = %for.body19.split.split.split
  %add24S26_D = fadd <2 x double> %mul23S25_D, <double 1.000000e-02, double 1.000000e-02>
  %extractS28_D = extractelement <2 x double> %add24S26_D, i32 1
  %SFS26_D = shufflevector <2 x double> %add24S26_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13013 = fcmp one <2 x double> %add24S26_D, %SFS26_D
  %36 = sext <2 x i1> %EDCV0x7fffd3a9d13013 to <2 x i64>
  %37 = bitcast <2 x i64> %36 to i128
  %38 = icmp ne i128 %37, 0
  br i1 %38, label %relExit, label %for.body19.split.split.split.split23.split

for.body19.split.split.split.split23.split:       ; preds = %for.body19.split.split.split.split23
  %arrayidx28 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS7_D, i64 %extractS27_D
  store double %extractS28_D, double* %arrayidx28, align 8
  %S29_D = add <2 x i64> %VPhiS21_D, %VPhiS1_D
  %SFS29_D = shufflevector <2 x i64> %S29_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13014 = icmp ne <2 x i64> %S29_D, %SFS29_D
  %39 = sext <2 x i1> %EDCV0x7fffd3a9d13014 to <2 x i64>
  %40 = bitcast <2 x i64> %39 to i128
  %41 = icmp ne i128 %40, 0
  br i1 %41, label %relExit, label %for.body19.split.split.split.split22

for.body19.split.split.split.split22:             ; preds = %for.body19.split.split.split.split23.split
  %S30_D = trunc <2 x i64> %S29_D to <2 x i32>
  %SFS30_D = shufflevector <2 x i32> %S30_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13015 = icmp ne <2 x i32> %S30_D, %SFS30_D
  %42 = sext <2 x i1> %EDCV0x7fffd3a9d13015 to <2 x i32>
  %43 = bitcast <2 x i32> %42 to i64
  %44 = icmp ne i64 %43, 0
  br i1 %44, label %relExit, label %for.body19.split.split.split.split22.split

for.body19.split.split.split.split22.split:       ; preds = %for.body19.split.split.split.split22
  %conv30S31_D = sitofp <2 x i32> %S30_D to <2 x double>
  %extractS33_D = extractelement <2 x double> %conv30S31_D, i32 1
  %SFS31_D = shufflevector <2 x double> %conv30S31_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13016 = fcmp one <2 x double> %conv30S31_D, %SFS31_D
  %45 = sext <2 x i1> %EDCV0x7fffd3a9d13016 to <2 x i64>
  %46 = bitcast <2 x i64> %45 to i128
  %47 = icmp ne i128 %46, 0
  br i1 %47, label %relExit, label %for.body19.split.split.split.split

for.body19.split.split.split.split:               ; preds = %for.body19.split.split.split.split22.split
  %arrayidx34 = getelementptr inbounds [40 x double]* %dtdg, i64 %extractS7_D, i64 %extractS27_D
  store double %extractS33_D, double* %arrayidx34, align 8
  %arrayidx38 = getelementptr inbounds [40 x double]* %matrix, i64 %extractS7_D, i64 %extractS27_D
  store double 0.000000e+00, double* %arrayidx38, align 8, !tbaa !1
  %indvars.iv.nextS36_D = add <2 x i64> %VPhiS21_D, <i64 1, i64 1>
  %SFS36_D = shufflevector <2 x i64> %indvars.iv.nextS36_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13017 = icmp ne <2 x i64> %indvars.iv.nextS36_D, %SFS36_D
  %48 = sext <2 x i1> %EDCV0x7fffd3a9d13017 to <2 x i64>
  %49 = bitcast <2 x i64> %48 to i128
  %50 = icmp ne i128 %49, 0
  br i1 %50, label %relExit, label %for.body19.split.split.split.split.split

for.body19.split.split.split.split.split:         ; preds = %for.body19.split.split.split.split
  %exitcondS37_D = icmp eq <2 x i64> %indvars.iv.nextS36_D, <i64 40, i64 40>
  %SFS37_D = shufflevector <2 x i1> %exitcondS37_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13018 = icmp ne <2 x i1> %exitcondS37_D, %SFS37_D
  %51 = bitcast <2 x i1> %EDCV0x7fffd3a9d13018 to i2
  %52 = icmp ne i2 %51, 0
  br i1 %52, label %relExit, label %for.body19.split.split.split.split.split.split

for.body19.split.split.split.split.split.split:   ; preds = %for.body19.split.split.split.split.split
  %sextS38_D = sext <2 x i1> %exitcondS37_D to <2 x i64>
  %BCS38_D = bitcast <2 x i64> %sextS38_D to i128
  %mskS38_D = icmp ne i128 %BCS38_D, 0
  br i1 %mskS38_D, label %for.inc39, label %for.body19

for.inc39:                                        ; preds = %for.body19.split.split.split.split.split.split
  %indvars.iv.next69S39_D = add <2 x i64> %VPhiS1_D, <i64 1, i64 1>
  %SFS39_D = shufflevector <2 x i64> %indvars.iv.next69S39_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13019 = icmp ne <2 x i64> %indvars.iv.next69S39_D, %SFS39_D
  %53 = sext <2 x i1> %EDCV0x7fffd3a9d13019 to <2 x i64>
  %54 = bitcast <2 x i64> %53 to i128
  %55 = icmp ne i128 %54, 0
  br i1 %55, label %relExit, label %for.inc39.split

for.inc39.split:                                  ; preds = %for.inc39
  %exitcond70S40_D = icmp eq <2 x i64> %indvars.iv.next69S39_D, <i64 40, i64 40>
  %SFS40_D = shufflevector <2 x i1> %exitcond70S40_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13020 = icmp ne <2 x i1> %exitcond70S40_D, %SFS40_D
  %56 = bitcast <2 x i1> %EDCV0x7fffd3a9d13020 to i2
  %57 = icmp ne i2 %56, 0
  br i1 %57, label %relExit, label %for.inc39.split.split

for.inc39.split.split:                            ; preds = %for.inc39.split
  %sextS41_D = sext <2 x i1> %exitcond70S40_D to <2 x i64>
  %BCS41_D = bitcast <2 x i64> %sextS41_D to i128
  %mskS41_D = icmp ne i128 %BCS41_D, 0
  br i1 %mskS41_D, label %for.end41, label %for.body

for.end41:                                        ; preds = %for.inc39.split.split
  ret void

relExit:                                          ; preds = %for.inc39.split, %for.inc39, %for.body19.split.split.split.split.split, %for.body19.split.split.split.split, %for.body19.split.split.split.split22.split, %for.body19.split.split.split.split22, %for.body19.split.split.split.split23.split, %for.body19.split.split.split.split23, %for.body19.split.split.split, %for.body19.split.split, %for.body19.split, %for.body19, %for.body.split.split.split, %for.body.split.split, %for.body.split, %for.body.split21, %for.body.split24, %for.body.split25.split, %for.body.split25, %for.body
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @relFun, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @func1, i32 0, i32 0))
  call void @exit(i32 1)
  ret void
}

; Function Attrs: nounwind uwtable
define double @SPEdriver(double* nocapture readonly %slipRate, double* nocapture readonly %dSlipRate, double* nocapture %tau, double* nocapture readonly %tauc, double* nocapture %rhs, [40 x double]* nocapture %dtcdgd, [40 x double]* nocapture readonly %dtdg, [40 x double]* nocapture %matrix) #0 {
entry:
  %rateFact.i = alloca [40 x double], align 16
  %splatrateFact.iS37_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %rateFact.i, i32 0
  %splatrateFact.iS37_D.splat = shufflevector <2 x [40 x double]*> %splatrateFact.iS37_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %sgn.i = alloca [40 x double], align 16
  %splatsgn.iS38_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %sgn.i, i32 0
  %splatsgn.iS38_D.splat = shufflevector <2 x [40 x double]*> %splatsgn.iS38_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %t0 = alloca %struct.timeval, align 8
  %t1 = alloca %struct.timeval, align 8
  %call = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call5 = tail call i64 @clock() #1
  %splatS5_D.splatinsert = insertelement <2 x i64> undef, i64 %call5, i32 0
  %splatS5_D.splat = shufflevector <2 x i64> %splatS5_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %for.body

for.body:                                         ; preds = %for.body.split.split, %entry
  %VPhiS7_D = phi <2 x i32> [ zeroinitializer, %entry ], [ %incS9_D, %for.body.split.split ]
  tail call void @Crystal_div(i32 40, double 1.000000e-02, double* %slipRate, double* %dSlipRate, double* %tau, double* %tauc, double* %rhs, [40 x double]* %dtcdgd, [40 x double]* %dtdg, [40 x double]* %matrix) #1
  %incS9_D = add <2 x i32> %VPhiS7_D, <i32 1, i32 1>
  %SFS9_D = shufflevector <2 x i32> %incS9_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130 = icmp ne <2 x i32> %incS9_D, %SFS9_D
  %0 = sext <2 x i1> %EDCV0x7fffd3a9d130 to <2 x i32>
  %1 = bitcast <2 x i32> %0 to i64
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %relExit, label %for.body.split

for.body.split:                                   ; preds = %for.body
  %exitcond170S10_D = icmp eq <2 x i32> %incS9_D, <i32 1000000, i32 1000000>
  %SFS10_D = shufflevector <2 x i1> %exitcond170S10_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13036 = icmp ne <2 x i1> %exitcond170S10_D, %SFS10_D
  %3 = bitcast <2 x i1> %EDCV0x7fffd3a9d13036 to i2
  %4 = icmp ne i2 %3, 0
  br i1 %4, label %relExit, label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %sextS11_D = sext <2 x i1> %exitcond170S10_D to <2 x i64>
  %BCS11_D = bitcast <2 x i64> %sextS11_D to i128
  %mskS11_D = icmp ne i128 %BCS11_D, 0
  br i1 %mskS11_D, label %for.end, label %for.body

for.end:                                          ; preds = %for.body.split.split
  %call6 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call7 = tail call i64 @clock() #1
  %splatS13_D.splatinsert = insertelement <2 x i64> undef, i64 %call7, i32 0
  %splatS13_D.splat = shufflevector <2 x i64> %splatS13_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %tv_sec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 0
  %5 = load i64* %tv_sec, align 8, !tbaa !5
  %splatS15_D.splatinsert = insertelement <2 x i64> undef, i64 %5, i32 0
  %splatS15_D.splat = shufflevector <2 x i64> %splatS15_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %tv_sec8 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 0
  %6 = load i64* %tv_sec8, align 8, !tbaa !5
  %splatS17_D.splatinsert = insertelement <2 x i64> undef, i64 %6, i32 0
  %splatS17_D.splat = shufflevector <2 x i64> %splatS17_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %subS18_D = sub <2 x i64> %splatS15_D.splat, %splatS17_D.splat
  %SFS18_D = shufflevector <2 x i64> %subS18_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13037 = icmp ne <2 x i64> %subS18_D, %SFS18_D
  %7 = sext <2 x i1> %EDCV0x7fffd3a9d13037 to <2 x i64>
  %8 = bitcast <2 x i64> %7 to i128
  %9 = icmp ne i128 %8, 0
  br i1 %9, label %relExit, label %for.end.split127

for.end.split127:                                 ; preds = %for.end
  %convS19_D = sitofp <2 x i64> %subS18_D to <2 x double>
  %SFS19_D = shufflevector <2 x double> %convS19_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13038 = fcmp one <2 x double> %convS19_D, %SFS19_D
  %10 = sext <2 x i1> %EDCV0x7fffd3a9d13038 to <2 x i64>
  %11 = bitcast <2 x i64> %10 to i128
  %12 = icmp ne i128 %11, 0
  br i1 %12, label %relExit, label %for.end.split127.split

for.end.split127.split:                           ; preds = %for.end.split127
  %tv_usec = getelementptr inbounds %struct.timeval* %t1, i64 0, i32 1
  %13 = load i64* %tv_usec, align 8, !tbaa !8
  %splatS21_D.splatinsert = insertelement <2 x i64> undef, i64 %13, i32 0
  %splatS21_D.splat = shufflevector <2 x i64> %splatS21_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %tv_usec9 = getelementptr inbounds %struct.timeval* %t0, i64 0, i32 1
  %14 = load i64* %tv_usec9, align 8, !tbaa !8
  %splatS23_D.splatinsert = insertelement <2 x i64> undef, i64 %14, i32 0
  %splatS23_D.splat = shufflevector <2 x i64> %splatS23_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %sub10S24_D = sub <2 x i64> %splatS21_D.splat, %splatS23_D.splat
  %SFS24_D = shufflevector <2 x i64> %sub10S24_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13039 = icmp ne <2 x i64> %sub10S24_D, %SFS24_D
  %15 = sext <2 x i1> %EDCV0x7fffd3a9d13039 to <2 x i64>
  %16 = bitcast <2 x i64> %15 to i128
  %17 = icmp ne i128 %16, 0
  br i1 %17, label %relExit, label %for.end.split127.split.split

for.end.split127.split.split:                     ; preds = %for.end.split127.split
  %conv11S25_D = sitofp <2 x i64> %sub10S24_D to <2 x double>
  %SFS25_D = shufflevector <2 x double> %conv11S25_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13040 = fcmp one <2 x double> %conv11S25_D, %SFS25_D
  %18 = sext <2 x i1> %EDCV0x7fffd3a9d13040 to <2 x i64>
  %19 = bitcast <2 x i64> %18 to i128
  %20 = icmp ne i128 %19, 0
  br i1 %20, label %relExit, label %for.end.split127.split.split.split

for.end.split127.split.split.split:               ; preds = %for.end.split127.split.split
  %divS26_D = fdiv <2 x double> %conv11S25_D, <double 1.000000e+06, double 1.000000e+06>
  %SFS26_D = shufflevector <2 x double> %divS26_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13041 = fcmp one <2 x double> %divS26_D, %SFS26_D
  %21 = sext <2 x i1> %EDCV0x7fffd3a9d13041 to <2 x i64>
  %22 = bitcast <2 x i64> %21 to i128
  %23 = icmp ne i128 %22, 0
  br i1 %23, label %relExit, label %for.end.split127.split.split.split.split

for.end.split127.split.split.split.split:         ; preds = %for.end.split127.split.split.split
  %addS27_D = fadd <2 x double> %convS19_D, %divS26_D
  %extaddS27_D = extractelement <2 x double> %addS27_D, i32 1
  %SFS27_D = shufflevector <2 x double> %addS27_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13042 = fcmp one <2 x double> %addS27_D, %SFS27_D
  %24 = sext <2 x i1> %EDCV0x7fffd3a9d13042 to <2 x i64>
  %25 = bitcast <2 x i64> %24 to i128
  %26 = icmp ne i128 %25, 0
  br i1 %26, label %relExit, label %for.end.split

for.end.split:                                    ; preds = %for.end.split127.split.split.split.split
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str4, i64 0, i64 0))
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %extaddS27_D) #1
  %sub14S30_D = sub <2 x i64> %splatS13_D.splat, %splatS5_D.splat
  %SFS30_D = shufflevector <2 x i64> %sub14S30_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13043 = icmp ne <2 x i64> %sub14S30_D, %SFS30_D
  %27 = sext <2 x i1> %EDCV0x7fffd3a9d13043 to <2 x i64>
  %28 = bitcast <2 x i64> %27 to i128
  %29 = icmp ne i128 %28, 0
  br i1 %29, label %relExit, label %for.end.split.split

for.end.split.split:                              ; preds = %for.end.split
  %conv15S31_D = sitofp <2 x i64> %sub14S30_D to <2 x double>
  %SFS31_D = shufflevector <2 x double> %conv15S31_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13044 = fcmp one <2 x double> %conv15S31_D, %SFS31_D
  %30 = sext <2 x i1> %EDCV0x7fffd3a9d13044 to <2 x i64>
  %31 = bitcast <2 x i64> %30 to i128
  %32 = icmp ne i128 %31, 0
  br i1 %32, label %relExit, label %for.end.split.split.split

for.end.split.split.split:                        ; preds = %for.end.split.split
  %div16S32_D = fdiv <2 x double> %conv15S31_D, <double 1.000000e+06, double 1.000000e+06>
  %extdiv16S32_D = extractelement <2 x double> %div16S32_D, i32 1
  %SFS32_D = shufflevector <2 x double> %div16S32_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13045 = fcmp one <2 x double> %div16S32_D, %SFS32_D
  %33 = sext <2 x i1> %EDCV0x7fffd3a9d13045 to <2 x i64>
  %34 = bitcast <2 x i64> %33 to i128
  %35 = icmp ne i128 %34, 0
  br i1 %35, label %relExit, label %for.end.split.split.split.split

for.end.split.split.split.split:                  ; preds = %for.end.split.split.split
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %extdiv16S32_D) #1
  %call18 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call19 = tail call i64 @clock() #1
  %splatS35_D.splatinsert = insertelement <2 x i64> undef, i64 %call19, i32 0
  %splatS35_D.splat = shufflevector <2 x i64> %splatS35_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %arrayidx20.i = getelementptr inbounds [40 x double]* %rateFact.i, i64 0, i64 3
  %bitcastS37_D = bitcast <2 x [40 x double]*> %splatrateFact.iS37_D.splat to <2 x i8*>
  %bitcastS38_D = bitcast <2 x [40 x double]*> %splatsgn.iS38_D.splat to <2 x i8*>
  br label %for.body23

for.body23:                                       ; preds = %Crystal_pow.exit.split.split, %for.end.split.split.split.split
  %VPhiS40_D = phi <2 x i32> [ zeroinitializer, %for.end.split.split.split.split ], [ %inc26S74_D, %Crystal_pow.exit.split.split ]
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.split.split.split.split.split.split, %for.body23
  %VPhiS44_D = phi <2 x i64> [ zeroinitializer, %for.body23 ], [ %inc.iS53_D, %for.body.i.split.split.split.split.split.split ]
  %extractS45_D = extractelement <2 x i64> %VPhiS44_D, i32 1
  %arrayidx.i = getelementptr inbounds [40 x double]* %sgn.i, i64 0, i64 %extractS45_D
  store double 1.000000e+00, double* %arrayidx.i, align 8, !tbaa !1
  %conv2.iS47_D = sitofp <2 x i64> %VPhiS44_D to <2 x double>
  %SFS47_D = shufflevector <2 x double> %conv2.iS47_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13050 = fcmp one <2 x double> %conv2.iS47_D, %SFS47_D
  %36 = sext <2 x i1> %EDCV0x7fffd3a9d13050 to <2 x i64>
  %37 = bitcast <2 x i64> %36 to i128
  %38 = icmp ne i128 %37, 0
  br i1 %38, label %relExit, label %for.body.i.split

for.body.i.split:                                 ; preds = %for.body.i
  %mul.iS48_D = fmul <2 x double> %conv2.iS47_D, <double 2.000000e-01, double 2.000000e-01>
  %SFS48_D = shufflevector <2 x double> %mul.iS48_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13051 = fcmp one <2 x double> %mul.iS48_D, %SFS48_D
  %39 = sext <2 x i1> %EDCV0x7fffd3a9d13051 to <2 x i64>
  %40 = bitcast <2 x i64> %39 to i128
  %41 = icmp ne i128 %40, 0
  br i1 %41, label %relExit, label %for.body.i.split.split

for.body.i.split.split:                           ; preds = %for.body.i.split
  %mul3.iS49_D = fmul <2 x double> %mul.iS48_D, <double 9.000000e-01, double 9.000000e-01>
  %SFS49_D = shufflevector <2 x double> %mul3.iS49_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13052 = fcmp one <2 x double> %mul3.iS49_D, %SFS49_D
  %42 = sext <2 x i1> %EDCV0x7fffd3a9d13052 to <2 x i64>
  %43 = bitcast <2 x i64> %42 to i128
  %44 = icmp ne i128 %43, 0
  br i1 %44, label %relExit, label %for.body.i.split.split.split

for.body.i.split.split.split:                     ; preds = %for.body.i.split.split
  %div.iS50_D = fdiv <2 x double> %mul3.iS49_D, <double 4.000000e+01, double 4.000000e+01>
  %extractS52_D = extractelement <2 x double> %div.iS50_D, i32 1
  %SFS50_D = shufflevector <2 x double> %div.iS50_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13053 = fcmp one <2 x double> %div.iS50_D, %SFS50_D
  %45 = sext <2 x i1> %EDCV0x7fffd3a9d13053 to <2 x i64>
  %46 = bitcast <2 x i64> %45 to i128
  %47 = icmp ne i128 %46, 0
  br i1 %47, label %relExit, label %for.body.i.split.split.split.split

for.body.i.split.split.split.split:               ; preds = %for.body.i.split.split.split
  %arrayidx4.i = getelementptr inbounds [40 x double]* %rateFact.i, i64 0, i64 %extractS45_D
  store double %extractS52_D, double* %arrayidx4.i, align 8
  %inc.iS53_D = add <2 x i64> %VPhiS44_D, <i64 1, i64 1>
  %SFS53_D = shufflevector <2 x i64> %inc.iS53_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13054 = icmp ne <2 x i64> %inc.iS53_D, %SFS53_D
  %48 = sext <2 x i1> %EDCV0x7fffd3a9d13054 to <2 x i64>
  %49 = bitcast <2 x i64> %48 to i128
  %50 = icmp ne i128 %49, 0
  br i1 %50, label %relExit, label %for.body.i.split.split.split.split.split

for.body.i.split.split.split.split.split:         ; preds = %for.body.i.split.split.split.split
  %exitcond35.iS54_D = icmp eq <2 x i64> %inc.iS53_D, <i64 40, i64 40>
  %SFS54_D = shufflevector <2 x i1> %exitcond35.iS54_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13055 = icmp ne <2 x i1> %exitcond35.iS54_D, %SFS54_D
  %51 = bitcast <2 x i1> %EDCV0x7fffd3a9d13055 to i2
  %52 = icmp ne i2 %51, 0
  br i1 %52, label %relExit, label %for.body.i.split.split.split.split.split.split

for.body.i.split.split.split.split.split.split:   ; preds = %for.body.i.split.split.split.split.split
  %sextS55_D = sext <2 x i1> %exitcond35.iS54_D to <2 x i64>
  %BCS55_D = bitcast <2 x i64> %sextS55_D to i128
  %mskS55_D = icmp ne i128 %BCS55_D, 0
  br i1 %mskS55_D, label %for.body9.i, label %for.body.i

for.body9.i:                                      ; preds = %for.body9.i.split.split.split.split.split.split.split, %for.body.i.split.split.split.split.split.split
  %VPhiS56_D = phi <2 x i64> [ %inc18.iS68_D, %for.body9.i.split.split.split.split.split.split.split ], [ zeroinitializer, %for.body.i.split.split.split.split.split.split ]
  %extractS57_D = extractelement <2 x i64> %VPhiS56_D, i32 1
  %arrayidx11.i = getelementptr inbounds double* %slipRate, i64 %extractS57_D
  %53 = load double* %arrayidx11.i, align 8, !tbaa !1
  %splatS58_D.splatinsert = insertelement <2 x double> undef, double %53, i32 0
  %splatS58_D.splat = shufflevector <2 x double> %splatS58_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx12.i = getelementptr inbounds [40 x double]* %sgn.i, i64 0, i64 %extractS57_D
  %54 = load double* %arrayidx12.i, align 8, !tbaa !1
  %splatS60_D.splatinsert = insertelement <2 x double> undef, double %54, i32 0
  %splatS60_D.splat = shufflevector <2 x double> %splatS60_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul13.iS61_D = fmul <2 x double> %splatS58_D.splat, %splatS60_D.splat
  %SFS61_D = shufflevector <2 x double> %mul13.iS61_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13056 = fcmp one <2 x double> %mul13.iS61_D, %SFS61_D
  %55 = sext <2 x i1> %EDCV0x7fffd3a9d13056 to <2 x i64>
  %56 = bitcast <2 x i64> %55 to i128
  %57 = icmp ne i128 %56, 0
  br i1 %57, label %relExit, label %for.body9.i.split

for.body9.i.split:                                ; preds = %for.body9.i
  %add.iS62_D = fadd <2 x double> %mul13.iS61_D, <double 1.000000e-06, double 1.000000e-06>
  %SFS62_D = shufflevector <2 x double> %add.iS62_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13057 = fcmp one <2 x double> %add.iS62_D, %SFS62_D
  %58 = sext <2 x i1> %EDCV0x7fffd3a9d13057 to <2 x i64>
  %59 = bitcast <2 x i64> %58 to i128
  %60 = icmp ne i128 %59, 0
  br i1 %60, label %relExit, label %for.body9.i.split.split

for.body9.i.split.split:                          ; preds = %for.body9.i.split
  %div14.iS63_D = fmul <2 x double> %add.iS62_D, <double 5.000000e-01, double 5.000000e-01>
  %SFS63_D = shufflevector <2 x double> %div14.iS63_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13058 = fcmp one <2 x double> %div14.iS63_D, %SFS63_D
  %61 = sext <2 x i1> %EDCV0x7fffd3a9d13058 to <2 x i64>
  %62 = bitcast <2 x i64> %61 to i128
  %63 = icmp ne i128 %62, 0
  br i1 %63, label %relExit, label %for.body9.i.split.split.split

for.body9.i.split.split.split:                    ; preds = %for.body9.i.split.split
  %vpowS64_D = call <2 x double> @llvm.pow.v2f64(<2 x double> %div14.iS63_D, <2 x double> <double 1.000000e-02, double 1.000000e-02>)
  %SFS64_D = shufflevector <2 x double> %vpowS64_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13059 = fcmp one <2 x double> %vpowS64_D, %SFS64_D
  %64 = sext <2 x i1> %EDCV0x7fffd3a9d13059 to <2 x i64>
  %65 = bitcast <2 x i64> %64 to i128
  %66 = icmp ne i128 %65, 0
  br i1 %66, label %relExit, label %for.body9.i.split.split.split.split

for.body9.i.split.split.split.split:              ; preds = %for.body9.i.split.split.split
  %mul15.iS65_D = fmul <2 x double> %vpowS64_D, <double 1.200000e+00, double 1.200000e+00>
  %extractS67_D = extractelement <2 x double> %mul15.iS65_D, i32 1
  %SFS65_D = shufflevector <2 x double> %mul15.iS65_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13060 = fcmp one <2 x double> %mul15.iS65_D, %SFS65_D
  %67 = sext <2 x i1> %EDCV0x7fffd3a9d13060 to <2 x i64>
  %68 = bitcast <2 x i64> %67 to i128
  %69 = icmp ne i128 %68, 0
  br i1 %69, label %relExit, label %for.body9.i.split.split.split.split.split

for.body9.i.split.split.split.split.split:        ; preds = %for.body9.i.split.split.split.split
  %arrayidx16.i = getelementptr inbounds [40 x double]* %rateFact.i, i64 0, i64 %extractS57_D
  store double %extractS67_D, double* %arrayidx16.i, align 8
  %inc18.iS68_D = add <2 x i64> %VPhiS56_D, <i64 1, i64 1>
  %SFS68_D = shufflevector <2 x i64> %inc18.iS68_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13061 = icmp ne <2 x i64> %inc18.iS68_D, %SFS68_D
  %70 = sext <2 x i1> %EDCV0x7fffd3a9d13061 to <2 x i64>
  %71 = bitcast <2 x i64> %70 to i128
  %72 = icmp ne i128 %71, 0
  br i1 %72, label %relExit, label %for.body9.i.split.split.split.split.split.split

for.body9.i.split.split.split.split.split.split:  ; preds = %for.body9.i.split.split.split.split.split
  %exitcond.iS69_D = icmp eq <2 x i64> %inc18.iS68_D, <i64 40, i64 40>
  %SFS69_D = shufflevector <2 x i1> %exitcond.iS69_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13062 = icmp ne <2 x i1> %exitcond.iS69_D, %SFS69_D
  %73 = bitcast <2 x i1> %EDCV0x7fffd3a9d13062 to i2
  %74 = icmp ne i2 %73, 0
  br i1 %74, label %relExit, label %for.body9.i.split.split.split.split.split.split.split

for.body9.i.split.split.split.split.split.split.split: ; preds = %for.body9.i.split.split.split.split.split.split
  %sextS70_D = sext <2 x i1> %exitcond.iS69_D to <2 x i64>
  %BCS70_D = bitcast <2 x i64> %sextS70_D to i128
  %mskS70_D = icmp ne i128 %BCS70_D, 0
  br i1 %mskS70_D, label %Crystal_pow.exit, label %for.body9.i

Crystal_pow.exit:                                 ; preds = %for.body9.i.split.split.split.split.split.split.split
  %75 = load double* %arrayidx20.i, align 8, !tbaa !1
  %splatS71_D.splatinsert = insertelement <2 x double> undef, double %75, i32 0
  %splatS71_D.splat = shufflevector <2 x double> %splatS71_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %inc26S74_D = add <2 x i32> %VPhiS40_D, <i32 1, i32 1>
  %SFS74_D = shufflevector <2 x i32> %inc26S74_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13063 = icmp ne <2 x i32> %inc26S74_D, %SFS74_D
  %76 = sext <2 x i1> %EDCV0x7fffd3a9d13063 to <2 x i32>
  %77 = bitcast <2 x i32> %76 to i64
  %78 = icmp ne i64 %77, 0
  br i1 %78, label %relExit, label %Crystal_pow.exit.split

Crystal_pow.exit.split:                           ; preds = %Crystal_pow.exit
  %exitcond169S75_D = icmp eq <2 x i32> %inc26S74_D, <i32 1000000, i32 1000000>
  %SFS75_D = shufflevector <2 x i1> %exitcond169S75_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13064 = icmp ne <2 x i1> %exitcond169S75_D, %SFS75_D
  %79 = bitcast <2 x i1> %EDCV0x7fffd3a9d13064 to i2
  %80 = icmp ne i2 %79, 0
  br i1 %80, label %relExit, label %Crystal_pow.exit.split.split

Crystal_pow.exit.split.split:                     ; preds = %Crystal_pow.exit.split
  %sextS76_D = sext <2 x i1> %exitcond169S75_D to <2 x i64>
  %BCS76_D = bitcast <2 x i64> %sextS76_D to i128
  %mskS76_D = icmp ne i128 %BCS76_D, 0
  br i1 %mskS76_D, label %for.end27, label %for.body23

for.end27:                                        ; preds = %Crystal_pow.exit.split.split
  %call28 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call29 = tail call i64 @clock() #1
  %splatS78_D.splatinsert = insertelement <2 x i64> undef, i64 %call29, i32 0
  %splatS78_D.splat = shufflevector <2 x i64> %splatS78_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %81 = load i64* %tv_sec, align 8, !tbaa !5
  %splatS79_D.splatinsert = insertelement <2 x i64> undef, i64 %81, i32 0
  %splatS79_D.splat = shufflevector <2 x i64> %splatS79_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %82 = load i64* %tv_sec8, align 8, !tbaa !5
  %splatS80_D.splatinsert = insertelement <2 x i64> undef, i64 %82, i32 0
  %splatS80_D.splat = shufflevector <2 x i64> %splatS80_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %sub32S81_D = sub <2 x i64> %splatS79_D.splat, %splatS80_D.splat
  %SFS81_D = shufflevector <2 x i64> %sub32S81_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13065 = icmp ne <2 x i64> %sub32S81_D, %SFS81_D
  %83 = sext <2 x i1> %EDCV0x7fffd3a9d13065 to <2 x i64>
  %84 = bitcast <2 x i64> %83 to i128
  %85 = icmp ne i128 %84, 0
  br i1 %85, label %relExit, label %for.end27.split

for.end27.split:                                  ; preds = %for.end27
  %conv33S82_D = sitofp <2 x i64> %sub32S81_D to <2 x double>
  %SFS82_D = shufflevector <2 x double> %conv33S82_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13066 = fcmp one <2 x double> %conv33S82_D, %SFS82_D
  %86 = sext <2 x i1> %EDCV0x7fffd3a9d13066 to <2 x i64>
  %87 = bitcast <2 x i64> %86 to i128
  %88 = icmp ne i128 %87, 0
  br i1 %88, label %relExit, label %for.end27.split.split

for.end27.split.split:                            ; preds = %for.end27.split
  %89 = load i64* %tv_usec, align 8, !tbaa !8
  %splatS83_D.splatinsert = insertelement <2 x i64> undef, i64 %89, i32 0
  %splatS83_D.splat = shufflevector <2 x i64> %splatS83_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %90 = load i64* %tv_usec9, align 8, !tbaa !8
  %splatS84_D.splatinsert = insertelement <2 x i64> undef, i64 %90, i32 0
  %splatS84_D.splat = shufflevector <2 x i64> %splatS84_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %sub36S85_D = sub <2 x i64> %splatS83_D.splat, %splatS84_D.splat
  %SFS85_D = shufflevector <2 x i64> %sub36S85_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13067 = icmp ne <2 x i64> %sub36S85_D, %SFS85_D
  %91 = sext <2 x i1> %EDCV0x7fffd3a9d13067 to <2 x i64>
  %92 = bitcast <2 x i64> %91 to i128
  %93 = icmp ne i128 %92, 0
  br i1 %93, label %relExit, label %for.end27.split.split.split

for.end27.split.split.split:                      ; preds = %for.end27.split.split
  %conv37S86_D = sitofp <2 x i64> %sub36S85_D to <2 x double>
  %SFS86_D = shufflevector <2 x double> %conv37S86_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13068 = fcmp one <2 x double> %conv37S86_D, %SFS86_D
  %94 = sext <2 x i1> %EDCV0x7fffd3a9d13068 to <2 x i64>
  %95 = bitcast <2 x i64> %94 to i128
  %96 = icmp ne i128 %95, 0
  br i1 %96, label %relExit, label %for.end27.split.split.split.split

for.end27.split.split.split.split:                ; preds = %for.end27.split.split.split
  %div38S87_D = fdiv <2 x double> %conv37S86_D, <double 1.000000e+06, double 1.000000e+06>
  %SFS87_D = shufflevector <2 x double> %div38S87_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13069 = fcmp one <2 x double> %div38S87_D, %SFS87_D
  %97 = sext <2 x i1> %EDCV0x7fffd3a9d13069 to <2 x i64>
  %98 = bitcast <2 x i64> %97 to i128
  %99 = icmp ne i128 %98, 0
  br i1 %99, label %relExit, label %for.end27.split.split.split.split.split

for.end27.split.split.split.split.split:          ; preds = %for.end27.split.split.split.split
  %add39S88_D = fadd <2 x double> %conv33S82_D, %div38S87_D
  %extadd39S88_D = extractelement <2 x double> %add39S88_D, i32 1
  %SFS88_D = shufflevector <2 x double> %add39S88_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13070 = fcmp one <2 x double> %add39S88_D, %SFS88_D
  %100 = sext <2 x i1> %EDCV0x7fffd3a9d13070 to <2 x i64>
  %101 = bitcast <2 x i64> %100 to i128
  %102 = icmp ne i128 %101, 0
  br i1 %102, label %relExit, label %for.end27.split.split.split.split.split.split

for.end27.split.split.split.split.split.split:    ; preds = %for.end27.split.split.split.split.split
  %puts148 = tail call i32 @puts(i8* getelementptr inbounds ([31 x i8]* @str5, i64 0, i64 0))
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %extadd39S88_D) #1
  %sub42S91_D = sub <2 x i64> %splatS78_D.splat, %splatS35_D.splat
  %SFS91_D = shufflevector <2 x i64> %sub42S91_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13071 = icmp ne <2 x i64> %sub42S91_D, %SFS91_D
  %103 = sext <2 x i1> %EDCV0x7fffd3a9d13071 to <2 x i64>
  %104 = bitcast <2 x i64> %103 to i128
  %105 = icmp ne i128 %104, 0
  br i1 %105, label %relExit, label %for.end27.split.split.split.split.split.split.split

for.end27.split.split.split.split.split.split.split: ; preds = %for.end27.split.split.split.split.split.split
  %conv43S92_D = sitofp <2 x i64> %sub42S91_D to <2 x double>
  %SFS92_D = shufflevector <2 x double> %conv43S92_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13072 = fcmp one <2 x double> %conv43S92_D, %SFS92_D
  %106 = sext <2 x i1> %EDCV0x7fffd3a9d13072 to <2 x i64>
  %107 = bitcast <2 x i64> %106 to i128
  %108 = icmp ne i128 %107, 0
  br i1 %108, label %relExit, label %for.end27.split.split.split.split.split.split.split.split

for.end27.split.split.split.split.split.split.split.split: ; preds = %for.end27.split.split.split.split.split.split.split
  %div44S93_D = fdiv <2 x double> %conv43S92_D, <double 1.000000e+06, double 1.000000e+06>
  %extdiv44S93_D = extractelement <2 x double> %div44S93_D, i32 1
  %SFS93_D = shufflevector <2 x double> %div44S93_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13073 = fcmp one <2 x double> %div44S93_D, %SFS93_D
  %109 = sext <2 x i1> %EDCV0x7fffd3a9d13073 to <2 x i64>
  %110 = bitcast <2 x i64> %109 to i128
  %111 = icmp ne i128 %110, 0
  br i1 %111, label %relExit, label %for.end27.split.split.split.split.split.split.split.split.split

for.end27.split.split.split.split.split.split.split.split.split: ; preds = %for.end27.split.split.split.split.split.split.split.split
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %extdiv44S93_D) #1
  %call46 = call i32 @gettimeofday(%struct.timeval* %t0, %struct.timezone* null) #1
  %call47 = tail call i64 @clock() #1
  %splatS96_D.splatinsert = insertelement <2 x i64> undef, i64 %call47, i32 0
  %splatS96_D.splat = shufflevector <2 x i64> %splatS96_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %vector.memcheck27

vector.memcheck27:                                ; preds = %for.inc65.split.split, %for.end27.split.split.split.split.split.split.split.split.split
  %VPhiS98_D = phi <2 x i64> [ zeroinitializer, %for.end27.split.split.split.split.split.split.split.split.split ], [ %indvars.iv.next167S128_D, %for.inc65.split.split ]
  %extractS99_D = extractelement <2 x i64> %VPhiS98_D, i32 1
  %scevgep21 = getelementptr [40 x double]* %dtcdgd, i64 %extractS99_D, i64 39
  %splatscevgep21S104_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep21, i32 0
  %splatscevgep21S104_D.splat = shufflevector <2 x double*> %splatscevgep21S104_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %scevgep19 = getelementptr [40 x double]* %dtcdgd, i64 %extractS99_D, i64 0
  %splatscevgep19S103_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep19, i32 0
  %splatscevgep19S103_D.splat = shufflevector <2 x double*> %splatscevgep19S103_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %scevgep17 = getelementptr [40 x double]* %matrix, i64 %extractS99_D, i64 39
  %splatscevgep17S103_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep17, i32 0
  %splatscevgep17S103_D.splat = shufflevector <2 x double*> %splatscevgep17S103_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %scevgep15 = getelementptr [40 x double]* %matrix, i64 %extractS99_D, i64 0
  %splatscevgep15S104_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep15, i32 0
  %splatscevgep15S104_D.splat = shufflevector <2 x double*> %splatscevgep15S104_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bound124S103_D = icmp ule <2 x double*> %splatscevgep19S103_D.splat, %splatscevgep17S103_D.splat
  %SFS103_D = shufflevector <2 x i1> %bound124S103_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13078 = icmp ne <2 x i1> %bound124S103_D, %SFS103_D
  %112 = bitcast <2 x i1> %EDCV0x7fffd3a9d13078 to i2
  %113 = icmp ne i2 %112, 0
  br i1 %113, label %relExit, label %vector.memcheck27.split

vector.memcheck27.split:                          ; preds = %vector.memcheck27
  %bound023S104_D = icmp ule <2 x double*> %splatscevgep15S104_D.splat, %splatscevgep21S104_D.splat
  %SFS104_D = shufflevector <2 x i1> %bound023S104_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13083 = icmp ne <2 x i1> %bound023S104_D, %SFS104_D
  %114 = bitcast <2 x i1> %EDCV0x7fffd3a9d13083 to i2
  %115 = icmp ne i2 %114, 0
  br i1 %115, label %relExit, label %vector.memcheck27.split.split

vector.memcheck27.split.split:                    ; preds = %vector.memcheck27.split
  %memcheck.conflict26S105_D = and <2 x i1> %bound023S104_D, %bound124S103_D
  %SFS105_D = shufflevector <2 x i1> %memcheck.conflict26S105_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13084 = icmp ne <2 x i1> %memcheck.conflict26S105_D, %SFS105_D
  %116 = bitcast <2 x i1> %EDCV0x7fffd3a9d13084 to i2
  %117 = icmp ne i2 %116, 0
  br i1 %117, label %relExit, label %vector.memcheck27.split.split.split

vector.memcheck27.split.split.split:              ; preds = %vector.memcheck27.split.split
  %sextS106_D = sext <2 x i1> %memcheck.conflict26S105_D to <2 x i64>
  %BCS106_D = bitcast <2 x i64> %sextS106_D to i128
  %mskS106_D = icmp ne i128 %BCS106_D, 0
  br i1 %mskS106_D, label %middle.block12, label %vector.body11

vector.body11:                                    ; preds = %vector.body11.split.split, %vector.memcheck27.split.split.split
  %VPhiS107_D = phi <2 x i64> [ %index.next31S114_D, %vector.body11.split.split ], [ zeroinitializer, %vector.memcheck27.split.split.split ]
  %extractS108_D = extractelement <2 x i64> %VPhiS107_D, i32 1
  %118 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS99_D, i64 %extractS108_D
  %splatS109_D.splatinsert = insertelement <2 x double*> undef, double* %118, i32 0
  %splatS109_D.splat = shufflevector <2 x double*> %splatS109_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS109_D = bitcast <2 x double*> %splatS109_D.splat to <2 x <2 x double>*>
  %extbitcastS109_D = extractelement <2 x <2 x double>*> %bitcastS109_D, i32 1
  %wide.load35 = load <2 x double>* %extbitcastS109_D, align 8
  %shuffleS110_D = shufflevector <2 x double> %wide.load35, <2 x double> %wide.load35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %shuffleS113_D = shufflevector <4 x double> %shuffleS110_D, <4 x double> %shuffleS110_D, <2 x i32> <i32 0, i32 1>
  %119 = getelementptr inbounds [40 x double]* %matrix, i64 %extractS99_D, i64 %extractS108_D
  %splatS112_D.splatinsert = insertelement <2 x double*> undef, double* %119, i32 0
  %splatS112_D.splat = shufflevector <2 x double*> %splatS112_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS112_D = bitcast <2 x double*> %splatS112_D.splat to <2 x <2 x double>*>
  %extbitcastS112_D = extractelement <2 x <2 x double>*> %bitcastS112_D, i32 1
  store <2 x double> %shuffleS113_D, <2 x double>* %extbitcastS112_D, align 8
  %index.next31S114_D = add <2 x i64> %VPhiS107_D, <i64 2, i64 2>
  %SFS114_D = shufflevector <2 x i64> %index.next31S114_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13089 = icmp ne <2 x i64> %index.next31S114_D, %SFS114_D
  %120 = sext <2 x i1> %EDCV0x7fffd3a9d13089 to <2 x i64>
  %121 = bitcast <2 x i64> %120 to i128
  %122 = icmp ne i128 %121, 0
  br i1 %122, label %relExit, label %vector.body11.split

vector.body11.split:                              ; preds = %vector.body11
  %S115_D = icmp eq <2 x i64> %index.next31S114_D, <i64 40, i64 40>
  %SFS115_D = shufflevector <2 x i1> %S115_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13090 = icmp ne <2 x i1> %S115_D, %SFS115_D
  %123 = bitcast <2 x i1> %EDCV0x7fffd3a9d13090 to i2
  %124 = icmp ne i2 %123, 0
  br i1 %124, label %relExit, label %vector.body11.split.split

vector.body11.split.split:                        ; preds = %vector.body11.split
  %sextS116_D = sext <2 x i1> %S115_D to <2 x i64>
  %BCS116_D = bitcast <2 x i64> %sextS116_D to i128
  %mskS116_D = icmp ne i128 %BCS116_D, 0
  br i1 %mskS116_D, label %middle.block12, label %vector.body11, !llvm.loop !9

middle.block12:                                   ; preds = %vector.body11.split.split, %vector.memcheck27.split.split.split
  %VPhiS117_D = phi <2 x i1> [ zeroinitializer, %vector.memcheck27.split.split.split ], [ <i1 true, i1 true>, %vector.body11.split.split ]
  %VPhiS118_D = phi <2 x i64> [ zeroinitializer, %vector.memcheck27.split.split.split ], [ <i64 40, i64 40>, %vector.body11.split.split ]
  %sextS119_D = sext <2 x i1> %VPhiS117_D to <2 x i64>
  %BCS119_D = bitcast <2 x i64> %sextS119_D to i128
  %mskS119_D = icmp ne i128 %BCS119_D, 0
  br i1 %mskS119_D, label %for.inc65, label %for.body55

for.body55:                                       ; preds = %for.body55.split.split, %middle.block12
  %VPhiS120_D = phi <2 x i64> [ %indvars.iv.next163S125_D, %for.body55.split.split ], [ %VPhiS118_D, %middle.block12 ]
  %extractS121_D = extractelement <2 x i64> %VPhiS120_D, i32 1
  %arrayidx57 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS99_D, i64 %extractS121_D
  %125 = load double* %arrayidx57, align 8, !tbaa !1
  %splatS122_D.splatinsert = insertelement <2 x double> undef, double %125, i32 0
  %splatS122_D.splat = shufflevector <2 x double> %splatS122_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %extractS124_D = extractelement <2 x double> %splatS122_D.splat, i32 1
  %arrayidx61 = getelementptr inbounds [40 x double]* %matrix, i64 %extractS99_D, i64 %extractS121_D
  store double %extractS124_D, double* %arrayidx61, align 8
  %indvars.iv.next163S125_D = add <2 x i64> %VPhiS120_D, <i64 1, i64 1>
  %SFS125_D = shufflevector <2 x i64> %indvars.iv.next163S125_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13091 = icmp ne <2 x i64> %indvars.iv.next163S125_D, %SFS125_D
  %126 = sext <2 x i1> %EDCV0x7fffd3a9d13091 to <2 x i64>
  %127 = bitcast <2 x i64> %126 to i128
  %128 = icmp ne i128 %127, 0
  br i1 %128, label %relExit, label %for.body55.split

for.body55.split:                                 ; preds = %for.body55
  %exitcond164S126_D = icmp eq <2 x i64> %indvars.iv.next163S125_D, <i64 40, i64 40>
  %SFS126_D = shufflevector <2 x i1> %exitcond164S126_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13092 = icmp ne <2 x i1> %exitcond164S126_D, %SFS126_D
  %129 = bitcast <2 x i1> %EDCV0x7fffd3a9d13092 to i2
  %130 = icmp ne i2 %129, 0
  br i1 %130, label %relExit, label %for.body55.split.split

for.body55.split.split:                           ; preds = %for.body55.split
  %sextS127_D = sext <2 x i1> %exitcond164S126_D to <2 x i64>
  %BCS127_D = bitcast <2 x i64> %sextS127_D to i128
  %mskS127_D = icmp ne i128 %BCS127_D, 0
  br i1 %mskS127_D, label %for.inc65, label %for.body55, !llvm.loop !12

for.inc65:                                        ; preds = %for.body55.split.split, %middle.block12
  %indvars.iv.next167S128_D = add <2 x i64> %VPhiS98_D, <i64 1, i64 1>
  %SFS128_D = shufflevector <2 x i64> %indvars.iv.next167S128_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13093 = icmp ne <2 x i64> %indvars.iv.next167S128_D, %SFS128_D
  %131 = sext <2 x i1> %EDCV0x7fffd3a9d13093 to <2 x i64>
  %132 = bitcast <2 x i64> %131 to i128
  %133 = icmp ne i128 %132, 0
  br i1 %133, label %relExit, label %for.inc65.split

for.inc65.split:                                  ; preds = %for.inc65
  %exitcond168S129_D = icmp eq <2 x i64> %indvars.iv.next167S128_D, <i64 40, i64 40>
  %SFS129_D = shufflevector <2 x i1> %exitcond168S129_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13094 = icmp ne <2 x i1> %exitcond168S129_D, %SFS129_D
  %134 = bitcast <2 x i1> %EDCV0x7fffd3a9d13094 to i2
  %135 = icmp ne i2 %134, 0
  br i1 %135, label %relExit, label %for.inc65.split.split

for.inc65.split.split:                            ; preds = %for.inc65.split
  %sextS130_D = sext <2 x i1> %exitcond168S129_D to <2 x i64>
  %BCS130_D = bitcast <2 x i64> %sextS130_D to i128
  %mskS130_D = icmp ne i128 %BCS130_D, 0
  br i1 %mskS130_D, label %for.cond72.preheader, label %vector.memcheck27

for.cond72.preheader:                             ; preds = %for.end93.split.split, %for.inc65.split.split
  %VPhiS131_D = phi <2 x i32> [ %inc95S167_D, %for.end93.split.split ], [ zeroinitializer, %for.inc65.split.split ]
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.inc91.split.split, %for.cond72.preheader
  %VPhiS133_D = phi <2 x i64> [ zeroinitializer, %for.cond72.preheader ], [ %indvars.iv.next159S163_D, %for.inc91.split.split ]
  %extractS134_D = extractelement <2 x i64> %VPhiS133_D, i32 1
  %scevgep8 = getelementptr [40 x double]* %matrix, i64 %extractS134_D, i64 39
  %splatscevgep8S139_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep8, i32 0
  %splatscevgep8S139_D.splat = shufflevector <2 x double*> %splatscevgep8S139_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %scevgep6 = getelementptr [40 x double]* %matrix, i64 %extractS134_D, i64 0
  %splatscevgep6S138_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep6, i32 0
  %splatscevgep6S138_D.splat = shufflevector <2 x double*> %splatscevgep6S138_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %scevgep4 = getelementptr [40 x double]* %dtcdgd, i64 %extractS134_D, i64 39
  %splatscevgep4S138_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep4, i32 0
  %splatscevgep4S138_D.splat = shufflevector <2 x double*> %splatscevgep4S138_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %scevgep = getelementptr [40 x double]* %dtcdgd, i64 %extractS134_D, i64 0
  %splatscevgepS139_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep, i32 0
  %splatscevgepS139_D.splat = shufflevector <2 x double*> %splatscevgepS139_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bound1S138_D = icmp ule <2 x double*> %splatscevgep6S138_D.splat, %splatscevgep4S138_D.splat
  %SFS138_D = shufflevector <2 x i1> %bound1S138_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13099 = icmp ne <2 x i1> %bound1S138_D, %SFS138_D
  %136 = bitcast <2 x i1> %EDCV0x7fffd3a9d13099 to i2
  %137 = icmp ne i2 %136, 0
  br i1 %137, label %relExit, label %vector.memcheck.split

vector.memcheck.split:                            ; preds = %vector.memcheck
  %bound0S139_D = icmp ule <2 x double*> %splatscevgepS139_D.splat, %splatscevgep8S139_D.splat
  %SFS139_D = shufflevector <2 x i1> %bound0S139_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130104 = icmp ne <2 x i1> %bound0S139_D, %SFS139_D
  %138 = bitcast <2 x i1> %EDCV0x7fffd3a9d130104 to i2
  %139 = icmp ne i2 %138, 0
  br i1 %139, label %relExit, label %vector.memcheck.split.split

vector.memcheck.split.split:                      ; preds = %vector.memcheck.split
  %memcheck.conflictS140_D = and <2 x i1> %bound0S139_D, %bound1S138_D
  %SFS140_D = shufflevector <2 x i1> %memcheck.conflictS140_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130105 = icmp ne <2 x i1> %memcheck.conflictS140_D, %SFS140_D
  %140 = bitcast <2 x i1> %EDCV0x7fffd3a9d130105 to i2
  %141 = icmp ne i2 %140, 0
  br i1 %141, label %relExit, label %vector.memcheck.split.split.split

vector.memcheck.split.split.split:                ; preds = %vector.memcheck.split.split
  %sextS141_D = sext <2 x i1> %memcheck.conflictS140_D to <2 x i64>
  %BCS141_D = bitcast <2 x i64> %sextS141_D to i128
  %mskS141_D = icmp ne i128 %BCS141_D, 0
  br i1 %mskS141_D, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body.split.split, %vector.memcheck.split.split.split
  %VPhiS142_D = phi <2 x i64> [ %index.nextS149_D, %vector.body.split.split ], [ zeroinitializer, %vector.memcheck.split.split.split ]
  %extractS143_D = extractelement <2 x i64> %VPhiS142_D, i32 1
  %142 = getelementptr inbounds [40 x double]* %matrix, i64 %extractS134_D, i64 %extractS143_D
  %splatS144_D.splatinsert = insertelement <2 x double*> undef, double* %142, i32 0
  %splatS144_D.splat = shufflevector <2 x double*> %splatS144_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS144_D = bitcast <2 x double*> %splatS144_D.splat to <2 x <2 x double>*>
  %extbitcastS144_D = extractelement <2 x <2 x double>*> %bitcastS144_D, i32 1
  %wide.load = load <2 x double>* %extbitcastS144_D, align 8
  %shuffleS145_D = shufflevector <2 x double> %wide.load, <2 x double> %wide.load, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %shuffleS148_D = shufflevector <4 x double> %shuffleS145_D, <4 x double> %shuffleS145_D, <2 x i32> <i32 0, i32 1>
  %143 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS134_D, i64 %extractS143_D
  %splatS147_D.splatinsert = insertelement <2 x double*> undef, double* %143, i32 0
  %splatS147_D.splat = shufflevector <2 x double*> %splatS147_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS147_D = bitcast <2 x double*> %splatS147_D.splat to <2 x <2 x double>*>
  %extbitcastS147_D = extractelement <2 x <2 x double>*> %bitcastS147_D, i32 1
  store <2 x double> %shuffleS148_D, <2 x double>* %extbitcastS147_D, align 8
  %index.nextS149_D = add <2 x i64> %VPhiS142_D, <i64 2, i64 2>
  %SFS149_D = shufflevector <2 x i64> %index.nextS149_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130110 = icmp ne <2 x i64> %index.nextS149_D, %SFS149_D
  %144 = sext <2 x i1> %EDCV0x7fffd3a9d130110 to <2 x i64>
  %145 = bitcast <2 x i64> %144 to i128
  %146 = icmp ne i128 %145, 0
  br i1 %146, label %relExit, label %vector.body.split

vector.body.split:                                ; preds = %vector.body
  %S150_D = icmp eq <2 x i64> %index.nextS149_D, <i64 40, i64 40>
  %SFS150_D = shufflevector <2 x i1> %S150_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130111 = icmp ne <2 x i1> %S150_D, %SFS150_D
  %147 = bitcast <2 x i1> %EDCV0x7fffd3a9d130111 to i2
  %148 = icmp ne i2 %147, 0
  br i1 %148, label %relExit, label %vector.body.split.split

vector.body.split.split:                          ; preds = %vector.body.split
  %sextS151_D = sext <2 x i1> %S150_D to <2 x i64>
  %BCS151_D = bitcast <2 x i64> %sextS151_D to i128
  %mskS151_D = icmp ne i128 %BCS151_D, 0
  br i1 %mskS151_D, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body.split.split, %vector.memcheck.split.split.split
  %VPhiS152_D = phi <2 x i1> [ zeroinitializer, %vector.memcheck.split.split.split ], [ <i1 true, i1 true>, %vector.body.split.split ]
  %VPhiS153_D = phi <2 x i64> [ zeroinitializer, %vector.memcheck.split.split.split ], [ <i64 40, i64 40>, %vector.body.split.split ]
  %sextS154_D = sext <2 x i1> %VPhiS152_D to <2 x i64>
  %BCS154_D = bitcast <2 x i64> %sextS154_D to i128
  %mskS154_D = icmp ne i128 %BCS154_D, 0
  br i1 %mskS154_D, label %for.inc91, label %for.body79

for.body79:                                       ; preds = %for.body79.split.split, %middle.block
  %VPhiS155_D = phi <2 x i64> [ %indvars.iv.nextS160_D, %for.body79.split.split ], [ %VPhiS153_D, %middle.block ]
  %extractS156_D = extractelement <2 x i64> %VPhiS155_D, i32 1
  %arrayidx83 = getelementptr inbounds [40 x double]* %matrix, i64 %extractS134_D, i64 %extractS156_D
  %149 = load double* %arrayidx83, align 8, !tbaa !1
  %splatS157_D.splatinsert = insertelement <2 x double> undef, double %149, i32 0
  %splatS157_D.splat = shufflevector <2 x double> %splatS157_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %extractS159_D = extractelement <2 x double> %splatS157_D.splat, i32 1
  %arrayidx87 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS134_D, i64 %extractS156_D
  store double %extractS159_D, double* %arrayidx87, align 8
  %indvars.iv.nextS160_D = add <2 x i64> %VPhiS155_D, <i64 1, i64 1>
  %SFS160_D = shufflevector <2 x i64> %indvars.iv.nextS160_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130112 = icmp ne <2 x i64> %indvars.iv.nextS160_D, %SFS160_D
  %150 = sext <2 x i1> %EDCV0x7fffd3a9d130112 to <2 x i64>
  %151 = bitcast <2 x i64> %150 to i128
  %152 = icmp ne i128 %151, 0
  br i1 %152, label %relExit, label %for.body79.split

for.body79.split:                                 ; preds = %for.body79
  %exitcondS161_D = icmp eq <2 x i64> %indvars.iv.nextS160_D, <i64 40, i64 40>
  %SFS161_D = shufflevector <2 x i1> %exitcondS161_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130113 = icmp ne <2 x i1> %exitcondS161_D, %SFS161_D
  %153 = bitcast <2 x i1> %EDCV0x7fffd3a9d130113 to i2
  %154 = icmp ne i2 %153, 0
  br i1 %154, label %relExit, label %for.body79.split.split

for.body79.split.split:                           ; preds = %for.body79.split
  %sextS162_D = sext <2 x i1> %exitcondS161_D to <2 x i64>
  %BCS162_D = bitcast <2 x i64> %sextS162_D to i128
  %mskS162_D = icmp ne i128 %BCS162_D, 0
  br i1 %mskS162_D, label %for.inc91, label %for.body79, !llvm.loop !14

for.inc91:                                        ; preds = %for.body79.split.split, %middle.block
  %indvars.iv.next159S163_D = add <2 x i64> %VPhiS133_D, <i64 1, i64 1>
  %SFS163_D = shufflevector <2 x i64> %indvars.iv.next159S163_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130114 = icmp ne <2 x i64> %indvars.iv.next159S163_D, %SFS163_D
  %155 = sext <2 x i1> %EDCV0x7fffd3a9d130114 to <2 x i64>
  %156 = bitcast <2 x i64> %155 to i128
  %157 = icmp ne i128 %156, 0
  br i1 %157, label %relExit, label %for.inc91.split

for.inc91.split:                                  ; preds = %for.inc91
  %exitcond160S164_D = icmp eq <2 x i64> %indvars.iv.next159S163_D, <i64 40, i64 40>
  %SFS164_D = shufflevector <2 x i1> %exitcond160S164_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130115 = icmp ne <2 x i1> %exitcond160S164_D, %SFS164_D
  %158 = bitcast <2 x i1> %EDCV0x7fffd3a9d130115 to i2
  %159 = icmp ne i2 %158, 0
  br i1 %159, label %relExit, label %for.inc91.split.split

for.inc91.split.split:                            ; preds = %for.inc91.split
  %sextS165_D = sext <2 x i1> %exitcond160S164_D to <2 x i64>
  %BCS165_D = bitcast <2 x i64> %sextS165_D to i128
  %mskS165_D = icmp ne i128 %BCS165_D, 0
  br i1 %mskS165_D, label %for.end93, label %vector.memcheck

for.end93:                                        ; preds = %for.inc91.split.split
  tail call void @Crystal_Cholesky(i32 40, [40 x double]* %dtcdgd, double* %tau, double* %rhs) #1
  %inc95S167_D = add <2 x i32> %VPhiS131_D, <i32 1, i32 1>
  %SFS167_D = shufflevector <2 x i32> %inc95S167_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130116 = icmp ne <2 x i32> %inc95S167_D, %SFS167_D
  %160 = sext <2 x i1> %EDCV0x7fffd3a9d130116 to <2 x i32>
  %161 = bitcast <2 x i32> %160 to i64
  %162 = icmp ne i64 %161, 0
  br i1 %162, label %relExit, label %for.end93.split

for.end93.split:                                  ; preds = %for.end93
  %exitcond161S168_D = icmp eq <2 x i32> %inc95S167_D, <i32 1000000, i32 1000000>
  %SFS168_D = shufflevector <2 x i1> %exitcond161S168_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130117 = icmp ne <2 x i1> %exitcond161S168_D, %SFS168_D
  %163 = bitcast <2 x i1> %EDCV0x7fffd3a9d130117 to i2
  %164 = icmp ne i2 %163, 0
  br i1 %164, label %relExit, label %for.end93.split.split

for.end93.split.split:                            ; preds = %for.end93.split
  %sextS169_D = sext <2 x i1> %exitcond161S168_D to <2 x i64>
  %BCS169_D = bitcast <2 x i64> %sextS169_D to i128
  %mskS169_D = icmp ne i128 %BCS169_D, 0
  br i1 %mskS169_D, label %for.end96, label %for.cond72.preheader

for.end96:                                        ; preds = %for.end93.split.split
  %call97 = call i32 @gettimeofday(%struct.timeval* %t1, %struct.timezone* null) #1
  %call98 = tail call i64 @clock() #1
  %splatS171_D.splatinsert = insertelement <2 x i64> undef, i64 %call98, i32 0
  %splatS171_D.splat = shufflevector <2 x i64> %splatS171_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %165 = load i64* %tv_sec, align 8, !tbaa !5
  %splatS172_D.splatinsert = insertelement <2 x i64> undef, i64 %165, i32 0
  %splatS172_D.splat = shufflevector <2 x i64> %splatS172_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %166 = load i64* %tv_sec8, align 8, !tbaa !5
  %splatS173_D.splatinsert = insertelement <2 x i64> undef, i64 %166, i32 0
  %splatS173_D.splat = shufflevector <2 x i64> %splatS173_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %sub101S174_D = sub <2 x i64> %splatS172_D.splat, %splatS173_D.splat
  %SFS174_D = shufflevector <2 x i64> %sub101S174_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130118 = icmp ne <2 x i64> %sub101S174_D, %SFS174_D
  %167 = sext <2 x i1> %EDCV0x7fffd3a9d130118 to <2 x i64>
  %168 = bitcast <2 x i64> %167 to i128
  %169 = icmp ne i128 %168, 0
  br i1 %169, label %relExit, label %for.end96.split128

for.end96.split128:                               ; preds = %for.end96
  %conv102S175_D = sitofp <2 x i64> %sub101S174_D to <2 x double>
  %SFS175_D = shufflevector <2 x double> %conv102S175_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130119 = fcmp one <2 x double> %conv102S175_D, %SFS175_D
  %170 = sext <2 x i1> %EDCV0x7fffd3a9d130119 to <2 x i64>
  %171 = bitcast <2 x i64> %170 to i128
  %172 = icmp ne i128 %171, 0
  br i1 %172, label %relExit, label %for.end96.split128.split

for.end96.split128.split:                         ; preds = %for.end96.split128
  %173 = load i64* %tv_usec, align 8, !tbaa !8
  %splatS176_D.splatinsert = insertelement <2 x i64> undef, i64 %173, i32 0
  %splatS176_D.splat = shufflevector <2 x i64> %splatS176_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %174 = load i64* %tv_usec9, align 8, !tbaa !8
  %splatS177_D.splatinsert = insertelement <2 x i64> undef, i64 %174, i32 0
  %splatS177_D.splat = shufflevector <2 x i64> %splatS177_D.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %sub105S178_D = sub <2 x i64> %splatS176_D.splat, %splatS177_D.splat
  %SFS178_D = shufflevector <2 x i64> %sub105S178_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130120 = icmp ne <2 x i64> %sub105S178_D, %SFS178_D
  %175 = sext <2 x i1> %EDCV0x7fffd3a9d130120 to <2 x i64>
  %176 = bitcast <2 x i64> %175 to i128
  %177 = icmp ne i128 %176, 0
  br i1 %177, label %relExit, label %for.end96.split128.split.split

for.end96.split128.split.split:                   ; preds = %for.end96.split128.split
  %conv106S179_D = sitofp <2 x i64> %sub105S178_D to <2 x double>
  %SFS179_D = shufflevector <2 x double> %conv106S179_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130121 = fcmp one <2 x double> %conv106S179_D, %SFS179_D
  %178 = sext <2 x i1> %EDCV0x7fffd3a9d130121 to <2 x i64>
  %179 = bitcast <2 x i64> %178 to i128
  %180 = icmp ne i128 %179, 0
  br i1 %180, label %relExit, label %for.end96.split128.split.split.split

for.end96.split128.split.split.split:             ; preds = %for.end96.split128.split.split
  %div107S180_D = fdiv <2 x double> %conv106S179_D, <double 1.000000e+06, double 1.000000e+06>
  %SFS180_D = shufflevector <2 x double> %div107S180_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130122 = fcmp one <2 x double> %div107S180_D, %SFS180_D
  %181 = sext <2 x i1> %EDCV0x7fffd3a9d130122 to <2 x i64>
  %182 = bitcast <2 x i64> %181 to i128
  %183 = icmp ne i128 %182, 0
  br i1 %183, label %relExit, label %for.end96.split

for.end96.split:                                  ; preds = %for.end96.split128.split.split.split
  %add108S181_D = fadd <2 x double> %conv102S175_D, %div107S180_D
  %extadd108S181_D = extractelement <2 x double> %add108S181_D, i32 1
  %SFS181_D = shufflevector <2 x double> %add108S181_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130123 = fcmp one <2 x double> %add108S181_D, %SFS181_D
  %184 = sext <2 x i1> %EDCV0x7fffd3a9d130123 to <2 x i64>
  %185 = bitcast <2 x i64> %184 to i128
  %186 = icmp ne i128 %185, 0
  br i1 %186, label %relExit, label %for.end96.split.split129

for.end96.split.split129:                         ; preds = %for.end96.split
  %puts149 = tail call i32 @puts(i8* getelementptr inbounds ([36 x i8]* @str65, i64 0, i64 0))
  %call110 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), double %extadd108S181_D) #1
  %sub111S184_D = sub <2 x i64> %splatS171_D.splat, %splatS96_D.splat
  %SFS184_D = shufflevector <2 x i64> %sub111S184_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130124 = icmp ne <2 x i64> %sub111S184_D, %SFS184_D
  %187 = sext <2 x i1> %EDCV0x7fffd3a9d130124 to <2 x i64>
  %188 = bitcast <2 x i64> %187 to i128
  %189 = icmp ne i128 %188, 0
  br i1 %189, label %relExit, label %for.end96.split.split129.split

for.end96.split.split129.split:                   ; preds = %for.end96.split.split129
  %conv112S185_D = sitofp <2 x i64> %sub111S184_D to <2 x double>
  %SFS185_D = shufflevector <2 x double> %conv112S185_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130125 = fcmp one <2 x double> %conv112S185_D, %SFS185_D
  %190 = sext <2 x i1> %EDCV0x7fffd3a9d130125 to <2 x i64>
  %191 = bitcast <2 x i64> %190 to i128
  %192 = icmp ne i128 %191, 0
  br i1 %192, label %relExit, label %for.end96.split.split129.split.split

for.end96.split.split129.split.split:             ; preds = %for.end96.split.split129.split
  %div113S186_D = fdiv <2 x double> %conv112S185_D, <double 1.000000e+06, double 1.000000e+06>
  %extdiv113S186_D = extractelement <2 x double> %div113S186_D, i32 1
  %SFS186_D = shufflevector <2 x double> %div113S186_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130126 = fcmp one <2 x double> %div113S186_D, %SFS186_D
  %193 = sext <2 x i1> %EDCV0x7fffd3a9d130126 to <2 x i64>
  %194 = bitcast <2 x i64> %193 to i128
  %195 = icmp ne i128 %194, 0
  br i1 %195, label %relExit, label %for.end96.split.split

for.end96.split.split:                            ; preds = %for.end96.split.split129.split.split
  %call114 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), double %extdiv113S186_D) #1
  %extractS188_D = extractelement <2 x double> %splatS71_D.splat, i32 1
  ret double %extractS188_D

relExit:                                          ; preds = %for.end96.split.split129.split.split, %for.end96.split.split129.split, %for.end96.split.split129, %for.end96.split, %for.end96.split128.split.split.split, %for.end96.split128.split.split, %for.end96.split128.split, %for.end96.split128, %for.end96, %for.end93.split, %for.end93, %for.inc91.split, %for.inc91, %for.body79.split, %for.body79, %vector.body.split, %vector.body, %vector.memcheck.split.split, %vector.memcheck.split, %vector.memcheck, %for.inc65.split, %for.inc65, %for.body55.split, %for.body55, %vector.body11.split, %vector.body11, %vector.memcheck27.split.split, %vector.memcheck27.split, %vector.memcheck27, %for.end27.split.split.split.split.split.split.split.split, %for.end27.split.split.split.split.split.split.split, %for.end27.split.split.split.split.split.split, %for.end27.split.split.split.split.split, %for.end27.split.split.split.split, %for.end27.split.split.split, %for.end27.split.split, %for.end27.split, %for.end27, %Crystal_pow.exit.split, %Crystal_pow.exit, %for.body9.i.split.split.split.split.split.split, %for.body9.i.split.split.split.split.split, %for.body9.i.split.split.split.split, %for.body9.i.split.split.split, %for.body9.i.split.split, %for.body9.i.split, %for.body9.i, %for.body.i.split.split.split.split.split, %for.body.i.split.split.split.split, %for.body.i.split.split.split, %for.body.i.split.split, %for.body.i.split, %for.body.i, %for.end.split.split.split, %for.end.split.split, %for.end.split, %for.end.split127.split.split.split.split, %for.end.split127.split.split.split, %for.end.split127.split.split, %for.end.split127.split, %for.end.split127, %for.end, %for.body.split, %for.body
  %196 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @relFun, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @func2, i32 0, i32 0))
  call void @exit(i32 1)
  ret double 0.000000e+00
}

; Function Attrs: nounwind uwtable
define void @Crystal_div(i32 %nSlip, double %deltaTime, double* nocapture readonly %slipRate, double* nocapture readonly %dSlipRate, double* nocapture %tau, double* nocapture readonly %tauc, double* nocapture %rhs, [40 x double]* nocapture %dtcdgd, [40 x double]* nocapture readonly %dtdg, [40 x double]* nocapture %matrix) #0 {
entry:
  %splatS48_D.splatinsert = insertelement <2 x double> undef, double %deltaTime, i32 0
  %splatS48_D.splat = shufflevector <2 x double> %splatS48_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %splatS9_D.splatinsert = insertelement <2 x i32> undef, i32 %nSlip, i32 0
  %splatS9_D.splat = shufflevector <2 x i32> %splatS9_D.splatinsert, <2 x i32> undef, <2 x i32> zeroinitializer
  %bor_array = alloca [40 x double], align 16
  %splatbor_arrayS3_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %bor_array, i32 0
  %splatbor_arrayS3_D.splat = shufflevector <2 x [40 x double]*> %splatbor_arrayS3_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %sgn = alloca [40 x double], align 16
  %splatsgnS5_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %sgn, i32 0
  %splatsgnS5_D.splat = shufflevector <2 x [40 x double]*> %splatsgnS5_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %rateFact = alloca [40 x double], align 16
  %splatrateFactS7_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %rateFact, i32 0
  %splatrateFactS7_D.splat = shufflevector <2 x [40 x double]*> %splatrateFactS7_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %bitcastS3_D = bitcast <2 x [40 x double]*> %splatbor_arrayS3_D.splat to <2 x i8*>
  %bitcastS5_D = bitcast <2 x [40 x double]*> %splatsgnS5_D.splat to <2 x i8*>
  %bitcastS7_D = bitcast <2 x [40 x double]*> %splatrateFactS7_D.splat to <2 x i8*>
  %cmp183S9_D = icmp sgt <2 x i32> %splatS9_D.splat, zeroinitializer
  %SFS9_D = shufflevector <2 x i1> %cmp183S9_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130 = icmp ne <2 x i1> %cmp183S9_D, %SFS9_D
  %0 = bitcast <2 x i1> %EDCV0x7fffd3a9d130 to i2
  %1 = icmp ne i2 %0, 0
  br i1 %1, label %relExit, label %entry.split

entry.split:                                      ; preds = %entry
  %sextS10_D = sext <2 x i1> %cmp183S9_D to <2 x i64>
  %BCS10_D = bitcast <2 x i64> %sextS10_D to i128
  %mskS10_D = icmp ne i128 %BCS10_D, 0
  br i1 %mskS10_D, label %for.body.lr.ph, label %for.end104

for.body.lr.ph:                                   ; preds = %entry.split
  %S11_D = sext <2 x i32> %splatS9_D.splat to <2 x i64>
  %SFS11_D = shufflevector <2 x i64> %S11_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13033 = icmp ne <2 x i64> %S11_D, %SFS11_D
  %2 = sext <2 x i1> %EDCV0x7fffd3a9d13033 to <2 x i64>
  %3 = bitcast <2 x i64> %2 to i128
  %4 = icmp ne i128 %3, 0
  br i1 %4, label %relExit, label %for.body.lr.ph.split

for.body.lr.ph.split:                             ; preds = %for.body.lr.ph
  br label %for.body

for.body:                                         ; preds = %for.body.split.split.split.split, %for.body.lr.ph.split
  %VPhiS13_D = phi <2 x i64> [ zeroinitializer, %for.body.lr.ph.split ], [ %incS22_D, %for.body.split.split.split.split ]
  %extractS14_D = extractelement <2 x i64> %VPhiS13_D, i32 1
  %arrayidx = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %extractS14_D
  store double 1.000000e+00, double* %arrayidx, align 8, !tbaa !1
  %conv2S16_D = sitofp <2 x i64> %VPhiS13_D to <2 x double>
  %SFS16_D = shufflevector <2 x double> %conv2S16_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13034 = fcmp one <2 x double> %conv2S16_D, %SFS16_D
  %5 = sext <2 x i1> %EDCV0x7fffd3a9d13034 to <2 x i64>
  %6 = bitcast <2 x i64> %5 to i128
  %7 = icmp ne i128 %6, 0
  br i1 %7, label %relExit, label %for.body.split119

for.body.split119:                                ; preds = %for.body
  %mulS17_D = fmul <2 x double> %conv2S16_D, <double 2.000000e-01, double 2.000000e-01>
  %SFS17_D = shufflevector <2 x double> %mulS17_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13035 = fcmp one <2 x double> %mulS17_D, %SFS17_D
  %8 = sext <2 x i1> %EDCV0x7fffd3a9d13035 to <2 x i64>
  %9 = bitcast <2 x i64> %8 to i128
  %10 = icmp ne i128 %9, 0
  br i1 %10, label %relExit, label %for.body.split119.split

for.body.split119.split:                          ; preds = %for.body.split119
  %divS18_D = fdiv <2 x double> %mulS17_D, <double 4.000000e+01, double 4.000000e+01>
  %SFS18_D = shufflevector <2 x double> %divS18_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13036 = fcmp one <2 x double> %divS18_D, %SFS18_D
  %11 = sext <2 x i1> %EDCV0x7fffd3a9d13036 to <2 x i64>
  %12 = bitcast <2 x i64> %11 to i128
  %13 = icmp ne i128 %12, 0
  br i1 %13, label %relExit, label %for.body.split

for.body.split:                                   ; preds = %for.body.split119.split
  %addS19_D = fadd <2 x double> %divS18_D, <double 9.000000e-01, double 9.000000e-01>
  %extractS21_D = extractelement <2 x double> %addS19_D, i32 1
  %SFS19_D = shufflevector <2 x double> %addS19_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13037 = fcmp one <2 x double> %addS19_D, %SFS19_D
  %14 = sext <2 x i1> %EDCV0x7fffd3a9d13037 to <2 x i64>
  %15 = bitcast <2 x i64> %14 to i128
  %16 = icmp ne i128 %15, 0
  br i1 %16, label %relExit, label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %arrayidx3 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %extractS14_D
  store double %extractS21_D, double* %arrayidx3, align 8
  %incS22_D = add <2 x i64> %VPhiS13_D, <i64 1, i64 1>
  %SFS22_D = shufflevector <2 x i64> %incS22_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13038 = icmp ne <2 x i64> %incS22_D, %SFS22_D
  %17 = sext <2 x i1> %EDCV0x7fffd3a9d13038 to <2 x i64>
  %18 = bitcast <2 x i64> %17 to i128
  %19 = icmp ne i128 %18, 0
  br i1 %19, label %relExit, label %for.body.split.split.split

for.body.split.split.split:                       ; preds = %for.body.split.split
  %exitcond188S23_D = icmp eq <2 x i64> %incS22_D, %S11_D
  %SFS23_D = shufflevector <2 x i1> %exitcond188S23_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13039 = icmp ne <2 x i1> %exitcond188S23_D, %SFS23_D
  %20 = bitcast <2 x i1> %EDCV0x7fffd3a9d13039 to i2
  %21 = icmp ne i2 %20, 0
  br i1 %21, label %relExit, label %for.body.split.split.split.split

for.body.split.split.split.split:                 ; preds = %for.body.split.split.split
  %sextS24_D = sext <2 x i1> %exitcond188S23_D to <2 x i64>
  %BCS24_D = bitcast <2 x i64> %sextS24_D to i128
  %mskS24_D = icmp ne i128 %BCS24_D, 0
  br i1 %mskS24_D, label %for.body8.preheader, label %for.body

for.body8.preheader:                              ; preds = %for.body.split.split.split.split
  %S25_D = sext <2 x i32> %splatS9_D.splat to <2 x i64>
  %SFS25_D = shufflevector <2 x i64> %S25_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13040 = icmp ne <2 x i64> %S25_D, %SFS25_D
  %22 = sext <2 x i1> %EDCV0x7fffd3a9d13040 to <2 x i64>
  %23 = bitcast <2 x i64> %22 to i128
  %24 = icmp ne i128 %23, 0
  br i1 %24, label %relExit, label %for.body8.preheader.split

for.body8.preheader.split:                        ; preds = %for.body8.preheader
  %n.vec13S26_D = and <2 x i64> %S25_D, <i64 -2, i64 -2>
  %SFS26_D = shufflevector <2 x i64> %n.vec13S26_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13041 = icmp ne <2 x i64> %n.vec13S26_D, %SFS26_D
  %25 = sext <2 x i1> %EDCV0x7fffd3a9d13041 to <2 x i64>
  %26 = bitcast <2 x i64> %25 to i128
  %27 = icmp ne i128 %26, 0
  br i1 %27, label %relExit, label %for.body8.preheader.split.split

for.body8.preheader.split.split:                  ; preds = %for.body8.preheader.split
  %cmp.zero15S27_D = icmp eq <2 x i64> %n.vec13S26_D, zeroinitializer
  %SFS27_D = shufflevector <2 x i1> %cmp.zero15S27_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13042 = icmp ne <2 x i1> %cmp.zero15S27_D, %SFS27_D
  %28 = bitcast <2 x i1> %EDCV0x7fffd3a9d13042 to i2
  %29 = icmp ne i2 %28, 0
  br i1 %29, label %relExit, label %for.body8.preheader.split.split.split

for.body8.preheader.split.split.split:            ; preds = %for.body8.preheader.split.split
  %sextS28_D = sext <2 x i1> %cmp.zero15S27_D to <2 x i64>
  %BCS28_D = bitcast <2 x i64> %sextS28_D to i128
  %mskS28_D = icmp ne i128 %BCS28_D, 0
  br i1 %mskS28_D, label %middle.block8, label %vector.body7

vector.body7:                                     ; preds = %vector.body7.split.split, %for.body8.preheader.split.split.split
  %VPhiS29_D = phi <2 x i64> [ %index.next19S42_D, %vector.body7.split.split ], [ zeroinitializer, %for.body8.preheader.split.split.split ]
  %extractS30_D = extractelement <2 x i64> %VPhiS29_D, i32 1
  %30 = getelementptr inbounds double* %slipRate, i64 %extractS30_D
  %splatS31_D.splatinsert = insertelement <2 x double*> undef, double* %30, i32 0
  %splatS31_D.splat = shufflevector <2 x double*> %splatS31_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS31_D = bitcast <2 x double*> %splatS31_D.splat to <2 x <2 x double>*>
  %extbitcastS31_D = extractelement <2 x <2 x double>*> %bitcastS31_D, i32 1
  %wide.load = load <2 x double>* %extbitcastS31_D, align 8
  %shuffleS32_D = shufflevector <2 x double> %wide.load, <2 x double> %wide.load, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %31 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %extractS30_D
  %splatS34_D.splatinsert = insertelement <2 x double*> undef, double* %31, i32 0
  %splatS34_D.splat = shufflevector <2 x double*> %splatS34_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS34_D = bitcast <2 x double*> %splatS34_D.splat to <2 x <2 x double>*>
  %extbitcastS34_D = extractelement <2 x <2 x double>*> %bitcastS34_D, i32 1
  %wide.load23 = load <2 x double>* %extbitcastS34_D, align 16
  %shuffleS35_D = shufflevector <2 x double> %wide.load23, <2 x double> %wide.load23, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %S36_D = fmul <4 x double> %shuffleS32_D, %shuffleS35_D
  %SFS36_D = shufflevector <4 x double> %S36_D, <4 x double> undef, <4 x i32> <i32 2, i32 3, i32 0, i32 1>
  %EDCV0x7fffd3a9d13047 = fcmp one <4 x double> %S36_D, %SFS36_D
  %32 = sext <4 x i1> %EDCV0x7fffd3a9d13047 to <4 x i64>
  %33 = bitcast <4 x i64> %32 to i256
  %34 = icmp ne i256 %33, 0
  br i1 %34, label %relExit, label %vector.body7.split120

vector.body7.split120:                            ; preds = %vector.body7
  %S37_D = fadd <4 x double> %S36_D, <double 1.000000e-06, double 1.000000e-06, double 1.000000e-06, double 1.000000e-06>
  %SFS37_D = shufflevector <4 x double> %S37_D, <4 x double> undef, <4 x i32> <i32 2, i32 3, i32 0, i32 1>
  %EDCV0x7fffd3a9d13048 = fcmp one <4 x double> %S37_D, %SFS37_D
  %35 = sext <4 x i1> %EDCV0x7fffd3a9d13048 to <4 x i64>
  %36 = bitcast <4 x i64> %35 to i256
  %37 = icmp ne i256 %36, 0
  br i1 %37, label %relExit, label %vector.body7.split120.split

vector.body7.split120.split:                      ; preds = %vector.body7.split120
  %S38_D = fdiv <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %S37_D
  %shuffleS41_D = shufflevector <4 x double> %S38_D, <4 x double> %S38_D, <2 x i32> <i32 0, i32 1>
  %SFS38_D = shufflevector <4 x double> %S38_D, <4 x double> undef, <4 x i32> <i32 2, i32 3, i32 0, i32 1>
  %EDCV0x7fffd3a9d13049 = fcmp one <4 x double> %S38_D, %SFS38_D
  %38 = sext <4 x i1> %EDCV0x7fffd3a9d13049 to <4 x i64>
  %39 = bitcast <4 x i64> %38 to i256
  %40 = icmp ne i256 %39, 0
  br i1 %40, label %relExit, label %vector.body7.split120.split.split

vector.body7.split120.split.split:                ; preds = %vector.body7.split120.split
  %41 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %extractS30_D
  %splatS40_D.splatinsert = insertelement <2 x double*> undef, double* %41, i32 0
  %splatS40_D.splat = shufflevector <2 x double*> %splatS40_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS40_D = bitcast <2 x double*> %splatS40_D.splat to <2 x <2 x double>*>
  %extbitcastS40_D = extractelement <2 x <2 x double>*> %bitcastS40_D, i32 1
  store <2 x double> %shuffleS41_D, <2 x double>* %extbitcastS40_D, align 16
  %index.next19S42_D = add <2 x i64> %VPhiS29_D, <i64 2, i64 2>
  %SFS42_D = shufflevector <2 x i64> %index.next19S42_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13052 = icmp ne <2 x i64> %index.next19S42_D, %SFS42_D
  %42 = sext <2 x i1> %EDCV0x7fffd3a9d13052 to <2 x i64>
  %43 = bitcast <2 x i64> %42 to i128
  %44 = icmp ne i128 %43, 0
  br i1 %44, label %relExit, label %vector.body7.split

vector.body7.split:                               ; preds = %vector.body7.split120.split.split
  %S43_D = icmp eq <2 x i64> %index.next19S42_D, %n.vec13S26_D
  %SFS43_D = shufflevector <2 x i1> %S43_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13053 = icmp ne <2 x i1> %S43_D, %SFS43_D
  %45 = bitcast <2 x i1> %EDCV0x7fffd3a9d13053 to i2
  %46 = icmp ne i2 %45, 0
  br i1 %46, label %relExit, label %vector.body7.split.split

vector.body7.split.split:                         ; preds = %vector.body7.split
  %sextS44_D = sext <2 x i1> %S43_D to <2 x i64>
  %BCS44_D = bitcast <2 x i64> %sextS44_D to i128
  %mskS44_D = icmp ne i128 %BCS44_D, 0
  br i1 %mskS44_D, label %middle.block8, label %vector.body7, !llvm.loop !15

middle.block8:                                    ; preds = %vector.body7.split.split, %for.body8.preheader.split.split.split
  %VPhiS45_D = phi <2 x i64> [ zeroinitializer, %for.body8.preheader.split.split.split ], [ %n.vec13S26_D, %vector.body7.split.split ]
  %cmp.n18S46_D = icmp eq <2 x i64> %S25_D, %VPhiS45_D
  %SFS46_D = shufflevector <2 x i1> %cmp.n18S46_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13054 = icmp ne <2 x i1> %cmp.n18S46_D, %SFS46_D
  %47 = bitcast <2 x i1> %EDCV0x7fffd3a9d13054 to i2
  %48 = icmp ne i2 %47, 0
  br i1 %48, label %relExit, label %middle.block8.split

middle.block8.split:                              ; preds = %middle.block8
  %sextS47_D = sext <2 x i1> %cmp.n18S46_D to <2 x i64>
  %BCS47_D = bitcast <2 x i64> %sextS47_D to i128
  %mskS47_D = icmp ne i128 %BCS47_D, 0
  br i1 %mskS47_D, label %for.body22.lr.ph.split.us, label %for.body8

for.body22.lr.ph.split.us:                        ; preds = %for.body8.split.split.split, %middle.block8.split
  %mul33S48_D = fmul <2 x double> %splatS48_D.splat, <double 1.200000e+00, double 1.200000e+00>
  %SFS48_D = shufflevector <2 x double> %mul33S48_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13055 = fcmp one <2 x double> %mul33S48_D, %SFS48_D
  %49 = sext <2 x i1> %EDCV0x7fffd3a9d13055 to <2 x i64>
  %50 = bitcast <2 x i64> %49 to i128
  %51 = icmp ne i128 %50, 0
  br i1 %51, label %relExit, label %for.body22.lr.ph.split.us.split

for.body22.lr.ph.split.us.split:                  ; preds = %for.body22.lr.ph.split.us
  %S49_D = sext <2 x i32> %splatS9_D.splat to <2 x i64>
  %SFS49_D = shufflevector <2 x i64> %S49_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13056 = icmp ne <2 x i64> %S49_D, %SFS49_D
  %52 = sext <2 x i1> %EDCV0x7fffd3a9d13056 to <2 x i64>
  %53 = bitcast <2 x i64> %52 to i128
  %54 = icmp ne i128 %53, 0
  br i1 %54, label %relExit, label %for.body22.lr.ph.split.us.split.split

for.body22.lr.ph.split.us.split.split:            ; preds = %for.body22.lr.ph.split.us.split
  br label %for.body32.lr.ph.us

for.end40.us:                                     ; preds = %middle.block.split, %for.body32.us.split.split
  %.pre = load double* %arrayidx27.us, align 8, !tbaa !1
  %splatS51_D.splatinsert = insertelement <2 x double> undef, double %.pre, i32 0
  %splatS51_D.splat = shufflevector <2 x double> %splatS51_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul42.usS52_D = fmul <2 x double> %splatS51_D.splat, <double 1.000000e-02, double 1.000000e-02>
  %SFS52_D = shufflevector <2 x double> %mul42.usS52_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13057 = fcmp one <2 x double> %mul42.usS52_D, %SFS52_D
  %55 = sext <2 x i1> %EDCV0x7fffd3a9d13057 to <2 x i64>
  %56 = bitcast <2 x i64> %55 to i128
  %57 = icmp ne i128 %56, 0
  br i1 %57, label %relExit, label %for.end40.us.split

for.end40.us.split:                               ; preds = %for.end40.us
  %mul44.usS53_D = fmul <2 x double> %splatS53_D.splat, %mul42.usS52_D
  %SFS53_D = shufflevector <2 x double> %mul44.usS53_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13060 = fcmp one <2 x double> %mul44.usS53_D, %SFS53_D
  %58 = sext <2 x i1> %EDCV0x7fffd3a9d13060 to <2 x i64>
  %59 = bitcast <2 x i64> %58 to i128
  %60 = icmp ne i128 %59, 0
  br i1 %60, label %relExit, label %for.end40.us.split.split

for.end40.us.split.split:                         ; preds = %for.end40.us.split
  %arrayidx45.us = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %extractS65_D
  %61 = load double* %arrayidx45.us, align 8, !tbaa !1
  %splatS55_D.splatinsert = insertelement <2 x double> undef, double %61, i32 0
  %splatS55_D.splat = shufflevector <2 x double> %splatS55_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul46.usS56_D = fmul <2 x double> %splatS55_D.splat, %mul44.usS53_D
  %SFS56_D = shufflevector <2 x double> %mul46.usS56_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13061 = fcmp one <2 x double> %mul46.usS56_D, %SFS56_D
  %62 = sext <2 x i1> %EDCV0x7fffd3a9d13061 to <2 x i64>
  %63 = bitcast <2 x i64> %62 to i128
  %64 = icmp ne i128 %63, 0
  br i1 %64, label %relExit, label %for.end40.us.split.split.split

for.end40.us.split.split.split:                   ; preds = %for.end40.us.split.split
  %arrayidx48.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS65_D, i64 %extractS65_D
  %65 = load double* %arrayidx48.us, align 8, !tbaa !1
  %splatS58_D.splatinsert = insertelement <2 x double> undef, double %65, i32 0
  %splatS58_D.splat = shufflevector <2 x double> %splatS58_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %add49.usS59_D = fadd <2 x double> %splatS58_D.splat, %mul46.usS56_D
  %extractS60_D = extractelement <2 x double> %add49.usS59_D, i32 1
  %SFS59_D = shufflevector <2 x double> %add49.usS59_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13062 = fcmp one <2 x double> %add49.usS59_D, %SFS59_D
  %66 = sext <2 x i1> %EDCV0x7fffd3a9d13062 to <2 x i64>
  %67 = bitcast <2 x i64> %66 to i128
  %68 = icmp ne i128 %67, 0
  br i1 %68, label %relExit, label %for.end40.us.split.split.split.split

for.end40.us.split.split.split.split:             ; preds = %for.end40.us.split.split.split
  store double %extractS60_D, double* %arrayidx48.us, align 8
  %inc51.usS61_D = add <2 x i64> %VPhin.2177.usS61_D, <i64 1, i64 1>
  %extinc51.usS61_D = extractelement <2 x i64> %inc51.usS61_D, i32 1
  %SFS61_D = shufflevector <2 x i64> %inc51.usS61_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13065 = icmp ne <2 x i64> %inc51.usS61_D, %SFS61_D
  %69 = sext <2 x i1> %EDCV0x7fffd3a9d13065 to <2 x i64>
  %70 = bitcast <2 x i64> %69 to i128
  %71 = icmp ne i128 %70, 0
  br i1 %71, label %relExit, label %for.end40.us.split.split.split.split.split121

for.end40.us.split.split.split.split.split121:    ; preds = %for.end40.us.split.split.split.split
  %exitcond192S62_D = icmp eq <2 x i64> %inc51.usS61_D, %S11_D
  %SFS62_D = shufflevector <2 x i1> %exitcond192S62_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13066 = icmp ne <2 x i1> %exitcond192S62_D, %SFS62_D
  %72 = bitcast <2 x i1> %EDCV0x7fffd3a9d13066 to i2
  %73 = icmp ne i2 %72, 0
  br i1 %73, label %relExit, label %for.end40.us.split.split.split.split.split

for.end40.us.split.split.split.split.split:       ; preds = %for.end40.us.split.split.split.split.split121
  %sextS63_D = sext <2 x i1> %exitcond192S62_D to <2 x i64>
  %BCS63_D = bitcast <2 x i64> %sextS63_D to i128
  %mskS63_D = icmp ne i128 %BCS63_D, 0
  br i1 %mskS63_D, label %for.body57, label %for.body32.lr.ph.us

for.body32.us:                                    ; preds = %middle.block.split, %for.body32.us.split.split
  %VPhiS64_D = phi <2 x i64> [ %inc39.usS67_D, %for.body32.us.split.split ], [ %VPhiS95_D, %middle.block.split ]
  %extractS65_D67 = extractelement <2 x i64> %VPhiS64_D, i32 1
  %arrayidx37.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS65_D, i64 %extractS65_D67
  store double %extmul35.usS77_D, double* %arrayidx37.us, align 8
  %inc39.usS67_D = add <2 x i64> %VPhiS64_D, <i64 1, i64 1>
  %SFS67_D = shufflevector <2 x i64> %inc39.usS67_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13068 = icmp ne <2 x i64> %inc39.usS67_D, %SFS67_D
  %74 = sext <2 x i1> %EDCV0x7fffd3a9d13068 to <2 x i64>
  %75 = bitcast <2 x i64> %74 to i128
  %76 = icmp ne i128 %75, 0
  br i1 %76, label %relExit, label %for.body32.us.split

for.body32.us.split:                              ; preds = %for.body32.us
  %exitcond191S68_D = icmp eq <2 x i64> %inc39.usS67_D, %S11_D
  %SFS68_D = shufflevector <2 x i1> %exitcond191S68_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13069 = icmp ne <2 x i1> %exitcond191S68_D, %SFS68_D
  %77 = bitcast <2 x i1> %EDCV0x7fffd3a9d13069 to i2
  %78 = icmp ne i2 %77, 0
  br i1 %78, label %relExit, label %for.body32.us.split.split

for.body32.us.split.split:                        ; preds = %for.body32.us.split
  %sextS69_D = sext <2 x i1> %exitcond191S68_D to <2 x i64>
  %BCS69_D = bitcast <2 x i64> %sextS69_D to i128
  %mskS69_D = icmp ne i128 %BCS69_D, 0
  br i1 %mskS69_D, label %for.end40.us, label %for.body32.us, !llvm.loop !16

for.body32.lr.ph.us:                              ; preds = %for.end40.us.split.split.split.split.split, %for.body22.lr.ph.split.us.split.split
  %n.2177.us = phi i64 [ undef, %for.body22.lr.ph.split.us.split.split ], [ %extinc51.usS61_D, %for.end40.us.split.split.split.split.split ]
  %VPhin.2177.usS61_D = phi <2 x i64> [ zeroinitializer, %for.body22.lr.ph.split.us.split.split ], [ %inc51.usS61_D, %for.end40.us.split.split.split.split.split ]
  %extractS65_D = extractelement <2 x i64> %VPhin.2177.usS61_D, i32 1
  %arrayidx23.us = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %extractS65_D
  %79 = load double* %arrayidx23.us, align 8, !tbaa !1
  %splatS71_D.splatinsert = insertelement <2 x double> undef, double %79, i32 0
  %splatS71_D.splat = shufflevector <2 x double> %splatS71_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul24.usS72_D = fmul <2 x double> %splatS71_D.splat, <double 3.000000e+01, double 3.000000e+01>
  %SFS72_D = shufflevector <2 x double> %mul24.usS72_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13070 = fcmp one <2 x double> %mul24.usS72_D, %SFS72_D
  %80 = sext <2 x i1> %EDCV0x7fffd3a9d13070 to <2 x i64>
  %81 = bitcast <2 x i64> %80 to i128
  %82 = icmp ne i128 %81, 0
  br i1 %82, label %relExit, label %for.body32.lr.ph.us.split

for.body32.lr.ph.us.split:                        ; preds = %for.body32.lr.ph.us
  %arrayidx25.us = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %extractS65_D
  %83 = load double* %arrayidx25.us, align 8, !tbaa !1
  %splatS53_D.splatinsert = insertelement <2 x double> undef, double %83, i32 0
  %splatS53_D.splat = shufflevector <2 x double> %splatS53_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul26.usS74_D = fmul <2 x double> %mul24.usS72_D, %splatS53_D.splat
  %extractS76_D = extractelement <2 x double> %mul26.usS74_D, i32 1
  %SFS74_D = shufflevector <2 x double> %mul26.usS74_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13071 = fcmp one <2 x double> %mul26.usS74_D, %SFS74_D
  %84 = sext <2 x i1> %EDCV0x7fffd3a9d13071 to <2 x i64>
  %85 = bitcast <2 x i64> %84 to i128
  %86 = icmp ne i128 %85, 0
  br i1 %86, label %relExit, label %for.body32.lr.ph.us.split.split

for.body32.lr.ph.us.split.split:                  ; preds = %for.body32.lr.ph.us.split
  %arrayidx27.us = getelementptr inbounds double* %tau, i64 %extractS65_D
  store double %extractS76_D, double* %arrayidx27.us, align 8
  %mul35.usS77_D = fmul <2 x double> %mul33S48_D, %splatS71_D.splat
  %extmul35.usS77_D = extractelement <2 x double> %mul35.usS77_D, i32 1
  %SFS77_D = shufflevector <2 x double> %mul35.usS77_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13072 = fcmp one <2 x double> %mul35.usS77_D, %SFS77_D
  %87 = sext <2 x i1> %EDCV0x7fffd3a9d13072 to <2 x i64>
  %88 = bitcast <2 x i64> %87 to i128
  %89 = icmp ne i128 %88, 0
  br i1 %89, label %relExit, label %for.body32.lr.ph.us.split.split.split

for.body32.lr.ph.us.split.split.split:            ; preds = %for.body32.lr.ph.us.split.split
  %n.vecS78_D = and <2 x i64> %S49_D, <i64 -4, i64 -4>
  %SFS78_D = shufflevector <2 x i64> %n.vecS78_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13073 = icmp ne <2 x i64> %n.vecS78_D, %SFS78_D
  %90 = sext <2 x i1> %EDCV0x7fffd3a9d13073 to <2 x i64>
  %91 = bitcast <2 x i64> %90 to i128
  %92 = icmp ne i128 %91, 0
  br i1 %92, label %relExit, label %for.body32.lr.ph.us.split.split.split.split

for.body32.lr.ph.us.split.split.split.split:      ; preds = %for.body32.lr.ph.us.split.split.split
  %cmp.zeroS79_D = icmp eq <2 x i64> %n.vecS78_D, zeroinitializer
  %SFS79_D = shufflevector <2 x i1> %cmp.zeroS79_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13074 = icmp ne <2 x i1> %cmp.zeroS79_D, %SFS79_D
  %93 = bitcast <2 x i1> %EDCV0x7fffd3a9d13074 to i2
  %94 = icmp ne i2 %93, 0
  br i1 %94, label %relExit, label %for.body32.lr.ph.us.split.split.split.split.split

for.body32.lr.ph.us.split.split.split.split.split: ; preds = %for.body32.lr.ph.us.split.split.split.split
  %sextS80_D = sext <2 x i1> %cmp.zeroS79_D to <2 x i64>
  %BCS80_D = bitcast <2 x i64> %sextS80_D to i128
  %mskS80_D = icmp ne i128 %BCS80_D, 0
  br i1 %mskS80_D, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %for.body32.lr.ph.us.split.split.split.split.split
  %broadcast.splatinsert2 = insertelement <2 x double> undef, double %extmul35.usS77_D, i32 0
  %shuffleS82_D = shufflevector <2 x double> %broadcast.splatinsert2, <2 x double> %broadcast.splatinsert2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %shuffleS82_D75 = shufflevector <4 x double> %shuffleS82_D, <4 x double> %shuffleS82_D, <4 x i32> <i32 0, i32 0, i32 2, i32 2>
  %shuffleS87_D = shufflevector <4 x double> %shuffleS82_D75, <4 x double> %shuffleS82_D75, <2 x i32> <i32 0, i32 1>
  br label %vector.body

vector.body:                                      ; preds = %vector.body.split.split.split, %vector.ph
  %VPhiS84_D = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ %index.nextS92_D, %vector.body.split.split.split ]
  %extractS85_D = extractelement <2 x i64> %VPhiS84_D, i32 1
  %95 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS65_D, i64 %extractS85_D
  %splatS86_D.splatinsert = insertelement <2 x double*> undef, double* %95, i32 0
  %splatS86_D.splat = shufflevector <2 x double*> %splatS86_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS86_D = bitcast <2 x double*> %splatS86_D.splat to <2 x <2 x double>*>
  %extbitcastS86_D = extractelement <2 x <2 x double>*> %bitcastS86_D, i32 1
  store <2 x double> %shuffleS87_D, <2 x double>* %extbitcastS86_D, align 8
  %.sum26S88_D = or <2 x i64> %VPhiS84_D, <i64 2, i64 2>
  %extractS89_D = extractelement <2 x i64> %.sum26S88_D, i32 1
  %SFS88_D = shufflevector <2 x i64> %.sum26S88_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13078 = icmp ne <2 x i64> %.sum26S88_D, %SFS88_D
  %96 = sext <2 x i1> %EDCV0x7fffd3a9d13078 to <2 x i64>
  %97 = bitcast <2 x i64> %96 to i128
  %98 = icmp ne i128 %97, 0
  br i1 %98, label %relExit, label %vector.body.split

vector.body.split:                                ; preds = %vector.body
  %99 = getelementptr [40 x double]* %dtcdgd, i64 %extractS65_D, i64 %extractS89_D
  %splatS90_D.splatinsert = insertelement <2 x double*> undef, double* %99, i32 0
  %splatS90_D.splat = shufflevector <2 x double*> %splatS90_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS90_D = bitcast <2 x double*> %splatS90_D.splat to <2 x <2 x double>*>
  %extbitcastS90_D = extractelement <2 x <2 x double>*> %bitcastS90_D, i32 1
  store <2 x double> %shuffleS87_D, <2 x double>* %extbitcastS90_D, align 8
  %index.nextS92_D = add <2 x i64> %VPhiS84_D, <i64 4, i64 4>
  %SFS92_D = shufflevector <2 x i64> %index.nextS92_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13081 = icmp ne <2 x i64> %index.nextS92_D, %SFS92_D
  %100 = sext <2 x i1> %EDCV0x7fffd3a9d13081 to <2 x i64>
  %101 = bitcast <2 x i64> %100 to i128
  %102 = icmp ne i128 %101, 0
  br i1 %102, label %relExit, label %vector.body.split.split

vector.body.split.split:                          ; preds = %vector.body.split
  %S93_D = icmp eq <2 x i64> %index.nextS92_D, %n.vecS78_D
  %SFS93_D = shufflevector <2 x i1> %S93_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13082 = icmp ne <2 x i1> %S93_D, %SFS93_D
  %103 = bitcast <2 x i1> %EDCV0x7fffd3a9d13082 to i2
  %104 = icmp ne i2 %103, 0
  br i1 %104, label %relExit, label %vector.body.split.split.split

vector.body.split.split.split:                    ; preds = %vector.body.split.split
  %sextS94_D = sext <2 x i1> %S93_D to <2 x i64>
  %BCS94_D = bitcast <2 x i64> %sextS94_D to i128
  %mskS94_D = icmp ne i128 %BCS94_D, 0
  br i1 %mskS94_D, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body.split.split.split, %for.body32.lr.ph.us.split.split.split.split.split
  %VPhiS95_D = phi <2 x i64> [ zeroinitializer, %for.body32.lr.ph.us.split.split.split.split.split ], [ %n.vecS78_D, %vector.body.split.split.split ]
  %cmp.nS96_D = icmp eq <2 x i64> %S49_D, %VPhiS95_D
  %SFS96_D = shufflevector <2 x i1> %cmp.nS96_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13083 = icmp ne <2 x i1> %cmp.nS96_D, %SFS96_D
  %105 = bitcast <2 x i1> %EDCV0x7fffd3a9d13083 to i2
  %106 = icmp ne i2 %105, 0
  br i1 %106, label %relExit, label %middle.block.split

middle.block.split:                               ; preds = %middle.block
  %sextS97_D = sext <2 x i1> %cmp.nS96_D to <2 x i64>
  %BCS97_D = bitcast <2 x i64> %sextS97_D to i128
  %mskS97_D = icmp ne i128 %BCS97_D, 0
  br i1 %mskS97_D, label %for.end40.us, label %for.body32.us

for.body8:                                        ; preds = %for.body8.split.split.split, %middle.block8.split
  %VPhiS98_D = phi <2 x i64> [ %inc16S108_D, %for.body8.split.split.split ], [ %VPhiS45_D, %middle.block8.split ]
  %extractS99_D = extractelement <2 x i64> %VPhiS98_D, i32 1
  %arrayidx9 = getelementptr inbounds double* %slipRate, i64 %extractS99_D
  %107 = load double* %arrayidx9, align 8, !tbaa !1
  %splatS100_D.splatinsert = insertelement <2 x double> undef, double %107, i32 0
  %splatS100_D.splat = shufflevector <2 x double> %splatS100_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx10 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %extractS99_D
  %108 = load double* %arrayidx10, align 8, !tbaa !1
  %splatS102_D.splatinsert = insertelement <2 x double> undef, double %108, i32 0
  %splatS102_D.splat = shufflevector <2 x double> %splatS102_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul11S103_D = fmul <2 x double> %splatS100_D.splat, %splatS102_D.splat
  %SFS103_D = shufflevector <2 x double> %mul11S103_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13084 = fcmp one <2 x double> %mul11S103_D, %SFS103_D
  %109 = sext <2 x i1> %EDCV0x7fffd3a9d13084 to <2 x i64>
  %110 = bitcast <2 x i64> %109 to i128
  %111 = icmp ne i128 %110, 0
  br i1 %111, label %relExit, label %for.body8.split122

for.body8.split122:                               ; preds = %for.body8
  %add12S104_D = fadd <2 x double> %mul11S103_D, <double 1.000000e-06, double 1.000000e-06>
  %SFS104_D = shufflevector <2 x double> %add12S104_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13085 = fcmp one <2 x double> %add12S104_D, %SFS104_D
  %112 = sext <2 x i1> %EDCV0x7fffd3a9d13085 to <2 x i64>
  %113 = bitcast <2 x i64> %112 to i128
  %114 = icmp ne i128 %113, 0
  br i1 %114, label %relExit, label %for.body8.split122.split

for.body8.split122.split:                         ; preds = %for.body8.split122
  %div13S105_D = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %add12S104_D
  %extractS107_D = extractelement <2 x double> %div13S105_D, i32 1
  %SFS105_D = shufflevector <2 x double> %div13S105_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13086 = fcmp one <2 x double> %div13S105_D, %SFS105_D
  %115 = sext <2 x i1> %EDCV0x7fffd3a9d13086 to <2 x i64>
  %116 = bitcast <2 x i64> %115 to i128
  %117 = icmp ne i128 %116, 0
  br i1 %117, label %relExit, label %for.body8.split

for.body8.split:                                  ; preds = %for.body8.split122.split
  %arrayidx14 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %extractS99_D
  store double %extractS107_D, double* %arrayidx14, align 8
  %inc16S108_D = add <2 x i64> %VPhiS98_D, <i64 1, i64 1>
  %SFS108_D = shufflevector <2 x i64> %inc16S108_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13087 = icmp ne <2 x i64> %inc16S108_D, %SFS108_D
  %118 = sext <2 x i1> %EDCV0x7fffd3a9d13087 to <2 x i64>
  %119 = bitcast <2 x i64> %118 to i128
  %120 = icmp ne i128 %119, 0
  br i1 %120, label %relExit, label %for.body8.split.split

for.body8.split.split:                            ; preds = %for.body8.split
  %exitcond187S109_D = icmp eq <2 x i64> %inc16S108_D, %S11_D
  %SFS109_D = shufflevector <2 x i1> %exitcond187S109_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13088 = icmp ne <2 x i1> %exitcond187S109_D, %SFS109_D
  %121 = bitcast <2 x i1> %EDCV0x7fffd3a9d13088 to i2
  %122 = icmp ne i2 %121, 0
  br i1 %122, label %relExit, label %for.body8.split.split.split

for.body8.split.split.split:                      ; preds = %for.body8.split.split
  %sextS110_D = sext <2 x i1> %exitcond187S109_D to <2 x i64>
  %BCS110_D = bitcast <2 x i64> %sextS110_D to i128
  %mskS110_D = icmp ne i128 %BCS110_D, 0
  br i1 %mskS110_D, label %for.body22.lr.ph.split.us, label %for.body8, !llvm.loop !18

for.end93.us:                                     ; preds = %for.body76.us.split
  %arrayidx95.us = getelementptr inbounds double* %tauc, i64 %extractS121_D
  %123 = load double* %arrayidx95.us, align 8, !tbaa !1
  %splatS112_D.splatinsert = insertelement <2 x double> undef, double %123, i32 0
  %splatS112_D.splat = shufflevector <2 x double> %splatS112_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %sub96.usS113_D = fsub <2 x double> %add83.usS113_D, %splatS112_D.splat
  %SFS113_D = shufflevector <2 x double> %sub96.usS113_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130103 = fcmp one <2 x double> %sub96.usS113_D, %SFS113_D
  %124 = sext <2 x i1> %EDCV0x7fffd3a9d130103 to <2 x i64>
  %125 = bitcast <2 x i64> %124 to i128
  %126 = icmp ne i128 %125, 0
  br i1 %126, label %relExit, label %for.end93.us.split123

for.end93.us.split123:                            ; preds = %for.end93.us
  %mul100.usS114_D = fmul <2 x double> %splatS114_D.splat, %sub96.usS113_D
  %extractS116_D = extractelement <2 x double> %mul100.usS114_D, i32 1
  %SFS114_D = shufflevector <2 x double> %mul100.usS114_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130106 = fcmp one <2 x double> %mul100.usS114_D, %SFS114_D
  %127 = sext <2 x i1> %EDCV0x7fffd3a9d130106 to <2 x i64>
  %128 = bitcast <2 x i64> %127 to i128
  %129 = icmp ne i128 %128, 0
  br i1 %129, label %relExit, label %for.end93.us.split

for.end93.us.split:                               ; preds = %for.end93.us.split123
  %arrayidx101.us = getelementptr inbounds double* %rhs, i64 %extractS121_D
  store double %extractS116_D, double* %arrayidx101.us, align 8
  %inc103.usS117_D = add <2 x i64> %VPhin.4170.usS117_D, <i64 1, i64 1>
  %SFS117_D = shufflevector <2 x i64> %inc103.usS117_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130109 = icmp ne <2 x i64> %inc103.usS117_D, %SFS117_D
  %130 = sext <2 x i1> %EDCV0x7fffd3a9d130109 to <2 x i64>
  %131 = bitcast <2 x i64> %130 to i128
  %132 = icmp ne i128 %131, 0
  br i1 %132, label %relExit, label %for.end93.us.split.split124

for.end93.us.split.split124:                      ; preds = %for.end93.us.split
  %exitcond190S118_D = icmp eq <2 x i64> %inc103.usS117_D, %S11_D
  %SFS118_D = shufflevector <2 x i1> %exitcond190S118_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130110 = icmp ne <2 x i1> %exitcond190S118_D, %SFS118_D
  %133 = bitcast <2 x i1> %EDCV0x7fffd3a9d130110 to i2
  %134 = icmp ne i2 %133, 0
  br i1 %134, label %relExit, label %for.end93.us.split.split

for.end93.us.split.split:                         ; preds = %for.end93.us.split.split124
  %sextS119_D = sext <2 x i1> %exitcond190S118_D to <2 x i64>
  %BCS119_D = bitcast <2 x i64> %sextS119_D to i128
  %mskS119_D = icmp ne i128 %BCS119_D, 0
  br i1 %mskS119_D, label %for.end104, label %for.body76.lr.ph.us

for.body76.us:                                    ; preds = %for.body76.lr.ph.us, %for.body76.us.split
  %VPhiS113_D = phi <2 x double> [ %splatS133_D.splat, %for.body76.lr.ph.us ], [ %add83.usS113_D, %for.body76.us.split ]
  %VPhiS120_D = phi <2 x i64> [ zeroinitializer, %for.body76.lr.ph.us ], [ %inc92.usS129_D, %for.body76.us.split ]
  %extractS121_D111 = extractelement <2 x i64> %VPhiS120_D, i32 1
  %arrayidx78.us = getelementptr inbounds [40 x double]* %dtdg, i64 %extractS121_D, i64 %extractS121_D111
  %135 = load double* %arrayidx78.us, align 8, !tbaa !1
  %splatS113_D.splatinsert = insertelement <2 x double> undef, double %135, i32 0
  %splatS113_D.splat = shufflevector <2 x double> %splatS113_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul79.usS113_D = fmul <2 x double> %splatS113_D.splat, %splatS48_D.splat
  %arrayidx80.us = getelementptr inbounds double* %dSlipRate, i64 %extractS121_D111
  %136 = load double* %arrayidx80.us, align 8, !tbaa !1
  %splatS113_D.splatinsert101 = insertelement <2 x double> undef, double %136, i32 0
  %splatS113_D.splat102 = shufflevector <2 x double> %splatS113_D.splatinsert101, <2 x double> undef, <2 x i32> zeroinitializer
  %mul81.usS113_D = fmul <2 x double> %mul79.usS113_D, %splatS113_D.splat102
  %add83.usS113_D = fadd <2 x double> %VPhiS113_D, %mul81.usS113_D
  %arrayidx85.us = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS121_D, i64 %extractS121_D111
  %137 = load double* %arrayidx85.us, align 8, !tbaa !1
  %splatS124_D.splatinsert = insertelement <2 x double> undef, double %137, i32 0
  %splatS124_D.splat = shufflevector <2 x double> %splatS124_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %add86.usS125_D = fsub <2 x double> %splatS124_D.splat, %mul79.usS113_D
  %SFS125_D = shufflevector <2 x double> %add86.usS125_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130112 = fcmp one <2 x double> %add86.usS125_D, %SFS125_D
  %138 = sext <2 x i1> %EDCV0x7fffd3a9d130112 to <2 x i64>
  %139 = bitcast <2 x i64> %138 to i128
  %140 = icmp ne i128 %139, 0
  br i1 %140, label %relExit, label %for.body76.us.split125

for.body76.us.split125:                           ; preds = %for.body76.us
  %mul88.usS126_D = fmul <2 x double> %splatS114_D.splat, %add86.usS125_D
  %extractS128_D = extractelement <2 x double> %mul88.usS126_D, i32 1
  %SFS126_D = shufflevector <2 x double> %mul88.usS126_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130113 = fcmp one <2 x double> %mul88.usS126_D, %SFS126_D
  %141 = sext <2 x i1> %EDCV0x7fffd3a9d130113 to <2 x i64>
  %142 = bitcast <2 x i64> %141 to i128
  %143 = icmp ne i128 %142, 0
  br i1 %143, label %relExit, label %for.body76.us.split125.split

for.body76.us.split125.split:                     ; preds = %for.body76.us.split125
  %arrayidx90.us = getelementptr inbounds [40 x double]* %matrix, i64 %extractS121_D, i64 %extractS121_D111
  store double %extractS128_D, double* %arrayidx90.us, align 8
  %inc92.usS129_D = add <2 x i64> %VPhiS120_D, <i64 1, i64 1>
  %SFS129_D = shufflevector <2 x i64> %inc92.usS129_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130114 = icmp ne <2 x i64> %inc92.usS129_D, %SFS129_D
  %144 = sext <2 x i1> %EDCV0x7fffd3a9d130114 to <2 x i64>
  %145 = bitcast <2 x i64> %144 to i128
  %146 = icmp ne i128 %145, 0
  br i1 %146, label %relExit, label %for.body76.us.split125.split.split

for.body76.us.split125.split.split:               ; preds = %for.body76.us.split125.split
  %exitcond189S130_D = icmp eq <2 x i64> %inc92.usS129_D, %S11_D
  %SFS130_D = shufflevector <2 x i1> %exitcond189S130_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130115 = icmp ne <2 x i1> %exitcond189S130_D, %SFS130_D
  %147 = bitcast <2 x i1> %EDCV0x7fffd3a9d130115 to i2
  %148 = icmp ne i2 %147, 0
  br i1 %148, label %relExit, label %for.body76.us.split

for.body76.us.split:                              ; preds = %for.body76.us.split125.split.split
  %sextS131_D = sext <2 x i1> %exitcond189S130_D to <2 x i64>
  %BCS131_D = bitcast <2 x i64> %sextS131_D to i128
  %mskS131_D = icmp ne i128 %BCS131_D, 0
  br i1 %mskS131_D, label %for.end93.us, label %for.body76.us

for.body76.lr.ph.us:                              ; preds = %for.body57.split.split.split, %for.end93.us.split.split
  %VPhin.4170.usS117_D = phi <2 x i64> [ %inc103.usS117_D, %for.end93.us.split.split ], [ zeroinitializer, %for.body57.split.split.split ]
  %extractS121_D = extractelement <2 x i64> %VPhin.4170.usS117_D, i32 1
  %arrayidx70.us = getelementptr inbounds double* %tau, i64 %extractS121_D
  %149 = load double* %arrayidx70.us, align 8, !tbaa !1
  %splatS133_D.splatinsert = insertelement <2 x double> undef, double %149, i32 0
  %splatS133_D.splat = shufflevector <2 x double> %splatS133_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx87.us = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %extractS121_D
  %150 = load double* %arrayidx87.us, align 8, !tbaa !1
  %splatS114_D.splatinsert = insertelement <2 x double> undef, double %150, i32 0
  %splatS114_D.splat = shufflevector <2 x double> %splatS114_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body76.us

for.body57:                                       ; preds = %for.body57.split.split.split, %for.end40.us.split.split.split.split.split
  %VPhiS136_D = phi <2 x i64> [ %inc63S142_D, %for.body57.split.split.split ], [ zeroinitializer, %for.end40.us.split.split.split.split.split ]
  %extractS137_D = extractelement <2 x i64> %VPhiS136_D, i32 1
  %arrayidx59 = getelementptr inbounds [40 x double]* %dtcdgd, i64 %extractS137_D, i64 %extractS137_D
  %151 = load double* %arrayidx59, align 8, !tbaa !1
  %splatS138_D.splatinsert = insertelement <2 x double> undef, double %151, i32 0
  %splatS138_D.splat = shufflevector <2 x double> %splatS138_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %div60S139_D = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %splatS138_D.splat
  %extractS141_D = extractelement <2 x double> %div60S139_D, i32 1
  %SFS139_D = shufflevector <2 x double> %div60S139_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130116 = fcmp one <2 x double> %div60S139_D, %SFS139_D
  %152 = sext <2 x i1> %EDCV0x7fffd3a9d130116 to <2 x i64>
  %153 = bitcast <2 x i64> %152 to i128
  %154 = icmp ne i128 %153, 0
  br i1 %154, label %relExit, label %for.body57.split

for.body57.split:                                 ; preds = %for.body57
  %arrayidx61 = getelementptr inbounds [40 x double]* %bor_array, i64 0, i64 %extractS137_D
  store double %extractS141_D, double* %arrayidx61, align 8
  %inc63S142_D = add <2 x i64> %VPhiS136_D, <i64 1, i64 1>
  %SFS142_D = shufflevector <2 x i64> %inc63S142_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130117 = icmp ne <2 x i64> %inc63S142_D, %SFS142_D
  %155 = sext <2 x i1> %EDCV0x7fffd3a9d130117 to <2 x i64>
  %156 = bitcast <2 x i64> %155 to i128
  %157 = icmp ne i128 %156, 0
  br i1 %157, label %relExit, label %for.body57.split.split

for.body57.split.split:                           ; preds = %for.body57.split
  %exitcond185S143_D = icmp eq <2 x i64> %inc63S142_D, %S11_D
  %SFS143_D = shufflevector <2 x i1> %exitcond185S143_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130118 = icmp ne <2 x i1> %exitcond185S143_D, %SFS143_D
  %158 = bitcast <2 x i1> %EDCV0x7fffd3a9d130118 to i2
  %159 = icmp ne i2 %158, 0
  br i1 %159, label %relExit, label %for.body57.split.split.split

for.body57.split.split.split:                     ; preds = %for.body57.split.split
  %sextS144_D = sext <2 x i1> %exitcond185S143_D to <2 x i64>
  %BCS144_D = bitcast <2 x i64> %sextS144_D to i128
  %mskS144_D = icmp ne i128 %BCS144_D, 0
  br i1 %mskS144_D, label %for.body76.lr.ph.us, label %for.body57

for.end104:                                       ; preds = %for.end93.us.split.split, %entry.split
  ret void

relExit:                                          ; preds = %for.body57.split.split, %for.body57.split, %for.body57, %for.body76.us.split125.split.split, %for.body76.us.split125.split, %for.body76.us.split125, %for.body76.us, %for.end93.us.split.split124, %for.end93.us.split, %for.end93.us.split123, %for.end93.us, %for.body8.split.split, %for.body8.split, %for.body8.split122.split, %for.body8.split122, %for.body8, %middle.block, %vector.body.split.split, %vector.body.split, %vector.body, %for.body32.lr.ph.us.split.split.split.split, %for.body32.lr.ph.us.split.split.split, %for.body32.lr.ph.us.split.split, %for.body32.lr.ph.us.split, %for.body32.lr.ph.us, %for.body32.us.split, %for.body32.us, %for.end40.us.split.split.split.split.split121, %for.end40.us.split.split.split.split, %for.end40.us.split.split.split, %for.end40.us.split.split, %for.end40.us.split, %for.end40.us, %for.body22.lr.ph.split.us.split, %for.body22.lr.ph.split.us, %middle.block8, %vector.body7.split, %vector.body7.split120.split.split, %vector.body7.split120.split, %vector.body7.split120, %vector.body7, %for.body8.preheader.split.split, %for.body8.preheader.split, %for.body8.preheader, %for.body.split.split.split, %for.body.split.split, %for.body.split, %for.body.split119.split, %for.body.split119, %for.body, %for.body.lr.ph, %entry
  %160 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @relFun, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @func3, i32 0, i32 0))
  call void @exit(i32 1)
  ret void
}

; Function Attrs: nounwind uwtable
define double @Crystal_pow(i32 %nSlip, double* nocapture readonly %slipRate) #0 {
entry:
  %splatS6_D.splatinsert = insertelement <2 x i32> undef, i32 %nSlip, i32 0
  %splatS6_D.splat = shufflevector <2 x i32> %splatS6_D.splatinsert, <2 x i32> undef, <2 x i32> zeroinitializer
  %rateFact = alloca [40 x double], align 16
  %splatrateFactS2_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %rateFact, i32 0
  %splatrateFactS2_D.splat = shufflevector <2 x [40 x double]*> %splatrateFactS2_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %sgn = alloca [40 x double], align 16
  %splatsgnS4_D.splatinsert = insertelement <2 x [40 x double]*> undef, [40 x double]* %sgn, i32 0
  %splatsgnS4_D.splat = shufflevector <2 x [40 x double]*> %splatsgnS4_D.splatinsert, <2 x [40 x double]*> undef, <2 x i32> zeroinitializer
  %bitcastS2_D = bitcast <2 x [40 x double]*> %splatrateFactS2_D.splat to <2 x i8*>
  %bitcastS4_D = bitcast <2 x [40 x double]*> %splatsgnS4_D.splat to <2 x i8*>
  %cmp33S6_D = icmp sgt <2 x i32> %splatS6_D.splat, zeroinitializer
  %SFS6_D = shufflevector <2 x i1> %cmp33S6_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130 = icmp ne <2 x i1> %cmp33S6_D, %SFS6_D
  %0 = bitcast <2 x i1> %EDCV0x7fffd3a9d130 to i2
  %1 = icmp ne i2 %0, 0
  br i1 %1, label %relExit, label %entry.split

entry.split:                                      ; preds = %entry
  %sextS7_D = sext <2 x i1> %cmp33S6_D to <2 x i64>
  %BCS7_D = bitcast <2 x i64> %sextS7_D to i128
  %mskS7_D = icmp ne i128 %BCS7_D, 0
  br i1 %mskS7_D, label %for.body.lr.ph, label %for.end19

for.body.lr.ph:                                   ; preds = %entry.split
  %S8_D = sext <2 x i32> %splatS6_D.splat to <2 x i64>
  %SFS8_D = shufflevector <2 x i64> %S8_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1305 = icmp ne <2 x i64> %S8_D, %SFS8_D
  %2 = sext <2 x i1> %EDCV0x7fffd3a9d1305 to <2 x i64>
  %3 = bitcast <2 x i64> %2 to i128
  %4 = icmp ne i128 %3, 0
  br i1 %4, label %relExit, label %for.body.lr.ph.split

for.body.lr.ph.split:                             ; preds = %for.body.lr.ph
  br label %for.body

for.body:                                         ; preds = %for.body.split.split.split.split, %for.body.lr.ph.split
  %VPhiS10_D = phi <2 x i64> [ zeroinitializer, %for.body.lr.ph.split ], [ %incS19_D, %for.body.split.split.split.split ]
  %extractS11_D = extractelement <2 x i64> %VPhiS10_D, i32 1
  %arrayidx = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %extractS11_D
  store double 1.000000e+00, double* %arrayidx, align 8, !tbaa !1
  %conv2S13_D = sitofp <2 x i64> %VPhiS10_D to <2 x double>
  %SFS13_D = shufflevector <2 x double> %conv2S13_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1306 = fcmp one <2 x double> %conv2S13_D, %SFS13_D
  %5 = sext <2 x i1> %EDCV0x7fffd3a9d1306 to <2 x i64>
  %6 = bitcast <2 x i64> %5 to i128
  %7 = icmp ne i128 %6, 0
  br i1 %7, label %relExit, label %for.body.split19

for.body.split19:                                 ; preds = %for.body
  %mulS14_D = fmul <2 x double> %conv2S13_D, <double 2.000000e-01, double 2.000000e-01>
  %SFS14_D = shufflevector <2 x double> %mulS14_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1307 = fcmp one <2 x double> %mulS14_D, %SFS14_D
  %8 = sext <2 x i1> %EDCV0x7fffd3a9d1307 to <2 x i64>
  %9 = bitcast <2 x i64> %8 to i128
  %10 = icmp ne i128 %9, 0
  br i1 %10, label %relExit, label %for.body.split

for.body.split:                                   ; preds = %for.body.split19
  %mul3S15_D = fmul <2 x double> %mulS14_D, <double 9.000000e-01, double 9.000000e-01>
  %SFS15_D = shufflevector <2 x double> %mul3S15_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1308 = fcmp one <2 x double> %mul3S15_D, %SFS15_D
  %11 = sext <2 x i1> %EDCV0x7fffd3a9d1308 to <2 x i64>
  %12 = bitcast <2 x i64> %11 to i128
  %13 = icmp ne i128 %12, 0
  br i1 %13, label %relExit, label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %divS16_D = fdiv <2 x double> %mul3S15_D, <double 4.000000e+01, double 4.000000e+01>
  %extractS18_D = extractelement <2 x double> %divS16_D, i32 1
  %SFS16_D = shufflevector <2 x double> %divS16_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d1309 = fcmp one <2 x double> %divS16_D, %SFS16_D
  %14 = sext <2 x i1> %EDCV0x7fffd3a9d1309 to <2 x i64>
  %15 = bitcast <2 x i64> %14 to i128
  %16 = icmp ne i128 %15, 0
  br i1 %16, label %relExit, label %for.body.split.split.split21

for.body.split.split.split21:                     ; preds = %for.body.split.split
  %arrayidx4 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %extractS11_D
  store double %extractS18_D, double* %arrayidx4, align 8
  %incS19_D = add <2 x i64> %VPhiS10_D, <i64 1, i64 1>
  %SFS19_D = shufflevector <2 x i64> %incS19_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13010 = icmp ne <2 x i64> %incS19_D, %SFS19_D
  %17 = sext <2 x i1> %EDCV0x7fffd3a9d13010 to <2 x i64>
  %18 = bitcast <2 x i64> %17 to i128
  %19 = icmp ne i128 %18, 0
  br i1 %19, label %relExit, label %for.body.split.split.split

for.body.split.split.split:                       ; preds = %for.body.split.split.split21
  %exitcond35S20_D = icmp eq <2 x i64> %incS19_D, %S8_D
  %SFS20_D = shufflevector <2 x i1> %exitcond35S20_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13011 = icmp ne <2 x i1> %exitcond35S20_D, %SFS20_D
  %20 = bitcast <2 x i1> %EDCV0x7fffd3a9d13011 to i2
  %21 = icmp ne i2 %20, 0
  br i1 %21, label %relExit, label %for.body.split.split.split.split

for.body.split.split.split.split:                 ; preds = %for.body.split.split.split
  %sextS21_D = sext <2 x i1> %exitcond35S20_D to <2 x i64>
  %BCS21_D = bitcast <2 x i64> %sextS21_D to i128
  %mskS21_D = icmp ne i128 %BCS21_D, 0
  br i1 %mskS21_D, label %for.body9, label %for.body

for.body9:                                        ; preds = %for.body9.split.split.split, %for.body.split.split.split.split
  %VPhiS22_D = phi <2 x i64> [ %inc18S34_D, %for.body9.split.split.split ], [ zeroinitializer, %for.body.split.split.split.split ]
  %extractS23_D = extractelement <2 x i64> %VPhiS22_D, i32 1
  %arrayidx11 = getelementptr inbounds double* %slipRate, i64 %extractS23_D
  %22 = load double* %arrayidx11, align 8, !tbaa !1
  %splatS24_D.splatinsert = insertelement <2 x double> undef, double %22, i32 0
  %splatS24_D.splat = shufflevector <2 x double> %splatS24_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx12 = getelementptr inbounds [40 x double]* %sgn, i64 0, i64 %extractS23_D
  %23 = load double* %arrayidx12, align 8, !tbaa !1
  %splatS26_D.splatinsert = insertelement <2 x double> undef, double %23, i32 0
  %splatS26_D.splat = shufflevector <2 x double> %splatS26_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul13S27_D = fmul <2 x double> %splatS24_D.splat, %splatS26_D.splat
  %SFS27_D = shufflevector <2 x double> %mul13S27_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13012 = fcmp one <2 x double> %mul13S27_D, %SFS27_D
  %24 = sext <2 x i1> %EDCV0x7fffd3a9d13012 to <2 x i64>
  %25 = bitcast <2 x i64> %24 to i128
  %26 = icmp ne i128 %25, 0
  br i1 %26, label %relExit, label %for.body9.split20

for.body9.split20:                                ; preds = %for.body9
  %addS28_D = fadd <2 x double> %mul13S27_D, <double 1.000000e-06, double 1.000000e-06>
  %SFS28_D = shufflevector <2 x double> %addS28_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13013 = fcmp one <2 x double> %addS28_D, %SFS28_D
  %27 = sext <2 x i1> %EDCV0x7fffd3a9d13013 to <2 x i64>
  %28 = bitcast <2 x i64> %27 to i128
  %29 = icmp ne i128 %28, 0
  br i1 %29, label %relExit, label %for.body9.split20.split22

for.body9.split20.split22:                        ; preds = %for.body9.split20
  %div14S29_D = fmul <2 x double> %addS28_D, <double 5.000000e-01, double 5.000000e-01>
  %SFS29_D = shufflevector <2 x double> %div14S29_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13014 = fcmp one <2 x double> %div14S29_D, %SFS29_D
  %30 = sext <2 x i1> %EDCV0x7fffd3a9d13014 to <2 x i64>
  %31 = bitcast <2 x i64> %30 to i128
  %32 = icmp ne i128 %31, 0
  br i1 %32, label %relExit, label %for.body9.split20.split

for.body9.split20.split:                          ; preds = %for.body9.split20.split22
  %vpowS30_D = call <2 x double> @llvm.pow.v2f64(<2 x double> %div14S29_D, <2 x double> <double 1.000000e-02, double 1.000000e-02>)
  %SFS30_D = shufflevector <2 x double> %vpowS30_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13015 = fcmp one <2 x double> %vpowS30_D, %SFS30_D
  %33 = sext <2 x i1> %EDCV0x7fffd3a9d13015 to <2 x i64>
  %34 = bitcast <2 x i64> %33 to i128
  %35 = icmp ne i128 %34, 0
  br i1 %35, label %relExit, label %for.body9.split20.split.split

for.body9.split20.split.split:                    ; preds = %for.body9.split20.split
  %mul15S31_D = fmul <2 x double> %vpowS30_D, <double 1.200000e+00, double 1.200000e+00>
  %extractS33_D = extractelement <2 x double> %mul15S31_D, i32 1
  %SFS31_D = shufflevector <2 x double> %mul15S31_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13016 = fcmp one <2 x double> %mul15S31_D, %SFS31_D
  %36 = sext <2 x i1> %EDCV0x7fffd3a9d13016 to <2 x i64>
  %37 = bitcast <2 x i64> %36 to i128
  %38 = icmp ne i128 %37, 0
  br i1 %38, label %relExit, label %for.body9.split

for.body9.split:                                  ; preds = %for.body9.split20.split.split
  %arrayidx16 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 %extractS23_D
  store double %extractS33_D, double* %arrayidx16, align 8
  %inc18S34_D = add <2 x i64> %VPhiS22_D, <i64 1, i64 1>
  %SFS34_D = shufflevector <2 x i64> %inc18S34_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13017 = icmp ne <2 x i64> %inc18S34_D, %SFS34_D
  %39 = sext <2 x i1> %EDCV0x7fffd3a9d13017 to <2 x i64>
  %40 = bitcast <2 x i64> %39 to i128
  %41 = icmp ne i128 %40, 0
  br i1 %41, label %relExit, label %for.body9.split.split

for.body9.split.split:                            ; preds = %for.body9.split
  %exitcondS35_D = icmp eq <2 x i64> %inc18S34_D, %S8_D
  %SFS35_D = shufflevector <2 x i1> %exitcondS35_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13018 = icmp ne <2 x i1> %exitcondS35_D, %SFS35_D
  %42 = bitcast <2 x i1> %EDCV0x7fffd3a9d13018 to i2
  %43 = icmp ne i2 %42, 0
  br i1 %43, label %relExit, label %for.body9.split.split.split

for.body9.split.split.split:                      ; preds = %for.body9.split.split
  %sextS36_D = sext <2 x i1> %exitcondS35_D to <2 x i64>
  %BCS36_D = bitcast <2 x i64> %sextS36_D to i128
  %mskS36_D = icmp ne i128 %BCS36_D, 0
  br i1 %mskS36_D, label %for.end19, label %for.body9

for.end19:                                        ; preds = %for.body9.split.split.split, %entry.split
  %arrayidx20 = getelementptr inbounds [40 x double]* %rateFact, i64 0, i64 3
  %44 = load double* %arrayidx20, align 8, !tbaa !1
  %splatS38_D.splatinsert = insertelement <2 x double> undef, double %44, i32 0
  %splatS38_D.splat = shufflevector <2 x double> %splatS38_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %extractS41_D = extractelement <2 x double> %splatS38_D.splat, i32 1
  ret double %extractS41_D

relExit:                                          ; preds = %for.body9.split.split, %for.body9.split, %for.body9.split20.split.split, %for.body9.split20.split, %for.body9.split20.split22, %for.body9.split20, %for.body9, %for.body.split.split.split, %for.body.split.split.split21, %for.body.split.split, %for.body.split, %for.body.split19, %for.body, %for.body.lr.ph, %entry
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @relFun, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @func4, i32 0, i32 0))
  call void @exit(i32 1)
  ret double 0.000000e+00
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind uwtable
define void @Crystal_Cholesky(i32 %nSlip, [40 x double]* nocapture %a, double* nocapture readonly %r, double* nocapture %g) #0 {
entry:
  %splatS12_D.splatinsert = insertelement <2 x double*> undef, double* %g, i32 0
  %splatS12_D.splat = shufflevector <2 x double*> %splatS12_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %splatS11_D.splatinsert = insertelement <2 x double*> undef, double* %r, i32 0
  %splatS11_D.splat = shufflevector <2 x double*> %splatS11_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %splatS0_D.splatinsert = insertelement <2 x i32> undef, i32 %nSlip, i32 0
  %splatS0_D.splat = shufflevector <2 x i32> %splatS0_D.splatinsert, <2 x i32> undef, <2 x i32> zeroinitializer
  %convS0_D = sext <2 x i32> %splatS0_D.splat to <2 x i64>
  %SFS0_D = shufflevector <2 x i64> %convS0_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130 = icmp ne <2 x i64> %convS0_D, %SFS0_D
  %0 = sext <2 x i1> %EDCV0x7fffd3a9d130 to <2 x i64>
  %1 = bitcast <2 x i64> %0 to i128
  %2 = icmp ne i128 %1, 0
  br i1 %2, label %relExit, label %entry.split

entry.split:                                      ; preds = %entry
  %cmp332S1_D = icmp sgt <2 x i32> %splatS0_D.splat, zeroinitializer
  %SFS1_D = shufflevector <2 x i1> %cmp332S1_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13013 = icmp ne <2 x i1> %cmp332S1_D, %SFS1_D
  %3 = bitcast <2 x i1> %EDCV0x7fffd3a9d13013 to i2
  %4 = icmp ne i2 %3, 0
  br i1 %4, label %relExit, label %entry.split.split

entry.split.split:                                ; preds = %entry.split
  %sextS2_D = sext <2 x i1> %cmp332S1_D to <2 x i64>
  %BCS2_D = bitcast <2 x i64> %sextS2_D to i128
  %mskS2_D = icmp ne i128 %BCS2_D, 0
  br i1 %mskS2_D, label %for.body.preheader, label %for.end109

for.body.preheader:                               ; preds = %entry.split.split
  %S3_D = sext <2 x i32> %splatS0_D.splat to <2 x i64>
  %SFS3_D = shufflevector <2 x i64> %S3_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13014 = icmp ne <2 x i64> %S3_D, %SFS3_D
  %5 = sext <2 x i1> %EDCV0x7fffd3a9d13014 to <2 x i64>
  %6 = bitcast <2 x i64> %5 to i128
  %7 = icmp ne i128 %6, 0
  br i1 %7, label %relExit, label %for.body.preheader.split

for.body.preheader.split:                         ; preds = %for.body.preheader
  %n.vecS4_D = and <2 x i64> %S3_D, <i64 -4, i64 -4>
  %SFS4_D = shufflevector <2 x i64> %n.vecS4_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13015 = icmp ne <2 x i64> %n.vecS4_D, %SFS4_D
  %8 = sext <2 x i1> %EDCV0x7fffd3a9d13015 to <2 x i64>
  %9 = bitcast <2 x i64> %8 to i128
  %10 = icmp ne i128 %9, 0
  br i1 %10, label %relExit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  %cmp.zeroS5_D = icmp eq <2 x i64> %n.vecS4_D, zeroinitializer
  %SFS5_D = shufflevector <2 x i1> %cmp.zeroS5_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13016 = icmp ne <2 x i1> %cmp.zeroS5_D, %SFS5_D
  %11 = bitcast <2 x i1> %EDCV0x7fffd3a9d13016 to i2
  %12 = icmp ne i2 %11, 0
  br i1 %12, label %relExit, label %for.body.preheader.split.split.split

for.body.preheader.split.split.split:             ; preds = %for.body.preheader.split.split
  %S6_D = sext <2 x i32> %splatS0_D.splat to <2 x i64>
  %SFS6_D = shufflevector <2 x i64> %S6_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13017 = icmp ne <2 x i64> %S6_D, %SFS6_D
  %13 = sext <2 x i1> %EDCV0x7fffd3a9d13017 to <2 x i64>
  %14 = bitcast <2 x i64> %13 to i128
  %15 = icmp ne i128 %14, 0
  br i1 %15, label %relExit, label %for.body.preheader.split.split.split.split

for.body.preheader.split.split.split.split:       ; preds = %for.body.preheader.split.split.split
  %S7_D = add <2 x i64> %S6_D, <i64 -1, i64 -1>
  %extractS9_D = extractelement <2 x i64> %S7_D, i32 1
  %SFS7_D = shufflevector <2 x i64> %S7_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13018 = icmp ne <2 x i64> %S7_D, %SFS7_D
  %16 = sext <2 x i1> %EDCV0x7fffd3a9d13018 to <2 x i64>
  %17 = bitcast <2 x i64> %16 to i128
  %18 = icmp ne i128 %17, 0
  br i1 %18, label %relExit, label %for.body.preheader.split.split.split.split.split

for.body.preheader.split.split.split.split.split: ; preds = %for.body.preheader.split.split.split.split
  %sextS8_D = sext <2 x i1> %cmp.zeroS5_D to <2 x i64>
  %BCS8_D = bitcast <2 x i64> %sextS8_D to i128
  %mskS8_D = icmp ne i128 %BCS8_D, 0
  br i1 %mskS8_D, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader.split.split.split.split.split
  %scevgep5 = getelementptr double* %r, i64 %extractS9_D
  %splatscevgep5S12_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep5, i32 0
  %splatscevgep5S12_D.splat = shufflevector <2 x double*> %splatscevgep5S12_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %scevgep = getelementptr double* %g, i64 %extractS9_D
  %splatscevgepS11_D.splatinsert = insertelement <2 x double*> undef, double* %scevgep, i32 0
  %splatscevgepS11_D.splat = shufflevector <2 x double*> %splatscevgepS11_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bound1S11_D = icmp uge <2 x double*> %splatscevgepS11_D.splat, %splatS11_D.splat
  %SFS11_D = shufflevector <2 x i1> %bound1S11_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13021 = icmp ne <2 x i1> %bound1S11_D, %SFS11_D
  %19 = bitcast <2 x i1> %EDCV0x7fffd3a9d13021 to i2
  %20 = icmp ne i2 %19, 0
  br i1 %20, label %relExit, label %vector.memcheck.split

vector.memcheck.split:                            ; preds = %vector.memcheck
  %bound0S12_D = icmp uge <2 x double*> %splatscevgep5S12_D.splat, %splatS12_D.splat
  %SFS12_D = shufflevector <2 x i1> %bound0S12_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13024 = icmp ne <2 x i1> %bound0S12_D, %SFS12_D
  %21 = bitcast <2 x i1> %EDCV0x7fffd3a9d13024 to i2
  %22 = icmp ne i2 %21, 0
  br i1 %22, label %relExit, label %vector.memcheck.split.split

vector.memcheck.split.split:                      ; preds = %vector.memcheck.split
  %memcheck.conflictS13_D = and <2 x i1> %bound0S12_D, %bound1S11_D
  %SFS13_D = shufflevector <2 x i1> %memcheck.conflictS13_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13025 = icmp ne <2 x i1> %memcheck.conflictS13_D, %SFS13_D
  %23 = bitcast <2 x i1> %EDCV0x7fffd3a9d13025 to i2
  %24 = icmp ne i2 %23, 0
  br i1 %24, label %relExit, label %vector.memcheck.split.split.split

vector.memcheck.split.split.split:                ; preds = %vector.memcheck.split.split
  %sextS14_D = sext <2 x i1> %memcheck.conflictS13_D to <2 x i64>
  %BCS14_D = bitcast <2 x i64> %sextS14_D to i128
  %mskS14_D = icmp ne i128 %BCS14_D, 0
  br i1 %mskS14_D, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body.split.split.split.split, %vector.memcheck.split.split.split
  %VPhiS15_D = phi <2 x i64> [ %index.nextS30_D, %vector.body.split.split.split.split ], [ zeroinitializer, %vector.memcheck.split.split.split ]
  %extractS16_D = extractelement <2 x i64> %VPhiS15_D, i32 1
  %25 = getelementptr inbounds double* %r, i64 %extractS16_D
  %splatS17_D.splatinsert = insertelement <2 x double*> undef, double* %25, i32 0
  %splatS17_D.splat = shufflevector <2 x double*> %splatS17_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS17_D = bitcast <2 x double*> %splatS17_D.splat to <2 x <2 x double>*>
  %extbitcastS17_D = extractelement <2 x <2 x double>*> %bitcastS17_D, i32 1
  %wide.load = load <2 x double>* %extbitcastS17_D, align 8
  %shuffleS18_D = shufflevector <2 x double> %wide.load, <2 x double> %wide.load, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %shuffleS25_D = shufflevector <4 x double> %shuffleS18_D, <4 x double> %shuffleS18_D, <2 x i32> <i32 0, i32 1>
  %.sum11S19_D = or <2 x i64> %VPhiS15_D, <i64 2, i64 2>
  %extractS20_D = extractelement <2 x i64> %.sum11S19_D, i32 1
  %SFS19_D = shufflevector <2 x i64> %.sum11S19_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13028 = icmp ne <2 x i64> %.sum11S19_D, %SFS19_D
  %26 = sext <2 x i1> %EDCV0x7fffd3a9d13028 to <2 x i64>
  %27 = bitcast <2 x i64> %26 to i128
  %28 = icmp ne i128 %27, 0
  br i1 %28, label %relExit, label %vector.body.split

vector.body.split:                                ; preds = %vector.body
  %29 = getelementptr double* %r, i64 %extractS20_D
  %splatS21_D.splatinsert = insertelement <2 x double*> undef, double* %29, i32 0
  %splatS21_D.splat = shufflevector <2 x double*> %splatS21_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS21_D = bitcast <2 x double*> %splatS21_D.splat to <2 x <2 x double>*>
  %extbitcastS21_D = extractelement <2 x <2 x double>*> %bitcastS21_D, i32 1
  %wide.load8 = load <2 x double>* %extbitcastS21_D, align 8
  %shuffleS22_D = shufflevector <2 x double> %wide.load8, <2 x double> %wide.load8, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %shuffleS29_D = shufflevector <4 x double> %shuffleS22_D, <4 x double> %shuffleS22_D, <2 x i32> <i32 0, i32 1>
  %30 = getelementptr inbounds double* %g, i64 %extractS16_D
  %splatS24_D.splatinsert = insertelement <2 x double*> undef, double* %30, i32 0
  %splatS24_D.splat = shufflevector <2 x double*> %splatS24_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS24_D = bitcast <2 x double*> %splatS24_D.splat to <2 x <2 x double>*>
  %extbitcastS24_D = extractelement <2 x <2 x double>*> %bitcastS24_D, i32 1
  store <2 x double> %shuffleS25_D, <2 x double>* %extbitcastS24_D, align 8
  %.sum12S26_D = or <2 x i64> %VPhiS15_D, <i64 2, i64 2>
  %extractS27_D = extractelement <2 x i64> %.sum12S26_D, i32 1
  %SFS26_D = shufflevector <2 x i64> %.sum12S26_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13033 = icmp ne <2 x i64> %.sum12S26_D, %SFS26_D
  %31 = sext <2 x i1> %EDCV0x7fffd3a9d13033 to <2 x i64>
  %32 = bitcast <2 x i64> %31 to i128
  %33 = icmp ne i128 %32, 0
  br i1 %33, label %relExit, label %vector.body.split.split

vector.body.split.split:                          ; preds = %vector.body.split
  %34 = getelementptr double* %g, i64 %extractS27_D
  %splatS28_D.splatinsert = insertelement <2 x double*> undef, double* %34, i32 0
  %splatS28_D.splat = shufflevector <2 x double*> %splatS28_D.splatinsert, <2 x double*> undef, <2 x i32> zeroinitializer
  %bitcastS28_D = bitcast <2 x double*> %splatS28_D.splat to <2 x <2 x double>*>
  %extbitcastS28_D = extractelement <2 x <2 x double>*> %bitcastS28_D, i32 1
  store <2 x double> %shuffleS29_D, <2 x double>* %extbitcastS28_D, align 8
  %index.nextS30_D = add <2 x i64> %VPhiS15_D, <i64 4, i64 4>
  %SFS30_D = shufflevector <2 x i64> %index.nextS30_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13036 = icmp ne <2 x i64> %index.nextS30_D, %SFS30_D
  %35 = sext <2 x i1> %EDCV0x7fffd3a9d13036 to <2 x i64>
  %36 = bitcast <2 x i64> %35 to i128
  %37 = icmp ne i128 %36, 0
  br i1 %37, label %relExit, label %vector.body.split.split.split

vector.body.split.split.split:                    ; preds = %vector.body.split.split
  %S31_D = icmp eq <2 x i64> %index.nextS30_D, %n.vecS4_D
  %SFS31_D = shufflevector <2 x i1> %S31_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13037 = icmp ne <2 x i1> %S31_D, %SFS31_D
  %38 = bitcast <2 x i1> %EDCV0x7fffd3a9d13037 to i2
  %39 = icmp ne i2 %38, 0
  br i1 %39, label %relExit, label %vector.body.split.split.split.split

vector.body.split.split.split.split:              ; preds = %vector.body.split.split.split
  %sextS32_D = sext <2 x i1> %S31_D to <2 x i64>
  %BCS32_D = bitcast <2 x i64> %sextS32_D to i128
  %mskS32_D = icmp ne i128 %BCS32_D, 0
  br i1 %mskS32_D, label %middle.block, label %vector.body, !llvm.loop !19

middle.block:                                     ; preds = %vector.body.split.split.split.split, %vector.memcheck.split.split.split, %for.body.preheader.split.split.split.split.split
  %VPhiS33_D = phi <2 x i64> [ zeroinitializer, %for.body.preheader.split.split.split.split.split ], [ zeroinitializer, %vector.memcheck.split.split.split ], [ %n.vecS4_D, %vector.body.split.split.split.split ]
  %cmp.nS34_D = icmp eq <2 x i64> %S3_D, %VPhiS33_D
  %SFS34_D = shufflevector <2 x i1> %cmp.nS34_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13038 = icmp ne <2 x i1> %cmp.nS34_D, %SFS34_D
  %40 = bitcast <2 x i1> %EDCV0x7fffd3a9d13038 to i2
  %41 = icmp ne i2 %40, 0
  br i1 %41, label %relExit, label %middle.block.split

middle.block.split:                               ; preds = %middle.block
  %sextS35_D = sext <2 x i1> %cmp.nS34_D to <2 x i64>
  %BCS35_D = bitcast <2 x i64> %sextS35_D to i128
  %mskS35_D = icmp ne i128 %BCS35_D, 0
  br i1 %mskS35_D, label %for.cond3.preheader, label %for.body

for.cond3.preheader:                              ; preds = %for.body.split.split, %middle.block.split
  %cmp5329S36_D = icmp sgt <2 x i32> %splatS0_D.splat, <i32 1, i32 1>
  %SFS36_D = shufflevector <2 x i1> %cmp5329S36_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13039 = icmp ne <2 x i1> %cmp5329S36_D, %SFS36_D
  %42 = bitcast <2 x i1> %EDCV0x7fffd3a9d13039 to i2
  %43 = icmp ne i2 %42, 0
  br i1 %43, label %relExit, label %for.cond3.preheader.split

for.cond3.preheader.split:                        ; preds = %for.cond3.preheader
  %sextS37_D = sext <2 x i1> %cmp5329S36_D to <2 x i64>
  %BCS37_D = bitcast <2 x i64> %sextS37_D to i128
  %mskS37_D = icmp ne i128 %BCS37_D, 0
  br i1 %mskS37_D, label %for.body7.lr.ph, label %for.end109

for.body7.lr.ph:                                  ; preds = %for.cond3.preheader.split
  %arrayidx11 = getelementptr inbounds [40 x double]* %a, i64 0, i64 0
  br label %for.body7

for.body:                                         ; preds = %for.body.split.split, %middle.block.split
  %VPhiS40_D = phi <2 x i64> [ %incS45_D, %for.body.split.split ], [ %VPhiS33_D, %middle.block.split ]
  %extractS41_D = extractelement <2 x i64> %VPhiS40_D, i32 1
  %arrayidx = getelementptr inbounds double* %r, i64 %extractS41_D
  %44 = load double* %arrayidx, align 8, !tbaa !1
  %splatS42_D.splatinsert = insertelement <2 x double> undef, double %44, i32 0
  %splatS42_D.splat = shufflevector <2 x double> %splatS42_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %extractS44_D = extractelement <2 x double> %splatS42_D.splat, i32 1
  %arrayidx2 = getelementptr inbounds double* %g, i64 %extractS41_D
  store double %extractS44_D, double* %arrayidx2, align 8
  %incS45_D = add <2 x i64> %VPhiS40_D, <i64 1, i64 1>
  %SFS45_D = shufflevector <2 x i64> %incS45_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13040 = icmp ne <2 x i64> %incS45_D, %SFS45_D
  %45 = sext <2 x i1> %EDCV0x7fffd3a9d13040 to <2 x i64>
  %46 = bitcast <2 x i64> %45 to i128
  %47 = icmp ne i128 %46, 0
  br i1 %47, label %relExit, label %for.body.split

for.body.split:                                   ; preds = %for.body
  %exitcond354S46_D = icmp eq <2 x i64> %incS45_D, %convS0_D
  %SFS46_D = shufflevector <2 x i1> %exitcond354S46_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13041 = icmp ne <2 x i1> %exitcond354S46_D, %SFS46_D
  %48 = bitcast <2 x i1> %EDCV0x7fffd3a9d13041 to i2
  %49 = icmp ne i2 %48, 0
  br i1 %49, label %relExit, label %for.body.split.split

for.body.split.split:                             ; preds = %for.body.split
  %sextS47_D = sext <2 x i1> %exitcond354S46_D to <2 x i64>
  %BCS47_D = bitcast <2 x i64> %sextS47_D to i128
  %mskS47_D = icmp ne i128 %BCS47_D, 0
  br i1 %mskS47_D, label %for.cond3.preheader, label %for.body, !llvm.loop !20

for.body7:                                        ; preds = %for.body7.split.split.split, %for.body7.lr.ph
  %VPhiS48_D = phi <2 x i64> [ <i64 1, i64 1>, %for.body7.lr.ph ], [ %inc15S54_D, %for.body7.split.split.split ]
  %extractS49_D = extractelement <2 x i64> %VPhiS48_D, i32 1
  %arrayidx9 = getelementptr inbounds [40 x double]* %a, i64 %extractS49_D, i64 0
  %50 = load double* %arrayidx9, align 8, !tbaa !1
  %splatS50_D.splatinsert = insertelement <2 x double> undef, double %50, i32 0
  %splatS50_D.splat = shufflevector <2 x double> %splatS50_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = load double* %arrayidx11, align 8, !tbaa !1
  %splatS51_D.splatinsert = insertelement <2 x double> undef, double %51, i32 0
  %splatS51_D.splat = shufflevector <2 x double> %splatS51_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %divS52_D = fdiv <2 x double> %splatS50_D.splat, %splatS51_D.splat
  %extractS53_D = extractelement <2 x double> %divS52_D, i32 1
  %SFS52_D = shufflevector <2 x double> %divS52_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13042 = fcmp one <2 x double> %divS52_D, %SFS52_D
  %52 = sext <2 x i1> %EDCV0x7fffd3a9d13042 to <2 x i64>
  %53 = bitcast <2 x i64> %52 to i128
  %54 = icmp ne i128 %53, 0
  br i1 %54, label %relExit, label %for.body7.split

for.body7.split:                                  ; preds = %for.body7
  store double %extractS53_D, double* %arrayidx9, align 8
  %inc15S54_D = add <2 x i64> %VPhiS48_D, <i64 1, i64 1>
  %SFS54_D = shufflevector <2 x i64> %inc15S54_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13043 = icmp ne <2 x i64> %inc15S54_D, %SFS54_D
  %55 = sext <2 x i1> %EDCV0x7fffd3a9d13043 to <2 x i64>
  %56 = bitcast <2 x i64> %55 to i128
  %57 = icmp ne i128 %56, 0
  br i1 %57, label %relExit, label %for.body7.split.split

for.body7.split.split:                            ; preds = %for.body7.split
  %exitcond353S55_D = icmp eq <2 x i64> %inc15S54_D, %convS0_D
  %SFS55_D = shufflevector <2 x i1> %exitcond353S55_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13044 = icmp ne <2 x i1> %exitcond353S55_D, %SFS55_D
  %58 = bitcast <2 x i1> %EDCV0x7fffd3a9d13044 to i2
  %59 = icmp ne i2 %58, 0
  br i1 %59, label %relExit, label %for.body7.split.split.split

for.body7.split.split.split:                      ; preds = %for.body7.split.split
  %sextS56_D = sext <2 x i1> %exitcond353S55_D to <2 x i64>
  %BCS56_D = bitcast <2 x i64> %sextS56_D to i128
  %mskS56_D = icmp ne i128 %BCS56_D, 0
  br i1 %mskS56_D, label %for.body25.lr.ph, label %for.body7

for.cond17.loopexit:                              ; preds = %for.end73.us.split.split, %for.end32.split.split
  %exitcond352S57_D = icmp eq <2 x i64> %indvars.iv.next349S57_D, %convS0_D
  %SFS57_D = shufflevector <2 x i1> %exitcond352S57_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13049 = icmp ne <2 x i1> %exitcond352S57_D, %SFS57_D
  %60 = bitcast <2 x i1> %EDCV0x7fffd3a9d13049 to i2
  %61 = icmp ne i2 %60, 0
  br i1 %61, label %relExit, label %for.cond17.loopexit.split

for.cond17.loopexit.split:                        ; preds = %for.cond17.loopexit
  %sextS58_D = sext <2 x i1> %exitcond352S57_D to <2 x i64>
  %BCS58_D = bitcast <2 x i64> %sextS58_D to i128
  %mskS58_D = icmp ne i128 %BCS58_D, 0
  br i1 %mskS58_D, label %for.body96.lr.ph, label %for.body25.lr.ph

for.body25.lr.ph:                                 ; preds = %for.cond17.loopexit.split, %for.body7.split.split.split
  %VPhiindvars.iv348S57_D = phi <2 x i64> [ %indvars.iv.next349S57_D, %for.cond17.loopexit.split ], [ <i64 1, i64 1>, %for.body7.split.split.split ]
  %extractS62_D = extractelement <2 x i64> %VPhiindvars.iv348S57_D, i32 1
  br label %for.body25

for.body25:                                       ; preds = %for.body25.split.split.split.split, %for.body25.lr.ph
  %VPhiS60_D = phi <2 x double> [ zeroinitializer, %for.body25.lr.ph ], [ %addS67_D, %for.body25.split.split.split.split ]
  %VPhiS61_D = phi <2 x i64> [ zeroinitializer, %for.body25.lr.ph ], [ %inc31S68_D, %for.body25.split.split.split.split ]
  %extractS62_D50 = extractelement <2 x i64> %VPhiS61_D, i32 1
  %arrayidx27 = getelementptr inbounds [40 x double]* %a, i64 %extractS62_D, i64 %extractS62_D50
  %62 = load double* %arrayidx27, align 8, !tbaa !1
  %splatS63_D.splatinsert = insertelement <2 x double> undef, double %62, i32 0
  %splatS63_D.splat = shufflevector <2 x double> %splatS63_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx29 = getelementptr inbounds [40 x double]* %a, i64 %extractS62_D50, i64 %extractS62_D
  %63 = load double* %arrayidx29, align 8, !tbaa !1
  %splatS65_D.splatinsert = insertelement <2 x double> undef, double %63, i32 0
  %splatS65_D.splat = shufflevector <2 x double> %splatS65_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mulS66_D = fmul <2 x double> %splatS63_D.splat, %splatS65_D.splat
  %SFS66_D = shufflevector <2 x double> %mulS66_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13051 = fcmp one <2 x double> %mulS66_D, %SFS66_D
  %64 = sext <2 x i1> %EDCV0x7fffd3a9d13051 to <2 x i64>
  %65 = bitcast <2 x i64> %64 to i128
  %66 = icmp ne i128 %65, 0
  br i1 %66, label %relExit, label %for.body25.split

for.body25.split:                                 ; preds = %for.body25
  %addS67_D = fadd <2 x double> %VPhiS60_D, %mulS66_D
  %SFS67_D = shufflevector <2 x double> %addS67_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13052 = fcmp one <2 x double> %addS67_D, %SFS67_D
  %67 = sext <2 x i1> %EDCV0x7fffd3a9d13052 to <2 x i64>
  %68 = bitcast <2 x i64> %67 to i128
  %69 = icmp ne i128 %68, 0
  br i1 %69, label %relExit, label %for.body25.split.split

for.body25.split.split:                           ; preds = %for.body25.split
  %inc31S68_D = add <2 x i64> %VPhiS61_D, <i64 1, i64 1>
  %SFS68_D = shufflevector <2 x i64> %inc31S68_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13053 = icmp ne <2 x i64> %inc31S68_D, %SFS68_D
  %70 = sext <2 x i1> %EDCV0x7fffd3a9d13053 to <2 x i64>
  %71 = bitcast <2 x i64> %70 to i128
  %72 = icmp ne i128 %71, 0
  br i1 %72, label %relExit, label %for.body25.split.split.split

for.body25.split.split.split:                     ; preds = %for.body25.split.split
  %exitcond339S69_D = icmp eq <2 x i64> %inc31S68_D, %VPhiindvars.iv348S57_D
  %SFS69_D = shufflevector <2 x i1> %exitcond339S69_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13054 = icmp ne <2 x i1> %exitcond339S69_D, %SFS69_D
  %73 = bitcast <2 x i1> %EDCV0x7fffd3a9d13054 to i2
  %74 = icmp ne i2 %73, 0
  br i1 %74, label %relExit, label %for.body25.split.split.split.split

for.body25.split.split.split.split:               ; preds = %for.body25.split.split.split
  %sextS70_D = sext <2 x i1> %exitcond339S69_D to <2 x i64>
  %BCS70_D = bitcast <2 x i64> %sextS70_D to i128
  %mskS70_D = icmp ne i128 %BCS70_D, 0
  br i1 %mskS70_D, label %for.end32, label %for.body25

for.end32:                                        ; preds = %for.body25.split.split.split.split
  %arrayidx34 = getelementptr inbounds [40 x double]* %a, i64 %extractS62_D, i64 %extractS62_D
  %75 = load double* %arrayidx34, align 8, !tbaa !1
  %splatS72_D.splatinsert = insertelement <2 x double> undef, double %75, i32 0
  %splatS72_D.splat = shufflevector <2 x double> %splatS72_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %subS73_D = fsub <2 x double> %splatS72_D.splat, %addS67_D
  %extractS74_D = extractelement <2 x double> %subS73_D, i32 1
  %SFS73_D = shufflevector <2 x double> %subS73_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13055 = fcmp one <2 x double> %subS73_D, %SFS73_D
  %76 = sext <2 x i1> %EDCV0x7fffd3a9d13055 to <2 x i64>
  %77 = bitcast <2 x i64> %76 to i128
  %78 = icmp ne i128 %77, 0
  br i1 %78, label %relExit, label %for.end32.split

for.end32.split:                                  ; preds = %for.end32
  store double %extractS74_D, double* %arrayidx34, align 8
  %indvars.iv.next349S57_D = add <2 x i64> %VPhiindvars.iv348S57_D, <i64 1, i64 1>
  %cmp40286S75_D = icmp slt <2 x i64> %indvars.iv.next349S57_D, %convS0_D
  %SFS75_D = shufflevector <2 x i1> %cmp40286S75_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13056 = icmp ne <2 x i1> %cmp40286S75_D, %SFS75_D
  %79 = bitcast <2 x i1> %EDCV0x7fffd3a9d13056 to i2
  %80 = icmp ne i2 %79, 0
  br i1 %80, label %relExit, label %for.end32.split.split

for.end32.split.split:                            ; preds = %for.end32.split
  %sextS76_D = sext <2 x i1> %cmp40286S75_D to <2 x i64>
  %BCS76_D = bitcast <2 x i64> %sextS76_D to i128
  %mskS76_D = icmp ne i128 %BCS76_D, 0
  br i1 %mskS76_D, label %for.body46.lr.ph.us, label %for.cond17.loopexit

for.end73.us:                                     ; preds = %for.body64.us.split.split
  %arrayidx75.us = getelementptr inbounds [40 x double]* %a, i64 %extractS87_D, i64 %extractS62_D
  %81 = load double* %arrayidx75.us, align 8, !tbaa !1
  %splatS78_D.splatinsert = insertelement <2 x double> undef, double %81, i32 0
  %splatS78_D.splat = shufflevector <2 x double> %splatS78_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %sub76.usS79_D = fsub <2 x double> %splatS78_D.splat, %add70.usS79_D
  %SFS79_D = shufflevector <2 x double> %sub76.usS79_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13069 = fcmp one <2 x double> %sub76.usS79_D, %SFS79_D
  %82 = sext <2 x i1> %EDCV0x7fffd3a9d13069 to <2 x i64>
  %83 = bitcast <2 x i64> %82 to i128
  %84 = icmp ne i128 %83, 0
  br i1 %84, label %relExit, label %for.end73.us.split104

for.end73.us.split104:                            ; preds = %for.end73.us
  %85 = load double* %arrayidx34, align 8, !tbaa !1
  %splatS80_D.splatinsert = insertelement <2 x double> undef, double %85, i32 0
  %splatS80_D.splat = shufflevector <2 x double> %splatS80_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %div79.usS81_D = fdiv <2 x double> %sub76.usS79_D, %splatS80_D.splat
  %extractS82_D = extractelement <2 x double> %div79.usS81_D, i32 1
  %SFS81_D = shufflevector <2 x double> %div79.usS81_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13070 = fcmp one <2 x double> %div79.usS81_D, %SFS81_D
  %86 = sext <2 x i1> %EDCV0x7fffd3a9d13070 to <2 x i64>
  %87 = bitcast <2 x i64> %86 to i128
  %88 = icmp ne i128 %87, 0
  br i1 %88, label %relExit, label %for.end73.us.split

for.end73.us.split:                               ; preds = %for.end73.us.split104
  store double %extractS82_D, double* %arrayidx75.us, align 8
  %inc83.usS83_D = add <2 x i64> %VPhij.0287.usS83_D, <i64 1, i64 1>
  %SFS83_D = shufflevector <2 x i64> %inc83.usS83_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13073 = icmp ne <2 x i64> %inc83.usS83_D, %SFS83_D
  %89 = sext <2 x i1> %EDCV0x7fffd3a9d13073 to <2 x i64>
  %90 = bitcast <2 x i64> %89 to i128
  %91 = icmp ne i128 %90, 0
  br i1 %91, label %relExit, label %for.end73.us.split.split105

for.end73.us.split.split105:                      ; preds = %for.end73.us.split
  %exitcond347S84_D = icmp eq <2 x i64> %inc83.usS83_D, %convS0_D
  %SFS84_D = shufflevector <2 x i1> %exitcond347S84_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13074 = icmp ne <2 x i1> %exitcond347S84_D, %SFS84_D
  %92 = bitcast <2 x i1> %EDCV0x7fffd3a9d13074 to i2
  %93 = icmp ne i2 %92, 0
  br i1 %93, label %relExit, label %for.end73.us.split.split

for.end73.us.split.split:                         ; preds = %for.end73.us.split.split105
  %sextS85_D = sext <2 x i1> %exitcond347S84_D to <2 x i64>
  %BCS85_D = bitcast <2 x i64> %sextS85_D to i128
  %mskS85_D = icmp ne i128 %BCS85_D, 0
  br i1 %mskS85_D, label %for.cond17.loopexit, label %for.body46.lr.ph.us

for.body64.us:                                    ; preds = %for.body64.lr.ph.us.split, %for.body64.us.split.split
  %VPhifdot.2284.usS79_D = phi <2 x double> [ zeroinitializer, %for.body64.lr.ph.us.split ], [ %add70.usS79_D, %for.body64.us.split.split ]
  %VPhiS86_D = phi <2 x i64> [ zeroinitializer, %for.body64.lr.ph.us.split ], [ %inc72.usS89_D, %for.body64.us.split.split ]
  %extractS87_D75 = extractelement <2 x i64> %VPhiS86_D, i32 1
  %arrayidx66.us = getelementptr inbounds [40 x double]* %a, i64 %extractS87_D, i64 %extractS87_D75
  %94 = load double* %arrayidx66.us, align 8, !tbaa !1
  %splatS79_D.splatinsert = insertelement <2 x double> undef, double %94, i32 0
  %splatS79_D.splat = shufflevector <2 x double> %splatS79_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx68.us = getelementptr inbounds [40 x double]* %a, i64 %extractS87_D75, i64 %extractS62_D
  %95 = load double* %arrayidx68.us, align 8, !tbaa !1
  %splatS79_D.splatinsert67 = insertelement <2 x double> undef, double %95, i32 0
  %splatS79_D.splat68 = shufflevector <2 x double> %splatS79_D.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  %mul69.usS79_D = fmul <2 x double> %splatS79_D.splat, %splatS79_D.splat68
  %add70.usS79_D = fadd <2 x double> %VPhifdot.2284.usS79_D, %mul69.usS79_D
  %inc72.usS89_D = add <2 x i64> %VPhiS86_D, <i64 1, i64 1>
  %SFS89_D = shufflevector <2 x i64> %inc72.usS89_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13076 = icmp ne <2 x i64> %inc72.usS89_D, %SFS89_D
  %96 = sext <2 x i1> %EDCV0x7fffd3a9d13076 to <2 x i64>
  %97 = bitcast <2 x i64> %96 to i128
  %98 = icmp ne i128 %97, 0
  br i1 %98, label %relExit, label %for.body64.us.split

for.body64.us.split:                              ; preds = %for.body64.us
  %exitcond346S90_D = icmp eq <2 x i64> %inc72.usS89_D, %VPhiindvars.iv348S57_D
  %SFS90_D = shufflevector <2 x i1> %exitcond346S90_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13077 = icmp ne <2 x i1> %exitcond346S90_D, %SFS90_D
  %99 = bitcast <2 x i1> %EDCV0x7fffd3a9d13077 to i2
  %100 = icmp ne i2 %99, 0
  br i1 %100, label %relExit, label %for.body64.us.split.split

for.body64.us.split.split:                        ; preds = %for.body64.us.split
  %sextS91_D = sext <2 x i1> %exitcond346S90_D to <2 x i64>
  %BCS91_D = bitcast <2 x i64> %sextS91_D to i128
  %mskS91_D = icmp ne i128 %BCS91_D, 0
  br i1 %mskS91_D, label %for.end73.us, label %for.body64.us

for.body46.us:                                    ; preds = %for.body46.lr.ph.us, %for.body46.us.split.split.split.split
  %VPhiS92_D = phi <2 x double> [ zeroinitializer, %for.body46.lr.ph.us ], [ %add52.usS99_D, %for.body46.us.split.split.split.split ]
  %VPhiS93_D = phi <2 x i64> [ zeroinitializer, %for.body46.lr.ph.us ], [ %inc54.usS100_D, %for.body46.us.split.split.split.split ]
  %extractS94_D = extractelement <2 x i64> %VPhiS93_D, i32 1
  %arrayidx48.us = getelementptr inbounds [40 x double]* %a, i64 %extractS62_D, i64 %extractS94_D
  %101 = load double* %arrayidx48.us, align 8, !tbaa !1
  %splatS95_D.splatinsert = insertelement <2 x double> undef, double %101, i32 0
  %splatS95_D.splat = shufflevector <2 x double> %splatS95_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx50.us = getelementptr inbounds [40 x double]* %a, i64 %extractS94_D, i64 %extractS87_D
  %102 = load double* %arrayidx50.us, align 8, !tbaa !1
  %splatS97_D.splatinsert = insertelement <2 x double> undef, double %102, i32 0
  %splatS97_D.splat = shufflevector <2 x double> %splatS97_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul51.usS98_D = fmul <2 x double> %splatS95_D.splat, %splatS97_D.splat
  %SFS98_D = shufflevector <2 x double> %mul51.usS98_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13078 = fcmp one <2 x double> %mul51.usS98_D, %SFS98_D
  %103 = sext <2 x i1> %EDCV0x7fffd3a9d13078 to <2 x i64>
  %104 = bitcast <2 x i64> %103 to i128
  %105 = icmp ne i128 %104, 0
  br i1 %105, label %relExit, label %for.body46.us.split

for.body46.us.split:                              ; preds = %for.body46.us
  %add52.usS99_D = fadd <2 x double> %VPhiS92_D, %mul51.usS98_D
  %SFS99_D = shufflevector <2 x double> %add52.usS99_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13079 = fcmp one <2 x double> %add52.usS99_D, %SFS99_D
  %106 = sext <2 x i1> %EDCV0x7fffd3a9d13079 to <2 x i64>
  %107 = bitcast <2 x i64> %106 to i128
  %108 = icmp ne i128 %107, 0
  br i1 %108, label %relExit, label %for.body46.us.split.split

for.body46.us.split.split:                        ; preds = %for.body46.us.split
  %inc54.usS100_D = add <2 x i64> %VPhiS93_D, <i64 1, i64 1>
  %SFS100_D = shufflevector <2 x i64> %inc54.usS100_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13080 = icmp ne <2 x i64> %inc54.usS100_D, %SFS100_D
  %109 = sext <2 x i1> %EDCV0x7fffd3a9d13080 to <2 x i64>
  %110 = bitcast <2 x i64> %109 to i128
  %111 = icmp ne i128 %110, 0
  br i1 %111, label %relExit, label %for.body46.us.split.split.split

for.body46.us.split.split.split:                  ; preds = %for.body46.us.split.split
  %exitcond343S101_D = icmp eq <2 x i64> %inc54.usS100_D, %VPhiindvars.iv348S57_D
  %SFS101_D = shufflevector <2 x i1> %exitcond343S101_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13081 = icmp ne <2 x i1> %exitcond343S101_D, %SFS101_D
  %112 = bitcast <2 x i1> %EDCV0x7fffd3a9d13081 to i2
  %113 = icmp ne i2 %112, 0
  br i1 %113, label %relExit, label %for.body46.us.split.split.split.split

for.body46.us.split.split.split.split:            ; preds = %for.body46.us.split.split.split
  %sextS102_D = sext <2 x i1> %exitcond343S101_D to <2 x i64>
  %BCS102_D = bitcast <2 x i64> %sextS102_D to i128
  %mskS102_D = icmp ne i128 %BCS102_D, 0
  br i1 %mskS102_D, label %for.body64.lr.ph.us, label %for.body46.us

for.body46.lr.ph.us:                              ; preds = %for.end73.us.split.split, %for.end32.split.split
  %VPhij.0287.usS83_D = phi <2 x i64> [ %inc83.usS83_D, %for.end73.us.split.split ], [ %indvars.iv.next349S57_D, %for.end32.split.split ]
  %extractS87_D = extractelement <2 x i64> %VPhij.0287.usS83_D, i32 1
  br label %for.body46.us

for.body64.lr.ph.us:                              ; preds = %for.body46.us.split.split.split.split
  %arrayidx57.us = getelementptr inbounds [40 x double]* %a, i64 %extractS62_D, i64 %extractS87_D
  %114 = load double* %arrayidx57.us, align 8, !tbaa !1
  %splatS105_D.splatinsert = insertelement <2 x double> undef, double %114, i32 0
  %splatS105_D.splat = shufflevector <2 x double> %splatS105_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %sub58.usS106_D = fsub <2 x double> %splatS105_D.splat, %add52.usS99_D
  %extractS107_D = extractelement <2 x double> %sub58.usS106_D, i32 1
  %SFS106_D = shufflevector <2 x double> %sub58.usS106_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13082 = fcmp one <2 x double> %sub58.usS106_D, %SFS106_D
  %115 = sext <2 x i1> %EDCV0x7fffd3a9d13082 to <2 x i64>
  %116 = bitcast <2 x i64> %115 to i128
  %117 = icmp ne i128 %116, 0
  br i1 %117, label %relExit, label %for.body64.lr.ph.us.split

for.body64.lr.ph.us.split:                        ; preds = %for.body64.lr.ph.us
  store double %extractS107_D, double* %arrayidx57.us, align 8
  br label %for.body64.us

for.body96.lr.ph:                                 ; preds = %for.inc107.split, %for.cond17.loopexit.split
  %VPhiS109_D = phi <2 x i64> [ %indvars.iv.nextS125_D, %for.inc107.split ], [ <i64 1, i64 1>, %for.cond17.loopexit.split ]
  %extractS110_D = extractelement <2 x i64> %VPhiS109_D, i32 1
  %arrayidx97 = getelementptr inbounds double* %g, i64 %extractS110_D
  %.pre = load double* %arrayidx97, align 8, !tbaa !1
  %splatS111_D.splatinsert = insertelement <2 x double> undef, double %.pre, i32 0
  %splatS111_D.splat = shufflevector <2 x double> %splatS111_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body96

for.body96:                                       ; preds = %for.body96.split.split.split.split, %for.body96.lr.ph
  %VPhiS113_D = phi <2 x double> [ %splatS111_D.splat, %for.body96.lr.ph ], [ %sub102S120_D, %for.body96.split.split.split.split ]
  %VPhiS114_D = phi <2 x i64> [ zeroinitializer, %for.body96.lr.ph ], [ %inc105S122_D, %for.body96.split.split.split.split ]
  %extractS115_D = extractelement <2 x i64> %VPhiS114_D, i32 1
  %arrayidx99 = getelementptr inbounds [40 x double]* %a, i64 %extractS110_D, i64 %extractS115_D
  %118 = load double* %arrayidx99, align 8, !tbaa !1
  %splatS116_D.splatinsert = insertelement <2 x double> undef, double %118, i32 0
  %splatS116_D.splat = shufflevector <2 x double> %splatS116_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx100 = getelementptr inbounds double* %g, i64 %extractS115_D
  %119 = load double* %arrayidx100, align 8, !tbaa !1
  %splatS118_D.splatinsert = insertelement <2 x double> undef, double %119, i32 0
  %splatS118_D.splat = shufflevector <2 x double> %splatS118_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul101S119_D = fmul <2 x double> %splatS116_D.splat, %splatS118_D.splat
  %SFS119_D = shufflevector <2 x double> %mul101S119_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13083 = fcmp one <2 x double> %mul101S119_D, %SFS119_D
  %120 = sext <2 x i1> %EDCV0x7fffd3a9d13083 to <2 x i64>
  %121 = bitcast <2 x i64> %120 to i128
  %122 = icmp ne i128 %121, 0
  br i1 %122, label %relExit, label %for.body96.split

for.body96.split:                                 ; preds = %for.body96
  %sub102S120_D = fsub <2 x double> %VPhiS113_D, %mul101S119_D
  %extractS121_D = extractelement <2 x double> %sub102S120_D, i32 1
  %SFS120_D = shufflevector <2 x double> %sub102S120_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13084 = fcmp one <2 x double> %sub102S120_D, %SFS120_D
  %123 = sext <2 x i1> %EDCV0x7fffd3a9d13084 to <2 x i64>
  %124 = bitcast <2 x i64> %123 to i128
  %125 = icmp ne i128 %124, 0
  br i1 %125, label %relExit, label %for.body96.split.split

for.body96.split.split:                           ; preds = %for.body96.split
  store double %extractS121_D, double* %arrayidx97, align 8
  %inc105S122_D = add <2 x i64> %VPhiS114_D, <i64 1, i64 1>
  %SFS122_D = shufflevector <2 x i64> %inc105S122_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13085 = icmp ne <2 x i64> %inc105S122_D, %SFS122_D
  %126 = sext <2 x i1> %EDCV0x7fffd3a9d13085 to <2 x i64>
  %127 = bitcast <2 x i64> %126 to i128
  %128 = icmp ne i128 %127, 0
  br i1 %128, label %relExit, label %for.body96.split.split.split

for.body96.split.split.split:                     ; preds = %for.body96.split.split
  %exitcond335S123_D = icmp eq <2 x i64> %inc105S122_D, %VPhiS109_D
  %SFS123_D = shufflevector <2 x i1> %exitcond335S123_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13086 = icmp ne <2 x i1> %exitcond335S123_D, %SFS123_D
  %129 = bitcast <2 x i1> %EDCV0x7fffd3a9d13086 to i2
  %130 = icmp ne i2 %129, 0
  br i1 %130, label %relExit, label %for.body96.split.split.split.split

for.body96.split.split.split.split:               ; preds = %for.body96.split.split.split
  %sextS124_D = sext <2 x i1> %exitcond335S123_D to <2 x i64>
  %BCS124_D = bitcast <2 x i64> %sextS124_D to i128
  %mskS124_D = icmp ne i128 %BCS124_D, 0
  br i1 %mskS124_D, label %for.inc107, label %for.body96

for.inc107:                                       ; preds = %for.body96.split.split.split.split
  %indvars.iv.nextS125_D = add <2 x i64> %VPhiS109_D, <i64 1, i64 1>
  %SFS125_D = shufflevector <2 x i64> %indvars.iv.nextS125_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13087 = icmp ne <2 x i64> %indvars.iv.nextS125_D, %SFS125_D
  %131 = sext <2 x i1> %EDCV0x7fffd3a9d13087 to <2 x i64>
  %132 = bitcast <2 x i64> %131 to i128
  %133 = icmp ne i128 %132, 0
  br i1 %133, label %relExit, label %for.inc107.split106

for.inc107.split106:                              ; preds = %for.inc107
  %exitcond336S126_D = icmp eq <2 x i64> %indvars.iv.nextS125_D, %convS0_D
  %SFS126_D = shufflevector <2 x i1> %exitcond336S126_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13088 = icmp ne <2 x i1> %exitcond336S126_D, %SFS126_D
  %134 = bitcast <2 x i1> %EDCV0x7fffd3a9d13088 to i2
  %135 = icmp ne i2 %134, 0
  br i1 %135, label %relExit, label %for.inc107.split

for.inc107.split:                                 ; preds = %for.inc107.split106
  %sextS127_D = sext <2 x i1> %exitcond336S126_D to <2 x i64>
  %BCS127_D = bitcast <2 x i64> %sextS127_D to i128
  %mskS127_D = icmp ne i128 %BCS127_D, 0
  br i1 %mskS127_D, label %for.end109, label %for.body96.lr.ph

for.end109:                                       ; preds = %for.inc107.split, %for.cond3.preheader.split, %entry.split.split
  %sub110S128_D = add <2 x i32> %splatS0_D.splat, <i32 -1, i32 -1>
  %SFS128_D = shufflevector <2 x i32> %sub110S128_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13089 = icmp ne <2 x i32> %sub110S128_D, %SFS128_D
  %136 = sext <2 x i1> %EDCV0x7fffd3a9d13089 to <2 x i32>
  %137 = bitcast <2 x i32> %136 to i64
  %138 = icmp ne i64 %137, 0
  br i1 %138, label %relExit, label %for.end109.split

for.end109.split:                                 ; preds = %for.end109
  %idxpromS129_D = sext <2 x i32> %sub110S128_D to <2 x i64>
  %extractS130_D = extractelement <2 x i64> %idxpromS129_D, i32 1
  %SFS129_D = shufflevector <2 x i64> %idxpromS129_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13090 = icmp ne <2 x i64> %idxpromS129_D, %SFS129_D
  %139 = sext <2 x i1> %EDCV0x7fffd3a9d13090 to <2 x i64>
  %140 = bitcast <2 x i64> %139 to i128
  %141 = icmp ne i128 %140, 0
  br i1 %141, label %relExit, label %for.end109.split.split

for.end109.split.split:                           ; preds = %for.end109.split
  %arrayidx111 = getelementptr inbounds double* %g, i64 %extractS130_D
  %142 = load double* %arrayidx111, align 8, !tbaa !1
  %splatS131_D.splatinsert = insertelement <2 x double> undef, double %142, i32 0
  %splatS131_D.splat = shufflevector <2 x double> %splatS131_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx117 = getelementptr inbounds [40 x double]* %a, i64 %extractS130_D, i64 %extractS130_D
  %143 = load double* %arrayidx117, align 8, !tbaa !1
  %splatS133_D.splatinsert = insertelement <2 x double> undef, double %143, i32 0
  %splatS133_D.splat = shufflevector <2 x double> %splatS133_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %div118S134_D = fdiv <2 x double> %splatS131_D.splat, %splatS133_D.splat
  %extractS135_D = extractelement <2 x double> %div118S134_D, i32 1
  %SFS134_D = shufflevector <2 x double> %div118S134_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13091 = fcmp one <2 x double> %div118S134_D, %SFS134_D
  %144 = sext <2 x i1> %EDCV0x7fffd3a9d13091 to <2 x i64>
  %145 = bitcast <2 x i64> %144 to i128
  %146 = icmp ne i128 %145, 0
  br i1 %146, label %relExit, label %for.end109.split.split.split

for.end109.split.split.split:                     ; preds = %for.end109.split.split
  store double %extractS135_D, double* %arrayidx111, align 8
  %sub122S136_D = add <2 x i32> %splatS0_D.splat, <i32 -2, i32 -2>
  %SFS136_D = shufflevector <2 x i32> %sub122S136_D, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13092 = icmp ne <2 x i32> %sub122S136_D, %SFS136_D
  %147 = sext <2 x i1> %EDCV0x7fffd3a9d13092 to <2 x i32>
  %148 = bitcast <2 x i32> %147 to i64
  %149 = icmp ne i64 %148, 0
  br i1 %149, label %relExit, label %for.end109.split.split.split.split

for.end109.split.split.split.split:               ; preds = %for.end109.split.split.split
  %cmp125266S137_D = icmp sgt <2 x i32> %sub122S136_D, <i32 -1, i32 -1>
  %SFS137_D = shufflevector <2 x i1> %cmp125266S137_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13093 = icmp ne <2 x i1> %cmp125266S137_D, %SFS137_D
  %150 = bitcast <2 x i1> %EDCV0x7fffd3a9d13093 to i2
  %151 = icmp ne i2 %150, 0
  br i1 %151, label %relExit, label %for.end109.split.split.split.split.split

for.end109.split.split.split.split.split:         ; preds = %for.end109.split.split.split.split
  %sextS138_D = sext <2 x i1> %cmp125266S137_D to <2 x i64>
  %BCS138_D = bitcast <2 x i64> %sextS138_D to i128
  %mskS138_D = icmp ne i128 %BCS138_D, 0
  br i1 %mskS138_D, label %for.cond129.preheader.lr.ph, label %for.end151

for.cond129.preheader.lr.ph:                      ; preds = %for.end109.split.split.split.split.split
  %conv123S139_D = sext <2 x i32> %sub122S136_D to <2 x i64>
  %SFS139_D = shufflevector <2 x i64> %conv123S139_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13094 = icmp ne <2 x i64> %conv123S139_D, %SFS139_D
  %152 = sext <2 x i1> %EDCV0x7fffd3a9d13094 to <2 x i64>
  %153 = bitcast <2 x i64> %152 to i128
  %154 = icmp ne i128 %153, 0
  br i1 %154, label %relExit, label %for.cond129.preheader.lr.ph.split

for.cond129.preheader.lr.ph.split:                ; preds = %for.cond129.preheader.lr.ph
  br label %for.cond129.preheader

for.cond129.preheader:                            ; preds = %for.end143.split.split.split, %for.cond129.preheader.lr.ph.split
  %VPhiS141_D = phi <2 x i64> [ %conv123S139_D, %for.cond129.preheader.lr.ph.split ], [ %sub150S164_D, %for.end143.split.split.split ]
  %extractS144_D = extractelement <2 x i64> %VPhiS141_D, i32 1
  %k.4262S142_D = add <2 x i64> %VPhiS141_D, <i64 1, i64 1>
  %SFS142_D = shufflevector <2 x i64> %k.4262S142_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13095 = icmp ne <2 x i64> %k.4262S142_D, %SFS142_D
  %155 = sext <2 x i1> %EDCV0x7fffd3a9d13095 to <2 x i64>
  %156 = bitcast <2 x i64> %155 to i128
  %157 = icmp ne i128 %156, 0
  br i1 %157, label %relExit, label %for.cond129.preheader.split

for.cond129.preheader.split:                      ; preds = %for.cond129.preheader
  %cmp131263S143_D = icmp slt <2 x i64> %k.4262S142_D, %convS0_D
  %SFS143_D = shufflevector <2 x i1> %cmp131263S143_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13096 = icmp ne <2 x i1> %cmp131263S143_D, %SFS143_D
  %158 = bitcast <2 x i1> %EDCV0x7fffd3a9d13096 to i2
  %159 = icmp ne i2 %158, 0
  br i1 %159, label %relExit, label %for.cond129.preheader.split.split

for.cond129.preheader.split.split:                ; preds = %for.cond129.preheader.split
  %arrayidx134 = getelementptr inbounds double* %g, i64 %extractS144_D
  %160 = load double* %arrayidx134, align 8, !tbaa !1
  %splatS145_D.splatinsert = insertelement <2 x double> undef, double %160, i32 0
  %splatS145_D.splat = shufflevector <2 x double> %splatS145_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %sextS146_D = sext <2 x i1> %cmp131263S143_D to <2 x i64>
  %BCS146_D = bitcast <2 x i64> %sextS146_D to i128
  %mskS146_D = icmp ne i128 %BCS146_D, 0
  br i1 %mskS146_D, label %for.body133, label %for.end143

for.body133:                                      ; preds = %for.body133.split.split.split.split, %for.cond129.preheader.split.split
  %VPhiS147_D = phi <2 x double> [ %sub139S154_D, %for.body133.split.split.split.split ], [ %splatS145_D.splat, %for.cond129.preheader.split.split ]
  %VPhiS148_D = phi <2 x i64> [ %k.4S156_D, %for.body133.split.split.split.split ], [ %k.4262S142_D, %for.cond129.preheader.split.split ]
  %extractS149_D = extractelement <2 x i64> %VPhiS148_D, i32 1
  %arrayidx136 = getelementptr inbounds [40 x double]* %a, i64 %extractS144_D, i64 %extractS149_D
  %161 = load double* %arrayidx136, align 8, !tbaa !1
  %splatS150_D.splatinsert = insertelement <2 x double> undef, double %161, i32 0
  %splatS150_D.splat = shufflevector <2 x double> %splatS150_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %arrayidx137 = getelementptr inbounds double* %g, i64 %extractS149_D
  %162 = load double* %arrayidx137, align 8, !tbaa !1
  %splatS152_D.splatinsert = insertelement <2 x double> undef, double %162, i32 0
  %splatS152_D.splat = shufflevector <2 x double> %splatS152_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %mul138S153_D = fmul <2 x double> %splatS150_D.splat, %splatS152_D.splat
  %SFS153_D = shufflevector <2 x double> %mul138S153_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13097 = fcmp one <2 x double> %mul138S153_D, %SFS153_D
  %163 = sext <2 x i1> %EDCV0x7fffd3a9d13097 to <2 x i64>
  %164 = bitcast <2 x i64> %163 to i128
  %165 = icmp ne i128 %164, 0
  br i1 %165, label %relExit, label %for.body133.split

for.body133.split:                                ; preds = %for.body133
  %sub139S154_D = fsub <2 x double> %VPhiS147_D, %mul138S153_D
  %extractS155_D = extractelement <2 x double> %sub139S154_D, i32 1
  %SFS154_D = shufflevector <2 x double> %sub139S154_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13098 = fcmp one <2 x double> %sub139S154_D, %SFS154_D
  %166 = sext <2 x i1> %EDCV0x7fffd3a9d13098 to <2 x i64>
  %167 = bitcast <2 x i64> %166 to i128
  %168 = icmp ne i128 %167, 0
  br i1 %168, label %relExit, label %for.body133.split.split

for.body133.split.split:                          ; preds = %for.body133.split
  store double %extractS155_D, double* %arrayidx134, align 8
  %k.4S156_D = add <2 x i64> %VPhiS148_D, <i64 1, i64 1>
  %SFS156_D = shufflevector <2 x i64> %k.4S156_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d13099 = icmp ne <2 x i64> %k.4S156_D, %SFS156_D
  %169 = sext <2 x i1> %EDCV0x7fffd3a9d13099 to <2 x i64>
  %170 = bitcast <2 x i64> %169 to i128
  %171 = icmp ne i128 %170, 0
  br i1 %171, label %relExit, label %for.body133.split.split.split

for.body133.split.split.split:                    ; preds = %for.body133.split.split
  %exitcondS157_D = icmp eq <2 x i64> %k.4S156_D, %convS0_D
  %SFS157_D = shufflevector <2 x i1> %exitcondS157_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130100 = icmp ne <2 x i1> %exitcondS157_D, %SFS157_D
  %172 = bitcast <2 x i1> %EDCV0x7fffd3a9d130100 to i2
  %173 = icmp ne i2 %172, 0
  br i1 %173, label %relExit, label %for.body133.split.split.split.split

for.body133.split.split.split.split:              ; preds = %for.body133.split.split.split
  %sextS158_D = sext <2 x i1> %exitcondS157_D to <2 x i64>
  %BCS158_D = bitcast <2 x i64> %sextS158_D to i128
  %mskS158_D = icmp ne i128 %BCS158_D, 0
  br i1 %mskS158_D, label %for.end143, label %for.body133

for.end143:                                       ; preds = %for.body133.split.split.split.split, %for.cond129.preheader.split.split
  %VPhiS159_D = phi <2 x double> [ %splatS145_D.splat, %for.cond129.preheader.split.split ], [ %sub139S154_D, %for.body133.split.split.split.split ]
  %arrayidx146 = getelementptr inbounds [40 x double]* %a, i64 %extractS144_D, i64 %extractS144_D
  %174 = load double* %arrayidx146, align 8, !tbaa !1
  %splatS161_D.splatinsert = insertelement <2 x double> undef, double %174, i32 0
  %splatS161_D.splat = shufflevector <2 x double> %splatS161_D.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  %div147S162_D = fdiv <2 x double> %VPhiS159_D, %splatS161_D.splat
  %extractS163_D = extractelement <2 x double> %div147S162_D, i32 1
  %SFS162_D = shufflevector <2 x double> %div147S162_D, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130101 = fcmp one <2 x double> %div147S162_D, %SFS162_D
  %175 = sext <2 x i1> %EDCV0x7fffd3a9d130101 to <2 x i64>
  %176 = bitcast <2 x i64> %175 to i128
  %177 = icmp ne i128 %176, 0
  br i1 %177, label %relExit, label %for.end143.split

for.end143.split:                                 ; preds = %for.end143
  store double %extractS163_D, double* %arrayidx134, align 8
  %sub150S164_D = add <2 x i64> %VPhiS141_D, <i64 -1, i64 -1>
  %SFS164_D = shufflevector <2 x i64> %sub150S164_D, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130102 = icmp ne <2 x i64> %sub150S164_D, %SFS164_D
  %178 = sext <2 x i1> %EDCV0x7fffd3a9d130102 to <2 x i64>
  %179 = bitcast <2 x i64> %178 to i128
  %180 = icmp ne i128 %179, 0
  br i1 %180, label %relExit, label %for.end143.split.split

for.end143.split.split:                           ; preds = %for.end143.split
  %cmp125S165_D = icmp sgt <2 x i64> %VPhiS141_D, zeroinitializer
  %SFS165_D = shufflevector <2 x i1> %cmp125S165_D, <2 x i1> undef, <2 x i32> <i32 1, i32 0>
  %EDCV0x7fffd3a9d130103 = icmp ne <2 x i1> %cmp125S165_D, %SFS165_D
  %181 = bitcast <2 x i1> %EDCV0x7fffd3a9d130103 to i2
  %182 = icmp ne i2 %181, 0
  br i1 %182, label %relExit, label %for.end143.split.split.split

for.end143.split.split.split:                     ; preds = %for.end143.split.split
  %sextS166_D = sext <2 x i1> %cmp125S165_D to <2 x i64>
  %BCS166_D = bitcast <2 x i64> %sextS166_D to i128
  %mskS166_D = icmp ne i128 %BCS166_D, 0
  br i1 %mskS166_D, label %for.cond129.preheader, label %for.end151

for.end151:                                       ; preds = %for.end143.split.split.split, %for.end109.split.split.split.split.split
  ret void

relExit:                                          ; preds = %for.end143.split.split, %for.end143.split, %for.end143, %for.body133.split.split.split, %for.body133.split.split, %for.body133.split, %for.body133, %for.cond129.preheader.split, %for.cond129.preheader, %for.cond129.preheader.lr.ph, %for.end109.split.split.split.split, %for.end109.split.split.split, %for.end109.split.split, %for.end109.split, %for.end109, %for.inc107.split106, %for.inc107, %for.body96.split.split.split, %for.body96.split.split, %for.body96.split, %for.body96, %for.body64.lr.ph.us, %for.body46.us.split.split.split, %for.body46.us.split.split, %for.body46.us.split, %for.body46.us, %for.body64.us.split, %for.body64.us, %for.end73.us.split.split105, %for.end73.us.split, %for.end73.us.split104, %for.end73.us, %for.end32.split, %for.end32, %for.body25.split.split.split, %for.body25.split.split, %for.body25.split, %for.body25, %for.cond17.loopexit, %for.body7.split.split, %for.body7.split, %for.body7, %for.body.split, %for.body, %for.cond3.preheader, %middle.block, %vector.body.split.split.split, %vector.body.split.split, %vector.body.split, %vector.body, %vector.memcheck.split.split, %vector.memcheck.split, %vector.memcheck, %for.body.preheader.split.split.split.split, %for.body.preheader.split.split.split, %for.body.preheader.split.split, %for.body.preheader.split, %for.body.preheader, %entry.split, %entry
  %183 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @relFun, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @func5, i32 0, i32 0))
  call void @exit(i32 1)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

declare void @exit(i32)

; Function Attrs: nounwind readonly
declare <2 x double> @llvm.pow.v2f64(<2 x double>, <2 x double>) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

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
!9 = metadata !{metadata !9, metadata !10, metadata !11}
!10 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!11 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!12 = metadata !{metadata !12, metadata !10, metadata !11}
!13 = metadata !{metadata !13, metadata !10, metadata !11}
!14 = metadata !{metadata !14, metadata !10, metadata !11}
!15 = metadata !{metadata !15, metadata !10, metadata !11}
!16 = metadata !{metadata !16, metadata !10, metadata !11}
!17 = metadata !{metadata !17, metadata !10, metadata !11}
!18 = metadata !{metadata !18, metadata !10, metadata !11}
!19 = metadata !{metadata !19, metadata !10, metadata !11}
!20 = metadata !{metadata !20, metadata !10, metadata !11}
