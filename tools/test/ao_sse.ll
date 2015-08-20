; ModuleID = 'ao_sse.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct._Sphere = type { %struct._vec, double }
%struct._vec = type { double, double, double }
%struct._Plane = type { %struct._vec, %struct._vec }
%struct._Isect = type { double, %struct._vec, %struct._vec, i32 }
%struct._Ray = type { %struct._vec, %struct._vec }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str1 = private unnamed_addr constant [14 x i8] c"ao_simd_soa.c\00", align 1
@spheres = common global [3 x %struct._Sphere] zeroinitializer, align 4
@plane = common global %struct._Plane zeroinitializer, align 4
@.str2 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"fp\00", align 1
@__PRETTY_FUNCTION__.saveppm = private unnamed_addr constant [54 x i8] c"void saveppm(const char *, int, int, unsigned char *)\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"P6\0A\00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str6 = private unnamed_addr constant [5 x i8] c"255\0A\00", align 1
@.str7 = private unnamed_addr constant [10 x i8] c"%.2f sec\0A\00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"ao.ppm\00", align 1

; Function Attrs: nounwind
define void @ray_sphere_intersect(%struct._Isect* nocapture %isect, %struct._Ray* nocapture %ray, %struct._Sphere* nocapture %sphere) #0 {
entry:
  %x = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 0, i32 0
  %0 = load double* %x, align 4, !tbaa !0
  %x1 = getelementptr inbounds %struct._Sphere* %sphere, i32 0, i32 0, i32 0
  %1 = load double* %x1, align 4, !tbaa !0
  %sub = fsub double %0, %1
  %y = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 0, i32 1
  %2 = load double* %y, align 4, !tbaa !0
  %y5 = getelementptr inbounds %struct._Sphere* %sphere, i32 0, i32 0, i32 1
  %3 = load double* %y5, align 4, !tbaa !0
  %sub6 = fsub double %2, %3
  %z = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 0, i32 2
  %4 = load double* %z, align 4, !tbaa !0
  %z10 = getelementptr inbounds %struct._Sphere* %sphere, i32 0, i32 0, i32 2
  %5 = load double* %z10, align 4, !tbaa !0
  %sub11 = fsub double %4, %5
  %dir.0 = getelementptr %struct._Ray* %ray, i32 0, i32 1, i32 0
  %dir.0.val = load double* %dir.0, align 4
  %dir.1 = getelementptr %struct._Ray* %ray, i32 0, i32 1, i32 1
  %dir.1.val = load double* %dir.1, align 4
  %dir.2 = getelementptr %struct._Ray* %ray, i32 0, i32 1, i32 2
  %dir.2.val = load double* %dir.2, align 4
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
  %radius = getelementptr inbounds %struct._Sphere* %sphere, i32 0, i32 1
  %6 = load double* %radius, align 4, !tbaa !0
  %mul = fmul double %6, %6
  %sub15 = fsub double %add6.i116, %mul
  %mul16 = fmul double %add6.i, %add6.i
  %sub17 = fsub double %mul16, %sub15
  %cmp = fcmp ogt double %sub17, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end69

if.then:                                          ; preds = %entry
  %sub18 = fsub double -0.000000e+00, %add6.i
  %call19 = tail call double @sqrt(double %sub17) #2
  %sub20 = fsub double %sub18, %call19
  %cmp21 = fcmp ogt double %sub20, 0.000000e+00
  br i1 %cmp21, label %land.lhs.true, label %if.end69

land.lhs.true:                                    ; preds = %if.then
  %t22 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 0
  %7 = load double* %t22, align 4, !tbaa !0
  %cmp23 = fcmp olt double %sub20, %7
  br i1 %cmp23, label %if.then24, label %if.end69

if.then24:                                        ; preds = %land.lhs.true
  store double %sub20, double* %t22, align 4, !tbaa !0
  %hit = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 3
  store i32 1, i32* %hit, align 4, !tbaa !3
  %8 = load double* %x, align 4, !tbaa !0
  %9 = load double* %dir.0, align 4, !tbaa !0
  %mul30 = fmul double %sub20, %9
  %add = fadd double %8, %mul30
  %x31 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 0
  store double %add, double* %x31, align 4, !tbaa !0
  %10 = load double* %y, align 4, !tbaa !0
  %11 = load double* %dir.1, align 4, !tbaa !0
  %mul36 = fmul double %sub20, %11
  %add37 = fadd double %10, %mul36
  %y39 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 1
  store double %add37, double* %y39, align 4, !tbaa !0
  %12 = load double* %z, align 4, !tbaa !0
  %13 = load double* %dir.2, align 4, !tbaa !0
  %mul44 = fmul double %sub20, %13
  %add45 = fadd double %12, %mul44
  %z47 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 2
  store double %add45, double* %z47, align 4, !tbaa !0
  %14 = load double* %x1, align 4, !tbaa !0
  %sub52 = fsub double %add, %14
  %x53 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2, i32 0
  store double %sub52, double* %x53, align 4, !tbaa !0
  %15 = load double* %y5, align 4, !tbaa !0
  %sub58 = fsub double %add37, %15
  %y60 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2, i32 1
  store double %sub58, double* %y60, align 4, !tbaa !0
  %16 = load double* %z10, align 4, !tbaa !0
  %sub65 = fsub double %add45, %16
  %z67 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2, i32 2
  store double %sub65, double* %z67, align 4, !tbaa !0
  %mul.i.i = fmul double %sub52, %sub52
  %mul3.i.i = fmul double %sub58, %sub58
  %add.i.i = fadd double %mul.i.i, %mul3.i.i
  %mul5.i.i = fmul double %sub65, %sub65
  %add6.i.i = fadd double %mul5.i.i, %add.i.i
  %call1.i = tail call double @sqrt(double %add6.i.i) #2
  %call2.i = tail call double @fabs(double %call1.i) #4
  %cmp.i = fcmp ogt double %call2.i, 1.000000e-17
  br i1 %cmp.i, label %if.then.i, label %if.end69

if.then.i:                                        ; preds = %if.then24
  %17 = load double* %x53, align 4, !tbaa !0
  %div.i = fdiv double %17, %call1.i
  store double %div.i, double* %x53, align 4, !tbaa !0
  %18 = load double* %y60, align 4, !tbaa !0
  %div3.i = fdiv double %18, %call1.i
  store double %div3.i, double* %y60, align 4, !tbaa !0
  %19 = load double* %z67, align 4, !tbaa !0
  %div4.i = fdiv double %19, %call1.i
  store double %div4.i, double* %z67, align 4, !tbaa !0
  br label %if.end69

if.end69:                                         ; preds = %if.then.i, %if.then24, %land.lhs.true, %if.then, %entry
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #0

; Function Attrs: nounwind
define void @ray_plane_intersect(%struct._Isect* nocapture %isect, %struct._Ray* nocapture %ray, %struct._Plane* nocapture %plane) #0 {
entry:
  %n = getelementptr inbounds %struct._Plane* %plane, i32 0, i32 1
  %n.061 = getelementptr %struct._vec* %n, i32 0, i32 0
  %n.061.val = load double* %n.061, align 4
  %n.162 = getelementptr %struct._Plane* %plane, i32 0, i32 1, i32 1
  %n.162.val = load double* %n.162, align 4
  %n.263 = getelementptr %struct._Plane* %plane, i32 0, i32 1, i32 2
  %n.263.val = load double* %n.263, align 4
  %dir.0 = getelementptr %struct._Ray* %ray, i32 0, i32 1, i32 0
  %dir.0.val = load double* %dir.0, align 4
  %dir.1 = getelementptr %struct._Ray* %ray, i32 0, i32 1, i32 1
  %dir.1.val = load double* %dir.1, align 4
  %dir.2 = getelementptr %struct._Ray* %ray, i32 0, i32 1, i32 2
  %dir.2.val = load double* %dir.2, align 4
  %mul.i69 = fmul double %n.061.val, %dir.0.val
  %mul3.i70 = fmul double %n.162.val, %dir.1.val
  %add.i71 = fadd double %mul.i69, %mul3.i70
  %mul5.i72 = fmul double %n.263.val, %dir.2.val
  %add6.i73 = fadd double %add.i71, %mul5.i72
  %call3 = tail call double @fabs(double %add6.i73) #4
  %cmp = fcmp olt double %call3, 1.000000e-17
  br i1 %cmp, label %if.end34, label %if.end

if.end:                                           ; preds = %entry
  %p.1 = getelementptr %struct._Plane* %plane, i32 0, i32 0, i32 1
  %p.0 = getelementptr %struct._Plane* %plane, i32 0, i32 0, i32 0
  %p.2 = getelementptr %struct._Plane* %plane, i32 0, i32 0, i32 2
  %p.1.val = load double* %p.1, align 4
  %p.0.val = load double* %p.0, align 4
  %mul3.i = fmul double %n.162.val, %p.1.val
  %mul.i = fmul double %n.061.val, %p.0.val
  %p.2.val = load double* %p.2, align 4
  %mul5.i = fmul double %n.263.val, %p.2.val
  %add.i = fadd double %mul3.i, %mul.i
  %add6.i = fadd double %add.i, %mul5.i
  %org.0 = getelementptr %struct._Ray* %ray, i32 0, i32 0, i32 0
  %org.0.val = load double* %org.0, align 4
  %org.1 = getelementptr %struct._Ray* %ray, i32 0, i32 0, i32 1
  %org.1.val = load double* %org.1, align 4
  %org.2 = getelementptr %struct._Ray* %ray, i32 0, i32 0, i32 2
  %org.2.val = load double* %org.2, align 4
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
  %t8 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 0
  %0 = load double* %t8, align 4, !tbaa !0
  %cmp9 = fcmp olt double %div, %0
  br i1 %cmp9, label %if.then10, label %if.end34

if.then10:                                        ; preds = %land.lhs.true
  store double %div, double* %t8, align 4, !tbaa !0
  %hit = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 3
  store i32 1, i32* %hit, align 4, !tbaa !3
  %1 = load double* %org.0, align 4, !tbaa !0
  %2 = load double* %dir.0, align 4, !tbaa !0
  %mul = fmul double %div, %2
  %add15 = fadd double %1, %mul
  %x17 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 0
  store double %add15, double* %x17, align 4, !tbaa !0
  %3 = load double* %org.1, align 4, !tbaa !0
  %4 = load double* %dir.1, align 4, !tbaa !0
  %mul21 = fmul double %div, %4
  %add22 = fadd double %3, %mul21
  %y24 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 1
  store double %add22, double* %y24, align 4, !tbaa !0
  %5 = load double* %org.2, align 4, !tbaa !0
  %6 = load double* %dir.2, align 4, !tbaa !0
  %mul28 = fmul double %div, %6
  %add29 = fadd double %5, %mul28
  %z31 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 2
  store double %add29, double* %z31, align 4, !tbaa !0
  %n32 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2
  %7 = bitcast %struct._vec* %n32 to i8*
  %8 = bitcast %struct._vec* %n to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %7, i8* %8, i32 24, i32 4, i1 false), !tbaa.struct !4
  br label %if.end34

