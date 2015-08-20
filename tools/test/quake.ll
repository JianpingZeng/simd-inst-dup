; ModuleID = 'quake.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.options = type { i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.excitation = type { double, double, double }
%struct.damping = type { double, double, double, double }
%struct.source = type { double, double, double, double, [3 x double], [3 x double], i32, i32 }
%struct.properties = type { double, double, double }

@options = common global %struct.options zeroinitializer, align 4
@nodekindf = common global double* null, align 8
@ARCHnodes = common global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [27 x i8] c"%s: Beginning simulation.\0A\00", align 1
@Exc = common global %struct.excitation zeroinitializer, align 8
@ARCHduration = common global double 0.000000e+00, align 8
@Damp = common global %struct.damping zeroinitializer, align 8
@Src = common global %struct.source zeroinitializer, align 8
@.str2 = private unnamed_addr constant [14 x i8] c"CASE SUMMARY\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"Fault information\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"  Orientation:  strike: %f\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"                   dip: %f\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"                  rake: %f\0A\00", align 1
@.str7 = private unnamed_addr constant [31 x i8] c"           dislocation: %f cm\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"Hypocenter: (%f, %f, %f) Km\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"Excitation characteristics\0A\00", align 1
@.str10 = private unnamed_addr constant [24 x i8] c"     Time step: %f sec\0A\00", align 1
@.str11 = private unnamed_addr constant [24 x i8] c"      Duration: %f sec\0A\00", align 1
@.str12 = private unnamed_addr constant [24 x i8] c"     Rise time: %f sec\0A\00", align 1
@nodekind = common global i32* null, align 8
@ARCHcoord = common global double** null, align 8
@ARCHmine = common global i32 0, align 4
@.str13 = private unnamed_addr constant [39 x i8] c"The source is node %d at (%f  %f  %f)\0A\00", align 1
@ARCHglobalnode = common global i32* null, align 8
@.str14 = private unnamed_addr constant [42 x i8] c"The epicenter is node %d at (%f  %f  %f)\0A\00", align 1
@ARCHelems = common global i32 0, align 4
@ARCHvertex = common global i32** null, align 8
@source_elms = common global i32* null, align 8
@V23 = common global double** null, align 8
@M23 = common global double** null, align 8
@C23 = common global double** null, align 8
@M = common global double** null, align 8
@C = common global double** null, align 8
@ARCHmatrixindex = common global i32* null, align 8
@ARCHmatrixcol = common global i32* null, align 8
@.str15 = private unnamed_addr constant [27 x i8] c"K indexing error!!! %d %d\0A\00", align 1
@K = common global double*** null, align 8
@disp = common global double*** null, align 8
@vel = common global double** null, align 8
@.str16 = private unnamed_addr constant [14 x i8] c"Time step %d\0A\00", align 1
@.str17 = private unnamed_addr constant [20 x i8] c"%d: %.2e %.2e %.2e\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@.str18 = private unnamed_addr constant [36 x i8] c"%s: %d nodes %d elems %d timesteps\0A\00", align 1
@progname = common global i8* null, align 8
@ARCHglobalnodes = common global i32 0, align 4
@ARCHglobalelems = common global i32 0, align 4
@.str19 = private unnamed_addr constant [39 x i8] c"%s: Done. Terminating the simulation.\0A\00", align 1
@.str20 = private unnamed_addr constant [32 x i8] c"Warning: Element volume = %f !\0A\00", align 1
@.str21 = private unnamed_addr constant [69 x i8] c"You are running an Archimedes finite element simulation called %s.\0A\0A\00", align 1
@.str23 = private unnamed_addr constant [22 x i8] c"%s [-Qh] < packfile\0A\0A\00", align 1
@packfile = common global %struct._IO_FILE* null, align 8
@.str28 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str29 = private unnamed_addr constant [38 x i8] c"READNODEVECTOR: unexpected data type\0A\00", align 1
@.str30 = private unnamed_addr constant [49 x i8] c"READNODEVECTOR: unexpected number of attributes\0A\00", align 1
@.str31 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str32 = private unnamed_addr constant [38 x i8] c"READELEMVECTOR: unexpected data type\0A\00", align 1
@.str33 = private unnamed_addr constant [49 x i8] c"READELEMVECTOR: unexpected number of attributes\0A\00", align 1
@.str34 = private unnamed_addr constant [34 x i8] c"READDOUBLE: unexpected data type\0A\00", align 1
@.str35 = private unnamed_addr constant [45 x i8] c"READDOUBLE: unexpected number of attributes\0A\00", align 1
@.str36 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@ARCHmesh_dim = common global i32 0, align 4
@ARCHcorners = common global i32 0, align 4
@ARCHsubdomains = common global i32 0, align 4
@.str37 = private unnamed_addr constant [52 x i8] c"%s: too many subdomains(%d), rerun slice using -s1\0A\00", align 1
@.str38 = private unnamed_addr constant [20 x i8] c"%s: Reading nodes.\0A\00", align 1
@.str39 = private unnamed_addr constant [9 x i8] c"%d %d %d\00", align 1
@ARCHpriv = common global i32 0, align 4
@.str40 = private unnamed_addr constant [34 x i8] c"malloc failed for ARCHglobalnode\0A\00", align 1
@.str41 = private unnamed_addr constant [23 x i8] c"%s: Reading elements.\0A\00", align 1
@ARCHglobalelem = common global i32* null, align 8
@.str42 = private unnamed_addr constant [34 x i8] c"malloc failed for ARCHglobalelem\0A\00", align 1
@.str43 = private unnamed_addr constant [38 x i8] c"%s: Reading sparse matrix structure.\0A\00", align 1
@.str44 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@ARCHmatrixlen = common global i32 0, align 4
@ARCHcholeskylen = common global i32 0, align 4
@.str45 = private unnamed_addr constant [33 x i8] c"malloc failed for ARCHmatrixcol\0A\00", align 1
@.str46 = private unnamed_addr constant [35 x i8] c"malloc failed for ARCHmatrixindex\0A\00", align 1
@.str47 = private unnamed_addr constant [47 x i8] c"%s: error: (1)idx buffer too small (%d >= %d)\0A\00", align 1
@stdin = external global %struct._IO_FILE*
@.str48 = private unnamed_addr constant [29 x i8] c"malloc failed for nodekindf\0A\00", align 1
@.str49 = private unnamed_addr constant [28 x i8] c"malloc failed for nodekind\0A\00", align 1
@.str50 = private unnamed_addr constant [31 x i8] c"malloc failed for source_elms\0A\00", align 1
@.str51 = private unnamed_addr constant [23 x i8] c"malloc failed for vel\0A\00", align 1
@.str52 = private unnamed_addr constant [27 x i8] c"malloc failed for vel[%d]\0A\00", align 1
@.str53 = private unnamed_addr constant [21 x i8] c"malloc failed for M\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"malloc failed for M[%d]\0A\00", align 1
@.str55 = private unnamed_addr constant [21 x i8] c"malloc failed for C\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"malloc failed for C[%d]\0A\00", align 1
@.str57 = private unnamed_addr constant [23 x i8] c"malloc failed for M23\0A\00", align 1
@.str58 = private unnamed_addr constant [27 x i8] c"malloc failed for M23[%d]\0A\00", align 1
@.str59 = private unnamed_addr constant [23 x i8] c"malloc failed for C23\0A\00", align 1
@.str60 = private unnamed_addr constant [27 x i8] c"malloc failed for C23[%d]\0A\00", align 1
@.str61 = private unnamed_addr constant [23 x i8] c"malloc failed for V23\0A\00", align 1
@.str62 = private unnamed_addr constant [27 x i8] c"malloc failed for V23[%d]\0A\00", align 1
@.str63 = private unnamed_addr constant [24 x i8] c"malloc failed for disp\0A\00", align 1
@.str64 = private unnamed_addr constant [28 x i8] c"malloc failed for disp[%d]\0A\00", align 1
@.str65 = private unnamed_addr constant [32 x i8] c"malloc failed for disp[%d][%d]\0A\00", align 1
@.str66 = private unnamed_addr constant [21 x i8] c"malloc failed for K\0A\00", align 1
@.str67 = private unnamed_addr constant [25 x i8] c"malloc failed for K[%d]\0A\00", align 1
@.str68 = private unnamed_addr constant [29 x i8] c"malloc failed for K[%d][%d]\0A\00", align 1
@str = private unnamed_addr constant [24 x i8] c"The command syntax is:\0A\00"
@str69 = private unnamed_addr constant [23 x i8] c"Command line options:\0A\00"
@str70 = private unnamed_addr constant [71 x i8] c"    -Q  Quietly suppress all explanation of what this program is doing\00"
@str71 = private unnamed_addr constant [32 x i8] c"        unless an error occurs.\00"
@str72 = private unnamed_addr constant [37 x i8] c"    -h  Print this message and exit.\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %u.i = alloca [12 x double], align 16
  %cor = alloca [4 x i32], align 16
  %cor1442 = bitcast [4 x i32]* %cor to i8*
  %bv = alloca [4 x i32], align 16
  %Ke = alloca [12 x [12 x double]], align 16
  %0 = bitcast [12 x [12 x double]]* %Ke to i8*
  %Me = alloca [12 x double], align 16
  %1 = bitcast [12 x double]* %Me to i8*
  %Ce = alloca [12 x double], align 16
  %2 = bitcast [12 x double]* %Ce to i8*
  %Mexv = alloca [12 x double], align 16
  %Cexv = alloca [12 x double], align 16
  %v = alloca [12 x double], align 16
  %v40.i = bitcast [12 x double]* %v to i8*
  %vertices = alloca [4 x [3 x double]], align 16
  %prop = alloca %struct.properties, align 8
  call void @llvm.lifetime.start(i64 1152, i8* %0) #1
  call void @llvm.lifetime.start(i64 96, i8* %1) #1
  call void @llvm.lifetime.start(i64 96, i8* %2) #1
  %3 = bitcast [12 x double]* %Mexv to i8*
  call void @llvm.lifetime.start(i64 96, i8* %3) #1
  %4 = bitcast [12 x double]* %Cexv to i8*
  call void @llvm.lifetime.start(i64 96, i8* %4) #1
  call void @llvm.lifetime.start(i64 96, i8* %v40.i) #1
  %5 = bitcast [4 x [3 x double]]* %vertices to i8*
  call void @llvm.lifetime.start(i64 96, i8* %5) #1
  %6 = load i8** %argv, align 8, !tbaa !1
  store i8* %6, i8** @progname, align 8, !tbaa !1
  call void @arch_parsecommandline(i32 %argc, i8** %argv, %struct.options* @options) #1
  %7 = load %struct._IO_FILE** @stdin, align 8, !tbaa !1
  store %struct._IO_FILE* %7, %struct._IO_FILE** @packfile, align 8, !tbaa !1
  call void @readpackfile(%struct._IO_FILE* %7, %struct.options* @options) #1
  call void @mem_init()
  %8 = load double** @nodekindf, align 8, !tbaa !1
  %9 = load i32* @ARCHnodes, align 4, !tbaa !5
  call void @arch_readnodevector(double* %8, i32 %9)
  %10 = load i32* getelementptr inbounds (%struct.options* @options, i64 0, i32 0), align 4, !tbaa !7
  %tobool = icmp eq i32 %10, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %11 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %12 = load i8** %argv, align 8, !tbaa !1
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([27 x i8]* @.str, i64 0, i64 0), i8* %12) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store double 2.400000e-03, double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %13 = load double* @ARCHduration, align 8, !tbaa !12
  store double %13, double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 1), align 8, !tbaa !13
  store double 6.000000e-01, double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %div = fdiv double %13, 2.400000e-03
  %add = fadd double %div, 1.000000e+00
  %conv = fptosi double %add to i32
  store double 3.000000e+01, double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 0), align 8, !tbaa !15
  store double 5.333330e-03, double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 1), align 8, !tbaa !17
  store double 6.666667e-02, double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 2), align 8, !tbaa !18
  store double 5.000000e-01, double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 3), align 8, !tbaa !19
  store double 0x3FFEFF3E818748AF, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  store double 0x3FE893011F31982E, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  store double 0x3FF38C35418A5BF6, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 2), align 8, !tbaa !23
  store double 0x403DA40AAEAFAB54, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 3), align 8, !tbaa !24
  store double 0x404021CFC3F811F5, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 0), align 8, !tbaa !12
  store double 0x4037D07E9D94D0DD, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 1), align 8, !tbaa !12
  store double -1.125000e+01, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 2), align 8, !tbaa !12
  store double 0x404021CFC3F811F5, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 5, i64 0), align 8, !tbaa !12
  store double 0x4037D07E9D94D0DD, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 5, i64 1), align 8, !tbaa !12
  store double 0.000000e+00, double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 5, i64 2), align 8, !tbaa !12
  store i32 -1, i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 6), align 8, !tbaa !25
  store i32 -1, i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 7), align 4, !tbaa !26
  %cp = getelementptr inbounds %struct.properties* %prop, i64 0, i32 0
  store double 6.000000e+00, double* %cp, align 8, !tbaa !27
  %cs = getelementptr inbounds %struct.properties* %prop, i64 0, i32 1
  store double 3.200000e+00, double* %cs, align 8, !tbaa !29
  %den = getelementptr inbounds %struct.properties* %prop, i64 0, i32 2
  store double 2.000000e+00, double* %den, align 8, !tbaa !30
  %14 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #8
  %15 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([14 x i8]* @.str2, i64 0, i64 0), i64 13, i64 1, %struct._IO_FILE* %15) #8
  %17 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %17) #8
  %19 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %20 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([28 x i8]* @.str4, i64 0, i64 0), double %20) #7
  %21 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %22 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([28 x i8]* @.str5, i64 0, i64 0), double %22) #7
  %23 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %24 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 2), align 8, !tbaa !23
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([28 x i8]* @.str6, i64 0, i64 0), double %24) #7
  %25 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %26 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 3), align 8, !tbaa !24
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([31 x i8]* @.str7, i64 0, i64 0), double %26) #7
  %27 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %28 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 0), align 8, !tbaa !12
  %29 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 1), align 8, !tbaa !12
  %30 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 2), align 8, !tbaa !12
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([29 x i8]* @.str8, i64 0, i64 0), double %28, double %29, double %30) #7
  %31 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %32 = call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str9, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %31) #8
  %33 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %34 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([24 x i8]* @.str10, i64 0, i64 0), double %34) #7
  %35 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %36 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 1), align 8, !tbaa !13
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([24 x i8]* @.str11, i64 0, i64 0), double %36) #7
  %37 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %38 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([24 x i8]* @.str12, i64 0, i64 0), double %38) #7
  %39 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %fputc1207 = call i32 @fputc(i32 10, %struct._IO_FILE* %39) #8
  %40 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call25 = call i32 @fflush(%struct._IO_FILE* %40) #1
  %41 = load i32* @ARCHnodes, align 4, !tbaa !5
  %cmp1411 = icmp sgt i32 %41, 0
  br i1 %cmp1411, label %for.body.lr.ph, label %for.end68

for.body.lr.ph:                                   ; preds = %if.end
  %42 = load double** @nodekindf, align 8, !tbaa !1
  %43 = load i32** @nodekind, align 8, !tbaa !1
  br label %for.body

for.cond39.preheader:                             ; preds = %for.body
  %cmp401407 = icmp sgt i32 %52, 0
  br i1 %cmp401407, label %for.body42.lr.ph, label %for.end68

for.body42.lr.ph:                                 ; preds = %for.cond39.preheader
  %44 = load double*** @ARCHcoord, align 8, !tbaa !1
  %45 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 0), align 8, !tbaa !12
  %46 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 1), align 8, !tbaa !12
  %47 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 2), align 8, !tbaa !12
  %48 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 5, i64 0), align 8, !tbaa !12
  %49 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 5, i64 1), align 8, !tbaa !12
  %50 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 5, i64 2), align 8, !tbaa !12
  br label %for.body42

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv1528 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next1529, %for.body ]
  %arrayidx27 = getelementptr inbounds double* %42, i64 %indvars.iv1528
  %51 = load double* %arrayidx27, align 8, !tbaa !12
  %conv28 = fptosi double %51 to i32
  %arrayidx30 = getelementptr inbounds i32* %43, i64 %indvars.iv1528
  %cmp33 = icmp eq i32 %conv28, 3
  %.conv28 = select i1 %cmp33, i32 1, i32 %conv28
  store i32 %.conv28, i32* %arrayidx30, align 4, !tbaa !5
  %indvars.iv.next1529 = add nuw nsw i64 %indvars.iv1528, 1
  %52 = load i32* @ARCHnodes, align 4, !tbaa !5
  %53 = trunc i64 %indvars.iv.next1529 to i32
  %cmp = icmp slt i32 %53, %52
  br i1 %cmp, label %for.body, label %for.cond39.preheader

for.body42:                                       ; preds = %for.inc66, %for.body42.lr.ph
  %indvars.iv1526 = phi i64 [ 0, %for.body42.lr.ph ], [ %indvars.iv.next1527, %for.inc66 ]
  %bigdist2.01410 = phi double [ 1.000000e+06, %for.body42.lr.ph ], [ %bigdist2.1, %for.inc66 ]
  %bigdist1.01409 = phi double [ 1.000000e+06, %for.body42.lr.ph ], [ %bigdist1.1, %for.inc66 ]
  %arrayidx44 = getelementptr inbounds double** %44, i64 %indvars.iv1526
  %54 = load double** %arrayidx44, align 8, !tbaa !1
  %55 = load double* %54, align 8, !tbaa !12
  %arrayidx49 = getelementptr inbounds double* %54, i64 1
  %56 = load double* %arrayidx49, align 8, !tbaa !12
  %arrayidx53 = getelementptr inbounds double* %54, i64 2
  %57 = load double* %arrayidx53, align 8, !tbaa !12
  %sub.i1215 = fsub double %55, %45
  %mul.i1216 = fmul double %sub.i1215, %sub.i1215
  %sub7.i = fsub double %56, %46
  %mul11.i = fmul double %sub7.i, %sub7.i
  %add.i1217 = fadd double %mul.i1216, %mul11.i
  %sub14.i = fsub double %57, %47
  %mul18.i = fmul double %sub14.i, %sub14.i
  %add19.i = fadd double %add.i1217, %mul18.i
  %sub.i1218 = fsub double %55, %48
  %mul.i1219 = fmul double %sub.i1218, %sub.i1218
  %sub7.i1221 = fsub double %56, %49
  %mul11.i1222 = fmul double %sub7.i1221, %sub7.i1221
  %add.i1223 = fadd double %mul.i1219, %mul11.i1222
  %sub14.i1225 = fsub double %57, %50
  %mul18.i1226 = fmul double %sub14.i1225, %sub14.i1225
  %add19.i1227 = fadd double %add.i1223, %mul18.i1226
  %cmp58 = fcmp olt double %add19.i, %bigdist1.01409
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %for.body42
  %58 = trunc i64 %indvars.iv1526 to i32
  store i32 %58, i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 6), align 8, !tbaa !25
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %for.body42
  %bigdist1.1 = phi double [ %add19.i, %if.then60 ], [ %bigdist1.01409, %for.body42 ]
  %cmp62 = fcmp olt double %add19.i1227, %bigdist2.01410
  br i1 %cmp62, label %if.then64, label %for.inc66

if.then64:                                        ; preds = %if.end61
  %59 = trunc i64 %indvars.iv1526 to i32
  store i32 %59, i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 7), align 4, !tbaa !26
  br label %for.inc66

for.inc66:                                        ; preds = %if.then64, %if.end61
  %bigdist2.1 = phi double [ %add19.i1227, %if.then64 ], [ %bigdist2.01410, %if.end61 ]
  %indvars.iv.next1527 = add nuw nsw i64 %indvars.iv1526, 1
  %60 = trunc i64 %indvars.iv.next1527 to i32
  %cmp40 = icmp slt i32 %60, %52
  br i1 %cmp40, label %for.body42, label %for.end68

for.end68:                                        ; preds = %for.inc66, %for.cond39.preheader, %if.end
  %61 = load i64* bitcast (i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 6) to i64*), align 8
  %62 = trunc i64 %61 to i32
  %cmp69 = icmp eq i32 %62, 0
  %63 = load i32* @ARCHmine, align 4, !tbaa !5
  %cmp71 = icmp sgt i32 %62, %63
  %or.cond = or i1 %cmp69, %cmp71
  %64 = lshr i64 %61, 32
  %65 = trunc i64 %64 to i32
  br i1 %or.cond, label %if.end87, label %if.then73

if.then73:                                        ; preds = %for.end68
  %66 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %sext = shl i64 %61, 32
  %idxprom74 = ashr exact i64 %sext, 32
  %67 = load i32** @ARCHglobalnode, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i32* %67, i64 %idxprom74
  %68 = load i32* %arrayidx75, align 4, !tbaa !5
  %69 = load double*** @ARCHcoord, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds double** %69, i64 %idxprom74
  %70 = load double** %arrayidx77, align 8, !tbaa !1
  %71 = load double* %70, align 8, !tbaa !12
  %arrayidx81 = getelementptr inbounds double* %70, i64 1
  %72 = load double* %arrayidx81, align 8, !tbaa !12
  %arrayidx84 = getelementptr inbounds double* %70, i64 2
  %73 = load double* %arrayidx84, align 8, !tbaa !12
  %call85 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([39 x i8]* @.str13, i64 0, i64 0), i32 %68, double %71, double %72, double %73) #7
  %74 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call86 = call i32 @fflush(%struct._IO_FILE* %74) #1
  %.pre = load i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 7), align 4, !tbaa !26
  %.pre1530 = load i32* @ARCHmine, align 4, !tbaa !5
  br label %if.end87

if.end87:                                         ; preds = %if.then73, %for.end68
  %75 = phi i32 [ %63, %for.end68 ], [ %.pre1530, %if.then73 ]
  %76 = phi i32 [ %65, %for.end68 ], [ %.pre, %if.then73 ]
  %cmp88 = icmp eq i32 %76, 0
  %cmp91 = icmp sgt i32 %76, %75
  %or.cond1214 = or i1 %cmp88, %cmp91
  br i1 %or.cond1214, label %if.end107, label %if.then93

if.then93:                                        ; preds = %if.end87
  %77 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %idxprom94 = sext i32 %76 to i64
  %78 = load i32** @ARCHglobalnode, align 8, !tbaa !1
  %arrayidx95 = getelementptr inbounds i32* %78, i64 %idxprom94
  %79 = load i32* %arrayidx95, align 4, !tbaa !5
  %80 = load double*** @ARCHcoord, align 8, !tbaa !1
  %arrayidx97 = getelementptr inbounds double** %80, i64 %idxprom94
  %81 = load double** %arrayidx97, align 8, !tbaa !1
  %82 = load double* %81, align 8, !tbaa !12
  %arrayidx101 = getelementptr inbounds double* %81, i64 1
  %83 = load double* %arrayidx101, align 8, !tbaa !12
  %arrayidx104 = getelementptr inbounds double* %81, i64 2
  %84 = load double* %arrayidx104, align 8, !tbaa !12
  %call105 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([42 x i8]* @.str14, i64 0, i64 0), i32 %79, double %82, double %83, double %84) #7
  %85 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call106 = call i32 @fflush(%struct._IO_FILE* %85) #1
  br label %if.end107

if.end107:                                        ; preds = %if.then93, %if.end87
  %86 = load i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 6), align 8, !tbaa !25
  %cmp108 = icmp eq i32 %86, 0
  %.pre1531 = load i32* @ARCHelems, align 4, !tbaa !5
  br i1 %cmp108, label %for.cond184.preheader, label %for.cond111.preheader

for.cond111.preheader:                            ; preds = %if.end107
  %cmp1121405 = icmp sgt i32 %.pre1531, 0
  br i1 %cmp1121405, label %for.cond115.preheader.lr.ph, label %for.end693

for.cond115.preheader.lr.ph:                      ; preds = %for.cond111.preheader
  %arrayidx128 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 0
  %arrayidx131 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 1
  %arrayidx135 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 2
  %arrayidx139 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 3
  %arrayidx1.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 0
  %arrayidx4.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 0
  %arrayidx7.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 0
  %arrayidx11.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 3, i64 0
  %arrayidx1.1.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 1
  %arrayidx4.1.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 1
  %arrayidx7.1.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 1
  %arrayidx11.1.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 3, i64 1
  %arrayidx1.2.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 2
  %arrayidx4.2.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 2
  %arrayidx7.2.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 2
  %arrayidx11.2.i = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 3, i64 2
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.inc180.for.cond115.preheader_crit_edge, %for.cond115.preheader.lr.ph
  %87 = phi i32 [ %86, %for.cond115.preheader.lr.ph ], [ %.pre1546, %for.inc180.for.cond115.preheader_crit_edge ]
  %indvars.iv1524 = phi i64 [ 0, %for.cond115.preheader.lr.ph ], [ %indvars.iv.next1525, %for.inc180.for.cond115.preheader_crit_edge ]
  %88 = load i32*** @ARCHvertex, align 8, !tbaa !1
  %arrayidx121 = getelementptr inbounds i32** %88, i64 %indvars.iv1524
  %89 = load i32** %arrayidx121, align 8, !tbaa !1
  %90 = load i32* %89, align 4, !tbaa !5
  store i32 %90, i32* %arrayidx128, align 16, !tbaa !5
  %arrayidx122.1 = getelementptr inbounds i32* %89, i64 1
  %91 = load i32* %arrayidx122.1, align 4, !tbaa !5
  store i32 %91, i32* %arrayidx131, align 4, !tbaa !5
  %arrayidx122.2 = getelementptr inbounds i32* %89, i64 2
  %92 = load i32* %arrayidx122.2, align 4, !tbaa !5
  store i32 %92, i32* %arrayidx135, align 8, !tbaa !5
  %arrayidx122.3 = getelementptr inbounds i32* %89, i64 3
  %93 = load i32* %arrayidx122.3, align 4, !tbaa !5
  store i32 %93, i32* %arrayidx139, align 4, !tbaa !5
  %cmp129 = icmp eq i32 %90, %87
  %cmp132 = icmp eq i32 %91, %87
  %or.cond1554 = or i1 %cmp129, %cmp132
  br i1 %or.cond1554, label %for.cond143.preheader, label %lor.lhs.false134

for.cond184.preheader:                            ; preds = %for.inc180, %if.end107
  %94 = phi i32 [ %131, %for.inc180 ], [ %.pre1531, %if.end107 ]
  %cmp1851400 = icmp sgt i32 %94, 0
  br i1 %cmp1851400, label %for.cond188.preheader.lr.ph, label %for.end693

for.cond188.preheader.lr.ph:                      ; preds = %for.cond184.preheader
  %arraydecay272 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0
  %arraydecay273 = getelementptr inbounds [4 x i32]* %bv, i64 0, i64 0
  %arraydecay274 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 0
  %arraydecay301 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 0
  %arraydecay302 = getelementptr inbounds [12 x double]* %Me, i64 0, i64 0
  %arrayidx1.2.i1257 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 2
  %arrayidx4.2.i1258 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 2
  %arrayidx7.2.i1260 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 2
  %arrayidx11.2.i1262 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 3, i64 2
  %arraydecay384 = getelementptr inbounds [12 x double]* %v, i64 0, i64 0
  %arraydecay385 = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 0
  %arrayidx.1.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 1
  %arrayidx2.1.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 1
  %arrayidx4.1.i1267 = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 1
  %arrayidx.2.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 2
  %arrayidx2.2.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 2
  %arrayidx4.2.i1268 = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 2
  %arrayidx.3.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 3
  %arrayidx2.3.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 3
  %arrayidx4.3.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 3
  %arrayidx.4.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 4
  %arrayidx2.4.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 4
  %arrayidx4.4.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 4
  %arrayidx.5.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 5
  %arrayidx2.5.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 5
  %arrayidx4.5.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 5
  %arrayidx.6.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 6
  %arrayidx2.6.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 6
  %arrayidx4.6.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 6
  %arrayidx.7.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 7
  %arrayidx2.7.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 7
  %arrayidx4.7.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 7
  %arrayidx.8.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 8
  %arrayidx2.8.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 8
  %arrayidx4.8.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 8
  %arrayidx.9.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 9
  %arrayidx2.9.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 9
  %arrayidx4.9.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 9
  %arrayidx.10.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 10
  %arrayidx2.10.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 10
  %arrayidx4.10.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 10
  %arrayidx.11.i = getelementptr inbounds [12 x double]* %Me, i64 0, i64 11
  %arrayidx2.11.i = getelementptr inbounds [12 x double]* %v, i64 0, i64 11
  %arrayidx4.11.i = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 11
  %arraydecay388 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 0
  %arrayidx.1.i1270 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 1
  %arrayidx4.1.i1273 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 1
  %arrayidx.2.i1274 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 2
  %arrayidx4.2.i1277 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 2
  %arrayidx.3.i1278 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 3
  %arrayidx4.3.i1281 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 3
  %arrayidx.4.i1282 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 4
  %arrayidx4.4.i1285 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 4
  %arrayidx.5.i1286 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 5
  %arrayidx4.5.i1289 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 5
  %arrayidx.6.i1290 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 6
  %arrayidx4.6.i1293 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 6
  %arrayidx.7.i1294 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 7
  %arrayidx4.7.i1297 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 7
  %arrayidx.8.i1298 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 8
  %arrayidx4.8.i1301 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 8
  %arrayidx.9.i1302 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 9
  %arrayidx4.9.i1305 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 9
  %arrayidx.10.i1306 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 10
  %arrayidx4.10.i1309 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 10
  %arrayidx.11.i1310 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 11
  %arrayidx4.11.i1313 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 11
  %95 = bitcast [12 x double]* %u.i to i8*
  %.pre1532 = load i32*** @ARCHvertex, align 8, !tbaa !1
  br label %for.cond188.preheader

lor.lhs.false134:                                 ; preds = %for.cond115.preheader
  %96 = bitcast i32* %arrayidx135 to i64*
  %97 = load i64* %96, align 8
  %98 = trunc i64 %97 to i32
  %cmp136 = icmp eq i32 %98, %87
  %99 = lshr i64 %97, 32
  %100 = trunc i64 %99 to i32
  br i1 %cmp136, label %for.cond143.preheader, label %lor.lhs.false138

lor.lhs.false138:                                 ; preds = %lor.lhs.false134
  %cmp140 = icmp eq i32 %93, %87
  br i1 %cmp140, label %for.cond143.preheader, label %for.inc180

for.cond143.preheader:                            ; preds = %lor.lhs.false138, %lor.lhs.false134, %for.cond115.preheader
  %101 = phi i32 [ %87, %lor.lhs.false138 ], [ %100, %lor.lhs.false134 ], [ %93, %for.cond115.preheader ]
  %102 = phi i32 [ %98, %lor.lhs.false138 ], [ %87, %lor.lhs.false134 ], [ %92, %for.cond115.preheader ]
  %103 = load double*** @ARCHcoord, align 8, !tbaa !1
  %idxprom154 = sext i32 %90 to i64
  %arrayidx155 = getelementptr inbounds double** %103, i64 %idxprom154
  %104 = load double** %arrayidx155, align 8, !tbaa !1
  %105 = load double* %104, align 8, !tbaa !12
  store double %105, double* %arrayidx1.i, align 16, !tbaa !12
  %arrayidx156.1 = getelementptr inbounds double* %104, i64 1
  %106 = load double* %arrayidx156.1, align 8, !tbaa !12
  store double %106, double* %arrayidx1.1.i, align 8, !tbaa !12
  %arrayidx156.2 = getelementptr inbounds double* %104, i64 2
  %107 = load double* %arrayidx156.2, align 8, !tbaa !12
  store double %107, double* %arrayidx1.2.i, align 16, !tbaa !12
  %idxprom154.1 = sext i32 %91 to i64
  %arrayidx155.1 = getelementptr inbounds double** %103, i64 %idxprom154.1
  %108 = load double** %arrayidx155.1, align 8, !tbaa !1
  %109 = load double* %108, align 8, !tbaa !12
  store double %109, double* %arrayidx4.i, align 8, !tbaa !12
  %arrayidx156.1.1 = getelementptr inbounds double* %108, i64 1
  %110 = load double* %arrayidx156.1.1, align 8, !tbaa !12
  store double %110, double* %arrayidx4.1.i, align 8, !tbaa !12
  %arrayidx156.2.1 = getelementptr inbounds double* %108, i64 2
  %111 = load double* %arrayidx156.2.1, align 8, !tbaa !12
  store double %111, double* %arrayidx4.2.i, align 8, !tbaa !12
  %idxprom154.2 = sext i32 %102 to i64
  %arrayidx155.2 = getelementptr inbounds double** %103, i64 %idxprom154.2
  %112 = load double** %arrayidx155.2, align 8, !tbaa !1
  %113 = load double* %112, align 8, !tbaa !12
  store double %113, double* %arrayidx7.i, align 16, !tbaa !12
  %arrayidx156.1.2 = getelementptr inbounds double* %112, i64 1
  %114 = load double* %arrayidx156.1.2, align 8, !tbaa !12
  store double %114, double* %arrayidx7.1.i, align 8, !tbaa !12
  %arrayidx156.2.2 = getelementptr inbounds double* %112, i64 2
  %115 = load double* %arrayidx156.2.2, align 8, !tbaa !12
  store double %115, double* %arrayidx7.2.i, align 16, !tbaa !12
  %idxprom154.3 = sext i32 %101 to i64
  %arrayidx155.3 = getelementptr inbounds double** %103, i64 %idxprom154.3
  %116 = load double** %arrayidx155.3, align 8, !tbaa !1
  %117 = load double* %116, align 8, !tbaa !12
  store double %117, double* %arrayidx11.i, align 8, !tbaa !12
  %arrayidx156.1.3 = getelementptr inbounds double* %116, i64 1
  %118 = load double* %arrayidx156.1.3, align 8, !tbaa !12
  store double %118, double* %arrayidx11.1.i, align 8, !tbaa !12
  %arrayidx156.2.3 = getelementptr inbounds double* %116, i64 2
  %119 = load double* %arrayidx156.2.3, align 8, !tbaa !12
  store double %119, double* %arrayidx11.2.i, align 8, !tbaa !12
  %add.i1228 = fadd double %105, %109
  %add8.i = fadd double %add.i1228, %113
  %add12.i = fadd double %add8.i, %117
  %div.i = fmul double %add12.i, 2.500000e-01
  %add.1.i = fadd double %106, %110
  %add8.1.i = fadd double %add.1.i, %114
  %add12.1.i = fadd double %add8.1.i, %118
  %div.1.i = fmul double %add12.1.i, 2.500000e-01
  %add.2.i = fadd double %107, %111
  %add8.2.i = fadd double %add.2.i, %115
  %add12.2.i = fadd double %add8.2.i, %119
  %div.2.i = fmul double %add12.2.i, 2.500000e-01
  %120 = load i32** @source_elms, align 8, !tbaa !1
  %arrayidx170 = getelementptr inbounds i32* %120, i64 %indvars.iv1524
  store i32 2, i32* %arrayidx170, align 4, !tbaa !5
  %121 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call.i1229 = call double @cos(double %121) #1
  %122 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call1.i1230 = call double @sin(double %122) #1
  %mul.i1231 = fmul double %call.i1229, %call1.i1230
  %123 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call2.i1232 = call double @sin(double %123) #1
  %124 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call3.i1233 = call double @sin(double %124) #1
  %125 = fmul double %call2.i1232, %call3.i1233
  %mul4.i1234 = fsub double -0.000000e+00, %125
  %126 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call5.i1235 = call double @cos(double %126) #1
  %127 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 0), align 8, !tbaa !12
  %mul6.i1236 = fmul double %mul.i1231, %127
  %128 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 1), align 8, !tbaa !12
  %mul7.i = fmul double %128, %mul4.i1234
  %add.i1237 = fadd double %mul6.i1236, %mul7.i
  %129 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 2), align 8, !tbaa !12
  %mul8.i = fmul double %call5.i1235, %129
  %add9.i = fadd double %add.i1237, %mul8.i
  %mul11.i1238 = fmul double %div.i, %mul.i1231
  %mul13.i = fmul double %div.1.i, %mul4.i1234
  %add14.i = fadd double %mul11.i1238, %mul13.i
  %mul16.i = fmul double %div.2.i, %call5.i1235
  %add17.i = fadd double %mul16.i, %add14.i
  %add18.i = fsub double %add17.i, %add9.i
  %cmp173 = fcmp ult double %add18.i, 0.000000e+00
  br i1 %cmp173, label %for.inc180, label %if.then175

