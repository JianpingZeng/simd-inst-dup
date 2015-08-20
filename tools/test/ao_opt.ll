; ModuleID = 'ao_opt.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._Sphere = type { %struct._vec, double }
%struct._vec = type { double, double, double }
%struct._Plane = type { %struct._vec, %struct._vec }
%struct._Isect = type { double, %struct._vec, %struct._vec, i32 }
%struct._Ray = type { %struct._vec, %struct._vec }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timespec = type { i64, i64 }

@spheres = common global [3 x %struct._Sphere] zeroinitializer, align 16
@plane = common global %struct._Plane zeroinitializer, align 8
@.str = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"fp\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"ao.c\00", align 1
@__PRETTY_FUNCTION__.saveppm = private unnamed_addr constant [54 x i8] c"void saveppm(const char *, int, int, unsigned char *)\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"P6\0A\00", align 1
@.str4 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str5 = private unnamed_addr constant [5 x i8] c"255\0A\00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"ao.ppm\00", align 1
@.str7 = private unnamed_addr constant [42 x i8] c"The total CPU time is %lld microseconds.\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @ray_sphere_intersect(%struct._Isect* nocapture %isect, %struct._Ray* nocapture readonly %ray, %struct._Sphere* nocapture readonly %sphere) #0 {
entry:
  %x = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 0, i32 0
  %0 = load double* %x, align 8, !tbaa !1
  %x1 = getelementptr inbounds %struct._Sphere* %sphere, i64 0, i32 0, i32 0
  %1 = load double* %x1, align 8, !tbaa !7
  %sub = fsub double %0, %1
  %y = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 0, i32 1
  %2 = load double* %y, align 8, !tbaa !9
  %y5 = getelementptr inbounds %struct._Sphere* %sphere, i64 0, i32 0, i32 1
  %3 = load double* %y5, align 8, !tbaa !10
  %sub6 = fsub double %2, %3
  %z = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 0, i32 2
  %4 = load double* %z, align 8, !tbaa !11
  %z10 = getelementptr inbounds %struct._Sphere* %sphere, i64 0, i32 0, i32 2
  %5 = load double* %z10, align 8, !tbaa !12
  %sub11 = fsub double %4, %5
  %dir.0 = getelementptr %struct._Ray* %ray, i64 0, i32 1, i32 0
  %dir.0.val = load double* %dir.0, align 8
  %dir.1 = getelementptr %struct._Ray* %ray, i64 0, i32 1, i32 1
  %dir.1.val = load double* %dir.1, align 8
  %dir.2 = getelementptr %struct._Ray* %ray, i64 0, i32 1, i32 2
  %dir.2.val = load double* %dir.2, align 8
  %mul.i = fmul double %sub, %dir.0.val
  %mul3.i = fmul double %sub6, %dir.1.val
  %add.i = fadd double %mul.i, %mul3.i
  %mul5.i = fmul double %sub11, %dir.2.val
  %add6.i = fadd double %add.i, %mul5.i
  %mul.i112 = fmul double %sub, %sub
  %mul3.i113 = fmul double %sub6, %sub6
  %add.i114 = fadd double %mul.i112, %mul3.i113
  %mul5.i115 = fmul double %sub11, %sub11
  %add6.i116 = fadd double %add.i114, %mul5.i115
  %radius = getelementptr inbounds %struct._Sphere* %sphere, i64 0, i32 1
  %6 = load double* %radius, align 8, !tbaa !13
  %mul = fmul double %6, %6
  %sub15 = fsub double %add6.i116, %mul
  %mul16 = fmul double %add6.i, %add6.i
  %sub17 = fsub double %mul16, %sub15
  %cmp = fcmp ogt double %sub17, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end69

if.then:                                          ; preds = %entry
  %sub18 = fsub double -0.000000e+00, %add6.i
  %call19 = tail call double @sqrt(double %sub17) #3
  %sub20 = fsub double %sub18, %call19
  %cmp21 = fcmp ogt double %sub20, 0.000000e+00
  br i1 %cmp21, label %land.lhs.true, label %if.end69

land.lhs.true:                                    ; preds = %if.then
  %t22 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 0
  %7 = load double* %t22, align 8, !tbaa !14
  %cmp23 = fcmp olt double %sub20, %7
  br i1 %cmp23, label %if.then24, label %if.end69

if.then24:                                        ; preds = %land.lhs.true
  store double %sub20, double* %t22, align 8, !tbaa !14
  %hit = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 3
  store i32 1, i32* %hit, align 4, !tbaa !17
  %x31 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  %8 = bitcast %struct._Ray* %ray to <2 x double>*
  %9 = load <2 x double>* %8, align 8, !tbaa !18
  %10 = bitcast double* %dir.0 to <2 x double>*
  %11 = load <2 x double>* %10, align 8, !tbaa !18
  %12 = insertelement <2 x double> undef, double %sub20, i32 0
  %13 = insertelement <2 x double> %12, double %sub20, i32 1
  %14 = fmul <2 x double> %13, %11
  %15 = fadd <2 x double> %9, %14
  %16 = bitcast double* %x31 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8, !tbaa !18
  %17 = load double* %z, align 8, !tbaa !11
  %18 = load double* %dir.2, align 8, !tbaa !19
  %mul44 = fmul double %sub20, %18
  %add45 = fadd double %17, %mul44
  %z47 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  store double %add45, double* %z47, align 8, !tbaa !20
  %x53 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 0
  %19 = bitcast %struct._Sphere* %sphere to <2 x double>*
  %20 = load <2 x double>* %19, align 8, !tbaa !18
  %21 = fsub <2 x double> %15, %20
  %22 = bitcast double* %x53 to <2 x double>*
  store <2 x double> %21, <2 x double>* %22, align 8, !tbaa !18
  %23 = load double* %z10, align 8, !tbaa !12
  %sub65 = fsub double %add45, %23
  %z67 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 2
  store double %sub65, double* %z67, align 8, !tbaa !21
  %24 = extractelement <2 x double> %21, i32 0
  %mul.i.i = fmul double %24, %24
  %25 = extractelement <2 x double> %21, i32 1
  %mul3.i.i = fmul double %25, %25
  %add.i.i = fadd double %mul.i.i, %mul3.i.i
  %mul5.i.i = fmul double %sub65, %sub65
  %add6.i.i = fadd double %mul5.i.i, %add.i.i
  %call1.i = tail call double @sqrt(double %add6.i.i) #3
  %call2.i = tail call double @fabs(double %call1.i) #6
  %cmp.i = fcmp ogt double %call2.i, 1.000000e-17
  br i1 %cmp.i, label %if.then.i, label %if.end69

if.then.i:                                        ; preds = %if.then24
  %26 = bitcast double* %x53 to <2 x double>*
  %27 = load <2 x double>* %26, align 8, !tbaa !18
  %28 = insertelement <2 x double> undef, double %call1.i, i32 0
  %29 = insertelement <2 x double> %28, double %call1.i, i32 1
  %30 = fdiv <2 x double> %27, %29
  %31 = bitcast double* %x53 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8, !tbaa !18
  %32 = load double* %z67, align 8, !tbaa !22
  %div4.i = fdiv double %32, %call1.i
  store double %div4.i, double* %z67, align 8, !tbaa !22
  br label %if.end69

if.end69:                                         ; preds = %if.then.i, %if.then24, %land.lhs.true, %if.then, %entry
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define void @ray_plane_intersect(%struct._Isect* nocapture %isect, %struct._Ray* nocapture readonly %ray, %struct._Plane* nocapture readonly %plane) #0 {
entry:
  %n = getelementptr inbounds %struct._Plane* %plane, i64 0, i32 1
  %n.061 = getelementptr %struct._vec* %n, i64 0, i32 0
  %n.061.val = load double* %n.061, align 8
  %n.162 = getelementptr %struct._Plane* %plane, i64 0, i32 1, i32 1
  %n.162.val = load double* %n.162, align 8
  %n.263 = getelementptr %struct._Plane* %plane, i64 0, i32 1, i32 2
  %n.263.val = load double* %n.263, align 8
  %dir.0 = getelementptr %struct._Ray* %ray, i64 0, i32 1, i32 0
  %0 = bitcast double* %dir.0 to <2 x double>*
  %1 = load <2 x double>* %0, align 8
  %dir.2 = getelementptr %struct._Ray* %ray, i64 0, i32 1, i32 2
  %dir.2.val = load double* %dir.2, align 8
  %2 = extractelement <2 x double> %1, i32 0
  %mul.i69 = fmul double %n.061.val, %2
  %3 = extractelement <2 x double> %1, i32 1
  %mul3.i70 = fmul double %n.162.val, %3
  %add.i71 = fadd double %mul.i69, %mul3.i70
  %mul5.i72 = fmul double %n.263.val, %dir.2.val
  %add6.i73 = fadd double %add.i71, %mul5.i72
  %call3 = tail call double @fabs(double %add6.i73) #6
  %cmp = fcmp olt double %call3, 1.000000e-17
  br i1 %cmp, label %if.end34, label %if.end

if.end:                                           ; preds = %entry
  %p.1 = getelementptr %struct._Plane* %plane, i64 0, i32 0, i32 1
  %p.0 = getelementptr %struct._Plane* %plane, i64 0, i32 0, i32 0
  %p.2 = getelementptr %struct._Plane* %plane, i64 0, i32 0, i32 2
  %p.1.val = load double* %p.1, align 8
  %p.0.val = load double* %p.0, align 8
  %mul3.i = fmul double %n.162.val, %p.1.val
  %mul.i = fmul double %n.061.val, %p.0.val
  %p.2.val = load double* %p.2, align 8
  %mul5.i = fmul double %n.263.val, %p.2.val
  %add.i = fadd double %mul3.i, %mul.i
  %add6.i = fadd double %add.i, %mul5.i
  %4 = bitcast %struct._Ray* %ray to <2 x double>*
  %5 = load <2 x double>* %4, align 8
  %org.2 = getelementptr %struct._Ray* %ray, i64 0, i32 0, i32 2
  %org.2.val = load double* %org.2, align 8
  %6 = extractelement <2 x double> %5, i32 0
  %mul.i64 = fmul double %n.061.val, %6
  %7 = extractelement <2 x double> %5, i32 1
  %mul3.i65 = fmul double %n.162.val, %7
  %add.i66 = fadd double %mul.i64, %mul3.i65
  %mul5.i67 = fmul double %n.263.val, %org.2.val
  %add6.i68 = fadd double %add.i66, %mul5.i67
  %add = fsub double %add6.i68, %add6.i
  %sub6 = fsub double -0.000000e+00, %add
  %div = fdiv double %sub6, %add6.i73
  %cmp7 = fcmp ogt double %div, 0.000000e+00
  br i1 %cmp7, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %if.end
  %t8 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 0
  %8 = load double* %t8, align 8, !tbaa !14
  %cmp9 = fcmp olt double %div, %8
  br i1 %cmp9, label %if.then10, label %if.end34

if.then10:                                        ; preds = %land.lhs.true
  store double %div, double* %t8, align 8, !tbaa !14
  %hit = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 3
  store i32 1, i32* %hit, align 4, !tbaa !17
  %x17 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  %9 = insertelement <2 x double> undef, double %div, i32 0
  %10 = insertelement <2 x double> %9, double %div, i32 1
  %11 = fmul <2 x double> %10, %1
  %12 = fadd <2 x double> %5, %11
  %13 = bitcast double* %x17 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8, !tbaa !18
  %mul28 = fmul double %dir.2.val, %div
  %add29 = fadd double %org.2.val, %mul28
  %z31 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  store double %add29, double* %z31, align 8, !tbaa !20
  %n32 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2
  %14 = bitcast %struct._vec* %n32 to i8*
  %15 = bitcast %struct._vec* %n to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 24, i32 8, i1 false), !tbaa.struct !23
  br label %if.end34