if.end34:                                         ; preds = %if.then10, %land.lhs.true, %if.end, %entry
  ret void
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture, i32, i32, i1) #2

; Function Attrs: nounwind
define void @orthoBasis(%struct._vec* nocapture %basis, %struct._vec* byval nocapture align 4 %n) #0 {
entry:
  %arrayidx = getelementptr inbounds %struct._vec* %basis, i32 2
  %0 = bitcast %struct._vec* %arrayidx to i8*
  %1 = bitcast %struct._vec* %n to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* %1, i32 24, i32 4, i1 false), !tbaa.struct !4
  %x = getelementptr inbounds %struct._vec* %basis, i32 1, i32 0
  %y = getelementptr inbounds %struct._vec* %basis, i32 1, i32 1
  %z = getelementptr inbounds %struct._vec* %basis, i32 1, i32 2
  %x4 = getelementptr inbounds %struct._vec* %n, i32 0, i32 0
  %2 = bitcast double* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 4, i1 false)
  %3 = load double* %x4, align 4, !tbaa !0
  %cmp = fcmp olt double %3, 6.000000e-01
  %cmp6 = fcmp ogt double %3, -6.000000e-01
  %or.cond = and i1 %cmp, %cmp6
  br i1 %or.cond, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store double 1.000000e+00, double* %x, align 4, !tbaa !0
  br label %if.end30

if.else:                                          ; preds = %entry
  %y9 = getelementptr inbounds %struct._vec* %n, i32 0, i32 1
  %4 = load double* %y9, align 4, !tbaa !0
  %cmp10 = fcmp olt double %4, 6.000000e-01
  %cmp13 = fcmp ogt double %4, -6.000000e-01
  %or.cond54 = and i1 %cmp10, %cmp13
  br i1 %or.cond54, label %if.then14, label %if.else17

if.then14:                                        ; preds = %if.else
  store double 1.000000e+00, double* %y, align 4, !tbaa !0
  br label %if.end30

if.else17:                                        ; preds = %if.else
  %z18 = getelementptr inbounds %struct._vec* %n, i32 0, i32 2
  %5 = load double* %z18, align 4, !tbaa !0
  %cmp19 = fcmp olt double %5, 6.000000e-01
  %cmp22 = fcmp ogt double %5, -6.000000e-01
  %or.cond55 = and i1 %cmp19, %cmp22
  br i1 %or.cond55, label %if.then23, label %if.else26

if.then23:                                        ; preds = %if.else17
  store double 1.000000e+00, double* %z, align 4, !tbaa !0
  br label %if.end30

if.else26:                                        ; preds = %if.else17
  store double 1.000000e+00, double* %x, align 4, !tbaa !0
  br label %if.end30

if.end30:                                         ; preds = %if.else26, %if.then23, %if.then14, %if.then
  %arrayidx1.2.val = phi double [ 0.000000e+00, %if.then14 ], [ 0.000000e+00, %if.else26 ], [ 1.000000e+00, %if.then23 ], [ 0.000000e+00, %if.then ]
  %arrayidx1.1.val = phi double [ 1.000000e+00, %if.then14 ], [ 0.000000e+00, %if.else26 ], [ 0.000000e+00, %if.then23 ], [ 0.000000e+00, %if.then ]
  %arrayidx1.0.val = phi double [ 0.000000e+00, %if.then14 ], [ 1.000000e+00, %if.else26 ], [ 0.000000e+00, %if.then23 ], [ 1.000000e+00, %if.then ]
  %arrayidx.056 = getelementptr %struct._vec* %arrayidx, i32 0, i32 0
  %arrayidx.056.val = load double* %arrayidx.056, align 4
  %arrayidx.157 = getelementptr %struct._vec* %basis, i32 2, i32 1
  %arrayidx.157.val = load double* %arrayidx.157, align 4
  %arrayidx.258 = getelementptr %struct._vec* %basis, i32 2, i32 2
  %arrayidx.258.val = load double* %arrayidx.258, align 4
  %mul.i = fmul double %arrayidx1.1.val, %arrayidx.258.val
  %mul3.i = fmul double %arrayidx1.2.val, %arrayidx.157.val
  %sub.i = fsub double %mul.i, %mul3.i
  %x.i = getelementptr inbounds %struct._vec* %basis, i32 0, i32 0
  store double %sub.i, double* %x.i, align 4, !tbaa !0
  %mul6.i = fmul double %arrayidx1.2.val, %arrayidx.056.val
  %mul9.i = fmul double %arrayidx1.0.val, %arrayidx.258.val
  %sub10.i = fsub double %mul6.i, %mul9.i
  %y11.i = getelementptr inbounds %struct._vec* %basis, i32 0, i32 1
  store double %sub10.i, double* %y11.i, align 4, !tbaa !0
  %mul14.i = fmul double %arrayidx1.0.val, %arrayidx.157.val
  %mul17.i = fmul double %arrayidx1.1.val, %arrayidx.056.val
  %sub18.i = fsub double %mul14.i, %mul17.i
  %z19.i = getelementptr inbounds %struct._vec* %basis, i32 0, i32 2
  store double %sub18.i, double* %z19.i, align 4, !tbaa !0
  %mul.i.i65 = fmul double %sub.i, %sub.i
  %mul3.i.i66 = fmul double %sub10.i, %sub10.i
  %add.i.i67 = fadd double %mul.i.i65, %mul3.i.i66
  %mul5.i.i68 = fmul double %sub18.i, %sub18.i
  %add6.i.i69 = fadd double %mul5.i.i68, %add.i.i67
  %call1.i70 = tail call double @sqrt(double %add6.i.i69) #2
  %call2.i71 = tail call double @fabs(double %call1.i70) #4
  %cmp.i72 = fcmp ogt double %call2.i71, 1.000000e-17
  %6 = load double* %x.i, align 4, !tbaa !0
  br i1 %cmp.i72, label %if.then.i76, label %if.end30.vnormalize.exit77_crit_edge

if.end30.vnormalize.exit77_crit_edge:             ; preds = %if.end30
  %basis.1.val.pre = load double* %y11.i, align 4
  %basis.2.val.pre = load double* %z19.i, align 4
  br label %vnormalize.exit77

if.then.i76:                                      ; preds = %if.end30
  %div.i73 = fdiv double %6, %call1.i70
  store double %div.i73, double* %x.i, align 4, !tbaa !0
  %7 = load double* %y11.i, align 4, !tbaa !0
  %div3.i74 = fdiv double %7, %call1.i70
  store double %div3.i74, double* %y11.i, align 4, !tbaa !0
  %8 = load double* %z19.i, align 4, !tbaa !0
  %div4.i75 = fdiv double %8, %call1.i70
  store double %div4.i75, double* %z19.i, align 4, !tbaa !0
  br label %vnormalize.exit77

vnormalize.exit77:                                ; preds = %if.then.i76, %if.end30.vnormalize.exit77_crit_edge
  %basis.2.val = phi double [ %basis.2.val.pre, %if.end30.vnormalize.exit77_crit_edge ], [ %div4.i75, %if.then.i76 ]
  %basis.1.val = phi double [ %basis.1.val.pre, %if.end30.vnormalize.exit77_crit_edge ], [ %div3.i74, %if.then.i76 ]
  %basis.0.val = phi double [ %6, %if.end30.vnormalize.exit77_crit_edge ], [ %div.i73, %if.then.i76 ]
  %arrayidx.0.val = load double* %arrayidx.056, align 4
  %arrayidx.1.val = load double* %arrayidx.157, align 4
  %arrayidx.2.val = load double* %arrayidx.258, align 4
  %mul.i78 = fmul double %arrayidx.1.val, %basis.2.val
  %mul3.i79 = fmul double %arrayidx.2.val, %basis.1.val
  %sub.i80 = fsub double %mul.i78, %mul3.i79
  store double %sub.i80, double* %x, align 4, !tbaa !0
  %mul6.i82 = fmul double %arrayidx.2.val, %basis.0.val
  %mul9.i83 = fmul double %arrayidx.0.val, %basis.2.val
  %sub10.i84 = fsub double %mul6.i82, %mul9.i83
  store double %sub10.i84, double* %y, align 4, !tbaa !0
  %mul14.i86 = fmul double %arrayidx.0.val, %basis.1.val
  %mul17.i87 = fmul double %arrayidx.1.val, %basis.0.val
  %sub18.i88 = fsub double %mul14.i86, %mul17.i87
  store double %sub18.i88, double* %z, align 4, !tbaa !0
  %mul.i.i = fmul double %sub.i80, %sub.i80
  %mul3.i.i = fmul double %sub10.i84, %sub10.i84
  %add.i.i = fadd double %mul.i.i, %mul3.i.i
  %mul5.i.i = fmul double %sub18.i88, %sub18.i88
  %add6.i.i = fadd double %mul5.i.i, %add.i.i
  %call1.i = tail call double @sqrt(double %add6.i.i) #2
  %call2.i = tail call double @fabs(double %call1.i) #4
  %cmp.i = fcmp ogt double %call2.i, 1.000000e-17
  br i1 %cmp.i, label %if.then.i, label %vnormalize.exit

if.then.i:                                        ; preds = %vnormalize.exit77
  %9 = load double* %x, align 4, !tbaa !0
  %div.i = fdiv double %9, %call1.i
  store double %div.i, double* %x, align 4, !tbaa !0
  %10 = load double* %y, align 4, !tbaa !0
  %div3.i = fdiv double %10, %call1.i
  store double %div3.i, double* %y, align 4, !tbaa !0
  %11 = load double* %z, align 4, !tbaa !0
  %div4.i = fdiv double %11, %call1.i
  store double %div4.i, double* %z, align 4, !tbaa !0
  br label %vnormalize.exit

vnormalize.exit:                                  ; preds = %if.then.i, %vnormalize.exit77
  ret void
}