if.then175:                                       ; preds = %for.cond143.preheader
  %130 = load i32** @source_elms, align 8, !tbaa !1
  %arrayidx177 = getelementptr inbounds i32* %130, i64 %indvars.iv1524
  store i32 3, i32* %arrayidx177, align 4, !tbaa !5
  br label %for.inc180

for.inc180:                                       ; preds = %if.then175, %for.cond143.preheader, %lor.lhs.false138
  %indvars.iv.next1525 = add nuw nsw i64 %indvars.iv1524, 1
  %131 = load i32* @ARCHelems, align 4, !tbaa !5
  %132 = trunc i64 %indvars.iv.next1525 to i32
  %cmp112 = icmp slt i32 %132, %131
  br i1 %cmp112, label %for.inc180.for.cond115.preheader_crit_edge, label %for.cond184.preheader

for.inc180.for.cond115.preheader_crit_edge:       ; preds = %for.inc180
  %.pre1546 = load i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 6), align 8, !tbaa !25
  br label %for.cond115.preheader

for.cond188.preheader:                            ; preds = %for.inc691, %for.cond188.preheader.lr.ph
  %133 = phi i32** [ %.pre1532, %for.cond188.preheader.lr.ph ], [ %264, %for.inc691 ]
  %indvars.iv1510 = phi i64 [ 0, %for.cond188.preheader.lr.ph ], [ %indvars.iv.next1511, %for.inc691 ]
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 96, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 96, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %v40.i, i8 0, i64 96, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 1152, i32 16, i1 false)
  %arrayidx218 = getelementptr inbounds i32** %133, i64 %indvars.iv1510
  %134 = load i32** %arrayidx218, align 8, !tbaa !1
  %135 = bitcast i32* %134 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %cor1442, i8* %135, i64 16, i32 4, i1 false)
  %136 = load i32** @nodekind, align 8, !tbaa !1
  %arrayidx230 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 0
  %137 = load i32* %arrayidx230, align 16, !tbaa !5
  %idxprom231 = sext i32 %137 to i64
  %arrayidx232 = getelementptr inbounds i32* %136, i64 %idxprom231
  %138 = load i32* %arrayidx232, align 4, !tbaa !5
  %cmp233 = icmp eq i32 %138, 1
  br i1 %cmp233, label %for.inc240, label %if.then235

if.then235:                                       ; preds = %for.cond188.preheader
  store i32 0, i32* %arraydecay273, align 16, !tbaa !5
  br label %for.inc240

for.inc240:                                       ; preds = %if.then235, %for.cond188.preheader
  %verticesonbnd.1 = phi i32 [ 1, %if.then235 ], [ 0, %for.cond188.preheader ]
  %arrayidx230.1 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 1
  %139 = load i32* %arrayidx230.1, align 4, !tbaa !5
  %idxprom231.1 = sext i32 %139 to i64
  %arrayidx232.1 = getelementptr inbounds i32* %136, i64 %idxprom231.1
  %140 = load i32* %arrayidx232.1, align 4, !tbaa !5
  %cmp233.1 = icmp eq i32 %140, 1
  br i1 %cmp233.1, label %for.inc240.1, label %if.then235.1

for.cond246.preheader:                            ; preds = %for.inc240.3
  %141 = load double*** @ARCHcoord, align 8, !tbaa !1
  %142 = load i32* %arraydecay273, align 16, !tbaa !5
  %idxprom257 = sext i32 %142 to i64
  %arrayidx258 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 %idxprom257
  %143 = load i32* %arrayidx258, align 4, !tbaa !5
  %idxprom259 = sext i32 %143 to i64
  %arrayidx260 = getelementptr inbounds double** %141, i64 %idxprom259
  %144 = load double** %arrayidx260, align 8, !tbaa !1
  %145 = load double* %144, align 8, !tbaa !12
  %arrayidx265 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 0
  store double %145, double* %arrayidx265, align 16, !tbaa !12
  %arrayidx261.1 = getelementptr inbounds double* %144, i64 1
  %146 = load double* %arrayidx261.1, align 8, !tbaa !12
  %arrayidx265.1 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 1
  store double %146, double* %arrayidx265.1, align 8, !tbaa !12
  %arrayidx261.2 = getelementptr inbounds double* %144, i64 2
  %147 = load double* %arrayidx261.2, align 8, !tbaa !12
  store double %147, double* %arrayidx1.2.i1257, align 16, !tbaa !12
  %arrayidx256.1 = getelementptr inbounds [4 x i32]* %bv, i64 0, i64 1
  %148 = load i32* %arrayidx256.1, align 4, !tbaa !5
  %idxprom257.1 = sext i32 %148 to i64
  %arrayidx258.1 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 %idxprom257.1
  %149 = load i32* %arrayidx258.1, align 4, !tbaa !5
  %idxprom259.1 = sext i32 %149 to i64
  %arrayidx260.1 = getelementptr inbounds double** %141, i64 %idxprom259.1
  %150 = load double** %arrayidx260.1, align 8, !tbaa !1
  %151 = load double* %150, align 8, !tbaa !12
  %arrayidx265.11453 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 0
  store double %151, double* %arrayidx265.11453, align 8, !tbaa !12
  %arrayidx261.1.1 = getelementptr inbounds double* %150, i64 1
  %152 = load double* %arrayidx261.1.1, align 8, !tbaa !12
  %arrayidx265.1.1 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 1
  store double %152, double* %arrayidx265.1.1, align 8, !tbaa !12
  %arrayidx261.2.1 = getelementptr inbounds double* %150, i64 2
  %153 = load double* %arrayidx261.2.1, align 8, !tbaa !12
  store double %153, double* %arrayidx4.2.i1258, align 8, !tbaa !12
  %arrayidx256.2 = getelementptr inbounds [4 x i32]* %bv, i64 0, i64 2
  %154 = load i32* %arrayidx256.2, align 8, !tbaa !5
  %idxprom257.2 = sext i32 %154 to i64
  %arrayidx258.2 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 %idxprom257.2
  %155 = load i32* %arrayidx258.2, align 4, !tbaa !5
  %idxprom259.2 = sext i32 %155 to i64
  %arrayidx260.2 = getelementptr inbounds double** %141, i64 %idxprom259.2
  %156 = load double** %arrayidx260.2, align 8, !tbaa !1
  %157 = load double* %156, align 8, !tbaa !12
  %arrayidx265.21454 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 0
  store double %157, double* %arrayidx265.21454, align 16, !tbaa !12
  %arrayidx261.1.2 = getelementptr inbounds double* %156, i64 1
  %158 = load double* %arrayidx261.1.2, align 8, !tbaa !12
  %arrayidx265.1.2 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 1
  store double %158, double* %arrayidx265.1.2, align 8, !tbaa !12
  %arrayidx261.2.2 = getelementptr inbounds double* %156, i64 2
  %159 = load double* %arrayidx261.2.2, align 8, !tbaa !12
  store double %159, double* %arrayidx7.2.i1260, align 16, !tbaa !12
  call void @abe_matrix([3 x double]* %arraydecay272, i32* %arraydecay273, %struct.properties* %prop, double* %arraydecay274)
  br label %for.cond276.preheader

for.cond276.preheader:                            ; preds = %for.inc240.3.for.cond276.preheader_crit_edge, %for.cond246.preheader
  %arrayidx293.1.2.pre-phi = phi double* [ %arrayidx293.1.2.pre, %for.inc240.3.for.cond276.preheader_crit_edge ], [ %arrayidx265.1.2, %for.cond246.preheader ]
  %arrayidx293.21463.pre-phi = phi double* [ %arrayidx293.21463.pre, %for.inc240.3.for.cond276.preheader_crit_edge ], [ %arrayidx265.21454, %for.cond246.preheader ]
  %arrayidx293.1.1.pre-phi = phi double* [ %arrayidx293.1.1.pre, %for.inc240.3.for.cond276.preheader_crit_edge ], [ %arrayidx265.1.1, %for.cond246.preheader ]
  %arrayidx293.11462.pre-phi = phi double* [ %arrayidx293.11462.pre, %for.inc240.3.for.cond276.preheader_crit_edge ], [ %arrayidx265.11453, %for.cond246.preheader ]
  %arrayidx293.1.pre-phi = phi double* [ %arrayidx293.1.pre, %for.inc240.3.for.cond276.preheader_crit_edge ], [ %arrayidx265.1, %for.cond246.preheader ]
  %arrayidx293.pre-phi = phi double* [ %arrayidx293.pre, %for.inc240.3.for.cond276.preheader_crit_edge ], [ %arrayidx265, %for.cond246.preheader ]
  %160 = load double*** @ARCHcoord, align 8, !tbaa !1
  %arrayidx288 = getelementptr inbounds double** %160, i64 %idxprom231
  %161 = load double** %arrayidx288, align 8, !tbaa !1
  %162 = load double* %161, align 8, !tbaa !12
  store double %162, double* %arrayidx293.pre-phi, align 8, !tbaa !12
  %arrayidx289.1 = getelementptr inbounds double* %161, i64 1
  %163 = load double* %arrayidx289.1, align 8, !tbaa !12
  store double %163, double* %arrayidx293.1.pre-phi, align 8, !tbaa !12
  %arrayidx289.2 = getelementptr inbounds double* %161, i64 2
  %164 = load double* %arrayidx289.2, align 8, !tbaa !12
  store double %164, double* %arrayidx1.2.i1257, align 16, !tbaa !12
  %arrayidx288.1 = getelementptr inbounds double** %160, i64 %idxprom231.1
  %165 = load double** %arrayidx288.1, align 8, !tbaa !1
  %166 = load double* %165, align 8, !tbaa !12
  store double %166, double* %arrayidx293.11462.pre-phi, align 8, !tbaa !12
  %arrayidx289.1.1 = getelementptr inbounds double* %165, i64 1
  %167 = load double* %arrayidx289.1.1, align 8, !tbaa !12
  store double %167, double* %arrayidx293.1.1.pre-phi, align 8, !tbaa !12
  %arrayidx289.2.1 = getelementptr inbounds double* %165, i64 2
  %168 = load double* %arrayidx289.2.1, align 8, !tbaa !12
  store double %168, double* %arrayidx4.2.i1258, align 8, !tbaa !12
  %arrayidx288.2 = getelementptr inbounds double** %160, i64 %idxprom231.2
  %169 = load double** %arrayidx288.2, align 8, !tbaa !1
  %170 = load double* %169, align 8, !tbaa !12
  store double %170, double* %arrayidx293.21463.pre-phi, align 8, !tbaa !12
  %arrayidx289.1.2 = getelementptr inbounds double* %169, i64 1
  %171 = load double* %arrayidx289.1.2, align 8, !tbaa !12
  store double %171, double* %arrayidx293.1.2.pre-phi, align 8, !tbaa !12
  %arrayidx289.2.2 = getelementptr inbounds double* %169, i64 2
  %172 = load double* %arrayidx289.2.2, align 8, !tbaa !12
  store double %172, double* %arrayidx7.2.i1260, align 16, !tbaa !12
  %arrayidx288.3 = getelementptr inbounds double** %160, i64 %idxprom231.3
  %173 = load double** %arrayidx288.3, align 8, !tbaa !1
  %174 = load double* %173, align 8, !tbaa !12
  %arrayidx293.3 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 3, i64 0
  store double %174, double* %arrayidx293.3, align 8, !tbaa !12
  %arrayidx289.1.3 = getelementptr inbounds double* %173, i64 1
  %175 = load double* %arrayidx289.1.3, align 8, !tbaa !12
  %arrayidx293.1.3 = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 3, i64 1
  store double %175, double* %arrayidx293.1.3, align 8, !tbaa !12
  %arrayidx289.2.3 = getelementptr inbounds double* %173, i64 2
  %176 = load double* %arrayidx289.2.3, align 8, !tbaa !12
  store double %176, double* %arrayidx11.2.i1262, align 8, !tbaa !12
  call void @element_matrices([3 x double]* %arraydecay272, %struct.properties* %prop, [12 x double]* %arraydecay301, double* %arraydecay302)
  %177 = load double* %arrayidx1.2.i1257, align 16, !tbaa !12
  %178 = load double* %arrayidx4.2.i1258, align 8, !tbaa !12
  %add.2.i1259 = fadd double %177, %178
  %179 = load double* %arrayidx7.2.i1260, align 16, !tbaa !12
  %add8.2.i1261 = fadd double %add.2.i1259, %179
  %180 = load double* %arrayidx11.2.i1262, align 8, !tbaa !12
  %add12.2.i1263 = fadd double %add8.2.i1261, %180
  %div.2.i1264 = fmul double %add12.2.i1263, 2.500000e-01
  %cmp306 = fcmp olt double %div.2.i1264, -1.150000e+01
  br i1 %cmp306, label %if.then308, label %if.else

if.then308:                                       ; preds = %for.cond276.preheader
  %181 = load double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 0), align 8, !tbaa !15
  %mul309 = fmul double %181, 2.000000e+00
  %div310 = fdiv double %mul309, 1.000000e+02
  %182 = load double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 3), align 8, !tbaa !19
  %mul311 = fmul double %182, 0x401921FB54442D18
  %mul312 = fmul double %div310, %mul311
  br label %if.end318

if.else:                                          ; preds = %for.cond276.preheader
  %183 = load double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 1), align 8, !tbaa !17
  %mul313 = fmul double %183, 0x402921FB54442D18
  %mul314 = fmul double %mul313, 9.500000e-01
  %184 = load double* %cs, align 8, !tbaa !29
  %185 = load double* getelementptr inbounds (%struct.damping* @Damp, i64 0, i32 2), align 8, !tbaa !18
  %add316 = fadd double %184, %185
  %div317 = fdiv double %mul314, %add316
  br label %if.end318

if.end318:                                        ; preds = %if.else, %if.then308
  %alpha.0 = phi double [ %mul312, %if.then308 ], [ %div317, %if.else ]
  %186 = load double* %arraydecay274, align 16, !tbaa !12
  %187 = load double* %arraydecay302, align 16, !tbaa !12
  %mul327 = fmul double %alpha.0, %187
  %add328 = fadd double %186, %mul327
  store double %add328, double* %arraydecay274, align 16, !tbaa !12
  %188 = load double* %arrayidx.1.i1270, align 8, !tbaa !12
  %189 = load double* %arrayidx.1.i, align 8, !tbaa !12
  %mul327.1 = fmul double %alpha.0, %189
  %add328.1 = fadd double %188, %mul327.1
  store double %add328.1, double* %arrayidx.1.i1270, align 8, !tbaa !12
  %190 = load double* %arrayidx.2.i1274, align 16, !tbaa !12
  %191 = load double* %arrayidx.2.i, align 16, !tbaa !12
  %mul327.2 = fmul double %alpha.0, %191
  %add328.2 = fadd double %190, %mul327.2
  store double %add328.2, double* %arrayidx.2.i1274, align 16, !tbaa !12
  %192 = load double* %arrayidx.3.i1278, align 8, !tbaa !12
  %193 = load double* %arrayidx.3.i, align 8, !tbaa !12
  %mul327.3 = fmul double %alpha.0, %193
  %add328.3 = fadd double %192, %mul327.3
  store double %add328.3, double* %arrayidx.3.i1278, align 8, !tbaa !12
  %194 = load double* %arrayidx.4.i1282, align 16, !tbaa !12
  %195 = load double* %arrayidx.4.i, align 16, !tbaa !12
  %mul327.4 = fmul double %alpha.0, %195
  %add328.4 = fadd double %194, %mul327.4
  store double %add328.4, double* %arrayidx.4.i1282, align 16, !tbaa !12
  %196 = load double* %arrayidx.5.i1286, align 8, !tbaa !12
  %197 = load double* %arrayidx.5.i, align 8, !tbaa !12
  %mul327.5 = fmul double %alpha.0, %197
  %add328.5 = fadd double %196, %mul327.5
  store double %add328.5, double* %arrayidx.5.i1286, align 8, !tbaa !12
  %198 = load double* %arrayidx.6.i1290, align 16, !tbaa !12
  %199 = load double* %arrayidx.6.i, align 16, !tbaa !12
  %mul327.6 = fmul double %alpha.0, %199
  %add328.6 = fadd double %198, %mul327.6
  store double %add328.6, double* %arrayidx.6.i1290, align 16, !tbaa !12
  %200 = load double* %arrayidx.7.i1294, align 8, !tbaa !12
  %201 = load double* %arrayidx.7.i, align 8, !tbaa !12
  %mul327.7 = fmul double %alpha.0, %201
  %add328.7 = fadd double %200, %mul327.7
  store double %add328.7, double* %arrayidx.7.i1294, align 8, !tbaa !12
  %202 = load double* %arrayidx.8.i1298, align 16, !tbaa !12
  %203 = load double* %arrayidx.8.i, align 16, !tbaa !12
  %mul327.8 = fmul double %alpha.0, %203
  %add328.8 = fadd double %202, %mul327.8
  store double %add328.8, double* %arrayidx.8.i1298, align 16, !tbaa !12
  %204 = load double* %arrayidx.9.i1302, align 8, !tbaa !12
  %205 = load double* %arrayidx.9.i, align 8, !tbaa !12
  %mul327.9 = fmul double %alpha.0, %205
  %add328.9 = fadd double %204, %mul327.9
  store double %add328.9, double* %arrayidx.9.i1302, align 8, !tbaa !12
  %206 = load double* %arrayidx.10.i1306, align 16, !tbaa !12
  %207 = load double* %arrayidx.10.i, align 16, !tbaa !12
  %mul327.10 = fmul double %alpha.0, %207
  %add328.10 = fadd double %206, %mul327.10
  store double %add328.10, double* %arrayidx.10.i1306, align 16, !tbaa !12
  %208 = load double* %arrayidx.11.i1310, align 8, !tbaa !12
  %209 = load double* %arrayidx.11.i, align 8, !tbaa !12
  %mul327.11 = fmul double %alpha.0, %209
  %add328.11 = fadd double %208, %mul327.11
  store double %add328.11, double* %arrayidx.11.i1310, align 8, !tbaa !12
  %210 = load i32** @source_elms, align 8, !tbaa !1
  %arrayidx335 = getelementptr inbounds i32* %210, i64 %indvars.iv1510
  %211 = load i32* %arrayidx335, align 4, !tbaa !5
  %212 = and i32 %211, -2
  %switch = icmp eq i32 %212, 2
  br i1 %switch, label %for.cond344.preheader, label %if.end318.for.cond531.preheader_crit_edge

if.end318.for.cond531.preheader_crit_edge:        ; preds = %if.end318
  %.pre1539 = load i32*** @ARCHvertex, align 8, !tbaa !1
  %arrayidx540.phi.trans.insert = getelementptr inbounds i32** %.pre1539, i64 %indvars.iv1510
  %.pre1540 = load i32** %arrayidx540.phi.trans.insert, align 8, !tbaa !1
  br label %for.cond531.preheader

for.cond344.preheader:                            ; preds = %if.end318
  %213 = load i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 6), align 8, !tbaa !25
  %214 = load i32* %arrayidx230, align 16, !tbaa !5
  %cmp350 = icmp eq i32 %214, %213
  br i1 %cmp350, label %if.then352, label %if.else367

if.then352:                                       ; preds = %for.cond344.preheader
  store double 0x4030A507152329B8, double* %arraydecay384, align 16, !tbaa !12
  store double 0x402E24EC3EEE0681, double* %arrayidx2.1.i, align 8, !tbaa !12
  store double 0x40335935EEBC8FB3, double* %arrayidx2.2.i, align 16, !tbaa !12
  br label %for.inc380

if.else367:                                       ; preds = %for.cond344.preheader
  %215 = bitcast [12 x double]* %v to i8*
  call void @llvm.memset.p0i8.i64(i8* %215, i8 0, i64 24, i32 16, i1 false)
  br label %for.inc380

for.inc380:                                       ; preds = %if.else367, %if.then352
  %.pre42.i = phi double [ 0x40335935EEBC8FB3, %if.then352 ], [ 0.000000e+00, %if.else367 ]
  %.pre41.i = phi double [ 0x402E24EC3EEE0681, %if.then352 ], [ 0.000000e+00, %if.else367 ]
  %.pre.i = phi double [ 0x4030A507152329B8, %if.then352 ], [ 0.000000e+00, %if.else367 ]
  %216 = load i32* %arrayidx230.1, align 4, !tbaa !5
  %cmp350.1 = icmp eq i32 %216, %213
  br i1 %cmp350.1, label %if.then352.1, label %if.else367.1

for.body.i:                                       ; preds = %for.inc380.3, %for.body.i
  %indvars.iv.i = phi i64 [ 0, %for.inc380.3 ], [ %indvars.iv.next.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds [12 x double]* %u.i, i64 0, i64 %indvars.iv.i
  %arrayidx7.i1314 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 0
  %217 = load double* %arrayidx7.i1314, align 16, !tbaa !12
  %mul.i1315 = fmul double %.pre.i, %217
  %add.i1316 = fadd double %mul.i1315, 0.000000e+00
  %arrayidx7.1.i1317 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 1
  %218 = load double* %arrayidx7.1.i1317, align 8, !tbaa !12
  %mul.1.i1318 = fmul double %.pre41.i, %218
  %add.1.i1319 = fadd double %add.i1316, %mul.1.i1318
  %arrayidx7.2.i1320 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 2
  %219 = load double* %arrayidx7.2.i1320, align 16, !tbaa !12
  %mul.2.i1321 = fmul double %.pre42.i, %219
  %add.2.i1322 = fadd double %add.1.i1319, %mul.2.i1321
  %arrayidx7.3.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 3
  %220 = load double* %arrayidx7.3.i, align 8, !tbaa !12
  %mul.3.i1323 = fmul double %.pre43.i, %220
  %add.3.i = fadd double %add.2.i1322, %mul.3.i1323
  %arrayidx7.4.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 4
  %221 = load double* %arrayidx7.4.i, align 16, !tbaa !12
  %mul.4.i1324 = fmul double %.pre44.i, %221
  %add.4.i = fadd double %add.3.i, %mul.4.i1324
  %arrayidx7.5.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 5
  %222 = load double* %arrayidx7.5.i, align 8, !tbaa !12
  %mul.5.i1325 = fmul double %.pre45.i, %222
  %add.5.i = fadd double %add.4.i, %mul.5.i1325
  %arrayidx7.6.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 6
  %223 = load double* %arrayidx7.6.i, align 16, !tbaa !12
  %mul.6.i1326 = fmul double %.pre46.i, %223
  %add.6.i = fadd double %add.5.i, %mul.6.i1326
  %arrayidx7.7.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 7
  %224 = load double* %arrayidx7.7.i, align 8, !tbaa !12
  %mul.7.i1327 = fmul double %.pre47.i, %224
  %add.7.i = fadd double %add.6.i, %mul.7.i1327
  %arrayidx7.8.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 8
  %225 = load double* %arrayidx7.8.i, align 16, !tbaa !12
  %mul.8.i1328 = fmul double %.pre48.i, %225
  %add.8.i = fadd double %add.7.i, %mul.8.i1328
  %arrayidx7.9.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 9
  %226 = load double* %arrayidx7.9.i, align 8, !tbaa !12
  %mul.9.i1329 = fmul double %.pre49.i, %226
  %add.9.i = fadd double %add.8.i, %mul.9.i1329
  %arrayidx7.10.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 10
  %227 = load double* %arrayidx7.10.i, align 16, !tbaa !12
  %mul.10.i1330 = fmul double %.pre50.i, %227
  %add.10.i = fadd double %add.9.i, %mul.10.i1330
  %arrayidx7.11.i = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %indvars.iv.i, i64 11
  %228 = load double* %arrayidx7.11.i, align 8, !tbaa !12
  %mul.11.i1331 = fmul double %.pre51.i, %228
  %add.11.i = fadd double %add.10.i, %mul.11.i1331
  store double %add.11.i, double* %arrayidx.i, align 8, !tbaa !12
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 12
  br i1 %exitcond.i, label %mv12x12.exit, label %for.body.i

mv12x12.exit:                                     ; preds = %for.body.i
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %v40.i, i8* %95, i64 96, i32 16, i1 false) #1
  call void @llvm.lifetime.end(i64 96, i8* %95) #1
  %229 = load i32* %arrayidx335, align 4, !tbaa !5
  %cmp393 = icmp eq i32 %229, 3
  br i1 %cmp393, label %for.body399, label %for.cond418.preheader

for.body399:                                      ; preds = %for.body399.for.body399_crit_edge, %mv12x12.exit
  %230 = phi double [ %.pre1538, %for.body399.for.body399_crit_edge ], [ %mul.i1269, %mv12x12.exit ]
  %231 = phi double [ %.pre1537, %for.body399.for.body399_crit_edge ], [ %mul.i1266, %mv12x12.exit ]
  %indvars.iv1475 = phi i64 [ %indvars.iv.next1476, %for.body399.for.body399_crit_edge ], [ 0, %mv12x12.exit ]
  %arrayidx401 = getelementptr inbounds [12 x double]* %v, i64 0, i64 %indvars.iv1475
  %232 = load double* %arrayidx401, align 8, !tbaa !12
  %sub = fsub double -0.000000e+00, %232
  store double %sub, double* %arrayidx401, align 8, !tbaa !12
  %arrayidx405 = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 %indvars.iv1475
  %sub406 = fsub double -0.000000e+00, %231
  store double %sub406, double* %arrayidx405, align 8, !tbaa !12
  %arrayidx410 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 %indvars.iv1475
  %sub411 = fsub double -0.000000e+00, %230
  store double %sub411, double* %arrayidx410, align 8, !tbaa !12
  %indvars.iv.next1476 = add nuw nsw i64 %indvars.iv1475, 1
  %exitcond1477 = icmp eq i64 %indvars.iv.next1476, 12
  br i1 %exitcond1477, label %for.cond418.preheader, label %for.body399.for.body399_crit_edge

for.body399.for.body399_crit_edge:                ; preds = %for.body399
  %arrayidx405.phi.trans.insert = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 %indvars.iv.next1476
  %.pre1537 = load double* %arrayidx405.phi.trans.insert, align 8, !tbaa !12
  %arrayidx410.phi.trans.insert = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 %indvars.iv.next1476
  %.pre1538 = load double* %arrayidx410.phi.trans.insert, align 8, !tbaa !12
  br label %for.body399

for.cond418.preheader:                            ; preds = %for.body399, %mv12x12.exit
  %233 = load i32*** @ARCHvertex, align 8, !tbaa !1
  %arrayidx427 = getelementptr inbounds i32** %233, i64 %indvars.iv1510
  %234 = load i32** %arrayidx427, align 8, !tbaa !1
  %235 = load double*** @V23, align 8, !tbaa !1
  %236 = load double*** @M23, align 8, !tbaa !1
  %237 = load double*** @C23, align 8, !tbaa !1
  br label %for.body421

for.body421:                                      ; preds = %for.body421, %for.cond418.preheader
  %indvars.iv1478 = phi i64 [ 0, %for.cond418.preheader ], [ %indvars.iv.next1479, %for.body421 ]
  %238 = mul nsw i64 %indvars.iv1478, 3
  %arrayidx424 = getelementptr inbounds [12 x double]* %v, i64 0, i64 %238
  %239 = load double* %arrayidx424, align 8, !tbaa !12
  %arrayidx428 = getelementptr inbounds i32* %234, i64 %indvars.iv1478
  %240 = load i32* %arrayidx428, align 4, !tbaa !5
  %idxprom429 = sext i32 %240 to i64
  %arrayidx430 = getelementptr inbounds double** %235, i64 %idxprom429
  %241 = load double** %arrayidx430, align 8, !tbaa !1
  %242 = load double* %241, align 8, !tbaa !12
  %add432 = fadd double %239, %242
  store double %add432, double* %241, align 8, !tbaa !12
  %243 = add nsw i64 %238, 1
  %arrayidx436 = getelementptr inbounds [12 x double]* %v, i64 0, i64 %243
  %244 = load double* %arrayidx436, align 8, !tbaa !12
  %arrayidx443 = getelementptr inbounds double* %241, i64 1
  %245 = load double* %arrayidx443, align 8, !tbaa !12
  %add444 = fadd double %244, %245
  store double %add444, double* %arrayidx443, align 8, !tbaa !12
  %246 = add nsw i64 %238, 2
  %arrayidx448 = getelementptr inbounds [12 x double]* %v, i64 0, i64 %246
  %247 = load double* %arrayidx448, align 8, !tbaa !12
  %arrayidx455 = getelementptr inbounds double* %241, i64 2
  %248 = load double* %arrayidx455, align 8, !tbaa !12
  %add456 = fadd double %247, %248
  store double %add456, double* %arrayidx455, align 8, !tbaa !12
  %arrayidx459 = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 %238
  %249 = load double* %arrayidx459, align 8, !tbaa !12
  %arrayidx465 = getelementptr inbounds double** %236, i64 %idxprom429
  %250 = load double** %arrayidx465, align 8, !tbaa !1
  %251 = load double* %250, align 8, !tbaa !12
  %add467 = fadd double %249, %251
  store double %add467, double* %250, align 8, !tbaa !12
  %arrayidx471 = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 %243
  %252 = load double* %arrayidx471, align 8, !tbaa !12
  %arrayidx478 = getelementptr inbounds double* %250, i64 1
  %253 = load double* %arrayidx478, align 8, !tbaa !12
  %add479 = fadd double %252, %253
  store double %add479, double* %arrayidx478, align 8, !tbaa !12
  %arrayidx483 = getelementptr inbounds [12 x double]* %Mexv, i64 0, i64 %246
  %254 = load double* %arrayidx483, align 8, !tbaa !12
  %arrayidx490 = getelementptr inbounds double* %250, i64 2
  %255 = load double* %arrayidx490, align 8, !tbaa !12
  %add491 = fadd double %254, %255
  store double %add491, double* %arrayidx490, align 8, !tbaa !12
  %arrayidx494 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 %238
  %256 = load double* %arrayidx494, align 8, !tbaa !12
  %arrayidx500 = getelementptr inbounds double** %237, i64 %idxprom429
  %257 = load double** %arrayidx500, align 8, !tbaa !1
  %258 = load double* %257, align 8, !tbaa !12
  %add502 = fadd double %256, %258
  store double %add502, double* %257, align 8, !tbaa !12
  %arrayidx506 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 %243
  %259 = load double* %arrayidx506, align 8, !tbaa !12
  %arrayidx513 = getelementptr inbounds double* %257, i64 1
  %260 = load double* %arrayidx513, align 8, !tbaa !12
  %add514 = fadd double %259, %260
  store double %add514, double* %arrayidx513, align 8, !tbaa !12
  %arrayidx518 = getelementptr inbounds [12 x double]* %Cexv, i64 0, i64 %246
  %261 = load double* %arrayidx518, align 8, !tbaa !12
  %arrayidx525 = getelementptr inbounds double* %257, i64 2
  %262 = load double* %arrayidx525, align 8, !tbaa !12
  %add526 = fadd double %261, %262
  store double %add526, double* %arrayidx525, align 8, !tbaa !12
  %indvars.iv.next1479 = add nuw nsw i64 %indvars.iv1478, 1
  %exitcond1483 = icmp eq i64 %indvars.iv.next1479, 4
  br i1 %exitcond1483, label %for.cond531.preheader, label %for.body421

for.cond531.preheader:                            ; preds = %for.body421, %if.end318.for.cond531.preheader_crit_edge
  %263 = phi i32* [ %.pre1540, %if.end318.for.cond531.preheader_crit_edge ], [ %234, %for.body421 ]
  %264 = phi i32** [ %.pre1539, %if.end318.for.cond531.preheader_crit_edge ], [ %233, %for.body421 ]
  %265 = load double*** @M, align 8, !tbaa !1
  %266 = load double*** @C, align 8, !tbaa !1
  %267 = load i32** @ARCHmatrixindex, align 8, !tbaa !1
  %268 = load i32** @ARCHmatrixcol, align 8, !tbaa !1
  %269 = load double**** @K, align 8, !tbaa !1
  br label %for.body534

for.body534:                                      ; preds = %for.inc688, %for.cond531.preheader
  %indvars.iv1505 = phi i64 [ 0, %for.cond531.preheader ], [ %indvars.iv.next1506, %for.inc688 ]
  %270 = mul nsw i64 %indvars.iv1505, 3
  %arrayidx537 = getelementptr inbounds [12 x double]* %Me, i64 0, i64 %270
  %271 = load double* %arrayidx537, align 8, !tbaa !12
  %arrayidx541 = getelementptr inbounds i32* %263, i64 %indvars.iv1505
  %272 = load i32* %arrayidx541, align 4, !tbaa !5
  %idxprom542 = sext i32 %272 to i64
  %arrayidx543 = getelementptr inbounds double** %265, i64 %idxprom542
  %273 = load double** %arrayidx543, align 8, !tbaa !1
  %274 = load double* %273, align 8, !tbaa !12
  %add545 = fadd double %271, %274
  store double %add545, double* %273, align 8, !tbaa !12
  %275 = add nsw i64 %270, 1
  %arrayidx549 = getelementptr inbounds [12 x double]* %Me, i64 0, i64 %275
  %276 = load double* %arrayidx549, align 8, !tbaa !12
  %arrayidx556 = getelementptr inbounds double* %273, i64 1
  %277 = load double* %arrayidx556, align 8, !tbaa !12
  %add557 = fadd double %276, %277
  store double %add557, double* %arrayidx556, align 8, !tbaa !12
  %278 = add nsw i64 %270, 2
  %arrayidx561 = getelementptr inbounds [12 x double]* %Me, i64 0, i64 %278
  %279 = load double* %arrayidx561, align 8, !tbaa !12
  %arrayidx568 = getelementptr inbounds double* %273, i64 2
  %280 = load double* %arrayidx568, align 8, !tbaa !12
  %add569 = fadd double %279, %280
  store double %add569, double* %arrayidx568, align 8, !tbaa !12
  %arrayidx572 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 %270
  %281 = load double* %arrayidx572, align 8, !tbaa !12
  %arrayidx578 = getelementptr inbounds double** %266, i64 %idxprom542
  %282 = load double** %arrayidx578, align 8, !tbaa !1
  %283 = load double* %282, align 8, !tbaa !12
  %add580 = fadd double %281, %283
  store double %add580, double* %282, align 8, !tbaa !12
  %arrayidx584 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 %275
  %284 = load double* %arrayidx584, align 8, !tbaa !12
  %arrayidx591 = getelementptr inbounds double* %282, i64 1
  %285 = load double* %arrayidx591, align 8, !tbaa !12
  %add592 = fadd double %284, %285
  store double %add592, double* %arrayidx591, align 8, !tbaa !12
  %arrayidx596 = getelementptr inbounds [12 x double]* %Ce, i64 0, i64 %278
  %286 = load double* %arrayidx596, align 8, !tbaa !12
  %arrayidx603 = getelementptr inbounds double* %282, i64 2
  %287 = load double* %arrayidx603, align 8, !tbaa !12
  %add604 = fadd double %286, %287
  store double %add604, double* %arrayidx603, align 8, !tbaa !12
  %arrayidx625 = getelementptr inbounds i32* %267, i64 %idxprom542
  br label %for.body608

