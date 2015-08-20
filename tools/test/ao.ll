; ModuleID = 'ao.bc'
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
  %8 = load double* %x, align 8, !tbaa !1
  %9 = load double* %dir.0, align 8, !tbaa !18
  %mul30 = fmul double %sub20, %9
  %add = fadd double %8, %mul30
  %x31 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  store double %add, double* %x31, align 8, !tbaa !19
  %10 = load double* %y, align 8, !tbaa !9
  %11 = load double* %dir.1, align 8, !tbaa !20
  %mul36 = fmul double %sub20, %11
  %add37 = fadd double %10, %mul36
  %y39 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 1
  store double %add37, double* %y39, align 8, !tbaa !21
  %12 = load double* %z, align 8, !tbaa !11
  %13 = load double* %dir.2, align 8, !tbaa !22
  %mul44 = fmul double %sub20, %13
  %add45 = fadd double %12, %mul44
  %z47 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  store double %add45, double* %z47, align 8, !tbaa !23
  %14 = load double* %x1, align 8, !tbaa !7
  %sub52 = fsub double %add, %14
  %x53 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 0
  store double %sub52, double* %x53, align 8, !tbaa !24
  %15 = load double* %y5, align 8, !tbaa !10
  %sub58 = fsub double %add37, %15
  %y60 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 1
  store double %sub58, double* %y60, align 8, !tbaa !25
  %16 = load double* %z10, align 8, !tbaa !12
  %sub65 = fsub double %add45, %16
  %z67 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 2
  store double %sub65, double* %z67, align 8, !tbaa !26
  %mul.i.i = fmul double %sub52, %sub52
  %mul3.i.i = fmul double %sub58, %sub58
  %add.i.i = fadd double %mul.i.i, %mul3.i.i
  %mul5.i.i = fmul double %sub65, %sub65
  %add6.i.i = fadd double %mul5.i.i, %add.i.i
  %call1.i = tail call double @sqrt(double %add6.i.i) #3
  %call2.i = tail call double @fabs(double %call1.i) #6
  %cmp.i = fcmp ogt double %call2.i, 1.000000e-17
  br i1 %cmp.i, label %if.then.i, label %if.end69

if.then.i:                                        ; preds = %if.then24
  %17 = load double* %x53, align 8, !tbaa !27
  %div.i = fdiv double %17, %call1.i
  store double %div.i, double* %x53, align 8, !tbaa !27
  %18 = load double* %y60, align 8, !tbaa !28
  %div3.i = fdiv double %18, %call1.i
  store double %div3.i, double* %y60, align 8, !tbaa !28
  %19 = load double* %z67, align 8, !tbaa !29
  %div4.i = fdiv double %19, %call1.i
  store double %div4.i, double* %z67, align 8, !tbaa !29
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
  %dir.0.val = load double* %dir.0, align 8
  %dir.1 = getelementptr %struct._Ray* %ray, i64 0, i32 1, i32 1
  %dir.1.val = load double* %dir.1, align 8
  %dir.2 = getelementptr %struct._Ray* %ray, i64 0, i32 1, i32 2
  %dir.2.val = load double* %dir.2, align 8
  %mul.i69 = fmul double %n.061.val, %dir.0.val
  %mul3.i70 = fmul double %n.162.val, %dir.1.val
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
  %org.0 = getelementptr %struct._Ray* %ray, i64 0, i32 0, i32 0
  %org.0.val = load double* %org.0, align 8
  %org.1 = getelementptr %struct._Ray* %ray, i64 0, i32 0, i32 1
  %org.1.val = load double* %org.1, align 8
  %org.2 = getelementptr %struct._Ray* %ray, i64 0, i32 0, i32 2
  %org.2.val = load double* %org.2, align 8
  %mul.i64 = fmul double %n.061.val, %org.0.val
  %mul3.i65 = fmul double %n.162.val, %org.1.val
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
  %0 = load double* %t8, align 8, !tbaa !14
  %cmp9 = fcmp olt double %div, %0
  br i1 %cmp9, label %if.then10, label %if.end34

if.then10:                                        ; preds = %land.lhs.true
  store double %div, double* %t8, align 8, !tbaa !14
  %hit = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 3
  store i32 1, i32* %hit, align 4, !tbaa !17
  %mul = fmul double %div, %dir.0.val
  %add15 = fadd double %org.0.val, %mul
  %x17 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  store double %add15, double* %x17, align 8, !tbaa !19
  %mul21 = fmul double %div, %dir.1.val
  %add22 = fadd double %org.1.val, %mul21
  %y24 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 1
  store double %add22, double* %y24, align 8, !tbaa !21
  %mul28 = fmul double %div, %dir.2.val
  %add29 = fadd double %org.2.val, %mul28
  %z31 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  store double %add29, double* %z31, align 8, !tbaa !23
  %n32 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2
  %1 = bitcast %struct._vec* %n32 to i8*
  %2 = bitcast %struct._vec* %n to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 24, i32 8, i1 false), !tbaa.struct !30
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
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 8, i1 false), !tbaa.struct !30
  %x = getelementptr inbounds %struct._vec* %basis, i64 1, i32 0
  %y = getelementptr inbounds %struct._vec* %basis, i64 1, i32 1
  %z = getelementptr inbounds %struct._vec* %basis, i64 1, i32 2
  %x4 = getelementptr inbounds %struct._vec* %n, i64 0, i32 0
  %2 = bitcast double* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 8, i1 false)
  %3 = load double* %x4, align 8, !tbaa !27
  %cmp = fcmp olt double %3, 6.000000e-01
  %cmp6 = fcmp ogt double %3, -6.000000e-01
  %or.cond = and i1 %cmp, %cmp6
  br i1 %or.cond, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store double 1.000000e+00, double* %x, align 8, !tbaa !27
  br label %if.end30