; Function Attrs: nounwind
define void @ambient_occlusion(%struct._vec* nocapture %col, %struct._Isect* nocapture %isect) #0 {
entry:
  %basis = alloca [3 x %struct._vec], align 8
  %x = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 0
  %0 = load double* %x, align 4, !tbaa !0
  %n = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2
  %x2 = getelementptr inbounds %struct._vec* %n, i32 0, i32 0
  %1 = load double* %x2, align 4, !tbaa !0
  %mul = fmul double %1, 1.000000e-04
  %add = fadd double %0, %mul
  %y = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 1
  %2 = load double* %y, align 4, !tbaa !0
  %y6 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2, i32 1
  %3 = load double* %y6, align 4, !tbaa !0
  %mul7 = fmul double %3, 1.000000e-04
  %add8 = fadd double %2, %mul7
  %z = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 2
  %4 = load double* %z, align 4, !tbaa !0
  %z12 = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2, i32 2
  %5 = load double* %z12, align 4, !tbaa !0
  %mul13 = fmul double %5, 1.000000e-04
  %add14 = fadd double %4, %mul13
  %6 = bitcast [3 x %struct._vec]* %basis to i8*
  call void @llvm.lifetime.start(i64 72, i8* %6) #2
  %arraydecay = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 0
  call void @orthoBasis(%struct._vec* %arraydecay, %struct._vec* byval align 4 %n)
  %x45 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 0, i32 0
  %7 = load double* %x45, align 8, !tbaa !0
  %vecinit.i410 = insertelement <2 x double> undef, double %7, i32 0
  %vecinit1.i411 = insertelement <2 x double> %vecinit.i410, double %7, i32 1
  %x49 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 1, i32 0
  %8 = load double* %x49, align 8, !tbaa !0
  %vecinit.i407 = insertelement <2 x double> undef, double %8, i32 0
  %vecinit1.i408 = insertelement <2 x double> %vecinit.i407, double %8, i32 1
  %x53 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 2, i32 0
  %9 = load double* %x53, align 8, !tbaa !0
  %vecinit.i404 = insertelement <2 x double> undef, double %9, i32 0
  %vecinit1.i405 = insertelement <2 x double> %vecinit.i404, double %9, i32 1
  %y59 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 0, i32 1
  %10 = load double* %y59, align 8, !tbaa !0
  %vecinit.i399 = insertelement <2 x double> undef, double %10, i32 0
  %vecinit1.i400 = insertelement <2 x double> %vecinit.i399, double %10, i32 1
  %y63 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 1, i32 1
  %11 = load double* %y63, align 8, !tbaa !0
  %vecinit.i396 = insertelement <2 x double> undef, double %11, i32 0
  %vecinit1.i397 = insertelement <2 x double> %vecinit.i396, double %11, i32 1
  %y67 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 2, i32 1
  %12 = load double* %y67, align 8, !tbaa !0
  %vecinit.i393 = insertelement <2 x double> undef, double %12, i32 0
  %vecinit1.i394 = insertelement <2 x double> %vecinit.i393, double %12, i32 1
  %z73 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 0, i32 2
  %13 = load double* %z73, align 8, !tbaa !0
  %vecinit.i388 = insertelement <2 x double> undef, double %13, i32 0
  %vecinit1.i389 = insertelement <2 x double> %vecinit.i388, double %13, i32 1
  %z77 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 1, i32 2
  %14 = load double* %z77, align 8, !tbaa !0
  %vecinit.i385 = insertelement <2 x double> undef, double %14, i32 0
  %vecinit1.i386 = insertelement <2 x double> %vecinit.i385, double %14, i32 1
  %z81 = getelementptr inbounds [3 x %struct._vec]* %basis, i32 0, i32 2, i32 2
  %15 = load double* %z81, align 8, !tbaa !0
  %vecinit.i382 = insertelement <2 x double> undef, double %15, i32 0
  %vecinit1.i383 = insertelement <2 x double> %vecinit.i382, double %15, i32 1
  %vecinit.i377 = insertelement <2 x double> undef, double %add, i32 0
  %vecinit1.i378 = insertelement <2 x double> %vecinit.i377, double %add, i32 1
  %vecinit.i375 = insertelement <2 x double> undef, double %add8, i32 0
  %vecinit1.i376 = insertelement <2 x double> %vecinit.i375, double %add8, i32 1
  %vecinit.i = insertelement <2 x double> undef, double %add14, i32 0
  %vecinit1.i = insertelement <2 x double> %vecinit.i, double %add14, i32 1
  br label %for.body

for.body:                                         ; preds = %for.end99, %entry
  %occlusionx2.0564 = phi <2 x double> [ zeroinitializer, %entry ], [ %add.i, %for.end99 ]
  %j.0563 = phi i32 [ 0, %entry ], [ %inc101, %for.end99 ]
  %16 = call i8* @llvm.stacksave()
  %vla183 = alloca [16 x double], align 16
  %vla17184 = alloca [16 x double], align 16
  %call21 = call double @drand48() #2
  %arrayidx = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 0
  store double %call21, double* %arrayidx, align 16, !tbaa !0
  %call22 = call double @drand48() #2
  %arrayidx23 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 0
  store double %call22, double* %arrayidx23, align 16, !tbaa !0
  %call21.1 = call double @drand48() #2
  %arrayidx.1 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 1
  store double %call21.1, double* %arrayidx.1, align 8, !tbaa !0
  %call22.1 = call double @drand48() #2
  %arrayidx23.1 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 1
  store double %call22.1, double* %arrayidx23.1, align 8, !tbaa !0
  %call21.2 = call double @drand48() #2
  %arrayidx.2 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 2
  store double %call21.2, double* %arrayidx.2, align 16, !tbaa !0
  %call22.2 = call double @drand48() #2
  %arrayidx23.2 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 2
  store double %call22.2, double* %arrayidx23.2, align 16, !tbaa !0
  %call21.3 = call double @drand48() #2
  %arrayidx.3 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 3
  store double %call21.3, double* %arrayidx.3, align 8, !tbaa !0
  %call22.3 = call double @drand48() #2
  %arrayidx23.3 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 3
  store double %call22.3, double* %arrayidx23.3, align 8, !tbaa !0
  %call21.4 = call double @drand48() #2
  %arrayidx.4 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 4
  store double %call21.4, double* %arrayidx.4, align 16, !tbaa !0
  %call22.4 = call double @drand48() #2
  %arrayidx23.4 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 4
  store double %call22.4, double* %arrayidx23.4, align 16, !tbaa !0
  %call21.5 = call double @drand48() #2
  %arrayidx.5 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 5
  store double %call21.5, double* %arrayidx.5, align 8, !tbaa !0
  %call22.5 = call double @drand48() #2
  %arrayidx23.5 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 5
  store double %call22.5, double* %arrayidx23.5, align 8, !tbaa !0
  %call21.6 = call double @drand48() #2
  %arrayidx.6 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 6
  store double %call21.6, double* %arrayidx.6, align 16, !tbaa !0
  %call22.6 = call double @drand48() #2
  %arrayidx23.6 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 6
  store double %call22.6, double* %arrayidx23.6, align 16, !tbaa !0
  %call21.7 = call double @drand48() #2
  %arrayidx.7 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 7
  store double %call21.7, double* %arrayidx.7, align 8, !tbaa !0
  %call22.7 = call double @drand48() #2
  %arrayidx23.7 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 7
  store double %call22.7, double* %arrayidx23.7, align 8, !tbaa !0
  %call21.8 = call double @drand48() #2
  %arrayidx.8 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 8
  store double %call21.8, double* %arrayidx.8, align 16, !tbaa !0
  %call22.8 = call double @drand48() #2
  %arrayidx23.8 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 8
  store double %call22.8, double* %arrayidx23.8, align 16, !tbaa !0
  %call21.9 = call double @drand48() #2
  %arrayidx.9 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 9
  store double %call21.9, double* %arrayidx.9, align 8, !tbaa !0
  %call22.9 = call double @drand48() #2
  %arrayidx23.9 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 9
  store double %call22.9, double* %arrayidx23.9, align 8, !tbaa !0
  %call21.10 = call double @drand48() #2
  %arrayidx.10 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 10
  store double %call21.10, double* %arrayidx.10, align 16, !tbaa !0
  %call22.10 = call double @drand48() #2
  %arrayidx23.10 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 10
  store double %call22.10, double* %arrayidx23.10, align 16, !tbaa !0
  %call21.11 = call double @drand48() #2
  %arrayidx.11 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 11
  store double %call21.11, double* %arrayidx.11, align 8, !tbaa !0
  %call22.11 = call double @drand48() #2
  %arrayidx23.11 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 11
  store double %call22.11, double* %arrayidx23.11, align 8, !tbaa !0
  %call21.12 = call double @drand48() #2
  %arrayidx.12 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 12
  store double %call21.12, double* %arrayidx.12, align 16, !tbaa !0
  %call22.12 = call double @drand48() #2
  %arrayidx23.12 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 12
  store double %call22.12, double* %arrayidx23.12, align 16, !tbaa !0
  %call21.13 = call double @drand48() #2
  %arrayidx.13 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 13
  store double %call21.13, double* %arrayidx.13, align 8, !tbaa !0
  %call22.13 = call double @drand48() #2
  %arrayidx23.13 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 13
  store double %call22.13, double* %arrayidx23.13, align 8, !tbaa !0
  %call21.14 = call double @drand48() #2
  %arrayidx.14 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 14
  store double %call21.14, double* %arrayidx.14, align 16, !tbaa !0
  %call22.14 = call double @drand48() #2
  %arrayidx23.14 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 14
  store double %call22.14, double* %arrayidx23.14, align 16, !tbaa !0
  %call21.15 = call double @drand48() #2
  %arrayidx.15 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 15
  store double %call21.15, double* %arrayidx.15, align 8, !tbaa !0
  %call22.15 = call double @drand48() #2
  %arrayidx23.15 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 15
  store double %call22.15, double* %arrayidx23.15, align 8, !tbaa !0
  %17 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !0
  %vecinit.i.i285 = insertelement <2 x double> undef, double %17, i32 0
  %vecinit1.i.i286 = insertelement <2 x double> %vecinit.i.i285, double %17, i32 1
  %sub.i278.i287 = fsub <2 x double> %vecinit1.i378, %vecinit1.i.i286
  %18 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !0
  %vecinit.i276.i288 = insertelement <2 x double> undef, double %18, i32 0
  %vecinit1.i277.i289 = insertelement <2 x double> %vecinit.i276.i288, double %18, i32 1
  %sub.i275.i290 = fsub <2 x double> %vecinit1.i376, %vecinit1.i277.i289
  %19 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !0
  %vecinit.i273.i291 = insertelement <2 x double> undef, double %19, i32 0
  %vecinit1.i274.i292 = insertelement <2 x double> %vecinit.i273.i291, double %19, i32 1
  %sub.i272.i293 = fsub <2 x double> %vecinit1.i, %vecinit1.i274.i292
  %mul.i266.i299 = fmul <2 x double> %sub.i278.i287, %sub.i278.i287
  %mul.i265.i300 = fmul <2 x double> %sub.i275.i290, %sub.i275.i290
  %mul.i264.i301 = fmul <2 x double> %sub.i272.i293, %sub.i272.i293
  %add.i263.i302 = fadd <2 x double> %mul.i265.i300, %mul.i264.i301
  %add.i262.i303 = fadd <2 x double> %mul.i266.i299, %add.i263.i302
  %20 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 1), align 4, !tbaa !0
  %mul.i304 = fmul double %20, %20
  %vecinit.i260.i305 = insertelement <2 x double> undef, double %mul.i304, i32 0
  %vecinit1.i261.i306 = insertelement <2 x double> %vecinit.i260.i305, double %mul.i304, i32 1
  %sub.i259.i307 = fsub <2 x double> %add.i262.i303, %vecinit1.i261.i306
  %21 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 0), align 4, !tbaa !0
  %vecinit.i.i195 = insertelement <2 x double> undef, double %21, i32 0
  %vecinit1.i.i196 = insertelement <2 x double> %vecinit.i.i195, double %21, i32 1
  %sub.i278.i197 = fsub <2 x double> %vecinit1.i378, %vecinit1.i.i196
  %22 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 1), align 4, !tbaa !0
  %vecinit.i276.i198 = insertelement <2 x double> undef, double %22, i32 0
  %vecinit1.i277.i199 = insertelement <2 x double> %vecinit.i276.i198, double %22, i32 1
  %sub.i275.i200 = fsub <2 x double> %vecinit1.i376, %vecinit1.i277.i199
  %23 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 2), align 4, !tbaa !0
  %vecinit.i273.i201 = insertelement <2 x double> undef, double %23, i32 0
  %vecinit1.i274.i202 = insertelement <2 x double> %vecinit.i273.i201, double %23, i32 1
  %sub.i272.i203 = fsub <2 x double> %vecinit1.i, %vecinit1.i274.i202
  %mul.i266.i209 = fmul <2 x double> %sub.i278.i197, %sub.i278.i197
  %mul.i265.i210 = fmul <2 x double> %sub.i275.i200, %sub.i275.i200
  %mul.i264.i211 = fmul <2 x double> %sub.i272.i203, %sub.i272.i203
  %add.i263.i212 = fadd <2 x double> %mul.i265.i210, %mul.i264.i211
  %add.i262.i213 = fadd <2 x double> %mul.i266.i209, %add.i263.i212
  %24 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 1), align 4, !tbaa !0
  %mul.i214 = fmul double %24, %24
  %vecinit.i260.i215 = insertelement <2 x double> undef, double %mul.i214, i32 0
  %vecinit1.i261.i216 = insertelement <2 x double> %vecinit.i260.i215, double %mul.i214, i32 1
  %sub.i259.i217 = fsub <2 x double> %add.i262.i213, %vecinit1.i261.i216
  %25 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 0), align 4, !tbaa !0
  %vecinit.i.i185 = insertelement <2 x double> undef, double %25, i32 0
  %vecinit1.i.i186 = insertelement <2 x double> %vecinit.i.i185, double %25, i32 1
  %sub.i278.i = fsub <2 x double> %vecinit1.i378, %vecinit1.i.i186
  %26 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 1), align 4, !tbaa !0
  %vecinit.i276.i = insertelement <2 x double> undef, double %26, i32 0
  %vecinit1.i277.i = insertelement <2 x double> %vecinit.i276.i, double %26, i32 1
  %sub.i275.i = fsub <2 x double> %vecinit1.i376, %vecinit1.i277.i
  %27 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 2), align 4, !tbaa !0
  %vecinit.i273.i = insertelement <2 x double> undef, double %27, i32 0
  %vecinit1.i274.i = insertelement <2 x double> %vecinit.i273.i, double %27, i32 1
  %sub.i272.i = fsub <2 x double> %vecinit1.i, %vecinit1.i274.i
  %mul.i266.i = fmul <2 x double> %sub.i278.i, %sub.i278.i
  %mul.i265.i = fmul <2 x double> %sub.i275.i, %sub.i275.i
  %mul.i264.i = fmul <2 x double> %sub.i272.i, %sub.i272.i
  %add.i263.i = fadd <2 x double> %mul.i265.i, %mul.i264.i
  %add.i262.i = fadd <2 x double> %mul.i266.i, %add.i263.i
  %28 = load double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 1), align 4, !tbaa !0
  %mul.i = fmul double %28, %28
  %vecinit.i260.i = insertelement <2 x double> undef, double %mul.i, i32 0
  %vecinit1.i261.i = insertelement <2 x double> %vecinit.i260.i, double %mul.i, i32 1
  %sub.i259.i = fsub <2 x double> %add.i262.i, %vecinit1.i261.i
  %29 = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 0), align 4, !tbaa !0
  %vecinit.i.i = insertelement <2 x double> undef, double %29, i32 0
  %vecinit1.i.i = insertelement <2 x double> %vecinit.i.i, double %29, i32 1
  %30 = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 0), align 4, !tbaa !0
  %vecinit.i78.i = insertelement <2 x double> undef, double %30, i32 0
  %vecinit1.i79.i = insertelement <2 x double> %vecinit.i78.i, double %30, i32 1
  %mul.i77.i = fmul <2 x double> %vecinit1.i.i, %vecinit1.i79.i
  %31 = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 1), align 4, !tbaa !0
  %vecinit.i75.i = insertelement <2 x double> undef, double %31, i32 0
  %vecinit1.i76.i = insertelement <2 x double> %vecinit.i75.i, double %31, i32 1
  %32 = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 1), align 4, !tbaa !0
  %vecinit.i73.i = insertelement <2 x double> undef, double %32, i32 0
  %vecinit1.i74.i = insertelement <2 x double> %vecinit.i73.i, double %32, i32 1
  %mul.i72.i = fmul <2 x double> %vecinit1.i76.i, %vecinit1.i74.i
  %33 = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 2), align 4, !tbaa !0
  %vecinit.i70.i = insertelement <2 x double> undef, double %33, i32 0
  %vecinit1.i71.i = insertelement <2 x double> %vecinit.i70.i, double %33, i32 1
  %34 = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 2), align 4, !tbaa !0
  %vecinit.i68.i = insertelement <2 x double> undef, double %34, i32 0
  %vecinit1.i69.i = insertelement <2 x double> %vecinit.i68.i, double %34, i32 1
  %mul.i67.i = fmul <2 x double> %vecinit1.i71.i, %vecinit1.i69.i
  %add.i66.i = fadd <2 x double> %mul.i72.i, %mul.i67.i
  %add.i65.i = fadd <2 x double> %mul.i77.i, %add.i66.i
  %35 = bitcast <2 x double> %add.i65.i to <4 x i32>
  %xor.i64.i = xor <4 x i32> %35, <i32 0, i32 -2147483648, i32 0, i32 -2147483648>
  %36 = bitcast <4 x i32> %xor.i64.i to <2 x double>
  %mul.i48.i = fmul <2 x double> %vecinit1.i378, %vecinit1.i79.i
  %mul.i45.i = fmul <2 x double> %vecinit1.i376, %vecinit1.i74.i
  %mul.i42.i = fmul <2 x double> %vecinit1.i, %vecinit1.i69.i
  %add.i41.i = fadd <2 x double> %mul.i45.i, %mul.i42.i
  %add.i40.i = fadd <2 x double> %mul.i48.i, %add.i41.i
  %add.i39.i = fadd <2 x double> %add.i40.i, %36
  %37 = bitcast <2 x double> %add.i39.i to <4 x i32>
  %xor.i.i = xor <4 x i32> %37, <i32 0, i32 -2147483648, i32 0, i32 -2147483648>
  %38 = bitcast <4 x i32> %xor.i.i to <2 x double>
  br label %for.body27