for.body608:                                      ; preds = %for.inc685, %for.body534
  %indvars.iv1501 = phi i64 [ 0, %for.body534 ], [ %indvars.iv.next1502, %for.inc685 ]
  %arrayidx616 = getelementptr inbounds i32* %263, i64 %indvars.iv1501
  %288 = load i32* %arrayidx616, align 4, !tbaa !5
  %cmp617 = icmp sgt i32 %272, %288
  br i1 %cmp617, label %for.inc685, label %if.then619

if.then619:                                       ; preds = %for.body608
  %289 = load i32* %arrayidx625, align 4, !tbaa !5
  %add639 = add nsw i32 %288, 1
  %idxprom640 = sext i32 %add639 to i64
  %arrayidx641 = getelementptr inbounds i32* %267, i64 %idxprom640
  %290 = sext i32 %289 to i64
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then619
  %indvars.iv1485 = phi i64 [ %indvars.iv.next1486, %while.body ], [ %290, %if.then619 ]
  %arrayidx627 = getelementptr inbounds i32* %268, i64 %indvars.iv1485
  %291 = load i32* %arrayidx627, align 4, !tbaa !5
  %cmp632 = icmp eq i32 %291, %288
  br i1 %cmp632, label %for.cond655.loopexit, label %while.body

while.body:                                       ; preds = %while.cond
  %indvars.iv.next1486 = add nsw i64 %indvars.iv1485, 1
  %292 = load i32* %arrayidx641, align 4, !tbaa !5
  %293 = trunc i64 %indvars.iv.next1486 to i32
  %cmp642 = icmp slt i32 %293, %292
  br i1 %cmp642, label %while.cond, label %if.then644

if.then644:                                       ; preds = %while.body
  %call653 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str15, i64 0, i64 0), i32 %272, i32 %288) #1
  call void @exit(i32 1) #9
  unreachable

for.cond655.loopexit:                             ; preds = %while.cond
  %294 = mul nsw i64 %indvars.iv1501, 3
  %arrayidx674 = getelementptr inbounds double*** %269, i64 %indvars.iv1485
  %295 = load double*** %arrayidx674, align 8, !tbaa !1
  %296 = load double** %295, align 8, !tbaa !1
  %arrayidx670 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %270, i64 %294
  %297 = load double* %arrayidx670, align 8, !tbaa !12
  %298 = load double* %296, align 8, !tbaa !12
  %add677 = fadd double %297, %298
  store double %add677, double* %296, align 8, !tbaa !12
  %299 = add nsw i64 %294, 1
  %arrayidx670.1 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %270, i64 %299
  %300 = load double* %arrayidx670.1, align 8, !tbaa !12
  %arrayidx676.1 = getelementptr inbounds double* %296, i64 1
  %301 = load double* %arrayidx676.1, align 8, !tbaa !12
  %add677.1 = fadd double %300, %301
  store double %add677.1, double* %arrayidx676.1, align 8, !tbaa !12
  %302 = add nsw i64 %294, 2
  %arrayidx670.2 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %270, i64 %302
  %303 = load double* %arrayidx670.2, align 8, !tbaa !12
  %arrayidx676.2 = getelementptr inbounds double* %296, i64 2
  %304 = load double* %arrayidx676.2, align 8, !tbaa !12
  %add677.2 = fadd double %303, %304
  store double %add677.2, double* %arrayidx676.2, align 8, !tbaa !12
  %arrayidx675.1 = getelementptr inbounds double** %295, i64 1
  %305 = load double** %arrayidx675.1, align 8, !tbaa !1
  %arrayidx670.11495 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %275, i64 %294
  %306 = load double* %arrayidx670.11495, align 8, !tbaa !12
  %307 = load double* %305, align 8, !tbaa !12
  %add677.11496 = fadd double %306, %307
  store double %add677.11496, double* %305, align 8, !tbaa !12
  %arrayidx670.1.1 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %275, i64 %299
  %308 = load double* %arrayidx670.1.1, align 8, !tbaa !12
  %arrayidx676.1.1 = getelementptr inbounds double* %305, i64 1
  %309 = load double* %arrayidx676.1.1, align 8, !tbaa !12
  %add677.1.1 = fadd double %308, %309
  store double %add677.1.1, double* %arrayidx676.1.1, align 8, !tbaa !12
  %arrayidx670.2.1 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %275, i64 %302
  %310 = load double* %arrayidx670.2.1, align 8, !tbaa !12
  %arrayidx676.2.1 = getelementptr inbounds double* %305, i64 2
  %311 = load double* %arrayidx676.2.1, align 8, !tbaa !12
  %add677.2.1 = fadd double %310, %311
  store double %add677.2.1, double* %arrayidx676.2.1, align 8, !tbaa !12
  %arrayidx675.2 = getelementptr inbounds double** %295, i64 2
  %312 = load double** %arrayidx675.2, align 8, !tbaa !1
  %arrayidx670.21497 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %278, i64 %294
  %313 = load double* %arrayidx670.21497, align 8, !tbaa !12
  %314 = load double* %312, align 8, !tbaa !12
  %add677.21498 = fadd double %313, %314
  store double %add677.21498, double* %312, align 8, !tbaa !12
  %arrayidx670.1.2 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %278, i64 %299
  %315 = load double* %arrayidx670.1.2, align 8, !tbaa !12
  %arrayidx676.1.2 = getelementptr inbounds double* %312, i64 1
  %316 = load double* %arrayidx676.1.2, align 8, !tbaa !12
  %add677.1.2 = fadd double %315, %316
  store double %add677.1.2, double* %arrayidx676.1.2, align 8, !tbaa !12
  %arrayidx670.2.2 = getelementptr inbounds [12 x [12 x double]]* %Ke, i64 0, i64 %278, i64 %302
  %317 = load double* %arrayidx670.2.2, align 8, !tbaa !12
  %arrayidx676.2.2 = getelementptr inbounds double* %312, i64 2
  %318 = load double* %arrayidx676.2.2, align 8, !tbaa !12
  %add677.2.2 = fadd double %317, %318
  store double %add677.2.2, double* %arrayidx676.2.2, align 8, !tbaa !12
  br label %for.inc685

for.inc685:                                       ; preds = %for.cond655.loopexit, %for.body608
  %indvars.iv.next1502 = add nuw nsw i64 %indvars.iv1501, 1
  %319 = trunc i64 %indvars.iv.next1502 to i32
  %cmp606 = icmp slt i32 %319, 4
  br i1 %cmp606, label %for.body608, label %for.inc688

for.inc688:                                       ; preds = %for.inc685
  %indvars.iv.next1506 = add nuw nsw i64 %indvars.iv1505, 1
  %320 = trunc i64 %indvars.iv.next1506 to i32
  %cmp532 = icmp slt i32 %320, 4
  br i1 %cmp532, label %for.body534, label %for.inc691

for.inc691:                                       ; preds = %for.inc688
  %indvars.iv.next1511 = add nuw nsw i64 %indvars.iv1510, 1
  %321 = load i32* @ARCHelems, align 4, !tbaa !5
  %322 = trunc i64 %indvars.iv.next1511 to i32
  %cmp185 = icmp slt i32 %322, %321
  br i1 %cmp185, label %for.cond188.preheader, label %for.end693

for.end693:                                       ; preds = %for.inc691, %for.cond184.preheader, %for.cond111.preheader
  %323 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %fputc1210 = call i32 @fputc(i32 10, %struct._IO_FILE* %323) #8
  %cmp6961373 = icmp slt i32 %conv, 1
  br i1 %cmp6961373, label %for.end949, label %for.cond699.preheader

for.cond699.preheader:                            ; preds = %if.end946, %for.end693
  %disptminus.01377 = phi i32 [ %dispt.01376, %if.end946 ], [ 2, %for.end693 ]
  %dispt.01376 = phi i32 [ %disptplus.01375, %if.end946 ], [ 1, %for.end693 ]
  %disptplus.01375 = phi i32 [ %disptminus.01377, %if.end946 ], [ 0, %for.end693 ]
  %iter.01374 = phi i32 [ %inc948, %if.end946 ], [ 1, %for.end693 ]
  %324 = load i32* @ARCHnodes, align 4, !tbaa !5
  %cmp7001359 = icmp sgt i32 %324, 0
  %idxprom709 = sext i32 %disptplus.01375 to i64
  br i1 %cmp7001359, label %for.cond703.preheader.lr.ph, label %for.end718

for.cond703.preheader.lr.ph:                      ; preds = %for.cond699.preheader
  %325 = load double**** @disp, align 8, !tbaa !1
  %arrayidx710 = getelementptr inbounds double*** %325, i64 %idxprom709
  %326 = load double*** %arrayidx710, align 8, !tbaa !1
  br label %for.cond703.preheader

for.cond703.preheader:                            ; preds = %for.cond703.preheader, %for.cond703.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %for.cond703.preheader.lr.ph ], [ %indvars.iv.next, %for.cond703.preheader ]
  %arrayidx711 = getelementptr inbounds double** %326, i64 %indvars.iv
  %327 = load double** %arrayidx711, align 8, !tbaa !1
  %328 = bitcast double* %327 to i8*
  call void @llvm.memset.p0i8.i64(i8* %328, i8 0, i64 24, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %329 = trunc i64 %indvars.iv.next to i32
  %cmp700 = icmp slt i32 %329, %324
  br i1 %cmp700, label %for.cond703.preheader, label %for.end718

for.end718:                                       ; preds = %for.cond703.preheader, %for.cond699.preheader
  %330 = load double**** @K, align 8, !tbaa !1
  %331 = load i32** @ARCHmatrixcol, align 8, !tbaa !1
  %332 = load i32** @ARCHmatrixindex, align 8, !tbaa !1
  %idxprom719 = sext i32 %dispt.01376 to i64
  %333 = load double**** @disp, align 8, !tbaa !1
  %arrayidx720 = getelementptr inbounds double*** %333, i64 %idxprom719
  %334 = load double*** %arrayidx720, align 8, !tbaa !1
  %arrayidx722 = getelementptr inbounds double*** %333, i64 %idxprom709
  %335 = load double*** %arrayidx722, align 8, !tbaa !1
  call void @smvp(i32 %324, double*** %330, i32* %331, i32* %332, double** %334, double** %335)
  %conv723 = sitofp i32 %iter.01374 to double
  %336 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %mul724 = fmul double %conv723, %336
  %337 = load i32* @ARCHnodes, align 4, !tbaa !5
  %cmp7261362 = icmp sgt i32 %337, 0
  br i1 %cmp7261362, label %for.cond729.preheader.lr.ph, label %for.end896

for.cond729.preheader.lr.ph:                      ; preds = %for.end718
  %338 = load double**** @disp, align 8, !tbaa !1
  %arrayidx738 = getelementptr inbounds double*** %338, i64 %idxprom709
  %339 = load double*** %arrayidx738, align 8, !tbaa !1
  br label %for.cond729.preheader

for.cond729.preheader:                            ; preds = %for.cond729.preheader.for.cond729.preheader_crit_edge, %for.cond729.preheader.lr.ph
  %340 = phi double [ %336, %for.cond729.preheader.lr.ph ], [ %.pre1541, %for.cond729.preheader.for.cond729.preheader_crit_edge ]
  %indvars.iv1415 = phi i64 [ 0, %for.cond729.preheader.lr.ph ], [ %indvars.iv.next1416, %for.cond729.preheader.for.cond729.preheader_crit_edge ]
  %arrayidx739 = getelementptr inbounds double** %339, i64 %indvars.iv1415
  %341 = load double** %arrayidx739, align 8, !tbaa !1
  %342 = fmul double %340, %340
  %343 = load double* %341, align 8, !tbaa !12
  %344 = fmul double %342, %343
  %mul741 = fsub double -0.000000e+00, %344
  store double %mul741, double* %341, align 8, !tbaa !12
  %345 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %346 = fmul double %345, %345
  %arrayidx740.1 = getelementptr inbounds double* %341, i64 1
  %347 = load double* %arrayidx740.1, align 8, !tbaa !12
  %348 = fmul double %346, %347
  %mul741.1 = fsub double -0.000000e+00, %348
  store double %mul741.1, double* %arrayidx740.1, align 8, !tbaa !12
  %349 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %350 = fmul double %349, %349
  %arrayidx740.2 = getelementptr inbounds double* %341, i64 2
  %351 = load double* %arrayidx740.2, align 8, !tbaa !12
  %352 = fmul double %350, %351
  %mul741.2 = fsub double -0.000000e+00, %352
  store double %mul741.2, double* %arrayidx740.2, align 8, !tbaa !12
  %indvars.iv.next1416 = add nuw nsw i64 %indvars.iv1415, 1
  %353 = trunc i64 %indvars.iv.next1416 to i32
  %cmp726 = icmp slt i32 %353, %337
  br i1 %cmp726, label %for.cond729.preheader.for.cond729.preheader_crit_edge, label %for.cond748.loopexit

for.cond729.preheader.for.cond729.preheader_crit_edge: ; preds = %for.cond729.preheader
  %.pre1541 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  br label %for.cond729.preheader

for.cond748.loopexit:                             ; preds = %for.cond729.preheader
  br i1 %cmp7261362, label %for.cond752.preheader.lr.ph, label %for.end896

for.cond752.preheader.lr.ph:                      ; preds = %for.cond748.loopexit
  %idxprom781 = sext i32 %disptminus.01377 to i64
  %mul.i1344 = fmul double %mul724, 0x401921FB54442D18
  %.pre1542.pre = load double**** @disp, align 8, !tbaa !1
  br label %for.cond752.preheader

for.cond752.preheader:                            ; preds = %for.inc823, %for.cond752.preheader.lr.ph
  %.pre1542 = phi double*** [ %.pre1542.pre, %for.cond752.preheader.lr.ph ], [ %381, %for.inc823 ]
  %indvars.iv1419 = phi i64 [ 0, %for.cond752.preheader.lr.ph ], [ %indvars.iv.next1420, %for.inc823 ]
  br label %for.body755

for.body755:                                      ; preds = %phi0.exit, %for.cond752.preheader
  %354 = phi double*** [ %.pre1542, %for.cond752.preheader ], [ %381, %phi0.exit ]
  %indvars.iv1417 = phi i64 [ 0, %for.cond752.preheader ], [ %indvars.iv.next1418, %phi0.exit ]
  %355 = load double*** @M, align 8, !tbaa !1
  %arrayidx758 = getelementptr inbounds double** %355, i64 %indvars.iv1419
  %356 = load double** %arrayidx758, align 8, !tbaa !1
  %arrayidx759 = getelementptr inbounds double* %356, i64 %indvars.iv1417
  %357 = load double* %arrayidx759, align 8, !tbaa !12
  %mul760 = fmul double %357, 2.000000e+00
  %arrayidx764 = getelementptr inbounds double*** %354, i64 %idxprom719
  %358 = load double*** %arrayidx764, align 8, !tbaa !1
  %arrayidx765 = getelementptr inbounds double** %358, i64 %indvars.iv1419
  %359 = load double** %arrayidx765, align 8, !tbaa !1
  %arrayidx766 = getelementptr inbounds double* %359, i64 %indvars.iv1417
  %360 = load double* %arrayidx766, align 8, !tbaa !12
  %mul767 = fmul double %mul760, %360
  %361 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %div772 = fmul double %361, 5.000000e-01
  %362 = load double*** @C, align 8, !tbaa !1
  %arrayidx775 = getelementptr inbounds double** %362, i64 %indvars.iv1419
  %363 = load double** %arrayidx775, align 8, !tbaa !1
  %arrayidx776 = getelementptr inbounds double* %363, i64 %indvars.iv1417
  %364 = load double* %arrayidx776, align 8, !tbaa !12
  %mul777 = fmul double %div772, %364
  %sub778 = fsub double %357, %mul777
  %arrayidx782 = getelementptr inbounds double*** %354, i64 %idxprom781
  %365 = load double*** %arrayidx782, align 8, !tbaa !1
  %arrayidx783 = getelementptr inbounds double** %365, i64 %indvars.iv1419
  %366 = load double** %arrayidx783, align 8, !tbaa !1
  %arrayidx784 = getelementptr inbounds double* %366, i64 %indvars.iv1417
  %367 = load double* %arrayidx784, align 8, !tbaa !12
  %mul785 = fmul double %sub778, %367
  %sub786 = fsub double %mul767, %mul785
  %mul787 = fmul double %361, %361
  %368 = load double*** @M23, align 8, !tbaa !1
  %arrayidx790 = getelementptr inbounds double** %368, i64 %indvars.iv1419
  %369 = load double** %arrayidx790, align 8, !tbaa !1
  %arrayidx791 = getelementptr inbounds double* %369, i64 %indvars.iv1417
  %370 = load double* %arrayidx791, align 8, !tbaa !12
  %371 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %cmp.i = fcmp ult double %371, %mul724
  br i1 %cmp.i, label %phi2.exit, label %if.then.i

if.then.i:                                        ; preds = %for.body755
  %div.i1332 = fdiv double 0x401921FB54442D18, %371
  %div1.i = fdiv double %div.i1332, %371
  %div2.i = fdiv double %mul.i1344, %371
  %call.i1334 = call double @sin(double %div2.i) #1
  %mul3.i = fmul double %div1.i, %call.i1334
  %.pre1543 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  br label %phi2.exit

phi2.exit:                                        ; preds = %if.then.i, %for.body755
  %372 = phi double [ %.pre1543, %if.then.i ], [ %371, %for.body755 ]
  %retval.0.i = phi double [ %mul3.i, %if.then.i ], [ 0.000000e+00, %for.body755 ]
  %mul793 = fmul double %370, %retval.0.i
  %div794 = fmul double %mul793, 5.000000e-01
  %373 = load double*** @C23, align 8, !tbaa !1
  %arrayidx797 = getelementptr inbounds double** %373, i64 %indvars.iv1419
  %374 = load double** %arrayidx797, align 8, !tbaa !1
  %arrayidx798 = getelementptr inbounds double* %374, i64 %indvars.iv1417
  %375 = load double* %arrayidx798, align 8, !tbaa !12
  %cmp.i1335 = fcmp ult double %372, %mul724
  br i1 %cmp.i1335, label %phi1.exit, label %if.then.i1341

if.then.i1341:                                    ; preds = %phi2.exit
  %div.i1337 = fdiv double %mul.i1344, %372
  %call.i1338 = call double @cos(double %div.i1337) #1
  %sub.i1339 = fsub double 1.000000e+00, %call.i1338
  %376 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %div1.i1340 = fdiv double %sub.i1339, %376
  br label %phi1.exit

phi1.exit:                                        ; preds = %if.then.i1341, %phi2.exit
  %377 = phi double [ %376, %if.then.i1341 ], [ %372, %phi2.exit ]
  %retval.0.i1342 = phi double [ %div1.i1340, %if.then.i1341 ], [ 0.000000e+00, %phi2.exit ]
  %mul800 = fmul double %375, %retval.0.i1342
  %div801 = fmul double %mul800, 5.000000e-01
  %add802 = fadd double %div794, %div801
  %378 = load double*** @V23, align 8, !tbaa !1
  %arrayidx805 = getelementptr inbounds double** %378, i64 %indvars.iv1419
  %379 = load double** %arrayidx805, align 8, !tbaa !1
  %arrayidx806 = getelementptr inbounds double* %379, i64 %indvars.iv1417
  %380 = load double* %arrayidx806, align 8, !tbaa !12
  %cmp.i1343 = fcmp ult double %377, %mul724
  br i1 %cmp.i1343, label %phi0.exit, label %if.then.i1349

if.then.i1349:                                    ; preds = %phi1.exit
  %div.i1345 = fdiv double %mul.i1344, %377
  %call.i1346 = call double @sin(double %div.i1345) #1
  %sub.i1347 = fsub double %div.i1345, %call.i1346
  %mul3.i1348 = fmul double %sub.i1347, 0x3FC45F306DC9C883
  br label %phi0.exit

phi0.exit:                                        ; preds = %if.then.i1349, %phi1.exit
  %retval.0.i1350 = phi double [ %mul3.i1348, %if.then.i1349 ], [ 1.000000e+00, %phi1.exit ]
  %mul808 = fmul double %380, %retval.0.i1350
  %div809 = fmul double %mul808, 5.000000e-01
  %add810 = fadd double %add802, %div809
  %mul811 = fmul double %mul787, %add810
  %sub812 = fsub double %sub786, %mul811
  %381 = load double**** @disp, align 8, !tbaa !1
  %arrayidx816 = getelementptr inbounds double*** %381, i64 %idxprom709
  %382 = load double*** %arrayidx816, align 8, !tbaa !1
  %arrayidx817 = getelementptr inbounds double** %382, i64 %indvars.iv1419
  %383 = load double** %arrayidx817, align 8, !tbaa !1
  %arrayidx818 = getelementptr inbounds double* %383, i64 %indvars.iv1417
  %384 = load double* %arrayidx818, align 8, !tbaa !12
  %add819 = fadd double %384, %sub812
  store double %add819, double* %arrayidx818, align 8, !tbaa !12
  %indvars.iv.next1418 = add nuw nsw i64 %indvars.iv1417, 1
  %exitcond = icmp eq i64 %indvars.iv.next1418, 3
  br i1 %exitcond, label %for.inc823, label %for.body755

for.inc823:                                       ; preds = %phi0.exit
  %indvars.iv.next1420 = add nuw nsw i64 %indvars.iv1419, 1
  %385 = load i32* @ARCHnodes, align 4, !tbaa !5
  %386 = trunc i64 %indvars.iv.next1420 to i32
  %cmp749 = icmp slt i32 %386, %385
  br i1 %cmp749, label %for.cond752.preheader, label %for.cond826.loopexit

for.cond826.loopexit:                             ; preds = %for.inc823
  %cmp8271368 = icmp sgt i32 %385, 0
  br i1 %cmp8271368, label %for.cond830.preheader.lr.ph, label %for.end896

for.cond830.preheader.lr.ph:                      ; preds = %for.cond826.loopexit
  %387 = load double**** @disp, align 8, !tbaa !1
  %arrayidx837 = getelementptr inbounds double*** %387, i64 %idxprom709
  %388 = load double*** %arrayidx837, align 8, !tbaa !1
  %389 = load double*** @M, align 8, !tbaa !1
  %390 = load double*** @C, align 8, !tbaa !1
  br label %for.cond830.preheader

for.cond830.preheader:                            ; preds = %for.cond830.preheader, %for.cond830.preheader.lr.ph
  %indvars.iv1424 = phi i64 [ 0, %for.cond830.preheader.lr.ph ], [ %indvars.iv.next1425, %for.cond830.preheader ]
  %arrayidx838 = getelementptr inbounds double** %388, i64 %indvars.iv1424
  %391 = load double** %arrayidx838, align 8, !tbaa !1
  %arrayidx842 = getelementptr inbounds double** %389, i64 %indvars.iv1424
  %392 = load double** %arrayidx842, align 8, !tbaa !1
  %arrayidx847 = getelementptr inbounds double** %390, i64 %indvars.iv1424
  %393 = load double** %arrayidx847, align 8, !tbaa !1
  %394 = load double* %391, align 8, !tbaa !12
  %395 = load double* %392, align 8, !tbaa !12
  %396 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %div844 = fmul double %396, 5.000000e-01
  %397 = load double* %393, align 8, !tbaa !12
  %mul849 = fmul double %div844, %397
  %add850 = fadd double %395, %mul849
  %div851 = fdiv double %394, %add850
  store double %div851, double* %391, align 8, !tbaa !12
  %arrayidx839.1 = getelementptr inbounds double* %391, i64 1
  %398 = load double* %arrayidx839.1, align 8, !tbaa !12
  %arrayidx843.1 = getelementptr inbounds double* %392, i64 1
  %399 = load double* %arrayidx843.1, align 8, !tbaa !12
  %400 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %div844.1 = fmul double %400, 5.000000e-01
  %arrayidx848.1 = getelementptr inbounds double* %393, i64 1
  %401 = load double* %arrayidx848.1, align 8, !tbaa !12
  %mul849.1 = fmul double %div844.1, %401
  %add850.1 = fadd double %399, %mul849.1
  %div851.1 = fdiv double %398, %add850.1
  store double %div851.1, double* %arrayidx839.1, align 8, !tbaa !12
  %arrayidx839.2 = getelementptr inbounds double* %391, i64 2
  %402 = load double* %arrayidx839.2, align 8, !tbaa !12
  %arrayidx843.2 = getelementptr inbounds double* %392, i64 2
  %403 = load double* %arrayidx843.2, align 8, !tbaa !12
  %404 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %div844.2 = fmul double %404, 5.000000e-01
  %arrayidx848.2 = getelementptr inbounds double* %393, i64 2
  %405 = load double* %arrayidx848.2, align 8, !tbaa !12
  %mul849.2 = fmul double %div844.2, %405
  %add850.2 = fadd double %403, %mul849.2
  %div851.2 = fdiv double %402, %add850.2
  store double %div851.2, double* %arrayidx839.2, align 8, !tbaa !12
  %indvars.iv.next1425 = add nuw nsw i64 %indvars.iv1424, 1
  %406 = trunc i64 %indvars.iv.next1425 to i32
  %cmp827 = icmp slt i32 %406, %385
  br i1 %cmp827, label %for.cond830.preheader, label %for.cond864.loopexit

for.cond864.loopexit:                             ; preds = %for.cond830.preheader
  br i1 %cmp8271368, label %for.cond868.preheader.lr.ph, label %for.end896

for.cond868.preheader.lr.ph:                      ; preds = %for.cond864.loopexit
  %407 = load double**** @disp, align 8, !tbaa !1
  %arrayidx876 = getelementptr inbounds double*** %407, i64 %idxprom709
  %408 = load double*** %arrayidx876, align 8, !tbaa !1
  %idxprom881 = sext i32 %disptminus.01377 to i64
  %arrayidx882 = getelementptr inbounds double*** %407, i64 %idxprom881
  %409 = load double*** %arrayidx882, align 8, !tbaa !1
  %410 = load double*** @vel, align 8, !tbaa !1
  br label %for.cond868.preheader

for.cond868.preheader:                            ; preds = %for.cond868.preheader, %for.cond868.preheader.lr.ph
  %indvars.iv1429 = phi i64 [ 0, %for.cond868.preheader.lr.ph ], [ %indvars.iv.next1430, %for.cond868.preheader ]
  %arrayidx877 = getelementptr inbounds double** %408, i64 %indvars.iv1429
  %411 = load double** %arrayidx877, align 8, !tbaa !1
  %arrayidx883 = getelementptr inbounds double** %409, i64 %indvars.iv1429
  %412 = load double** %arrayidx883, align 8, !tbaa !1
  %arrayidx889 = getelementptr inbounds double** %410, i64 %indvars.iv1429
  %413 = load double** %arrayidx889, align 8, !tbaa !1
  %414 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %div872 = fdiv double 5.000000e-01, %414
  %415 = load double* %411, align 8, !tbaa !12
  %416 = load double* %412, align 8, !tbaa !12
  %sub885 = fsub double %415, %416
  %mul886 = fmul double %div872, %sub885
  store double %mul886, double* %413, align 8, !tbaa !12
  %417 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %div872.1 = fdiv double 5.000000e-01, %417
  %arrayidx878.1 = getelementptr inbounds double* %411, i64 1
  %418 = load double* %arrayidx878.1, align 8, !tbaa !12
  %arrayidx884.1 = getelementptr inbounds double* %412, i64 1
  %419 = load double* %arrayidx884.1, align 8, !tbaa !12
  %sub885.1 = fsub double %418, %419
  %mul886.1 = fmul double %div872.1, %sub885.1
  %arrayidx890.1 = getelementptr inbounds double* %413, i64 1
  store double %mul886.1, double* %arrayidx890.1, align 8, !tbaa !12
  %420 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 0), align 8, !tbaa !9
  %div872.2 = fdiv double 5.000000e-01, %420
  %arrayidx878.2 = getelementptr inbounds double* %411, i64 2
  %421 = load double* %arrayidx878.2, align 8, !tbaa !12
  %arrayidx884.2 = getelementptr inbounds double* %412, i64 2
  %422 = load double* %arrayidx884.2, align 8, !tbaa !12
  %sub885.2 = fsub double %421, %422
  %mul886.2 = fmul double %div872.2, %sub885.2
  %arrayidx890.2 = getelementptr inbounds double* %413, i64 2
  store double %mul886.2, double* %arrayidx890.2, align 8, !tbaa !12
  %indvars.iv.next1430 = add nuw nsw i64 %indvars.iv1429, 1
  %423 = trunc i64 %indvars.iv.next1430 to i32
  %cmp865 = icmp slt i32 %423, %385
  br i1 %cmp865, label %for.cond868.preheader, label %for.end896

for.end896:                                       ; preds = %for.cond868.preheader, %for.cond864.loopexit, %for.cond826.loopexit, %for.cond748.loopexit, %for.end718
  %rem = srem i32 %iter.01374, 30
  %cmp897 = icmp eq i32 %rem, 0
  br i1 %cmp897, label %if.then899, label %if.end946

if.then899:                                       ; preds = %for.end896
  %424 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call900 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %424, i8* getelementptr inbounds ([14 x i8]* @.str16, i64 0, i64 0), i32 %iter.01374) #7
  %425 = load i64* bitcast (i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 6) to i64*), align 8
  %426 = trunc i64 %425 to i32
  %427 = load i32* @ARCHmine, align 4, !tbaa !5
  %cmp901 = icmp sgt i32 %426, %427
  %428 = lshr i64 %425, 32
  %429 = trunc i64 %428 to i32
  br i1 %cmp901, label %if.end922, label %if.then903

if.then903:                                       ; preds = %if.then899
  %sext1548 = shl i64 %425, 32
  %idxprom904 = ashr exact i64 %sext1548, 32
  %430 = load i32** @ARCHglobalnode, align 8, !tbaa !1
  %arrayidx905 = getelementptr inbounds i32* %430, i64 %idxprom904
  %431 = load i32* %arrayidx905, align 4, !tbaa !5
  %432 = load double**** @disp, align 8, !tbaa !1
  %arrayidx908 = getelementptr inbounds double*** %432, i64 %idxprom709
  %433 = load double*** %arrayidx908, align 8, !tbaa !1
  %arrayidx909 = getelementptr inbounds double** %433, i64 %idxprom904
  %434 = load double** %arrayidx909, align 8, !tbaa !1
  %435 = load double* %434, align 8, !tbaa !12
  %arrayidx915 = getelementptr inbounds double* %434, i64 1
  %436 = load double* %arrayidx915, align 8, !tbaa !12
  %arrayidx920 = getelementptr inbounds double* %434, i64 2
  %437 = load double* %arrayidx920, align 8, !tbaa !12
  %call921 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str17, i64 0, i64 0), i32 %431, double %435, double %436, double %437) #1
  %.pre1544 = load i32* getelementptr inbounds (%struct.source* @Src, i64 0, i32 7), align 4, !tbaa !26
  %.pre1545 = load i32* @ARCHmine, align 4, !tbaa !5
  br label %if.end922

if.end922:                                        ; preds = %if.then903, %if.then899
  %438 = phi i32 [ %427, %if.then899 ], [ %.pre1545, %if.then903 ]
  %439 = phi i32 [ %429, %if.then899 ], [ %.pre1544, %if.then903 ]
  %cmp923 = icmp sgt i32 %439, %438
  br i1 %cmp923, label %if.end944, label %if.then925

if.then925:                                       ; preds = %if.end922
  %idxprom926 = sext i32 %439 to i64
  %440 = load i32** @ARCHglobalnode, align 8, !tbaa !1
  %arrayidx927 = getelementptr inbounds i32* %440, i64 %idxprom926
  %441 = load i32* %arrayidx927, align 4, !tbaa !5
  %442 = load double**** @disp, align 8, !tbaa !1
  %arrayidx930 = getelementptr inbounds double*** %442, i64 %idxprom709
  %443 = load double*** %arrayidx930, align 8, !tbaa !1
  %arrayidx931 = getelementptr inbounds double** %443, i64 %idxprom926
  %444 = load double** %arrayidx931, align 8, !tbaa !1
  %445 = load double* %444, align 8, !tbaa !12
  %arrayidx937 = getelementptr inbounds double* %444, i64 1
  %446 = load double* %arrayidx937, align 8, !tbaa !12
  %arrayidx942 = getelementptr inbounds double* %444, i64 2
  %447 = load double* %arrayidx942, align 8, !tbaa !12
  %call943 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str17, i64 0, i64 0), i32 %441, double %445, double %446, double %447) #1
  br label %if.end944

if.end944:                                        ; preds = %if.then925, %if.end922
  %448 = load %struct._IO_FILE** @stdout, align 8, !tbaa !1
  %call945 = call i32 @fflush(%struct._IO_FILE* %448) #1
  br label %if.end946

if.end946:                                        ; preds = %if.end944, %for.end896
  %inc948 = add nsw i32 %iter.01374, 1
  %exitcond1431 = icmp eq i32 %iter.01374, %conv
  br i1 %exitcond1431, label %for.end949, label %for.cond699.preheader

for.end949:                                       ; preds = %if.end946, %for.end693
  %449 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %450 = load i8** @progname, align 8, !tbaa !1
  %451 = load i32* @ARCHglobalnodes, align 4, !tbaa !5
  %452 = load i32* @ARCHglobalelems, align 4, !tbaa !5
  %call950 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %449, i8* getelementptr inbounds ([36 x i8]* @.str18, i64 0, i64 0), i8* %450, i32 %451, i32 %452, i32 %conv) #7
  %453 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %fputc1213 = call i32 @fputc(i32 10, %struct._IO_FILE* %453) #8
  %454 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call952 = call i32 @fflush(%struct._IO_FILE* %454) #1
  %455 = load i32* getelementptr inbounds (%struct.options* @options, i64 0, i32 0), align 4, !tbaa !7
  %tobool953 = icmp eq i32 %455, 0
  br i1 %tobool953, label %if.then954, label %if.end956

if.then954:                                       ; preds = %for.end949
  %456 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %457 = load i8** @progname, align 8, !tbaa !1
  %call955 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %456, i8* getelementptr inbounds ([39 x i8]* @.str19, i64 0, i64 0), i8* %457) #7
  br label %if.end956

if.end956:                                        ; preds = %if.then954, %for.end949
  call void @llvm.lifetime.end(i64 96, i8* %5) #1
  call void @llvm.lifetime.end(i64 96, i8* %v40.i) #1
  call void @llvm.lifetime.end(i64 96, i8* %4) #1
  call void @llvm.lifetime.end(i64 96, i8* %3) #1
  call void @llvm.lifetime.end(i64 96, i8* %2) #1
  call void @llvm.lifetime.end(i64 96, i8* %1) #1
  call void @llvm.lifetime.end(i64 1152, i8* %0) #1
  ret i32 0