if.else:                                          ; preds = %entry
  %y9 = getelementptr inbounds %struct._vec* %n, i64 0, i32 1
  %4 = load double* %y9, align 8, !tbaa !28
  %cmp10 = fcmp olt double %4, 6.000000e-01
  %cmp13 = fcmp ogt double %4, -6.000000e-01
  %or.cond54 = and i1 %cmp10, %cmp13
  br i1 %or.cond54, label %if.then14, label %if.else17

if.then14:                                        ; preds = %if.else
  store double 1.000000e+00, double* %y, align 8, !tbaa !28
  br label %if.end30

if.else17:                                        ; preds = %if.else
  %z18 = getelementptr inbounds %struct._vec* %n, i64 0, i32 2
  %5 = load double* %z18, align 8, !tbaa !29
  %cmp19 = fcmp olt double %5, 6.000000e-01
  %cmp22 = fcmp ogt double %5, -6.000000e-01
  %or.cond55 = and i1 %cmp19, %cmp22
  br i1 %or.cond55, label %if.then23, label %if.else26

if.then23:                                        ; preds = %if.else17
  store double 1.000000e+00, double* %z, align 8, !tbaa !29
  br label %if.end30

if.else26:                                        ; preds = %if.else17
  store double 1.000000e+00, double* %x, align 8, !tbaa !27
  br label %if.end30

if.end30:                                         ; preds = %if.else26, %if.then23, %if.then14, %if.then
  %arrayidx1.2.val = phi double [ 0.000000e+00, %if.then14 ], [ 0.000000e+00, %if.else26 ], [ 1.000000e+00, %if.then23 ], [ 0.000000e+00, %if.then ]
  %arrayidx1.1.val = phi double [ 1.000000e+00, %if.then14 ], [ 0.000000e+00, %if.else26 ], [ 0.000000e+00, %if.then23 ], [ 0.000000e+00, %if.then ]
  %arrayidx1.0.val = phi double [ 0.000000e+00, %if.then14 ], [ 1.000000e+00, %if.else26 ], [ 0.000000e+00, %if.then23 ], [ 1.000000e+00, %if.then ]
  %arrayidx.056 = getelementptr %struct._vec* %arrayidx, i64 0, i32 0
  %arrayidx.056.val = load double* %arrayidx.056, align 8
  %arrayidx.157 = getelementptr %struct._vec* %basis, i64 2, i32 1
  %arrayidx.157.val = load double* %arrayidx.157, align 8
  %arrayidx.258 = getelementptr %struct._vec* %basis, i64 2, i32 2
  %arrayidx.258.val = load double* %arrayidx.258, align 8
  %mul.i = fmul double %arrayidx1.1.val, %arrayidx.258.val
  %mul3.i = fmul double %arrayidx1.2.val, %arrayidx.157.val
  %sub.i = fsub double %mul.i, %mul3.i
  %x.i = getelementptr inbounds %struct._vec* %basis, i64 0, i32 0
  store double %sub.i, double* %x.i, align 8, !tbaa !27
  %mul6.i = fmul double %arrayidx1.2.val, %arrayidx.056.val
  %mul9.i = fmul double %arrayidx1.0.val, %arrayidx.258.val
  %sub10.i = fsub double %mul6.i, %mul9.i
  %y11.i = getelementptr inbounds %struct._vec* %basis, i64 0, i32 1
  store double %sub10.i, double* %y11.i, align 8, !tbaa !28
  %mul14.i = fmul double %arrayidx1.0.val, %arrayidx.157.val
  %mul17.i = fmul double %arrayidx1.1.val, %arrayidx.056.val
  %sub18.i = fsub double %mul14.i, %mul17.i
  %z19.i = getelementptr inbounds %struct._vec* %basis, i64 0, i32 2
  store double %sub18.i, double* %z19.i, align 8, !tbaa !29
  %mul.i.i65 = fmul double %sub.i, %sub.i
  %mul3.i.i66 = fmul double %sub10.i, %sub10.i
  %add.i.i67 = fadd double %mul.i.i65, %mul3.i.i66
  %mul5.i.i68 = fmul double %sub18.i, %sub18.i
  %add6.i.i69 = fadd double %mul5.i.i68, %add.i.i67
  %call1.i70 = tail call double @sqrt(double %add6.i.i69) #3
  %call2.i71 = tail call double @fabs(double %call1.i70) #6
  %cmp.i72 = fcmp ogt double %call2.i71, 1.000000e-17
  %6 = load double* %x.i, align 8, !tbaa !27
  br i1 %cmp.i72, label %if.then.i76, label %if.end30.vnormalize.exit77_crit_edge