for.body27:                                       ; preds = %ray_plane_intersect_simd.exit, %for.body
  %i.1559 = phi i32 [ 0, %for.body ], [ %add98, %ray_plane_intersect_simd.exit ]
  %occlusionx2.1558 = phi <2 x double> [ %occlusionx2.0564, %for.body ], [ %add.i, %ray_plane_intersect_simd.exit ]
  %arrayidx28 = getelementptr inbounds [16 x double]* %vla183, i32 0, i32 %i.1559
  %39 = bitcast double* %arrayidx28 to <2 x double>*
  %40 = load <2 x double>* %39, align 16, !tbaa !1
  %41 = call <2 x double> @llvm.x86.sse2.sqrt.pd(<2 x double> %40) #2
  %arrayidx32 = getelementptr inbounds [16 x double]* %vla17184, i32 0, i32 %i.1559
  %42 = bitcast double* %arrayidx32 to <2 x double>*
  %43 = load <2 x double>* %42, align 16, !tbaa !1
  %mul.i423 = fmul <2 x double> %43, <double 0x401921FB54442D18, double 0x401921FB54442D18>
  %44 = bitcast <2 x double> %mul.i423 to <4 x i32>
  %and.i.i.i = and <4 x i32> %44, <i32 -1, i32 2147483647, i32 -1, i32 2147483647>
  %45 = bitcast <4 x i32> %and.i.i.i to <2 x double>
  %and.i220.i415 = and <4 x i32> %44, <i32 0, i32 -2147483648, i32 0, i32 -2147483648>
  %mul.i219.i = fmul <2 x double> %45, <double 0x3FF45F306DC9C877, double 0x3FF45F306DC9C877>
  %46 = call <4 x i32> @llvm.x86.sse2.cvttpd2dq(<2 x double> %mul.i219.i) #2
  %add.i218.i = add <4 x i32> %46, <i32 1, i32 1, i32 1, i32 1>
  %47 = bitcast <4 x i32> %add.i218.i to <2 x i64>
  %and.i217.i = and <2 x i64> %47, <i64 -4294967298, i64 -4294967298>
  %48 = bitcast <2 x i64> %and.i217.i to <4 x i32>
  %49 = call <2 x double> @llvm.x86.sse2.cvtdq2pd(<4 x i32> %48) #2
  %and.i216.i = and <2 x i64> %47, <i64 17179869188, i64 17179869188>
  %50 = bitcast <2 x i64> %and.i216.i to <4 x i32>
  %51 = call <4 x i32> @llvm.x86.sse2.pslli.d(<4 x i32> %50, i32 29) #2
  %and.i215.i416 = and <2 x i64> %47, <i64 8589934594, i64 8589934594>
  %52 = bitcast <2 x i64> %and.i215.i416 to <4 x i32>
  %cmp.i.i = icmp eq <4 x i32> %52, zeroinitializer
  %sext.i.i = sext <4 x i1> %cmp.i.i to <4 x i32>
  %mul.i214.i = fmul <2 x double> %49, <double 0xBFE9200000000000, double 0xBFE9200000000000>
  %mul.i213.i = fmul <2 x double> %49, <double 0xBF2FB40000000000, double 0xBF2FB40000000000>
  %mul.i212.i = fmul <2 x double> %49, <double 0xBE64442D18469899, double 0xBE64442D18469899>
  %add.i211.i = fadd <2 x double> %mul.i214.i, %45
  %add.i210.i = fadd <2 x double> %mul.i213.i, %add.i211.i
  %add.i209.i417 = fadd <2 x double> %mul.i212.i, %add.i210.i
  %sub.i208.i = add <4 x i32> %48, <i32 -2, i32 -2, i32 -2, i32 -2>
  %53 = bitcast <4 x i32> %sub.i208.i to <2 x i64>
  %neg.i206.i = xor <2 x i64> %53, <i64 -1, i64 -1>
  %and.i207.i = and <2 x i64> %neg.i206.i, <i64 17179869188, i64 17179869188>
  %54 = bitcast <2 x i64> %and.i207.i to <4 x i32>
  %55 = call <4 x i32> @llvm.x86.sse2.pslli.d(<4 x i32> %54, i32 29) #2
  %56 = shufflevector <4 x i32> %51, <4 x i32> undef, <4 x i32> <i32 2, i32 0, i32 2, i32 1>
  %xor.i205.i = xor <4 x i32> %and.i220.i415, %56
  %mul.i204.i = fmul <2 x double> %add.i209.i417, %add.i209.i417
  %mul.i203.i = fmul <2 x double> %mul.i204.i, <double 0x3EF99EB9C5AC8EBF, double 0x3EF99EB9C5AC8EBF>
  %add.i202.i = fadd <2 x double> %mul.i203.i, <double 0xBF56C0C33A85CD5F, double 0xBF56C0C33A85CD5F>
  %mul.i201.i = fmul <2 x double> %mul.i204.i, %add.i202.i
  %add.i200.i = fadd <2 x double> %mul.i201.i, <double 0x3FA55554A115BC8F, double 0x3FA55554A115BC8F>
  %mul.i199.i = fmul <2 x double> %mul.i204.i, %add.i200.i
  %mul.i198.i = fmul <2 x double> %mul.i204.i, %mul.i199.i
  %mul.i197.i = fmul <2 x double> %mul.i204.i, <double 5.000000e-01, double 5.000000e-01>
  %sub.i196.i = fsub <2 x double> %mul.i198.i, %mul.i197.i
  %add.i195.i = fadd <2 x double> %sub.i196.i, <double 1.000000e+00, double 1.000000e+00>
  %mul.i194.i = fmul <2 x double> %mul.i204.i, <double 0xBF29943F27086A6C, double 0xBF29943F27086A6C>
  %add.i193.i = fadd <2 x double> %mul.i194.i, <double 0x3F811073B3A82FFE, double 0x3F811073B3A82FFE>
  %mul.i192.i = fmul <2 x double> %mul.i204.i, %add.i193.i
  %add.i191.i = fadd <2 x double> %mul.i192.i, <double 0xBFC5555452709ADD, double 0xBFC5555452709ADD>
  %mul.i190.i = fmul <2 x double> %mul.i204.i, %add.i191.i
  %mul.i.i418 = fmul <2 x double> %add.i209.i417, %mul.i190.i
  %add.i189.i = fadd <2 x double> %add.i209.i417, %mul.i.i418
  %57 = shufflevector <4 x i32> %sext.i.i, <4 x i32> undef, <4 x i32> <i32 0, i32 0, i32 1, i32 1>
  %58 = bitcast <2 x double> %add.i189.i to <4 x i32>
  %and.i188.i = and <4 x i32> %57, %58
  %59 = bitcast <4 x i32> %and.i188.i to <2 x double>
  %neg.i.i = xor <4 x i32> %57, <i32 -1, i32 -1, i32 -1, i32 -1>
  %60 = bitcast <2 x double> %add.i195.i to <4 x i32>
  %and.i.i419 = and <4 x i32> %60, %neg.i.i
  %61 = bitcast <4 x i32> %and.i.i419 to <2 x double>
  %sub.i187.i = fsub <2 x double> %add.i189.i, %59
  %sub.i.i420 = fsub <2 x double> %add.i195.i, %61
  %add.i186.i = fadd <2 x double> %59, %61
  %add.i.i421 = fadd <2 x double> %sub.i187.i, %sub.i.i420
  %62 = bitcast <2 x double> %add.i186.i to <4 x i32>
  %xor.i185.i = xor <4 x i32> %62, %xor.i205.i
  %63 = bitcast <4 x i32> %xor.i185.i to <2 x double>
  %64 = bitcast <2 x double> %add.i.i421 to <4 x i32>
  %65 = shufflevector <4 x i32> %55, <4 x i32> undef, <4 x i32> <i32 2, i32 0, i32 2, i32 1>
  %xor.i.i422 = xor <4 x i32> %64, %65
  %66 = bitcast <4 x i32> %xor.i.i422 to <2 x double>
  %mul.i414 = fmul <2 x double> %41, %66
  %mul.i413 = fmul <2 x double> %41, %63
  %mul.i412 = fmul <2 x double> %41, %41
  %sub.i = fsub <2 x double> <double 1.000000e+00, double 1.000000e+00>, %mul.i412
  %67 = call <2 x double> @llvm.x86.sse2.sqrt.pd(<2 x double> %sub.i) #2
  %mul.i409 = fmul <2 x double> %vecinit1.i411, %mul.i414
  %mul.i406 = fmul <2 x double> %vecinit1.i408, %mul.i413
  %mul.i403 = fmul <2 x double> %67, %vecinit1.i405
  %add.i402 = fadd <2 x double> %mul.i403, %mul.i406
  %add.i401 = fadd <2 x double> %mul.i409, %add.i402
  %mul.i398 = fmul <2 x double> %vecinit1.i400, %mul.i414
  %mul.i395 = fmul <2 x double> %vecinit1.i397, %mul.i413
  %mul.i392 = fmul <2 x double> %67, %vecinit1.i394
  %add.i391 = fadd <2 x double> %mul.i392, %mul.i395
  %add.i390 = fadd <2 x double> %mul.i398, %add.i391
  %mul.i387 = fmul <2 x double> %vecinit1.i389, %mul.i414
  %mul.i384 = fmul <2 x double> %vecinit1.i386, %mul.i413
  %mul.i381 = fmul <2 x double> %67, %vecinit1.i383
  %add.i380 = fadd <2 x double> %mul.i381, %mul.i384
  %add.i379 = fadd <2 x double> %mul.i387, %add.i380
  %mul.i271.i294 = fmul <2 x double> %sub.i278.i287, %add.i401
  %mul.i270.i295 = fmul <2 x double> %sub.i275.i290, %add.i390
  %mul.i269.i296 = fmul <2 x double> %sub.i272.i293, %add.i379
  %add.i268.i297 = fadd <2 x double> %mul.i270.i295, %mul.i269.i296
  %add.i267.i298 = fadd <2 x double> %mul.i271.i294, %add.i268.i297
  %mul.i258.i308 = fmul <2 x double> %add.i267.i298, %add.i267.i298
  %sub.i257.i309 = fsub <2 x double> %mul.i258.i308, %sub.i259.i307
  %68 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> zeroinitializer, <2 x double> %sub.i257.i309, i8 1) #2
  %69 = call i32 @llvm.x86.sse2.movmsk.pd(<2 x double> %68) #2
  %tobool.i310 = icmp eq i32 %69, 0
  br i1 %tobool.i310, label %ray_sphere_intersect_simd.exit374, label %if.then.i315