if.then235.1:                                     ; preds = %for.inc240
  %inc236.1 = add nsw i32 %verticesonbnd.1, 1
  %idxprom237.11549 = zext i32 %verticesonbnd.1 to i64
  %arrayidx238.1 = getelementptr inbounds [4 x i32]* %bv, i64 0, i64 %idxprom237.11549
  store i32 1, i32* %arrayidx238.1, align 4, !tbaa !5
  br label %for.inc240.1

for.inc240.1:                                     ; preds = %if.then235.1, %for.inc240
  %verticesonbnd.1.1 = phi i32 [ %inc236.1, %if.then235.1 ], [ %verticesonbnd.1, %for.inc240 ]
  %arrayidx230.2 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 2
  %458 = load i32* %arrayidx230.2, align 8, !tbaa !5
  %idxprom231.2 = sext i32 %458 to i64
  %arrayidx232.2 = getelementptr inbounds i32* %136, i64 %idxprom231.2
  %459 = load i32* %arrayidx232.2, align 4, !tbaa !5
  %cmp233.2 = icmp eq i32 %459, 1
  br i1 %cmp233.2, label %for.inc240.2, label %if.then235.2

if.then235.2:                                     ; preds = %for.inc240.1
  %inc236.2 = add nsw i32 %verticesonbnd.1.1, 1
  %idxprom237.2 = sext i32 %verticesonbnd.1.1 to i64
  %arrayidx238.2 = getelementptr inbounds [4 x i32]* %bv, i64 0, i64 %idxprom237.2
  store i32 2, i32* %arrayidx238.2, align 4, !tbaa !5
  br label %for.inc240.2

for.inc240.2:                                     ; preds = %if.then235.2, %for.inc240.1
  %verticesonbnd.1.2 = phi i32 [ %inc236.2, %if.then235.2 ], [ %verticesonbnd.1.1, %for.inc240.1 ]
  %arrayidx230.3 = getelementptr inbounds [4 x i32]* %cor, i64 0, i64 3
  %460 = load i32* %arrayidx230.3, align 4, !tbaa !5
  %idxprom231.3 = sext i32 %460 to i64
  %arrayidx232.3 = getelementptr inbounds i32* %136, i64 %idxprom231.3
  %461 = load i32* %arrayidx232.3, align 4, !tbaa !5
  %cmp233.3 = icmp eq i32 %461, 1
  br i1 %cmp233.3, label %for.inc240.3, label %if.then235.3

if.then235.3:                                     ; preds = %for.inc240.2
  %inc236.3 = add nsw i32 %verticesonbnd.1.2, 1
  %idxprom237.3 = sext i32 %verticesonbnd.1.2 to i64
  %arrayidx238.3 = getelementptr inbounds [4 x i32]* %bv, i64 0, i64 %idxprom237.3
  store i32 3, i32* %arrayidx238.3, align 4, !tbaa !5
  br label %for.inc240.3

for.inc240.3:                                     ; preds = %if.then235.3, %for.inc240.2
  %verticesonbnd.1.3 = phi i32 [ %inc236.3, %if.then235.3 ], [ %verticesonbnd.1.2, %for.inc240.2 ]
  %cmp243 = icmp eq i32 %verticesonbnd.1.3, 3
  br i1 %cmp243, label %for.cond246.preheader, label %for.inc240.3.for.cond276.preheader_crit_edge

for.inc240.3.for.cond276.preheader_crit_edge:     ; preds = %for.inc240.3
  %arrayidx293.pre = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 0
  %arrayidx293.1.pre = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 0, i64 1
  %arrayidx293.11462.pre = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 0
  %arrayidx293.1.1.pre = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 1, i64 1
  %arrayidx293.21463.pre = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 0
  %arrayidx293.1.2.pre = getelementptr inbounds [4 x [3 x double]]* %vertices, i64 0, i64 2, i64 1
  br label %for.cond276.preheader

if.else367.1:                                     ; preds = %for.inc380
  %462 = bitcast double* %arrayidx2.3.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %462, i8 0, i64 24, i32 8, i1 false)
  br label %for.inc380.1

if.then352.1:                                     ; preds = %for.inc380
  store double 0x4030A507152329B8, double* %arrayidx2.3.i, align 8, !tbaa !12
  store double 0x402E24EC3EEE0681, double* %arrayidx2.4.i, align 16, !tbaa !12
  store double 0x40335935EEBC8FB3, double* %arrayidx2.5.i, align 8, !tbaa !12
  br label %for.inc380.1

for.inc380.1:                                     ; preds = %if.then352.1, %if.else367.1
  %.pre45.i = phi double [ 0x40335935EEBC8FB3, %if.then352.1 ], [ 0.000000e+00, %if.else367.1 ]
  %.pre44.i = phi double [ 0x402E24EC3EEE0681, %if.then352.1 ], [ 0.000000e+00, %if.else367.1 ]
  %.pre43.i = phi double [ 0x4030A507152329B8, %if.then352.1 ], [ 0.000000e+00, %if.else367.1 ]
  %463 = load i32* %arrayidx230.2, align 8, !tbaa !5
  %cmp350.2 = icmp eq i32 %463, %213
  br i1 %cmp350.2, label %if.then352.2, label %if.else367.2

if.else367.2:                                     ; preds = %for.inc380.1
  %464 = bitcast double* %arrayidx2.6.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %464, i8 0, i64 24, i32 16, i1 false)
  br label %for.inc380.2

if.then352.2:                                     ; preds = %for.inc380.1
  store double 0x4030A507152329B8, double* %arrayidx2.6.i, align 16, !tbaa !12
  store double 0x402E24EC3EEE0681, double* %arrayidx2.7.i, align 8, !tbaa !12
  store double 0x40335935EEBC8FB3, double* %arrayidx2.8.i, align 16, !tbaa !12
  br label %for.inc380.2

for.inc380.2:                                     ; preds = %if.then352.2, %if.else367.2
  %.pre48.i = phi double [ 0x40335935EEBC8FB3, %if.then352.2 ], [ 0.000000e+00, %if.else367.2 ]
  %.pre47.i = phi double [ 0x402E24EC3EEE0681, %if.then352.2 ], [ 0.000000e+00, %if.else367.2 ]
  %.pre46.i = phi double [ 0x4030A507152329B8, %if.then352.2 ], [ 0.000000e+00, %if.else367.2 ]
  %cmp350.3 = icmp eq i32 %460, %213
  br i1 %cmp350.3, label %if.then352.3, label %if.else367.3

if.else367.3:                                     ; preds = %for.inc380.2
  %465 = bitcast double* %arrayidx2.9.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %465, i8 0, i64 24, i32 8, i1 false)
  br label %for.inc380.3

if.then352.3:                                     ; preds = %for.inc380.2
  store double 0x4030A507152329B8, double* %arrayidx2.9.i, align 8, !tbaa !12
  store double 0x402E24EC3EEE0681, double* %arrayidx2.10.i, align 16, !tbaa !12
  store double 0x40335935EEBC8FB3, double* %arrayidx2.11.i, align 8, !tbaa !12
  br label %for.inc380.3

for.inc380.3:                                     ; preds = %if.then352.3, %if.else367.3
  %.pre51.i = phi double [ 0x40335935EEBC8FB3, %if.then352.3 ], [ 0.000000e+00, %if.else367.3 ]
  %.pre50.i = phi double [ 0x402E24EC3EEE0681, %if.then352.3 ], [ 0.000000e+00, %if.else367.3 ]
  %.pre49.i = phi double [ 0x4030A507152329B8, %if.then352.3 ], [ 0.000000e+00, %if.else367.3 ]
  %mul.i1266 = fmul double %187, %.pre.i
  store double %mul.i1266, double* %arraydecay385, align 16, !tbaa !12
  %mul.1.i = fmul double %189, %.pre41.i
  store double %mul.1.i, double* %arrayidx4.1.i1267, align 8, !tbaa !12
  %mul.2.i = fmul double %191, %.pre42.i
  store double %mul.2.i, double* %arrayidx4.2.i1268, align 16, !tbaa !12
  %mul.3.i = fmul double %193, %.pre43.i
  store double %mul.3.i, double* %arrayidx4.3.i, align 8, !tbaa !12
  %mul.4.i = fmul double %195, %.pre44.i
  store double %mul.4.i, double* %arrayidx4.4.i, align 16, !tbaa !12
  %mul.5.i = fmul double %197, %.pre45.i
  store double %mul.5.i, double* %arrayidx4.5.i, align 8, !tbaa !12
  %mul.6.i = fmul double %199, %.pre46.i
  store double %mul.6.i, double* %arrayidx4.6.i, align 16, !tbaa !12
  %mul.7.i = fmul double %201, %.pre47.i
  store double %mul.7.i, double* %arrayidx4.7.i, align 8, !tbaa !12
  %mul.8.i = fmul double %203, %.pre48.i
  store double %mul.8.i, double* %arrayidx4.8.i, align 16, !tbaa !12
  %mul.9.i = fmul double %205, %.pre49.i
  store double %mul.9.i, double* %arrayidx4.9.i, align 8, !tbaa !12
  %mul.10.i = fmul double %207, %.pre50.i
  store double %mul.10.i, double* %arrayidx4.10.i, align 16, !tbaa !12
  %mul.11.i = fmul double %209, %.pre51.i
  store double %mul.11.i, double* %arrayidx4.11.i, align 8, !tbaa !12
  %mul.i1269 = fmul double %add328, %.pre.i
  store double %mul.i1269, double* %arraydecay388, align 16, !tbaa !12
  %mul.1.i1272 = fmul double %add328.1, %.pre41.i
  store double %mul.1.i1272, double* %arrayidx4.1.i1273, align 8, !tbaa !12
  %mul.2.i1276 = fmul double %add328.2, %.pre42.i
  store double %mul.2.i1276, double* %arrayidx4.2.i1277, align 16, !tbaa !12
  %mul.3.i1280 = fmul double %add328.3, %.pre43.i
  store double %mul.3.i1280, double* %arrayidx4.3.i1281, align 8, !tbaa !12
  %mul.4.i1284 = fmul double %add328.4, %.pre44.i
  store double %mul.4.i1284, double* %arrayidx4.4.i1285, align 16, !tbaa !12
  %mul.5.i1288 = fmul double %add328.5, %.pre45.i
  store double %mul.5.i1288, double* %arrayidx4.5.i1289, align 8, !tbaa !12
  %mul.6.i1292 = fmul double %add328.6, %.pre46.i
  store double %mul.6.i1292, double* %arrayidx4.6.i1293, align 16, !tbaa !12
  %mul.7.i1296 = fmul double %add328.7, %.pre47.i
  store double %mul.7.i1296, double* %arrayidx4.7.i1297, align 8, !tbaa !12
  %mul.8.i1300 = fmul double %add328.8, %.pre48.i
  store double %mul.8.i1300, double* %arrayidx4.8.i1301, align 16, !tbaa !12
  %mul.9.i1304 = fmul double %add328.9, %.pre49.i
  store double %mul.9.i1304, double* %arrayidx4.9.i1305, align 8, !tbaa !12
  %mul.10.i1308 = fmul double %add328.10, %.pre50.i
  store double %mul.10.i1308, double* %arrayidx4.10.i1309, align 16, !tbaa !12
  %mul.11.i1312 = fmul double %add328.11, %.pre51.i
  store double %mul.11.i1312, double* %arrayidx4.11.i1313, align 8, !tbaa !12
  call void @llvm.lifetime.start(i64 96, i8* %95) #1
  br label %for.body.i
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @arch_init(i32 %argc, i8** nocapture readonly %argv, %struct.options* nocapture %op) #0 {
entry:
  %0 = load i8** %argv, align 8, !tbaa !1
  store i8* %0, i8** @progname, align 8, !tbaa !1
  tail call void @arch_parsecommandline(i32 %argc, i8** %argv, %struct.options* %op)
  %1 = load %struct._IO_FILE** @stdin, align 8, !tbaa !1
  store %struct._IO_FILE* %1, %struct._IO_FILE** @packfile, align 8, !tbaa !1
  tail call void @readpackfile(%struct._IO_FILE* %1, %struct.options* %op)
  ret void
}

; Function Attrs: nounwind uwtable
define void @mem_init() #0 {
entry:
  %0 = load i32* @ARCHnodes, align 4, !tbaa !5
  %conv = sext i32 %0 to i64
  %mul = shl nsw i64 %conv, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #1
  %1 = bitcast i8* %call to double*
  store double* %1, double** @nodekindf, align 8, !tbaa !1
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([29 x i8]* @.str48, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %2) #8
  %4 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call3 = tail call i32 @fflush(%struct._IO_FILE* %4) #1
  tail call void @exit(i32 0) #9
  unreachable

if.end:                                           ; preds = %entry
  %mul5 = shl nsw i64 %conv, 2
  %call6 = tail call noalias i8* @malloc(i64 %mul5) #1
  %5 = bitcast i8* %call6 to i32*
  store i32* %5, i32** @nodekind, align 8, !tbaa !1
  %cmp7 = icmp eq i8* %call6, null
  br i1 %cmp7, label %if.then9, label %if.end12

if.then9:                                         ; preds = %if.end
  %6 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str49, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %6) #8
  %8 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call11 = tail call i32 @fflush(%struct._IO_FILE* %8) #1
  tail call void @exit(i32 0) #9
  unreachable

if.end12:                                         ; preds = %if.end
  %9 = load i32* @ARCHelems, align 4, !tbaa !5
  %conv13 = sext i32 %9 to i64
  %mul14 = shl nsw i64 %conv13, 2
  %call15 = tail call noalias i8* @malloc(i64 %mul14) #1
  %10 = bitcast i8* %call15 to i32*
  store i32* %10, i32** @source_elms, align 8, !tbaa !1
  %cmp16 = icmp eq i8* %call15, null
  br i1 %cmp16, label %if.then18, label %if.end21

if.then18:                                        ; preds = %if.end12
  %11 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8]* @.str50, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %11) #8
  %13 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call20 = tail call i32 @fflush(%struct._IO_FILE* %13) #1
  tail call void @exit(i32 0) #9
  unreachable

if.end21:                                         ; preds = %if.end12
  %call24 = tail call noalias i8* @malloc(i64 %mul) #1
  %14 = bitcast i8* %call24 to double**
  store double** %14, double*** @vel, align 8, !tbaa !1
  %cmp25 = icmp eq i8* %call24, null
  br i1 %cmp25, label %if.then27, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end21
  %cmp31502 = icmp sgt i32 %0, 0
  br i1 %cmp31502, label %for.body, label %for.end

if.then27:                                        ; preds = %if.end21
  %15 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str51, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %15) #8
  %17 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call29 = tail call i32 @fflush(%struct._IO_FILE* %17) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond:                                         ; preds = %for.body
  %inc = add nsw i32 %i.0503, 1
  %18 = trunc i64 %indvars.iv.next548 to i32
  %cmp31 = icmp slt i32 %18, %0
  br i1 %cmp31, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond, %for.cond.preheader
  %19 = phi double** [ %21, %for.cond ], [ %14, %for.cond.preheader ]
  %indvars.iv547 = phi i64 [ %indvars.iv.next548, %for.cond ], [ 0, %for.cond.preheader ]
  %i.0503 = phi i32 [ %inc, %for.cond ], [ 0, %for.cond.preheader ]
  %call33 = tail call noalias i8* @malloc(i64 24) #1
  %20 = bitcast i8* %call33 to double*
  %arrayidx = getelementptr inbounds double** %19, i64 %indvars.iv547
  store double* %20, double** %arrayidx, align 8, !tbaa !1
  %21 = load double*** @vel, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds double** %21, i64 %indvars.iv547
  %22 = load double** %arrayidx35, align 8, !tbaa !1
  %cmp36 = icmp eq double* %22, null
  %indvars.iv.next548 = add nuw nsw i64 %indvars.iv547, 1
  br i1 %cmp36, label %if.then38, label %for.cond

if.then38:                                        ; preds = %for.body
  %23 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([27 x i8]* @.str52, i64 0, i64 0), i32 %i.0503) #7
  %24 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call40 = tail call i32 @fflush(%struct._IO_FILE* %24) #1
  tail call void @exit(i32 0) #9
  unreachable

for.end:                                          ; preds = %for.cond, %for.cond.preheader
  %call44 = tail call noalias i8* @malloc(i64 %mul) #1
  %25 = bitcast i8* %call44 to double**
  store double** %25, double*** @M, align 8, !tbaa !1
  %cmp45 = icmp eq i8* %call44, null
  br i1 %cmp45, label %if.then47, label %for.cond51.preheader

for.cond51.preheader:                             ; preds = %for.end
  br i1 %cmp31502, label %for.body54, label %for.end68

if.then47:                                        ; preds = %for.end
  %26 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8]* @.str53, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %26) #8
  %28 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call49 = tail call i32 @fflush(%struct._IO_FILE* %28) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond51:                                       ; preds = %for.body54
  %inc67 = add nsw i32 %i.1497, 1
  %29 = trunc i64 %indvars.iv.next544 to i32
  %cmp52 = icmp slt i32 %29, %0
  br i1 %cmp52, label %for.body54, label %for.end68

for.body54:                                       ; preds = %for.cond51, %for.cond51.preheader
  %30 = phi double** [ %32, %for.cond51 ], [ %25, %for.cond51.preheader ]
  %indvars.iv543 = phi i64 [ %indvars.iv.next544, %for.cond51 ], [ 0, %for.cond51.preheader ]
  %i.1497 = phi i32 [ %inc67, %for.cond51 ], [ 0, %for.cond51.preheader ]
  %call55 = tail call noalias i8* @malloc(i64 24) #1
  %31 = bitcast i8* %call55 to double*
  %arrayidx57 = getelementptr inbounds double** %30, i64 %indvars.iv543
  store double* %31, double** %arrayidx57, align 8, !tbaa !1
  %32 = load double*** @M, align 8, !tbaa !1
  %arrayidx59 = getelementptr inbounds double** %32, i64 %indvars.iv543
  %33 = load double** %arrayidx59, align 8, !tbaa !1
  %cmp60 = icmp eq double* %33, null
  %indvars.iv.next544 = add nuw nsw i64 %indvars.iv543, 1
  br i1 %cmp60, label %if.then62, label %for.cond51

if.then62:                                        ; preds = %for.body54
  %34 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call63 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([25 x i8]* @.str54, i64 0, i64 0), i32 %i.1497) #7
  %35 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call64 = tail call i32 @fflush(%struct._IO_FILE* %35) #1
  tail call void @exit(i32 0) #9
  unreachable

for.end68:                                        ; preds = %for.cond51, %for.cond51.preheader
  %call71 = tail call noalias i8* @malloc(i64 %mul) #1
  %36 = bitcast i8* %call71 to double**
  store double** %36, double*** @C, align 8, !tbaa !1
  %cmp72 = icmp eq i8* %call71, null
  br i1 %cmp72, label %if.then74, label %for.cond78.preheader

for.cond78.preheader:                             ; preds = %for.end68
  br i1 %cmp31502, label %for.body81, label %for.end95

if.then74:                                        ; preds = %for.end68
  %37 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8]* @.str55, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %37) #8
  %39 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call76 = tail call i32 @fflush(%struct._IO_FILE* %39) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond78:                                       ; preds = %for.body81
  %inc94 = add nsw i32 %i.2491, 1
  %40 = trunc i64 %indvars.iv.next540 to i32
  %cmp79 = icmp slt i32 %40, %0
  br i1 %cmp79, label %for.body81, label %for.end95

for.body81:                                       ; preds = %for.cond78, %for.cond78.preheader
  %41 = phi double** [ %43, %for.cond78 ], [ %36, %for.cond78.preheader ]
  %indvars.iv539 = phi i64 [ %indvars.iv.next540, %for.cond78 ], [ 0, %for.cond78.preheader ]
  %i.2491 = phi i32 [ %inc94, %for.cond78 ], [ 0, %for.cond78.preheader ]
  %call82 = tail call noalias i8* @malloc(i64 24) #1
  %42 = bitcast i8* %call82 to double*
  %arrayidx84 = getelementptr inbounds double** %41, i64 %indvars.iv539
  store double* %42, double** %arrayidx84, align 8, !tbaa !1
  %43 = load double*** @C, align 8, !tbaa !1
  %arrayidx86 = getelementptr inbounds double** %43, i64 %indvars.iv539
  %44 = load double** %arrayidx86, align 8, !tbaa !1
  %cmp87 = icmp eq double* %44, null
  %indvars.iv.next540 = add nuw nsw i64 %indvars.iv539, 1
  br i1 %cmp87, label %if.then89, label %for.cond78

if.then89:                                        ; preds = %for.body81
  %45 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call90 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([25 x i8]* @.str56, i64 0, i64 0), i32 %i.2491) #7
  %46 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call91 = tail call i32 @fflush(%struct._IO_FILE* %46) #1
  tail call void @exit(i32 0) #9
  unreachable

for.end95:                                        ; preds = %for.cond78, %for.cond78.preheader
  %call98 = tail call noalias i8* @malloc(i64 %mul) #1
  %47 = bitcast i8* %call98 to double**
  store double** %47, double*** @M23, align 8, !tbaa !1
  %cmp99 = icmp eq i8* %call98, null
  br i1 %cmp99, label %if.then101, label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.end95
  br i1 %cmp31502, label %for.body108, label %for.end122

if.then101:                                       ; preds = %for.end95
  %48 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %49 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str57, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %48) #8
  %50 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call103 = tail call i32 @fflush(%struct._IO_FILE* %50) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond105:                                      ; preds = %for.body108
  %inc121 = add nsw i32 %i.3485, 1
  %51 = trunc i64 %indvars.iv.next536 to i32
  %cmp106 = icmp slt i32 %51, %0
  br i1 %cmp106, label %for.body108, label %for.end122

for.body108:                                      ; preds = %for.cond105, %for.cond105.preheader
  %52 = phi double** [ %54, %for.cond105 ], [ %47, %for.cond105.preheader ]
  %indvars.iv535 = phi i64 [ %indvars.iv.next536, %for.cond105 ], [ 0, %for.cond105.preheader ]
  %i.3485 = phi i32 [ %inc121, %for.cond105 ], [ 0, %for.cond105.preheader ]
  %call109 = tail call noalias i8* @malloc(i64 24) #1
  %53 = bitcast i8* %call109 to double*
  %arrayidx111 = getelementptr inbounds double** %52, i64 %indvars.iv535
  store double* %53, double** %arrayidx111, align 8, !tbaa !1
  %54 = load double*** @M23, align 8, !tbaa !1
  %arrayidx113 = getelementptr inbounds double** %54, i64 %indvars.iv535
  %55 = load double** %arrayidx113, align 8, !tbaa !1
  %cmp114 = icmp eq double* %55, null
  %indvars.iv.next536 = add nuw nsw i64 %indvars.iv535, 1
  br i1 %cmp114, label %if.then116, label %for.cond105

if.then116:                                       ; preds = %for.body108
  %56 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call117 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([27 x i8]* @.str58, i64 0, i64 0), i32 %i.3485) #7
  %57 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call118 = tail call i32 @fflush(%struct._IO_FILE* %57) #1
  tail call void @exit(i32 0) #9
  unreachable

for.end122:                                       ; preds = %for.cond105, %for.cond105.preheader
  %call125 = tail call noalias i8* @malloc(i64 %mul) #1
  %58 = bitcast i8* %call125 to double**
  store double** %58, double*** @C23, align 8, !tbaa !1
  %cmp126 = icmp eq i8* %call125, null
  br i1 %cmp126, label %if.then128, label %for.cond132.preheader

for.cond132.preheader:                            ; preds = %for.end122
  br i1 %cmp31502, label %for.body135, label %for.end149

if.then128:                                       ; preds = %for.end122
  %59 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %60 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str59, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %59) #8
  %61 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call130 = tail call i32 @fflush(%struct._IO_FILE* %61) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond132:                                      ; preds = %for.body135
  %inc148 = add nsw i32 %i.4479, 1
  %62 = trunc i64 %indvars.iv.next532 to i32
  %cmp133 = icmp slt i32 %62, %0
  br i1 %cmp133, label %for.body135, label %for.end149

for.body135:                                      ; preds = %for.cond132, %for.cond132.preheader
  %63 = phi double** [ %65, %for.cond132 ], [ %58, %for.cond132.preheader ]
  %indvars.iv531 = phi i64 [ %indvars.iv.next532, %for.cond132 ], [ 0, %for.cond132.preheader ]
  %i.4479 = phi i32 [ %inc148, %for.cond132 ], [ 0, %for.cond132.preheader ]
  %call136 = tail call noalias i8* @malloc(i64 24) #1
  %64 = bitcast i8* %call136 to double*
  %arrayidx138 = getelementptr inbounds double** %63, i64 %indvars.iv531
  store double* %64, double** %arrayidx138, align 8, !tbaa !1
  %65 = load double*** @C23, align 8, !tbaa !1
  %arrayidx140 = getelementptr inbounds double** %65, i64 %indvars.iv531
  %66 = load double** %arrayidx140, align 8, !tbaa !1
  %cmp141 = icmp eq double* %66, null
  %indvars.iv.next532 = add nuw nsw i64 %indvars.iv531, 1
  br i1 %cmp141, label %if.then143, label %for.cond132

if.then143:                                       ; preds = %for.body135
  %67 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call144 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([27 x i8]* @.str60, i64 0, i64 0), i32 %i.4479) #7
  %68 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call145 = tail call i32 @fflush(%struct._IO_FILE* %68) #1
  tail call void @exit(i32 0) #9
  unreachable

for.end149:                                       ; preds = %for.cond132, %for.cond132.preheader
  %call152 = tail call noalias i8* @malloc(i64 %mul) #1
  %69 = bitcast i8* %call152 to double**
  store double** %69, double*** @V23, align 8, !tbaa !1
  %cmp153 = icmp eq i8* %call152, null
  br i1 %cmp153, label %if.then155, label %for.cond159.preheader

for.cond159.preheader:                            ; preds = %for.end149
  %call163473 = tail call noalias i8* @malloc(i64 24) #1
  br i1 %cmp31502, label %for.body162, label %for.end176

if.then155:                                       ; preds = %for.end149
  %70 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %71 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str61, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %70) #8
  %72 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call157 = tail call i32 @fflush(%struct._IO_FILE* %72) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond159:                                      ; preds = %for.body162
  %inc175 = add nsw i32 %i.5474, 1
  %73 = trunc i64 %indvars.iv.next528 to i32
  %cmp160 = icmp slt i32 %73, %0
  %call163 = tail call noalias i8* @malloc(i64 24) #1
  br i1 %cmp160, label %for.body162, label %for.end176

for.body162:                                      ; preds = %for.cond159, %for.cond159.preheader
  %74 = phi double** [ %76, %for.cond159 ], [ %69, %for.cond159.preheader ]
  %indvars.iv527 = phi i64 [ %indvars.iv.next528, %for.cond159 ], [ 0, %for.cond159.preheader ]
  %call163475 = phi i8* [ %call163, %for.cond159 ], [ %call163473, %for.cond159.preheader ]
  %i.5474 = phi i32 [ %inc175, %for.cond159 ], [ 0, %for.cond159.preheader ]
  %75 = bitcast i8* %call163475 to double*
  %arrayidx165 = getelementptr inbounds double** %74, i64 %indvars.iv527
  store double* %75, double** %arrayidx165, align 8, !tbaa !1
  %76 = load double*** @V23, align 8, !tbaa !1
  %arrayidx167 = getelementptr inbounds double** %76, i64 %indvars.iv527
  %77 = load double** %arrayidx167, align 8, !tbaa !1
  %cmp168 = icmp eq double* %77, null
  %indvars.iv.next528 = add nuw nsw i64 %indvars.iv527, 1
  br i1 %cmp168, label %if.then170, label %for.cond159

if.then170:                                       ; preds = %for.body162
  %78 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call171 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([27 x i8]* @.str62, i64 0, i64 0), i32 %i.5474) #7
  %79 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call172 = tail call i32 @fflush(%struct._IO_FILE* %79) #1
  tail call void @exit(i32 0) #9
  unreachable

for.end176:                                       ; preds = %for.cond159, %for.cond159.preheader
  %call163.lcssa = phi i8* [ %call163473, %for.cond159.preheader ], [ %call163, %for.cond159 ]
  %80 = bitcast i8* %call163.lcssa to double***
  store double*** %80, double**** @disp, align 8, !tbaa !1
  %cmp178 = icmp eq i8* %call163.lcssa, null
  br i1 %cmp178, label %if.then180, label %for.body187

if.then180:                                       ; preds = %for.end176
  %81 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %82 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8]* @.str63, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %81) #8
  %83 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call182 = tail call i32 @fflush(%struct._IO_FILE* %83) #1
  tail call void @exit(i32 0) #9
  unreachable

for.body187:                                      ; preds = %for.inc223, %for.end176
  %84 = phi double*** [ %99, %for.inc223 ], [ %80, %for.end176 ]
  %indvars.iv523 = phi i64 [ %indvars.iv.next524, %for.inc223 ], [ 0, %for.end176 ]
  %i.6468 = phi i32 [ %inc224, %for.inc223 ], [ 0, %for.end176 ]
  %call190 = tail call noalias i8* @malloc(i64 %mul) #1
  %85 = bitcast i8* %call190 to double**
  %arrayidx192 = getelementptr inbounds double*** %84, i64 %indvars.iv523
  store double** %85, double*** %arrayidx192, align 8, !tbaa !1
  %86 = load double**** @disp, align 8, !tbaa !1
  %arrayidx194 = getelementptr inbounds double*** %86, i64 %indvars.iv523
  %87 = load double*** %arrayidx194, align 8, !tbaa !1
  %cmp195 = icmp eq double** %87, null
  br i1 %cmp195, label %if.then197, label %for.cond201.preheader

for.cond201.preheader:                            ; preds = %for.body187
  br i1 %cmp31502, label %for.body204, label %for.inc223

if.then197:                                       ; preds = %for.body187
  %88 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call198 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([28 x i8]* @.str64, i64 0, i64 0), i32 %i.6468) #7
  %89 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call199 = tail call i32 @fflush(%struct._IO_FILE* %89) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond201:                                      ; preds = %for.body204
  %inc221 = add nsw i32 %j.0465, 1
  %90 = trunc i64 %indvars.iv.next520 to i32
  %cmp202 = icmp slt i32 %90, %0
  br i1 %cmp202, label %for.body204, label %for.inc223

for.body204:                                      ; preds = %for.cond201, %for.cond201.preheader
  %91 = phi double*** [ %94, %for.cond201 ], [ %86, %for.cond201.preheader ]
  %indvars.iv519 = phi i64 [ %indvars.iv.next520, %for.cond201 ], [ 0, %for.cond201.preheader ]
  %j.0465 = phi i32 [ %inc221, %for.cond201 ], [ 0, %for.cond201.preheader ]
  %call205 = tail call noalias i8* @malloc(i64 24) #1
  %92 = bitcast i8* %call205 to double*
  %arrayidx208 = getelementptr inbounds double*** %91, i64 %indvars.iv523
  %93 = load double*** %arrayidx208, align 8, !tbaa !1
  %arrayidx209 = getelementptr inbounds double** %93, i64 %indvars.iv519
  store double* %92, double** %arrayidx209, align 8, !tbaa !1
  %94 = load double**** @disp, align 8, !tbaa !1
  %arrayidx212 = getelementptr inbounds double*** %94, i64 %indvars.iv523
  %95 = load double*** %arrayidx212, align 8, !tbaa !1
  %arrayidx213 = getelementptr inbounds double** %95, i64 %indvars.iv519
  %96 = load double** %arrayidx213, align 8, !tbaa !1
  %cmp214 = icmp eq double* %96, null
  %indvars.iv.next520 = add nuw nsw i64 %indvars.iv519, 1
  br i1 %cmp214, label %if.then216, label %for.cond201

if.then216:                                       ; preds = %for.body204
  %97 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call217 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([32 x i8]* @.str65, i64 0, i64 0), i32 %i.6468, i32 %j.0465) #7
  %98 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call218 = tail call i32 @fflush(%struct._IO_FILE* %98) #1
  tail call void @exit(i32 0) #9
  unreachable

for.inc223:                                       ; preds = %for.cond201, %for.cond201.preheader
  %99 = phi double*** [ %86, %for.cond201.preheader ], [ %94, %for.cond201 ]
  %indvars.iv.next524 = add nuw nsw i64 %indvars.iv523, 1
  %inc224 = add nsw i32 %i.6468, 1
  %100 = trunc i64 %indvars.iv.next524 to i32
  %cmp185 = icmp slt i32 %100, 3
  br i1 %cmp185, label %for.body187, label %for.end225

for.end225:                                       ; preds = %for.inc223
  %101 = load i32* @ARCHmatrixlen, align 4, !tbaa !5
  %conv226 = sext i32 %101 to i64
  %mul227 = shl nsw i64 %conv226, 3
  %call228 = tail call noalias i8* @malloc(i64 %mul227) #1
  %102 = bitcast i8* %call228 to double***
  store double*** %102, double**** @K, align 8, !tbaa !1
  %cmp229 = icmp eq i8* %call228, null
  br i1 %cmp229, label %if.then231, label %for.cond235.preheader

for.cond235.preheader:                            ; preds = %for.end225
  %cmp236461 = icmp sgt i32 %101, 0
  br i1 %cmp236461, label %for.body238, label %for.cond275.preheader

if.then231:                                       ; preds = %for.end225
  %103 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %104 = tail call i64 @fwrite(i8* getelementptr inbounds ([21 x i8]* @.str66, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %103) #8
  %105 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call233 = tail call i32 @fflush(%struct._IO_FILE* %105) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond275.preheader:                            ; preds = %for.inc272, %for.cond235.preheader
  %106 = phi double*** [ %102, %for.cond235.preheader ], [ %127, %for.inc272 ]
  br i1 %cmp31502, label %for.body278.lr.ph, label %for.cond326.preheader

for.body278.lr.ph:                                ; preds = %for.cond275.preheader
  %107 = load i32** @nodekind, align 8, !tbaa !1
  %108 = load double*** @M, align 8, !tbaa !1
  %109 = load double*** @C, align 8, !tbaa !1
  %110 = load double*** @M23, align 8, !tbaa !1
  %111 = load double*** @C23, align 8, !tbaa !1
  %112 = load double*** @V23, align 8, !tbaa !1
  %113 = load double**** @disp, align 8, !tbaa !1
  %114 = load double*** %113, align 8, !tbaa !1
  %arrayidx312 = getelementptr inbounds double*** %113, i64 1
  %115 = load double*** %arrayidx312, align 8, !tbaa !1
  %arrayidx317 = getelementptr inbounds double*** %113, i64 2
  %116 = load double*** %arrayidx317, align 8, !tbaa !1
  br label %for.body278

for.body238:                                      ; preds = %for.inc272, %for.cond235.preheader
  %117 = phi double*** [ %127, %for.inc272 ], [ %102, %for.cond235.preheader ]
  %indvars.iv516 = phi i64 [ %indvars.iv.next517, %for.inc272 ], [ 0, %for.cond235.preheader ]
  %i.7462 = phi i32 [ %inc273, %for.inc272 ], [ 0, %for.cond235.preheader ]
  %call239 = tail call noalias i8* @malloc(i64 24) #1
  %118 = bitcast i8* %call239 to double**
  %arrayidx241 = getelementptr inbounds double*** %117, i64 %indvars.iv516
  store double** %118, double*** %arrayidx241, align 8, !tbaa !1
  %119 = load double**** @K, align 8, !tbaa !1
  %arrayidx243 = getelementptr inbounds double*** %119, i64 %indvars.iv516
  %120 = load double*** %arrayidx243, align 8, !tbaa !1
  %cmp244 = icmp eq double** %120, null
  br i1 %cmp244, label %if.then246, label %for.body253

if.then246:                                       ; preds = %for.body238
  %121 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call247 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %121, i8* getelementptr inbounds ([25 x i8]* @.str67, i64 0, i64 0), i32 %i.7462) #7
  %122 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call248 = tail call i32 @fflush(%struct._IO_FILE* %122) #1
  tail call void @exit(i32 0) #9
  unreachable