if.end34:                                         ; preds = %if.then10, %land.lhs.true, %if.end, %entry
  ret void
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define void @orthoBasis(%struct._vec* nocapture %basis, %struct._vec* byval nocapture readonly align 8 %n) #0 {
entry:
  %arrayidx = getelementptr inbounds %struct._vec* %basis, i64 2
  %0 = bitcast %struct._vec* %arrayidx to i8*
  %1 = bitcast %struct._vec* %n to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false), !tbaa.struct !23
  %x = getelementptr inbounds %struct._vec* %basis, i64 1, i32 0
  %y = getelementptr inbounds %struct._vec* %basis, i64 1, i32 1
  %z = getelementptr inbounds %struct._vec* %basis, i64 1, i32 2
  %x4 = getelementptr inbounds %struct._vec* %n, i64 0, i32 0
  %2 = bitcast double* %x to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 8, i1 false)
  %3 = load double* %x4, align 8, !tbaa !24
  %cmp = fcmp olt double %3, 6.000000e-01
  %cmp6 = fcmp ogt double %3, -6.000000e-01
  %or.cond = and i1 %cmp, %cmp6
  br i1 %or.cond, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store double 1.000000e+00, double* %x, align 8, !tbaa !24
  br label %if.end30

if.else:                                          ; preds = %entry
  %y9 = getelementptr inbounds %struct._vec* %n, i64 0, i32 1
  %4 = load double* %y9, align 8, !tbaa !25
  %cmp10 = fcmp olt double %4, 6.000000e-01
  %cmp13 = fcmp ogt double %4, -6.000000e-01
  %or.cond54 = and i1 %cmp10, %cmp13
  br i1 %or.cond54, label %if.then14, label %if.else17

if.then14:                                        ; preds = %if.else
  store double 1.000000e+00, double* %y, align 8, !tbaa !25
  br label %if.end30

if.else17:                                        ; preds = %if.else
  %z18 = getelementptr inbounds %struct._vec* %n, i64 0, i32 2
  %5 = load double* %z18, align 8, !tbaa !22
  %cmp19 = fcmp olt double %5, 6.000000e-01
  %cmp22 = fcmp ogt double %5, -6.000000e-01
  %or.cond55 = and i1 %cmp19, %cmp22
  br i1 %or.cond55, label %if.then23, label %if.else26

if.then23:                                        ; preds = %if.else17
  store double 1.000000e+00, double* %z, align 8, !tbaa !22
  br label %if.end30

if.else26:                                        ; preds = %if.else17
  store double 1.000000e+00, double* %x, align 8, !tbaa !24
  br label %if.end30

if.end30:                                         ; preds = %if.else26, %if.then23, %if.then14, %if.then
  %arrayidx1.0.val = phi double [ 0.000000e+00, %if.then14 ], [ 1.000000e+00, %if.else26 ], [ 0.000000e+00, %if.then23 ], [ 1.000000e+00, %if.then ]
  %6 = phi <2 x double> [ <double 1.000000e+00, double 0.000000e+00>, %if.then14 ], [ zeroinitializer, %if.else26 ], [ <double 0.000000e+00, double 1.000000e+00>, %if.then23 ], [ zeroinitializer, %if.then ]
  %7 = extractelement <2 x double> %6, i32 1
  %8 = extractelement <2 x double> %6, i32 0
  %arrayidx.056 = getelementptr %struct._vec* %arrayidx, i64 0, i32 0
  %arrayidx.056.val = load double* %arrayidx.056, align 8
  %arrayidx.157 = getelementptr %struct._vec* %basis, i64 2, i32 1
  %arrayidx.157.val = load double* %arrayidx.157, align 8
  %arrayidx.258 = getelementptr %struct._vec* %basis, i64 2, i32 2
  %arrayidx.258.val = load double* %arrayidx.258, align 8
  %x.i = getelementptr inbounds %struct._vec* %basis, i64 0, i32 0
  %9 = insertelement <2 x double> undef, double %arrayidx.258.val, i32 0
  %10 = insertelement <2 x double> %9, double %arrayidx.056.val, i32 1
  %11 = fmul <2 x double> %6, %10
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %arrayidx1.0.val, i32 1
  %14 = insertelement <2 x double> undef, double %arrayidx.157.val, i32 0
  %15 = insertelement <2 x double> %14, double %arrayidx.258.val, i32 1
  %16 = fmul <2 x double> %13, %15
  %17 = fsub <2 x double> %11, %16
  %y11.i = getelementptr inbounds %struct._vec* %basis, i64 0, i32 1
  %18 = bitcast %struct._vec* %basis to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8, !tbaa !18
  %mul14.i = fmul double %arrayidx1.0.val, %arrayidx.157.val
  %mul17.i = fmul double %8, %arrayidx.056.val
  %sub18.i = fsub double %mul14.i, %mul17.i
  %z19.i = getelementptr inbounds %struct._vec* %basis, i64 0, i32 2
  store double %sub18.i, double* %z19.i, align 8, !tbaa !22
  %19 = extractelement <2 x double> %17, i32 0
  %mul.i.i65 = fmul double %19, %19
  %20 = extractelement <2 x double> %17, i32 1
  %mul3.i.i66 = fmul double %20, %20
  %add.i.i67 = fadd double %mul.i.i65, %mul3.i.i66
  %mul5.i.i68 = fmul double %sub18.i, %sub18.i
  %add6.i.i69 = fadd double %mul5.i.i68, %add.i.i67
  %call1.i70 = tail call double @sqrt(double %add6.i.i69) #3
  %call2.i71 = tail call double @fabs(double %call1.i70) #6
  %cmp.i72 = fcmp ogt double %call2.i71, 1.000000e-17
  %21 = load double* %x.i, align 8, !tbaa !24
  br i1 %cmp.i72, label %if.then.i76, label %if.end30.vnormalize.exit77_crit_edge

if.end30.vnormalize.exit77_crit_edge:             ; preds = %if.end30
  %basis.1.val.pre = load double* %y11.i, align 8
  %basis.2.val.pre = load double* %z19.i, align 8
  %22 = insertelement <2 x double> undef, double %basis.2.val.pre, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  br label %vnormalize.exit77

if.then.i76:                                      ; preds = %if.end30
  %div.i73 = fdiv double %21, %call1.i70
  store double %div.i73, double* %x.i, align 8, !tbaa !24
  %24 = bitcast double* %y11.i to <2 x double>*
  %25 = load <2 x double>* %24, align 8, !tbaa !18
  %26 = insertelement <2 x double> undef, double %call1.i70, i32 0
  %27 = insertelement <2 x double> %26, double %call1.i70, i32 1
  %28 = fdiv <2 x double> %25, %27
  %29 = bitcast double* %y11.i to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8, !tbaa !18
  %30 = extractelement <2 x double> %28, i32 1
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = insertelement <2 x double> %31, double %div.i73, i32 1
  %33 = extractelement <2 x double> %28, i32 0
  br label %vnormalize.exit77

vnormalize.exit77:                                ; preds = %if.then.i76, %if.end30.vnormalize.exit77_crit_edge
  %basis.1.val = phi double [ %basis.1.val.pre, %if.end30.vnormalize.exit77_crit_edge ], [ %33, %if.then.i76 ]
  %34 = phi <2 x double> [ %23, %if.end30.vnormalize.exit77_crit_edge ], [ %32, %if.then.i76 ]
  %35 = extractelement <2 x double> %34, i32 1
  %arrayidx.0.val = load double* %arrayidx.056, align 8
  %36 = bitcast double* %arrayidx.157 to <2 x double>*
  %37 = load <2 x double>* %36, align 8
  %38 = fmul <2 x double> %34, %37
  %39 = insertelement <2 x double> undef, double %basis.1.val, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> %34, <2 x i32> <i32 0, i32 2>
  %41 = extractelement <2 x double> %37, i32 1
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = insertelement <2 x double> %42, double %arrayidx.0.val, i32 1
  %44 = fmul <2 x double> %40, %43
  %45 = fsub <2 x double> %38, %44
  %46 = bitcast double* %x to <2 x double>*
  store <2 x double> %45, <2 x double>* %46, align 8, !tbaa !18
  %mul14.i86 = fmul double %basis.1.val, %arrayidx.0.val
  %47 = extractelement <2 x double> %37, i32 0
  %mul17.i87 = fmul double %35, %47
  %sub18.i88 = fsub double %mul14.i86, %mul17.i87
  store double %sub18.i88, double* %z, align 8, !tbaa !22
  %48 = extractelement <2 x double> %45, i32 0
  %mul.i.i = fmul double %48, %48
  %49 = extractelement <2 x double> %45, i32 1
  %mul3.i.i = fmul double %49, %49
  %add.i.i = fadd double %mul.i.i, %mul3.i.i
  %mul5.i.i = fmul double %sub18.i88, %sub18.i88
  %add6.i.i = fadd double %mul5.i.i, %add.i.i
  %call1.i = tail call double @sqrt(double %add6.i.i) #3
  %call2.i = tail call double @fabs(double %call1.i) #6
  %cmp.i = fcmp ogt double %call2.i, 1.000000e-17
  br i1 %cmp.i, label %if.then.i, label %vnormalize.exit

if.then.i:                                        ; preds = %vnormalize.exit77
  %50 = bitcast double* %x to <2 x double>*
  %51 = load <2 x double>* %50, align 8, !tbaa !18
  %52 = insertelement <2 x double> undef, double %call1.i, i32 0
  %53 = insertelement <2 x double> %52, double %call1.i, i32 1
  %54 = fdiv <2 x double> %51, %53
  %55 = bitcast double* %x to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8, !tbaa !18
  %56 = load double* %z, align 8, !tbaa !22
  %div4.i = fdiv double %56, %call1.i
  store double %div4.i, double* %z, align 8, !tbaa !22
  br label %vnormalize.exit

vnormalize.exit:                                  ; preds = %if.then.i, %vnormalize.exit77
  ret void
}

; Function Attrs: nounwind uwtable
define void @ambient_occlusion(%struct._vec* nocapture %col, %struct._Isect* nocapture readonly %isect) #0 {
entry:
  %basis.sroa.0 = alloca %struct._vec, align 16
  %ray.sroa.0 = alloca <2 x double>, align 16
  %ray.sroa.20 = alloca <2 x double>, align 16
  %x = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  %x2 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 0
  %0 = bitcast double* %x to <2 x double>*
  %1 = load <2 x double>* %0, align 8, !tbaa !18
  %y6 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 1
  %2 = bitcast double* %x2 to <2 x double>*
  %3 = load <2 x double>* %2, align 8
  %4 = fmul <2 x double> %3, <double 1.000000e-04, double 1.000000e-04>
  %5 = fadd <2 x double> %1, %4
  %z = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  %6 = load double* %z, align 8, !tbaa !20
  %z12 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 2
  %7 = load double* %z12, align 8, !tbaa !21
  %mul13 = fmul double %7, 1.000000e-04
  %add14 = fadd double %6, %mul13
  %basis.sroa.0.0.cast278 = bitcast %struct._vec* %basis.sroa.0 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %basis.sroa.0.0.cast278)
  %n1.sroa.3.0.cast = bitcast double* %y6 to <2 x double>*
  %n1.sroa.3.0.copyload = load <2 x double>* %n1.sroa.3.0.cast, align 1
  %8 = extractelement <2 x double> %3, i32 0
  %cmp.i3 = fcmp olt double %8, 6.000000e-01
  %cmp6.i = fcmp ogt double %8, -6.000000e-01
  %or.cond.i = and i1 %cmp.i3, %cmp6.i
  %9 = extractelement <2 x double> %n1.sroa.3.0.copyload, i32 0
  %10 = extractelement <2 x double> %n1.sroa.3.0.copyload, i32 1
  br i1 %or.cond.i, label %if.end30.i, label %if.else.i

if.else.i:                                        ; preds = %entry
  %n1.sroa.3.8.vec.extract = extractelement <2 x double> %n1.sroa.3.0.copyload, i32 0
  %cmp10.i = fcmp olt double %n1.sroa.3.8.vec.extract, 6.000000e-01
  %cmp13.i = fcmp ogt double %n1.sroa.3.8.vec.extract, -6.000000e-01
  %or.cond54.i = and i1 %cmp10.i, %cmp13.i
  br i1 %or.cond54.i, label %if.end30.i, label %if.else17.i