if.then.i315:                                     ; preds = %for.body27
  %70 = bitcast <2 x double> %add.i267.i298 to <4 x i32>
  %xor.i.i311 = xor <4 x i32> %70, <i32 0, i32 -2147483648, i32 0, i32 -2147483648>
  %71 = bitcast <4 x i32> %xor.i.i311 to <2 x double>
  %72 = call <2 x double> @llvm.x86.sse2.sqrt.pd(<2 x double> %sub.i257.i309) #2
  %sub.i256.i312 = fsub <2 x double> %71, %72
  %73 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> zeroinitializer, <2 x double> %sub.i256.i312, i8 1) #2
  %74 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> %sub.i256.i312, <2 x double> <double 1.000000e+17, double 1.000000e+17>, i8 1) #2
  %75 = bitcast <2 x double> %73 to <4 x i32>
  %76 = bitcast <2 x double> %74 to <4 x i32>
  %and.i255.i313 = and <4 x i32> %75, %76
  %77 = bitcast <4 x i32> %and.i255.i313 to <2 x double>
  %78 = call i32 @llvm.x86.sse2.movmsk.pd(<2 x double> %77) #2
  %tobool36.i314 = icmp eq i32 %78, 0
  br i1 %tobool36.i314, label %ray_sphere_intersect_simd.exit374, label %if.then37.i373

if.then37.i373:                                   ; preds = %if.then.i315
  %79 = bitcast <2 x double> %sub.i256.i312 to <4 x i32>
  %and.i254.i316 = and <4 x i32> %and.i255.i313, %79
  %neg.i252.i317 = xor <4 x i32> %and.i255.i313, <i32 -1, i32 -1, i32 -1, i32 -1>
  %and.i253.i318 = and <4 x i32> %neg.i252.i317, <i32 -2049400832, i32 1131820119, i32 -2049400832, i32 1131820119>
  %or.i251.i319 = or <4 x i32> %and.i254.i316, %and.i253.i318
  %80 = bitcast <4 x i32> %or.i251.i319 to <2 x double>
  br label %ray_sphere_intersect_simd.exit374

ray_sphere_intersect_simd.exit374:                ; preds = %if.then37.i373, %if.then.i315, %for.body27
  %t.0.load525546 = phi <2 x double> [ <double 1.000000e+17, double 1.000000e+17>, %for.body27 ], [ <double 1.000000e+17, double 1.000000e+17>, %if.then.i315 ], [ %80, %if.then37.i373 ]
  %81 = phi <2 x double> [ zeroinitializer, %for.body27 ], [ zeroinitializer, %if.then.i315 ], [ %77, %if.then37.i373 ]
  %mul.i271.i204 = fmul <2 x double> %add.i401, %sub.i278.i197
  %mul.i270.i205 = fmul <2 x double> %add.i390, %sub.i275.i200
  %mul.i269.i206 = fmul <2 x double> %add.i379, %sub.i272.i203
  %add.i268.i207 = fadd <2 x double> %mul.i270.i205, %mul.i269.i206
  %add.i267.i208 = fadd <2 x double> %mul.i271.i204, %add.i268.i207
  %mul.i258.i218 = fmul <2 x double> %add.i267.i208, %add.i267.i208
  %sub.i257.i219 = fsub <2 x double> %mul.i258.i218, %sub.i259.i217
  %82 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> zeroinitializer, <2 x double> %sub.i257.i219, i8 1) #2
  %83 = call i32 @llvm.x86.sse2.movmsk.pd(<2 x double> %82) #2
  %tobool.i220 = icmp eq i32 %83, 0
  br i1 %tobool.i220, label %ray_sphere_intersect_simd.exit284, label %if.then.i225

if.then.i225:                                     ; preds = %ray_sphere_intersect_simd.exit374
  %84 = bitcast <2 x double> %add.i267.i208 to <4 x i32>
  %xor.i.i221 = xor <4 x i32> %84, <i32 0, i32 -2147483648, i32 0, i32 -2147483648>
  %85 = bitcast <4 x i32> %xor.i.i221 to <2 x double>
  %86 = call <2 x double> @llvm.x86.sse2.sqrt.pd(<2 x double> %sub.i257.i219) #2
  %sub.i256.i222 = fsub <2 x double> %85, %86
  %87 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> zeroinitializer, <2 x double> %sub.i256.i222, i8 1) #2
  %88 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> %sub.i256.i222, <2 x double> %t.0.load525546, i8 1) #2
  %89 = bitcast <2 x double> %87 to <4 x i32>
  %90 = bitcast <2 x double> %88 to <4 x i32>
  %and.i255.i223 = and <4 x i32> %89, %90
  %91 = bitcast <4 x i32> %and.i255.i223 to <2 x double>
  %92 = call i32 @llvm.x86.sse2.movmsk.pd(<2 x double> %91) #2
  %tobool36.i224 = icmp eq i32 %92, 0
  br i1 %tobool36.i224, label %ray_sphere_intersect_simd.exit284, label %if.then37.i283