for.cond250:                                      ; preds = %for.body253
  %inc270 = add nsw i32 %j.1458, 1
  %123 = trunc i64 %indvars.iv.next513 to i32
  %cmp251 = icmp slt i32 %123, 3
  br i1 %cmp251, label %for.body253, label %for.inc272

for.body253:                                      ; preds = %for.cond250, %for.body238
  %124 = phi double*** [ %127, %for.cond250 ], [ %119, %for.body238 ]
  %indvars.iv512 = phi i64 [ %indvars.iv.next513, %for.cond250 ], [ 0, %for.body238 ]
  %j.1458 = phi i32 [ %inc270, %for.cond250 ], [ 0, %for.body238 ]
  %call254 = tail call noalias i8* @malloc(i64 24) #1
  %125 = bitcast i8* %call254 to double*
  %arrayidx257 = getelementptr inbounds double*** %124, i64 %indvars.iv516
  %126 = load double*** %arrayidx257, align 8, !tbaa !1
  %arrayidx258 = getelementptr inbounds double** %126, i64 %indvars.iv512
  store double* %125, double** %arrayidx258, align 8, !tbaa !1
  %127 = load double**** @K, align 8, !tbaa !1
  %arrayidx261 = getelementptr inbounds double*** %127, i64 %indvars.iv516
  %128 = load double*** %arrayidx261, align 8, !tbaa !1
  %arrayidx262 = getelementptr inbounds double** %128, i64 %indvars.iv512
  %129 = load double** %arrayidx262, align 8, !tbaa !1
  %cmp263 = icmp eq double* %129, null
  %indvars.iv.next513 = add nuw nsw i64 %indvars.iv512, 1
  br i1 %cmp263, label %if.then265, label %for.cond250

if.then265:                                       ; preds = %for.body253
  %130 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call266 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %130, i8* getelementptr inbounds ([29 x i8]* @.str68, i64 0, i64 0), i32 %i.7462, i32 %j.1458) #7
  %131 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call267 = tail call i32 @fflush(%struct._IO_FILE* %131) #1
  tail call void @exit(i32 0) #9
  unreachable

for.inc272:                                       ; preds = %for.cond250
  %indvars.iv.next517 = add nuw nsw i64 %indvars.iv516, 1
  %inc273 = add nsw i32 %i.7462, 1
  %132 = trunc i64 %indvars.iv.next517 to i32
  %cmp236 = icmp slt i32 %132, %101
  br i1 %cmp236, label %for.body238, label %for.cond275.preheader

for.cond275.for.cond326.preheader_crit_edge:      ; preds = %for.body278
  %.pre = load i32* @ARCHelems, align 4, !tbaa !5
  br label %for.cond326.preheader

for.cond326.preheader:                            ; preds = %for.cond275.for.cond326.preheader_crit_edge, %for.cond275.preheader
  %133 = phi i32 [ %.pre, %for.cond275.for.cond326.preheader_crit_edge ], [ %9, %for.cond275.preheader ]
  %cmp327452 = icmp sgt i32 %133, 0
  br i1 %cmp327452, label %for.body329.lr.ph, label %for.cond335.preheader

for.body329.lr.ph:                                ; preds = %for.cond326.preheader
  %134 = load i32** @source_elms, align 8, !tbaa !1
  br label %for.body329

for.body278:                                      ; preds = %for.body278, %for.body278.lr.ph
  %indvars.iv509 = phi i64 [ 0, %for.body278.lr.ph ], [ %indvars.iv.next510, %for.body278 ]
  %arrayidx280 = getelementptr inbounds i32* %107, i64 %indvars.iv509
  store i32 0, i32* %arrayidx280, align 4, !tbaa !5
  %arrayidx287 = getelementptr inbounds double** %108, i64 %indvars.iv509
  %135 = load double** %arrayidx287, align 8, !tbaa !1
  %arrayidx291 = getelementptr inbounds double** %109, i64 %indvars.iv509
  %136 = load double** %arrayidx291, align 8, !tbaa !1
  %arrayidx295 = getelementptr inbounds double** %110, i64 %indvars.iv509
  %137 = load double** %arrayidx295, align 8, !tbaa !1
  %arrayidx299 = getelementptr inbounds double** %111, i64 %indvars.iv509
  %138 = load double** %arrayidx299, align 8, !tbaa !1
  %arrayidx303 = getelementptr inbounds double** %112, i64 %indvars.iv509
  %139 = load double** %arrayidx303, align 8, !tbaa !1
  %arrayidx308 = getelementptr inbounds double** %114, i64 %indvars.iv509
  %140 = load double** %arrayidx308, align 8, !tbaa !1
  %arrayidx313 = getelementptr inbounds double** %115, i64 %indvars.iv509
  %141 = load double** %arrayidx313, align 8, !tbaa !1
  %arrayidx318 = getelementptr inbounds double** %116, i64 %indvars.iv509
  %142 = load double** %arrayidx318, align 8, !tbaa !1
  store double 0.000000e+00, double* %135, align 8, !tbaa !12
  store double 0.000000e+00, double* %136, align 8, !tbaa !12
  store double 0.000000e+00, double* %137, align 8, !tbaa !12
  store double 0.000000e+00, double* %138, align 8, !tbaa !12
  store double 0.000000e+00, double* %139, align 8, !tbaa !12
  store double 0.000000e+00, double* %140, align 8, !tbaa !12
  store double 0.000000e+00, double* %141, align 8, !tbaa !12
  store double 0.000000e+00, double* %142, align 8, !tbaa !12
  %arrayidx288.1 = getelementptr inbounds double* %135, i64 1
  store double 0.000000e+00, double* %arrayidx288.1, align 8, !tbaa !12
  %arrayidx292.1 = getelementptr inbounds double* %136, i64 1
  store double 0.000000e+00, double* %arrayidx292.1, align 8, !tbaa !12
  %arrayidx296.1 = getelementptr inbounds double* %137, i64 1
  store double 0.000000e+00, double* %arrayidx296.1, align 8, !tbaa !12
  %arrayidx300.1 = getelementptr inbounds double* %138, i64 1
  store double 0.000000e+00, double* %arrayidx300.1, align 8, !tbaa !12
  %arrayidx304.1 = getelementptr inbounds double* %139, i64 1
  store double 0.000000e+00, double* %arrayidx304.1, align 8, !tbaa !12
  %arrayidx309.1 = getelementptr inbounds double* %140, i64 1
  store double 0.000000e+00, double* %arrayidx309.1, align 8, !tbaa !12
  %arrayidx314.1 = getelementptr inbounds double* %141, i64 1
  store double 0.000000e+00, double* %arrayidx314.1, align 8, !tbaa !12
  %arrayidx319.1 = getelementptr inbounds double* %142, i64 1
  store double 0.000000e+00, double* %arrayidx319.1, align 8, !tbaa !12
  %arrayidx288.2 = getelementptr inbounds double* %135, i64 2
  store double 0.000000e+00, double* %arrayidx288.2, align 8, !tbaa !12
  %arrayidx292.2 = getelementptr inbounds double* %136, i64 2
  store double 0.000000e+00, double* %arrayidx292.2, align 8, !tbaa !12
  %arrayidx296.2 = getelementptr inbounds double* %137, i64 2
  store double 0.000000e+00, double* %arrayidx296.2, align 8, !tbaa !12
  %arrayidx300.2 = getelementptr inbounds double* %138, i64 2
  store double 0.000000e+00, double* %arrayidx300.2, align 8, !tbaa !12
  %arrayidx304.2 = getelementptr inbounds double* %139, i64 2
  store double 0.000000e+00, double* %arrayidx304.2, align 8, !tbaa !12
  %arrayidx309.2 = getelementptr inbounds double* %140, i64 2
  store double 0.000000e+00, double* %arrayidx309.2, align 8, !tbaa !12
  %arrayidx314.2 = getelementptr inbounds double* %141, i64 2
  store double 0.000000e+00, double* %arrayidx314.2, align 8, !tbaa !12
  %arrayidx319.2 = getelementptr inbounds double* %142, i64 2
  store double 0.000000e+00, double* %arrayidx319.2, align 8, !tbaa !12
  %indvars.iv.next510 = add nuw nsw i64 %indvars.iv509, 1
  %143 = load i32* @ARCHnodes, align 4, !tbaa !5
  %144 = trunc i64 %indvars.iv.next510 to i32
  %cmp276 = icmp slt i32 %144, %143
  br i1 %cmp276, label %for.body278, label %for.cond275.for.cond326.preheader_crit_edge

for.cond335.preheader:                            ; preds = %for.body329, %for.cond326.preheader
  %145 = load i32* @ARCHmatrixlen, align 4, !tbaa !5
  %cmp336450 = icmp sgt i32 %145, 0
  br i1 %cmp336450, label %for.cond339.preheader, label %for.end361

for.body329:                                      ; preds = %for.body329, %for.body329.lr.ph
  %indvars.iv505 = phi i64 [ 0, %for.body329.lr.ph ], [ %indvars.iv.next506, %for.body329 ]
  %arrayidx331 = getelementptr inbounds i32* %134, i64 %indvars.iv505
  store i32 1, i32* %arrayidx331, align 4, !tbaa !5
  %indvars.iv.next506 = add nuw nsw i64 %indvars.iv505, 1
  %146 = load i32* @ARCHelems, align 4, !tbaa !5
  %147 = trunc i64 %indvars.iv.next506 to i32
  %cmp327 = icmp slt i32 %147, %146
  br i1 %cmp327, label %for.body329, label %for.cond335.preheader

for.cond339.preheader:                            ; preds = %for.cond339.preheader, %for.cond335.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond339.preheader ], [ 0, %for.cond335.preheader ]
  %arrayidx350 = getelementptr inbounds double*** %106, i64 %indvars.iv
  %148 = load double*** %arrayidx350, align 8, !tbaa !1
  %149 = load double** %148, align 8, !tbaa !1
  %150 = bitcast double* %149 to i8*
  call void @llvm.memset.p0i8.i64(i8* %150, i8 0, i64 24, i32 8, i1 false)
  %arrayidx351.1 = getelementptr inbounds double** %148, i64 1
  %151 = load double** %arrayidx351.1, align 8, !tbaa !1
  %152 = bitcast double* %151 to i8*
  call void @llvm.memset.p0i8.i64(i8* %152, i8 0, i64 24, i32 8, i1 false)
  %arrayidx351.2 = getelementptr inbounds double** %148, i64 2
  %153 = load double** %arrayidx351.2, align 8, !tbaa !1
  %154 = bitcast double* %153 to i8*
  call void @llvm.memset.p0i8.i64(i8* %154, i8 0, i64 24, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = trunc i64 %indvars.iv.next to i32
  %cmp336 = icmp slt i32 %155, %145
  br i1 %cmp336, label %for.cond339.preheader, label %for.end361

for.end361:                                       ; preds = %for.cond339.preheader, %for.cond335.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define void @arch_readnodevector(double* %v, i32 %n) #0 {
entry:
  %type = alloca i32, align 4
  %attributes = alloca i32, align 4
  %0 = load %struct._IO_FILE** @packfile, align 8, !tbaa !1
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([7 x i8]* @.str28, i64 0, i64 0), i32* %type, i32* %attributes) #1
  %1 = load i32* %type, align 4, !tbaa !5
  %cmp = icmp eq i32 %1, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([38 x i8]* @.str29, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %2) #8
  call void @arch_bail()
  unreachable

if.end:                                           ; preds = %entry
  %4 = load i32* %attributes, align 4, !tbaa !5
  %cmp2 = icmp eq i32 %4, 1
  br i1 %cmp2, label %for.cond.preheader, label %if.then3

for.cond.preheader:                               ; preds = %if.end
  %cmp610 = icmp sgt i32 %n, 0
  br i1 %cmp610, label %for.body, label %for.end

if.then3:                                         ; preds = %if.end
  %5 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([49 x i8]* @.str30, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %5) #8
  call void @arch_bail()
  unreachable

for.body:                                         ; preds = %for.body, %for.cond.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.cond.preheader ]
  %7 = load %struct._IO_FILE** @packfile, align 8, !tbaa !1
  %arrayidx = getelementptr inbounds double* %v, i64 %indvars.iv
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8]* @.str31, i64 0, i64 0), double* %arrayidx) #1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %for.cond.preheader
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define void @slip(double* nocapture %u, double* nocapture %v, double* nocapture %w) #0 {
entry:
  store double 0.000000e+00, double* %w, align 8, !tbaa !12
  store double 0.000000e+00, double* %v, align 8, !tbaa !12
  store double 0.000000e+00, double* %u, align 8, !tbaa !12
  %0 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 2), align 8, !tbaa !23
  %call = tail call double @cos(double %0) #1
  %1 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call1 = tail call double @sin(double %1) #1
  %mul = fmul double %call, %call1
  %2 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 2), align 8, !tbaa !23
  %call2 = tail call double @sin(double %2) #1
  %3 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call3 = tail call double @cos(double %3) #1
  %mul4 = fmul double %call2, %call3
  %4 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call5 = tail call double @cos(double %4) #1
  %mul6 = fmul double %mul4, %call5
  %sub = fsub double %mul, %mul6
  store double %sub, double* %u, align 8, !tbaa !12
  %5 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 2), align 8, !tbaa !23
  %call7 = tail call double @cos(double %5) #1
  %6 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call8 = tail call double @cos(double %6) #1
  %mul9 = fmul double %call7, %call8
  %7 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 2), align 8, !tbaa !23
  %call10 = tail call double @sin(double %7) #1
  %8 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call11 = tail call double @sin(double %8) #1
  %mul12 = fmul double %call10, %call11
  %9 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call13 = tail call double @cos(double %9) #1
  %mul14 = fmul double %mul12, %call13
  %add = fadd double %mul9, %mul14
  store double %add, double* %v, align 8, !tbaa !12
  %10 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 2), align 8, !tbaa !23
  %call15 = tail call double @sin(double %10) #1
  %11 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call16 = tail call double @sin(double %11) #1
  %mul17 = fmul double %call15, %call16
  store double %mul17, double* %w, align 8, !tbaa !12
  ret void
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind readonly uwtable
define double @distance(double* nocapture readonly %p1, double* nocapture readonly %p2) #3 {
entry:
  %0 = load double* %p1, align 8, !tbaa !12
  %1 = load double* %p2, align 8, !tbaa !12
  %sub = fsub double %0, %1
  %mul = fmul double %sub, %sub
  %arrayidx5 = getelementptr inbounds double* %p1, i64 1
  %2 = load double* %arrayidx5, align 8, !tbaa !12
  %arrayidx6 = getelementptr inbounds double* %p2, i64 1
  %3 = load double* %arrayidx6, align 8, !tbaa !12
  %sub7 = fsub double %2, %3
  %mul11 = fmul double %sub7, %sub7
  %add = fadd double %mul, %mul11
  %arrayidx12 = getelementptr inbounds double* %p1, i64 2
  %4 = load double* %arrayidx12, align 8, !tbaa !12
  %arrayidx13 = getelementptr inbounds double* %p2, i64 2
  %5 = load double* %arrayidx13, align 8, !tbaa !12
  %sub14 = fsub double %4, %5
  %mul18 = fmul double %sub14, %sub14
  %add19 = fadd double %add, %mul18
  ret double %add19
}

; Function Attrs: nounwind uwtable
define void @centroid([3 x double]* nocapture readonly %x, double* nocapture %xc) #0 {
entry:
  %arrayidx1 = getelementptr inbounds [3 x double]* %x, i64 0, i64 0
  %0 = load double* %arrayidx1, align 8, !tbaa !12
  %arrayidx4 = getelementptr inbounds [3 x double]* %x, i64 1, i64 0
  %1 = load double* %arrayidx4, align 8, !tbaa !12
  %add = fadd double %0, %1
  %arrayidx7 = getelementptr inbounds [3 x double]* %x, i64 2, i64 0
  %2 = load double* %arrayidx7, align 8, !tbaa !12
  %add8 = fadd double %add, %2
  %arrayidx11 = getelementptr inbounds [3 x double]* %x, i64 3, i64 0
  %3 = load double* %arrayidx11, align 8, !tbaa !12
  %add12 = fadd double %add8, %3
  %div = fmul double %add12, 2.500000e-01
  store double %div, double* %xc, align 8, !tbaa !12
  %arrayidx1.1 = getelementptr inbounds [3 x double]* %x, i64 0, i64 1
  %4 = load double* %arrayidx1.1, align 8, !tbaa !12
  %arrayidx4.1 = getelementptr inbounds [3 x double]* %x, i64 1, i64 1
  %5 = load double* %arrayidx4.1, align 8, !tbaa !12
  %add.1 = fadd double %4, %5
  %arrayidx7.1 = getelementptr inbounds [3 x double]* %x, i64 2, i64 1
  %6 = load double* %arrayidx7.1, align 8, !tbaa !12
  %add8.1 = fadd double %add.1, %6
  %arrayidx11.1 = getelementptr inbounds [3 x double]* %x, i64 3, i64 1
  %7 = load double* %arrayidx11.1, align 8, !tbaa !12
  %add12.1 = fadd double %add8.1, %7
  %div.1 = fmul double %add12.1, 2.500000e-01
  %arrayidx14.1 = getelementptr inbounds double* %xc, i64 1
  store double %div.1, double* %arrayidx14.1, align 8, !tbaa !12
  %arrayidx1.2 = getelementptr inbounds [3 x double]* %x, i64 0, i64 2
  %8 = load double* %arrayidx1.2, align 8, !tbaa !12
  %arrayidx4.2 = getelementptr inbounds [3 x double]* %x, i64 1, i64 2
  %9 = load double* %arrayidx4.2, align 8, !tbaa !12
  %add.2 = fadd double %8, %9
  %arrayidx7.2 = getelementptr inbounds [3 x double]* %x, i64 2, i64 2
  %10 = load double* %arrayidx7.2, align 8, !tbaa !12
  %add8.2 = fadd double %add.2, %10
  %arrayidx11.2 = getelementptr inbounds [3 x double]* %x, i64 3, i64 2
  %11 = load double* %arrayidx11.2, align 8, !tbaa !12
  %add12.2 = fadd double %add8.2, %11
  %div.2 = fmul double %add12.2, 2.500000e-01
  %arrayidx14.2 = getelementptr inbounds double* %xc, i64 2
  store double %div.2, double* %arrayidx14.2, align 8, !tbaa !12
  ret void
}

; Function Attrs: nounwind uwtable
define double @point2fault(double* nocapture readonly %x) #0 {
entry:
  %0 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call = tail call double @cos(double %0) #1
  %1 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call1 = tail call double @sin(double %1) #1
  %mul = fmul double %call, %call1
  %2 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 1), align 8, !tbaa !20
  %call2 = tail call double @sin(double %2) #1
  %3 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call3 = tail call double @sin(double %3) #1
  %4 = fmul double %call2, %call3
  %mul4 = fsub double -0.000000e+00, %4
  %5 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 0), align 8, !tbaa !22
  %call5 = tail call double @cos(double %5) #1
  %6 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 0), align 8, !tbaa !12
  %mul6 = fmul double %mul, %6
  %7 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 1), align 8, !tbaa !12
  %mul7 = fmul double %7, %mul4
  %add = fadd double %mul6, %mul7
  %8 = load double* getelementptr inbounds (%struct.source* @Src, i64 0, i32 4, i64 2), align 8, !tbaa !12
  %mul8 = fmul double %call5, %8
  %add9 = fadd double %add, %mul8
  %9 = load double* %x, align 8, !tbaa !12
  %mul11 = fmul double %mul, %9
  %arrayidx12 = getelementptr inbounds double* %x, i64 1
  %10 = load double* %arrayidx12, align 8, !tbaa !12
  %mul13 = fmul double %10, %mul4
  %add14 = fadd double %mul11, %mul13
  %arrayidx15 = getelementptr inbounds double* %x, i64 2
  %11 = load double* %arrayidx15, align 8, !tbaa !12
  %mul16 = fmul double %call5, %11
  %add17 = fadd double %add14, %mul16
  %add18 = fsub double %add17, %add9
  ret double %add18
}

; Function Attrs: nounwind uwtable
define void @abe_matrix([3 x double]* nocapture readonly %vertices, i32* nocapture readonly %bv, %struct.properties* nocapture readonly %prop, double* nocapture %Ce) #0 {
entry:
  %arrayidx1.i = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 0
  %0 = load double* %arrayidx1.i, align 8, !tbaa !12
  %arrayidx3.i = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 0
  %1 = load double* %arrayidx3.i, align 8, !tbaa !12
  %sub.i = fsub double %0, %1
  %mul.i = fmul double %sub.i, %sub.i
  %arrayidx10.i = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 1
  %2 = load double* %arrayidx10.i, align 8, !tbaa !12
  %arrayidx12.i = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 1
  %3 = load double* %arrayidx12.i, align 8, !tbaa !12
  %sub13.i = fsub double %2, %3
  %mul19.i = fmul double %sub13.i, %sub13.i
  %arrayidx21.i = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 2
  %4 = load double* %arrayidx21.i, align 8, !tbaa !12
  %arrayidx23.i = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 2
  %5 = load double* %arrayidx23.i, align 8, !tbaa !12
  %sub24.i = fsub double %4, %5
  %mul30.i = fmul double %sub24.i, %sub24.i
  %add.i = fadd double %mul.i, %mul19.i
  %add31.i = fadd double %add.i, %mul30.i
  %call.i = tail call double @sqrt(double %add31.i) #1
  %arrayidx33.i = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 0
  %6 = load double* %arrayidx33.i, align 8, !tbaa !12
  %7 = load double* %arrayidx3.i, align 8, !tbaa !12
  %sub36.i = fsub double %6, %7
  %mul42.i = fmul double %sub36.i, %sub36.i
  %arrayidx44.i = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 1
  %8 = load double* %arrayidx44.i, align 8, !tbaa !12
  %9 = load double* %arrayidx12.i, align 8, !tbaa !12
  %sub47.i = fsub double %8, %9
  %mul53.i = fmul double %sub47.i, %sub47.i
  %arrayidx55.i = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 2
  %10 = load double* %arrayidx55.i, align 8, !tbaa !12
  %11 = load double* %arrayidx23.i, align 8, !tbaa !12
  %sub58.i = fsub double %10, %11
  %mul64.i = fmul double %sub58.i, %sub58.i
  %add65.i = fadd double %mul42.i, %mul53.i
  %add66.i = fadd double %add65.i, %mul64.i
  %call67.i = tail call double @sqrt(double %add66.i) #1
  %12 = load double* %arrayidx1.i, align 8, !tbaa !12
  %13 = load double* %arrayidx33.i, align 8, !tbaa !12
  %sub72.i = fsub double %12, %13
  %mul78.i = fmul double %sub72.i, %sub72.i
  %14 = load double* %arrayidx10.i, align 8, !tbaa !12
  %15 = load double* %arrayidx44.i, align 8, !tbaa !12
  %sub83.i = fsub double %14, %15
  %mul89.i = fmul double %sub83.i, %sub83.i
  %16 = load double* %arrayidx21.i, align 8, !tbaa !12
  %17 = load double* %arrayidx55.i, align 8, !tbaa !12
  %sub94.i = fsub double %16, %17
  %mul100.i = fmul double %sub94.i, %sub94.i
  %add101.i = fadd double %mul78.i, %mul89.i
  %add102.i = fadd double %add101.i, %mul100.i
  %call103.i = tail call double @sqrt(double %add102.i) #1
  %add104.i = fadd double %call.i, %call67.i
  %add105.i = fadd double %add104.i, %call103.i
  %div.i = fmul double %add105.i, 5.000000e-01
  %sub106.i = fsub double %div.i, %call.i
  %mul107.i = fmul double %div.i, %sub106.i
  %sub108.i = fsub double %div.i, %call67.i
  %mul109.i = fmul double %sub108.i, %mul107.i
  %sub110.i = fsub double %div.i, %call103.i
  %mul111.i = fmul double %sub110.i, %mul109.i
  %call112.i = tail call double @sqrt(double %mul111.i) #1
  %cs = getelementptr inbounds %struct.properties* %prop, i64 0, i32 1
  %den = getelementptr inbounds %struct.properties* %prop, i64 0, i32 2
  %cp = getelementptr inbounds %struct.properties* %prop, i64 0, i32 0
  %18 = load i32* %bv, align 4, !tbaa !5
  %mul = mul nsw i32 %18, 3
  %idxprom1 = sext i32 %mul to i64
  %arrayidx2 = getelementptr inbounds double* %Ce, i64 %idxprom1
  %19 = load double* %arrayidx2, align 8, !tbaa !12
  %20 = load double* %cs, align 8, !tbaa !29
  %21 = load double* %den, align 8, !tbaa !30
  %mul3 = fmul double %20, %21
  %mul4 = fmul double %call112.i, %mul3
  %div = fdiv double %mul4, 3.000000e+00
  %add = fadd double %19, %div
  store double %add, double* %arrayidx2, align 8, !tbaa !12
  %add7 = add nsw i32 %mul, 1
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds double* %Ce, i64 %idxprom8
  %22 = load double* %arrayidx9, align 8, !tbaa !12
  %23 = load double* %cs, align 8, !tbaa !29
  %24 = load double* %den, align 8, !tbaa !30
  %mul12 = fmul double %23, %24
  %mul13 = fmul double %call112.i, %mul12
  %div14 = fdiv double %mul13, 3.000000e+00
  %add15 = fadd double %22, %div14
  store double %add15, double* %arrayidx9, align 8, !tbaa !12
  %add19 = add nsw i32 %mul, 2
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds double* %Ce, i64 %idxprom20
  %25 = load double* %arrayidx21, align 8, !tbaa !12
  %26 = load double* %cp, align 8, !tbaa !27
  %27 = load double* %den, align 8, !tbaa !30
  %mul23 = fmul double %26, %27
  %mul24 = fmul double %call112.i, %mul23
  %div25 = fdiv double %mul24, 3.000000e+00
  %add26 = fadd double %25, %div25
  store double %add26, double* %arrayidx21, align 8, !tbaa !12
  %arrayidx.1 = getelementptr inbounds i32* %bv, i64 1
  %28 = load i32* %arrayidx.1, align 4, !tbaa !5
  %mul.1 = mul nsw i32 %28, 3
  %idxprom1.1 = sext i32 %mul.1 to i64
  %arrayidx2.1 = getelementptr inbounds double* %Ce, i64 %idxprom1.1
  %29 = load double* %arrayidx2.1, align 8, !tbaa !12
  %30 = load double* %cs, align 8, !tbaa !29
  %31 = load double* %den, align 8, !tbaa !30
  %mul3.1 = fmul double %30, %31
  %mul4.1 = fmul double %call112.i, %mul3.1
  %div.1 = fdiv double %mul4.1, 3.000000e+00
  %add.1 = fadd double %29, %div.1
  store double %add.1, double* %arrayidx2.1, align 8, !tbaa !12
  %add7.1 = add nsw i32 %mul.1, 1
  %idxprom8.1 = sext i32 %add7.1 to i64
  %arrayidx9.1 = getelementptr inbounds double* %Ce, i64 %idxprom8.1
  %32 = load double* %arrayidx9.1, align 8, !tbaa !12
  %33 = load double* %cs, align 8, !tbaa !29
  %34 = load double* %den, align 8, !tbaa !30
  %mul12.1 = fmul double %33, %34
  %mul13.1 = fmul double %call112.i, %mul12.1
  %div14.1 = fdiv double %mul13.1, 3.000000e+00
  %add15.1 = fadd double %32, %div14.1
  store double %add15.1, double* %arrayidx9.1, align 8, !tbaa !12
  %add19.1 = add nsw i32 %mul.1, 2
  %idxprom20.1 = sext i32 %add19.1 to i64
  %arrayidx21.1 = getelementptr inbounds double* %Ce, i64 %idxprom20.1
  %35 = load double* %arrayidx21.1, align 8, !tbaa !12
  %36 = load double* %cp, align 8, !tbaa !27
  %37 = load double* %den, align 8, !tbaa !30
  %mul23.1 = fmul double %36, %37
  %mul24.1 = fmul double %call112.i, %mul23.1
  %div25.1 = fdiv double %mul24.1, 3.000000e+00
  %add26.1 = fadd double %35, %div25.1
  store double %add26.1, double* %arrayidx21.1, align 8, !tbaa !12
  %arrayidx.2 = getelementptr inbounds i32* %bv, i64 2
  %38 = load i32* %arrayidx.2, align 4, !tbaa !5
  %mul.2 = mul nsw i32 %38, 3
  %idxprom1.2 = sext i32 %mul.2 to i64
  %arrayidx2.2 = getelementptr inbounds double* %Ce, i64 %idxprom1.2
  %39 = load double* %arrayidx2.2, align 8, !tbaa !12
  %40 = load double* %cs, align 8, !tbaa !29
  %41 = load double* %den, align 8, !tbaa !30
  %mul3.2 = fmul double %40, %41
  %mul4.2 = fmul double %call112.i, %mul3.2
  %div.2 = fdiv double %mul4.2, 3.000000e+00
  %add.2 = fadd double %39, %div.2
  store double %add.2, double* %arrayidx2.2, align 8, !tbaa !12
  %add7.2 = add nsw i32 %mul.2, 1
  %idxprom8.2 = sext i32 %add7.2 to i64
  %arrayidx9.2 = getelementptr inbounds double* %Ce, i64 %idxprom8.2
  %42 = load double* %arrayidx9.2, align 8, !tbaa !12
  %43 = load double* %cs, align 8, !tbaa !29
  %44 = load double* %den, align 8, !tbaa !30
  %mul12.2 = fmul double %43, %44
  %mul13.2 = fmul double %call112.i, %mul12.2
  %div14.2 = fdiv double %mul13.2, 3.000000e+00
  %add15.2 = fadd double %42, %div14.2
  store double %add15.2, double* %arrayidx9.2, align 8, !tbaa !12
  %add19.2 = add nsw i32 %mul.2, 2
  %idxprom20.2 = sext i32 %add19.2 to i64
  %arrayidx21.2 = getelementptr inbounds double* %Ce, i64 %idxprom20.2
  %45 = load double* %arrayidx21.2, align 8, !tbaa !12
  %46 = load double* %cp, align 8, !tbaa !27
  %47 = load double* %den, align 8, !tbaa !30
  %mul23.2 = fmul double %46, %47
  %mul24.2 = fmul double %call112.i, %mul23.2
  %div25.2 = fdiv double %mul24.2, 3.000000e+00
  %add26.2 = fadd double %45, %div25.2
  store double %add26.2, double* %arrayidx21.2, align 8, !tbaa !12
  ret void
}

; Function Attrs: nounwind uwtable
define void @element_matrices([3 x double]* nocapture readonly %vertices, %struct.properties* nocapture readonly %prop, [12 x double]* nocapture %Ke, double* nocapture %Me) #0 {
entry:
  %ds = alloca [3 x [4 x double]], align 16
  %jacobian = alloca [3 x [3 x double]], align 16
  %0 = bitcast [3 x [4 x double]]* %ds to i8*
  call void @llvm.lifetime.start(i64 96, i8* %0) #1
  %1 = bitcast [3 x [3 x double]]* %jacobian to i8*
  call void @llvm.lifetime.start(i64 72, i8* %1) #1
  %arrayidx1.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 0
  store double -1.000000e+00, double* %arrayidx1.i, align 16, !tbaa !12
  %arrayidx3.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 0
  store double -1.000000e+00, double* %arrayidx3.i, align 16, !tbaa !12
  %arrayidx5.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 0
  store double -1.000000e+00, double* %arrayidx5.i, align 16, !tbaa !12
  %arrayidx7.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 1
  store double 1.000000e+00, double* %arrayidx7.i, align 8, !tbaa !12
  %arrayidx9.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 1
  store double 0.000000e+00, double* %arrayidx9.i, align 8, !tbaa !12
  %arrayidx11.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 1
  store double 0.000000e+00, double* %arrayidx11.i, align 8, !tbaa !12
  %arrayidx13.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 2
  store double 0.000000e+00, double* %arrayidx13.i, align 16, !tbaa !12
  %arrayidx15.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 2
  store double 1.000000e+00, double* %arrayidx15.i, align 16, !tbaa !12
  %arrayidx17.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 2
  store double 0.000000e+00, double* %arrayidx17.i, align 16, !tbaa !12
  %arrayidx19.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 3
  store double 0.000000e+00, double* %arrayidx19.i, align 8, !tbaa !12
  %arrayidx21.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 3
  store double 0.000000e+00, double* %arrayidx21.i, align 8, !tbaa !12
  %arrayidx23.i = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 3
  store double 1.000000e+00, double* %arrayidx23.i, align 8, !tbaa !12
  %arrayidx14.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 0
  %.pre395 = load double* %arrayidx14.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.1.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 0
  %.pre397 = load double* %arrayidx14.1.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.2.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 0
  %.pre399 = load double* %arrayidx14.2.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.3.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 3, i64 0
  %.pre401 = load double* %arrayidx14.3.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.1386.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 1
  %.pre402 = load double* %arrayidx14.1386.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.1.1.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 1
  %.pre403 = load double* %arrayidx14.1.1.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.2.1.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 1
  %.pre404 = load double* %arrayidx14.2.1.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.3.1.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 3, i64 1
  %.pre405 = load double* %arrayidx14.3.1.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.2389.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 2
  %.pre406 = load double* %arrayidx14.2389.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.1.2.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 2
  %.pre407 = load double* %arrayidx14.1.2.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.2.2.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 2
  %.pre408 = load double* %arrayidx14.2.2.phi.trans.insert, align 8, !tbaa !12
  %arrayidx14.3.2.phi.trans.insert = getelementptr inbounds [3 x double]* %vertices, i64 3, i64 2
  %.pre409 = load double* %arrayidx14.3.2.phi.trans.insert, align 8, !tbaa !12
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.for.cond1.preheader_crit_edge, %entry
  %2 = phi double [ 0.000000e+00, %entry ], [ %.pre400, %for.cond1.preheader.for.cond1.preheader_crit_edge ]
  %3 = phi double [ 0.000000e+00, %entry ], [ %.pre398, %for.cond1.preheader.for.cond1.preheader_crit_edge ]
  %4 = phi double [ 1.000000e+00, %entry ], [ %.pre396, %for.cond1.preheader.for.cond1.preheader_crit_edge ]
  %5 = phi double [ -1.000000e+00, %entry ], [ %.pre, %for.cond1.preheader.for.cond1.preheader_crit_edge ]
  %indvars.iv392 = phi i64 [ 0, %entry ], [ %indvars.iv.next393, %for.cond1.preheader.for.cond1.preheader_crit_edge ]
  %mul = fmul double %5, %.pre395
  %add = fadd double %mul, 0.000000e+00
  %mul.1 = fmul double %4, %.pre397
  %add.1 = fadd double %add, %mul.1
  %mul.2 = fmul double %3, %.pre399
  %add.2 = fadd double %add.1, %mul.2
  %mul.3 = fmul double %2, %.pre401
  %add.3 = fadd double %add.2, %mul.3
  %arrayidx20 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 0, i64 %indvars.iv392
  store double %add.3, double* %arrayidx20, align 8, !tbaa !12
  %mul.1387 = fmul double %5, %.pre402
  %add.1388 = fadd double %mul.1387, 0.000000e+00
  %mul.1.1 = fmul double %4, %.pre403
  %add.1.1 = fadd double %add.1388, %mul.1.1
  %mul.2.1 = fmul double %3, %.pre404
  %add.2.1 = fadd double %add.1.1, %mul.2.1
  %mul.3.1 = fmul double %2, %.pre405
  %add.3.1 = fadd double %add.2.1, %mul.3.1
  %arrayidx20.1 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 1, i64 %indvars.iv392
  store double %add.3.1, double* %arrayidx20.1, align 8, !tbaa !12
  %mul.2390 = fmul double %5, %.pre406
  %add.2391 = fadd double %mul.2390, 0.000000e+00
  %mul.1.2 = fmul double %4, %.pre407
  %add.1.2 = fadd double %add.2391, %mul.1.2
  %mul.2.2 = fmul double %3, %.pre408
  %add.2.2 = fadd double %add.1.2, %mul.2.2
  %mul.3.2 = fmul double %2, %.pre409
  %add.3.2 = fadd double %add.2.2, %mul.3.2
  %arrayidx20.2 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 2, i64 %indvars.iv392
  store double %add.3.2, double* %arrayidx20.2, align 8, !tbaa !12
  %indvars.iv.next393 = add nuw nsw i64 %indvars.iv392, 1
  %exitcond394 = icmp eq i64 %indvars.iv.next393, 3
  br i1 %exitcond394, label %for.end26, label %for.cond1.preheader.for.cond1.preheader_crit_edge