if.else17.i:                                      ; preds = %if.else.i
  %n1.sroa.3.16.vec.extract = extractelement <2 x double> %n1.sroa.3.0.copyload, i32 1
  %cmp19.i = fcmp olt double %n1.sroa.3.16.vec.extract, 6.000000e-01
  %cmp22.i = fcmp ogt double %n1.sroa.3.16.vec.extract, -6.000000e-01
  %or.cond55.i = and i1 %cmp19.i, %cmp22.i
  %. = select i1 %or.cond55.i, double 0.000000e+00, double 1.000000e+00
  %.315 = select i1 %or.cond55.i, <2 x double> <double 0.000000e+00, double 1.000000e+00>, <2 x double> zeroinitializer
  br label %if.end30.i

if.end30.i:                                       ; preds = %if.else17.i, %if.else.i, %entry
  %arrayidx1.0.val.i = phi double [ 1.000000e+00, %entry ], [ 0.000000e+00, %if.else.i ], [ %., %if.else17.i ]
  %11 = phi <2 x double> [ zeroinitializer, %entry ], [ <double 1.000000e+00, double 0.000000e+00>, %if.else.i ], [ %.315, %if.else17.i ]
  %12 = extractelement <2 x double> %11, i32 1
  %13 = extractelement <2 x double> %11, i32 0
  %14 = shufflevector <2 x double> %n1.sroa.3.0.copyload, <2 x double> %3, <2 x i32> <i32 1, i32 2>
  %15 = fmul <2 x double> %11, %14
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %arrayidx1.0.val.i, i32 1
  %18 = fmul <2 x double> %17, %n1.sroa.3.0.copyload
  %19 = fsub <2 x double> %15, %18
  %basis.sroa.0.0.cast271 = bitcast %struct._vec* %basis.sroa.0 to <2 x double>*
  store <2 x double> %19, <2 x double>* %basis.sroa.0.0.cast271, align 16
  %mul14.i.i = fmul double %arrayidx1.0.val.i, %9
  %mul17.i.i = fmul double %8, %13
  %sub18.i.i = fsub double %mul14.i.i, %mul17.i.i
  %basis.sroa.0.16.idx290 = getelementptr inbounds %struct._vec* %basis.sroa.0, i64 0, i32 2
  store double %sub18.i.i, double* %basis.sroa.0.16.idx290, align 16
  %20 = extractelement <2 x double> %19, i32 0
  %mul.i.i65.i = fmul double %20, %20
  %21 = extractelement <2 x double> %19, i32 1
  %mul3.i.i66.i = fmul double %21, %21
  %add.i.i67.i = fadd double %mul.i.i65.i, %mul3.i.i66.i
  %mul5.i.i68.i = fmul double %sub18.i.i, %sub18.i.i
  %add6.i.i69.i = fadd double %mul5.i.i68.i, %add.i.i67.i
  %call1.i70.i = tail call double @sqrt(double %add6.i.i69.i) #3
  %call2.i71.i = tail call double @fabs(double %call1.i70.i) #6
  %cmp.i72.i = fcmp ogt double %call2.i71.i, 1.000000e-17
  br i1 %cmp.i72.i, label %if.then.i76.i, label %if.end30.vnormalize.exit77_crit_edge.i

if.end30.vnormalize.exit77_crit_edge.i:           ; preds = %if.end30.i
  %22 = insertelement <2 x double> undef, double %sub18.i.i, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> %19, <2 x i32> <i32 0, i32 2>
  br label %vnormalize.exit77.i

if.then.i76.i:                                    ; preds = %if.end30.i
  %basis.sroa.0.0.idx273 = getelementptr inbounds %struct._vec* %basis.sroa.0, i64 0, i32 0
  %div.i73.i = fdiv double %20, %call1.i70.i
  store double %div.i73.i, double* %basis.sroa.0.0.idx273, align 16
  %basis.sroa.0.8.idx279 = getelementptr inbounds %struct._vec* %basis.sroa.0, i64 0, i32 1
  %basis.sroa.0.8.cast280 = bitcast double* %basis.sroa.0.8.idx279 to <2 x double>*
  %basis.sroa.0.8.load281 = load <2 x double>* %basis.sroa.0.8.cast280, align 8
  %24 = insertelement <2 x double> undef, double %call1.i70.i, i32 0
  %25 = insertelement <2 x double> %24, double %call1.i70.i, i32 1
  %26 = fdiv <2 x double> %basis.sroa.0.8.load281, %25
  store <2 x double> %26, <2 x double>* %basis.sroa.0.8.cast280, align 8
  %27 = extractelement <2 x double> %26, i32 1
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = insertelement <2 x double> %28, double %div.i73.i, i32 1
  %30 = extractelement <2 x double> %26, i32 0
  %31 = insertelement <2 x double> undef, double %div.i73.i, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> %26, <2 x i32> <i32 0, i32 2>
  br label %vnormalize.exit77.i

vnormalize.exit77.i:                              ; preds = %if.then.i76.i, %if.end30.vnormalize.exit77_crit_edge.i
  %basis.sroa.0.16.load292 = phi double [ %sub18.i.i, %if.end30.vnormalize.exit77_crit_edge.i ], [ %27, %if.then.i76.i ]
  %basis.1.val.i = phi double [ %21, %if.end30.vnormalize.exit77_crit_edge.i ], [ %30, %if.then.i76.i ]
  %33 = phi <2 x double> [ %23, %if.end30.vnormalize.exit77_crit_edge.i ], [ %29, %if.then.i76.i ]
  %34 = phi <2 x double> [ %19, %if.end30.vnormalize.exit77_crit_edge.i ], [ %32, %if.then.i76.i ]
  %35 = extractelement <2 x double> %33, i32 1
  %36 = fmul <2 x double> %33, %n1.sroa.3.0.copyload
  %37 = insertelement <2 x double> undef, double %basis.1.val.i, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> %33, <2 x i32> <i32 0, i32 2>
  %39 = fmul <2 x double> %38, %14
  %40 = fsub <2 x double> %36, %39
  %mul14.i86.i = fmul double %8, %basis.1.val.i
  %mul17.i87.i = fmul double %35, %9
  %sub18.i88.i = fsub double %mul14.i86.i, %mul17.i87.i
  %41 = extractelement <2 x double> %40, i32 0
  %mul.i.i.i = fmul double %41, %41
  %42 = extractelement <2 x double> %40, i32 1
  %mul3.i.i.i = fmul double %42, %42
  %add.i.i.i = fadd double %mul.i.i.i, %mul3.i.i.i
  %mul5.i.i.i = fmul double %sub18.i88.i, %sub18.i88.i
  %add6.i.i.i = fadd double %mul5.i.i.i, %add.i.i.i
  %call1.i.i = tail call double @sqrt(double %add6.i.i.i) #3
  %call2.i.i = tail call double @fabs(double %call1.i.i) #6
  %cmp.i.i = fcmp ogt double %call2.i.i, 1.000000e-17
  br i1 %cmp.i.i, label %if.then.i.i, label %orthoBasis.exit

if.then.i.i:                                      ; preds = %vnormalize.exit77.i
  %43 = insertelement <2 x double> undef, double %call1.i.i, i32 0
  %44 = insertelement <2 x double> %43, double %call1.i.i, i32 1
  %45 = fdiv <2 x double> %40, %44
  %div4.i.i = fdiv double %sub18.i88.i, %call1.i.i
  br label %orthoBasis.exit

orthoBasis.exit:                                  ; preds = %if.then.i.i, %vnormalize.exit77.i
  %46 = phi double [ %sub18.i88.i, %vnormalize.exit77.i ], [ %div4.i.i, %if.then.i.i ]
  %47 = phi <2 x double> [ %40, %vnormalize.exit77.i ], [ %45, %if.then.i.i ]
  %ray.sroa.0.0.cast219 = bitcast <2 x double>* %ray.sroa.0 to i8*
  %ray.sroa.20.0.cast202 = bitcast <2 x double>* %ray.sroa.20 to i8*
  br label %for.cond17.preheader

for.cond17.preheader:                             ; preds = %for.inc71, %orthoBasis.exit
  %j.0116 = phi i32 [ 0, %orthoBasis.exit ], [ %inc72, %for.inc71 ]
  %occlusion.0115 = phi double [ 0.000000e+00, %orthoBasis.exit ], [ %occlusion.2, %for.inc71 ]
  br label %for.body19

for.body19:                                       ; preds = %if.end, %for.cond17.preheader
  %i.0114 = phi i32 [ 0, %for.cond17.preheader ], [ %inc, %if.end ]
  %occlusion.1113 = phi double [ %occlusion.0115, %for.cond17.preheader ], [ %occlusion.2, %if.end ]
  %call = tail call double @drand48() #3
  %call20 = tail call double @sqrt(double %call) #3
  %call21 = tail call double @drand48() #3
  %mul22 = fmul double %call21, 0x401921FB54442D18
  %call24 = tail call double @cos(double %mul22) #3
  %mul25 = fmul double %call20, %call24
  %call27 = tail call double @sin(double %mul22) #3
  %mul28 = fmul double %call20, %call27
  %mul30 = fmul double %call20, %call20
  %sub = fsub double 1.000000e+00, %mul30
  %call31 = tail call double @sqrt(double %sub) #3
  %48 = insertelement <2 x double> undef, double %mul25, i32 0
  %49 = insertelement <2 x double> %48, double %mul25, i32 1
  %50 = fmul <2 x double> %49, %34
  %51 = insertelement <2 x double> undef, double %mul28, i32 0
  %52 = insertelement <2 x double> %51, double %mul28, i32 1
  %53 = fmul <2 x double> %52, %47
  %54 = fadd <2 x double> %50, %53
  %55 = insertelement <2 x double> undef, double %call31, i32 0
  %56 = insertelement <2 x double> %55, double %call31, i32 1
  %57 = shufflevector <2 x double> %3, <2 x double> %n1.sroa.3.0.copyload, <2 x i32> <i32 0, i32 2>
  %58 = fmul <2 x double> %56, %57
  %59 = fadd <2 x double> %58, %54
  %mul55 = fmul double %basis.sroa.0.16.load292, %mul25
  %mul58 = fmul double %46, %mul28
  %add59 = fadd double %mul55, %mul58
  %mul62 = fmul double %10, %call31
  %add63 = fadd double %mul62, %add59
  call void @llvm.lifetime.start(i64 16, i8* %ray.sroa.0.0.cast219)
  call void @llvm.lifetime.start(i64 16, i8* %ray.sroa.20.0.cast202)
  store <2 x double> %5, <2 x double>* %ray.sroa.0, align 16
  store <2 x double> %59, <2 x double>* %ray.sroa.20, align 16
  %60 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 0), align 16, !tbaa !7
  %61 = extractelement <2 x double> %5, i32 0
  %sub.i = fsub double %61, %60
  %62 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 1), align 8, !tbaa !10
  %63 = extractelement <2 x double> %5, i32 1
  %sub6.i6 = fsub double %63, %62
  %64 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 2), align 16, !tbaa !12
  %sub11.i = fsub double %add14, %64
  %65 = extractelement <2 x double> %59, i32 0
  %mul.i.i8 = fmul double %sub.i, %65
  %66 = extractelement <2 x double> %59, i32 1
  %mul3.i.i9 = fmul double %sub6.i6, %66
  %add.i.i10 = fadd double %mul.i.i8, %mul3.i.i9
  %mul5.i.i11 = fmul double %add63, %sub11.i
  %add6.i.i12 = fadd double %mul5.i.i11, %add.i.i10
  %mul.i112.i = fmul double %sub.i, %sub.i
  %mul3.i113.i = fmul double %sub6.i6, %sub6.i6
  %add.i114.i = fadd double %mul.i112.i, %mul3.i113.i
  %mul5.i115.i = fmul double %sub11.i, %sub11.i
  %add6.i116.i = fadd double %add.i114.i, %mul5.i115.i
  %67 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 1), align 8, !tbaa !13
  %mul.i13 = fmul double %67, %67
  %sub15.i = fsub double %add6.i116.i, %mul.i13
  %mul16.i = fmul double %add6.i.i12, %add6.i.i12
  %sub17.i = fsub double %mul16.i, %sub15.i
  %cmp.i14 = fcmp ogt double %sub17.i, 0.000000e+00
  br i1 %cmp.i14, label %if.then.i15, label %ray_sphere_intersect.exit