if.then37.i283:                                   ; preds = %if.then.i225
  %93 = bitcast <2 x double> %sub.i256.i222 to <4 x i32>
  %and.i254.i226 = and <4 x i32> %and.i255.i223, %93
  %neg.i252.i227 = xor <4 x i32> %and.i255.i223, <i32 -1, i32 -1, i32 -1, i32 -1>
  %94 = bitcast <2 x double> %t.0.load525546 to <4 x i32>
  %and.i253.i228 = and <4 x i32> %94, %neg.i252.i227
  %or.i251.i229 = or <4 x i32> %and.i254.i226, %and.i253.i228
  %95 = bitcast <4 x i32> %or.i251.i229 to <2 x double>
  %96 = bitcast <2 x double> %81 to <4 x i32>
  %or.i250.i230 = or <4 x i32> %and.i255.i223, %96
  %97 = bitcast <4 x i32> %or.i250.i230 to <2 x double>
  br label %ray_sphere_intersect_simd.exit284

ray_sphere_intersect_simd.exit284:                ; preds = %if.then37.i283, %if.then.i225, %ray_sphere_intersect_simd.exit374
  %t.0.load525547 = phi <2 x double> [ %t.0.load525546, %ray_sphere_intersect_simd.exit374 ], [ %t.0.load525546, %if.then.i225 ], [ %95, %if.then37.i283 ]
  %98 = phi <2 x double> [ %81, %ray_sphere_intersect_simd.exit374 ], [ %81, %if.then.i225 ], [ %97, %if.then37.i283 ]
  %mul.i271.i = fmul <2 x double> %add.i401, %sub.i278.i
  %mul.i270.i = fmul <2 x double> %add.i390, %sub.i275.i
  %mul.i269.i = fmul <2 x double> %add.i379, %sub.i272.i
  %add.i268.i = fadd <2 x double> %mul.i270.i, %mul.i269.i
  %add.i267.i = fadd <2 x double> %mul.i271.i, %add.i268.i
  %mul.i258.i = fmul <2 x double> %add.i267.i, %add.i267.i
  %sub.i257.i = fsub <2 x double> %mul.i258.i, %sub.i259.i
  %99 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> zeroinitializer, <2 x double> %sub.i257.i, i8 1) #2
  %100 = call i32 @llvm.x86.sse2.movmsk.pd(<2 x double> %99) #2
  %tobool.i187 = icmp eq i32 %100, 0
  br i1 %tobool.i187, label %ray_sphere_intersect_simd.exit, label %if.then.i189

if.then.i189:                                     ; preds = %ray_sphere_intersect_simd.exit284
  %101 = bitcast <2 x double> %add.i267.i to <4 x i32>
  %xor.i.i188 = xor <4 x i32> %101, <i32 0, i32 -2147483648, i32 0, i32 -2147483648>
  %102 = bitcast <4 x i32> %xor.i.i188 to <2 x double>
  %103 = call <2 x double> @llvm.x86.sse2.sqrt.pd(<2 x double> %sub.i257.i) #2
  %sub.i256.i = fsub <2 x double> %102, %103
  %104 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> zeroinitializer, <2 x double> %sub.i256.i, i8 1) #2
  %105 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> %sub.i256.i, <2 x double> %t.0.load525547, i8 1) #2
  %106 = bitcast <2 x double> %104 to <4 x i32>
  %107 = bitcast <2 x double> %105 to <4 x i32>
  %and.i255.i = and <4 x i32> %106, %107
  %108 = bitcast <4 x i32> %and.i255.i to <2 x double>
  %109 = call i32 @llvm.x86.sse2.movmsk.pd(<2 x double> %108) #2
  %tobool36.i = icmp eq i32 %109, 0
  br i1 %tobool36.i, label %ray_sphere_intersect_simd.exit, label %if.then37.i

if.then37.i:                                      ; preds = %if.then.i189
  %110 = bitcast <2 x double> %sub.i256.i to <4 x i32>
  %and.i254.i = and <4 x i32> %and.i255.i, %110
  %neg.i252.i = xor <4 x i32> %and.i255.i, <i32 -1, i32 -1, i32 -1, i32 -1>
  %111 = bitcast <2 x double> %t.0.load525547 to <4 x i32>
  %and.i253.i = and <4 x i32> %111, %neg.i252.i
  %or.i251.i = or <4 x i32> %and.i254.i, %and.i253.i
  %112 = bitcast <4 x i32> %or.i251.i to <2 x double>
  %113 = bitcast <2 x double> %98 to <4 x i32>
  %or.i250.i = or <4 x i32> %and.i255.i, %113
  %114 = bitcast <4 x i32> %or.i250.i to <2 x double>
  br label %ray_sphere_intersect_simd.exit

ray_sphere_intersect_simd.exit:                   ; preds = %if.then37.i, %if.then.i189, %ray_sphere_intersect_simd.exit284
  %t.0.load525548 = phi <2 x double> [ %t.0.load525547, %ray_sphere_intersect_simd.exit284 ], [ %t.0.load525547, %if.then.i189 ], [ %112, %if.then37.i ]
  %115 = phi <2 x double> [ %98, %ray_sphere_intersect_simd.exit284 ], [ %98, %if.then.i189 ], [ %114, %if.then37.i ]
  %mul.i61.i = fmul <2 x double> %add.i401, %vecinit1.i79.i
  %mul.i58.i = fmul <2 x double> %add.i390, %vecinit1.i74.i
  %mul.i55.i = fmul <2 x double> %add.i379, %vecinit1.i69.i
  %add.i54.i = fadd <2 x double> %mul.i58.i, %mul.i55.i
  %add.i53.i = fadd <2 x double> %mul.i61.i, %add.i54.i
  %116 = bitcast <2 x double> %add.i53.i to <4 x i32>
  %and.i52.i = and <4 x i32> %116, <i32 -1, i32 2147483647, i32 -1, i32 2147483647>
  %117 = bitcast <4 x i32> %and.i52.i to <2 x double>
  %118 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> <double 1.000000e-17, double 1.000000e-17>, <2 x double> %117, i8 1) #2
  %div.i.i = fdiv <2 x double> %38, %add.i53.i
  %119 = bitcast <2 x double> %118 to <4 x i32>
  %120 = bitcast <2 x double> %div.i.i to <4 x i32>
  %and.i38.i = and <4 x i32> %119, %120
  %121 = bitcast <4 x i32> %and.i38.i to <2 x double>
  %122 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> zeroinitializer, <2 x double> %121, i8 1) #2
  %123 = call <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double> %121, <2 x double> %t.0.load525548, i8 1) #2
  %124 = bitcast <2 x double> %122 to <4 x i32>
  %125 = bitcast <2 x double> %123 to <4 x i32>
  %and.i37.i = and <4 x i32> %124, %125
  %126 = bitcast <4 x i32> %and.i37.i to <2 x double>
  %127 = call i32 @llvm.x86.sse2.movmsk.pd(<2 x double> %126) #2
  %tobool.i = icmp eq i32 %127, 0
  br i1 %tobool.i, label %ray_plane_intersect_simd.exit, label %if.then.i

if.then.i:                                        ; preds = %ray_sphere_intersect_simd.exit
  %128 = bitcast <2 x double> %115 to <4 x i32>
  %or.i32.i = or <4 x i32> %and.i37.i, %128
  %129 = bitcast <4 x i32> %or.i32.i to <2 x double>
  br label %ray_plane_intersect_simd.exit

ray_plane_intersect_simd.exit:                    ; preds = %if.then.i, %ray_sphere_intersect_simd.exit
  %130 = phi <2 x double> [ %115, %ray_sphere_intersect_simd.exit ], [ %129, %if.then.i ]
  %131 = bitcast <2 x double> %130 to <4 x i32>
  %and.i = and <4 x i32> %131, <i32 0, i32 1072693248, i32 0, i32 1072693248>
  %132 = bitcast <4 x i32> %and.i to <2 x double>
  %add.i = fadd <2 x double> %occlusionx2.1558, %132
  %add98 = add nsw i32 %i.1559, 2
  %cmp26 = icmp slt i32 %add98, 16
  br i1 %cmp26, label %for.body27, label %for.end99

for.end99:                                        ; preds = %ray_plane_intersect_simd.exit
  call void @llvm.stackrestore(i8* %16)
  %inc101 = add nsw i32 %j.0563, 1
  %exitcond567 = icmp eq i32 %inc101, 16
  br i1 %exitcond567, label %for.end102, label %for.body

for.end102:                                       ; preds = %for.end99
  %occlusionTmp.sroa.0.0.vec.extract = extractelement <2 x double> %add.i, i32 0
  %occlusionTmp.sroa.0.8.vec.extract = extractelement <2 x double> %add.i, i32 1
  %add106 = fadd double %occlusionTmp.sroa.0.0.vec.extract, %occlusionTmp.sroa.0.8.vec.extract
  %sub = fsub double 2.560000e+02, %add106
  %div = fmul double %sub, 3.906250e-03
  %x110 = getelementptr inbounds %struct._vec* %col, i32 0, i32 0
  store double %div, double* %x110, align 4, !tbaa !0
  %y111 = getelementptr inbounds %struct._vec* %col, i32 0, i32 1
  store double %div, double* %y111, align 4, !tbaa !0
  %z112 = getelementptr inbounds %struct._vec* %col, i32 0, i32 2
  store double %div, double* %z112, align 4, !tbaa !0
  call void @llvm.lifetime.end(i64 72, i8* %6) #2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare double @drand48() #0

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone
define zeroext i8 @clamp(double %f) #1 {
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

; Function Attrs: nounwind
define void @render(i8* nocapture %img, i32 %w, i32 %h, i32 %nsubsamples) #0 {
entry:
  %ray = alloca %struct._Ray, align 8
  %isect = alloca %struct._Isect, align 8
  %col = alloca %struct._vec, align 8
  %mul1 = mul i32 %w, 24
  %mul2 = mul i32 %mul1, %h
  %call = call noalias i8* @malloc(i32 %mul2) #2
  %0 = bitcast i8* %call to double*
  call void @llvm.memset.p0i8.i32(i8* %call, i8 0, i32 %mul2, i32 1, i1 false)
  %cmp230 = icmp sgt i32 %h, 0
  br i1 %cmp230, label %for.cond6.preheader.lr.ph, label %for.end130