if.end30.vnormalize.exit77_crit_edge:             ; preds = %if.end30
  %basis.1.val.pre = load double* %y11.i, align 8
  %basis.2.val.pre = load double* %z19.i, align 8
  br label %vnormalize.exit77

if.then.i76:                                      ; preds = %if.end30
  %div.i73 = fdiv double %6, %call1.i70
  store double %div.i73, double* %x.i, align 8, !tbaa !27
  %7 = load double* %y11.i, align 8, !tbaa !28
  %div3.i74 = fdiv double %7, %call1.i70
  store double %div3.i74, double* %y11.i, align 8, !tbaa !28
  %8 = load double* %z19.i, align 8, !tbaa !29
  %div4.i75 = fdiv double %8, %call1.i70
  store double %div4.i75, double* %z19.i, align 8, !tbaa !29
  br label %vnormalize.exit77

vnormalize.exit77:                                ; preds = %if.then.i76, %if.end30.vnormalize.exit77_crit_edge
  %basis.2.val = phi double [ %basis.2.val.pre, %if.end30.vnormalize.exit77_crit_edge ], [ %div4.i75, %if.then.i76 ]
  %basis.1.val = phi double [ %basis.1.val.pre, %if.end30.vnormalize.exit77_crit_edge ], [ %div3.i74, %if.then.i76 ]
  %basis.0.val = phi double [ %6, %if.end30.vnormalize.exit77_crit_edge ], [ %div.i73, %if.then.i76 ]
  %arrayidx.0.val = load double* %arrayidx.056, align 8
  %arrayidx.1.val = load double* %arrayidx.157, align 8
  %arrayidx.2.val = load double* %arrayidx.258, align 8
  %mul.i78 = fmul double %arrayidx.1.val, %basis.2.val
  %mul3.i79 = fmul double %arrayidx.2.val, %basis.1.val
  %sub.i80 = fsub double %mul.i78, %mul3.i79
  store double %sub.i80, double* %x, align 8, !tbaa !27
  %mul6.i82 = fmul double %arrayidx.2.val, %basis.0.val
  %mul9.i83 = fmul double %arrayidx.0.val, %basis.2.val
  %sub10.i84 = fsub double %mul6.i82, %mul9.i83
  store double %sub10.i84, double* %y, align 8, !tbaa !28
  %mul14.i86 = fmul double %arrayidx.0.val, %basis.1.val
  %mul17.i87 = fmul double %arrayidx.1.val, %basis.0.val
  %sub18.i88 = fsub double %mul14.i86, %mul17.i87
  store double %sub18.i88, double* %z, align 8, !tbaa !29
  %mul.i.i = fmul double %sub.i80, %sub.i80
  %mul3.i.i = fmul double %sub10.i84, %sub10.i84
  %add.i.i = fadd double %mul.i.i, %mul3.i.i
  %mul5.i.i = fmul double %sub18.i88, %sub18.i88
  %add6.i.i = fadd double %mul5.i.i, %add.i.i
  %call1.i = tail call double @sqrt(double %add6.i.i) #3
  %call2.i = tail call double @fabs(double %call1.i) #6
  %cmp.i = fcmp ogt double %call2.i, 1.000000e-17
  br i1 %cmp.i, label %if.then.i, label %vnormalize.exit

if.then.i:                                        ; preds = %vnormalize.exit77
  %9 = load double* %x, align 8, !tbaa !27
  %div.i = fdiv double %9, %call1.i
  store double %div.i, double* %x, align 8, !tbaa !27
  %10 = load double* %y, align 8, !tbaa !28
  %div3.i = fdiv double %10, %call1.i
  store double %div3.i, double* %y, align 8, !tbaa !28
  %11 = load double* %z, align 8, !tbaa !29
  %div4.i = fdiv double %11, %call1.i
  store double %div4.i, double* %z, align 8, !tbaa !29
  br label %vnormalize.exit

vnormalize.exit:                                  ; preds = %if.then.i, %vnormalize.exit77
  ret void
}