if.then.i15:                                      ; preds = %for.body19
  %sub18.i = fsub double -0.000000e+00, %add6.i.i12
  %call19.i = tail call double @sqrt(double %sub17.i) #3
  %sub20.i = fsub double %sub18.i, %call19.i
  %cmp21.i = fcmp ogt double %sub20.i, 0.000000e+00
  %cmp23.i = fcmp olt double %sub20.i, 1.000000e+17
  %or.cond300 = and i1 %cmp21.i, %cmp23.i
  br i1 %or.cond300, label %if.then24.i, label %ray_sphere_intersect.exit

if.then24.i:                                      ; preds = %if.then.i15
  %ray.sroa.0.0.load210 = load <2 x double>* %ray.sroa.0, align 16
  %ray.sroa.20.0.load194 = load <2 x double>* %ray.sroa.20, align 16
  %68 = insertelement <2 x double> undef, double %sub20.i, i32 0
  %69 = insertelement <2 x double> %68, double %sub20.i, i32 1
  %70 = fmul <2 x double> %69, %ray.sroa.20.0.load194
  %71 = fadd <2 x double> %ray.sroa.0.0.load210, %70
  %mul44.i = fmul double %add63, %sub20.i
  %add45.i = fadd double %add14, %mul44.i
  %72 = load <2 x double>* bitcast ([3 x %struct._Sphere]* @spheres to <2 x double>*), align 16, !tbaa !18
  %73 = fsub <2 x double> %71, %72
  %74 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 2), align 16, !tbaa !12
  %sub65.i = fsub double %add45.i, %74
  %75 = extractelement <2 x double> %73, i32 0
  %mul.i.i.i16 = fmul double %75, %75
  %76 = extractelement <2 x double> %73, i32 1
  %mul3.i.i.i17 = fmul double %76, %76
  %add.i.i.i18 = fadd double %mul.i.i.i16, %mul3.i.i.i17
  %mul5.i.i.i19 = fmul double %sub65.i, %sub65.i
  %add6.i.i.i20 = fadd double %mul5.i.i.i19, %add.i.i.i18
  %call1.i.i21 = tail call double @sqrt(double %add6.i.i.i20) #3
  %77 = extractelement <2 x double> %ray.sroa.0.0.load210, i32 0
  %78 = extractelement <2 x double> %ray.sroa.20.0.load194, i32 0
  br label %ray_sphere_intersect.exit

ray_sphere_intersect.exit:                        ; preds = %if.then24.i, %if.then.i15, %for.body19
  %ray.sroa.20.0.load200314 = phi double [ %65, %for.body19 ], [ %65, %if.then.i15 ], [ %78, %if.then24.i ]
  %ray.sroa.0.0.load213312 = phi double [ %61, %for.body19 ], [ %61, %if.then.i15 ], [ %77, %if.then24.i ]
  %79 = phi i32 [ 0, %for.body19 ], [ 0, %if.then.i15 ], [ 1, %if.then24.i ]
  %occIsect.sroa.0.0.load297 = phi double [ 1.000000e+17, %for.body19 ], [ 1.000000e+17, %if.then.i15 ], [ %sub20.i, %if.then24.i ]
  %80 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 0), align 16, !tbaa !7
  %sub.i27 = fsub double %ray.sroa.0.0.load213312, %80
  %81 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 1), align 8, !tbaa !10
  %sub6.i29 = fsub double %63, %81
  %82 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 2), align 16, !tbaa !12
  %sub11.i31 = fsub double %add14, %82
  %mul.i.i38 = fmul double %sub.i27, %ray.sroa.20.0.load200314
  %mul3.i.i39 = fmul double %sub6.i29, %66
  %add.i.i40 = fadd double %mul.i.i38, %mul3.i.i39
  %mul5.i.i41 = fmul double %add63, %sub11.i31
  %add6.i.i42 = fadd double %mul5.i.i41, %add.i.i40
  %mul.i112.i43 = fmul double %sub.i27, %sub.i27
  %mul3.i113.i44 = fmul double %sub6.i29, %sub6.i29
  %add.i114.i45 = fadd double %mul.i112.i43, %mul3.i113.i44
  %mul5.i115.i46 = fmul double %sub11.i31, %sub11.i31
  %add6.i116.i47 = fadd double %add.i114.i45, %mul5.i115.i46
  %83 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 1), align 8, !tbaa !13
  %mul.i48 = fmul double %83, %83
  %sub15.i49 = fsub double %add6.i116.i47, %mul.i48
  %mul16.i50 = fmul double %add6.i.i42, %add6.i.i42
  %sub17.i51 = fsub double %mul16.i50, %sub15.i49
  %cmp.i52 = fcmp ogt double %sub17.i51, 0.000000e+00
  br i1 %cmp.i52, label %if.then.i57, label %ray_sphere_intersect.exit80

if.then.i57:                                      ; preds = %ray_sphere_intersect.exit
  %sub18.i53 = fsub double -0.000000e+00, %add6.i.i42
  %call19.i54 = tail call double @sqrt(double %sub17.i51) #3
  %sub20.i55 = fsub double %sub18.i53, %call19.i54
  %cmp21.i56 = fcmp ogt double %sub20.i55, 0.000000e+00
  %cmp23.i59 = fcmp olt double %sub20.i55, %occIsect.sroa.0.0.load297
  %or.cond301 = and i1 %cmp21.i56, %cmp23.i59
  br i1 %or.cond301, label %if.then24.i77, label %ray_sphere_intersect.exit80

if.then24.i77:                                    ; preds = %if.then.i57
  %ray.sroa.0.0.load209 = load <2 x double>* %ray.sroa.0, align 16
  %ray.sroa.20.0.load = load <2 x double>* %ray.sroa.20, align 16
  %84 = insertelement <2 x double> undef, double %sub20.i55, i32 0
  %85 = insertelement <2 x double> %84, double %sub20.i55, i32 1
  %86 = fmul <2 x double> %85, %ray.sroa.20.0.load
  %87 = fadd <2 x double> %ray.sroa.0.0.load209, %86
  %mul44.i63 = fmul double %add63, %sub20.i55
  %add45.i64 = fadd double %add14, %mul44.i63
  %88 = load <2 x double>* bitcast (%struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1) to <2 x double>*), align 16, !tbaa !18
  %89 = fsub <2 x double> %87, %88
  %90 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 2), align 16, !tbaa !12
  %sub65.i67 = fsub double %add45.i64, %90
  %91 = extractelement <2 x double> %89, i32 0
  %mul.i.i.i69 = fmul double %91, %91
  %92 = extractelement <2 x double> %89, i32 1
  %mul3.i.i.i70 = fmul double %92, %92
  %add.i.i.i71 = fadd double %mul.i.i.i69, %mul3.i.i.i70
  %mul5.i.i.i72 = fmul double %sub65.i67, %sub65.i67
  %add6.i.i.i73 = fadd double %mul5.i.i.i72, %add.i.i.i71
  %call1.i.i74 = tail call double @sqrt(double %add6.i.i.i73) #3
  %93 = extractelement <2 x double> %ray.sroa.0.0.load209, i32 0
  %94 = extractelement <2 x double> %ray.sroa.20.0.load, i32 0
  br label %ray_sphere_intersect.exit80

ray_sphere_intersect.exit80:                      ; preds = %if.then24.i77, %if.then.i57, %ray_sphere_intersect.exit
  %ray.sroa.20.0.load200 = phi double [ %ray.sroa.20.0.load200314, %ray_sphere_intersect.exit ], [ %ray.sroa.20.0.load200314, %if.then.i57 ], [ %94, %if.then24.i77 ]
  %ray.sroa.0.0.load213 = phi double [ %ray.sroa.0.0.load213312, %ray_sphere_intersect.exit ], [ %ray.sroa.0.0.load213312, %if.then.i57 ], [ %93, %if.then24.i77 ]
  %95 = phi i32 [ %79, %ray_sphere_intersect.exit ], [ %79, %if.then.i57 ], [ 1, %if.then24.i77 ]
  %occIsect.sroa.0.0.load296 = phi double [ %occIsect.sroa.0.0.load297, %ray_sphere_intersect.exit ], [ %occIsect.sroa.0.0.load297, %if.then.i57 ], [ %sub20.i55, %if.then24.i77 ]
  %96 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 0), align 16, !tbaa !7
  %sub.i82 = fsub double %ray.sroa.0.0.load213, %96
  %97 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 1), align 8, !tbaa !10
  %sub6.i84 = fsub double %63, %97
  %98 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 2), align 16, !tbaa !12
  %sub11.i86 = fsub double %add14, %98
  %mul.i.i93 = fmul double %sub.i82, %ray.sroa.20.0.load200
  %mul3.i.i94 = fmul double %sub6.i84, %66
  %add.i.i95 = fadd double %mul.i.i93, %mul3.i.i94
  %mul5.i.i96 = fmul double %add63, %sub11.i86
  %add6.i.i97 = fadd double %mul5.i.i96, %add.i.i95
  %mul.i112.i98 = fmul double %sub.i82, %sub.i82
  %mul3.i113.i99 = fmul double %sub6.i84, %sub6.i84
  %add.i114.i100 = fadd double %mul.i112.i98, %mul3.i113.i99
  %mul5.i115.i101 = fmul double %sub11.i86, %sub11.i86
  %add6.i116.i102 = fadd double %add.i114.i100, %mul5.i115.i101
  %99 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 1), align 8, !tbaa !13
  %mul.i103 = fmul double %99, %99
  %sub15.i104 = fsub double %add6.i116.i102, %mul.i103
  %mul16.i105 = fmul double %add6.i.i97, %add6.i.i97
  %sub17.i106 = fsub double %mul16.i105, %sub15.i104
  %cmp.i107 = fcmp ogt double %sub17.i106, 0.000000e+00
  br i1 %cmp.i107, label %if.then.i112, label %ray_sphere_intersect.exit135

if.then.i112:                                     ; preds = %ray_sphere_intersect.exit80
  %sub18.i108 = fsub double -0.000000e+00, %add6.i.i97
  %call19.i109 = tail call double @sqrt(double %sub17.i106) #3
  %sub20.i110 = fsub double %sub18.i108, %call19.i109
  %cmp21.i111 = fcmp ogt double %sub20.i110, 0.000000e+00
  %cmp23.i114 = fcmp olt double %sub20.i110, %occIsect.sroa.0.0.load296
  %or.cond302 = and i1 %cmp21.i111, %cmp23.i114
  br i1 %or.cond302, label %if.then24.i132, label %ray_sphere_intersect.exit135

if.then24.i132:                                   ; preds = %if.then.i112
  %ray.sroa.0.0.load208 = load <2 x double>* %ray.sroa.0, align 16
  %ray.sroa.20.0.load193 = load <2 x double>* %ray.sroa.20, align 16
  %100 = insertelement <2 x double> undef, double %sub20.i110, i32 0
  %101 = insertelement <2 x double> %100, double %sub20.i110, i32 1
  %102 = fmul <2 x double> %101, %ray.sroa.20.0.load193
  %103 = fadd <2 x double> %ray.sroa.0.0.load208, %102
  %mul44.i118 = fmul double %add63, %sub20.i110
  %add45.i119 = fadd double %add14, %mul44.i118
  %104 = load <2 x double>* bitcast (%struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2) to <2 x double>*), align 16, !tbaa !18
  %105 = fsub <2 x double> %103, %104
  %106 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 2), align 16, !tbaa !12
  %sub65.i122 = fsub double %add45.i119, %106
  %107 = extractelement <2 x double> %105, i32 0
  %mul.i.i.i124 = fmul double %107, %107
  %108 = extractelement <2 x double> %105, i32 1
  %mul3.i.i.i125 = fmul double %108, %108
  %add.i.i.i126 = fadd double %mul.i.i.i124, %mul3.i.i.i125
  %mul5.i.i.i127 = fmul double %sub65.i122, %sub65.i122
  %add6.i.i.i128 = fadd double %mul5.i.i.i127, %add.i.i.i126
  %call1.i.i129 = tail call double @sqrt(double %add6.i.i.i128) #3
  br label %ray_sphere_intersect.exit135