for.cond1.preheader.for.cond1.preheader_crit_edge: ; preds = %for.cond1.preheader
  %arrayidx10.phi.trans.insert = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 %indvars.iv.next393, i64 0
  %.pre = load double* %arrayidx10.phi.trans.insert, align 16, !tbaa !12
  %arrayidx10.1.phi.trans.insert = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 %indvars.iv.next393, i64 1
  %.pre396 = load double* %arrayidx10.1.phi.trans.insert, align 8, !tbaa !12
  %arrayidx10.2.phi.trans.insert = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 %indvars.iv.next393, i64 2
  %.pre398 = load double* %arrayidx10.2.phi.trans.insert, align 16, !tbaa !12
  %arrayidx10.3.phi.trans.insert = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 %indvars.iv.next393, i64 3
  %.pre400 = load double* %arrayidx10.3.phi.trans.insert, align 8, !tbaa !12
  br label %for.cond1.preheader

for.end26:                                        ; preds = %for.cond1.preheader
  %arrayidx1.i293 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 1, i64 1
  %6 = load double* %arrayidx1.i293, align 8, !tbaa !12
  %arrayidx3.i294 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 2, i64 2
  %7 = load double* %arrayidx3.i294, align 16, !tbaa !12
  %mul.i295 = fmul double %6, %7
  %arrayidx5.i296 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 2, i64 1
  %8 = load double* %arrayidx5.i296, align 8, !tbaa !12
  %arrayidx7.i297 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 1, i64 2
  %9 = load double* %arrayidx7.i297, align 8, !tbaa !12
  %mul8.i298 = fmul double %8, %9
  %sub.i299 = fsub double %mul.i295, %mul8.i298
  %arrayidx12.i = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 0, i64 2
  %10 = load double* %arrayidx12.i, align 16, !tbaa !12
  %mul15.i = fmul double %8, %10
  %arrayidx17.i300 = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 0, i64 1
  %11 = load double* %arrayidx17.i300, align 8, !tbaa !12
  %mul20.i = fmul double %7, %11
  %sub21.i = fsub double %mul15.i, %mul20.i
  %mul28.i = fmul double %9, %11
  %mul33.i = fmul double %6, %10
  %sub34.i = fsub double %mul28.i, %mul33.i
  %arrayidx40.i = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 2, i64 0
  %12 = load double* %arrayidx40.i, align 16, !tbaa !12
  %mul41.i = fmul double %9, %12
  %arrayidx43.i = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 1, i64 0
  %13 = load double* %arrayidx43.i, align 8, !tbaa !12
  %mul46.i = fmul double %7, %13
  %sub47.i = fsub double %mul41.i, %mul46.i
  %arrayidx51.i = getelementptr inbounds [3 x [3 x double]]* %jacobian, i64 0, i64 0, i64 0
  %14 = load double* %arrayidx51.i, align 16, !tbaa !12
  %mul54.i = fmul double %7, %14
  %mul59.i = fmul double %10, %12
  %sub60.i = fsub double %mul54.i, %mul59.i
  %mul67.i = fmul double %10, %13
  %mul72.i = fmul double %9, %14
  %sub73.i = fsub double %mul67.i, %mul72.i
  %mul80.i = fmul double %8, %13
  %mul85.i = fmul double %6, %12
  %sub86.i = fsub double %mul80.i, %mul85.i
  %mul93.i = fmul double %11, %12
  %mul98.i = fmul double %8, %14
  %sub99.i = fsub double %mul93.i, %mul98.i
  %mul106.i = fmul double %6, %14
  %mul111.i = fmul double %11, %13
  %sub112.i = fsub double %mul106.i, %mul111.i
  %mul119.i = fmul double %sub.i299, %14
  %mul124.i = fmul double %11, %sub47.i
  %add.i301 = fadd double %mul119.i, %mul124.i
  %mul129.i = fmul double %10, %sub86.i
  %add130.i = fadd double %mul129.i, %add.i301
  %div.i302 = fdiv double 1.000000e+00, %add130.i
  %mul137.i = fmul double %sub.i299, %div.i302
  store double %mul137.i, double* %arrayidx51.i, align 16, !tbaa !12
  %mul137.1.i = fmul double %sub21.i, %div.i302
  store double %mul137.1.i, double* %arrayidx17.i300, align 8, !tbaa !12
  %mul137.2.i = fmul double %sub34.i, %div.i302
  store double %mul137.2.i, double* %arrayidx12.i, align 16, !tbaa !12
  %mul137.1194.i = fmul double %div.i302, %sub47.i
  store double %mul137.1194.i, double* %arrayidx43.i, align 8, !tbaa !12
  %mul137.1.1.i = fmul double %div.i302, %sub60.i
  store double %mul137.1.1.i, double* %arrayidx1.i293, align 8, !tbaa !12
  %mul137.2.1.i = fmul double %div.i302, %sub73.i
  store double %mul137.2.1.i, double* %arrayidx7.i297, align 8, !tbaa !12
  %mul137.2197.i = fmul double %div.i302, %sub86.i
  store double %mul137.2197.i, double* %arrayidx40.i, align 16, !tbaa !12
  %mul137.1.2.i = fmul double %div.i302, %sub99.i
  store double %mul137.1.2.i, double* %arrayidx5.i296, align 8, !tbaa !12
  %mul137.2.2.i = fmul double %div.i302, %sub112.i
  store double %mul137.2.2.i, double* %arrayidx3.i294, align 16, !tbaa !12
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.cond31.preheader.for.cond31.preheader_crit_edge, %for.end26
  %15 = phi double [ -1.000000e+00, %for.end26 ], [ %.pre412, %for.cond31.preheader.for.cond31.preheader_crit_edge ]
  %16 = phi double [ -1.000000e+00, %for.end26 ], [ %.pre411, %for.cond31.preheader.for.cond31.preheader_crit_edge ]
  %17 = phi double [ -1.000000e+00, %for.end26 ], [ %.pre410, %for.cond31.preheader.for.cond31.preheader_crit_edge ]
  %indvars.iv377 = phi i64 [ 0, %for.end26 ], [ %indvars.iv.next378, %for.cond31.preheader.for.cond31.preheader_crit_edge ]
  %arrayidx48 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 %indvars.iv377
  %mul49 = fmul double %mul137.i, %17
  %add50 = fadd double %mul49, 0.000000e+00
  %arrayidx48.1 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 %indvars.iv377
  %mul49.1 = fmul double %mul137.1194.i, %16
  %add50.1 = fadd double %add50, %mul49.1
  %arrayidx48.2 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 %indvars.iv377
  %mul49.2 = fmul double %mul137.2197.i, %15
  %add50.2 = fadd double %add50.1, %mul49.2
  %mul49.1368 = fmul double %mul137.1.i, %17
  %add50.1369 = fadd double %mul49.1368, 0.000000e+00
  %mul49.1.1 = fmul double %mul137.1.1.i, %16
  %add50.1.1 = fadd double %add50.1369, %mul49.1.1
  %mul49.2.1 = fmul double %mul137.1.2.i, %15
  %add50.2.1 = fadd double %add50.1.1, %mul49.2.1
  %mul49.2372 = fmul double %mul137.2.i, %17
  %add50.2373 = fadd double %mul49.2372, 0.000000e+00
  %mul49.1.2 = fmul double %mul137.2.1.i, %16
  %add50.1.2 = fadd double %add50.2373, %mul49.1.2
  %mul49.2.2 = fmul double %mul137.2.2.i, %15
  %add50.2.2 = fadd double %add50.1.2, %mul49.2.2
  store double %add50.2, double* %arrayidx48, align 8, !tbaa !12
  store double %add50.2.1, double* %arrayidx48.1, align 8, !tbaa !12
  store double %add50.2.2, double* %arrayidx48.2, align 8, !tbaa !12
  %indvars.iv.next378 = add nuw nsw i64 %indvars.iv377, 1
  %exitcond379 = icmp eq i64 %indvars.iv.next378, 4
  br i1 %exitcond379, label %for.end73, label %for.cond31.preheader.for.cond31.preheader_crit_edge

for.cond31.preheader.for.cond31.preheader_crit_edge: ; preds = %for.cond31.preheader
  %arrayidx48.phi.trans.insert = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 %indvars.iv.next378
  %.pre410 = load double* %arrayidx48.phi.trans.insert, align 8, !tbaa !12
  %arrayidx48.1.phi.trans.insert = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 %indvars.iv.next378
  %.pre411 = load double* %arrayidx48.1.phi.trans.insert, align 8, !tbaa !12
  %arrayidx48.2.phi.trans.insert = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 %indvars.iv.next378
  %.pre412 = load double* %arrayidx48.2.phi.trans.insert, align 8, !tbaa !12
  br label %for.cond31.preheader

for.end73:                                        ; preds = %for.cond31.preheader
  %div = fdiv double %add130.i, 6.000000e+00
  %cmp74 = fcmp ugt double %div, 0.000000e+00
  br i1 %cmp74, label %if.end, label %if.then

if.then:                                          ; preds = %for.end73
  %18 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([32 x i8]* @.str20, i64 0, i64 0), double %div) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end73
  %cp.i = getelementptr inbounds %struct.properties* %prop, i64 0, i32 0
  %19 = load double* %cp.i, align 8, !tbaa !27
  %cs.i = getelementptr inbounds %struct.properties* %prop, i64 0, i32 1
  %20 = load double* %cs.i, align 8, !tbaa !29
  %div.i = fdiv double %19, %20
  %mul.i = fmul double %div.i, %div.i
  %sub.i = fadd double %mul.i, -2.000000e+00
  %mul1.i = fmul double %sub.i, 5.000000e-01
  %sub2.i = fadd double %mul.i, -1.000000e+00
  %div3.i = fdiv double %mul1.i, %sub2.i
  %den.i = getelementptr inbounds %struct.properties* %prop, i64 0, i32 2
  %21 = load double* %den.i, align 8, !tbaa !30
  %mul4.i = fmul double %21, 2.000000e+00
  %mul6.i = fmul double %20, %mul4.i
  %mul8.i = fmul double %20, %mul6.i
  %add.i = fadd double %div3.i, 1.000000e+00
  %mul9.i = fmul double %add.i, %mul8.i
  %mul76 = fmul double %add.i, 2.000000e+00
  %mul77 = fmul double %div3.i, 2.000000e+00
  %sub = fsub double 1.000000e+00, %mul77
  %mul78 = fmul double %mul76, %sub
  %div79 = fdiv double %mul9.i, %mul78
  %mul80 = fmul double %div, %div79
  %mul81 = fmul double %div3.i, %mul9.i
  %mul85 = fmul double %add.i, %sub
  %div86 = fdiv double %mul81, %mul85
  %mul87 = fmul double %div, %div86
  %div90 = fdiv double %mul9.i, %mul76
  %mul91 = fmul double %div, %div90
  br label %for.cond95.preheader

for.cond95.preheader:                             ; preds = %for.inc178, %if.end
  %indvars.iv356 = phi i64 [ 0, %if.end ], [ %indvars.iv.next357, %for.inc178 ]
  %indvars.iv354 = phi i64 [ -1, %if.end ], [ %indvars.iv.next355, %for.inc178 ]
  %indvars.iv345 = phi i32 [ 1, %if.end ], [ %indvars.iv.next346, %for.inc178 ]
  %arrayidx120 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 %indvars.iv356
  %arrayidx127 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 %indvars.iv356
  %arrayidx135 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 %indvars.iv356
  br label %for.cond102.preheader.lr.ph

for.cond102.preheader.lr.ph:                      ; preds = %for.inc175, %for.cond95.preheader
  %indvars.iv351 = phi i64 [ 0, %for.cond95.preheader ], [ %indvars.iv.next352, %for.inc175 ]
  %indvars.iv349 = phi i64 [ %indvars.iv354, %for.cond95.preheader ], [ %indvars.iv.next350, %for.inc175 ]
  %indvars.iv.next350 = add nsw i64 %indvars.iv349, 1
  %arrayidx109 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 %indvars.iv351, i64 %indvars.iv356
  %22 = load double* %arrayidx109, align 8, !tbaa !12
  br label %for.cond102.preheader

for.cond102.preheader:                            ; preds = %for.inc172, %for.cond102.preheader.lr.ph
  %indvars.iv343 = phi i64 [ %indvars.iv.next344, %for.inc172 ], [ 0, %for.cond102.preheader.lr.ph ]
  %column.0311 = phi i32 [ %column.1.lcssa, %for.inc172 ], [ -1, %for.cond102.preheader.lr.ph ]
  %arrayidx123 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 0, i64 %indvars.iv343
  %arrayidx130 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 1, i64 %indvars.iv343
  %arrayidx138 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 2, i64 %indvars.iv343
  %23 = trunc i64 %indvars.iv343 to i32
  %24 = trunc i64 %indvars.iv356 to i32
  %cmp142 = icmp eq i32 %24, %23
  %arrayidx154 = getelementptr inbounds [3 x [4 x double]]* %ds, i64 0, i64 %indvars.iv351, i64 %indvars.iv343
  %25 = sext i32 %column.0311 to i64
  %indvars.iv.next339 = add nsw i64 %25, 1
  %26 = load double* %arrayidx123, align 8, !tbaa !12
  %mul114.us = fmul double %22, %26
  %27 = trunc i64 %indvars.iv351 to i32
  %cmp115.us = icmp eq i32 %27, 0
  br i1 %cmp142, label %for.cond102.preheader.split.us, label %for.cond102.preheader.for.cond102.preheader.split_crit_edge

for.cond102.preheader.for.cond102.preheader.split_crit_edge: ; preds = %for.cond102.preheader
  %28 = load double* %arrayidx120, align 8, !tbaa !12
  br i1 %cmp115.us, label %if.then116, label %if.else145

for.cond102.preheader.split.us:                   ; preds = %for.cond102.preheader
  br i1 %cmp115.us, label %if.then116.us, label %if.end158.us

if.then116.us:                                    ; preds = %for.cond102.preheader.split.us
  %29 = load double* %arrayidx120, align 8, !tbaa !12
  %mul124.us = fmul double %29, %26
  %30 = load double* %arrayidx127, align 8, !tbaa !12
  %31 = load double* %arrayidx130, align 8, !tbaa !12
  %mul131.us = fmul double %30, %31
  %add132.us = fadd double %mul124.us, %mul131.us
  %32 = load double* %arrayidx135, align 8, !tbaa !12
  %33 = load double* %arrayidx138, align 8, !tbaa !12
  %mul139.us = fmul double %32, %33
  %add140.us = fadd double %add132.us, %mul139.us
  %mul141.us = fmul double %mul91, %add140.us
  br label %if.end158.us

if.end158.us:                                     ; preds = %if.then116.us, %for.cond102.preheader.split.us
  %tt.0.us = phi double [ %mul141.us, %if.then116.us ], [ 0.000000e+00, %for.cond102.preheader.split.us ]
  %ts.0.us = fmul double %mul114.us, %mul80
  %arrayidx162.us = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv.next350, i64 %indvars.iv.next339
  %34 = load double* %arrayidx162.us, align 8, !tbaa !12
  %add163.us = fadd double %34, %ts.0.us
  %add164.us = fadd double %tt.0.us, %add163.us
  store double %add164.us, double* %arrayidx162.us, align 8, !tbaa !12
  %indvars.iv.next339.1 = add nsw i64 %25, 2
  %35 = load double* %arrayidx130, align 8, !tbaa !12
  %mul114.us.1 = fmul double %22, %35
  %cmp115.us.1 = icmp eq i32 %27, 1
  br i1 %cmp115.us.1, label %if.then116.us.1, label %if.end158.us.1

if.then116:                                       ; preds = %for.cond102.preheader.for.cond102.preheader.split_crit_edge
  %mul124 = fmul double %28, %26
  %36 = load double* %arrayidx127, align 8, !tbaa !12
  %37 = load double* %arrayidx130, align 8, !tbaa !12
  %mul131 = fmul double %36, %37
  %add132 = fadd double %mul124, %mul131
  %38 = load double* %arrayidx135, align 8, !tbaa !12
  %39 = load double* %arrayidx138, align 8, !tbaa !12
  %mul139 = fmul double %38, %39
  %add140 = fadd double %add132, %mul139
  br label %if.end158

if.else145:                                       ; preds = %for.cond102.preheader.for.cond102.preheader.split_crit_edge
  %40 = load double* %arrayidx154, align 8, !tbaa !12
  %mul155 = fmul double %28, %40
  br label %if.end158

if.end158:                                        ; preds = %if.else145, %if.then116
  %add140.sink = phi double [ %add140, %if.then116 ], [ %mul155, %if.else145 ]
  %mul80.pn = phi double [ %mul80, %if.then116 ], [ %mul87, %if.else145 ]
  %mul141 = fmul double %mul91, %add140.sink
  %ts.0 = fmul double %mul114.us, %mul80.pn
  %arrayidx162 = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv.next350, i64 %indvars.iv.next339
  %41 = load double* %arrayidx162, align 8, !tbaa !12
  %add163 = fadd double %41, %ts.0
  %add164 = fadd double %mul141, %add163
  store double %add164, double* %arrayidx162, align 8, !tbaa !12
  %indvars.iv.next334.1 = add nsw i64 %25, 2
  %42 = load double* %arrayidx130, align 8, !tbaa !12
  %mul114.1 = fmul double %22, %42
  %cmp115.1 = icmp eq i32 %27, 1
  br i1 %cmp115.1, label %if.then116.1, label %if.else145.1

for.inc172:                                       ; preds = %if.end158.us.2, %if.end158.2
  %column.1.lcssa = add i32 %column.0311, 3
  %indvars.iv.next344 = add nuw nsw i64 %indvars.iv343, 1
  %lftr.wideiv347 = trunc i64 %indvars.iv.next344 to i32
  %exitcond348 = icmp eq i32 %lftr.wideiv347, %indvars.iv345
  br i1 %exitcond348, label %for.inc175, label %for.cond102.preheader

for.inc175:                                       ; preds = %for.inc172
  %indvars.iv.next352 = add nuw nsw i64 %indvars.iv351, 1
  %exitcond353 = icmp eq i64 %indvars.iv.next352, 3
  br i1 %exitcond353, label %for.inc178, label %for.cond102.preheader.lr.ph

for.inc178:                                       ; preds = %for.inc175
  %indvars.iv.next355 = add nsw i64 %indvars.iv354, 3
  %indvars.iv.next357 = add nuw nsw i64 %indvars.iv356, 1
  %indvars.iv.next346 = add nuw nsw i32 %indvars.iv345, 1
  %exitcond358 = icmp eq i64 %indvars.iv.next357, 4
  br i1 %exitcond358, label %for.end180, label %for.cond95.preheader

for.end180:                                       ; preds = %for.inc178
  %43 = load double* %den.i, align 8, !tbaa !30
  %mul181 = fmul double %div, %43
  %div182 = fmul double %mul181, 2.500000e-01
  store double %div182, double* %Me, align 8, !tbaa !12
  %arrayidx187.1 = getelementptr inbounds double* %Me, i64 1
  store double %div182, double* %arrayidx187.1, align 8, !tbaa !12
  %arrayidx187.2 = getelementptr inbounds double* %Me, i64 2
  store double %div182, double* %arrayidx187.2, align 8, !tbaa !12
  %arrayidx187.3 = getelementptr inbounds double* %Me, i64 3
  store double %div182, double* %arrayidx187.3, align 8, !tbaa !12
  %arrayidx187.4 = getelementptr inbounds double* %Me, i64 4
  store double %div182, double* %arrayidx187.4, align 8, !tbaa !12
  %arrayidx187.5 = getelementptr inbounds double* %Me, i64 5
  store double %div182, double* %arrayidx187.5, align 8, !tbaa !12
  %arrayidx187.6 = getelementptr inbounds double* %Me, i64 6
  store double %div182, double* %arrayidx187.6, align 8, !tbaa !12
  %arrayidx187.7 = getelementptr inbounds double* %Me, i64 7
  store double %div182, double* %arrayidx187.7, align 8, !tbaa !12
  %arrayidx187.8 = getelementptr inbounds double* %Me, i64 8
  store double %div182, double* %arrayidx187.8, align 8, !tbaa !12
  %arrayidx187.9 = getelementptr inbounds double* %Me, i64 9
  store double %div182, double* %arrayidx187.9, align 8, !tbaa !12
  %arrayidx187.10 = getelementptr inbounds double* %Me, i64 10
  store double %div182, double* %arrayidx187.10, align 8, !tbaa !12
  %arrayidx187.11 = getelementptr inbounds double* %Me, i64 11
  store double %div182, double* %arrayidx187.11, align 8, !tbaa !12
  br label %for.body196.lr.ph

for.body196.lr.ph:                                ; preds = %for.inc208, %for.end180
  %indvars.iv327 = phi i64 [ 0, %for.end180 ], [ %indvars.iv.next328, %for.inc208 ]
  %indvars.iv325 = phi i32 [ 1, %for.end180 ], [ %indvars.iv.next326, %for.inc208 ]
  br label %for.body196

for.body196:                                      ; preds = %for.body196, %for.body196.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body196 ], [ 0, %for.body196.lr.ph ]
  %arrayidx200 = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv327, i64 %indvars.iv
  %44 = load double* %arrayidx200, align 8, !tbaa !12
  %arrayidx204 = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv, i64 %indvars.iv327
  store double %44, double* %arrayidx204, align 8, !tbaa !12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv325
  br i1 %exitcond, label %for.inc208, label %for.body196

for.inc208:                                       ; preds = %for.body196
  %indvars.iv.next328 = add nuw nsw i64 %indvars.iv327, 1
  %indvars.iv.next326 = add nuw nsw i32 %indvars.iv325, 1
  %exitcond329 = icmp eq i64 %indvars.iv.next328, 12
  br i1 %exitcond329, label %for.end210, label %for.body196.lr.ph

for.end210:                                       ; preds = %for.inc208
  call void @llvm.lifetime.end(i64 72, i8* %1) #1
  call void @llvm.lifetime.end(i64 96, i8* %0) #1
  ret void

if.else145.1:                                     ; preds = %if.end158
  %45 = load double* %arrayidx127, align 8, !tbaa !12
  %46 = load double* %arrayidx154, align 8, !tbaa !12
  %mul155.1 = fmul double %45, %46
  br label %if.end158.1

if.then116.1:                                     ; preds = %if.end158
  %47 = load double* %arrayidx120, align 8, !tbaa !12
  %mul124.1 = fmul double %47, %26
  %48 = load double* %arrayidx127, align 8, !tbaa !12
  %mul131.1 = fmul double %48, %42
  %add132.1 = fadd double %mul124.1, %mul131.1
  %49 = load double* %arrayidx135, align 8, !tbaa !12
  %50 = load double* %arrayidx138, align 8, !tbaa !12
  %mul139.1 = fmul double %49, %50
  %add140.1 = fadd double %add132.1, %mul139.1
  br label %if.end158.1

if.end158.1:                                      ; preds = %if.then116.1, %if.else145.1
  %mul155.1.sink = phi double [ %mul155.1, %if.else145.1 ], [ %add140.1, %if.then116.1 ]
  %mul80.pn.1 = phi double [ %mul87, %if.else145.1 ], [ %mul80, %if.then116.1 ]
  %mul156.1 = fmul double %mul91, %mul155.1.sink
  %ts.0.1 = fmul double %mul114.1, %mul80.pn.1
  %arrayidx162.1 = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv.next350, i64 %indvars.iv.next334.1
  %51 = load double* %arrayidx162.1, align 8, !tbaa !12
  %add163.1 = fadd double %51, %ts.0.1
  %add164.1 = fadd double %mul156.1, %add163.1
  store double %add164.1, double* %arrayidx162.1, align 8, !tbaa !12
  %indvars.iv.next334.2 = add nsw i64 %25, 3
  %52 = load double* %arrayidx138, align 8, !tbaa !12
  %mul114.2 = fmul double %22, %52
  %cmp115.2 = icmp eq i32 %27, 2
  br i1 %cmp115.2, label %if.then116.2, label %if.else145.2

if.else145.2:                                     ; preds = %if.end158.1
  %53 = load double* %arrayidx135, align 8, !tbaa !12
  %54 = load double* %arrayidx154, align 8, !tbaa !12
  %mul155.2 = fmul double %53, %54
  br label %if.end158.2

if.then116.2:                                     ; preds = %if.end158.1
  %55 = load double* %arrayidx120, align 8, !tbaa !12
  %mul124.2 = fmul double %55, %26
  %56 = load double* %arrayidx127, align 8, !tbaa !12
  %mul131.2 = fmul double %56, %42
  %add132.2 = fadd double %mul124.2, %mul131.2
  %57 = load double* %arrayidx135, align 8, !tbaa !12
  %mul139.2 = fmul double %57, %52
  %add140.2 = fadd double %add132.2, %mul139.2
  br label %if.end158.2

if.end158.2:                                      ; preds = %if.then116.2, %if.else145.2
  %mul155.2.sink = phi double [ %mul155.2, %if.else145.2 ], [ %add140.2, %if.then116.2 ]
  %mul80.pn.2 = phi double [ %mul87, %if.else145.2 ], [ %mul80, %if.then116.2 ]
  %mul156.2 = fmul double %mul91, %mul155.2.sink
  %ts.0.2 = fmul double %mul114.2, %mul80.pn.2
  %arrayidx162.2 = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv.next350, i64 %indvars.iv.next334.2
  %58 = load double* %arrayidx162.2, align 8, !tbaa !12
  %add163.2 = fadd double %58, %ts.0.2
  %add164.2 = fadd double %mul156.2, %add163.2
  store double %add164.2, double* %arrayidx162.2, align 8, !tbaa !12
  br label %for.inc172

if.then116.us.1:                                  ; preds = %if.end158.us
  %59 = load double* %arrayidx120, align 8, !tbaa !12
  %mul124.us.1 = fmul double %59, %26
  %60 = load double* %arrayidx127, align 8, !tbaa !12
  %mul131.us.1 = fmul double %60, %35
  %add132.us.1 = fadd double %mul124.us.1, %mul131.us.1
  %61 = load double* %arrayidx135, align 8, !tbaa !12
  %62 = load double* %arrayidx138, align 8, !tbaa !12
  %mul139.us.1 = fmul double %61, %62
  %add140.us.1 = fadd double %add132.us.1, %mul139.us.1
  %mul141.us.1 = fmul double %mul91, %add140.us.1
  br label %if.end158.us.1

if.end158.us.1:                                   ; preds = %if.then116.us.1, %if.end158.us
  %tt.0.us.1 = phi double [ %mul141.us.1, %if.then116.us.1 ], [ 0.000000e+00, %if.end158.us ]
  %ts.0.us.1 = fmul double %mul114.us.1, %mul80
  %arrayidx162.us.1 = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv.next350, i64 %indvars.iv.next339.1
  %63 = load double* %arrayidx162.us.1, align 8, !tbaa !12
  %add163.us.1 = fadd double %63, %ts.0.us.1
  %add164.us.1 = fadd double %tt.0.us.1, %add163.us.1
  store double %add164.us.1, double* %arrayidx162.us.1, align 8, !tbaa !12
  %indvars.iv.next339.2 = add nsw i64 %25, 3
  %64 = load double* %arrayidx138, align 8, !tbaa !12
  %mul114.us.2 = fmul double %22, %64
  %cmp115.us.2 = icmp eq i32 %27, 2
  br i1 %cmp115.us.2, label %if.then116.us.2, label %if.end158.us.2

if.then116.us.2:                                  ; preds = %if.end158.us.1
  %65 = load double* %arrayidx120, align 8, !tbaa !12
  %mul124.us.2 = fmul double %65, %26
  %66 = load double* %arrayidx127, align 8, !tbaa !12
  %mul131.us.2 = fmul double %66, %35
  %add132.us.2 = fadd double %mul124.us.2, %mul131.us.2
  %67 = load double* %arrayidx135, align 8, !tbaa !12
  %mul139.us.2 = fmul double %67, %64
  %add140.us.2 = fadd double %add132.us.2, %mul139.us.2
  %mul141.us.2 = fmul double %mul91, %add140.us.2
  br label %if.end158.us.2

if.end158.us.2:                                   ; preds = %if.then116.us.2, %if.end158.us.1
  %tt.0.us.2 = phi double [ %mul141.us.2, %if.then116.us.2 ], [ 0.000000e+00, %if.end158.us.1 ]
  %ts.0.us.2 = fmul double %mul114.us.2, %mul80
  %arrayidx162.us.2 = getelementptr inbounds [12 x double]* %Ke, i64 %indvars.iv.next350, i64 %indvars.iv.next339.2
  %68 = load double* %arrayidx162.us.2, align 8, !tbaa !12
  %add163.us.2 = fadd double %68, %ts.0.us.2
  %add164.us.2 = fadd double %tt.0.us.2, %add163.us.2
  store double %add164.us.2, double* %arrayidx162.us.2, align 8, !tbaa !12
  br label %for.inc172
}

; Function Attrs: nounwind uwtable
define void @vv12x12(double* nocapture readonly %v1, double* nocapture readonly %v2, double* nocapture %u) #0 {
entry:
  %0 = load double* %v1, align 8, !tbaa !12
  %1 = load double* %v2, align 8, !tbaa !12
  %mul = fmul double %0, %1
  store double %mul, double* %u, align 8, !tbaa !12
  %arrayidx.1 = getelementptr inbounds double* %v1, i64 1
  %2 = load double* %arrayidx.1, align 8, !tbaa !12
  %arrayidx2.1 = getelementptr inbounds double* %v2, i64 1
  %3 = load double* %arrayidx2.1, align 8, !tbaa !12
  %mul.1 = fmul double %2, %3
  %arrayidx4.1 = getelementptr inbounds double* %u, i64 1
  store double %mul.1, double* %arrayidx4.1, align 8, !tbaa !12
  %arrayidx.2 = getelementptr inbounds double* %v1, i64 2
  %4 = load double* %arrayidx.2, align 8, !tbaa !12
  %arrayidx2.2 = getelementptr inbounds double* %v2, i64 2
  %5 = load double* %arrayidx2.2, align 8, !tbaa !12
  %mul.2 = fmul double %4, %5
  %arrayidx4.2 = getelementptr inbounds double* %u, i64 2
  store double %mul.2, double* %arrayidx4.2, align 8, !tbaa !12
  %arrayidx.3 = getelementptr inbounds double* %v1, i64 3
  %6 = load double* %arrayidx.3, align 8, !tbaa !12
  %arrayidx2.3 = getelementptr inbounds double* %v2, i64 3
  %7 = load double* %arrayidx2.3, align 8, !tbaa !12
  %mul.3 = fmul double %6, %7
  %arrayidx4.3 = getelementptr inbounds double* %u, i64 3
  store double %mul.3, double* %arrayidx4.3, align 8, !tbaa !12
  %arrayidx.4 = getelementptr inbounds double* %v1, i64 4
  %8 = load double* %arrayidx.4, align 8, !tbaa !12
  %arrayidx2.4 = getelementptr inbounds double* %v2, i64 4
  %9 = load double* %arrayidx2.4, align 8, !tbaa !12
  %mul.4 = fmul double %8, %9
  %arrayidx4.4 = getelementptr inbounds double* %u, i64 4
  store double %mul.4, double* %arrayidx4.4, align 8, !tbaa !12
  %arrayidx.5 = getelementptr inbounds double* %v1, i64 5
  %10 = load double* %arrayidx.5, align 8, !tbaa !12
  %arrayidx2.5 = getelementptr inbounds double* %v2, i64 5
  %11 = load double* %arrayidx2.5, align 8, !tbaa !12
  %mul.5 = fmul double %10, %11
  %arrayidx4.5 = getelementptr inbounds double* %u, i64 5
  store double %mul.5, double* %arrayidx4.5, align 8, !tbaa !12
  %arrayidx.6 = getelementptr inbounds double* %v1, i64 6
  %12 = load double* %arrayidx.6, align 8, !tbaa !12
  %arrayidx2.6 = getelementptr inbounds double* %v2, i64 6
  %13 = load double* %arrayidx2.6, align 8, !tbaa !12
  %mul.6 = fmul double %12, %13
  %arrayidx4.6 = getelementptr inbounds double* %u, i64 6
  store double %mul.6, double* %arrayidx4.6, align 8, !tbaa !12
  %arrayidx.7 = getelementptr inbounds double* %v1, i64 7
  %14 = load double* %arrayidx.7, align 8, !tbaa !12
  %arrayidx2.7 = getelementptr inbounds double* %v2, i64 7
  %15 = load double* %arrayidx2.7, align 8, !tbaa !12
  %mul.7 = fmul double %14, %15
  %arrayidx4.7 = getelementptr inbounds double* %u, i64 7
  store double %mul.7, double* %arrayidx4.7, align 8, !tbaa !12
  %arrayidx.8 = getelementptr inbounds double* %v1, i64 8
  %16 = load double* %arrayidx.8, align 8, !tbaa !12
  %arrayidx2.8 = getelementptr inbounds double* %v2, i64 8
  %17 = load double* %arrayidx2.8, align 8, !tbaa !12
  %mul.8 = fmul double %16, %17
  %arrayidx4.8 = getelementptr inbounds double* %u, i64 8
  store double %mul.8, double* %arrayidx4.8, align 8, !tbaa !12
  %arrayidx.9 = getelementptr inbounds double* %v1, i64 9
  %18 = load double* %arrayidx.9, align 8, !tbaa !12
  %arrayidx2.9 = getelementptr inbounds double* %v2, i64 9
  %19 = load double* %arrayidx2.9, align 8, !tbaa !12
  %mul.9 = fmul double %18, %19
  %arrayidx4.9 = getelementptr inbounds double* %u, i64 9
  store double %mul.9, double* %arrayidx4.9, align 8, !tbaa !12
  %arrayidx.10 = getelementptr inbounds double* %v1, i64 10
  %20 = load double* %arrayidx.10, align 8, !tbaa !12
  %arrayidx2.10 = getelementptr inbounds double* %v2, i64 10
  %21 = load double* %arrayidx2.10, align 8, !tbaa !12
  %mul.10 = fmul double %20, %21
  %arrayidx4.10 = getelementptr inbounds double* %u, i64 10
  store double %mul.10, double* %arrayidx4.10, align 8, !tbaa !12
  %arrayidx.11 = getelementptr inbounds double* %v1, i64 11
  %22 = load double* %arrayidx.11, align 8, !tbaa !12
  %arrayidx2.11 = getelementptr inbounds double* %v2, i64 11
  %23 = load double* %arrayidx2.11, align 8, !tbaa !12
  %mul.11 = fmul double %22, %23
  %arrayidx4.11 = getelementptr inbounds double* %u, i64 11
  store double %mul.11, double* %arrayidx4.11, align 8, !tbaa !12
  ret void
}