; Function Attrs: nounwind uwtable
define void @ambient_occlusion(%struct._vec* nocapture %col, %struct._Isect* nocapture readonly %isect) #0 {
entry:
  %basis = alloca [3 x %struct._vec], align 16
  %ray = alloca %struct._Ray, align 8
  %occIsect = alloca %struct._Isect, align 8
  %x = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  %0 = load double* %x, align 8, !tbaa !19
  %n = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2
  %x2 = getelementptr inbounds %struct._vec* %n, i64 0, i32 0
  %1 = load double* %x2, align 8, !tbaa !24
  %mul = fmul double %1, 1.000000e-04
  %add = fadd double %0, %mul
  %y = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 1
  %2 = load double* %y, align 8, !tbaa !21
  %y6 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 1
  %3 = load double* %y6, align 8, !tbaa !25
  %mul7 = fmul double %3, 1.000000e-04
  %add8 = fadd double %2, %mul7
  %z = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  %4 = load double* %z, align 8, !tbaa !23
  %z12 = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2, i32 2
  %5 = load double* %z12, align 8, !tbaa !26
  %mul13 = fmul double %5, 1.000000e-04
  %add14 = fadd double %4, %mul13
  %6 = bitcast [3 x %struct._vec]* %basis to i8*
  call void @llvm.lifetime.start(i64 72, i8* %6) #3
  %arraydecay = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 0
  call void @orthoBasis(%struct._vec* %arraydecay, %struct._vec* byval align 8 %n)
  %x32 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 0, i32 0
  %7 = load double* %x32, align 16, !tbaa !27
  %x35 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 1, i32 0
  %8 = load double* %x35, align 8, !tbaa !27
  %x39 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 2, i32 0
  %9 = load double* %x39, align 16, !tbaa !27
  %y43 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 0, i32 1
  %10 = load double* %y43, align 8, !tbaa !28
  %y46 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 1, i32 1
  %11 = load double* %y46, align 8, !tbaa !28
  %y50 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 2, i32 1
  %12 = load double* %y50, align 8, !tbaa !28
  %z54 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 0, i32 2
  %13 = load double* %z54, align 16, !tbaa !29
  %z57 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 1, i32 2
  %14 = load double* %z57, align 8, !tbaa !29
  %z61 = getelementptr inbounds [3 x %struct._vec]* %basis, i64 0, i64 2, i32 2
  %15 = load double* %z61, align 16, !tbaa !29
  %16 = bitcast %struct._Ray* %ray to i8*
  %p.sroa.0.0.idx = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 0, i32 0
  %p.sroa.2.0.idx95 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 0, i32 1
  %p.sroa.3.0.idx96 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 0, i32 2
  %x64 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 1, i32 0
  %y66 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 1, i32 1
  %z68 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 1, i32 2
  %17 = bitcast %struct._Isect* %occIsect to i8*
  %t = getelementptr inbounds %struct._Isect* %occIsect, i64 0, i32 0
  %hit = getelementptr inbounds %struct._Isect* %occIsect, i64 0, i32 3
  %x17.i = getelementptr inbounds %struct._Isect* %occIsect, i64 0, i32 1, i32 0
  %y24.i = getelementptr inbounds %struct._Isect* %occIsect, i64 0, i32 1, i32 1
  %z31.i = getelementptr inbounds %struct._Isect* %occIsect, i64 0, i32 1, i32 2
  %n32.i = getelementptr inbounds %struct._Isect* %occIsect, i64 0, i32 2
  %18 = bitcast %struct._vec* %n32.i to i8*
  br label %for.cond17.preheader

for.cond17.preheader:                             ; preds = %for.inc71, %entry
  %j.0116 = phi i32 [ 0, %entry ], [ %inc72, %for.inc71 ]
  %occlusion.0115 = phi double [ 0.000000e+00, %entry ], [ %occlusion.2, %for.inc71 ]
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
  %mul33 = fmul double %mul25, %7
  %mul36 = fmul double %mul28, %8
  %add37 = fadd double %mul33, %mul36
  %mul40 = fmul double %call31, %9
  %add41 = fadd double %add37, %mul40
  %mul44 = fmul double %mul25, %10
  %mul47 = fmul double %mul28, %11
  %add48 = fadd double %mul44, %mul47
  %mul51 = fmul double %call31, %12
  %add52 = fadd double %add48, %mul51
  %mul55 = fmul double %mul25, %13
  %mul58 = fmul double %mul28, %14
  %add59 = fadd double %mul55, %mul58
  %mul62 = fmul double %call31, %15
  %add63 = fadd double %add59, %mul62
  call void @llvm.lifetime.start(i64 48, i8* %16) #3
  store double %add, double* %p.sroa.0.0.idx, align 8
  store double %add8, double* %p.sroa.2.0.idx95, align 8
  store double %add14, double* %p.sroa.3.0.idx96, align 8
  store double %add41, double* %x64, align 8, !tbaa !18
  store double %add52, double* %y66, align 8, !tbaa !20
  store double %add63, double* %z68, align 8, !tbaa !22
  call void @llvm.lifetime.start(i64 64, i8* %17) #3
  store double 1.000000e+17, double* %t, align 8, !tbaa !14
  store i32 0, i32* %hit, align 8, !tbaa !17
  call void @ray_sphere_intersect(%struct._Isect* %occIsect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0))
  call void @ray_sphere_intersect(%struct._Isect* %occIsect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1))
  call void @ray_sphere_intersect(%struct._Isect* %occIsect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2))
  %n.061.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 0), align 8
  %n.162.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8
  %n.263.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8
  %mul.i69.i = fmul double %n.061.val.i, %add41
  %mul3.i70.i = fmul double %n.162.val.i, %add52
  %add.i71.i = fadd double %mul.i69.i, %mul3.i70.i
  %mul5.i72.i = fmul double %n.263.val.i, %add63
  %add6.i73.i = fadd double %add.i71.i, %mul5.i72.i
  %call3.i = tail call double @fabs(double %add6.i73.i) #6
  %cmp.i = fcmp olt double %call3.i, 1.000000e-17
  br i1 %cmp.i, label %ray_plane_intersect.exit, label %if.end.i