ray_sphere_intersect.exit135:                     ; preds = %if.then24.i132, %if.then.i112, %ray_sphere_intersect.exit80
  %109 = phi i32 [ %95, %ray_sphere_intersect.exit80 ], [ %95, %if.then.i112 ], [ 1, %if.then24.i132 ]
  %occIsect.sroa.0.0.load298 = phi double [ %occIsect.sroa.0.0.load296, %ray_sphere_intersect.exit80 ], [ %occIsect.sroa.0.0.load296, %if.then.i112 ], [ %sub20.i110, %if.then24.i132 ]
  %n.061.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 0), align 8
  %n.162.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8
  %n.263.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8
  %mul.i69.i = fmul double %65, %n.061.val.i
  %mul3.i70.i = fmul double %66, %n.162.val.i
  %add.i71.i = fadd double %mul.i69.i, %mul3.i70.i
  %mul5.i72.i = fmul double %add63, %n.263.val.i
  %add6.i73.i = fadd double %add.i71.i, %mul5.i72.i
  %call3.i = tail call double @fabs(double %add6.i73.i) #6
  %cmp.i = fcmp olt double %call3.i, 1.000000e-17
  br i1 %cmp.i, label %ray_plane_intersect.exit, label %if.end.i

if.end.i:                                         ; preds = %ray_sphere_intersect.exit135
  %p.1.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 1), align 8
  %p.0.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 0), align 8
  %mul3.i.i = fmul double %n.162.val.i, %p.1.val.i
  %mul.i.i = fmul double %n.061.val.i, %p.0.val.i
  %p.2.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 2), align 8
  %mul5.i.i = fmul double %n.263.val.i, %p.2.val.i
  %add.i.i = fadd double %mul3.i.i, %mul.i.i
  %add6.i.i = fadd double %add.i.i, %mul5.i.i
  %mul.i64.i = fmul double %61, %n.061.val.i
  %mul3.i65.i = fmul double %63, %n.162.val.i
  %add.i66.i = fadd double %mul.i64.i, %mul3.i65.i
  %mul5.i67.i = fmul double %add14, %n.263.val.i
  %add6.i68.i = fadd double %add.i66.i, %mul5.i67.i
  %add.i = fsub double %add6.i68.i, %add6.i.i
  %sub6.i = fsub double -0.000000e+00, %add.i
  %div.i = fdiv double %sub6.i, %add6.i73.i
  %notlhs = fcmp ule double %div.i, 0.000000e+00
  %notrhs = fcmp uge double %div.i, %occIsect.sroa.0.0.load298
  %or.cond.not = or i1 %notrhs, %notlhs
  %tobool = icmp eq i32 %109, 0
  %or.cond303 = and i1 %or.cond.not, %tobool
  br i1 %or.cond303, label %if.end, label %if.then

ray_plane_intersect.exit:                         ; preds = %ray_sphere_intersect.exit135
  %tobool.old = icmp eq i32 %109, 0
  br i1 %tobool.old, label %if.end, label %if.then

if.then:                                          ; preds = %ray_plane_intersect.exit, %if.end.i
  %add70 = fadd double %occlusion.1113, 1.000000e+00
  br label %if.end

if.end:                                           ; preds = %if.then, %ray_plane_intersect.exit, %if.end.i
  %occlusion.2 = phi double [ %add70, %if.then ], [ %occlusion.1113, %ray_plane_intersect.exit ], [ %occlusion.1113, %if.end.i ]
  call void @llvm.lifetime.end(i64 16, i8* %ray.sroa.0.0.cast219)
  call void @llvm.lifetime.end(i64 16, i8* %ray.sroa.20.0.cast202)
  %inc = add nsw i32 %i.0114, 1
  %exitcond = icmp eq i32 %inc, 16
  br i1 %exitcond, label %for.inc71, label %for.body19

for.inc71:                                        ; preds = %if.end
  %inc72 = add nsw i32 %j.0116, 1
  %exitcond117 = icmp eq i32 %inc72, 16
  br i1 %exitcond117, label %for.end73, label %for.cond17.preheader

for.end73:                                        ; preds = %for.inc71
  %sub75 = fsub double 2.560000e+02, %occlusion.2
  %div = fmul double %sub75, 3.906250e-03
  %x78 = getelementptr inbounds %struct._vec* %col, i64 0, i32 0
  store double %div, double* %x78, align 8, !tbaa !24
  %y79 = getelementptr inbounds %struct._vec* %col, i64 0, i32 1
  store double %div, double* %y79, align 8, !tbaa !25
  %z80 = getelementptr inbounds %struct._vec* %col, i64 0, i32 2
  store double %div, double* %z80, align 8, !tbaa !22
  call void @llvm.lifetime.end(i64 24, i8* %basis.sroa.0.0.cast278)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare double @drand48() #1

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind readnone uwtable
define zeroext i8 @clamp(double %f) #4 {
entry:
  %mul = fmul double %f, 2.555000e+02
  %conv = fptosi double %mul to i32
  %cmp = icmp slt i32 %conv, 0
  %.conv = select i1 %cmp, i32 0, i32 %conv
  %cmp2 = icmp sgt i32 %.conv, 255
  %0 = trunc i32 %.conv to i8
  %conv6 = select i1 %cmp2, i8 -1, i8 %0
  ret i8 %conv6
}

; Function Attrs: nounwind uwtable
define void @render(i8* nocapture %img, i32 %w, i32 %h, i32 %nsubsamples) #0 {
entry:
  %ray.sroa.18 = alloca <2 x double>, align 16
  %isect = alloca %struct._Isect, align 8
  %col = alloca %struct._vec, align 8
  %conv = sext i32 %w to i64
  %conv1 = sext i32 %h to i64
  %mul2 = mul i64 %conv, 24
  %mul3 = mul i64 %mul2, %conv1
  %call = tail call noalias i8* @malloc(i64 %mul3) #3
  %0 = bitcast i8* %call to double*
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 %mul3, i32 1, i1 false)
  %cmp249 = icmp sgt i32 %h, 0
  br i1 %cmp249, label %for.cond10.preheader.lr.ph, label %for.end149

for.cond10.preheader.lr.ph:                       ; preds = %entry
  %cmp11247 = icmp sgt i32 %w, 0
  %cmp15245 = icmp sgt i32 %nsubsamples, 0
  %conv24 = sitofp i32 %nsubsamples to double
  %conv25 = sitofp i32 %w to double
  %div26 = fmul double %conv25, 5.000000e-01
  %conv35 = sitofp i32 %h to double
  %div36 = fmul double %conv35, 5.000000e-01
  %1 = bitcast %struct._Isect* %isect to i8*
  %t = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 0
  %hit = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 3
  %x53 = getelementptr inbounds %struct._vec* %col, i64 0, i32 0
  %y59 = getelementptr inbounds %struct._vec* %col, i64 0, i32 1
  %z67 = getelementptr inbounds %struct._vec* %col, i64 0, i32 2
  %x17.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  %y24.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 1
  %z31.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  %n32.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2
  %2 = bitcast %struct._vec* %n32.i to i8*
  %mul78 = mul nsw i32 %nsubsamples, %nsubsamples
  %conv79 = sitofp i32 %mul78 to double
  %ray.sroa.18.0.cast161 = bitcast <2 x double>* %ray.sroa.18 to i8*
  %ray.sroa.18.0.idx159 = getelementptr inbounds <2 x double>* %ray.sroa.18, i64 0, i64 0
  %ray.sroa.18.8.idx164 = getelementptr inbounds <2 x double>* %ray.sroa.18, i64 0, i64 1
  %3 = bitcast double* %x17.i to <2 x double>*
  %x53.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 0
  %4 = bitcast double* %x53.i to <2 x double>*
  %z67.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 2
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.inc147, %for.cond10.preheader.lr.ph
  %indvars.iv255 = phi i64 [ 0, %for.cond10.preheader.lr.ph ], [ %indvars.iv.next256, %for.inc147 ]
  br i1 %cmp11247, label %for.cond14.preheader.lr.ph, label %for.inc147

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader
  %5 = trunc i64 %indvars.iv255 to i32
  %conv30 = sitofp i32 %5 to double
  %mul54 = mul nsw i32 %5, %w
  %6 = sext i32 %mul54 to i64
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.end77, %for.cond14.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %indvars.iv.next, %for.end77 ]
  br i1 %cmp15245, label %for.cond18.preheader.lr.ph.split.us, label %for.cond14.preheader.for.end77_crit_edge

for.cond14.preheader.for.end77_crit_edge:         ; preds = %for.cond14.preheader
  %.pre = add nsw i64 %indvars.iv, %6
  %.pre262 = trunc i64 %.pre to i32
  %mul82.pre = mul nsw i32 %.pre262, 3
  %idxprom84.pre = sext i32 %mul82.pre to i64
  %arrayidx85.pre = getelementptr inbounds double* %0, i64 %idxprom84.pre
  %add92.pre = add nsw i32 %mul82.pre, 1
  %idxprom93.pre = sext i32 %add92.pre to i64
  %arrayidx94.pre = getelementptr inbounds double* %0, i64 %idxprom93.pre
  %add101.pre = add nsw i32 %mul82.pre, 2
  %idxprom102.pre = sext i32 %add101.pre to i64
  %arrayidx103.pre = getelementptr inbounds double* %0, i64 %idxprom102.pre
  br label %for.end77

for.cond18.preheader.lr.ph.split.us:              ; preds = %for.cond14.preheader
  %7 = trunc i64 %indvars.iv to i32
  %conv22 = sitofp i32 %7 to double
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %mul56 = mul nsw i32 %9, 3
  %idxprom = sext i32 %mul56 to i64
  %arrayidx = getelementptr inbounds double* %0, i64 %idxprom
  %add63 = add nsw i32 %mul56, 1
  %idxprom64 = sext i32 %add63 to i64
  %arrayidx65 = getelementptr inbounds double* %0, i64 %idxprom64
  %add71 = add nsw i32 %mul56, 2
  %idxprom72 = sext i32 %add71 to i64
  %arrayidx73 = getelementptr inbounds double* %0, i64 %idxprom72
  br label %for.body21.lr.ph.us

for.inc75.us:                                     ; preds = %if.end.us
  %inc76.us = add nsw i32 %v.0246.us, 1
  %exitcond251 = icmp eq i32 %inc76.us, %nsubsamples
  br i1 %exitcond251, label %for.end77, label %for.body21.lr.ph.us

for.body21.us:                                    ; preds = %for.body21.lr.ph.us, %if.end.us
  %u.0244.us = phi i32 [ 0, %for.body21.lr.ph.us ], [ %inc.us, %if.end.us ]
  %conv23.us = sitofp i32 %u.0244.us to double
  %div.us = fdiv double %conv23.us, %conv24
  %add.us = fadd double %conv22, %div.us
  %sub.us = fsub double %add.us, %div26
  %div29.us = fdiv double %sub.us, %div26
  call void @llvm.lifetime.start(i64 16, i8* %ray.sroa.18.0.cast161)
  store double %div29.us, double* %ray.sroa.18.0.idx159, align 16
  store double %div41.us, double* %ray.sroa.18.8.idx164, align 8
  %mul.i.i.us = fmul double %div29.us, %div29.us
  %add.i.i.us = fadd double %mul3.i.i.us, %mul.i.i.us
  %add6.i.i.us = fadd double %add.i.i.us, 1.000000e+00
  %call1.i.us = tail call double @sqrt(double %add6.i.i.us) #3
  %call2.i.us = tail call double @fabs(double %call1.i.us) #6
  %cmp.i.us = fcmp ogt double %call2.i.us, 1.000000e-17
  br i1 %cmp.i.us, label %if.then.i.us, label %vnormalize.exit.us