; Function Attrs: nounwind uwtable
define void @mv12x12([12 x double]* nocapture readonly %m, double* nocapture %v) #0 {
entry:
  %u = alloca [12 x double], align 16
  %0 = bitcast [12 x double]* %u to i8*
  call void @llvm.lifetime.start(i64 96, i8* %0) #1
  %.pre = load double* %v, align 8, !tbaa !12
  %arrayidx9.1.phi.trans.insert = getelementptr inbounds double* %v, i64 1
  %.pre41 = load double* %arrayidx9.1.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.2.phi.trans.insert = getelementptr inbounds double* %v, i64 2
  %.pre42 = load double* %arrayidx9.2.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.3.phi.trans.insert = getelementptr inbounds double* %v, i64 3
  %.pre43 = load double* %arrayidx9.3.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.4.phi.trans.insert = getelementptr inbounds double* %v, i64 4
  %.pre44 = load double* %arrayidx9.4.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.5.phi.trans.insert = getelementptr inbounds double* %v, i64 5
  %.pre45 = load double* %arrayidx9.5.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.6.phi.trans.insert = getelementptr inbounds double* %v, i64 6
  %.pre46 = load double* %arrayidx9.6.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.7.phi.trans.insert = getelementptr inbounds double* %v, i64 7
  %.pre47 = load double* %arrayidx9.7.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.8.phi.trans.insert = getelementptr inbounds double* %v, i64 8
  %.pre48 = load double* %arrayidx9.8.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.9.phi.trans.insert = getelementptr inbounds double* %v, i64 9
  %.pre49 = load double* %arrayidx9.9.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.10.phi.trans.insert = getelementptr inbounds double* %v, i64 10
  %.pre50 = load double* %arrayidx9.10.phi.trans.insert, align 8, !tbaa !12
  %arrayidx9.11.phi.trans.insert = getelementptr inbounds double* %v, i64 11
  %.pre51 = load double* %arrayidx9.11.phi.trans.insert, align 8, !tbaa !12
  br label %for.body

for.cond15.preheader:                             ; preds = %for.body
  %v40 = bitcast double* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %v40, i8* %0, i64 96, i32 8, i1 false)
  call void @llvm.lifetime.end(i64 96, i8* %0) #1
  ret void

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [12 x double]* %u, i64 0, i64 %indvars.iv
  %arrayidx7 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 0
  %1 = load double* %arrayidx7, align 8, !tbaa !12
  %mul = fmul double %1, %.pre
  %add = fadd double %mul, 0.000000e+00
  %arrayidx7.1 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 1
  %2 = load double* %arrayidx7.1, align 8, !tbaa !12
  %mul.1 = fmul double %2, %.pre41
  %add.1 = fadd double %add, %mul.1
  %arrayidx7.2 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 2
  %3 = load double* %arrayidx7.2, align 8, !tbaa !12
  %mul.2 = fmul double %3, %.pre42
  %add.2 = fadd double %add.1, %mul.2
  %arrayidx7.3 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 3
  %4 = load double* %arrayidx7.3, align 8, !tbaa !12
  %mul.3 = fmul double %4, %.pre43
  %add.3 = fadd double %add.2, %mul.3
  %arrayidx7.4 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 4
  %5 = load double* %arrayidx7.4, align 8, !tbaa !12
  %mul.4 = fmul double %5, %.pre44
  %add.4 = fadd double %add.3, %mul.4
  %arrayidx7.5 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 5
  %6 = load double* %arrayidx7.5, align 8, !tbaa !12
  %mul.5 = fmul double %6, %.pre45
  %add.5 = fadd double %add.4, %mul.5
  %arrayidx7.6 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 6
  %7 = load double* %arrayidx7.6, align 8, !tbaa !12
  %mul.6 = fmul double %7, %.pre46
  %add.6 = fadd double %add.5, %mul.6
  %arrayidx7.7 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 7
  %8 = load double* %arrayidx7.7, align 8, !tbaa !12
  %mul.7 = fmul double %8, %.pre47
  %add.7 = fadd double %add.6, %mul.7
  %arrayidx7.8 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 8
  %9 = load double* %arrayidx7.8, align 8, !tbaa !12
  %mul.8 = fmul double %9, %.pre48
  %add.8 = fadd double %add.7, %mul.8
  %arrayidx7.9 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 9
  %10 = load double* %arrayidx7.9, align 8, !tbaa !12
  %mul.9 = fmul double %10, %.pre49
  %add.9 = fadd double %add.8, %mul.9
  %arrayidx7.10 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 10
  %11 = load double* %arrayidx7.10, align 8, !tbaa !12
  %mul.10 = fmul double %11, %.pre50
  %add.10 = fadd double %add.9, %mul.10
  %arrayidx7.11 = getelementptr inbounds [12 x double]* %m, i64 %indvars.iv, i64 11
  %12 = load double* %arrayidx7.11, align 8, !tbaa !12
  %mul.11 = fmul double %12, %.pre51
  %add.11 = fadd double %add.10, %mul.11
  store double %add.11, double* %arrayidx, align 8, !tbaa !12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 12
  br i1 %exitcond, label %for.cond15.preheader, label %for.body
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define void @smvp(i32 %nodes, double*** nocapture readonly %A, i32* nocapture readonly %Acol, i32* nocapture readonly %Aindex, double** nocapture readonly %v, double** nocapture readonly %w) #0 {
entry:
  %cmp402 = icmp sgt i32 %nodes, 0
  br i1 %cmp402, label %for.body, label %for.end

for.body:                                         ; preds = %while.end, %entry
  %indvars.iv405 = phi i64 [ %indvars.iv.next406, %while.end ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i32* %Aindex, i64 %indvars.iv405
  %0 = load i32* %arrayidx, align 4, !tbaa !5
  %indvars.iv.next406 = add nuw nsw i64 %indvars.iv405, 1
  %arrayidx2 = getelementptr inbounds i32* %Aindex, i64 %indvars.iv.next406
  %1 = load i32* %arrayidx2, align 4, !tbaa !5
  %idxprom3 = sext i32 %0 to i64
  %arrayidx4 = getelementptr inbounds double*** %A, i64 %idxprom3
  %2 = load double*** %arrayidx4, align 8, !tbaa !1
  %3 = load double** %2, align 8, !tbaa !1
  %4 = load double* %3, align 8, !tbaa !12
  %arrayidx8 = getelementptr inbounds double** %v, i64 %indvars.iv405
  %5 = load double** %arrayidx8, align 8, !tbaa !1
  %6 = load double* %5, align 8, !tbaa !12
  %mul = fmul double %4, %6
  %arrayidx13 = getelementptr inbounds double* %3, i64 1
  %7 = load double* %arrayidx13, align 8, !tbaa !12
  %arrayidx16 = getelementptr inbounds double* %5, i64 1
  %8 = load double* %arrayidx16, align 8, !tbaa !12
  %mul17 = fmul double %7, %8
  %add18 = fadd double %mul, %mul17
  %arrayidx22 = getelementptr inbounds double* %3, i64 2
  %9 = load double* %arrayidx22, align 8, !tbaa !12
  %arrayidx25 = getelementptr inbounds double* %5, i64 2
  %10 = load double* %arrayidx25, align 8, !tbaa !12
  %mul26 = fmul double %9, %10
  %add27 = fadd double %add18, %mul26
  %arrayidx30 = getelementptr inbounds double** %2, i64 1
  %11 = load double** %arrayidx30, align 8, !tbaa !1
  %12 = load double* %11, align 8, !tbaa !12
  %mul35 = fmul double %6, %12
  %arrayidx39 = getelementptr inbounds double* %11, i64 1
  %13 = load double* %arrayidx39, align 8, !tbaa !12
  %mul43 = fmul double %8, %13
  %add44 = fadd double %mul35, %mul43
  %arrayidx48 = getelementptr inbounds double* %11, i64 2
  %14 = load double* %arrayidx48, align 8, !tbaa !12
  %mul52 = fmul double %10, %14
  %add53 = fadd double %add44, %mul52
  %arrayidx56 = getelementptr inbounds double** %2, i64 2
  %15 = load double** %arrayidx56, align 8, !tbaa !1
  %16 = load double* %15, align 8, !tbaa !12
  %mul61 = fmul double %6, %16
  %arrayidx65 = getelementptr inbounds double* %15, i64 1
  %17 = load double* %arrayidx65, align 8, !tbaa !12
  %mul69 = fmul double %8, %17
  %add70 = fadd double %mul61, %mul69
  %arrayidx74 = getelementptr inbounds double* %15, i64 2
  %18 = load double* %arrayidx74, align 8, !tbaa !12
  %mul78 = fmul double %10, %18
  %add79 = fadd double %add70, %mul78
  %Anext.0394 = add i32 %0, 1
  %cmp80395 = icmp slt i32 %Anext.0394, %1
  br i1 %cmp80395, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %for.body
  %19 = sext i32 %Anext.0394 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.while.body_crit_edge, %while.body.lr.ph
  %20 = phi double [ %10, %while.body.lr.ph ], [ %.pre409, %while.body.while.body_crit_edge ]
  %21 = phi double [ %8, %while.body.lr.ph ], [ %.pre408, %while.body.while.body_crit_edge ]
  %22 = phi double [ %6, %while.body.lr.ph ], [ %.pre, %while.body.while.body_crit_edge ]
  %indvars.iv = phi i64 [ %19, %while.body.lr.ph ], [ %indvars.iv.next, %while.body.while.body_crit_edge ]
  %Anext.0399 = phi i32 [ %Anext.0394, %while.body.lr.ph ], [ %Anext.0, %while.body.while.body_crit_edge ]
  %sum2.0398 = phi double [ %add79, %while.body.lr.ph ], [ %add163, %while.body.while.body_crit_edge ]
  %sum1.0397 = phi double [ %add53, %while.body.lr.ph ], [ %add136, %while.body.while.body_crit_edge ]
  %sum0.0396 = phi double [ %add27, %while.body.lr.ph ], [ %add109, %while.body.while.body_crit_edge ]
  %arrayidx82 = getelementptr inbounds i32* %Acol, i64 %indvars.iv
  %23 = load i32* %arrayidx82, align 4, !tbaa !5
  %arrayidx84 = getelementptr inbounds double*** %A, i64 %indvars.iv
  %24 = load double*** %arrayidx84, align 8, !tbaa !1
  %25 = load double** %24, align 8, !tbaa !1
  %26 = load double* %25, align 8, !tbaa !12
  %idxprom87 = sext i32 %23 to i64
  %arrayidx88 = getelementptr inbounds double** %v, i64 %idxprom87
  %27 = load double** %arrayidx88, align 8, !tbaa !1
  %28 = load double* %27, align 8, !tbaa !12
  %mul90 = fmul double %26, %28
  %arrayidx94 = getelementptr inbounds double* %25, i64 1
  %29 = load double* %arrayidx94, align 8, !tbaa !12
  %arrayidx97 = getelementptr inbounds double* %27, i64 1
  %30 = load double* %arrayidx97, align 8, !tbaa !12
  %mul98 = fmul double %29, %30
  %add99 = fadd double %mul90, %mul98
  %arrayidx103 = getelementptr inbounds double* %25, i64 2
  %31 = load double* %arrayidx103, align 8, !tbaa !12
  %arrayidx106 = getelementptr inbounds double* %27, i64 2
  %32 = load double* %arrayidx106, align 8, !tbaa !12
  %mul107 = fmul double %31, %32
  %add108 = fadd double %add99, %mul107
  %add109 = fadd double %sum0.0396, %add108
  %arrayidx112 = getelementptr inbounds double** %24, i64 1
  %33 = load double** %arrayidx112, align 8, !tbaa !1
  %34 = load double* %33, align 8, !tbaa !12
  %mul117 = fmul double %28, %34
  %arrayidx121 = getelementptr inbounds double* %33, i64 1
  %35 = load double* %arrayidx121, align 8, !tbaa !12
  %mul125 = fmul double %30, %35
  %add126 = fadd double %mul117, %mul125
  %arrayidx130 = getelementptr inbounds double* %33, i64 2
  %36 = load double* %arrayidx130, align 8, !tbaa !12
  %mul134 = fmul double %32, %36
  %add135 = fadd double %add126, %mul134
  %add136 = fadd double %sum1.0397, %add135
  %arrayidx139 = getelementptr inbounds double** %24, i64 2
  %37 = load double** %arrayidx139, align 8, !tbaa !1
  %38 = load double* %37, align 8, !tbaa !12
  %mul144 = fmul double %28, %38
  %arrayidx148 = getelementptr inbounds double* %37, i64 1
  %39 = load double* %arrayidx148, align 8, !tbaa !12
  %mul152 = fmul double %30, %39
  %add153 = fadd double %mul144, %mul152
  %arrayidx157 = getelementptr inbounds double* %37, i64 2
  %40 = load double* %arrayidx157, align 8, !tbaa !12
  %mul161 = fmul double %32, %40
  %add162 = fadd double %add153, %mul161
  %add163 = fadd double %sum2.0398, %add162
  %mul171 = fmul double %26, %22
  %mul179 = fmul double %34, %21
  %add180 = fadd double %mul171, %mul179
  %mul188 = fmul double %38, %20
  %add189 = fadd double %add180, %mul188
  %arrayidx191 = getelementptr inbounds double** %w, i64 %idxprom87
  %41 = load double** %arrayidx191, align 8, !tbaa !1
  %42 = load double* %41, align 8, !tbaa !12
  %add193 = fadd double %42, %add189
  store double %add193, double* %41, align 8, !tbaa !12
  %43 = load double* %arrayidx94, align 8, !tbaa !12
  %44 = load double* %5, align 8, !tbaa !12
  %mul201 = fmul double %43, %44
  %45 = load double* %arrayidx121, align 8, !tbaa !12
  %46 = load double* %arrayidx16, align 8, !tbaa !12
  %mul209 = fmul double %45, %46
  %add210 = fadd double %mul201, %mul209
  %47 = load double* %arrayidx148, align 8, !tbaa !12
  %48 = load double* %arrayidx25, align 8, !tbaa !12
  %mul218 = fmul double %47, %48
  %add219 = fadd double %add210, %mul218
  %arrayidx222 = getelementptr inbounds double* %41, i64 1
  %49 = load double* %arrayidx222, align 8, !tbaa !12
  %add223 = fadd double %49, %add219
  store double %add223, double* %arrayidx222, align 8, !tbaa !12
  %50 = load double* %arrayidx103, align 8, !tbaa !12
  %51 = load double* %5, align 8, !tbaa !12
  %mul231 = fmul double %50, %51
  %52 = load double* %arrayidx130, align 8, !tbaa !12
  %53 = load double* %arrayidx16, align 8, !tbaa !12
  %mul239 = fmul double %52, %53
  %add240 = fadd double %mul231, %mul239
  %54 = load double* %arrayidx157, align 8, !tbaa !12
  %55 = load double* %arrayidx25, align 8, !tbaa !12
  %mul248 = fmul double %54, %55
  %add249 = fadd double %add240, %mul248
  %arrayidx252 = getelementptr inbounds double* %41, i64 2
  %56 = load double* %arrayidx252, align 8, !tbaa !12
  %add253 = fadd double %56, %add249
  store double %add253, double* %arrayidx252, align 8, !tbaa !12
  %Anext.0 = add nsw i32 %Anext.0399, 1
  %exitcond = icmp eq i32 %Anext.0, %1
  br i1 %exitcond, label %while.end, label %while.body.while.body_crit_edge

while.body.while.body_crit_edge:                  ; preds = %while.body
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %.pre = load double* %5, align 8, !tbaa !12
  %.pre408 = load double* %arrayidx16, align 8, !tbaa !12
  %.pre409 = load double* %arrayidx25, align 8, !tbaa !12
  br label %while.body

while.end:                                        ; preds = %while.body, %for.body
  %sum2.0.lcssa = phi double [ %add79, %for.body ], [ %add163, %while.body ]
  %sum1.0.lcssa = phi double [ %add53, %for.body ], [ %add136, %while.body ]
  %sum0.0.lcssa = phi double [ %add27, %for.body ], [ %add109, %while.body ]
  %arrayidx256 = getelementptr inbounds double** %w, i64 %indvars.iv405
  %57 = load double** %arrayidx256, align 8, !tbaa !1
  %58 = load double* %57, align 8, !tbaa !12
  %add258 = fadd double %sum0.0.lcssa, %58
  store double %add258, double* %57, align 8, !tbaa !12
  %arrayidx261 = getelementptr inbounds double* %57, i64 1
  %59 = load double* %arrayidx261, align 8, !tbaa !12
  %add262 = fadd double %sum1.0.lcssa, %59
  store double %add262, double* %arrayidx261, align 8, !tbaa !12
  %arrayidx265 = getelementptr inbounds double* %57, i64 2
  %60 = load double* %arrayidx265, align 8, !tbaa !12
  %add266 = fadd double %sum2.0.lcssa, %60
  store double %add266, double* %arrayidx265, align 8, !tbaa !12
  %lftr.wideiv = trunc i64 %indvars.iv.next406 to i32
  %exitcond407 = icmp eq i32 %lftr.wideiv, %nodes
  br i1 %exitcond407, label %for.end, label %for.body

for.end:                                          ; preds = %while.end, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define double @phi2(double %t) #0 {
entry:
  %0 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %cmp = fcmp ult double %0, %t
  br i1 %cmp, label %return, label %if.then

if.then:                                          ; preds = %entry
  %div = fdiv double 0x401921FB54442D18, %0
  %div1 = fdiv double %div, %0
  %mul = fmul double %t, 0x401921FB54442D18
  %div2 = fdiv double %mul, %0
  %call = tail call double @sin(double %div2) #1
  %mul3 = fmul double %div1, %call
  br label %return

return:                                           ; preds = %if.then, %entry
  %retval.0 = phi double [ %mul3, %if.then ], [ 0.000000e+00, %entry ]
  ret double %retval.0
}

; Function Attrs: nounwind uwtable
define double @phi1(double %t) #0 {
entry:
  %0 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %cmp = fcmp ult double %0, %t
  br i1 %cmp, label %return, label %if.then

if.then:                                          ; preds = %entry
  %mul = fmul double %t, 0x401921FB54442D18
  %div = fdiv double %mul, %0
  %call = tail call double @cos(double %div) #1
  %sub = fsub double 1.000000e+00, %call
  %1 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %div1 = fdiv double %sub, %1
  br label %return

return:                                           ; preds = %if.then, %entry
  %retval.0 = phi double [ %div1, %if.then ], [ 0.000000e+00, %entry ]
  ret double %retval.0
}

; Function Attrs: nounwind uwtable
define double @phi0(double %t) #0 {
entry:
  %0 = load double* getelementptr inbounds (%struct.excitation* @Exc, i64 0, i32 2), align 8, !tbaa !14
  %cmp = fcmp ult double %0, %t
  br i1 %cmp, label %return, label %if.then

if.then:                                          ; preds = %entry
  %mul = fmul double %t, 0x401921FB54442D18
  %div = fdiv double %mul, %0
  %call = tail call double @sin(double %div) #1
  %sub = fsub double %div, %call
  %mul3 = fmul double %sub, 0x3FC45F306DC9C883
  br label %return

return:                                           ; preds = %if.then, %entry
  %retval.0 = phi double [ %mul3, %if.then ], [ 1.000000e+00, %entry ]
  ret double %retval.0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @shape_ders([4 x double]* nocapture %ds) #0 {
entry:
  %arrayidx1 = getelementptr inbounds [4 x double]* %ds, i64 0, i64 0
  store double -1.000000e+00, double* %arrayidx1, align 8, !tbaa !12
  %arrayidx3 = getelementptr inbounds [4 x double]* %ds, i64 1, i64 0
  store double -1.000000e+00, double* %arrayidx3, align 8, !tbaa !12
  %arrayidx5 = getelementptr inbounds [4 x double]* %ds, i64 2, i64 0
  store double -1.000000e+00, double* %arrayidx5, align 8, !tbaa !12
  %arrayidx7 = getelementptr inbounds [4 x double]* %ds, i64 0, i64 1
  store double 1.000000e+00, double* %arrayidx7, align 8, !tbaa !12
  %arrayidx9 = getelementptr inbounds [4 x double]* %ds, i64 1, i64 1
  store double 0.000000e+00, double* %arrayidx9, align 8, !tbaa !12
  %arrayidx11 = getelementptr inbounds [4 x double]* %ds, i64 2, i64 1
  store double 0.000000e+00, double* %arrayidx11, align 8, !tbaa !12
  %arrayidx13 = getelementptr inbounds [4 x double]* %ds, i64 0, i64 2
  store double 0.000000e+00, double* %arrayidx13, align 8, !tbaa !12
  %arrayidx15 = getelementptr inbounds [4 x double]* %ds, i64 1, i64 2
  store double 1.000000e+00, double* %arrayidx15, align 8, !tbaa !12
  %arrayidx17 = getelementptr inbounds [4 x double]* %ds, i64 2, i64 2
  store double 0.000000e+00, double* %arrayidx17, align 8, !tbaa !12
  %arrayidx19 = getelementptr inbounds [4 x double]* %ds, i64 0, i64 3
  store double 0.000000e+00, double* %arrayidx19, align 8, !tbaa !12
  %arrayidx21 = getelementptr inbounds [4 x double]* %ds, i64 1, i64 3
  store double 0.000000e+00, double* %arrayidx21, align 8, !tbaa !12
  %arrayidx23 = getelementptr inbounds [4 x double]* %ds, i64 2, i64 3
  store double 1.000000e+00, double* %arrayidx23, align 8, !tbaa !12
  ret void
}

; Function Attrs: nounwind uwtable
define void @get_Enu(%struct.properties* nocapture readonly %prop, double* nocapture %E, double* nocapture %nu) #0 {
entry:
  %cp = getelementptr inbounds %struct.properties* %prop, i64 0, i32 0
  %0 = load double* %cp, align 8, !tbaa !27
  %cs = getelementptr inbounds %struct.properties* %prop, i64 0, i32 1
  %1 = load double* %cs, align 8, !tbaa !29
  %div = fdiv double %0, %1
  %mul = fmul double %div, %div
  %sub = fadd double %mul, -2.000000e+00
  %mul1 = fmul double %sub, 5.000000e-01
  %sub2 = fadd double %mul, -1.000000e+00
  %div3 = fdiv double %mul1, %sub2
  store double %div3, double* %nu, align 8, !tbaa !12
  %den = getelementptr inbounds %struct.properties* %prop, i64 0, i32 2
  %2 = load double* %den, align 8, !tbaa !30
  %mul4 = fmul double %2, 2.000000e+00
  %3 = load double* %cs, align 8, !tbaa !29
  %mul6 = fmul double %mul4, %3
  %mul8 = fmul double %3, %mul6
  %add = fadd double %div3, 1.000000e+00
  %mul9 = fmul double %add, %mul8
  store double %mul9, double* %E, align 8, !tbaa !12
  ret void
}

; Function Attrs: nounwind uwtable
define void @inv_J([3 x double]* nocapture %a, double* nocapture %det) #0 {
entry:
  %arrayidx1 = getelementptr inbounds [3 x double]* %a, i64 1, i64 1
  %0 = load double* %arrayidx1, align 8, !tbaa !12
  %arrayidx3 = getelementptr inbounds [3 x double]* %a, i64 2, i64 2
  %1 = load double* %arrayidx3, align 8, !tbaa !12
  %mul = fmul double %0, %1
  %arrayidx5 = getelementptr inbounds [3 x double]* %a, i64 2, i64 1
  %2 = load double* %arrayidx5, align 8, !tbaa !12
  %arrayidx7 = getelementptr inbounds [3 x double]* %a, i64 1, i64 2
  %3 = load double* %arrayidx7, align 8, !tbaa !12
  %mul8 = fmul double %2, %3
  %sub = fsub double %mul, %mul8
  %arrayidx12 = getelementptr inbounds [3 x double]* %a, i64 0, i64 2
  %4 = load double* %arrayidx12, align 8, !tbaa !12
  %mul15 = fmul double %4, %2
  %arrayidx17 = getelementptr inbounds [3 x double]* %a, i64 0, i64 1
  %5 = load double* %arrayidx17, align 8, !tbaa !12
  %mul20 = fmul double %5, %1
  %sub21 = fsub double %mul15, %mul20
  %mul28 = fmul double %5, %3
  %mul33 = fmul double %4, %0
  %sub34 = fsub double %mul28, %mul33
  %arrayidx40 = getelementptr inbounds [3 x double]* %a, i64 2, i64 0
  %6 = load double* %arrayidx40, align 8, !tbaa !12
  %mul41 = fmul double %3, %6
  %arrayidx43 = getelementptr inbounds [3 x double]* %a, i64 1, i64 0
  %7 = load double* %arrayidx43, align 8, !tbaa !12
  %mul46 = fmul double %7, %1
  %sub47 = fsub double %mul41, %mul46
  %arrayidx51 = getelementptr inbounds [3 x double]* %a, i64 0, i64 0
  %8 = load double* %arrayidx51, align 8, !tbaa !12
  %mul54 = fmul double %8, %1
  %mul59 = fmul double %4, %6
  %sub60 = fsub double %mul54, %mul59
  %mul67 = fmul double %4, %7
  %mul72 = fmul double %8, %3
  %sub73 = fsub double %mul67, %mul72
  %mul80 = fmul double %7, %2
  %mul85 = fmul double %0, %6
  %sub86 = fsub double %mul80, %mul85
  %mul93 = fmul double %5, %6
  %mul98 = fmul double %8, %2
  %sub99 = fsub double %mul93, %mul98
  %mul106 = fmul double %8, %0
  %mul111 = fmul double %5, %7
  %sub112 = fsub double %mul106, %mul111
  %mul119 = fmul double %8, %sub
  %mul124 = fmul double %5, %sub47
  %add = fadd double %mul119, %mul124
  %mul129 = fmul double %4, %sub86
  %add130 = fadd double %add, %mul129
  store double %add130, double* %det, align 8, !tbaa !12
  %div = fdiv double 1.000000e+00, %add130
  %mul137 = fmul double %div, %sub
  store double %mul137, double* %arrayidx51, align 8, !tbaa !12
  %mul137.1 = fmul double %div, %sub21
  store double %mul137.1, double* %arrayidx17, align 8, !tbaa !12
  %mul137.2 = fmul double %div, %sub34
  store double %mul137.2, double* %arrayidx12, align 8, !tbaa !12
  %mul137.1194 = fmul double %div, %sub47
  store double %mul137.1194, double* %arrayidx43, align 8, !tbaa !12
  %mul137.1.1 = fmul double %div, %sub60
  store double %mul137.1.1, double* %arrayidx1, align 8, !tbaa !12
  %mul137.2.1 = fmul double %div, %sub73
  store double %mul137.2.1, double* %arrayidx7, align 8, !tbaa !12
  %mul137.2197 = fmul double %div, %sub86
  store double %mul137.2197, double* %arrayidx40, align 8, !tbaa !12
  %mul137.1.2 = fmul double %div, %sub99
  store double %mul137.1.2, double* %arrayidx5, align 8, !tbaa !12
  %mul137.2.2 = fmul double %div, %sub112
  store double %mul137.2.2, double* %arrayidx3, align 8, !tbaa !12
  ret void
}

; Function Attrs: nounwind uwtable
define double @area_triangle([3 x double]* nocapture readonly %vertices) #0 {
entry:
  %arrayidx1 = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 0
  %0 = load double* %arrayidx1, align 8, !tbaa !12
  %arrayidx3 = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 0
  %1 = load double* %arrayidx3, align 8, !tbaa !12
  %sub = fsub double %0, %1
  %mul = fmul double %sub, %sub
  %arrayidx10 = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 1
  %2 = load double* %arrayidx10, align 8, !tbaa !12
  %arrayidx12 = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 1
  %3 = load double* %arrayidx12, align 8, !tbaa !12
  %sub13 = fsub double %2, %3
  %mul19 = fmul double %sub13, %sub13
  %arrayidx21 = getelementptr inbounds [3 x double]* %vertices, i64 0, i64 2
  %4 = load double* %arrayidx21, align 8, !tbaa !12
  %arrayidx23 = getelementptr inbounds [3 x double]* %vertices, i64 1, i64 2
  %5 = load double* %arrayidx23, align 8, !tbaa !12
  %sub24 = fsub double %4, %5
  %mul30 = fmul double %sub24, %sub24
  %add = fadd double %mul, %mul19
  %add31 = fadd double %add, %mul30
  %call = tail call double @sqrt(double %add31) #1
  %arrayidx33 = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 0
  %6 = load double* %arrayidx33, align 8, !tbaa !12
  %7 = load double* %arrayidx3, align 8, !tbaa !12
  %sub36 = fsub double %6, %7
  %mul42 = fmul double %sub36, %sub36
  %arrayidx44 = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 1
  %8 = load double* %arrayidx44, align 8, !tbaa !12
  %9 = load double* %arrayidx12, align 8, !tbaa !12
  %sub47 = fsub double %8, %9
  %mul53 = fmul double %sub47, %sub47
  %arrayidx55 = getelementptr inbounds [3 x double]* %vertices, i64 2, i64 2
  %10 = load double* %arrayidx55, align 8, !tbaa !12
  %11 = load double* %arrayidx23, align 8, !tbaa !12
  %sub58 = fsub double %10, %11
  %mul64 = fmul double %sub58, %sub58
  %add65 = fadd double %mul42, %mul53
  %add66 = fadd double %add65, %mul64
  %call67 = tail call double @sqrt(double %add66) #1
  %12 = load double* %arrayidx1, align 8, !tbaa !12
  %13 = load double* %arrayidx33, align 8, !tbaa !12
  %sub72 = fsub double %12, %13
  %mul78 = fmul double %sub72, %sub72
  %14 = load double* %arrayidx10, align 8, !tbaa !12
  %15 = load double* %arrayidx44, align 8, !tbaa !12
  %sub83 = fsub double %14, %15
  %mul89 = fmul double %sub83, %sub83
  %16 = load double* %arrayidx21, align 8, !tbaa !12
  %17 = load double* %arrayidx55, align 8, !tbaa !12
  %sub94 = fsub double %16, %17
  %mul100 = fmul double %sub94, %sub94
  %add101 = fadd double %mul78, %mul89
  %add102 = fadd double %add101, %mul100
  %call103 = tail call double @sqrt(double %add102) #1
  %add104 = fadd double %call, %call67
  %add105 = fadd double %add104, %call103
  %div = fmul double %add105, 5.000000e-01
  %sub106 = fsub double %div, %call
  %mul107 = fmul double %div, %sub106
  %sub108 = fsub double %div, %call67
  %mul109 = fmul double %sub108, %mul107
  %sub110 = fsub double %div, %call103
  %mul111 = fmul double %sub110, %mul109
  %call112 = tail call double @sqrt(double %mul111) #1
  ret double %call112
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: noreturn nounwind uwtable
define void @arch_bail() #5 {
entry:
  tail call void @exit(i32 0) #9
  unreachable
}

; Function Attrs: nounwind uwtable
define void @arch_info() #0 {
entry:
  %putchar = tail call i32 @putchar(i32 10) #1
  %0 = load i8** @progname, align 8, !tbaa !1
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([69 x i8]* @.str21, i64 0, i64 0), i8* %0) #1
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str, i64 0, i64 0))
  %1 = load i8** @progname, align 8, !tbaa !1
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str23, i64 0, i64 0), i8* %1) #1
  %puts8 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str69, i64 0, i64 0))
  %puts9 = tail call i32 @puts(i8* getelementptr inbounds ([71 x i8]* @str70, i64 0, i64 0))
  %puts10 = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str71, i64 0, i64 0))
  %puts11 = tail call i32 @puts(i8* getelementptr inbounds ([37 x i8]* @str72, i64 0, i64 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @arch_parsecommandline(i32 %argc, i8** nocapture readonly %argv, %struct.options* nocapture %op) #0 {
entry:
  %quiet = getelementptr inbounds %struct.options* %op, i64 0, i32 0
  store i32 0, i32* %quiet, align 4, !tbaa !7
  %help = getelementptr inbounds %struct.options* %op, i64 0, i32 1
  store i32 0, i32* %help, align 4, !tbaa !31
  %cmp64 = icmp sgt i32 %argc, 1
  br i1 %cmp64, label %for.body, label %if.end45

for.body:                                         ; preds = %for.inc40, %entry
  %0 = phi i32 [ %7, %for.inc40 ], [ 0, %entry ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc40 ], [ 1, %entry ]
  %arrayidx = getelementptr inbounds i8** %argv, i64 %indvars.iv66
  %1 = load i8** %arrayidx, align 8, !tbaa !1
  %2 = load i8* %1, align 1, !tbaa !32
  %cmp2 = icmp eq i8 %2, 45
  br i1 %cmp2, label %for.cond4, label %for.inc40

for.cond4:                                        ; preds = %for.inc, %for.body
  %3 = phi i32 [ %6, %for.inc ], [ %0, %for.body ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %for.body ]
  %arrayidx8 = getelementptr inbounds i8* %1, i64 %indvars.iv
  %4 = load i8* %arrayidx8, align 1, !tbaa !32
  switch i8 %4, label %if.end [
    i8 0, label %for.inc40
    i8 81, label %if.then20
  ]

if.then20:                                        ; preds = %for.cond4
  store i32 1, i32* %quiet, align 4, !tbaa !7
  %.pre = load i8* %arrayidx8, align 1, !tbaa !32
  br label %if.end

if.end:                                           ; preds = %if.then20, %for.cond4
  %5 = phi i8 [ %4, %for.cond4 ], [ %.pre, %if.then20 ]
  switch i8 %5, label %for.inc [
    i8 104, label %if.then36
    i8 72, label %if.then36
  ]

if.then36:                                        ; preds = %if.end, %if.end
  store i32 1, i32* %help, align 4, !tbaa !31
  br label %for.inc

for.inc:                                          ; preds = %if.then36, %if.end
  %6 = phi i32 [ %3, %if.end ], [ 1, %if.then36 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond4

for.inc40:                                        ; preds = %for.cond4, %for.body
  %7 = phi i32 [ %0, %for.body ], [ %3, %for.cond4 ]
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next67 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %argc
  br i1 %exitcond, label %for.end42, label %for.body

for.end42:                                        ; preds = %for.inc40
  %tobool = icmp eq i32 %7, 0
  br i1 %tobool, label %if.end45, label %if.then44

if.then44:                                        ; preds = %for.end42
  %putchar.i = tail call i32 @putchar(i32 10) #1
  %8 = load i8** @progname, align 8, !tbaa !1
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([69 x i8]* @.str21, i64 0, i64 0), i8* %8) #1
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str, i64 0, i64 0)) #1
  %9 = load i8** @progname, align 8, !tbaa !1
  %call3.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str23, i64 0, i64 0), i8* %9) #1
  %puts8.i = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str69, i64 0, i64 0)) #1
  %puts9.i = tail call i32 @puts(i8* getelementptr inbounds ([71 x i8]* @str70, i64 0, i64 0)) #1
  %puts10.i = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str71, i64 0, i64 0)) #1
  %puts11.i = tail call i32 @puts(i8* getelementptr inbounds ([37 x i8]* @str72, i64 0, i64 0)) #1
  tail call void @exit(i32 0) #9
  unreachable