if.end.i:                                         ; preds = %for.body19
  %p.1.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 1), align 8
  %p.0.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 0), align 8
  %mul3.i.i = fmul double %n.162.val.i, %p.1.val.i
  %mul.i.i = fmul double %n.061.val.i, %p.0.val.i
  %p.2.val.i = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 2), align 8
  %mul5.i.i = fmul double %n.263.val.i, %p.2.val.i
  %add.i.i = fadd double %mul3.i.i, %mul.i.i
  %add6.i.i = fadd double %add.i.i, %mul5.i.i
  %mul.i64.i = fmul double %n.061.val.i, %add
  %mul3.i65.i = fmul double %n.162.val.i, %add8
  %add.i66.i = fadd double %mul.i64.i, %mul3.i65.i
  %mul5.i67.i = fmul double %n.263.val.i, %add14
  %add6.i68.i = fadd double %add.i66.i, %mul5.i67.i
  %add.i = fsub double %add6.i68.i, %add6.i.i
  %sub6.i = fsub double -0.000000e+00, %add.i
  %div.i = fdiv double %sub6.i, %add6.i73.i
  %cmp7.i = fcmp ogt double %div.i, 0.000000e+00
  %19 = load double* %t, align 8, !tbaa !14
  %cmp9.i = fcmp olt double %div.i, %19
  %or.cond = and i1 %cmp7.i, %cmp9.i
  br i1 %or.cond, label %if.then10.i, label %ray_plane_intersect.exit

if.then10.i:                                      ; preds = %if.end.i
  store double %div.i, double* %t, align 8, !tbaa !14
  store i32 1, i32* %hit, align 8, !tbaa !17
  %mul.i = fmul double %add41, %div.i
  %add15.i = fadd double %add, %mul.i
  store double %add15.i, double* %x17.i, align 8, !tbaa !19
  %mul21.i = fmul double %add52, %div.i
  %add22.i = fadd double %add8, %mul21.i
  store double %add22.i, double* %y24.i, align 8, !tbaa !21
  %mul28.i = fmul double %add63, %div.i
  %add29.i = fadd double %add14, %mul28.i
  store double %add29.i, double* %z31.i, align 8, !tbaa !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* bitcast (%struct._vec* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1) to i8*), i64 24, i32 8, i1 false) #3, !tbaa.struct !30
  br label %ray_plane_intersect.exit

ray_plane_intersect.exit:                         ; preds = %if.then10.i, %if.end.i, %for.body19
  %20 = load i32* %hit, align 8, !tbaa !17
  %tobool = icmp eq i32 %20, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %ray_plane_intersect.exit
  %add70 = fadd double %occlusion.1113, 1.000000e+00
  br label %if.end

if.end:                                           ; preds = %if.then, %ray_plane_intersect.exit
  %occlusion.2 = phi double [ %add70, %if.then ], [ %occlusion.1113, %ray_plane_intersect.exit ]
  call void @llvm.lifetime.end(i64 64, i8* %17) #3
  call void @llvm.lifetime.end(i64 48, i8* %16) #3
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
  store double %div, double* %x78, align 8, !tbaa !27
  %y79 = getelementptr inbounds %struct._vec* %col, i64 0, i32 1
  store double %div, double* %y79, align 8, !tbaa !28
  %z80 = getelementptr inbounds %struct._vec* %col, i64 0, i32 2
  store double %div, double* %z80, align 8, !tbaa !29
  call void @llvm.lifetime.end(i64 72, i8* %6) #3
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
  %ray = alloca %struct._Ray, align 8
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
  %1 = bitcast %struct._Ray* %ray to i8*
  %x46 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 1, i32 0
  %y48 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 1, i32 1
  %z50 = getelementptr inbounds %struct._Ray* %ray, i64 0, i32 1, i32 2
  %2 = bitcast %struct._Isect* %isect to i8*
  %t = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 0
  %hit = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 3
  %x53 = getelementptr inbounds %struct._vec* %col, i64 0, i32 0
  %y59 = getelementptr inbounds %struct._vec* %col, i64 0, i32 1
  %z67 = getelementptr inbounds %struct._vec* %col, i64 0, i32 2
  %x17.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 0
  %y24.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 1
  %z31.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 1, i32 2
  %n32.i = getelementptr inbounds %struct._Isect* %isect, i64 0, i32 2
  %3 = bitcast %struct._vec* %n32.i to i8*
  %mul78 = mul nsw i32 %nsubsamples, %nsubsamples
  %conv79 = sitofp i32 %mul78 to double
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.inc147, %for.cond10.preheader.lr.ph
  %indvars.iv255 = phi i64 [ 0, %for.cond10.preheader.lr.ph ], [ %indvars.iv.next256, %for.inc147 ]
  br i1 %cmp11247, label %for.cond14.preheader.lr.ph, label %for.inc147

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader
  %4 = trunc i64 %indvars.iv255 to i32
  %conv30 = sitofp i32 %4 to double
  %mul54 = mul nsw i32 %4, %w
  %5 = sext i32 %mul54 to i64
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.end77, %for.cond14.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %indvars.iv.next, %for.end77 ]
  br i1 %cmp15245, label %for.cond18.preheader.lr.ph.split.us, label %for.cond14.preheader.for.end77_crit_edge