if.then.i.us:                                     ; preds = %for.body21.us
  %div.i.us = fdiv double %div29.us, %call1.i.us
  store double %div.i.us, double* %ray.sroa.18.0.idx159, align 16
  %div3.i.us = fdiv double %div41.us, %call1.i.us
  store double %div3.i.us, double* %ray.sroa.18.8.idx164, align 8
  %div4.i.us = fdiv double -1.000000e+00, %call1.i.us
  br label %vnormalize.exit.us

vnormalize.exit.us:                               ; preds = %if.then.i.us, %for.body21.us
  %dir.2.val.i.us = phi double [ %div4.i.us, %if.then.i.us ], [ -1.000000e+00, %for.body21.us ]
  %ray.sroa.18.8.load163 = phi double [ %div3.i.us, %if.then.i.us ], [ %div41.us, %for.body21.us ]
  %ray.sroa.18.0.load156 = phi double [ %div.i.us, %if.then.i.us ], [ %div29.us, %for.body21.us ]
  call void @llvm.lifetime.start(i64 64, i8* %1) #3
  store double 1.000000e+17, double* %t, align 8, !tbaa !14
  store i32 0, i32* %hit, align 8, !tbaa !17
  %10 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 0), align 16, !tbaa !7
  %sub.i = fsub double 0.000000e+00, %10
  %11 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 1), align 8, !tbaa !10
  %sub6.i = fsub double 0.000000e+00, %11
  %12 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 2), align 16, !tbaa !12
  %sub11.i = fsub double 0.000000e+00, %12
  %mul.i.i = fmul double %sub.i, %ray.sroa.18.0.load156
  %mul3.i.i = fmul double %sub6.i, %ray.sroa.18.8.load163
  %add.i.i = fadd double %mul.i.i, %mul3.i.i
  %mul5.i.i = fmul double %dir.2.val.i.us, %sub11.i
  %add6.i.i = fadd double %mul5.i.i, %add.i.i
  %mul.i112.i = fmul double %sub.i, %sub.i
  %mul3.i113.i = fmul double %sub6.i, %sub6.i
  %add.i114.i = fadd double %mul.i112.i, %mul3.i113.i
  %mul5.i115.i = fmul double %sub11.i, %sub11.i
  %add6.i116.i = fadd double %add.i114.i, %mul5.i115.i
  %13 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 1), align 8, !tbaa !13
  %mul.i = fmul double %13, %13
  %sub15.i = fsub double %add6.i116.i, %mul.i
  %mul16.i = fmul double %add6.i.i, %add6.i.i
  %sub17.i = fsub double %mul16.i, %sub15.i
  %cmp.i = fcmp ogt double %sub17.i, 0.000000e+00
  br i1 %cmp.i, label %if.then.i, label %ray_sphere_intersect.exit

if.then.i:                                        ; preds = %vnormalize.exit.us
  %sub18.i = fsub double -0.000000e+00, %add6.i.i
  %call19.i = tail call double @sqrt(double %sub17.i) #3
  %sub20.i = fsub double %sub18.i, %call19.i
  %cmp21.i = fcmp ogt double %sub20.i, 0.000000e+00
  %cmp23.i = fcmp olt double %sub20.i, 1.000000e+17
  %or.cond = and i1 %cmp21.i, %cmp23.i
  br i1 %or.cond, label %if.then24.i, label %ray_sphere_intersect.exit

if.then24.i:                                      ; preds = %if.then.i
  store double %sub20.i, double* %t, align 8, !tbaa !14
  store i32 1, i32* %hit, align 8, !tbaa !17
  %ray.sroa.18.0.load151 = load <2 x double>* %ray.sroa.18, align 16
  %14 = insertelement <2 x double> undef, double %sub20.i, i32 0
  %15 = insertelement <2 x double> %14, double %sub20.i, i32 1
  %16 = fmul <2 x double> %15, %ray.sroa.18.0.load151
  %17 = fadd <2 x double> %16, zeroinitializer
  store <2 x double> %17, <2 x double>* %3, align 8, !tbaa !18
  %mul44.i = fmul double %dir.2.val.i.us, %sub20.i
  %add45.i = fadd double %mul44.i, 0.000000e+00
  store double %add45.i, double* %z31.i, align 8, !tbaa !20
  %18 = load <2 x double>* bitcast ([3 x %struct._Sphere]* @spheres to <2 x double>*), align 16, !tbaa !18
  %19 = fsub <2 x double> %17, %18
  store <2 x double> %19, <2 x double>* %4, align 8, !tbaa !18
  %20 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 2), align 16, !tbaa !12
  %sub65.i = fsub double %add45.i, %20
  store double %sub65.i, double* %z67.i, align 8, !tbaa !21
  %21 = extractelement <2 x double> %19, i32 0
  %mul.i.i.i = fmul double %21, %21
  %22 = extractelement <2 x double> %19, i32 1
  %mul3.i.i.i = fmul double %22, %22
  %add.i.i.i = fadd double %mul.i.i.i, %mul3.i.i.i
  %mul5.i.i.i = fmul double %sub65.i, %sub65.i
  %add6.i.i.i = fadd double %mul5.i.i.i, %add.i.i.i
  %call1.i.i = tail call double @sqrt(double %add6.i.i.i) #3
  %call2.i.i = tail call double @fabs(double %call1.i.i) #6
  %cmp.i.i = fcmp ogt double %call2.i.i, 1.000000e-17
  %23 = extractelement <2 x double> %ray.sroa.18.0.load151, i32 0
  br i1 %cmp.i.i, label %if.then.i.i, label %ray_sphere_intersect.exit

if.then.i.i:                                      ; preds = %if.then24.i
  %24 = insertelement <2 x double> undef, double %call1.i.i, i32 0
  %25 = insertelement <2 x double> %24, double %call1.i.i, i32 1
  %26 = fdiv <2 x double> %19, %25
  store <2 x double> %26, <2 x double>* %4, align 8, !tbaa !18
  %div4.i.i = fdiv double %sub65.i, %call1.i.i
  store double %div4.i.i, double* %z67.i, align 8, !tbaa !22
  br label %ray_sphere_intersect.exit

ray_sphere_intersect.exit:                        ; preds = %if.then.i.i, %if.then24.i, %if.then.i, %vnormalize.exit.us
  %27 = phi i32 [ 0, %vnormalize.exit.us ], [ 0, %if.then.i ], [ 1, %if.then24.i ], [ 1, %if.then.i.i ]
  %ray.sroa.18.0.load154192 = phi double [ %ray.sroa.18.0.load156, %vnormalize.exit.us ], [ %ray.sroa.18.0.load156, %if.then.i ], [ %23, %if.then24.i ], [ %23, %if.then.i.i ]
  %28 = phi double [ 1.000000e+17, %vnormalize.exit.us ], [ 1.000000e+17, %if.then.i ], [ %sub20.i, %if.then24.i ], [ %sub20.i, %if.then.i.i ]
  %29 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 0), align 16, !tbaa !7
  %sub.i2 = fsub double 0.000000e+00, %29
  %30 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 1), align 8, !tbaa !10
  %sub6.i4 = fsub double 0.000000e+00, %30
  %31 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 2), align 16, !tbaa !12
  %sub11.i6 = fsub double 0.000000e+00, %31
  %mul.i.i13 = fmul double %sub.i2, %ray.sroa.18.0.load154192
  %mul3.i.i14 = fmul double %sub6.i4, %ray.sroa.18.8.load163
  %add.i.i15 = fadd double %mul.i.i13, %mul3.i.i14
  %mul5.i.i16 = fmul double %dir.2.val.i.us, %sub11.i6
  %add6.i.i17 = fadd double %mul5.i.i16, %add.i.i15
  %mul.i112.i18 = fmul double %sub.i2, %sub.i2
  %mul3.i113.i19 = fmul double %sub6.i4, %sub6.i4
  %add.i114.i20 = fadd double %mul.i112.i18, %mul3.i113.i19
  %mul5.i115.i21 = fmul double %sub11.i6, %sub11.i6
  %add6.i116.i22 = fadd double %add.i114.i20, %mul5.i115.i21
  %32 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 1), align 8, !tbaa !13
  %mul.i23 = fmul double %32, %32
  %sub15.i24 = fsub double %add6.i116.i22, %mul.i23
  %mul16.i25 = fmul double %add6.i.i17, %add6.i.i17
  %sub17.i26 = fsub double %mul16.i25, %sub15.i24
  %cmp.i27 = fcmp ogt double %sub17.i26, 0.000000e+00
  br i1 %cmp.i27, label %if.then.i32, label %ray_sphere_intersect.exit55

if.then.i32:                                      ; preds = %ray_sphere_intersect.exit
  %sub18.i28 = fsub double -0.000000e+00, %add6.i.i17
  %call19.i29 = tail call double @sqrt(double %sub17.i26) #3
  %sub20.i30 = fsub double %sub18.i28, %call19.i29
  %cmp21.i31 = fcmp ogt double %sub20.i30, 0.000000e+00
  %cmp23.i34 = fcmp olt double %sub20.i30, %28
  %or.cond185 = and i1 %cmp21.i31, %cmp23.i34
  br i1 %or.cond185, label %if.then24.i52, label %ray_sphere_intersect.exit55

if.then24.i52:                                    ; preds = %if.then.i32
  store double %sub20.i30, double* %t, align 8, !tbaa !14
  store i32 1, i32* %hit, align 8, !tbaa !17
  %ray.sroa.18.0.load152 = load <2 x double>* %ray.sroa.18, align 16
  %33 = insertelement <2 x double> undef, double %sub20.i30, i32 0
  %34 = insertelement <2 x double> %33, double %sub20.i30, i32 1
  %35 = fmul <2 x double> %34, %ray.sroa.18.0.load152
  %36 = fadd <2 x double> %35, zeroinitializer
  store <2 x double> %36, <2 x double>* %3, align 8, !tbaa !18
  %mul44.i38 = fmul double %dir.2.val.i.us, %sub20.i30
  %add45.i39 = fadd double %mul44.i38, 0.000000e+00
  store double %add45.i39, double* %z31.i, align 8, !tbaa !20
  %37 = load <2 x double>* bitcast (%struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1) to <2 x double>*), align 16, !tbaa !18
  %38 = fsub <2 x double> %36, %37
  store <2 x double> %38, <2 x double>* %4, align 8, !tbaa !18
  %39 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 2), align 16, !tbaa !12
  %sub65.i42 = fsub double %add45.i39, %39
  store double %sub65.i42, double* %z67.i, align 8, !tbaa !21
  %40 = extractelement <2 x double> %38, i32 0
  %mul.i.i.i44 = fmul double %40, %40
  %41 = extractelement <2 x double> %38, i32 1
  %mul3.i.i.i45 = fmul double %41, %41
  %add.i.i.i46 = fadd double %mul.i.i.i44, %mul3.i.i.i45
  %mul5.i.i.i47 = fmul double %sub65.i42, %sub65.i42
  %add6.i.i.i48 = fadd double %mul5.i.i.i47, %add.i.i.i46
  %call1.i.i49 = tail call double @sqrt(double %add6.i.i.i48) #3
  %call2.i.i50 = tail call double @fabs(double %call1.i.i49) #6
  %cmp.i.i51 = fcmp ogt double %call2.i.i50, 1.000000e-17
  %42 = extractelement <2 x double> %ray.sroa.18.0.load152, i32 0
  br i1 %cmp.i.i51, label %if.then.i.i54, label %ray_sphere_intersect.exit55