for.cond6.preheader.lr.ph:                        ; preds = %entry
  %cmp7228 = icmp sgt i32 %w, 0
  %cmp10226 = icmp sgt i32 %nsubsamples, 0
  %conv16 = sitofp i32 %nsubsamples to double
  %conv17 = sitofp i32 %w to double
  %div18 = fmul double %conv17, 5.000000e-01
  %conv27 = sitofp i32 %h to double
  %div28 = fmul double %conv27, 5.000000e-01
  %1 = bitcast %struct._Ray* %ray to i8*
  %x34 = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 0, i32 0
  %y36 = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 0, i32 1
  %z = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 0, i32 2
  %x38 = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 1, i32 0
  %y40 = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 1, i32 1
  %z42 = getelementptr inbounds %struct._Ray* %ray, i32 0, i32 1, i32 2
  %2 = bitcast %struct._Isect* %isect to i8*
  %t = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 0
  %hit = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 3
  %dir.0.i = getelementptr %struct._Ray* %ray, i32 0, i32 1, i32 0
  %x45 = getelementptr inbounds %struct._vec* %col, i32 0, i32 0
  %y51 = getelementptr inbounds %struct._vec* %col, i32 0, i32 1
  %z58 = getelementptr inbounds %struct._vec* %col, i32 0, i32 2
  %x17.i = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 0
  %y24.i = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 1
  %z31.i = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 1, i32 2
  %n32.i = getelementptr inbounds %struct._Isect* %isect, i32 0, i32 2
  %3 = bitcast %struct._vec* %n32.i to i8*
  %mul68 = mul nsw i32 %nsubsamples, %nsubsamples
  %conv69 = sitofp i32 %mul68 to double
  br label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.inc128, %for.cond6.preheader.lr.ph
  %y.0231 = phi i32 [ 0, %for.cond6.preheader.lr.ph ], [ %inc129, %for.inc128 ]
  br i1 %cmp7228, label %for.cond9.preheader.lr.ph, label %for.inc128

for.cond9.preheader.lr.ph:                        ; preds = %for.cond6.preheader
  %conv22 = sitofp i32 %y.0231 to double
  %mul46 = mul nsw i32 %y.0231, %w
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.end67, %for.cond9.preheader.lr.ph
  %x.0229 = phi i32 [ 0, %for.cond9.preheader.lr.ph ], [ %inc126, %for.end67 ]
  br i1 %cmp10226, label %for.cond12.preheader.lr.ph.split.us, label %for.cond9.preheader.for.end67_crit_edge

for.cond9.preheader.for.end67_crit_edge:          ; preds = %for.cond9.preheader
  %add71.pre = add nsw i32 %x.0229, %mul46
  %mul72.pre = mul nsw i32 %add71.pre, 3
  %arrayidx74.pre = getelementptr inbounds double* %0, i32 %mul72.pre
  %add81.pre = add nsw i32 %mul72.pre, 1
  %arrayidx82.pre = getelementptr inbounds double* %0, i32 %add81.pre
  %add89.pre = add nsw i32 %mul72.pre, 2
  %arrayidx90.pre = getelementptr inbounds double* %0, i32 %add89.pre
  br label %for.end67

for.cond12.preheader.lr.ph.split.us:              ; preds = %for.cond9.preheader
  %conv = sitofp i32 %x.0229 to double
  %add47 = add nsw i32 %x.0229, %mul46
  %mul48 = mul nsw i32 %add47, 3
  %arrayidx = getelementptr inbounds double* %0, i32 %mul48
  %add55 = add nsw i32 %mul48, 1
  %arrayidx56 = getelementptr inbounds double* %0, i32 %add55
  %add62 = add nsw i32 %mul48, 2
  %arrayidx63 = getelementptr inbounds double* %0, i32 %add62
  br label %for.body14.lr.ph.us

for.inc65.us:                                     ; preds = %if.end.us
  %inc66.us = add nsw i32 %v.0227.us, 1
  %exitcond232 = icmp eq i32 %inc66.us, %nsubsamples
  br i1 %exitcond232, label %for.end67, label %for.body14.lr.ph.us

for.body14.us:                                    ; preds = %for.body14.lr.ph.us, %if.end.us
  %u.0225.us = phi i32 [ 0, %for.body14.lr.ph.us ], [ %inc.us, %if.end.us ]
  %conv15.us = sitofp i32 %u.0225.us to double
  %div.us = fdiv double %conv15.us, %conv16
  %add.us = fadd double %conv, %div.us
  %sub.us = fsub double %add.us, %div18
  %div21.us = fdiv double %sub.us, %div18
  call void @llvm.lifetime.start(i64 48, i8* %1) #2
  %4 = bitcast %struct._Ray* %ray to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 24, i32 8, i1 false)
  store double %div21.us, double* %x38, align 8, !tbaa !0
  store double %div33.us, double* %y40, align 8, !tbaa !0
  store double -1.000000e+00, double* %z42, align 8, !tbaa !0
  %mul.i.i.us = fmul double %div21.us, %div21.us
  %mul3.i.i.us = fmul double %div33.us, %div33.us
  %add.i.i.us = fadd double %mul.i.i.us, %mul3.i.i.us
  %add6.i.i.us = fadd double %add.i.i.us, 1.000000e+00
  %call1.i.us = call double @sqrt(double %add6.i.i.us) #2
  %call2.i.us = call double @fabs(double %call1.i.us) #4
  %cmp.i.us = fcmp ogt double %call2.i.us, 1.000000e-17
  br i1 %cmp.i.us, label %if.then.i.us, label %vnormalize.exit.us

if.then.i.us:                                     ; preds = %for.body14.us
  %div.i.us = fdiv double %div21.us, %call1.i.us
  store double %div.i.us, double* %x38, align 8, !tbaa !0
  %div3.i.us = fdiv double %div33.us, %call1.i.us
  store double %div3.i.us, double* %y40, align 8, !tbaa !0
  %div4.i.us = fdiv double -1.000000e+00, %call1.i.us
  store double %div4.i.us, double* %z42, align 8, !tbaa !0
  br label %vnormalize.exit.us

vnormalize.exit.us:                               ; preds = %if.then.i.us, %for.body14.us
  call void @llvm.lifetime.start(i64 60, i8* %2) #2
  store double 1.000000e+17, double* %t, align 8, !tbaa !0
  store i32 0, i32* %hit, align 8, !tbaa !3
  call void @ray_sphere_intersect(%struct._Isect* %isect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0))
  call void @ray_sphere_intersect(%struct._Isect* %isect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1))
  call void @ray_sphere_intersect(%struct._Isect* %isect, %struct._Ray* %ray, %struct._Sphere* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2))
  %n.061.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 0), align 4
  %n.162.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 1), align 4
  %n.263.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 2), align 4
  %dir.0.val.i.us = load double* %dir.0.i, align 8
  %dir.1.val.i.us = load double* %y40, align 8
  %dir.2.val.i.us = load double* %z42, align 8
  %mul.i69.i.us = fmul double %n.061.val.i.us, %dir.0.val.i.us
  %mul3.i70.i.us = fmul double %n.162.val.i.us, %dir.1.val.i.us
  %add.i71.i.us = fadd double %mul.i69.i.us, %mul3.i70.i.us
  %mul5.i72.i.us = fmul double %n.263.val.i.us, %dir.2.val.i.us
  %add6.i73.i.us = fadd double %add.i71.i.us, %mul5.i72.i.us
  %call3.i.us = call double @fabs(double %add6.i73.i.us) #4
  %cmp.i203.us = fcmp olt double %call3.i.us, 1.000000e-17
  br i1 %cmp.i203.us, label %ray_plane_intersect.exit.us, label %if.end.i.us

if.end.i.us:                                      ; preds = %vnormalize.exit.us
  %p.1.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 1), align 4
  %p.0.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 0), align 4
  %mul3.i.i204.us = fmul double %n.162.val.i.us, %p.1.val.i.us
  %mul.i.i205.us = fmul double %n.061.val.i.us, %p.0.val.i.us
  %p.2.val.i.us = load double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 2), align 4
  %mul5.i.i206.us = fmul double %n.263.val.i.us, %p.2.val.i.us
  %add.i.i207.us = fadd double %mul3.i.i204.us, %mul.i.i205.us
  %add6.i.i208.us = fadd double %add.i.i207.us, %mul5.i.i206.us
  %org.0.val.i.us = load double* %x34, align 8
  %org.1.val.i.us = load double* %y36, align 8
  %org.2.val.i.us = load double* %z, align 8
  %mul.i64.i.us = fmul double %n.061.val.i.us, %org.0.val.i.us
  %mul3.i65.i.us = fmul double %n.162.val.i.us, %org.1.val.i.us
  %add.i66.i.us = fadd double %mul.i64.i.us, %mul3.i65.i.us
  %mul5.i67.i.us = fmul double %n.263.val.i.us, %org.2.val.i.us
  %add6.i68.i.us = fadd double %add.i66.i.us, %mul5.i67.i.us
  %add.i.us = fsub double %add6.i68.i.us, %add6.i.i208.us
  %sub6.i.us = fsub double -0.000000e+00, %add.i.us
  %div.i209.us = fdiv double %sub6.i.us, %add6.i73.i.us
  %cmp7.i.us = fcmp ogt double %div.i209.us, 0.000000e+00
  br i1 %cmp7.i.us, label %land.lhs.true.i.us, label %ray_plane_intersect.exit.us

land.lhs.true.i.us:                               ; preds = %if.end.i.us
  %5 = load double* %t, align 8, !tbaa !0
  %cmp9.i.us = fcmp olt double %div.i209.us, %5
  br i1 %cmp9.i.us, label %if.then10.i.us, label %ray_plane_intersect.exit.us

if.then10.i.us:                                   ; preds = %land.lhs.true.i.us
  store double %div.i209.us, double* %t, align 8, !tbaa !0
  store i32 1, i32* %hit, align 8, !tbaa !3
  %mul.i.us = fmul double %div.i209.us, %dir.0.val.i.us
  %add15.i.us = fadd double %org.0.val.i.us, %mul.i.us
  store double %add15.i.us, double* %x17.i, align 8, !tbaa !0
  %mul21.i.us = fmul double %div.i209.us, %dir.1.val.i.us
  %add22.i.us = fadd double %org.1.val.i.us, %mul21.i.us
  store double %add22.i.us, double* %y24.i, align 8, !tbaa !0
  %mul28.i.us = fmul double %div.i209.us, %dir.2.val.i.us
  %add29.i.us = fadd double %org.2.val.i.us, %mul28.i.us
  store double %add29.i.us, double* %z31.i, align 8, !tbaa !0
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %3, i8* bitcast (%struct._vec* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1) to i8*), i32 24, i32 4, i1 false) #2, !tbaa.struct !4
  br label %ray_plane_intersect.exit.us

ray_plane_intersect.exit.us:                      ; preds = %if.then10.i.us, %land.lhs.true.i.us, %if.end.i.us, %vnormalize.exit.us
  %6 = load i32* %hit, align 8, !tbaa !3
  %tobool.us = icmp eq i32 %6, 0
  br i1 %tobool.us, label %if.end.us, label %if.then.us