for.cond14.preheader.for.end77_crit_edge:         ; preds = %for.cond14.preheader
  %.pre = add nsw i64 %indvars.iv, %5
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
  %6 = trunc i64 %indvars.iv to i32
  %conv22 = sitofp i32 %6 to double
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %mul56 = mul nsw i32 %8, 3
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
  call void @llvm.lifetime.start(i64 48, i8* %1) #3
  %9 = bitcast %struct._Ray* %ray to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 24, i32 8, i1 false)
  store double %div29.us, double* %x46, align 8, !tbaa !18
  store double %div41.us, double* %y48, align 8, !tbaa !20
  store double -1.000000e+00, double* %z50, align 8, !tbaa !22
  %mul.i.i.us = fmul double %div29.us, %div29.us
  %mul3.i.i.us = fmul double %div41.us, %div41.us
  %add.i.i.us = fadd double %mul.i.i.us, %mul3.i.i.us
  %add6.i.i.us = fadd double %add.i.i.us, 1.000000e+00
  %call1.i.us = tail call double @sqrt(double %add6.i.i.us) #3
  %call2.i.us = tail call double @fabs(double %call1.i.us) #6
  %cmp.i.us = fcmp ogt double %call2.i.us, 1.000000e-17
  br i1 %cmp.i.us, label %if.then.i.us, label %vnormalize.exit.us

if.then.i.us:                                     ; preds = %for.body21.us
  %div.i.us = fdiv double %div29.us, %call1.i.us
  store double %div.i.us, double* %x46, align 8, !tbaa !27
  %div3.i.us = fdiv double %div41.us, %call1.i.us
  store double %div3.i.us, double* %y48, align 8, !tbaa !28
  %div4.i.us = fdiv double -1.000000e+00, %call1.i.us
  store double %div4.i.us, double* %z50, align 8, !tbaa !29
  br label %vnormalize.exit.us

vnormalize.exit.us:                               ; preds = %if.then.i.us, %for.body21.us
  %dir.2.val.i.us = phi double [ %div4.i.us, %if.then.i.us ], [ -1.000000e+00, %for.body21.us ]
  %dir.1.val.i.us = phi double [ %div3.i.us, %if.then.i.us ], [ %div41.us, %for.body21.us ]
  %dir.0.val.i.us = phi double [ %div.i.us, %if.then.i.us ], [ %div29.us, %for.body21.us ]
  call void @llvm.lifetime.start(i64 64, i8* %2) #3
  store double 1.000000e+17, double* %t, align 8, !tbaa !14
  store i32 0, i32* %hit, align 8, !tbaa !17
  call void @ray_sphere_intersect(%struct._Isect* %isect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 0))
  call void @ray_sphere_intersect(%struct._Isect* %isect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 1))
  call void @ray_sphere_intersect(%struct._Isect* %isect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i64 0, i64 2))
  %n.061.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 0), align 8
  %n.162.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8
  %n.263.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8
  %mul.i69.i.us = fmul double %n.061.val.i.us, %dir.0.val.i.us
  %mul3.i70.i.us = fmul double %n.162.val.i.us, %dir.1.val.i.us
  %add.i71.i.us = fadd double %mul.i69.i.us, %mul3.i70.i.us
  %mul5.i72.i.us = fmul double %n.263.val.i.us, %dir.2.val.i.us
  %add6.i73.i.us = fadd double %add.i71.i.us, %mul5.i72.i.us
  %call3.i.us = tail call double @fabs(double %add6.i73.i.us) #6
  %cmp.i222.us = fcmp olt double %call3.i.us, 1.000000e-17
  br i1 %cmp.i222.us, label %ray_plane_intersect.exit.us, label %if.end.i.us

if.end.i.us:                                      ; preds = %vnormalize.exit.us
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
  %10 = load double* %t, align 8, !tbaa !14
  %cmp9.i.us = fcmp olt double %div.i228.us, %10
  %or.cond.us = and i1 %cmp7.i.us, %cmp9.i.us
  br i1 %or.cond.us, label %if.then10.i.us, label %ray_plane_intersect.exit.us