if.then.i.i54:                                    ; preds = %if.then24.i52
  %43 = insertelement <2 x double> undef, double %call1.i.i49, i32 0
  %44 = insertelement <2 x double> %43, double %call1.i.i49, i32 1
  %45 = fdiv <2 x double> %38, %44
  store <2 x double> %45, <2 x double>* %4, align 8, !tbaa !18
  %div4.i.i53 = fdiv double %sub65.i42, %call1.i.i49
  store double %div4.i.i53, double* %z67.i, align 8, !tbaa !22
  br label %ray_sphere_intersect.exit55

ray_sphere_intersect.exit55:                      ; preds = %if.then.i.i54, %if.then24.i52, %if.then.i32, %ray_sphere_intersect.exit
  %46 = phi i32 [ %27, %ray_sphere_intersect.exit ], [ %27, %if.then.i32 ], [ 1, %if.then24.i52 ], [ 1, %if.then.i.i54 ]
  %47 = phi double [ %28, %ray_sphere_intersect.exit ], [ %28, %if.then.i32 ], [ %sub20.i30, %if.then24.i52 ], [ %sub20.i30, %if.then.i.i54 ]
  %ray.sroa.18.0.load154 = phi double [ %ray.sroa.18.0.load154192, %ray_sphere_intersect.exit ], [ %ray.sroa.18.0.load154192, %if.then.i32 ], [ %42, %if.then24.i52 ], [ %42, %if.then.i.i54 ]
  %48 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 0), align 16, !tbaa !7
  %sub.i57 = fsub double 0.000000e+00, %48
  %49 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 1), align 8, !tbaa !10
  %sub6.i59 = fsub double 0.000000e+00, %49
  %50 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 2), align 16, !tbaa !12
  %sub11.i61 = fsub double 0.000000e+00, %50
  %mul.i.i68 = fmul double %sub.i57, %ray.sroa.18.0.load154
  %mul3.i.i69 = fmul double %sub6.i59, %ray.sroa.18.8.load163
  %add.i.i70 = fadd double %mul.i.i68, %mul3.i.i69
  %mul5.i.i71 = fmul double %dir.2.val.i.us, %sub11.i61
  %add6.i.i72 = fadd double %mul5.i.i71, %add.i.i70
  %mul.i112.i73 = fmul double %sub.i57, %sub.i57
  %mul3.i113.i74 = fmul double %sub6.i59, %sub6.i59
  %add.i114.i75 = fadd double %mul.i112.i73, %mul3.i113.i74
  %mul5.i115.i76 = fmul double %sub11.i61, %sub11.i61
  %add6.i116.i77 = fadd double %add.i114.i75, %mul5.i115.i76
  %51 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 1), align 8, !tbaa !13
  %mul.i78 = fmul double %51, %51
  %sub15.i79 = fsub double %add6.i116.i77, %mul.i78
  %mul16.i80 = fmul double %add6.i.i72, %add6.i.i72
  %sub17.i81 = fsub double %mul16.i80, %sub15.i79
  %cmp.i82 = fcmp ogt double %sub17.i81, 0.000000e+00
  br i1 %cmp.i82, label %if.then.i87, label %ray_sphere_intersect.exit110

if.then.i87:                                      ; preds = %ray_sphere_intersect.exit55
  %sub18.i83 = fsub double -0.000000e+00, %add6.i.i72
  %call19.i84 = tail call double @sqrt(double %sub17.i81) #3
  %sub20.i85 = fsub double %sub18.i83, %call19.i84
  %cmp21.i86 = fcmp ogt double %sub20.i85, 0.000000e+00
  %cmp23.i89 = fcmp olt double %sub20.i85, %47
  %or.cond186 = and i1 %cmp21.i86, %cmp23.i89
  br i1 %or.cond186, label %if.then24.i107, label %ray_sphere_intersect.exit110

if.then24.i107:                                   ; preds = %if.then.i87
  store double %sub20.i85, double* %t, align 8, !tbaa !14
  store i32 1, i32* %hit, align 8, !tbaa !17
  %ray.sroa.18.0.load = load <2 x double>* %ray.sroa.18, align 16
  %52 = insertelement <2 x double> undef, double %sub20.i85, i32 0
  %53 = insertelement <2 x double> %52, double %sub20.i85, i32 1
  %54 = fmul <2 x double> %53, %ray.sroa.18.0.load
  %55 = fadd <2 x double> %54, zeroinitializer
  store <2 x double> %55, <2 x double>* %3, align 8, !tbaa !18
  %mul44.i93 = fmul double %dir.2.val.i.us, %sub20.i85
  %add45.i94 = fadd double %mul44.i93, 0.000000e+00
  store double %add45.i94, double* %z31.i, align 8, !tbaa !20
  %56 = load <2 x double>* bitcast (%struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2) to <2 x double>*), align 16, !tbaa !18
  %57 = fsub <2 x double> %55, %56
  store <2 x double> %57, <2 x double>* %4, align 8, !tbaa !18
  %58 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 2), align 16, !tbaa !12
  %sub65.i97 = fsub double %add45.i94, %58
  store double %sub65.i97, double* %z67.i, align 8, !tbaa !21
  %59 = extractelement <2 x double> %57, i32 0
  %mul.i.i.i99 = fmul double %59, %59
  %60 = extractelement <2 x double> %57, i32 1
  %mul3.i.i.i100 = fmul double %60, %60
  %add.i.i.i101 = fadd double %mul.i.i.i99, %mul3.i.i.i100
  %mul5.i.i.i102 = fmul double %sub65.i97, %sub65.i97
  %add6.i.i.i103 = fadd double %mul5.i.i.i102, %add.i.i.i101
  %call1.i.i104 = tail call double @sqrt(double %add6.i.i.i103) #3
  %call2.i.i105 = tail call double @fabs(double %call1.i.i104) #6
  %cmp.i.i106 = fcmp ogt double %call2.i.i105, 1.000000e-17
  br i1 %cmp.i.i106, label %if.then.i.i109, label %ray_sphere_intersect.exit110

if.then.i.i109:                                   ; preds = %if.then24.i107
  %61 = insertelement <2 x double> undef, double %call1.i.i104, i32 0
  %62 = insertelement <2 x double> %61, double %call1.i.i104, i32 1
  %63 = fdiv <2 x double> %57, %62
  store <2 x double> %63, <2 x double>* %4, align 8, !tbaa !18
  %div4.i.i108 = fdiv double %sub65.i97, %call1.i.i104
  store double %div4.i.i108, double* %z67.i, align 8, !tbaa !22
  br label %ray_sphere_intersect.exit110

ray_sphere_intersect.exit110:                     ; preds = %if.then.i.i109, %if.then24.i107, %if.then.i87, %ray_sphere_intersect.exit55
  %64 = phi double [ %47, %ray_sphere_intersect.exit55 ], [ %47, %if.then.i87 ], [ %sub20.i85, %if.then24.i107 ], [ %sub20.i85, %if.then.i.i109 ]
  %65 = phi i32 [ %46, %ray_sphere_intersect.exit55 ], [ %46, %if.then.i87 ], [ 1, %if.then24.i107 ], [ 1, %if.then.i.i109 ]
  %n.061.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 0), align 8
  %n.162.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8
  %n.263.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8
  %mul.i69.i.us = fmul double %ray.sroa.18.0.load156, %n.061.val.i.us
  %mul3.i70.i.us = fmul double %ray.sroa.18.8.load163, %n.162.val.i.us
  %add.i71.i.us = fadd double %mul.i69.i.us, %mul3.i70.i.us
  %mul5.i72.i.us = fmul double %dir.2.val.i.us, %n.263.val.i.us
  %add6.i73.i.us = fadd double %add.i71.i.us, %mul5.i72.i.us
  %call3.i.us = tail call double @fabs(double %add6.i73.i.us) #6
  %cmp.i222.us = fcmp olt double %call3.i.us, 1.000000e-17
  br i1 %cmp.i222.us, label %ray_plane_intersect.exit.us, label %if.end.i.us

if.end.i.us:                                      ; preds = %ray_sphere_intersect.exit110
  %p.1.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 1), align 8
  %p.0.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 0), align 8
  %mul3.i.i223.us = fmul double %n.162.val.i.us, %p.1.val.i.us
  %mul.i.i224.us = fmul double %n.061.val.i.us, %p.0.val.i.us
  %p.2.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 2), align 8
  %mul5.i.i225.us = fmul double %n.263.val.i.us, %p.2.val.i.us
  %add.i.i226.us = fadd double %mul3.i.i223.us, %mul.i.i224.us
  %add6.i.i227.us = fadd double %add.i.i226.us, %mul5.i.i225.us
  %mul.i64.i.us = fmul double %n.061.val.i.us, 0.000000e+00
  %mul3.i65.i.us = fmul double %n.162.val.i.us, 0.000000e+00
  %add.i66.i.us = fadd double %mul.i64.i.us, %mul3.i65.i.us
  %mul5.i67.i.us = fmul double %n.263.val.i.us, 0.000000e+00
  %add6.i68.i.us = fadd double %add.i66.i.us, %mul5.i67.i.us
  %add.i.us = fsub double %add6.i68.i.us, %add6.i.i227.us
  %sub6.i.us = fsub double -0.000000e+00, %add.i.us
  %div.i228.us = fdiv double %sub6.i.us, %add6.i73.i.us
  %cmp7.i.us = fcmp ogt double %div.i228.us, 0.000000e+00
  %cmp9.i.us = fcmp olt double %div.i228.us, %64
  %or.cond.us = and i1 %cmp7.i.us, %cmp9.i.us
  br i1 %or.cond.us, label %ray_plane_intersect.exit.us.thread, label %ray_plane_intersect.exit.us

ray_plane_intersect.exit.us.thread:               ; preds = %if.end.i.us
  store double %div.i228.us, double* %t, align 8, !tbaa !14
  store i32 1, i32* %hit, align 8, !tbaa !17
  %mul.i.us = fmul double %ray.sroa.18.0.load156, %div.i228.us
  %add15.i.us = fadd double %mul.i.us, 0.000000e+00
  store double %add15.i.us, double* %x17.i, align 8, !tbaa !26
  %mul21.i.us = fmul double %ray.sroa.18.8.load163, %div.i228.us
  %add22.i.us = fadd double %mul21.i.us, 0.000000e+00
  store double %add22.i.us, double* %y24.i, align 8, !tbaa !27
  %mul28.i.us = fmul double %dir.2.val.i.us, %div.i228.us
  %add29.i.us = fadd double %mul28.i.us, 0.000000e+00
  store double %add29.i.us, double* %z31.i, align 8, !tbaa !20
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct._vec* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1) to i8*), i64 24, i32 8, i1 false) #3, !tbaa.struct !23
  br label %if.then.us

ray_plane_intersect.exit.us:                      ; preds = %if.end.i.us, %ray_sphere_intersect.exit110
  %tobool.us = icmp eq i32 %65, 0
  br i1 %tobool.us, label %if.end.us, label %if.then.us

if.then.us:                                       ; preds = %ray_plane_intersect.exit.us, %ray_plane_intersect.exit.us.thread
  call void @ambient_occlusion(%struct._vec* %col, %struct._Isect* %isect)
  %66 = load double* %x53, align 8, !tbaa !24
  %67 = load double* %arrayidx, align 8, !tbaa !18
  %add58.us = fadd double %66, %67
  store double %add58.us, double* %arrayidx, align 8, !tbaa !18
  %68 = load double* %y59, align 8, !tbaa !25
  %69 = load double* %arrayidx65, align 8, !tbaa !18
  %add66.us = fadd double %68, %69
  store double %add66.us, double* %arrayidx65, align 8, !tbaa !18
  %70 = load double* %z67, align 8, !tbaa !22
  %71 = load double* %arrayidx73, align 8, !tbaa !18
  %add74.us = fadd double %70, %71
  store double %add74.us, double* %arrayidx73, align 8, !tbaa !18
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %ray_plane_intersect.exit.us
  call void @llvm.lifetime.end(i64 64, i8* %1) #3
  call void @llvm.lifetime.end(i64 16, i8* %ray.sroa.18.0.cast161)
  %inc.us = add nsw i32 %u.0244.us, 1
  %exitcond = icmp eq i32 %inc.us, %nsubsamples
  br i1 %exitcond, label %for.inc75.us, label %for.body21.us