if.then.us:                                       ; preds = %ray_plane_intersect.exit.us
  call void @ambient_occlusion(%struct._vec* %col, %struct._Isect* %isect)
  %7 = load double* %x45, align 8, !tbaa !0
  %8 = load double* %arrayidx, align 4, !tbaa !0
  %add50.us = fadd double %7, %8
  store double %add50.us, double* %arrayidx, align 4, !tbaa !0
  %9 = load double* %y51, align 8, !tbaa !0
  %10 = load double* %arrayidx56, align 4, !tbaa !0
  %add57.us = fadd double %9, %10
  store double %add57.us, double* %arrayidx56, align 4, !tbaa !0
  %11 = load double* %z58, align 8, !tbaa !0
  %12 = load double* %arrayidx63, align 4, !tbaa !0
  %add64.us = fadd double %11, %12
  store double %add64.us, double* %arrayidx63, align 4, !tbaa !0
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %ray_plane_intersect.exit.us
  call void @llvm.lifetime.end(i64 60, i8* %2) #2
  call void @llvm.lifetime.end(i64 48, i8* %1) #2
  %inc.us = add nsw i32 %u.0225.us, 1
  %exitcond = icmp eq i32 %inc.us, %nsubsamples
  br i1 %exitcond, label %for.inc65.us, label %for.body14.us

for.body14.lr.ph.us:                              ; preds = %for.inc65.us, %for.cond12.preheader.lr.ph.split.us
  %v.0227.us = phi i32 [ 0, %for.cond12.preheader.lr.ph.split.us ], [ %inc66.us, %for.inc65.us ]
  %conv23.us = sitofp i32 %v.0227.us to double
  %div25.us = fdiv double %conv23.us, %conv16
  %add26.us = fadd double %conv22, %div25.us
  %sub29.us = fsub double %add26.us, %div28
  %sub30.us = fsub double -0.000000e+00, %sub29.us
  %div33.us = fdiv double %sub30.us, %div28
  br label %for.body14.us

for.end67:                                        ; preds = %for.inc65.us, %for.cond9.preheader.for.end67_crit_edge
  %arrayidx90.pre-phi = phi double* [ %arrayidx90.pre, %for.cond9.preheader.for.end67_crit_edge ], [ %arrayidx63, %for.inc65.us ]
  %add89.pre-phi = phi i32 [ %add89.pre, %for.cond9.preheader.for.end67_crit_edge ], [ %add62, %for.inc65.us ]
  %arrayidx82.pre-phi = phi double* [ %arrayidx82.pre, %for.cond9.preheader.for.end67_crit_edge ], [ %arrayidx56, %for.inc65.us ]
  %add81.pre-phi = phi i32 [ %add81.pre, %for.cond9.preheader.for.end67_crit_edge ], [ %add55, %for.inc65.us ]
  %arrayidx74.pre-phi = phi double* [ %arrayidx74.pre, %for.cond9.preheader.for.end67_crit_edge ], [ %arrayidx, %for.inc65.us ]
  %mul72.pre-phi = phi i32 [ %mul72.pre, %for.cond9.preheader.for.end67_crit_edge ], [ %mul48, %for.inc65.us ]
  %13 = load double* %arrayidx74.pre-phi, align 4, !tbaa !0
  %div75 = fdiv double %13, %conv69
  store double %div75, double* %arrayidx74.pre-phi, align 4, !tbaa !0
  %14 = load double* %arrayidx82.pre-phi, align 4, !tbaa !0
  %div83 = fdiv double %14, %conv69
  store double %div83, double* %arrayidx82.pre-phi, align 4, !tbaa !0
  %15 = load double* %arrayidx90.pre-phi, align 4, !tbaa !0
  %div91 = fdiv double %15, %conv69
  store double %div91, double* %arrayidx90.pre-phi, align 4, !tbaa !0
  %mul.i210 = fmul double %div75, 2.555000e+02
  %conv.i = fptosi double %mul.i210 to i32
  %cmp.i211 = icmp slt i32 %conv.i, 0
  %.conv.i = select i1 %cmp.i211, i32 0, i32 %conv.i
  %cmp2.i = icmp sgt i32 %.conv.i, 255
  %16 = trunc i32 %.conv.i to i8
  %conv6.i = select i1 %cmp2.i, i8 -1, i8 %16
  %arrayidx102 = getelementptr inbounds i8* %img, i32 %mul72.pre-phi
  store i8 %conv6.i, i8* %arrayidx102, align 1, !tbaa !1
  %mul.i212 = fmul double %div83, 2.555000e+02
  %conv.i213 = fptosi double %mul.i212 to i32
  %cmp.i214 = icmp slt i32 %conv.i213, 0
  %.conv.i215 = select i1 %cmp.i214, i32 0, i32 %conv.i213
  %cmp2.i216 = icmp sgt i32 %.conv.i215, 255
  %17 = trunc i32 %.conv.i215 to i8
  %conv6.i217 = select i1 %cmp2.i216, i8 -1, i8 %17
  %arrayidx113 = getelementptr inbounds i8* %img, i32 %add81.pre-phi
  store i8 %conv6.i217, i8* %arrayidx113, align 1, !tbaa !1
  %mul.i218 = fmul double %div91, 2.555000e+02
  %conv.i219 = fptosi double %mul.i218 to i32
  %cmp.i220 = icmp slt i32 %conv.i219, 0
  %.conv.i221 = select i1 %cmp.i220, i32 0, i32 %conv.i219
  %cmp2.i222 = icmp sgt i32 %.conv.i221, 255
  %18 = trunc i32 %.conv.i221 to i8
  %conv6.i223 = select i1 %cmp2.i222, i8 -1, i8 %18
  %arrayidx124 = getelementptr inbounds i8* %img, i32 %add89.pre-phi
  store i8 %conv6.i223, i8* %arrayidx124, align 1, !tbaa !1
  %inc126 = add nsw i32 %x.0229, 1
  %exitcond233 = icmp eq i32 %inc126, %w
  br i1 %exitcond233, label %for.inc128, label %for.cond9.preheader

for.inc128:                                       ; preds = %for.end67, %for.cond6.preheader
  %inc129 = add nsw i32 %y.0231, 1
  %exitcond234 = icmp eq i32 %inc129, %h
  br i1 %exitcond234, label %for.end130, label %for.cond6.preheader

for.end130:                                       ; preds = %for.inc128, %entry
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) #0

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #2

; Function Attrs: nounwind
define void @init_scene() #0 {
entry:
  store double -2.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !0
  store double -3.500000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !0
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 1), align 4, !tbaa !0
  store double -5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 0), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 1), align 4, !tbaa !0
  store double -3.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 2), align 4, !tbaa !0
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 1), align 4, !tbaa !0
  store double 1.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 0), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 1), align 4, !tbaa !0
  store double -2.200000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 2), align 4, !tbaa !0
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 1), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 0), align 4, !tbaa !0
  store double -5.000000e-01, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 1), align 4, !tbaa !0
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 2) to i8*), i8 0, i64 16, i32 4, i1 false)
  store double 1.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 1), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 2), align 4, !tbaa !0
  ret void
}

; Function Attrs: nounwind
define void @saveppm(i8* nocapture %fname, i32 %w, i32 %h, i8* nocapture %img) #0 {
entry:
  %call = tail call %struct._IO_FILE* @fopen(i8* %fname, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0)) #2
  %tobool = icmp eq %struct._IO_FILE* %call, null
  br i1 %tobool, label %cond.false, label %cond.end

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 460, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.saveppm, i32 0, i32 0)) #5
  unreachable

cond.end:                                         ; preds = %entry
  %0 = tail call i32 @fwrite(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 3, i32 1, %struct._IO_FILE* %call) #2
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i32 %w, i32 %h) #2
  %1 = tail call i32 @fwrite(i8* getelementptr inbounds ([5 x i8]* @.str6, i32 0, i32 0), i32 4, i32 1, %struct._IO_FILE* %call) #2
  %mul = mul i32 %w, 3
  %mul4 = mul i32 %mul, %h
  %call5 = tail call i32 @fwrite(i8* %img, i32 %mul4, i32 1, %struct._IO_FILE* %call) #2
  %call6 = tail call i32 @fclose(%struct._IO_FILE* %call) #2
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture, i8* nocapture) #0

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture, ...) #0

; Function Attrs: nounwind
declare i32 @fwrite(i8* nocapture, i32, i32, %struct._IO_FILE* nocapture) #0

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #0

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** nocapture %argv) #0 {
entry:
  %call = tail call noalias i8* @malloc(i32 786432) #2
  store double -2.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 0), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 1), align 4, !tbaa !0
  store double -3.500000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 0, i32 2), align 4, !tbaa !0
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 0, i32 1), align 4, !tbaa !0
  store double -5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 0), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 1), align 4, !tbaa !0
  store double -3.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 0, i32 2), align 4, !tbaa !0
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 1, i32 1), align 4, !tbaa !0
  store double 1.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 0), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 1), align 4, !tbaa !0
  store double -2.200000e+00, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 0, i32 2), align 4, !tbaa !0
  store double 5.000000e-01, double* getelementptr inbounds ([3 x %struct._Sphere]* @spheres, i32 0, i32 2, i32 1), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 0), align 4, !tbaa !0
  store double -5.000000e-01, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 1), align 4, !tbaa !0
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 0, i32 2) to i8*), i8 0, i64 16, i32 4, i1 false) #2
  store double 1.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 1), align 4, !tbaa !0
  store double 0.000000e+00, double* getelementptr inbounds (%struct._Plane* @plane, i32 0, i32 1, i32 2), align 4, !tbaa !0
  %call1 = tail call i32 @clock() #2
  tail call void @render(i8* %call, i32 512, i32 512, i32 4)
  %call2 = tail call i32 @clock() #2
  %sub = sub nsw i32 %call2, %call1
  %conv = sitofp i32 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str7, i32 0, i32 0), double %div) #2
  tail call void @saveppm(i8* getelementptr inbounds ([7 x i8]* @.str8, i32 0, i32 0), i32 512, i32 512, i8* %call)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @clock() #0

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture, ...) #0

; Function Attrs: nounwind readnone
declare i32 @llvm.x86.sse2.movmsk.pd(<2 x double>) #4

; Function Attrs: nounwind readnone
declare <2 x double> @llvm.x86.sse2.cmp.pd(<2 x double>, <2 x double>, i8) #4

; Function Attrs: nounwind readnone
declare <4 x i32> @llvm.x86.sse2.pslli.d(<4 x i32>, i32) #4

; Function Attrs: nounwind readnone
declare <2 x double> @llvm.x86.sse2.cvtdq2pd(<4 x i32>) #4

; Function Attrs: nounwind readnone
declare <4 x i32> @llvm.x86.sse2.cvttpd2dq(<2 x double>) #4

; Function Attrs: nounwind readnone
declare <2 x double> @llvm.x86.sse2.sqrt.pd(<2 x double>) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { noreturn nounwind }

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{i64 0, i64 8, metadata !0, i64 8, i64 8, metadata !0, i64 16, i64 8, metadata !0}