if.then10.i.us:                                   ; preds = %if.end.i.us
  store double %div.i228.us, double* %t, align 8, !tbaa !14
  store i32 1, i32* %hit, align 8, !tbaa !17
  %mul.i.us = fmul double %dir.0.val.i.us, %div.i228.us
  %add15.i.us = fadd double %mul.i.us, 0.000000e+00
  store double %add15.i.us, double* %x17.i, align 8, !tbaa !19
  %mul21.i.us = fmul double %dir.1.val.i.us, %div.i228.us
  %add22.i.us = fadd double %mul21.i.us, 0.000000e+00
  store double %add22.i.us, double* %y24.i, align 8, !tbaa !21
  %mul28.i.us = fmul double %dir.2.val.i.us, %div.i228.us
  %add29.i.us = fadd double %mul28.i.us, 0.000000e+00
  store double %add29.i.us, double* %z31.i, align 8, !tbaa !23
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct._vec* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1) to i8*), i64 24, i32 8, i1 false) #3, !tbaa.struct !30
  br label %ray_plane_intersect.exit.us

ray_plane_intersect.exit.us:                      ; preds = %if.then10.i.us, %if.end.i.us, %vnormalize.exit.us
  %11 = load i32* %hit, align 8, !tbaa !17
  %tobool.us = icmp eq i32 %11, 0
  br i1 %tobool.us, label %if.end.us, label %if.then.us

if.then.us:                                       ; preds = %ray_plane_intersect.exit.us
  call void @ambient_occlusion(%struct._vec* %col, %struct._Isect* %isect)
  %12 = load double* %x53, align 8, !tbaa !27
  %13 = load double* %arrayidx, align 8, !tbaa !31
  %add58.us = fadd double %12, %13
  store double %add58.us, double* %arrayidx, align 8, !tbaa !31
  %14 = load double* %y59, align 8, !tbaa !28
  %15 = load double* %arrayidx65, align 8, !tbaa !31
  %add66.us = fadd double %14, %15
  store double %add66.us, double* %arrayidx65, align 8, !tbaa !31
  %16 = load double* %z67, align 8, !tbaa !29
  %17 = load double* %arrayidx73, align 8, !tbaa !31
  %add74.us = fadd double %16, %17
  store double %add74.us, double* %arrayidx73, align 8, !tbaa !31
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %ray_plane_intersect.exit.us
  call void @llvm.lifetime.end(i64 64, i8* %2) #3
  call void @llvm.lifetime.end(i64 48, i8* %1) #3
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
  br label %for.body21.us

for.end77:                                        ; preds = %for.inc75.us, %for.cond14.preheader.for.end77_crit_edge
  %arrayidx103.pre-phi = phi double* [ %arrayidx103.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %arrayidx73, %for.inc75.us ]
  %idxprom102.pre-phi = phi i64 [ %idxprom102.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %idxprom72, %for.inc75.us ]
  %arrayidx94.pre-phi = phi double* [ %arrayidx94.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %arrayidx65, %for.inc75.us ]
  %idxprom93.pre-phi = phi i64 [ %idxprom93.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %idxprom64, %for.inc75.us ]
  %arrayidx85.pre-phi = phi double* [ %arrayidx85.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %arrayidx, %for.inc75.us ]
  %idxprom84.pre-phi = phi i64 [ %idxprom84.pre, %for.cond14.preheader.for.end77_crit_edge ], [ %idxprom, %for.inc75.us ]
  %18 = load double* %arrayidx85.pre-phi, align 8, !tbaa !31
  %div86 = fdiv double %18, %conv79
  store double %div86, double* %arrayidx85.pre-phi, align 8, !tbaa !31
  %19 = load double* %arrayidx94.pre-phi, align 8, !tbaa !31
  %div95 = fdiv double %19, %conv79
  store double %div95, double* %arrayidx94.pre-phi, align 8, !tbaa !31
  %20 = load double* %arrayidx103.pre-phi, align 8, !tbaa !31
  %div104 = fdiv double %20, %conv79
  store double %div104, double* %arrayidx103.pre-phi, align 8, !tbaa !31
  %mul.i229 = fmul double %div86, 2.555000e+02
  %conv.i = fptosi double %mul.i229 to i32
  %cmp.i230 = icmp slt i32 %conv.i, 0
  %.conv.i = select i1 %cmp.i230, i32 0, i32 %conv.i
  %cmp2.i = icmp sgt i32 %.conv.i, 255
  %21 = trunc i32 %.conv.i to i8
  %conv6.i = select i1 %cmp2.i, i8 -1, i8 %21
  %arrayidx117 = getelementptr inbounds i8* %img, i64 %idxprom84.pre-phi
  store i8 %conv6.i, i8* %arrayidx117, align 1, !tbaa !32
  %mul.i231 = fmul double %div95, 2.555000e+02
  %conv.i232 = fptosi double %mul.i231 to i32
  %cmp.i233 = icmp slt i32 %conv.i232, 0
  %.conv.i234 = select i1 %cmp.i233, i32 0, i32 %conv.i232
  %cmp2.i235 = icmp sgt i32 %.conv.i234, 255
  %22 = trunc i32 %.conv.i234 to i8
  %conv6.i236 = select i1 %cmp2.i235, i8 -1, i8 %22
  %arrayidx130 = getelementptr inbounds i8* %img, i64 %idxprom93.pre-phi
  store i8 %conv6.i236, i8* %arrayidx130, align 1, !tbaa !32
  %mul.i237 = fmul double %div104, 2.555000e+02
  %conv.i238 = fptosi double %mul.i237 to i32
  %cmp.i239 = icmp slt i32 %conv.i238, 0
  %.conv.i240 = select i1 %cmp.i239, i32 0, i32 %conv.i238
  %cmp2.i241 = icmp sgt i32 %.conv.i240, 255
  %23 = trunc i32 %.conv.i240 to i8
  %conv6.i242 = select i1 %cmp2.i241, i8 -1, i8 %23
  %arrayidx143 = getelementptr inbounds i8* %img, i64 %idxprom102.pre-phi
  store i8 %conv6.i242, i8* %arrayidx143, align 1, !tbaa !32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond254 = icmp eq i32 %lftr.wideiv, %w
  br i1 %exitcond254, label %for.inc147, label %for.cond14.preheader