for.body21.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond18.preheader.lr.ph.split.us
  %v.0246.us = phi i32 [ 0, %for.cond18.preheader.lr.ph.split.us ], [ %inc76.us, %for.inc75.us ]
  %conv31.us = sitofp i32 %v.0246.us to double
  %div33.us = fdiv double %conv31.us, %conv24
  %add34.us = fadd double %conv30, %div33.us
  %sub37.us = fsub double %add34.us, %div36
  %sub38.us = fsub double -0.000000e+00, %sub37.us
  %div41.us = fdiv double %sub38.us, %div36
  %mul3.i.i.us = fmul double %div41.us, %div41.us
  br label %for.body21.us

for.end77:                                        ; preds = %for.inc75.us, %for.cond14.preheader.for.end77_crit_edge
  %arrayidx103.pre-phi = phi double* [ %arrayidx103.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %arrayidx73, %for.inc75.us ]
  %idxprom102.pre-phi = phi i64 [ %idxprom102.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %idxprom72, %for.inc75.us ]
  %arrayidx94.pre-phi = phi double* [ %arrayidx94.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %arrayidx65, %for.inc75.us ]
  %idxprom93.pre-phi = phi i64 [ %idxprom93.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %idxprom64, %for.inc75.us ]
  %arrayidx85.pre-phi = phi double* [ %arrayidx85.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %arrayidx, %for.inc75.us ]
  %idxprom84.pre-phi = phi i64 [ %idxprom84.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %idxprom, %for.inc75.us ]
  %72 = load double* %arrayidx85.pre-phi, align 8, !tbaa !18
  %div86 = fdiv double %72, %conv79
  store double %div86, double* %arrayidx85.pre-phi, align 8, !tbaa !18
  %73 = load double* %arrayidx94.pre-phi, align 8, !tbaa !18
  %div95 = fdiv double %73, %conv79
  store double %div95, double* %arrayidx94.pre-phi, align 8, !tbaa !18
  %74 = load double* %arrayidx103.pre-phi, align 8, !tbaa !18
  %div104 = fdiv double %74, %conv79
  store double %div104, double* %arrayidx103.pre-phi, align 8, !tbaa !18
  %mul.i229 = fmul double %div86, 2.555000e+02
  %conv.i = fptosi double %mul.i229 to i32
  %cmp.i230 = icmp slt i32 %conv.i, 0
  %.conv.i = select i1 %cmp.i230, i32 0, i32 %conv.i
  %cmp2.i = icmp sgt i32 %.conv.i, 255
  %75 = trunc i32 %.conv.i to i8
  %conv6.i = select i1 %cmp2.i, i8 -1, i8 %75
  %arrayidx117 = getelementptr inbounds i8* %img, i64 %idxprom84.pre-phi
  store i8 %conv6.i, i8* %arrayidx117, align 1, !tbaa !28
  %mul.i231 = fmul double %div95, 2.555000e+02
  %conv.i232 = fptosi double %mul.i231 to i32
  %cmp.i233 = icmp slt i32 %conv.i232, 0
  %.conv.i234 = select i1 %cmp.i233, i32 0, i32 %conv.i232
  %cmp2.i235 = icmp sgt i32 %.conv.i234, 255
  %76 = trunc i32 %.conv.i234 to i8
  %conv6.i236 = select i1 %cmp2.i235, i8 -1, i8 %76
  %arrayidx130 = getelementptr inbounds i8* %img, i64 %idxprom93.pre-phi
  store i8 %conv6.i236, i8* %arrayidx130, align 1, !tbaa !28
  %mul.i237 = fmul double %div104, 2.555000e+02
  %conv.i238 = fptosi double %mul.i237 to i32
  %cmp.i239 = icmp slt i32 %conv.i238, 0
  %.conv.i240 = select i1 %cmp.i239, i32 0, i32 %conv.i238
  %cmp2.i241 = icmp sgt i32 %.conv.i240, 255
  %77 = trunc i32 %.conv.i240 to i8
  %conv6.i242 = select i1 %cmp2.i241, i8 -1, i8 %77
  %arrayidx143 = getelementptr inbounds i8* %img, i64 %idxprom102.pre-phi
  store i8 %conv6.i242, i8* %arrayidx143, align 1, !tbaa !28
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv187 = trunc i64 %indvars.iv.next to i32
  %exitcond188 = icmp eq i32 %lftr.wideiv187, %w
  br i1 %exitcond188, label %for.inc147, label %for.cond14.preheader

for.inc147:                                       ; preds = %for.end77, %for.cond10.preheader
  %indvars.iv.next256 = add nuw nsw i64 %indvars.iv255, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next256 to i32
  %exitcond189 = icmp eq i32 %lftr.wideiv, %h
  br i1 %exitcond189, label %for.end149, label %for.cond10.preheader

for.end149:                                       ; preds = %for.inc147, %entry
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define void @init_scene() #0 {
entry:
  store double -2.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 0), align 16, !tbaa !7
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 1), align 8, !tbaa !10
  store double -3.500000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 2), align 16, !tbaa !12
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 1), align 8, !tbaa !13
  store double -5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 0), align 16, !tbaa !7
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 1), align 8, !tbaa !10
  store double -3.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 2), align 16, !tbaa !12
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 1), align 8, !tbaa !13
  store double 1.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 0), align 16, !tbaa !7
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 1), align 8, !tbaa !10
  store double -2.200000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 2), align 16, !tbaa !12
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 1), align 8, !tbaa !13
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 0), align 8, !tbaa !29
  store double -5.000000e-01, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 1), align 8, !tbaa !31
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 2) to i8*), i8 0, i64 16, i32 8, i1 false)
  store double 1.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8, !tbaa !32
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8, !tbaa !33
  ret void
}

; Function Attrs: nounwind uwtable
define void @saveppm(i8* nocapture readonly %fname, i32 %w, i32 %h, i8* nocapture %img) #0 {
entry:
  %call = tail call %struct._IO_FILE* @fopen(i8* %fname, i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0)) #3
  %tobool = icmp eq %struct._IO_FILE* %call, null
  br i1 %tobool, label %cond.false, label %cond.end

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0), i32 326, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.saveppm, i64 0, i64 0)) #7
  unreachable

cond.end:                                         ; preds = %entry
  %0 = tail call i64 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i64 3, i64 1, %struct._IO_FILE* %call) #3
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([7 x i8]* @.str4, i64 0, i64 0), i32 %w, i32 %h) #3
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8]* @.str5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %call) #3
  %mul = mul i32 %w, 3
  %mul4 = mul i32 %mul, %h
  %conv = sext i32 %mul4 to i64
  %call5 = tail call i64 @fwrite(i8* %img, i64 %conv, i64 1, %struct._IO_FILE* %call) #3
  %call6 = tail call i32 @fclose(%struct._IO_FILE* %call) #3
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  %ts = alloca %struct.timespec, align 8
  %call = call noalias i8* @malloc(i64 786432) #3
  store double -2.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 0), align 16, !tbaa !7
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 1), align 8, !tbaa !10
  store double -3.500000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 0, i32 2), align 16, !tbaa !12
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0, i32 1), align 8, !tbaa !13
  store double -5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 0), align 16, !tbaa !7
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 1), align 8, !tbaa !10
  store double -3.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 0, i32 2), align 16, !tbaa !12
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1, i32 1), align 8, !tbaa !13
  store double 1.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 0), align 16, !tbaa !7
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 1), align 8, !tbaa !10
  store double -2.200000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 0, i32 2), align 16, !tbaa !12
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2, i32 1), align 8, !tbaa !13
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 0), align 8, !tbaa !29
  store double -5.000000e-01, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 1), align 8, !tbaa !31
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 2) to i8*), i8 0, i64 16, i32 8, i1 false) #3
  store double 1.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8, !tbaa !32
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8, !tbaa !33
  %call1 = call i32 @clock_gettime(i32 1, %struct.timespec* %ts) #3
  %tv_sec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 0
  %0 = load i64* %tv_sec, align 8, !tbaa !34
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !37
  call void @render(i8* %call, i32 512, i32 512, i32 4)
  %call2 = call i32 @clock_gettime(i32 1, %struct.timespec* %ts) #3
  %2 = load i64* %tv_sec, align 8, !tbaa !34
  %3 = load i64* %tv_nsec, align 8, !tbaa !37
  %div6 = sdiv i64 %3, 1000
  call void @saveppm(i8* getelementptr inbounds ([7 x i8]* @.str6, i64 0, i64 0), i32 512, i32 512, i8* %call)
  %div.neg = sdiv i64 %1, -1000
  %tmp = sub i64 %2, %0
  %tmp1 = mul i64 %tmp, 1000000
  %add7 = add i64 %div.neg, %div6
  %sub = add i64 %add7, %tmp1
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i64 %sub) #3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @clock_gettime(i32, %struct.timespec*) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !4, i64 0}
!2 = metadata !{metadata !"_Ray", metadata !3, i64 0, metadata !3, i64 24}
!3 = metadata !{metadata !"_vec", metadata !4, i64 0, metadata !4, i64 8, metadata !4, i64 16}
!4 = metadata !{metadata !"double", metadata !5, i64 0}
!5 = metadata !{metadata !"omnipotent char", metadata !6, i64 0}
!6 = metadata !{metadata !"Simple C/C++ TBAA"}
!7 = metadata !{metadata !8, metadata !4, i64 0}
!8 = metadata !{metadata !"_Sphere", metadata !3, i64 0, metadata !4, i64 24}
!9 = metadata !{metadata !2, metadata !4, i64 8}
!10 = metadata !{metadata !8, metadata !4, i64 8}
!11 = metadata !{metadata !2, metadata !4, i64 16}
!12 = metadata !{metadata !8, metadata !4, i64 16}
!13 = metadata !{metadata !8, metadata !4, i64 24}
!14 = metadata !{metadata !15, metadata !4, i64 0}
!15 = metadata !{metadata !"_Isect", metadata !4, i64 0, metadata !3, i64 8, metadata !3, i64 32, metadata !16, i64 56}
!16 = metadata !{metadata !"int", metadata !5, i64 0}
!17 = metadata !{metadata !15, metadata !16, i64 56}
!18 = metadata !{metadata !4, metadata !4, i64 0}
!19 = metadata !{metadata !2, metadata !4, i64 40}
!20 = metadata !{metadata !15, metadata !4, i64 24}
!21 = metadata !{metadata !15, metadata !4, i64 48}
!22 = metadata !{metadata !3, metadata !4, i64 16}
!23 = metadata !{i64 0, i64 8, metadata !18, i64 8, i64 8, metadata !18, i64 16, i64 8, metadata !18}
!24 = metadata !{metadata !3, metadata !4, i64 0}
!25 = metadata !{metadata !3, metadata !4, i64 8}
!26 = metadata !{metadata !15, metadata !4, i64 8}
!27 = metadata !{metadata !15, metadata !4, i64 16}
!28 = metadata !{metadata !5, metadata !5, i64 0}
!29 = metadata !{metadata !30, metadata !4, i64 0}
!30 = metadata !{metadata !"_Plane", metadata !3, i64 0, metadata !3, i64 24}
!31 = metadata !{metadata !30, metadata !4, i64 8}
!32 = metadata !{metadata !30, metadata !4, i64 32}
!33 = metadata !{metadata !30, metadata !4, i64 40}
!34 = metadata !{metadata !35, metadata !36, i64 0}
!35 = metadata !{metadata !"timespec", metadata !36, i64 0, metadata !36, i64 8}
!36 = metadata !{metadata !"long", metadata !5, i64 0}
!37 = metadata !{metadata !35, metadata !36, i64 8}