if.end45:                                         ; preds = %for.end42, %entry
  ret void
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #6

; Function Attrs: nounwind uwtable
define void @arch_readelemvector(double* %v, i32 %n) #0 {
entry:
  %type = alloca i32, align 4
  %attributes = alloca i32, align 4
  %0 = load %struct._IO_FILE** @packfile, align 8, !tbaa !1
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([7 x i8]* @.str28, i64 0, i64 0), i32* %type, i32* %attributes) #1
  %1 = load i32* %type, align 4, !tbaa !5
  %cmp = icmp eq i32 %1, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([38 x i8]* @.str32, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %2) #8
  call void @arch_bail()
  unreachable

if.end:                                           ; preds = %entry
  %4 = load i32* %attributes, align 4, !tbaa !5
  %cmp2 = icmp eq i32 %4, 1
  br i1 %cmp2, label %for.cond.preheader, label %if.then3

for.cond.preheader:                               ; preds = %if.end
  %cmp610 = icmp sgt i32 %n, 0
  br i1 %cmp610, label %for.body, label %for.end

if.then3:                                         ; preds = %if.end
  %5 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([49 x i8]* @.str33, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %5) #8
  call void @arch_bail()
  unreachable

for.body:                                         ; preds = %for.body, %for.cond.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.cond.preheader ]
  %7 = load %struct._IO_FILE** @packfile, align 8, !tbaa !1
  %arrayidx = getelementptr inbounds double* %v, i64 %indvars.iv
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8]* @.str31, i64 0, i64 0), double* %arrayidx) #1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %for.cond.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define void @arch_readdouble(double* %v) #0 {
entry:
  %type = alloca i32, align 4
  %attributes = alloca i32, align 4
  %0 = load %struct._IO_FILE** @packfile, align 8, !tbaa !1
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([7 x i8]* @.str28, i64 0, i64 0), i32* %type, i32* %attributes) #1
  %1 = load i32* %type, align 4, !tbaa !5
  %cmp = icmp eq i32 %1, 3
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([34 x i8]* @.str34, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %2) #8
  call void @arch_bail()
  unreachable

if.end:                                           ; preds = %entry
  %4 = load i32* %attributes, align 4, !tbaa !5
  %cmp2 = icmp eq i32 %4, 1
  br i1 %cmp2, label %if.end5, label %if.then3

if.then3:                                         ; preds = %if.end
  %5 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([45 x i8]* @.str35, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %5) #8
  call void @arch_bail()
  unreachable

if.end5:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE** @packfile, align 8, !tbaa !1
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8]* @.str31, i64 0, i64 0), double* %v) #1
  ret void
}

; Function Attrs: nounwind uwtable
define void @readpackfile(%struct._IO_FILE* %packfile, %struct.options* nocapture readonly %op) #0 {
entry:
  %newrow = alloca i32, align 4
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* @ARCHglobalnodes) #1
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* @ARCHmesh_dim) #1
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* @ARCHglobalelems) #1
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* @ARCHcorners) #1
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* @ARCHsubdomains) #1
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([4 x i8]* @.str31, i64 0, i64 0), double* @ARCHduration) #1
  %0 = load i32* @ARCHsubdomains, align 4, !tbaa !5
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %2 = load i8** @progname, align 8, !tbaa !1
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([52 x i8]* @.str37, i64 0, i64 0), i8* %2, i32 %0) #7
  call void @arch_bail()
  unreachable

if.end:                                           ; preds = %entry
  %quiet = getelementptr inbounds %struct.options* %op, i64 0, i32 0
  %3 = load i32* %quiet, align 4, !tbaa !7
  %tobool = icmp eq i32 %3, 0
  br i1 %tobool, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  %4 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %5 = load i8** @progname, align 8, !tbaa !1
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([20 x i8]* @.str38, i64 0, i64 0), i8* %5) #7
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([9 x i8]* @.str39, i64 0, i64 0), i32* @ARCHnodes, i32* @ARCHmine, i32* @ARCHpriv) #1
  %6 = load i32* @ARCHnodes, align 4, !tbaa !5
  %conv = sext i32 %6 to i64
  %mul = shl nsw i64 %conv, 2
  %call11 = call noalias i8* @malloc(i64 %mul) #1
  %7 = bitcast i8* %call11 to i32*
  store i32* %7, i32** @ARCHglobalnode, align 8, !tbaa !1
  %cmp12 = icmp eq i8* %call11, null
  br i1 %cmp12, label %if.then14, label %if.end17

if.then14:                                        ; preds = %if.end9
  %8 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([34 x i8]* @.str40, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %8) #8
  %10 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call16 = call i32 @fflush(%struct._IO_FILE* %10) #1
  call void @exit(i32 0) #9
  unreachable

if.end17:                                         ; preds = %if.end9
  %mul19 = shl nsw i64 %conv, 3
  %call20 = call noalias i8* @malloc(i64 %mul19) #1
  %11 = bitcast i8* %call20 to double**
  store double** %11, double*** @ARCHcoord, align 8, !tbaa !1
  %cmp21219 = icmp sgt i32 %6, 0
  br i1 %cmp21219, label %for.body, label %for.end45

for.cond24.preheader:                             ; preds = %for.body
  br i1 %cmp21219, label %for.body27, label %for.end45

for.body:                                         ; preds = %for.body.for.body_crit_edge, %if.end17
  %12 = phi double** [ %.pre241, %for.body.for.body_crit_edge ], [ %11, %if.end17 ]
  %indvars.iv237 = phi i64 [ %indvars.iv.next238, %for.body.for.body_crit_edge ], [ 0, %if.end17 ]
  %call23 = call noalias i8* @malloc(i64 24) #1
  %13 = bitcast i8* %call23 to double*
  %arrayidx = getelementptr inbounds double** %12, i64 %indvars.iv237
  store double* %13, double** %arrayidx, align 8, !tbaa !1
  %indvars.iv.next238 = add nuw nsw i64 %indvars.iv237, 1
  %14 = trunc i64 %indvars.iv.next238 to i32
  %cmp21 = icmp slt i32 %14, %6
  br i1 %cmp21, label %for.body.for.body_crit_edge, label %for.cond24.preheader

for.body.for.body_crit_edge:                      ; preds = %for.body
  %.pre241 = load double*** @ARCHcoord, align 8, !tbaa !1
  br label %for.body

for.body27:                                       ; preds = %for.inc43, %for.cond24.preheader
  %indvars.iv235 = phi i64 [ %indvars.iv.next236, %for.inc43 ], [ 0, %for.cond24.preheader ]
  %15 = load i32** @ARCHglobalnode, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i32* %15, i64 %indvars.iv235
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* %arrayidx29) #1
  %16 = load i32* @ARCHmesh_dim, align 4, !tbaa !5
  %cmp32215 = icmp sgt i32 %16, 0
  br i1 %cmp32215, label %for.body34, label %for.inc43

for.body34:                                       ; preds = %for.body34, %for.body27
  %indvars.iv233 = phi i64 [ %indvars.iv.next234, %for.body34 ], [ 0, %for.body27 ]
  %17 = load double*** @ARCHcoord, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds double** %17, i64 %indvars.iv235
  %18 = load double** %arrayidx37, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds double* %18, i64 %indvars.iv233
  %call39 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([4 x i8]* @.str31, i64 0, i64 0), double* %arrayidx38) #1
  %indvars.iv.next234 = add nuw nsw i64 %indvars.iv233, 1
  %19 = load i32* @ARCHmesh_dim, align 4, !tbaa !5
  %20 = trunc i64 %indvars.iv.next234 to i32
  %cmp32 = icmp slt i32 %20, %19
  br i1 %cmp32, label %for.body34, label %for.inc43

for.inc43:                                        ; preds = %for.body34, %for.body27
  %indvars.iv.next236 = add nuw nsw i64 %indvars.iv235, 1
  %21 = load i32* @ARCHnodes, align 4, !tbaa !5
  %22 = trunc i64 %indvars.iv.next236 to i32
  %cmp25 = icmp slt i32 %22, %21
  br i1 %cmp25, label %for.body27, label %for.end45

for.end45:                                        ; preds = %for.inc43, %for.cond24.preheader, %if.end17
  %23 = load i32* %quiet, align 4, !tbaa !7
  %tobool47 = icmp eq i32 %23, 0
  br i1 %tobool47, label %if.then48, label %if.end50

if.then48:                                        ; preds = %for.end45
  %24 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %25 = load i8** @progname, align 8, !tbaa !1
  %call49 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([23 x i8]* @.str41, i64 0, i64 0), i8* %25) #7
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %for.end45
  %call51 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* @ARCHelems) #1
  %26 = load i32* @ARCHelems, align 4, !tbaa !5
  %conv52 = sext i32 %26 to i64
  %mul53 = shl nsw i64 %conv52, 2
  %call54 = call noalias i8* @malloc(i64 %mul53) #1
  %27 = bitcast i8* %call54 to i32*
  store i32* %27, i32** @ARCHglobalelem, align 8, !tbaa !1
  %cmp55 = icmp eq i8* %call54, null
  br i1 %cmp55, label %if.then57, label %if.end60

if.then57:                                        ; preds = %if.end50
  %28 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %29 = call i64 @fwrite(i8* getelementptr inbounds ([34 x i8]* @.str42, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %28) #8
  %30 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call59 = call i32 @fflush(%struct._IO_FILE* %30) #1
  call void @exit(i32 0) #9
  unreachable

if.end60:                                         ; preds = %if.end50
  %mul62 = shl nsw i64 %conv52, 3
  %call63 = call noalias i8* @malloc(i64 %mul62) #1
  %31 = bitcast i8* %call63 to i32**
  store i32** %31, i32*** @ARCHvertex, align 8, !tbaa !1
  %cmp65213 = icmp sgt i32 %26, 0
  br i1 %cmp65213, label %for.body67, label %for.end95

for.cond74.preheader:                             ; preds = %for.body67
  br i1 %cmp65213, label %for.body77, label %for.end95

for.body67:                                       ; preds = %for.body67.for.body67_crit_edge, %if.end60
  %32 = phi i32** [ %.pre240, %for.body67.for.body67_crit_edge ], [ %31, %if.end60 ]
  %indvars.iv231 = phi i64 [ %indvars.iv.next232, %for.body67.for.body67_crit_edge ], [ 0, %if.end60 ]
  %call68 = call noalias i8* @malloc(i64 16) #1
  %33 = bitcast i8* %call68 to i32*
  %arrayidx70 = getelementptr inbounds i32** %32, i64 %indvars.iv231
  store i32* %33, i32** %arrayidx70, align 8, !tbaa !1
  %indvars.iv.next232 = add nuw nsw i64 %indvars.iv231, 1
  %34 = trunc i64 %indvars.iv.next232 to i32
  %cmp65 = icmp slt i32 %34, %26
  br i1 %cmp65, label %for.body67.for.body67_crit_edge, label %for.cond74.preheader

for.body67.for.body67_crit_edge:                  ; preds = %for.body67
  %.pre240 = load i32*** @ARCHvertex, align 8, !tbaa !1
  br label %for.body67

for.body77:                                       ; preds = %for.inc93, %for.cond74.preheader
  %indvars.iv229 = phi i64 [ %indvars.iv.next230, %for.inc93 ], [ 0, %for.cond74.preheader ]
  %35 = load i32** @ARCHglobalelem, align 8, !tbaa !1
  %arrayidx79 = getelementptr inbounds i32* %35, i64 %indvars.iv229
  %call80 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* %arrayidx79) #1
  %36 = load i32* @ARCHcorners, align 4, !tbaa !5
  %cmp82209 = icmp sgt i32 %36, 0
  br i1 %cmp82209, label %for.body84, label %for.inc93

for.body84:                                       ; preds = %for.body84, %for.body77
  %indvars.iv227 = phi i64 [ %indvars.iv.next228, %for.body84 ], [ 0, %for.body77 ]
  %37 = load i32*** @ARCHvertex, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i32** %37, i64 %indvars.iv229
  %38 = load i32** %arrayidx87, align 8, !tbaa !1
  %arrayidx88 = getelementptr inbounds i32* %38, i64 %indvars.iv227
  %call89 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* %arrayidx88) #1
  %indvars.iv.next228 = add nuw nsw i64 %indvars.iv227, 1
  %39 = load i32* @ARCHcorners, align 4, !tbaa !5
  %40 = trunc i64 %indvars.iv.next228 to i32
  %cmp82 = icmp slt i32 %40, %39
  br i1 %cmp82, label %for.body84, label %for.inc93

for.inc93:                                        ; preds = %for.body84, %for.body77
  %indvars.iv.next230 = add nuw nsw i64 %indvars.iv229, 1
  %41 = load i32* @ARCHelems, align 4, !tbaa !5
  %42 = trunc i64 %indvars.iv.next230 to i32
  %cmp75 = icmp slt i32 %42, %41
  br i1 %cmp75, label %for.body77, label %for.end95

for.end95:                                        ; preds = %for.inc93, %for.cond74.preheader, %if.end60
  %43 = load i32* %quiet, align 4, !tbaa !7
  %tobool97 = icmp eq i32 %43, 0
  br i1 %tobool97, label %if.then98, label %if.end100

if.then98:                                        ; preds = %for.end95
  %44 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %45 = load i8** @progname, align 8, !tbaa !1
  %call99 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([38 x i8]* @.str43, i64 0, i64 0), i8* %45) #7
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %for.end95
  %call101 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([6 x i8]* @.str44, i64 0, i64 0), i32* @ARCHmatrixlen, i32* @ARCHcholeskylen) #1
  %46 = load i32* @ARCHmatrixlen, align 4, !tbaa !5
  %add = add nsw i32 %46, 1
  %conv102 = sext i32 %add to i64
  %mul103 = shl nsw i64 %conv102, 2
  %call104 = call noalias i8* @malloc(i64 %mul103) #1
  %47 = bitcast i8* %call104 to i32*
  store i32* %47, i32** @ARCHmatrixcol, align 8, !tbaa !1
  %cmp105 = icmp eq i8* %call104, null
  br i1 %cmp105, label %if.then107, label %if.end110

if.then107:                                       ; preds = %if.end100
  %48 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %49 = call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str45, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %48) #8
  %50 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call109 = call i32 @fflush(%struct._IO_FILE* %50) #1
  call void @exit(i32 0) #9
  unreachable

if.end110:                                        ; preds = %if.end100
  %51 = load i32* @ARCHnodes, align 4, !tbaa !5
  %add111 = add nsw i32 %51, 1
  %conv112 = sext i32 %add111 to i64
  %mul113 = shl nsw i64 %conv112, 2
  %call114 = call noalias i8* @malloc(i64 %mul113) #1
  %52 = bitcast i8* %call114 to i32*
  store i32* %52, i32** @ARCHmatrixindex, align 8, !tbaa !1
  %cmp115 = icmp eq i8* %call114, null
  br i1 %cmp115, label %if.then117, label %for.cond121.preheader

for.cond121.preheader:                            ; preds = %if.end110
  %cmp122205 = icmp sgt i32 %46, 0
  br i1 %cmp122205, label %for.body124, label %while.cond146.preheader

if.then117:                                       ; preds = %if.end110
  %53 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %54 = call i64 @fwrite(i8* getelementptr inbounds ([35 x i8]* @.str46, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %53) #8
  %55 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %call119 = call i32 @fflush(%struct._IO_FILE* %55) #1
  call void @exit(i32 0) #9
  unreachable

for.cond121.while.cond146.preheader_crit_edge:    ; preds = %for.inc143
  %.pre = load i32* @ARCHnodes, align 4, !tbaa !5
  br label %while.cond146.preheader

while.cond146.preheader:                          ; preds = %for.cond121.while.cond146.preheader_crit_edge, %for.cond121.preheader
  %56 = phi i32 [ %69, %for.cond121.while.cond146.preheader_crit_edge ], [ %46, %for.cond121.preheader ]
  %57 = phi i32 [ %.pre, %for.cond121.while.cond146.preheader_crit_edge ], [ %51, %for.cond121.preheader ]
  %oldrow.0.lcssa = phi i32 [ %oldrow.1.lcssa, %for.cond121.while.cond146.preheader_crit_edge ], [ -1, %for.cond121.preheader ]
  %cmp147199 = icmp slt i32 %oldrow.0.lcssa, %57
  br i1 %cmp147199, label %while.body149.lr.ph, label %while.end153

while.body149.lr.ph:                              ; preds = %while.cond146.preheader
  %58 = load i32** @ARCHmatrixindex, align 8, !tbaa !1
  %59 = sext i32 %oldrow.0.lcssa to i64
  br label %while.body149

for.body124:                                      ; preds = %for.inc143, %for.cond121.preheader
  %indvars.iv225 = phi i64 [ %indvars.iv.next226, %for.inc143 ], [ 0, %for.cond121.preheader ]
  %oldrow.0206 = phi i32 [ %oldrow.1.lcssa, %for.inc143 ], [ -1, %for.cond121.preheader ]
  %call125 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* %newrow) #1
  %60 = load i32** @ARCHmatrixcol, align 8, !tbaa !1
  %arrayidx127 = getelementptr inbounds i32* %60, i64 %indvars.iv225
  %call128 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([3 x i8]* @.str36, i64 0, i64 0), i32* %arrayidx127) #1
  %61 = load i32* %newrow, align 4, !tbaa !5
  %cmp129202 = icmp slt i32 %oldrow.0206, %61
  br i1 %cmp129202, label %while.body.lr.ph, label %for.inc143

while.body.lr.ph:                                 ; preds = %for.body124
  %62 = load i32** @ARCHmatrixindex, align 8, !tbaa !1
  %63 = sext i32 %oldrow.0206 to i64
  br label %while.body

while.body:                                       ; preds = %if.end139, %while.body.lr.ph
  %indvars.iv223 = phi i64 [ %63, %while.body.lr.ph ], [ %indvars.iv.next224, %if.end139 ]
  %oldrow.1203 = phi i32 [ %oldrow.0206, %while.body.lr.ph ], [ %add131, %if.end139 ]
  %indvars.iv.next224 = add nsw i64 %indvars.iv223, 1
  %add131 = add nsw i32 %oldrow.1203, 1
  %64 = load i32* @ARCHnodes, align 4, !tbaa !5
  %add132 = add nsw i32 %64, 1
  %65 = trunc i64 %indvars.iv.next224 to i32
  %cmp133 = icmp slt i32 %65, %add132
  br i1 %cmp133, label %if.end139, label %if.then135

if.then135:                                       ; preds = %while.body
  %66 = load i8** @progname, align 8, !tbaa !1
  %call138 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str47, i64 0, i64 0), i8* %66, i32 %add131, i32 %add132) #1
  call void @arch_bail()
  unreachable

if.end139:                                        ; preds = %while.body
  %arrayidx142 = getelementptr inbounds i32* %62, i64 %indvars.iv.next224
  %67 = trunc i64 %indvars.iv225 to i32
  store i32 %67, i32* %arrayidx142, align 4, !tbaa !5
  %68 = load i32* %newrow, align 4, !tbaa !5
  %cmp129 = icmp slt i32 %65, %68
  br i1 %cmp129, label %while.body, label %for.inc143

for.inc143:                                       ; preds = %if.end139, %for.body124
  %oldrow.1.lcssa = phi i32 [ %oldrow.0206, %for.body124 ], [ %add131, %if.end139 ]
  %indvars.iv.next226 = add nuw nsw i64 %indvars.iv225, 1
  %69 = load i32* @ARCHmatrixlen, align 4, !tbaa !5
  %70 = trunc i64 %indvars.iv.next226 to i32
  %cmp122 = icmp slt i32 %70, %69
  br i1 %cmp122, label %for.body124, label %for.cond121.while.cond146.preheader_crit_edge

while.body149:                                    ; preds = %while.body149.while.body149_crit_edge, %while.body149.lr.ph
  %71 = phi i32 [ %56, %while.body149.lr.ph ], [ %.pre239, %while.body149.while.body149_crit_edge ]
  %indvars.iv = phi i64 [ %59, %while.body149.lr.ph ], [ %indvars.iv.next, %while.body149.while.body149_crit_edge ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %arrayidx152 = getelementptr inbounds i32* %58, i64 %indvars.iv.next
  store i32 %71, i32* %arrayidx152, align 4, !tbaa !5
  %72 = load i32* @ARCHnodes, align 4, !tbaa !5
  %73 = trunc i64 %indvars.iv.next to i32
  %cmp147 = icmp slt i32 %73, %72
  br i1 %cmp147, label %while.body149.while.body149_crit_edge, label %while.end153

while.body149.while.body149_crit_edge:            ; preds = %while.body149
  %.pre239 = load i32* @ARCHmatrixlen, align 4, !tbaa !5
  br label %while.body149

while.end153:                                     ; preds = %while.body149, %while.cond146.preheader
  %call154 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %packfile, i8* getelementptr inbounds ([6 x i8]* @.str44, i64 0, i64 0), i32* %temp1, i32* %temp2) #1
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @smvp_opt(i32 %nodes, double*** nocapture readonly %A, i32* nocapture readonly %Acol, i32* nocapture readonly %Aindex, double** nocapture readonly %v, double** nocapture readonly %w) #0 {
entry:
  %cmp346 = icmp sgt i32 %nodes, 0
  br i1 %cmp346, label %for.body, label %for.end201

for.cond8.preheader:                              ; preds = %for.body
  br i1 %cmp346, label %for.body10.lr.ph, label %for.end201

for.body10.lr.ph:                                 ; preds = %for.cond8.preheader
  %.pre = load i32* %Aindex, align 4, !tbaa !5
  br label %for.body10

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv352 = phi i64 [ %indvars.iv.next353, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double** %w, i64 %indvars.iv352
  %0 = load double** %arrayidx, align 8, !tbaa !1
  %indvars.iv.next353 = add nuw nsw i64 %indvars.iv352, 1
  %lftr.wideiv354 = trunc i64 %indvars.iv.next353 to i32
  %exitcond355 = icmp eq i32 %lftr.wideiv354, %nodes
  %1 = bitcast double* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 24, i32 8, i1 false)
  br i1 %exitcond355, label %for.cond8.preheader, label %for.body

for.body10:                                       ; preds = %while.end, %for.body10.lr.ph
  %2 = phi i32 [ %.pre, %for.body10.lr.ph ], [ %7, %while.end ]
  %indvars.iv349 = phi i64 [ 0, %for.body10.lr.ph ], [ %indvars.iv.next350, %while.end ]
  %arrayidx12 = getelementptr inbounds double** %v, i64 %indvars.iv349
  %3 = load double** %arrayidx12, align 8, !tbaa !1
  %4 = load double* %3, align 8, !tbaa !12
  %arrayidx16 = getelementptr inbounds double* %3, i64 1
  %5 = load double* %arrayidx16, align 8, !tbaa !12
  %arrayidx19 = getelementptr inbounds double* %3, i64 2
  %6 = load double* %arrayidx19, align 8, !tbaa !12
  %indvars.iv.next350 = add nuw nsw i64 %indvars.iv349, 1
  %arrayidx23 = getelementptr inbounds i32* %Aindex, i64 %indvars.iv.next350
  %7 = load i32* %arrayidx23, align 4, !tbaa !5
  %arrayidx25 = getelementptr inbounds double** %w, i64 %indvars.iv349
  %8 = load double** %arrayidx25, align 8, !tbaa !1
  %9 = load double* %8, align 8, !tbaa !12
  %idxprom27 = sext i32 %2 to i64
  %arrayidx28 = getelementptr inbounds double*** %A, i64 %idxprom27
  %10 = load double*** %arrayidx28, align 8, !tbaa !1
  %11 = load double** %10, align 8, !tbaa !1
  %12 = load double* %11, align 8, !tbaa !12
  %mul = fmul double %4, %12
  %add31 = fadd double %9, %mul
  %arrayidx35 = getelementptr inbounds double* %11, i64 1
  %13 = load double* %arrayidx35, align 8, !tbaa !12
  %mul36 = fmul double %5, %13
  %add37 = fadd double %add31, %mul36
  %arrayidx41 = getelementptr inbounds double* %11, i64 2
  %14 = load double* %arrayidx41, align 8, !tbaa !12
  %mul42 = fmul double %6, %14
  %add43 = fadd double %add37, %mul42
  %arrayidx46 = getelementptr inbounds double* %8, i64 1
  %15 = load double* %arrayidx46, align 8, !tbaa !12
  %arrayidx49 = getelementptr inbounds double** %10, i64 1
  %16 = load double** %arrayidx49, align 8, !tbaa !1
  %17 = load double* %16, align 8, !tbaa !12
  %mul51 = fmul double %4, %17
  %add52 = fadd double %15, %mul51
  %arrayidx56 = getelementptr inbounds double* %16, i64 1
  %18 = load double* %arrayidx56, align 8, !tbaa !12
  %mul57 = fmul double %5, %18
  %add58 = fadd double %add52, %mul57
  %arrayidx62 = getelementptr inbounds double* %16, i64 2
  %19 = load double* %arrayidx62, align 8, !tbaa !12
  %mul63 = fmul double %6, %19
  %add64 = fadd double %add58, %mul63
  %arrayidx67 = getelementptr inbounds double* %8, i64 2
  %20 = load double* %arrayidx67, align 8, !tbaa !12
  %arrayidx70 = getelementptr inbounds double** %10, i64 2
  %21 = load double** %arrayidx70, align 8, !tbaa !1
  %22 = load double* %21, align 8, !tbaa !12
  %mul72 = fmul double %4, %22
  %add73 = fadd double %20, %mul72
  %arrayidx77 = getelementptr inbounds double* %21, i64 1
  %23 = load double* %arrayidx77, align 8, !tbaa !12
  %mul78 = fmul double %5, %23
  %add79 = fadd double %add73, %mul78
  %arrayidx83 = getelementptr inbounds double* %21, i64 2
  %24 = load double* %arrayidx83, align 8, !tbaa !12
  %mul84 = fmul double %6, %24
  %add85 = fadd double %add79, %mul84
  %Anext.0336 = add i32 %2, 1
  %cmp87337 = icmp slt i32 %Anext.0336, %7
  br i1 %cmp87337, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %for.body10
  %25 = sext i32 %Anext.0336 to i64
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %indvars.iv = phi i64 [ %25, %while.body.lr.ph ], [ %indvars.iv.next, %while.body ]
  %Anext.0341 = phi i32 [ %Anext.0336, %while.body.lr.ph ], [ %Anext.0, %while.body ]
  %sum0.0340 = phi double [ %add43, %while.body.lr.ph ], [ %add126, %while.body ]
  %sum1.0339 = phi double [ %add64, %while.body.lr.ph ], [ %add153, %while.body ]
  %sum2.0338 = phi double [ %add85, %while.body.lr.ph ], [ %add183, %while.body ]
  %arrayidx89 = getelementptr inbounds i32* %Acol, i64 %indvars.iv
  %26 = load i32* %arrayidx89, align 4, !tbaa !5
  %idxprom90 = sext i32 %26 to i64
  %arrayidx91 = getelementptr inbounds double** %v, i64 %idxprom90
  %27 = load double** %arrayidx91, align 8, !tbaa !1
  %28 = load double* %27, align 8, !tbaa !12
  %arrayidx95 = getelementptr inbounds double* %27, i64 1
  %29 = load double* %arrayidx95, align 8, !tbaa !12
  %arrayidx98 = getelementptr inbounds double* %27, i64 2
  %30 = load double* %arrayidx98, align 8, !tbaa !12
  %arrayidx100 = getelementptr inbounds double*** %A, i64 %indvars.iv
  %31 = load double*** %arrayidx100, align 8, !tbaa !1
  %32 = load double** %31, align 8, !tbaa !1
  %33 = load double* %32, align 8, !tbaa !12
  %mul103 = fmul double %28, %33
  %add104 = fadd double %sum0.0340, %mul103
  %arrayidx106 = getelementptr inbounds double** %w, i64 %idxprom90
  %34 = load double** %arrayidx106, align 8, !tbaa !1
  %35 = load double* %34, align 8, !tbaa !12
  %mul108 = fmul double %4, %33
  %add109 = fadd double %mul108, %35
  %arrayidx113 = getelementptr inbounds double* %32, i64 1
  %36 = load double* %arrayidx113, align 8, !tbaa !12
  %mul114 = fmul double %29, %36
  %add115 = fadd double %add104, %mul114
  %arrayidx118 = getelementptr inbounds double* %34, i64 1
  %37 = load double* %arrayidx118, align 8, !tbaa !12
  %mul119 = fmul double %4, %36
  %add120 = fadd double %37, %mul119
  %arrayidx124 = getelementptr inbounds double* %32, i64 2
  %38 = load double* %arrayidx124, align 8, !tbaa !12
  %mul125 = fmul double %30, %38
  %add126 = fadd double %add115, %mul125
  %arrayidx129 = getelementptr inbounds double* %34, i64 2
  %39 = load double* %arrayidx129, align 8, !tbaa !12
  %mul130 = fmul double %4, %38
  %add131 = fadd double %39, %mul130
  %arrayidx134 = getelementptr inbounds double** %31, i64 1
  %40 = load double** %arrayidx134, align 8, !tbaa !1
  %41 = load double* %40, align 8, !tbaa !12
  %mul136 = fmul double %28, %41
  %add137 = fadd double %sum1.0339, %mul136
  %mul138 = fmul double %5, %41
  %add139 = fadd double %add109, %mul138
  %arrayidx143 = getelementptr inbounds double* %40, i64 1
  %42 = load double* %arrayidx143, align 8, !tbaa !12
  %mul144 = fmul double %29, %42
  %add145 = fadd double %add137, %mul144
  %mul146 = fmul double %5, %42
  %add147 = fadd double %add120, %mul146
  %arrayidx151 = getelementptr inbounds double* %40, i64 2
  %43 = load double* %arrayidx151, align 8, !tbaa !12
  %mul152 = fmul double %30, %43
  %add153 = fadd double %add145, %mul152
  %mul154 = fmul double %5, %43
  %add155 = fadd double %add131, %mul154
  %arrayidx158 = getelementptr inbounds double** %31, i64 2
  %44 = load double** %arrayidx158, align 8, !tbaa !1
  %45 = load double* %44, align 8, !tbaa !12
  %mul160 = fmul double %28, %45
  %add161 = fadd double %sum2.0338, %mul160
  %mul162 = fmul double %6, %45
  %add163 = fadd double %add139, %mul162
  store double %add163, double* %34, align 8, !tbaa !12
  %arrayidx170 = getelementptr inbounds double* %44, i64 1
  %46 = load double* %arrayidx170, align 8, !tbaa !12
  %mul171 = fmul double %29, %46
  %add172 = fadd double %add161, %mul171
  %mul173 = fmul double %6, %46
  %add174 = fadd double %add147, %mul173
  store double %add174, double* %arrayidx118, align 8, !tbaa !12
  %arrayidx181 = getelementptr inbounds double* %44, i64 2
  %47 = load double* %arrayidx181, align 8, !tbaa !12
  %mul182 = fmul double %30, %47
  %add183 = fadd double %add172, %mul182
  %mul184 = fmul double %6, %47
  %add185 = fadd double %add155, %mul184
  store double %add185, double* %arrayidx129, align 8, !tbaa !12
  %Anext.0 = add nsw i32 %Anext.0341, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i32 %Anext.0, %7
  br i1 %exitcond, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %for.body10
  %sum0.0.lcssa = phi double [ %add43, %for.body10 ], [ %add126, %while.body ]
  %sum1.0.lcssa = phi double [ %add64, %for.body10 ], [ %add153, %while.body ]
  %sum2.0.lcssa = phi double [ %add85, %for.body10 ], [ %add183, %while.body ]
  store double %sum0.0.lcssa, double* %8, align 8, !tbaa !12
  store double %sum1.0.lcssa, double* %arrayidx46, align 8, !tbaa !12
  store double %sum2.0.lcssa, double* %arrayidx67, align 8, !tbaa !12
  %lftr.wideiv = trunc i64 %indvars.iv.next350 to i32
  %exitcond351 = icmp eq i32 %lftr.wideiv, %nodes
  br i1 %exitcond351, label %for.end201, label %for.body10

for.end201:                                       ; preds = %while.end, %for.cond8.preheader, %entry
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @putchar(i32) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { cold nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"any pointer", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"int", metadata !3, i64 0}
!7 = metadata !{metadata !8, metadata !6, i64 0}
!8 = metadata !{metadata !"options", metadata !6, i64 0, metadata !6, i64 4}
!9 = metadata !{metadata !10, metadata !11, i64 0}
!10 = metadata !{metadata !"excitation", metadata !11, i64 0, metadata !11, i64 8, metadata !11, i64 16}
!11 = metadata !{metadata !"double", metadata !3, i64 0}
!12 = metadata !{metadata !11, metadata !11, i64 0}
!13 = metadata !{metadata !10, metadata !11, i64 8}
!14 = metadata !{metadata !10, metadata !11, i64 16}
!15 = metadata !{metadata !16, metadata !11, i64 0}
!16 = metadata !{metadata !"damping", metadata !11, i64 0, metadata !11, i64 8, metadata !11, i64 16, metadata !11, i64 24}
!17 = metadata !{metadata !16, metadata !11, i64 8}
!18 = metadata !{metadata !16, metadata !11, i64 16}
!19 = metadata !{metadata !16, metadata !11, i64 24}
!20 = metadata !{metadata !21, metadata !11, i64 8}
!21 = metadata !{metadata !"source", metadata !11, i64 0, metadata !11, i64 8, metadata !11, i64 16, metadata !11, i64 24, metadata !3, i64 32, metadata !3, i64 56, metadata !6, i64 80, metadata !6, i64 84}
!22 = metadata !{metadata !21, metadata !11, i64 0}
!23 = metadata !{metadata !21, metadata !11, i64 16}
!24 = metadata !{metadata !21, metadata !11, i64 24}
!25 = metadata !{metadata !21, metadata !6, i64 80}
!26 = metadata !{metadata !21, metadata !6, i64 84}
!27 = metadata !{metadata !28, metadata !11, i64 0}
!28 = metadata !{metadata !"properties", metadata !11, i64 0, metadata !11, i64 8, metadata !11, i64 16}
!29 = metadata !{metadata !28, metadata !11, i64 8}
!30 = metadata !{metadata !28, metadata !11, i64 16}
!31 = metadata !{metadata !8, metadata !6, i64 4}
!32 = metadata !{metadata !3, metadata !3, i64 0}