for.inc147:                                       ; preds = %for.end77, %for.cond10.preheader
  %indvars.iv.next256 = add nuw nsw i64 %indvars.iv255, 1
  %lftr.wideiv257 = trunc i64 %indvars.iv.next256 to i32
  %exitcond258 = icmp eq i32 %lftr.wideiv257, %h
  br i1 %exitcond258, label %for.end149, label %for.cond10.preheader

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
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 0), align 8, !tbaa !33
  store double -5.000000e-01, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 1), align 8, !tbaa !35
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 2) to i8*), i8 0, i64 16, i32 8, i1 false)
  store double 1.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8, !tbaa !36
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8, !tbaa !37
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
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 0), align 8, !tbaa !33
  store double -5.000000e-01, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 1), align 8, !tbaa !35
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 0, i32 2) to i8*), i8 0, i64 16, i32 8, i1 false) #3
  store double 1.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 1), align 8, !tbaa !36
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i64 0, i32 1, i32 2), align 8, !tbaa !37
  %call1 = call i32 @clock_gettime(i32 1, %struct.timespec* %ts) #3
  %tv_sec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 0
  %0 = load i64* %tv_sec, align 8, !tbaa !38
  %tv_nsec = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  %1 = load i64* %tv_nsec, align 8, !tbaa !41
  call void @render(i8* %call, i32 512, i32 512, i32 4)
  %call2 = call i32 @clock_gettime(i32 1, %struct.timespec* %ts) #3
  %2 = load i64* %tv_sec, align 8, !tbaa !38
  %mul4 = mul i64 %2, 1000000
  %3 = load i64* %tv_nsec, align 8, !tbaa !41
  %div6 = sdiv i64 %3, 1000
  call void @saveppm(i8* getelementptr inbounds ([7 x i8]* @.str6, i64 0, i64 0), i32 512, i32 512, i8* %call)
  %4 = mul i64 %0, -1000000
  %div.neg = sdiv i64 %1, -1000
  %add.neg = add i64 %div.neg, %4
  %add7 = add i64 %add.neg, %mul4
  %sub = add i64 %add7, %div6
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
!18 = metadata !{metadata !2, metadata !4, i64 24}
!19 = metadata !{metadata !15, metadata !4, i64 8}
!20 = metadata !{metadata !2, metadata !4, i64 32}
!21 = metadata !{metadata !15, metadata !4, i64 16}
!22 = metadata !{metadata !2, metadata !4, i64 40}
!23 = metadata !{metadata !15, metadata !4, i64 24}
!24 = metadata !{metadata !15, metadata !4, i64 32}
!25 = metadata !{metadata !15, metadata !4, i64 40}
!26 = metadata !{metadata !15, metadata !4, i64 48}
!27 = metadata !{metadata !3, metadata !4, i64 0}
!28 = metadata !{metadata !3, metadata !4, i64 8}
!29 = metadata !{metadata !3, metadata !4, i64 16}
!30 = metadata !{i64 0, i64 8, metadata !31, i64 8, i64 8, metadata !31, i64 16, i64 8, metadata !31}
!31 = metadata !{metadata !4, metadata !4, i64 0}
!32 = metadata !{metadata !5, metadata !5, i64 0}
!33 = metadata !{metadata !34, metadata !4, i64 0}
!34 = metadata !{metadata !"_Plane", metadata !3, i64 0, metadata !3, i64 24}
!35 = metadata !{metadata !34, metadata !4, i64 8}
!36 = metadata !{metadata !34, metadata !4, i64 32}
!37 = metadata !{metadata !34, metadata !4, i64 40}
!38 = metadata !{metadata !39, metadata !40, i64 0}
!39 = metadata !{metadata !"timespec", metadata !40, i64 0, metadata !40, i64 8}
!40 = metadata !{metadata !"long", metadata !5, i64 0}
!41 = metadata !{metadata !39, metadata !40, i64 8}
