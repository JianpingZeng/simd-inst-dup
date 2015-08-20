; ModuleID = 'scanner_opt.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.xyz = type { double, i32 }
%struct.f1_neuron = type { double*, double, double, double, double, double, double, double }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@winner = common global i32 0, align 4
@Y = common global %struct.xyz* null, align 8
@d = common global double 0.000000e+00, align 8
@numf2s = common global i32 0, align 4
@numf1s = common global i32 0, align 4
@f1_layer = common global %struct.f1_neuron* null, align 8
@c = common global double 0.000000e+00, align 8
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [22 x i8] c"potential div by zero\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"div by zero\00", align 1
@resonant = common global i32 0, align 4
@tds = common global double** null, align 8
@delta_t = common global double 0.000000e+00, align 8
@bus = common global double** null, align 8
@a = common global double 0.000000e+00, align 8
@b = common global double 0.000000e+00, align 8
@theta = common global double 0.000000e+00, align 8
@rho = common global double 0.000000e+00, align 8
@.str2 = private unnamed_addr constant [26 x i8] c"malloc error in init_net\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [20 x i8] c"Malloc error for Y\0A\00", align 1
@fp = common global %struct._IO_FILE* null, align 8
@.str4 = private unnamed_addr constant [3 x i8] c"%i\00", align 1
@.str5 = private unnamed_addr constant [12 x i8] c"%i %f %i %f\00", align 1
@cp = common global i32 0, align 4
@.str6 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c" %8.5f \00", align 1
@.str11 = private unnamed_addr constant [9 x i8] c" %8.16f\0A\00", align 1
@.str12 = private unnamed_addr constant [9 x i8] c" %8.16f \00", align 1
@.str14 = private unnamed_addr constant [19 x i8] c" j = %i  Y= %9.7f\0A\00", align 1
@pass_flag = common global i32 0, align 4
@.str15 = private unnamed_addr constant [53 x i8] c"F2 neuron %d passes vigilance with a value of %0.4f\0A\00", align 1
@highest_confidence = common global [2 x double] zeroinitializer, align 16
@set_high = common global [2 x i32] zeroinitializer, align 4
@.str16 = private unnamed_addr constant [18 x i8] c"Error opening %s\0A\00", align 1
@width = common global i32 0, align 4
@height = common global i32 0, align 4
@.str17 = private unnamed_addr constant [37 x i8] c"Problems with malloc in loadimage()\0A\00", align 1
@cimage = common global i8** null, align 8
@.str18 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str19 = private unnamed_addr constant [19 x i8] c"Unable to open %s\0A\00", align 1
@.str21 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@lwidth = common global i32 0, align 4
@lheight = common global i32 0, align 4
@numinputs = common global i32 0, align 4
@numpatterns = common global i32 0, align 4
@.str22 = private unnamed_addr constant [4 x i8] c"%le\00", align 1
@.str23 = private unnamed_addr constant [32 x i8] c"Malloc problem in load_weights\0A\00", align 1
@i = common global i64 0, align 8
@.str24 = private unnamed_addr constant [39 x i8] c"Dimensions of first image do not match\00", align 1
@.str25 = private unnamed_addr constant [24 x i8] c" dimensions of second.\0A\00", align 1
@.str26 = private unnamed_addr constant [40 x i8] c"Startx %d or Starty %d is out of range\0A\00", align 1
@.str27 = private unnamed_addr constant [36 x i8] c"endx %d or endy %d is out of range\0A\00", align 1
@highx = common global [2 x i32] zeroinitializer, align 4
@highy = common global [2 x i32] zeroinitializer, align 4
@.str28 = private unnamed_addr constant [3 x i8] c"-v\00", align 1
@.str29 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str30 = private unnamed_addr constant [10 x i8] c"-scanfile\00", align 1
@.str31 = private unnamed_addr constant [12 x i8] c"-weightfile\00", align 1
@.str32 = private unnamed_addr constant [12 x i8] c"-trainfile1\00", align 1
@.str33 = private unnamed_addr constant [12 x i8] c"-trainfile2\00", align 1
@.str34 = private unnamed_addr constant [8 x i8] c"-startx\00", align 1
@.str35 = private unnamed_addr constant [8 x i8] c"-starty\00", align 1
@.str36 = private unnamed_addr constant [6 x i8] c"-endx\00", align 1
@.str37 = private unnamed_addr constant [6 x i8] c"-endy\00", align 1
@.str38 = private unnamed_addr constant [8 x i8] c"-stride\00", align 1
@.str39 = private unnamed_addr constant [9 x i8] c"-objects\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"ERROR: Unknown option -> %s\0A\00", align 1
@.str41 = private unnamed_addr constant [33 x i8] c"ERROR: Must specify input files\0A\00", align 1
@.str42 = private unnamed_addr constant [46 x i8] c"ERROR: Must specify weightfile or trainfile1\0A\00", align 1
@.str43 = private unnamed_addr constant [49 x i8] c"ERROR: Cannot specify weightfile and trainfile1\0A\00", align 1
@.str44 = private unnamed_addr constant [62 x i8] c"Highest vigilance for 1 = %0.4f for object at X = %d, Y = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [62 x i8] c"Highest vigilance for 2 = %0.4f for object at X = %d, Y = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [161 x i8] c"Usage: scanner [-startx <num>] [-starty <num>] [-endx <num>] [-endy <num>] [-stride <num>] -scanfile <filename> -trainfile1 <filename> [-trainfile2 <filename>]\0A\00", align 1
@.str47 = private unnamed_addr constant [15 x i8] c"Version 1.00 \0A\00", align 1
@j = common global i64 0, align 8
@str48 = private unnamed_addr constant [46 x i8] c"============  TOP down WEIGHTS ==============\00"
@str49 = private unnamed_addr constant [47 x i8] c"============  BOTTOM up WEIGHTS ==============\00"
@str50 = private unnamed_addr constant [2 x i8] c"\0A\00"
@str51 = private unnamed_addr constant [24 x i8] c"made it to load_weights\00"

; Function Attrs: nounwind readonly uwtable
define double @g(i32 %i) #0 {
entry:
  %0 = load i32* @winner, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, %i
  br i1 %cmp, label %if.else, label %if.end4

if.else:                                          ; preds = %entry
  %idxprom = sext i32 %i to i64
  %1 = load %struct.xyz** @Y, align 8, !tbaa !5
  %y = getelementptr inbounds %struct.xyz* %1, i64 %idxprom, i32 0
  %2 = load double* %y, align 8, !tbaa !7
  %cmp1 = fcmp ogt double %2, 0.000000e+00
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.else
  %3 = load double* @d, align 8, !tbaa !10
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else, %entry
  %result.0 = phi double [ %3, %if.then2 ], [ 0.000000e+00, %entry ], [ 0.000000e+00, %if.else ]
  ret double %result.0
}

; Function Attrs: nounwind uwtable
define void @find_match() #1 {
entry:
  store i32 0, i32* @winner, align 4, !tbaa !1
  %0 = load i32* @numf2s, align 4, !tbaa !1
  %cmp8 = icmp sgt i32 %0, 0
  br i1 %cmp8, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %1 = load %struct.xyz** @Y, align 8, !tbaa !5
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %2 = phi i32 [ 0, %for.body.lr.ph ], [ %6, %for.inc ]
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %y = getelementptr inbounds %struct.xyz* %1, i64 %indvars.iv, i32 0
  %3 = load double* %y, align 8, !tbaa !7
  %idxprom1 = sext i32 %2 to i64
  %y3 = getelementptr inbounds %struct.xyz* %1, i64 %idxprom1, i32 0
  %4 = load double* %y3, align 8, !tbaa !7
  %cmp4 = fcmp ogt double %3, %4
  br i1 %cmp4, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = trunc i64 %indvars.iv to i32
  store i32 %5, i32* @winner, align 4, !tbaa !1
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body
  %6 = phi i32 [ %2, %for.body ], [ %5, %if.then ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define double @simtest() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp88 = icmp sgt i32 %0, 0
  br i1 %cmp88, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %1 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv96 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next97, %for.body ]
  %norm.089 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add, %for.body ]
  %P = getelementptr inbounds %struct.f1_neuron* %1, i64 %indvars.iv96, i32 5
  %2 = load double* %P, align 8, !tbaa !11
  %mul = fmul double %2, %2
  %add = fadd double %norm.089, %mul
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %lftr.wideiv5 = trunc i64 %indvars.iv.next97 to i32
  %exitcond6 = icmp eq i32 %lftr.wideiv5, %0
  br i1 %exitcond6, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %norm.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  %call = tail call double @sqrt(double %norm.0.lcssa) #6
  %3 = load double* @c, align 8, !tbaa !10
  %mul4 = fmul double %call, %3
  %add5 = fadd double %mul4, 0.000000e+00
  %4 = load i32* @numf1s, align 4, !tbaa !1
  %cmp784 = icmp sgt i32 %4, 0
  br i1 %cmp784, label %for.body8.lr.ph, label %for.end18

for.body8.lr.ph:                                  ; preds = %for.end
  %5 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.lr.ph
  %indvars.iv94 = phi i64 [ 0, %for.body8.lr.ph ], [ %indvars.iv.next95, %for.body8 ]
  %norm.185 = phi double [ 0.000000e+00, %for.body8.lr.ph ], [ %add15, %for.body8 ]
  %U = getelementptr inbounds %struct.f1_neuron* %5, i64 %indvars.iv94, i32 4
  %6 = load double* %U, align 8, !tbaa !13
  %mul14 = fmul double %6, %6
  %add15 = fadd double %norm.185, %mul14
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %lftr.wideiv3 = trunc i64 %indvars.iv.next95 to i32
  %exitcond4 = icmp eq i32 %lftr.wideiv3, %4
  br i1 %exitcond4, label %for.end18, label %for.body8

for.end18:                                        ; preds = %for.body8, %for.end
  %norm.1.lcssa = phi double [ 0.000000e+00, %for.end ], [ %add15, %for.body8 ]
  %call19 = tail call double @sqrt(double %norm.1.lcssa) #6
  %add20 = fadd double %add5, %call19
  %7 = load i32* @numf1s, align 4, !tbaa !1
  %cmp2282 = icmp sgt i32 %7, 0
  br i1 %cmp2282, label %for.body23.lr.ph, label %for.end50

for.body23.lr.ph:                                 ; preds = %for.end18
  %8 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body23

for.body23:                                       ; preds = %for.body23, %for.body23.lr.ph
  %indvars.iv92 = phi i64 [ 0, %for.body23.lr.ph ], [ %indvars.iv.next93, %for.body23 ]
  %U26 = getelementptr inbounds %struct.f1_neuron* %8, i64 %indvars.iv92, i32 4
  %9 = load double* %U26, align 8, !tbaa !13
  %10 = load double* @c, align 8, !tbaa !10
  %P29 = getelementptr inbounds %struct.f1_neuron* %8, i64 %indvars.iv92, i32 5
  %11 = load double* %P29, align 8, !tbaa !11
  %mul30 = fmul double %10, %11
  %add31 = fadd double %9, %mul30
  %div = fdiv double %add31, %add20
  %R = getelementptr inbounds %struct.f1_neuron* %8, i64 %indvars.iv92, i32 7
  store double %div, double* %R, align 8, !tbaa !14
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv.next93 to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %7
  br i1 %exitcond2, label %for.body39, label %for.body23

for.body39:                                       ; preds = %for.body39, %for.body23
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body39 ], [ 0, %for.body23 ]
  %norm.280 = phi double [ %add47, %for.body39 ], [ 0.000000e+00, %for.body23 ]
  %R42 = getelementptr inbounds %struct.f1_neuron* %8, i64 %indvars.iv, i32 7
  %12 = load double* %R42, align 8, !tbaa !14
  %mul46 = fmul double %12, %12
  %add47 = fadd double %norm.280, %mul46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %7
  br i1 %exitcond, label %for.end50, label %for.body39

for.end50:                                        ; preds = %for.body39, %for.end18
  %norm.2.lcssa = phi double [ 0.000000e+00, %for.end18 ], [ %add47, %for.body39 ]
  %call51 = tail call double @sqrt(double %norm.2.lcssa) #6
  ret double %call51
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define double @simtest2() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp106 = icmp sgt i32 %0, 0
  br i1 %cmp106, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %1 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %su2.0109 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add10, %for.body ]
  %sp.0108 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add3, %for.body ]
  %su.0107 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add, %for.body ]
  %2 = phi <2 x double> [ zeroinitializer, %for.body.lr.ph ], [ %10, %for.body ]
  %U = getelementptr inbounds %struct.f1_neuron* %1, i64 %indvars.iv, i32 4
  %3 = load double* %U, align 8, !tbaa !13
  %add = fadd double %su.0107, %3
  %P = getelementptr inbounds %struct.f1_neuron* %1, i64 %indvars.iv, i32 5
  %4 = load double* %P, align 8, !tbaa !11
  %add3 = fadd double %sp.0108, %4
  %mul = fmul double %3, %3
  %add10 = fadd double %su2.0109, %mul
  %5 = insertelement <2 x double> undef, double %3, i32 0
  %6 = insertelement <2 x double> %5, double %4, i32 1
  %7 = insertelement <2 x double> undef, double %4, i32 0
  %8 = insertelement <2 x double> %7, double %4, i32 1
  %9 = fmul <2 x double> %6, %8
  %10 = fadd <2 x double> %2, %9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  %11 = extractelement <2 x double> %10, i32 0
  %12 = extractelement <2 x double> %10, i32 1
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %sup.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %11, %for.end.loopexit ]
  %sp2.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %12, %for.end.loopexit ]
  %su2.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add10, %for.end.loopexit ]
  %sp.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add3, %for.end.loopexit ]
  %su.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.end.loopexit ]
  %conv = sitofp i32 %0 to double
  %mul27 = fmul double %conv, %su2.0.lcssa
  %mul28 = fmul double %su.0.lcssa, %su.0.lcssa
  %sub = fsub double %mul27, %mul28
  %sub31 = fadd double %conv, -1.000000e+00
  %mul32 = fmul double %conv, %sub31
  %div = fdiv double %sub, %mul32
  %call = tail call double @sqrt(double %div) #6
  %13 = load i32* @numf1s, align 4, !tbaa !1
  %conv33 = sitofp i32 %13 to double
  %mul34 = fmul double %sp2.0.lcssa, %conv33
  %mul35 = fmul double %sp.0.lcssa, %sp.0.lcssa
  %sub36 = fsub double %mul34, %mul35
  %sub39 = fadd double %conv33, -1.000000e+00
  %mul40 = fmul double %conv33, %sub39
  %div41 = fdiv double %sub36, %mul40
  %call42 = tail call double @sqrt(double %div41) #6
  %14 = load i32* @numf1s, align 4, !tbaa !1
  %conv43 = sitofp i32 %14 to double
  %mul44 = fmul double %sup.0.lcssa, %conv43
  %mul45 = fmul double %sp.0.lcssa, %su.0.lcssa
  %sub46 = fsub double %mul44, %mul45
  %mul48 = fmul double %su2.0.lcssa, %conv43
  %sub50 = fsub double %mul48, %mul28
  %call51 = tail call double @sqrt(double %sub50) #6
  %15 = load i32* @numf1s, align 4, !tbaa !1
  %conv52 = sitofp i32 %15 to double
  %mul53 = fmul double %sp2.0.lcssa, %conv52
  %sub55 = fsub double %mul53, %mul35
  %call56 = tail call double @sqrt(double %sub55) #6
  %mul57 = fmul double %call51, %call56
  %add58 = fadd double %sub46, 1.000000e-10
  %add59 = fadd double %mul57, 1.000000e-10
  %div60 = fdiv double %add58, %add59
  %cmp61 = fcmp oeq double %sub46, 0.000000e+00
  %cmp63 = fcmp oeq double %mul57, 0.000000e+00
  %or.cond = or i1 %cmp61, %cmp63
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %16 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %16) #8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %r.0 = phi double [ 1.000000e+00, %if.then ], [ %div60, %for.end ]
  %cmp66 = fcmp une double %sub46, 0.000000e+00
  %or.cond74 = and i1 %cmp66, %cmp63
  br i1 %or.cond74, label %if.then70, label %if.end72

if.then70:                                        ; preds = %if.end
  %18 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([12 x i8]* @.str1, i64 0, i64 0), i64 11, i64 1, %struct._IO_FILE* %18) #8
  br label %if.end72

if.end72:                                         ; preds = %if.then70, %if.end
  %r.1 = phi double [ 1.000000e+00, %if.then70 ], [ %r.0, %if.end ]
  %mul73 = fmul double %r.1, %r.1
  ret double %mul73
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define void @weightadj() #1 {
entry:
  %0 = load i32* @winner, align 4, !tbaa !1
  %1 = load i32* @numf1s, align 4, !tbaa !1
  %cmp295 = icmp sgt i32 %1, 0
  %idxprom = sext i32 %0 to i64
  %2 = load double*** @tds, align 8, !tbaa !5
  %3 = load %struct.xyz** @Y, align 8, !tbaa !5
  %y.i = getelementptr inbounds %struct.xyz* %3, i64 %idxprom, i32 0
  %4 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %5 = load double*** @bus, align 8, !tbaa !5
  br i1 %cmp295, label %if.else.i.us, label %for.inc59

if.else.i.us:                                     ; preds = %if.else.i.us, %entry
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %if.else.i.us ], [ 0, %entry ]
  %..lcssa107 = phi i32 [ %..lcssa106, %if.else.i.us ], [ 0, %entry ]
  %arrayidx.us = getelementptr inbounds double** %2, i64 %indvars.iv110
  %6 = load double** %arrayidx.us, align 8, !tbaa !5
  %arrayidx5.us = getelementptr inbounds double* %6, i64 %idxprom
  %7 = load double* %arrayidx5.us, align 8, !tbaa !10
  %8 = load double* %y.i, align 8, !tbaa !7
  %cmp1.i.us = fcmp ogt double %8, 0.000000e+00
  %9 = load double* @d, align 8, !tbaa !10
  %result.0.i.us = select i1 %cmp1.i.us, double %9, double 0.000000e+00
  %P.us = getelementptr inbounds %struct.f1_neuron* %4, i64 %indvars.iv110, i32 5
  %10 = load double* %P.us, align 8, !tbaa !11
  %sub.us = fsub double %10, %7
  %mul.us = fmul double %result.0.i.us, %sub.us
  %11 = load double* @delta_t, align 8, !tbaa !10
  %mul12.us = fmul double %11, %mul.us
  %add.us = fadd double %7, %mul12.us
  store double %add.us, double* %arrayidx5.us, align 8, !tbaa !10
  %sub21.us = fsub double %7, %add.us
  %call22.us = tail call double @fabs(double %sub21.us) #9
  %cmp23.us = fcmp ugt double %call22.us, 1.000000e-09
  %..lcssa106 = select i1 %cmp23.us, i32 %..lcssa107, i32 1
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv.next111 to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %1
  br i1 %exitcond2, label %if.else.i91.us, label %if.else.i.us

if.else.i91.us:                                   ; preds = %if.else.i91.us, %if.else.i.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %if.else.i91.us ], [ 0, %if.else.i.us ]
  %.99.us = phi i32 [ %..us, %if.else.i91.us ], [ %..lcssa106, %if.else.i.us ]
  %arrayidx29.us = getelementptr inbounds double** %5, i64 %indvars.iv112
  %12 = load double** %arrayidx29.us, align 8, !tbaa !5
  %arrayidx30.us = getelementptr inbounds double* %12, i64 %idxprom
  %13 = load double* %arrayidx30.us, align 8, !tbaa !10
  %14 = load double* %y.i, align 8, !tbaa !7
  %cmp1.i90.us = fcmp ogt double %14, 0.000000e+00
  %15 = load double* @d, align 8, !tbaa !10
  %result.0.i93.us = select i1 %cmp1.i90.us, double %15, double 0.000000e+00
  %P34.us = getelementptr inbounds %struct.f1_neuron* %4, i64 %indvars.iv112, i32 5
  %16 = load double* %P34.us, align 8, !tbaa !11
  %sub39.us = fsub double %16, %13
  %mul40.us = fmul double %result.0.i93.us, %sub39.us
  %17 = load double* @delta_t, align 8, !tbaa !10
  %mul41.us = fmul double %17, %mul40.us
  %add46.us = fadd double %13, %mul41.us
  store double %add46.us, double* %arrayidx30.us, align 8, !tbaa !10
  %sub51.us = fsub double %13, %add46.us
  %call52.us = tail call double @fabs(double %sub51.us) #9
  %cmp53.us = fcmp ole double %call52.us, 1.000000e-09
  %tobool.us = icmp ne i32 %.99.us, 0
  %or.cond.us = and i1 %cmp53.us, %tobool.us
  %..us = zext i1 %or.cond.us to i32
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next113 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %1
  br i1 %exitcond, label %for.inc59, label %if.else.i91.us

for.inc59:                                        ; preds = %if.else.i91.us, %entry
  %..lcssa108 = phi i32 [ 0, %entry ], [ %..us, %if.else.i91.us ]
  store i32 %..lcssa108, i32* @resonant, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #3

; Function Attrs: nounwind uwtable
define void @init_globs(i32 %mode) #1 {
entry:
  %cmp = icmp eq i32 %mode, 0
  store double 2.550000e+02, double* @a, align 8, !tbaa !10
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* @b, align 8, !tbaa !10
  store double 1.100000e-01, double* @c, align 8, !tbaa !10
  store double 9.000000e-01, double* @d, align 8, !tbaa !10
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %conv = sitofp i32 %0 to double
  %call = tail call double @sqrt(double %conv) #6
  br label %if.end

if.else:                                          ; preds = %entry
  store double 1.000000e+01, double* @b, align 8, !tbaa !10
  store double 1.100000e-01, double* @c, align 8, !tbaa !10
  store double 9.000000e-01, double* @d, align 8, !tbaa !10
  %1 = load i32* @numf1s, align 4, !tbaa !1
  %conv1 = sitofp i32 %1 to double
  %call2 = tail call double @sqrt(double %conv1) #6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2.pn = phi double [ %call2, %if.else ], [ %call, %if.then ]
  %storemerge4 = phi double [ 7.000000e-01, %if.else ], [ 1.000000e-01, %if.then ]
  %storemerge = phi double [ 9.500000e-01, %if.else ], [ 7.000000e-01, %if.then ]
  %storemerge5 = fdiv double 1.000000e+00, %call2.pn
  store double %storemerge5, double* @theta, align 8, !tbaa !10
  store double %storemerge4, double* @delta_t, align 8, !tbaa !10
  store double %storemerge, double* @rho, align 8, !tbaa !10
  ret void
}

; Function Attrs: nounwind uwtable
define void @init_net() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %conv = sext i32 %0 to i64
  %mul = shl nsw i64 %conv, 6
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %1 = bitcast i8* %call to %struct.f1_neuron*
  store %struct.f1_neuron* %1, %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp346 = icmp sgt i32 %0, 0
  br i1 %cmp346, label %for.body, label %for.end

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %2) #8
  tail call void @exit(i32 1) #10
  unreachable

for.body:                                         ; preds = %if.end13, %for.cond.preheader
  %4 = phi %struct.f1_neuron* [ %6, %if.end13 ], [ %1, %for.cond.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end13 ], [ 0, %for.cond.preheader ]
  %call5 = tail call noalias i8* @malloc(i64 16) #6
  %5 = bitcast i8* %call5 to double*
  %I = getelementptr inbounds %struct.f1_neuron* %4, i64 %indvars.iv, i32 0
  store double* %5, double** %I, align 8, !tbaa !15
  %6 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %I8 = getelementptr inbounds %struct.f1_neuron* %6, i64 %indvars.iv, i32 0
  %7 = load double** %I8, align 8, !tbaa !15
  %cmp9 = icmp eq double* %7, null
  br i1 %cmp9, label %if.then11, label %if.end13

if.then11:                                        ; preds = %for.body
  %8 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %8) #8
  tail call void @exit(i32 1) #10
  unreachable

if.end13:                                         ; preds = %for.body
  %W = getelementptr inbounds %struct.f1_neuron* %6, i64 %indvars.iv, i32 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = trunc i64 %indvars.iv.next to i32
  %cmp3 = icmp slt i32 %10, %0
  %11 = bitcast double* %W to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 56, i32 8, i1 false)
  br i1 %cmp3, label %for.body, label %for.end

for.end:                                          ; preds = %if.end13, %for.cond.preheader
  %12 = load i32* @numf2s, align 4, !tbaa !1
  %conv28 = sext i32 %12 to i64
  %mul29 = shl nsw i64 %conv28, 4
  %call30 = tail call noalias i8* @malloc(i64 %mul29) #6
  %13 = bitcast i8* %call30 to %struct.xyz*
  store %struct.xyz* %13, %struct.xyz** @Y, align 8, !tbaa !5
  %cmp31 = icmp eq i8* %call30, null
  br i1 %cmp31, label %if.then33, label %if.end35

if.then33:                                        ; preds = %for.end
  %14 = load %struct._IO_FILE** @stdout, align 8, !tbaa !5
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %14)
  tail call void @exit(i32 1) #10
  unreachable

if.end35:                                         ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define void @analog_conv() #1 {
entry:
  %lines = alloca i32, align 4
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %y1 = alloca double, align 8
  %y2 = alloca double, align 8
  %0 = load %struct._IO_FILE** @fp, align 8, !tbaa !5
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0), i32* %lines) #6
  %1 = load i32* %lines, align 4, !tbaa !1
  %cmp19 = icmp sgt i32 %1, 0
  br i1 %cmp19, label %for.body, label %for.end12

for.body:                                         ; preds = %for.inc10, %entry
  %j.020 = phi i32 [ %inc11, %for.inc10 ], [ 0, %entry ]
  %2 = load %struct._IO_FILE** @fp, align 8, !tbaa !5
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([12 x i8]* @.str5, i64 0, i64 0), i32* %x1, double* %y1, i32* %x2, double* %y2) #6
  %3 = load i32* %x1, align 4, !tbaa !1
  %4 = load i32* %x2, align 4, !tbaa !1
  %cmp317 = icmp slt i32 %4, %3
  br i1 %cmp317, label %for.inc10, label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.body
  %5 = load i32* @cp, align 4, !tbaa !1
  %idxprom = sext i32 %5 to i64
  %6 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %7 = sext i32 %3 to i64
  %sub5 = sub nsw i32 %4, %3
  %conv = sitofp i32 %sub5 to double
  br label %for.body4

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body4 ], [ %7, %for.body4.lr.ph ]
  %8 = load double* %y2, align 8, !tbaa !10
  %9 = load double* %y1, align 8, !tbaa !10
  %sub = fsub double %8, %9
  %div = fdiv double %sub, %conv
  %10 = trunc i64 %indvars.iv to i32
  %sub6 = sub nsw i32 %10, %4
  %conv7 = sitofp i32 %sub6 to double
  %mul = fmul double %conv7, %div
  %add = fadd double %8, %mul
  %I = getelementptr inbounds %struct.f1_neuron* %6, i64 %indvars.iv, i32 0
  %11 = load double** %I, align 8, !tbaa !15
  %arrayidx9 = getelementptr inbounds double* %11, i64 %idxprom
  store double %add, double* %arrayidx9, align 8, !tbaa !10
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp3 = icmp slt i32 %10, %4
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %for.body4, %for.body
  %inc11 = add nsw i32 %j.020, 1
  %12 = load i32* %lines, align 4, !tbaa !1
  %cmp = icmp slt i32 %inc11, %12
  br i1 %cmp, label %for.body, label %for.end12

for.end12:                                        ; preds = %for.inc10, %entry
  ret void
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #5

; Function Attrs: nounwind uwtable
define void @get_pat() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp5 = icmp sgt i32 %0, 0
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %1 = load %struct._IO_FILE** @fp, align 8, !tbaa !5
  %2 = load i32* @cp, align 4, !tbaa !1
  %idxprom = sext i32 %2 to i64
  %3 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %I = getelementptr inbounds %struct.f1_neuron* %3, i64 %indvars.iv, i32 0
  %4 = load double** %I, align 8, !tbaa !15
  %arrayidx2 = getelementptr inbounds double* %4, i64 %idxprom
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0), double* %arrayidx2) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load i32* @numf1s, align 4, !tbaa !1
  %6 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp slt i32 %6, %5
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @show_pat() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp9 = icmp sgt i32 %0, 0
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %entry ]
  %1 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %1, 5
  %cmp1 = icmp eq i32 %rem, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %putchar = tail call i32 @putchar(i32 10) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %2 = load i32* @cp, align 4, !tbaa !1
  %idxprom = sext i32 %2 to i64
  %3 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %I = getelementptr inbounds %struct.f1_neuron* %3, i64 %indvars.iv, i32 0
  %4 = load double** %I, align 8, !tbaa !15
  %arrayidx3 = getelementptr inbounds double* %4, i64 %idxprom
  %5 = load double* %arrayidx3, align 8, !tbaa !10
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), double %5) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = load i32* @numf1s, align 4, !tbaa !1
  %7 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp slt i32 %7, %6
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %if.end, %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str50, i64 0, i64 0))
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define void @reset_nodes() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp37 = icmp sgt i32 %0, 0
  br i1 %cmp37, label %for.body.lr.ph, label %for.cond13.preheader

for.body.lr.ph:                                   ; preds = %entry
  %1 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body

for.cond13.preheader:                             ; preds = %for.body, %entry
  %2 = load i32* @numf2s, align 4, !tbaa !1
  %cmp1435 = icmp sgt i32 %2, 0
  br i1 %cmp1435, label %for.body15.lr.ph, label %for.end22

for.body15.lr.ph:                                 ; preds = %for.cond13.preheader
  %3 = load %struct.xyz** @Y, align 8, !tbaa !5
  br label %for.body15

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv39 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next40, %for.body ]
  %W = getelementptr inbounds %struct.f1_neuron* %1, i64 %indvars.iv39, i32 1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %4 = bitcast double* %W to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 56, i32 8, i1 false)
  %lftr.wideiv = trunc i64 %indvars.iv.next40 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %for.cond13.preheader, label %for.body

for.body15:                                       ; preds = %for.body15, %for.body15.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body15.lr.ph ], [ %indvars.iv.next, %for.body15 ]
  %y = getelementptr inbounds %struct.xyz* %3, i64 %indvars.iv, i32 0
  store double 0.000000e+00, double* %y, align 8, !tbaa !7
  %reset = getelementptr inbounds %struct.xyz* %3, i64 %indvars.iv, i32 1
  store i32 0, i32* %reset, align 4, !tbaa !16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load i32* @numf2s, align 4, !tbaa !1
  %6 = trunc i64 %indvars.iv.next to i32
  %cmp14 = icmp slt i32 %6, %5
  br i1 %cmp14, label %for.body15, label %for.end22

for.end22:                                        ; preds = %for.body15, %for.cond13.preheader
  store i32 0, i32* @winner, align 4, !tbaa !1
  store i32 0, i32* @resonant, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @reset_nodes2() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp34 = icmp sgt i32 %0, 0
  br i1 %cmp34, label %for.body.lr.ph, label %for.cond13.preheader

for.body.lr.ph:                                   ; preds = %entry
  %1 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body

for.cond13.preheader:                             ; preds = %for.body, %entry
  %2 = load i32* @numf2s, align 4, !tbaa !1
  %cmp1432 = icmp sgt i32 %2, 0
  br i1 %cmp1432, label %for.body15.lr.ph, label %for.end20

for.body15.lr.ph:                                 ; preds = %for.cond13.preheader
  %3 = load %struct.xyz** @Y, align 8, !tbaa !5
  br label %for.body15

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv36 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next37, %for.body ]
  %W = getelementptr inbounds %struct.f1_neuron* %1, i64 %indvars.iv36, i32 1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %4 = bitcast double* %W to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 56, i32 8, i1 false)
  %lftr.wideiv1 = trunc i64 %indvars.iv.next37 to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %0
  br i1 %exitcond2, label %for.cond13.preheader, label %for.body

for.body15:                                       ; preds = %for.body15, %for.body15.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body15.lr.ph ], [ %indvars.iv.next, %for.body15 ]
  %y = getelementptr inbounds %struct.xyz* %3, i64 %indvars.iv, i32 0
  store double 0.000000e+00, double* %y, align 8, !tbaa !7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %for.end20, label %for.body15

for.end20:                                        ; preds = %for.body15, %for.cond13.preheader
  store i32 0, i32* @winner, align 4, !tbaa !1
  store i32 0, i32* @resonant, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_weights() #1 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([46 x i8]* @str48, i64 0, i64 0))
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp63 = icmp sgt i32 %0, 0
  br i1 %cmp63, label %for.cond1.preheader.lr.ph, label %for.end15

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %.pre72 = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc13, %for.cond1.preheader.lr.ph
  %1 = phi i32 [ %0, %for.cond1.preheader.lr.ph ], [ %10, %for.inc13 ]
  %2 = phi i32 [ %.pre72, %for.cond1.preheader.lr.ph ], [ %11, %for.inc13 ]
  %indvars.iv69 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next70, %for.inc13 ]
  %cmp261 = icmp sgt i32 %2, 0
  br i1 %cmp261, label %for.body3, label %for.inc13

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc ], [ 0, %for.cond1.preheader ]
  %3 = phi i32 [ %8, %for.inc ], [ %2, %for.cond1.preheader ]
  %sub = add nsw i32 %3, -1
  %4 = trunc i64 %indvars.iv67 to i32
  %cmp4 = icmp eq i32 %4, %sub
  %5 = load double*** @tds, align 8, !tbaa !5
  %arrayidx = getelementptr inbounds double** %5, i64 %indvars.iv69
  %6 = load double** %arrayidx, align 8, !tbaa !5
  %arrayidx6 = getelementptr inbounds double* %6, i64 %indvars.iv67
  %7 = load double* %arrayidx6, align 8, !tbaa !10
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i64 0, i64 0), double %7) #6
  br label %for.inc

if.else:                                          ; preds = %for.body3
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i64 0, i64 0), double %7) #6
  br label %for.inc

for.inc:                                          ; preds = %if.else, %if.then
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %8 = load i32* @numf2s, align 4, !tbaa !1
  %9 = trunc i64 %indvars.iv.next68 to i32
  %cmp2 = icmp slt i32 %9, %8
  br i1 %cmp2, label %for.body3, label %for.cond1.for.inc13_crit_edge

for.cond1.for.inc13_crit_edge:                    ; preds = %for.inc
  %.pre73 = load i32* @numf1s, align 4, !tbaa !1
  br label %for.inc13

for.inc13:                                        ; preds = %for.cond1.for.inc13_crit_edge, %for.cond1.preheader
  %10 = phi i32 [ %.pre73, %for.cond1.for.inc13_crit_edge ], [ %1, %for.cond1.preheader ]
  %11 = phi i32 [ %8, %for.cond1.for.inc13_crit_edge ], [ %2, %for.cond1.preheader ]
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %12 = trunc i64 %indvars.iv.next70 to i32
  %cmp = icmp slt i32 %12, %10
  br i1 %cmp, label %for.cond1.preheader, label %for.end15

for.end15:                                        ; preds = %for.inc13, %entry
  %puts56 = tail call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str49, i64 0, i64 0))
  %13 = load i32* @numf1s, align 4, !tbaa !1
  %cmp1859 = icmp sgt i32 %13, 0
  br i1 %cmp1859, label %for.cond20.preheader.lr.ph, label %for.end43

for.cond20.preheader.lr.ph:                       ; preds = %for.end15
  %.pre = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond20.preheader

for.cond20.preheader:                             ; preds = %for.inc41, %for.cond20.preheader.lr.ph
  %14 = phi i32 [ %13, %for.cond20.preheader.lr.ph ], [ %23, %for.inc41 ]
  %15 = phi i32 [ %.pre, %for.cond20.preheader.lr.ph ], [ %24, %for.inc41 ]
  %indvars.iv65 = phi i64 [ 0, %for.cond20.preheader.lr.ph ], [ %indvars.iv.next66, %for.inc41 ]
  %cmp2157 = icmp sgt i32 %15, 0
  br i1 %cmp2157, label %for.body22, label %for.inc41

for.body22:                                       ; preds = %for.inc38, %for.cond20.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc38 ], [ 0, %for.cond20.preheader ]
  %16 = phi i32 [ %21, %for.inc38 ], [ %15, %for.cond20.preheader ]
  %sub23 = add nsw i32 %16, -1
  %17 = trunc i64 %indvars.iv to i32
  %cmp24 = icmp eq i32 %17, %sub23
  %18 = load double*** @bus, align 8, !tbaa !5
  %arrayidx28 = getelementptr inbounds double** %18, i64 %indvars.iv65
  %19 = load double** %arrayidx28, align 8, !tbaa !5
  %arrayidx29 = getelementptr inbounds double* %19, i64 %indvars.iv
  %20 = load double* %arrayidx29, align 8, !tbaa !10
  br i1 %cmp24, label %if.then25, label %if.else31

if.then25:                                        ; preds = %for.body22
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str11, i64 0, i64 0), double %20) #6
  br label %for.inc38

if.else31:                                        ; preds = %for.body22
  %call36 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str12, i64 0, i64 0), double %20) #6
  br label %for.inc38

for.inc38:                                        ; preds = %if.else31, %if.then25
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = load i32* @numf2s, align 4, !tbaa !1
  %22 = trunc i64 %indvars.iv.next to i32
  %cmp21 = icmp slt i32 %22, %21
  br i1 %cmp21, label %for.body22, label %for.cond20.for.inc41_crit_edge

for.cond20.for.inc41_crit_edge:                   ; preds = %for.inc38
  %.pre71 = load i32* @numf1s, align 4, !tbaa !1
  br label %for.inc41

for.inc41:                                        ; preds = %for.cond20.for.inc41_crit_edge, %for.cond20.preheader
  %23 = phi i32 [ %.pre71, %for.cond20.for.inc41_crit_edge ], [ %14, %for.cond20.preheader ]
  %24 = phi i32 [ %21, %for.cond20.for.inc41_crit_edge ], [ %15, %for.cond20.preheader ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %25 = trunc i64 %indvars.iv.next66 to i32
  %cmp18 = icmp slt i32 %25, %23
  br i1 %cmp18, label %for.cond20.preheader, label %for.end43

for.end43:                                        ; preds = %for.inc41, %for.end15
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_f12() #1 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str50, i64 0, i64 0))
  %0 = load i32* @numf2s, align 4, !tbaa !1
  %cmp5 = icmp sgt i32 %0, 0
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %1 = load %struct.xyz** @Y, align 8, !tbaa !5
  %y = getelementptr inbounds %struct.xyz* %1, i64 %indvars.iv, i32 0
  %2 = load double* %y, align 8, !tbaa !7
  %3 = trunc i64 %indvars.iv to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str14, i64 0, i64 0), i32 %3, double %2) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = load i32* @numf2s, align 4, !tbaa !1
  %5 = trunc i64 %indvars.iv.next to i32
  %cmp = icmp slt i32 %5, %4
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @train_match(i32 %spot) #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp37.i = icmp sgt i32 %0, 0
  br i1 %cmp37.i, label %for.body.lr.ph.i, label %for.cond13.preheader.i

for.body.lr.ph.i:                                 ; preds = %entry
  %1 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body.i

for.cond13.preheader.i:                           ; preds = %for.body.i, %entry
  %2 = load i32* @numf2s, align 4, !tbaa !1
  %cmp1435.i = icmp sgt i32 %2, 0
  br i1 %cmp1435.i, label %for.body15.lr.ph.i, label %reset_nodes.exit

for.body15.lr.ph.i:                               ; preds = %for.cond13.preheader.i
  %3 = load %struct.xyz** @Y, align 8, !tbaa !5
  br label %for.body15.i

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %indvars.iv39.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next40.i, %for.body.i ]
  %W.i = getelementptr inbounds %struct.f1_neuron* %1, i64 %indvars.iv39.i, i32 1
  %indvars.iv.next40.i = add nuw nsw i64 %indvars.iv39.i, 1
  %4 = bitcast double* %W.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 56, i32 8, i1 false) #6
  %lftr.wideiv30 = trunc i64 %indvars.iv.next40.i to i32
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %0
  br i1 %exitcond31, label %for.cond13.preheader.i, label %for.body.i

for.body15.i:                                     ; preds = %for.body15.i, %for.body15.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body15.lr.ph.i ], [ %indvars.iv.next.i, %for.body15.i ]
  %y.i = getelementptr inbounds %struct.xyz* %3, i64 %indvars.iv.i, i32 0
  store double 0.000000e+00, double* %y.i, align 8, !tbaa !7
  %reset.i = getelementptr inbounds %struct.xyz* %3, i64 %indvars.iv.i, i32 1
  store i32 0, i32* %reset.i, align 4, !tbaa !16
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %5 = load i32* @numf2s, align 4, !tbaa !1
  %6 = trunc i64 %indvars.iv.next.i to i32
  %cmp14.i = icmp slt i32 %6, %5
  br i1 %cmp14.i, label %for.body15.i, label %reset_nodes.exit

reset_nodes.exit:                                 ; preds = %for.body15.i, %for.cond13.preheader.i
  store i32 0, i32* @winner, align 4, !tbaa !1
  store i32 0, i32* @resonant, align 4, !tbaa !1
  store i32 %spot, i32* @cp, align 4, !tbaa !1
  %7 = sext i32 %spot to i64
  br label %for.cond.preheader

for.cond.preheader:                               ; preds = %for.inc.i, %if.then212, %reset_nodes.exit
  %.pre = load i32* @numf1s, align 4, !tbaa !1
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc186, %for.cond.preheader
  %8 = phi i32 [ %.pre, %for.cond.preheader ], [ %39, %for.inc186 ]
  %j.0320 = phi i32 [ 0, %for.cond.preheader ], [ %inc187, %for.inc186 ]
  %cmp3291 = icmp sgt i32 %8, 0
  br i1 %cmp3291, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.cond2.preheader
  %9 = load i32* @cp, align 4, !tbaa !1
  %idxprom = sext i32 %9 to i64
  %10 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body4

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.body4 ]
  %tnorm.0293 = phi double [ 0.000000e+00, %for.body4.lr.ph ], [ %add18, %for.body4 ]
  %I = getelementptr inbounds %struct.f1_neuron* %10, i64 %indvars.iv, i32 0
  %11 = load double** %I, align 8, !tbaa !15
  %arrayidx6 = getelementptr inbounds double* %11, i64 %idxprom
  %12 = load double* %arrayidx6, align 8, !tbaa !10
  %13 = load double* @a, align 8, !tbaa !10
  %U = getelementptr inbounds %struct.f1_neuron* %10, i64 %indvars.iv, i32 4
  %14 = load double* %U, align 8, !tbaa !13
  %mul = fmul double %13, %14
  %add = fadd double %12, %mul
  %W = getelementptr inbounds %struct.f1_neuron* %10, i64 %indvars.iv, i32 1
  store double %add, double* %W, align 8, !tbaa !17
  %mul17 = fmul double %add, %add
  %add18 = fadd double %tnorm.0293, %mul17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv6 = trunc i64 %indvars.iv.next to i32
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %8
  br i1 %exitcond7, label %for.end, label %for.body4

for.end:                                          ; preds = %for.body4, %for.cond2.preheader
  %tnorm.0.lcssa = phi double [ 0.000000e+00, %for.cond2.preheader ], [ %add18, %for.body4 ]
  %call = tail call double @sqrt(double %tnorm.0.lcssa) #6
  %15 = load i32* @numf1s, align 4, !tbaa !1
  %cmp20294 = icmp sgt i32 %15, 0
  br i1 %cmp20294, label %for.body21.lr.ph, label %for.end63

for.body21.lr.ph:                                 ; preds = %for.end
  %16 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body21

for.body21:                                       ; preds = %for.body21, %for.body21.lr.ph
  %indvars.iv326 = phi i64 [ 0, %for.body21.lr.ph ], [ %indvars.iv.next327, %for.body21 ]
  %W24 = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv326, i32 1
  %17 = load double* %W24, align 8, !tbaa !17
  %div = fdiv double %17, %call
  %X = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv326, i32 2
  store double %div, double* %X, align 8, !tbaa !18
  %indvars.iv.next327 = add nuw nsw i64 %indvars.iv326, 1
  %lftr.wideiv8 = trunc i64 %indvars.iv.next327 to i32
  %exitcond9 = icmp eq i32 %lftr.wideiv8, %15
  br i1 %exitcond9, label %for.body32, label %for.body21

for.body32:                                       ; preds = %for.body32, %for.body21
  %indvars.iv328 = phi i64 [ %indvars.iv.next329, %for.body32 ], [ 0, %for.body21 ]
  %tnorm.1298 = phi double [ %add60, %for.body32 ], [ 0.000000e+00, %for.body21 ]
  %X35 = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv328, i32 2
  %18 = load double* %X35, align 8, !tbaa !18
  %19 = load double* @theta, align 8, !tbaa !10
  %cmp36 = fcmp olt double %18, %19
  %. = select i1 %cmp36, double 0.000000e+00, double %18
  %Q = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv328, i32 6
  %20 = load double* %Q, align 8, !tbaa !19
  %cmp42 = fcmp olt double %20, %19
  %qr.0 = select i1 %cmp42, double 0.000000e+00, double %20
  %21 = load double* @b, align 8, !tbaa !10
  %mul49 = fmul double %21, %qr.0
  %add50 = fadd double %., %mul49
  %V = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv328, i32 3
  store double %add50, double* %V, align 8, !tbaa !20
  %mul59 = fmul double %add50, %add50
  %add60 = fadd double %tnorm.1298, %mul59
  %indvars.iv.next329 = add nuw nsw i64 %indvars.iv328, 1
  %lftr.wideiv10 = trunc i64 %indvars.iv.next329 to i32
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %15
  br i1 %exitcond11, label %for.end63, label %for.body32

for.end63:                                        ; preds = %for.body32, %for.end
  %tnorm.1.lcssa = phi double [ 0.000000e+00, %for.end ], [ %add60, %for.body32 ]
  %call64 = tail call double @sqrt(double %tnorm.1.lcssa) #6
  %22 = load i32* @numf1s, align 4, !tbaa !1
  %cmp66300 = icmp sgt i32 %22, 0
  br i1 %cmp66300, label %for.body67.lr.ph, label %for.end125

for.body67.lr.ph:                                 ; preds = %for.end63
  %23 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body67

for.body67:                                       ; preds = %for.body67, %for.body67.lr.ph
  %indvars.iv330 = phi i64 [ 0, %for.body67.lr.ph ], [ %indvars.iv.next331, %for.body67 ]
  %V70 = getelementptr inbounds %struct.f1_neuron* %23, i64 %indvars.iv330, i32 3
  %24 = load double* %V70, align 8, !tbaa !20
  %div71 = fdiv double %24, %call64
  %U74 = getelementptr inbounds %struct.f1_neuron* %23, i64 %indvars.iv330, i32 4
  store double %div71, double* %U74, align 8, !tbaa !13
  %indvars.iv.next331 = add nuw nsw i64 %indvars.iv330, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv.next331 to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %22
  br i1 %exitcond13, label %for.body80.lr.ph, label %for.body67

for.body80.lr.ph:                                 ; preds = %for.body67
  %25 = load i32* @numf2s, align 4, !tbaa !1
  %cmp84302 = icmp sgt i32 %25, %spot
  %26 = load i32* @winner, align 4, !tbaa !1
  %27 = load %struct.xyz** @Y, align 8, !tbaa !5
  %28 = load double*** @tds, align 8, !tbaa !5
  br i1 %cmp84302, label %for.body85.lr.ph.us, label %for.end101

for.end101.us:                                    ; preds = %for.inc99.us
  %U104.us = getelementptr inbounds %struct.f1_neuron* %23, i64 %indvars.iv344, i32 4
  %29 = load double* %U104.us, align 8, !tbaa !13
  %add105.us = fadd double %tsum.1.us, %29
  store double %add105.us, double* %P.us, align 8, !tbaa !11
  %mul115.us = fmul double %add105.us, %add105.us
  %add116.us = fadd double %tnorm.2309.us, %mul115.us
  %cmp120.us = fcmp une double %35, %add105.us
  %tresult.1.us = select i1 %cmp120.us, i32 0, i32 %tresult.0308.us
  %indvars.iv.next345 = add nuw nsw i64 %indvars.iv344, 1
  %lftr.wideiv16 = trunc i64 %indvars.iv.next345 to i32
  %exitcond17 = icmp eq i32 %lftr.wideiv16, %22
  br i1 %exitcond17, label %for.end125, label %for.body85.lr.ph.us

for.body85.us:                                    ; preds = %for.body85.lr.ph.us, %for.inc99.us
  %indvars.iv342 = phi i64 [ %7, %for.body85.lr.ph.us ], [ %indvars.iv.next343, %for.inc99.us ]
  %tsum.0304.us = phi double [ 0.000000e+00, %for.body85.lr.ph.us ], [ %tsum.1.us, %for.inc99.us ]
  %30 = trunc i64 %indvars.iv342 to i32
  %cmp86.us = icmp eq i32 %30, %26
  br i1 %cmp86.us, label %land.lhs.true87.us, label %for.inc99.us

land.lhs.true87.us:                               ; preds = %for.body85.us
  %y.us = getelementptr inbounds %struct.xyz* %27, i64 %indvars.iv342, i32 0
  %31 = load double* %y.us, align 8, !tbaa !7
  %cmp90.us = fcmp ogt double %31, 0.000000e+00
  br i1 %cmp90.us, label %if.then91.us, label %for.inc99.us

if.then91.us:                                     ; preds = %land.lhs.true87.us
  %32 = load double** %arrayidx94.us, align 8, !tbaa !5
  %arrayidx95.us = getelementptr inbounds double* %32, i64 %indvars.iv342
  %33 = load double* %arrayidx95.us, align 8, !tbaa !10
  %mul96.us = fmul double %36, %33
  %add97.us = fadd double %tsum.0304.us, %mul96.us
  br label %for.inc99.us

for.inc99.us:                                     ; preds = %if.then91.us, %land.lhs.true87.us, %for.body85.us
  %tsum.1.us = phi double [ %add97.us, %if.then91.us ], [ %tsum.0304.us, %land.lhs.true87.us ], [ %tsum.0304.us, %for.body85.us ]
  %indvars.iv.next343 = add nsw i64 %indvars.iv342, 1
  %34 = trunc i64 %indvars.iv.next343 to i32
  %cmp84.us = icmp slt i32 %34, %25
  br i1 %cmp84.us, label %for.body85.us, label %for.end101.us

for.body85.lr.ph.us:                              ; preds = %for.end101.us, %for.body80.lr.ph
  %indvars.iv344 = phi i64 [ %indvars.iv.next345, %for.end101.us ], [ 0, %for.body80.lr.ph ]
  %tnorm.2309.us = phi double [ %add116.us, %for.end101.us ], [ 0.000000e+00, %for.body80.lr.ph ]
  %tresult.0308.us = phi i32 [ %tresult.1.us, %for.end101.us ], [ 1, %for.body80.lr.ph ]
  %P.us = getelementptr inbounds %struct.f1_neuron* %23, i64 %indvars.iv344, i32 5
  %35 = load double* %P.us, align 8, !tbaa !11
  %arrayidx94.us = getelementptr inbounds double** %28, i64 %indvars.iv344
  %36 = load double* @d, align 8, !tbaa !10
  br label %for.body85.us

for.end101:                                       ; preds = %for.end101, %for.body80.lr.ph
  %indvars.iv332 = phi i64 [ %indvars.iv.next333, %for.end101 ], [ 0, %for.body80.lr.ph ]
  %tnorm.2309 = phi double [ %add116, %for.end101 ], [ 0.000000e+00, %for.body80.lr.ph ]
  %tresult.0308 = phi i32 [ %tresult.1, %for.end101 ], [ 1, %for.body80.lr.ph ]
  %P = getelementptr inbounds %struct.f1_neuron* %23, i64 %indvars.iv332, i32 5
  %37 = load double* %P, align 8, !tbaa !11
  %U104 = getelementptr inbounds %struct.f1_neuron* %23, i64 %indvars.iv332, i32 4
  %38 = load double* %U104, align 8, !tbaa !13
  %add105 = fadd double %38, 0.000000e+00
  store double %add105, double* %P, align 8, !tbaa !11
  %mul115 = fmul double %add105, %add105
  %add116 = fadd double %tnorm.2309, %mul115
  %cmp120 = fcmp une double %37, %add105
  %tresult.1 = select i1 %cmp120, i32 0, i32 %tresult.0308
  %indvars.iv.next333 = add nuw nsw i64 %indvars.iv332, 1
  %lftr.wideiv14 = trunc i64 %indvars.iv.next333 to i32
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %22
  br i1 %exitcond15, label %for.end125, label %for.end101

for.end125:                                       ; preds = %for.end101, %for.end101.us, %for.end63
  %tnorm.2.lcssa = phi double [ 0.000000e+00, %for.end63 ], [ %add116, %for.end101 ], [ %add116.us, %for.end101.us ]
  %tresult.0.lcssa = phi i32 [ 1, %for.end63 ], [ %tresult.1, %for.end101 ], [ %tresult.1.us, %for.end101.us ]
  %call126 = tail call double @sqrt(double %tnorm.2.lcssa) #6
  %39 = load i32* @numf1s, align 4, !tbaa !1
  %cmp128312 = icmp sgt i32 %39, 0
  br i1 %cmp128312, label %for.body129.lr.ph, label %for.cond139.loopexit

for.body129.lr.ph:                                ; preds = %for.end125
  %40 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body129

for.body129:                                      ; preds = %for.body129, %for.body129.lr.ph
  %indvars.iv334 = phi i64 [ 0, %for.body129.lr.ph ], [ %indvars.iv.next335, %for.body129 ]
  %P132 = getelementptr inbounds %struct.f1_neuron* %40, i64 %indvars.iv334, i32 5
  %41 = load double* %P132, align 8, !tbaa !11
  %Q135 = getelementptr inbounds %struct.f1_neuron* %40, i64 %indvars.iv334, i32 6
  store double %41, double* %Q135, align 8, !tbaa !19
  %indvars.iv.next335 = add nuw nsw i64 %indvars.iv334, 1
  %lftr.wideiv18 = trunc i64 %indvars.iv.next335 to i32
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %39
  br i1 %exitcond19, label %for.cond139.loopexit, label %for.body129

for.cond139.loopexit:                             ; preds = %for.body129, %for.end125
  %42 = load i32* @numf2s, align 4, !tbaa !1
  %cmp140316 = icmp sgt i32 %42, %spot
  br i1 %cmp140316, label %for.body141.lr.ph, label %for.end170.thread

for.end170.thread:                                ; preds = %for.cond139.loopexit
  store i32 0, i32* @winner, align 4, !tbaa !1
  br label %for.inc186

for.body141.lr.ph:                                ; preds = %for.cond139.loopexit
  %43 = load %struct.xyz** @Y, align 8, !tbaa !5
  %44 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %45 = load double*** @bus, align 8, !tbaa !5
  br i1 %cmp128312, label %for.body141, label %for.inc168.us

for.inc168.us:                                    ; preds = %for.inc168.us, %for.body141.lr.ph
  %indvars.iv338.us = phi i64 [ %indvars.iv.next339.us, %for.inc168.us ], [ %7, %for.body141.lr.ph ]
  %y144.us = getelementptr inbounds %struct.xyz* %43, i64 %indvars.iv338.us, i32 0
  store double 0.000000e+00, double* %y144.us, align 8, !tbaa !7
  %indvars.iv.next339.us = add nsw i64 %indvars.iv338.us, 1
  %46 = trunc i64 %indvars.iv.next339.us to i32
  %cmp140.us = icmp slt i32 %46, %42
  br i1 %cmp140.us, label %for.inc168.us, label %for.body173.lr.ph

for.body141:                                      ; preds = %for.inc168, %for.body141.lr.ph
  %indvars.iv338 = phi i64 [ %indvars.iv.next339, %for.inc168 ], [ %7, %for.body141.lr.ph ]
  %y144 = getelementptr inbounds %struct.xyz* %43, i64 %indvars.iv338, i32 0
  store double 0.000000e+00, double* %y144, align 8, !tbaa !7
  %reset = getelementptr inbounds %struct.xyz* %43, i64 %indvars.iv338, i32 1
  %47 = load i32* %reset, align 4, !tbaa !16
  %tobool147.not = icmp eq i32 %47, 0
  br i1 %tobool147.not, label %for.body151, label %for.inc168

for.body151:                                      ; preds = %for.body151, %for.body141
  %48 = phi double [ %add163, %for.body151 ], [ 0.000000e+00, %for.body141 ]
  %indvars.iv336 = phi i64 [ %indvars.iv.next337, %for.body151 ], [ 0, %for.body141 ]
  %P154 = getelementptr inbounds %struct.f1_neuron* %44, i64 %indvars.iv336, i32 5
  %49 = load double* %P154, align 8, !tbaa !11
  %arrayidx157 = getelementptr inbounds double** %45, i64 %indvars.iv336
  %50 = load double** %arrayidx157, align 8, !tbaa !5
  %arrayidx158 = getelementptr inbounds double* %50, i64 %indvars.iv338
  %51 = load double* %arrayidx158, align 8, !tbaa !10
  %mul159 = fmul double %49, %51
  %add163 = fadd double %48, %mul159
  store double %add163, double* %y144, align 8, !tbaa !7
  %indvars.iv.next337 = add nuw nsw i64 %indvars.iv336, 1
  %lftr.wideiv20 = trunc i64 %indvars.iv.next337 to i32
  %exitcond21 = icmp eq i32 %lftr.wideiv20, %39
  br i1 %exitcond21, label %for.inc168, label %for.body151

for.inc168:                                       ; preds = %for.body151, %for.body141
  %indvars.iv.next339 = add nsw i64 %indvars.iv338, 1
  %52 = trunc i64 %indvars.iv.next339 to i32
  %cmp140 = icmp slt i32 %52, %42
  br i1 %cmp140, label %for.body141, label %for.body173.lr.ph

for.body173.lr.ph:                                ; preds = %for.inc168, %for.inc168.us
  store i32 0, i32* @winner, align 4, !tbaa !1
  br label %for.body173

for.body173:                                      ; preds = %for.inc183, %for.body173.lr.ph
  %53 = phi i32 [ 0, %for.body173.lr.ph ], [ %57, %for.inc183 ]
  %indvars.iv340 = phi i64 [ %7, %for.body173.lr.ph ], [ %indvars.iv.next341, %for.inc183 ]
  %y176 = getelementptr inbounds %struct.xyz* %43, i64 %indvars.iv340, i32 0
  %54 = load double* %y176, align 8, !tbaa !7
  %idxprom177 = sext i32 %53 to i64
  %y179 = getelementptr inbounds %struct.xyz* %43, i64 %idxprom177, i32 0
  %55 = load double* %y179, align 8, !tbaa !7
  %cmp180 = fcmp ogt double %54, %55
  br i1 %cmp180, label %if.then181, label %for.inc183

if.then181:                                       ; preds = %for.body173
  %56 = trunc i64 %indvars.iv340 to i32
  store i32 %56, i32* @winner, align 4, !tbaa !1
  br label %for.inc183

for.inc183:                                       ; preds = %if.then181, %for.body173
  %57 = phi i32 [ %53, %for.body173 ], [ %56, %if.then181 ]
  %indvars.iv.next341 = add nsw i64 %indvars.iv340, 1
  %58 = trunc i64 %indvars.iv.next341 to i32
  %cmp172 = icmp slt i32 %58, %42
  br i1 %cmp172, label %for.body173, label %for.inc186

for.inc186:                                       ; preds = %for.inc183, %for.end170.thread
  %inc187 = add nsw i32 %j.0320, 1
  %cmp = icmp sgt i32 %j.0320, 7
  %tobool1 = icmp ne i32 %tresult.0.lcssa, 0
  %or.cond = or i1 %cmp, %tobool1
  br i1 %or.cond, label %for.end188, label %for.cond2.preheader

for.end188:                                       ; preds = %for.inc186
  br i1 %cmp128312, label %for.body.lr.ph.i1, label %for.end.i

for.body.lr.ph.i1:                                ; preds = %for.end188
  %59 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body.i2

for.body.i2:                                      ; preds = %for.body.i2, %for.body.lr.ph.i1
  %indvars.iv96.i = phi i64 [ 0, %for.body.lr.ph.i1 ], [ %indvars.iv.next97.i, %for.body.i2 ]
  %norm.089.i = phi double [ 0.000000e+00, %for.body.lr.ph.i1 ], [ %add.i, %for.body.i2 ]
  %P.i = getelementptr inbounds %struct.f1_neuron* %59, i64 %indvars.iv96.i, i32 5
  %60 = load double* %P.i, align 8, !tbaa !11
  %mul.i = fmul double %60, %60
  %add.i = fadd double %norm.089.i, %mul.i
  %indvars.iv.next97.i = add nuw nsw i64 %indvars.iv96.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next97.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %39
  br i1 %exitcond, label %for.end.i, label %for.body.i2

for.end.i:                                        ; preds = %for.body.i2, %for.end188
  %norm.0.lcssa.i = phi double [ 0.000000e+00, %for.end188 ], [ %add.i, %for.body.i2 ]
  %call.i = tail call double @sqrt(double %norm.0.lcssa.i) #6
  %61 = load double* @c, align 8, !tbaa !10
  %mul4.i = fmul double %call.i, %61
  %add5.i = fadd double %mul4.i, 0.000000e+00
  %62 = load i32* @numf1s, align 4, !tbaa !1
  %cmp784.i = icmp sgt i32 %62, 0
  br i1 %cmp784.i, label %for.body8.lr.ph.i, label %for.end18.i

for.body8.lr.ph.i:                                ; preds = %for.end.i
  %63 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body8.i

for.body8.i:                                      ; preds = %for.body8.i, %for.body8.lr.ph.i
  %indvars.iv94.i = phi i64 [ 0, %for.body8.lr.ph.i ], [ %indvars.iv.next95.i, %for.body8.i ]
  %norm.185.i = phi double [ 0.000000e+00, %for.body8.lr.ph.i ], [ %add15.i, %for.body8.i ]
  %U.i = getelementptr inbounds %struct.f1_neuron* %63, i64 %indvars.iv94.i, i32 4
  %64 = load double* %U.i, align 8, !tbaa !13
  %mul14.i = fmul double %64, %64
  %add15.i = fadd double %norm.185.i, %mul14.i
  %indvars.iv.next95.i = add nuw nsw i64 %indvars.iv94.i, 1
  %lftr.wideiv22 = trunc i64 %indvars.iv.next95.i to i32
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %62
  br i1 %exitcond23, label %for.end18.i, label %for.body8.i

for.end18.i:                                      ; preds = %for.body8.i, %for.end.i
  %norm.1.lcssa.i = phi double [ 0.000000e+00, %for.end.i ], [ %add15.i, %for.body8.i ]
  %call19.i = tail call double @sqrt(double %norm.1.lcssa.i) #6
  %add20.i = fadd double %add5.i, %call19.i
  %65 = load i32* @numf1s, align 4, !tbaa !1
  %cmp2282.i = icmp sgt i32 %65, 0
  br i1 %cmp2282.i, label %for.body23.lr.ph.i, label %simtest.exit

for.body23.lr.ph.i:                               ; preds = %for.end18.i
  %66 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body23.i

for.body23.i:                                     ; preds = %for.body23.i, %for.body23.lr.ph.i
  %indvars.iv92.i = phi i64 [ 0, %for.body23.lr.ph.i ], [ %indvars.iv.next93.i, %for.body23.i ]
  %U26.i = getelementptr inbounds %struct.f1_neuron* %66, i64 %indvars.iv92.i, i32 4
  %67 = load double* %U26.i, align 8, !tbaa !13
  %68 = load double* @c, align 8, !tbaa !10
  %P29.i = getelementptr inbounds %struct.f1_neuron* %66, i64 %indvars.iv92.i, i32 5
  %69 = load double* %P29.i, align 8, !tbaa !11
  %mul30.i = fmul double %68, %69
  %add31.i = fadd double %67, %mul30.i
  %div.i = fdiv double %add31.i, %add20.i
  %R.i = getelementptr inbounds %struct.f1_neuron* %66, i64 %indvars.iv92.i, i32 7
  store double %div.i, double* %R.i, align 8, !tbaa !14
  %indvars.iv.next93.i = add nuw nsw i64 %indvars.iv92.i, 1
  %lftr.wideiv24 = trunc i64 %indvars.iv.next93.i to i32
  %exitcond25 = icmp eq i32 %lftr.wideiv24, %65
  br i1 %exitcond25, label %for.body39.i, label %for.body23.i

for.body39.i:                                     ; preds = %for.body39.i, %for.body23.i
  %indvars.iv.i3 = phi i64 [ %indvars.iv.next.i4, %for.body39.i ], [ 0, %for.body23.i ]
  %norm.280.i = phi double [ %add47.i, %for.body39.i ], [ 0.000000e+00, %for.body23.i ]
  %R42.i = getelementptr inbounds %struct.f1_neuron* %66, i64 %indvars.iv.i3, i32 7
  %70 = load double* %R42.i, align 8, !tbaa !14
  %mul46.i = fmul double %70, %70
  %add47.i = fadd double %norm.280.i, %mul46.i
  %indvars.iv.next.i4 = add nuw nsw i64 %indvars.iv.i3, 1
  %lftr.wideiv26 = trunc i64 %indvars.iv.next.i4 to i32
  %exitcond27 = icmp eq i32 %lftr.wideiv26, %65
  br i1 %exitcond27, label %simtest.exit, label %for.body39.i

simtest.exit:                                     ; preds = %for.body39.i, %for.end18.i
  %norm.2.lcssa.i = phi double [ 0.000000e+00, %for.end18.i ], [ %add47.i, %for.body39.i ]
  %call51.i = tail call double @sqrt(double %norm.2.lcssa.i) #6
  %71 = load double* @rho, align 8, !tbaa !10
  %cmp190 = fcmp ogt double %call51.i, %71
  br i1 %cmp190, label %if.then191, label %if.else192

if.then191:                                       ; preds = %simtest.exit
  tail call void @weightadj()
  br label %while.end

if.else192:                                       ; preds = %simtest.exit
  %72 = load i32* @winner, align 4, !tbaa !1
  %idxprom193 = sext i32 %72 to i64
  %73 = load %struct.xyz** @Y, align 8, !tbaa !5
  %y195 = getelementptr inbounds %struct.xyz* %73, i64 %idxprom193, i32 0
  store double 0.000000e+00, double* %y195, align 8, !tbaa !7
  %reset198 = getelementptr inbounds %struct.xyz* %73, i64 %idxprom193, i32 1
  store i32 1, i32* %reset198, align 4, !tbaa !16
  %74 = load i32* @numf2s, align 4, !tbaa !1
  %cmp200321 = icmp sgt i32 %74, %spot
  br i1 %cmp200321, label %for.body201, label %while.end

for.body201:                                      ; preds = %for.body201, %if.else192
  %indvars.iv346 = phi i64 [ %indvars.iv.next347, %for.body201 ], [ %7, %if.else192 ]
  %matchtest.0323 = phi i8 [ %.matchtest.0, %for.body201 ], [ 0, %if.else192 ]
  %reset204 = getelementptr inbounds %struct.xyz* %73, i64 %indvars.iv346, i32 1
  %75 = load i32* %reset204, align 4, !tbaa !16
  %cmp205 = icmp eq i32 %75, 0
  %.matchtest.0 = select i1 %cmp205, i8 1, i8 %matchtest.0323
  %indvars.iv.next347 = add nsw i64 %indvars.iv346, 1
  %76 = trunc i64 %indvars.iv.next347 to i32
  %cmp200 = icmp slt i32 %76, %74
  br i1 %cmp200, label %for.body201, label %for.end210

for.end210:                                       ; preds = %for.body201
  %phitmp = icmp eq i8 %.matchtest.0, 0
  br i1 %phitmp, label %while.end, label %if.then212

if.then212:                                       ; preds = %for.end210
  store i32 0, i32* @winner, align 4, !tbaa !1
  %cmp8.i = icmp sgt i32 %74, 0
  br i1 %cmp8.i, label %for.body.i288, label %for.cond.preheader

for.body.i288:                                    ; preds = %for.inc.i, %if.then212
  %77 = phi i32 [ %81, %for.inc.i ], [ 0, %if.then212 ]
  %indvars.iv.i286 = phi i64 [ %indvars.iv.next.i289, %for.inc.i ], [ 0, %if.then212 ]
  %y.i287 = getelementptr inbounds %struct.xyz* %73, i64 %indvars.iv.i286, i32 0
  %78 = load double* %y.i287, align 8, !tbaa !7
  %idxprom1.i = sext i32 %77 to i64
  %y3.i = getelementptr inbounds %struct.xyz* %73, i64 %idxprom1.i, i32 0
  %79 = load double* %y3.i, align 8, !tbaa !7
  %cmp4.i = fcmp ogt double %78, %79
  br i1 %cmp4.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.i288
  %80 = trunc i64 %indvars.iv.i286 to i32
  store i32 %80, i32* @winner, align 4, !tbaa !1
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i288
  %81 = phi i32 [ %77, %for.body.i288 ], [ %80, %if.then.i ]
  %indvars.iv.next.i289 = add nuw nsw i64 %indvars.iv.i286, 1
  %lftr.wideiv28 = trunc i64 %indvars.iv.next.i289 to i32
  %exitcond29 = icmp eq i32 %lftr.wideiv28, %74
  br i1 %exitcond29, label %for.cond.preheader, label %for.body.i288

while.end:                                        ; preds = %for.end210, %if.else192, %if.then191
  ret void
}

; Function Attrs: nounwind uwtable
define void @match() #1 {
entry:
  store i32 0, i32* @cp, align 4, !tbaa !1
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp37.i = icmp sgt i32 %0, 0
  br i1 %cmp37.i, label %for.body.lr.ph.i, label %for.cond13.preheader.i

for.body.lr.ph.i:                                 ; preds = %entry
  %1 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body.i

for.cond13.preheader.i:                           ; preds = %for.body.i, %entry
  %2 = load i32* @numf2s, align 4, !tbaa !1
  %cmp1435.i = icmp sgt i32 %2, 0
  br i1 %cmp1435.i, label %for.body15.lr.ph.i, label %reset_nodes.exit

for.body15.lr.ph.i:                               ; preds = %for.cond13.preheader.i
  %3 = load %struct.xyz** @Y, align 8, !tbaa !5
  br label %for.body15.i

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %indvars.iv39.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next40.i, %for.body.i ]
  %W.i = getelementptr inbounds %struct.f1_neuron* %1, i64 %indvars.iv39.i, i32 1
  %indvars.iv.next40.i = add nuw nsw i64 %indvars.iv39.i, 1
  %4 = bitcast double* %W.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 56, i32 8, i1 false) #6
  %lftr.wideiv39 = trunc i64 %indvars.iv.next40.i to i32
  %exitcond40 = icmp eq i32 %lftr.wideiv39, %0
  br i1 %exitcond40, label %for.cond13.preheader.i, label %for.body.i

for.body15.i:                                     ; preds = %for.body15.i, %for.body15.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body15.lr.ph.i ], [ %indvars.iv.next.i, %for.body15.i ]
  %y.i = getelementptr inbounds %struct.xyz* %3, i64 %indvars.iv.i, i32 0
  store double 0.000000e+00, double* %y.i, align 8, !tbaa !7
  %reset.i = getelementptr inbounds %struct.xyz* %3, i64 %indvars.iv.i, i32 1
  store i32 0, i32* %reset.i, align 4, !tbaa !16
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %5 = load i32* @numf2s, align 4, !tbaa !1
  %6 = trunc i64 %indvars.iv.next.i to i32
  %cmp14.i = icmp slt i32 %6, %5
  br i1 %cmp14.i, label %for.body15.i, label %reset_nodes.exit

reset_nodes.exit:                                 ; preds = %for.body15.i, %for.cond13.preheader.i
  %7 = phi i32 [ %2, %for.cond13.preheader.i ], [ %5, %for.body15.i ]
  store i32 0, i32* @winner, align 4, !tbaa !1
  store i32 0, i32* @resonant, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %for.inc.i, %reset_nodes.exit
  %8 = phi i32 [ %7, %reset_nodes.exit ], [ %74, %for.inc.i ]
  %9 = load i32* @numf1s, align 4, !tbaa !1
  %cmp34.i = icmp sgt i32 %9, 0
  br i1 %cmp34.i, label %for.body.lr.ph.i308, label %for.cond13.preheader.i309

for.body.lr.ph.i308:                              ; preds = %while.body
  %10 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body.i313

for.cond13.preheader.i309.loopexit:               ; preds = %for.body.i313
  %.pre = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond13.preheader.i309

for.cond13.preheader.i309:                        ; preds = %for.cond13.preheader.i309.loopexit, %while.body
  %11 = phi i32 [ %.pre, %for.cond13.preheader.i309.loopexit ], [ %8, %while.body ]
  %cmp1432.i = icmp sgt i32 %11, 0
  br i1 %cmp1432.i, label %for.body15.lr.ph.i310, label %reset_nodes2.exit

for.body15.lr.ph.i310:                            ; preds = %for.cond13.preheader.i309
  %12 = load %struct.xyz** @Y, align 8, !tbaa !5
  br label %for.body15.i318

for.body.i313:                                    ; preds = %for.body.i313, %for.body.lr.ph.i308
  %indvars.iv36.i = phi i64 [ 0, %for.body.lr.ph.i308 ], [ %indvars.iv.next37.i, %for.body.i313 ]
  %W.i311 = getelementptr inbounds %struct.f1_neuron* %10, i64 %indvars.iv36.i, i32 1
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1
  %13 = bitcast double* %W.i311 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 56, i32 8, i1 false) #6
  %lftr.wideiv4 = trunc i64 %indvars.iv.next37.i to i32
  %exitcond5 = icmp eq i32 %lftr.wideiv4, %9
  br i1 %exitcond5, label %for.cond13.preheader.i309.loopexit, label %for.body.i313

for.body15.i318:                                  ; preds = %for.body15.i318, %for.body15.lr.ph.i310
  %indvars.iv.i314 = phi i64 [ 0, %for.body15.lr.ph.i310 ], [ %indvars.iv.next.i316, %for.body15.i318 ]
  %y.i315 = getelementptr inbounds %struct.xyz* %12, i64 %indvars.iv.i314, i32 0
  store double 0.000000e+00, double* %y.i315, align 8, !tbaa !7
  %indvars.iv.next.i316 = add nuw nsw i64 %indvars.iv.i314, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i316 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %11
  br i1 %exitcond, label %reset_nodes2.exit, label %for.body15.i318

reset_nodes2.exit:                                ; preds = %for.body15.i318, %for.cond13.preheader.i309
  store i32 0, i32* @winner, align 4, !tbaa !1
  store i32 0, i32* @resonant, align 4, !tbaa !1
  %.pre390 = load i32* @numf1s, align 4, !tbaa !1
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc186, %reset_nodes2.exit
  %14 = phi i32 [ %.pre390, %reset_nodes2.exit ], [ %44, %for.inc186 ]
  %j.0348 = phi i32 [ 0, %reset_nodes2.exit ], [ %inc187, %for.inc186 ]
  %cmp3319 = icmp sgt i32 %14, 0
  br i1 %cmp3319, label %for.body4.lr.ph, label %for.end

for.body4.lr.ph:                                  ; preds = %for.cond2.preheader
  %15 = load i32* @cp, align 4, !tbaa !1
  %idxprom = sext i32 %15 to i64
  %16 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body4

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.body4 ]
  %tnorm.0321 = phi double [ 0.000000e+00, %for.body4.lr.ph ], [ %add18, %for.body4 ]
  %I = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv, i32 0
  %17 = load double** %I, align 8, !tbaa !15
  %arrayidx6 = getelementptr inbounds double* %17, i64 %idxprom
  %18 = load double* %arrayidx6, align 8, !tbaa !10
  %19 = load double* @a, align 8, !tbaa !10
  %U = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv, i32 4
  %20 = load double* %U, align 8, !tbaa !13
  %mul = fmul double %19, %20
  %add = fadd double %18, %mul
  %W = getelementptr inbounds %struct.f1_neuron* %16, i64 %indvars.iv, i32 1
  store double %add, double* %W, align 8, !tbaa !17
  %mul17 = fmul double %add, %add
  %add18 = fadd double %tnorm.0321, %mul17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv6 = trunc i64 %indvars.iv.next to i32
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %14
  br i1 %exitcond7, label %for.end, label %for.body4

for.end:                                          ; preds = %for.body4, %for.cond2.preheader
  %tnorm.0.lcssa = phi double [ 0.000000e+00, %for.cond2.preheader ], [ %add18, %for.body4 ]
  %call = tail call double @sqrt(double %tnorm.0.lcssa) #6
  %21 = load i32* @numf1s, align 4, !tbaa !1
  %cmp20322 = icmp sgt i32 %21, 0
  br i1 %cmp20322, label %for.body21.lr.ph, label %for.end63

for.body21.lr.ph:                                 ; preds = %for.end
  %22 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body21

for.body21:                                       ; preds = %for.body21, %for.body21.lr.ph
  %indvars.iv358 = phi i64 [ 0, %for.body21.lr.ph ], [ %indvars.iv.next359, %for.body21 ]
  %W24 = getelementptr inbounds %struct.f1_neuron* %22, i64 %indvars.iv358, i32 1
  %23 = load double* %W24, align 8, !tbaa !17
  %div = fdiv double %23, %call
  %X = getelementptr inbounds %struct.f1_neuron* %22, i64 %indvars.iv358, i32 2
  store double %div, double* %X, align 8, !tbaa !18
  %indvars.iv.next359 = add nuw nsw i64 %indvars.iv358, 1
  %lftr.wideiv8 = trunc i64 %indvars.iv.next359 to i32
  %exitcond9 = icmp eq i32 %lftr.wideiv8, %21
  br i1 %exitcond9, label %for.body32, label %for.body21

for.body32:                                       ; preds = %for.body32, %for.body21
  %indvars.iv360 = phi i64 [ %indvars.iv.next361, %for.body32 ], [ 0, %for.body21 ]
  %tnorm.1326 = phi double [ %add60, %for.body32 ], [ 0.000000e+00, %for.body21 ]
  %X35 = getelementptr inbounds %struct.f1_neuron* %22, i64 %indvars.iv360, i32 2
  %24 = load double* %X35, align 8, !tbaa !18
  %25 = load double* @theta, align 8, !tbaa !10
  %cmp36 = fcmp olt double %24, %25
  %. = select i1 %cmp36, double 0.000000e+00, double %24
  %Q = getelementptr inbounds %struct.f1_neuron* %22, i64 %indvars.iv360, i32 6
  %26 = load double* %Q, align 8, !tbaa !19
  %cmp42 = fcmp olt double %26, %25
  %qr.0 = select i1 %cmp42, double 0.000000e+00, double %26
  %27 = load double* @b, align 8, !tbaa !10
  %mul49 = fmul double %27, %qr.0
  %add50 = fadd double %., %mul49
  %V = getelementptr inbounds %struct.f1_neuron* %22, i64 %indvars.iv360, i32 3
  store double %add50, double* %V, align 8, !tbaa !20
  %mul59 = fmul double %add50, %add50
  %add60 = fadd double %tnorm.1326, %mul59
  %indvars.iv.next361 = add nuw nsw i64 %indvars.iv360, 1
  %lftr.wideiv10 = trunc i64 %indvars.iv.next361 to i32
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %21
  br i1 %exitcond11, label %for.end63, label %for.body32

for.end63:                                        ; preds = %for.body32, %for.end
  %tnorm.1.lcssa = phi double [ 0.000000e+00, %for.end ], [ %add60, %for.body32 ]
  %call64 = tail call double @sqrt(double %tnorm.1.lcssa) #6
  %28 = load i32* @numf1s, align 4, !tbaa !1
  %cmp66328 = icmp sgt i32 %28, 0
  br i1 %cmp66328, label %for.body67.lr.ph, label %for.end125

for.body67.lr.ph:                                 ; preds = %for.end63
  %29 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body67

for.body67:                                       ; preds = %for.body67, %for.body67.lr.ph
  %indvars.iv362 = phi i64 [ 0, %for.body67.lr.ph ], [ %indvars.iv.next363, %for.body67 ]
  %V70 = getelementptr inbounds %struct.f1_neuron* %29, i64 %indvars.iv362, i32 3
  %30 = load double* %V70, align 8, !tbaa !20
  %div71 = fdiv double %30, %call64
  %U74 = getelementptr inbounds %struct.f1_neuron* %29, i64 %indvars.iv362, i32 4
  store double %div71, double* %U74, align 8, !tbaa !13
  %indvars.iv.next363 = add nuw nsw i64 %indvars.iv362, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv.next363 to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %28
  br i1 %exitcond13, label %for.body80.lr.ph, label %for.body67

for.body80.lr.ph:                                 ; preds = %for.body67
  %31 = load i32* @numf2s, align 4, !tbaa !1
  %cmp84330 = icmp sgt i32 %31, 0
  %32 = load i32* @winner, align 4, !tbaa !1
  %33 = load %struct.xyz** @Y, align 8, !tbaa !5
  %34 = load double*** @tds, align 8, !tbaa !5
  br i1 %cmp84330, label %for.body85.lr.ph.us, label %for.end101

for.body85.lr.ph.us:                              ; preds = %for.end101.us, %for.body80.lr.ph
  %indvars.iv368.us = phi i64 [ %indvars.iv.next369.us, %for.end101.us ], [ 0, %for.body80.lr.ph ]
  %tnorm.2337.us = phi double [ %add116.us, %for.end101.us ], [ 0.000000e+00, %for.body80.lr.ph ]
  %tresult.0336.us = phi i32 [ %tresult.1.us, %for.end101.us ], [ 1, %for.body80.lr.ph ]
  %P.us = getelementptr inbounds %struct.f1_neuron* %29, i64 %indvars.iv368.us, i32 5
  %35 = load double* %P.us, align 8, !tbaa !11
  %arrayidx94.us = getelementptr inbounds double** %34, i64 %indvars.iv368.us
  %36 = load double* @d, align 8, !tbaa !10
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.inc99.us, %for.body85.lr.ph.us
  %indvars.iv364.us = phi i64 [ 0, %for.body85.lr.ph.us ], [ %indvars.iv.next365.us, %for.inc99.us ]
  %tsum.0332.us = phi double [ 0.000000e+00, %for.body85.lr.ph.us ], [ %tsum.1.us, %for.inc99.us ]
  %37 = trunc i64 %indvars.iv364.us to i32
  %cmp86.us = icmp eq i32 %37, %32
  br i1 %cmp86.us, label %land.lhs.true87.us, label %for.inc99.us

land.lhs.true87.us:                               ; preds = %for.body85.us
  %y.us = getelementptr inbounds %struct.xyz* %33, i64 %indvars.iv364.us, i32 0
  %38 = load double* %y.us, align 8, !tbaa !7
  %cmp90.us = fcmp ogt double %38, 0.000000e+00
  br i1 %cmp90.us, label %if.then91.us, label %for.inc99.us

if.then91.us:                                     ; preds = %land.lhs.true87.us
  %39 = load double** %arrayidx94.us, align 8, !tbaa !5
  %arrayidx95.us = getelementptr inbounds double* %39, i64 %indvars.iv364.us
  %40 = load double* %arrayidx95.us, align 8, !tbaa !10
  %mul96.us = fmul double %36, %40
  %add97.us = fadd double %tsum.0332.us, %mul96.us
  br label %for.inc99.us

for.inc99.us:                                     ; preds = %if.then91.us, %land.lhs.true87.us, %for.body85.us
  %tsum.1.us = phi double [ %add97.us, %if.then91.us ], [ %tsum.0332.us, %land.lhs.true87.us ], [ %tsum.0332.us, %for.body85.us ]
  %indvars.iv.next365.us = add nuw nsw i64 %indvars.iv364.us, 1
  %lftr.wideiv26 = trunc i64 %indvars.iv.next365.us to i32
  %exitcond27 = icmp eq i32 %lftr.wideiv26, %31
  br i1 %exitcond27, label %for.end101.us, label %for.body85.us

for.end101.us:                                    ; preds = %for.inc99.us
  %U104.us = getelementptr inbounds %struct.f1_neuron* %29, i64 %indvars.iv368.us, i32 4
  %41 = load double* %U104.us, align 8, !tbaa !13
  %add105.us = fadd double %tsum.1.us, %41
  store double %add105.us, double* %P.us, align 8, !tbaa !11
  %mul115.us = fmul double %add105.us, %add105.us
  %add116.us = fadd double %tnorm.2337.us, %mul115.us
  %cmp120.us = fcmp une double %35, %add105.us
  %tresult.1.us = select i1 %cmp120.us, i32 0, i32 %tresult.0336.us
  %indvars.iv.next369.us = add nuw nsw i64 %indvars.iv368.us, 1
  %lftr.wideiv28 = trunc i64 %indvars.iv.next369.us to i32
  %exitcond29 = icmp eq i32 %lftr.wideiv28, %28
  br i1 %exitcond29, label %for.end125, label %for.body85.lr.ph.us

for.end101:                                       ; preds = %for.end101, %for.body80.lr.ph
  %indvars.iv368 = phi i64 [ %indvars.iv.next369, %for.end101 ], [ 0, %for.body80.lr.ph ]
  %tnorm.2337 = phi double [ %add116, %for.end101 ], [ 0.000000e+00, %for.body80.lr.ph ]
  %tresult.0336 = phi i32 [ %tresult.1, %for.end101 ], [ 1, %for.body80.lr.ph ]
  %P = getelementptr inbounds %struct.f1_neuron* %29, i64 %indvars.iv368, i32 5
  %42 = load double* %P, align 8, !tbaa !11
  %U104 = getelementptr inbounds %struct.f1_neuron* %29, i64 %indvars.iv368, i32 4
  %43 = load double* %U104, align 8, !tbaa !13
  %add105 = fadd double %43, 0.000000e+00
  store double %add105, double* %P, align 8, !tbaa !11
  %mul115 = fmul double %add105, %add105
  %add116 = fadd double %tnorm.2337, %mul115
  %cmp120 = fcmp une double %42, %add105
  %tresult.1 = select i1 %cmp120, i32 0, i32 %tresult.0336
  %indvars.iv.next369 = add nuw nsw i64 %indvars.iv368, 1
  %lftr.wideiv16 = trunc i64 %indvars.iv.next369 to i32
  %exitcond17 = icmp eq i32 %lftr.wideiv16, %28
  br i1 %exitcond17, label %for.end125, label %for.end101

for.end125:                                       ; preds = %for.end101, %for.end101.us, %for.end63
  %tnorm.2.lcssa = phi double [ 0.000000e+00, %for.end63 ], [ %add116, %for.end101 ], [ %add116.us, %for.end101.us ]
  %tresult.0.lcssa = phi i32 [ 1, %for.end63 ], [ %tresult.1, %for.end101 ], [ %tresult.1.us, %for.end101.us ]
  %call126 = tail call double @sqrt(double %tnorm.2.lcssa) #6
  %44 = load i32* @numf1s, align 4, !tbaa !1
  %cmp128340 = icmp sgt i32 %44, 0
  br i1 %cmp128340, label %for.body129.lr.ph, label %for.cond139.loopexit

for.body129.lr.ph:                                ; preds = %for.end125
  %45 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body129

for.body129:                                      ; preds = %for.body129, %for.body129.lr.ph
  %indvars.iv370 = phi i64 [ 0, %for.body129.lr.ph ], [ %indvars.iv.next371, %for.body129 ]
  %P132 = getelementptr inbounds %struct.f1_neuron* %45, i64 %indvars.iv370, i32 5
  %46 = load double* %P132, align 8, !tbaa !11
  %Q135 = getelementptr inbounds %struct.f1_neuron* %45, i64 %indvars.iv370, i32 6
  store double %46, double* %Q135, align 8, !tbaa !19
  %indvars.iv.next371 = add nuw nsw i64 %indvars.iv370, 1
  %lftr.wideiv18 = trunc i64 %indvars.iv.next371 to i32
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %44
  br i1 %exitcond19, label %for.cond139.loopexit, label %for.body129

for.cond139.loopexit:                             ; preds = %for.body129, %for.end125
  %47 = load i32* @numf2s, align 4, !tbaa !1
  %cmp140344 = icmp sgt i32 %47, 0
  br i1 %cmp140344, label %for.body141.lr.ph, label %for.end170.thread

for.end170.thread:                                ; preds = %for.cond139.loopexit
  store i32 0, i32* @winner, align 4, !tbaa !1
  br label %for.inc186

for.body141.lr.ph:                                ; preds = %for.cond139.loopexit
  %48 = load %struct.xyz** @Y, align 8, !tbaa !5
  %49 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  %50 = load double*** @bus, align 8, !tbaa !5
  br i1 %cmp128340, label %for.body141, label %for.inc168.us

for.inc168.us:                                    ; preds = %for.inc168.us, %for.body141.lr.ph
  %indvars.iv376.us = phi i64 [ %indvars.iv.next377.us, %for.inc168.us ], [ 0, %for.body141.lr.ph ]
  %y144.us = getelementptr inbounds %struct.xyz* %48, i64 %indvars.iv376.us, i32 0
  store double 0.000000e+00, double* %y144.us, align 8, !tbaa !7
  %indvars.iv.next377.us = add nuw nsw i64 %indvars.iv376.us, 1
  %lftr.wideiv30 = trunc i64 %indvars.iv.next377.us to i32
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %47
  br i1 %exitcond31, label %for.body173.lr.ph, label %for.inc168.us

for.body141:                                      ; preds = %for.inc168, %for.body141.lr.ph
  %indvars.iv376 = phi i64 [ %indvars.iv.next377, %for.inc168 ], [ 0, %for.body141.lr.ph ]
  %y144 = getelementptr inbounds %struct.xyz* %48, i64 %indvars.iv376, i32 0
  store double 0.000000e+00, double* %y144, align 8, !tbaa !7
  %reset = getelementptr inbounds %struct.xyz* %48, i64 %indvars.iv376, i32 1
  %51 = load i32* %reset, align 4, !tbaa !16
  %tobool147.not = icmp eq i32 %51, 0
  br i1 %tobool147.not, label %for.body151, label %for.inc168

for.body151:                                      ; preds = %for.body151, %for.body141
  %52 = phi double [ %add163, %for.body151 ], [ 0.000000e+00, %for.body141 ]
  %indvars.iv372 = phi i64 [ %indvars.iv.next373, %for.body151 ], [ 0, %for.body141 ]
  %P154 = getelementptr inbounds %struct.f1_neuron* %49, i64 %indvars.iv372, i32 5
  %53 = load double* %P154, align 8, !tbaa !11
  %arrayidx157 = getelementptr inbounds double** %50, i64 %indvars.iv372
  %54 = load double** %arrayidx157, align 8, !tbaa !5
  %arrayidx158 = getelementptr inbounds double* %54, i64 %indvars.iv376
  %55 = load double* %arrayidx158, align 8, !tbaa !10
  %mul159 = fmul double %53, %55
  %add163 = fadd double %52, %mul159
  store double %add163, double* %y144, align 8, !tbaa !7
  %indvars.iv.next373 = add nuw nsw i64 %indvars.iv372, 1
  %lftr.wideiv20 = trunc i64 %indvars.iv.next373 to i32
  %exitcond21 = icmp eq i32 %lftr.wideiv20, %44
  br i1 %exitcond21, label %for.inc168, label %for.body151

for.inc168:                                       ; preds = %for.body151, %for.body141
  %indvars.iv.next377 = add nuw nsw i64 %indvars.iv376, 1
  %lftr.wideiv22 = trunc i64 %indvars.iv.next377 to i32
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %47
  br i1 %exitcond23, label %for.body173.lr.ph, label %for.body141

for.body173.lr.ph:                                ; preds = %for.inc168, %for.inc168.us
  store i32 0, i32* @winner, align 4, !tbaa !1
  br label %for.body173

for.body173:                                      ; preds = %for.inc183, %for.body173.lr.ph
  %56 = phi i32 [ 0, %for.body173.lr.ph ], [ %60, %for.inc183 ]
  %indvars.iv378 = phi i64 [ 0, %for.body173.lr.ph ], [ %indvars.iv.next379, %for.inc183 ]
  %y176 = getelementptr inbounds %struct.xyz* %48, i64 %indvars.iv378, i32 0
  %57 = load double* %y176, align 8, !tbaa !7
  %idxprom177 = sext i32 %56 to i64
  %y179 = getelementptr inbounds %struct.xyz* %48, i64 %idxprom177, i32 0
  %58 = load double* %y179, align 8, !tbaa !7
  %cmp180 = fcmp ogt double %57, %58
  br i1 %cmp180, label %if.then181, label %for.inc183

if.then181:                                       ; preds = %for.body173
  %59 = trunc i64 %indvars.iv378 to i32
  store i32 %59, i32* @winner, align 4, !tbaa !1
  br label %for.inc183

for.inc183:                                       ; preds = %if.then181, %for.body173
  %60 = phi i32 [ %56, %for.body173 ], [ %59, %if.then181 ]
  %indvars.iv.next379 = add nuw nsw i64 %indvars.iv378, 1
  %lftr.wideiv24 = trunc i64 %indvars.iv.next379 to i32
  %exitcond25 = icmp eq i32 %lftr.wideiv24, %47
  br i1 %exitcond25, label %for.inc186, label %for.body173

for.inc186:                                       ; preds = %for.inc183, %for.end170.thread
  %inc187 = add nsw i32 %j.0348, 1
  %cmp = icmp sgt i32 %j.0348, 7
  %tobool1 = icmp ne i32 %tresult.0.lcssa, 0
  %or.cond = or i1 %cmp, %tobool1
  br i1 %or.cond, label %for.end188, label %for.cond2.preheader

for.end188:                                       ; preds = %for.inc186
  %call189 = tail call double @simtest2()
  %61 = load double* @rho, align 8, !tbaa !10
  %cmp190 = fcmp ogt double %call189, %61
  %62 = load i32* @winner, align 4, !tbaa !1
  br i1 %cmp190, label %if.then191, label %if.else205

if.then191:                                       ; preds = %for.end188
  %63 = load i32* @numf2s, align 4, !tbaa !1
  %sub = add nsw i32 %63, -1
  %cmp192 = icmp eq i32 %62, %sub
  br i1 %cmp192, label %while.end, label %if.then193

if.then193:                                       ; preds = %if.then191
  store i32 1, i32* @pass_flag, align 4, !tbaa !1
  %64 = load %struct._IO_FILE** @stdout, align 8, !tbaa !5
  %call194 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([53 x i8]* @.str15, i64 0, i64 0), i32 %62, double %call189) #6
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @str50, i64 0, i64 0)) #6
  %65 = load i32* @numf2s, align 4, !tbaa !1
  %cmp5.i = icmp sgt i32 %65, 0
  br i1 %cmp5.i, label %for.body.i307, label %print_f12.exit

for.body.i307:                                    ; preds = %for.body.i307, %if.then193
  %indvars.iv.i303 = phi i64 [ %indvars.iv.next.i305, %for.body.i307 ], [ 0, %if.then193 ]
  %66 = load %struct.xyz** @Y, align 8, !tbaa !5
  %y.i304 = getelementptr inbounds %struct.xyz* %66, i64 %indvars.iv.i303, i32 0
  %67 = load double* %y.i304, align 8, !tbaa !7
  %68 = trunc i64 %indvars.iv.i303 to i32
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str14, i64 0, i64 0), i32 %68, double %67) #6
  %indvars.iv.next.i305 = add nuw nsw i64 %indvars.iv.i303, 1
  %69 = load i32* @numf2s, align 4, !tbaa !1
  %70 = trunc i64 %indvars.iv.next.i305 to i32
  %cmp.i306 = icmp slt i32 %70, %69
  br i1 %cmp.i306, label %for.body.i307, label %print_f12.exit

print_f12.exit:                                   ; preds = %for.body.i307, %if.then193
  %71 = load i32* @winner, align 4, !tbaa !1
  %idxprom195 = sext i32 %71 to i64
  %arrayidx196 = getelementptr inbounds [2 x double]* @highest_confidence, i64 0, i64 %idxprom195
  %72 = load double* %arrayidx196, align 8, !tbaa !10
  %cmp197 = fcmp ogt double %call189, %72
  br i1 %cmp197, label %if.then198, label %while.end

if.then198:                                       ; preds = %print_f12.exit
  store double %call189, double* %arrayidx196, align 8, !tbaa !10
  %arrayidx202 = getelementptr inbounds [2 x i32]* @set_high, i64 0, i64 %idxprom195
  store i32 1, i32* %arrayidx202, align 4, !tbaa !1
  br label %while.end

if.else205:                                       ; preds = %for.end188
  %idxprom206 = sext i32 %62 to i64
  %73 = load %struct.xyz** @Y, align 8, !tbaa !5
  %y208 = getelementptr inbounds %struct.xyz* %73, i64 %idxprom206, i32 0
  store double 0.000000e+00, double* %y208, align 8, !tbaa !7
  %reset211 = getelementptr inbounds %struct.xyz* %73, i64 %idxprom206, i32 1
  store i32 1, i32* %reset211, align 4, !tbaa !16
  %74 = load i32* @numf2s, align 4, !tbaa !1
  %cmp213349 = icmp sgt i32 %74, 0
  br i1 %cmp213349, label %for.body214, label %while.end

for.body214:                                      ; preds = %for.body214, %if.else205
  %indvars.iv380 = phi i64 [ %indvars.iv.next381, %for.body214 ], [ 0, %if.else205 ]
  %matchtest.0351 = phi i8 [ %.matchtest.0, %for.body214 ], [ 0, %if.else205 ]
  %reset217 = getelementptr inbounds %struct.xyz* %73, i64 %indvars.iv380, i32 1
  %75 = load i32* %reset217, align 4, !tbaa !16
  %cmp218 = icmp eq i32 %75, 0
  %.matchtest.0 = select i1 %cmp218, i8 1, i8 %matchtest.0351
  %indvars.iv.next381 = add nuw nsw i64 %indvars.iv380, 1
  %lftr.wideiv32 = trunc i64 %indvars.iv.next381 to i32
  %exitcond33 = icmp eq i32 %lftr.wideiv32, %74
  br i1 %exitcond33, label %for.end223, label %for.body214

for.end223:                                       ; preds = %for.body214
  %phitmp = icmp eq i8 %.matchtest.0, 0
  br i1 %phitmp, label %while.end, label %for.body.i300.preheader

for.body.i300.preheader:                          ; preds = %for.end223
  store i32 0, i32* @winner, align 4, !tbaa !1
  br label %for.body.i300

for.body.i300:                                    ; preds = %for.inc.i, %for.body.i300.preheader
  %76 = phi i32 [ %80, %for.inc.i ], [ 0, %for.body.i300.preheader ]
  %indvars.iv.i298 = phi i64 [ %indvars.iv.next.i301, %for.inc.i ], [ 0, %for.body.i300.preheader ]
  %y.i299 = getelementptr inbounds %struct.xyz* %73, i64 %indvars.iv.i298, i32 0
  %77 = load double* %y.i299, align 8, !tbaa !7
  %idxprom1.i = sext i32 %76 to i64
  %y3.i = getelementptr inbounds %struct.xyz* %73, i64 %idxprom1.i, i32 0
  %78 = load double* %y3.i, align 8, !tbaa !7
  %cmp4.i = fcmp ogt double %77, %78
  br i1 %cmp4.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.i300
  %79 = trunc i64 %indvars.iv.i298 to i32
  store i32 %79, i32* @winner, align 4, !tbaa !1
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i300
  %80 = phi i32 [ %76, %for.body.i300 ], [ %79, %if.then.i ]
  %indvars.iv.next.i301 = add nuw nsw i64 %indvars.iv.i298, 1
  %lftr.wideiv34 = trunc i64 %indvars.iv.next.i301 to i32
  %exitcond35 = icmp eq i32 %lftr.wideiv34, %74
  br i1 %exitcond35, label %while.body, label %for.body.i300

while.end:                                        ; preds = %for.end223, %if.else205, %if.then198, %print_f12.exit, %if.then191
  ret void
}

; Function Attrs: nounwind uwtable
define void @loadimage(i8* %input_file) #1 {
entry:
  %buffer = alloca [64 x i8], align 16
  %0 = getelementptr inbounds [64 x i8]* %buffer, i64 0, i64 0
  call void @llvm.lifetime.start(i64 64, i8* %0) #6
  %call = call i32 (i8*, i32, ...)* @open(i8* %input_file, i32 0) #6
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([18 x i8]* @.str16, i64 0, i64 0), i8* %input_file) #11
  call void @exit(i32 1) #10
  unreachable

if.end:                                           ; preds = %entry
  %call2 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %0, i32 8) #6
  %call4 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %0, i32 4) #6
  %2 = bitcast [64 x i8]* %buffer to i32*
  %3 = load i32* %2, align 16
  %4 = trunc i32 %3 to i16
  %5 = trunc i32 %3 to i8
  %cmp6 = icmp eq i8 %5, 32
  %6 = lshr i16 %4, 8
  %7 = trunc i16 %6 to i8
  %8 = lshr i32 %3, 16
  %9 = trunc i32 %8 to i8
  br i1 %cmp6, label %for.inc, label %if.then8

if.then8:                                         ; preds = %if.end
  %sext = shl i32 %3, 24
  %conv = ashr exact i32 %sext, 24
  %10 = load i32* @width, align 4, !tbaa !1
  %mul = mul nsw i32 %10, 10
  %add = add i32 %conv, -48
  %sub = add i32 %add, %mul
  store i32 %sub, i32* @width, align 4, !tbaa !1
  br label %for.inc

for.inc:                                          ; preds = %if.then8, %if.end
  %cmp6.1 = icmp eq i8 %7, 32
  br i1 %cmp6.1, label %for.inc.1, label %if.then8.1

if.then24:                                        ; preds = %for.inc.3
  %sext3 = shl i32 %45, 24
  %conv21 = ashr exact i32 %sext3, 24
  %11 = load i32* @height, align 4, !tbaa !1
  %mul25 = mul nsw i32 %11, 10
  %add29 = add i32 %conv21, -48
  %sub30 = add i32 %add29, %mul25
  store i32 %sub30, i32* @height, align 4, !tbaa !1
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc.3, %if.then24
  %cmp22.1 = icmp eq i8 %49, 32
  br i1 %cmp22.1, label %for.inc32.1, label %if.then24.1

if.then41:                                        ; preds = %for.inc32.3
  %12 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %13 = call i64 @fwrite(i8* getelementptr inbounds ([37 x i8]* @.str17, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %12) #8
  call void @exit(i32 1) #10
  unreachable

if.end43:                                         ; preds = %for.inc32.3
  %conv44 = sext i32 %40 to i64
  %mul45 = shl nsw i64 %conv44, 3
  %call46 = call noalias i8* @malloc(i64 %mul45) #6
  %14 = bitcast i8* %call46 to i8**
  store i8** %14, i8*** @cimage, align 8, !tbaa !5
  %cmp47 = icmp eq i8* %call46, null
  br i1 %cmp47, label %if.then49, label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %if.end43
  %cmp53126 = icmp sgt i32 %40, 0
  br i1 %cmp53126, label %for.body55.preheader, label %for.end70

for.body55.preheader:                             ; preds = %for.cond52.preheader
  %conv56 = sext i32 %41 to i64
  br label %for.body55

if.then49:                                        ; preds = %if.end43
  %15 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([37 x i8]* @.str17, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %15) #8
  call void @exit(i32 1) #10
  unreachable

for.cond52:                                       ; preds = %for.body55
  %17 = trunc i64 %indvars.iv.next136 to i32
  %cmp53 = icmp slt i32 %17, %40
  br i1 %cmp53, label %for.body55, label %for.end70

for.body55:                                       ; preds = %for.cond52, %for.body55.preheader
  %18 = phi i8** [ %19, %for.cond52 ], [ %14, %for.body55.preheader ]
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %for.cond52 ], [ 0, %for.body55.preheader ]
  %call58 = call noalias i8* @malloc(i64 %conv56) #6
  %arrayidx60 = getelementptr inbounds i8** %18, i64 %indvars.iv135
  store i8* %call58, i8** %arrayidx60, align 8, !tbaa !5
  %19 = load i8*** @cimage, align 8, !tbaa !5
  %arrayidx62 = getelementptr inbounds i8** %19, i64 %indvars.iv135
  %20 = load i8** %arrayidx62, align 8, !tbaa !5
  %cmp63 = icmp eq i8* %20, null
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  br i1 %cmp63, label %if.then65, label %for.cond52

if.then65:                                        ; preds = %for.body55
  %21 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([37 x i8]* @.str17, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %21) #8
  call void @exit(i32 1) #10
  unreachable

for.end70:                                        ; preds = %for.cond52, %for.cond52.preheader
  %call72 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %call38, i32 %mul35) #6
  %23 = load i32* @height, align 4, !tbaa !1
  %cmp74120 = icmp sgt i32 %23, 0
  br i1 %cmp74120, label %for.cond77.preheader.lr.ph, label %for.end94

for.cond77.preheader.lr.ph:                       ; preds = %for.end70
  %.pre141 = load i32* @width, align 4, !tbaa !1
  br label %for.cond77.preheader

for.cond77.preheader:                             ; preds = %for.inc92, %for.cond77.preheader.lr.ph
  %24 = phi i32 [ %23, %for.cond77.preheader.lr.ph ], [ %34, %for.inc92 ]
  %25 = phi i32 [ %.pre141, %for.cond77.preheader.lr.ph ], [ %35, %for.inc92 ]
  %indvars.iv131 = phi i64 [ 0, %for.cond77.preheader.lr.ph ], [ %indvars.iv.next132, %for.inc92 ]
  %cmp78118 = icmp sgt i32 %25, 0
  br i1 %cmp78118, label %for.body80.preheader, label %for.inc92

for.body80.preheader:                             ; preds = %for.cond77.preheader
  %26 = trunc i64 %indvars.iv131 to i32
  br label %for.body80

for.body80:                                       ; preds = %for.body80, %for.body80.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body80 ], [ 0, %for.body80.preheader ]
  %27 = phi i32 [ %32, %for.body80 ], [ %25, %for.body80.preheader ]
  %mul81 = mul nsw i32 %27, %26
  %28 = trunc i64 %indvars.iv to i32
  %add82 = add nsw i32 %mul81, %28
  %idxprom83 = sext i32 %add82 to i64
  %arrayidx84 = getelementptr inbounds i8* %call38, i64 %idxprom83
  %29 = load i8* %arrayidx84, align 1, !tbaa !21
  %30 = load i8*** @cimage, align 8, !tbaa !5
  %arrayidx87 = getelementptr inbounds i8** %30, i64 %indvars.iv131
  %31 = load i8** %arrayidx87, align 8, !tbaa !5
  %arrayidx88 = getelementptr inbounds i8* %31, i64 %indvars.iv
  store i8 %29, i8* %arrayidx88, align 1, !tbaa !21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = load i32* @width, align 4, !tbaa !1
  %33 = trunc i64 %indvars.iv.next to i32
  %cmp78 = icmp slt i32 %33, %32
  br i1 %cmp78, label %for.body80, label %for.cond77.for.inc92_crit_edge

for.cond77.for.inc92_crit_edge:                   ; preds = %for.body80
  %.pre142 = load i32* @height, align 4, !tbaa !1
  br label %for.inc92

for.inc92:                                        ; preds = %for.cond77.for.inc92_crit_edge, %for.cond77.preheader
  %34 = phi i32 [ %.pre142, %for.cond77.for.inc92_crit_edge ], [ %24, %for.cond77.preheader ]
  %35 = phi i32 [ %32, %for.cond77.for.inc92_crit_edge ], [ %25, %for.cond77.preheader ]
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %36 = trunc i64 %indvars.iv.next132 to i32
  %cmp74 = icmp slt i32 %36, %34
  br i1 %cmp74, label %for.cond77.preheader, label %for.end94

for.end94:                                        ; preds = %for.inc92, %for.end70
  call void @llvm.lifetime.end(i64 64, i8* %0) #6
  ret void

if.then24.1:                                      ; preds = %for.inc32
  %conv21.1 = sext i8 %49 to i32
  %37 = load i32* @height, align 4, !tbaa !1
  %mul25.1 = mul nsw i32 %37, 10
  %add29.1 = add i32 %conv21.1, -48
  %sub30.1 = add i32 %add29.1, %mul25.1
  store i32 %sub30.1, i32* @height, align 4, !tbaa !1
  br label %for.inc32.1

for.inc32.1:                                      ; preds = %if.then24.1, %for.inc32
  %cmp22.2 = icmp eq i8 %51, 32
  br i1 %cmp22.2, label %for.inc32.2, label %if.then24.2

if.then24.2:                                      ; preds = %for.inc32.1
  %sext4 = shl i32 %50, 24
  %conv21.2 = ashr exact i32 %sext4, 24
  %38 = load i32* @height, align 4, !tbaa !1
  %mul25.2 = mul nsw i32 %38, 10
  %add29.2 = add i32 %conv21.2, -48
  %sub30.2 = add i32 %add29.2, %mul25.2
  store i32 %sub30.2, i32* @height, align 4, !tbaa !1
  br label %for.inc32.2

for.inc32.2:                                      ; preds = %if.then24.2, %for.inc32.1
  %.mask6 = and i32 %45, -16777216
  %cmp22.3 = icmp eq i32 %.mask6, 536870912
  br i1 %cmp22.3, label %for.inc32.2.for.inc32.3_crit_edge, label %if.then24.3

for.inc32.2.for.inc32.3_crit_edge:                ; preds = %for.inc32.2
  %.pre = load i32* @height, align 4, !tbaa !1
  br label %for.inc32.3

if.then24.3:                                      ; preds = %for.inc32.2
  %conv21.3 = ashr i32 %45, 24
  %39 = load i32* @height, align 4, !tbaa !1
  %mul25.3 = mul nsw i32 %39, 10
  %add29.3 = add i32 %conv21.3, -48
  %sub30.3 = add i32 %add29.3, %mul25.3
  store i32 %sub30.3, i32* @height, align 4, !tbaa !1
  br label %for.inc32.3

for.inc32.3:                                      ; preds = %if.then24.3, %for.inc32.2.for.inc32.3_crit_edge
  %40 = phi i32 [ %.pre, %for.inc32.2.for.inc32.3_crit_edge ], [ %sub30.3, %if.then24.3 ]
  %41 = load i32* @width, align 4, !tbaa !1
  %mul35 = mul nsw i32 %41, %40
  %conv36 = sext i32 %mul35 to i64
  %call38 = call noalias i8* @malloc(i64 %conv36) #6
  %cmp39 = icmp eq i8* %call38, null
  br i1 %cmp39, label %if.then41, label %if.end43

if.then8.1:                                       ; preds = %for.inc
  %conv.1 = sext i8 %7 to i32
  %42 = load i32* @width, align 4, !tbaa !1
  %mul.1 = mul nsw i32 %42, 10
  %add.1 = add i32 %conv.1, -48
  %sub.1 = add i32 %add.1, %mul.1
  store i32 %sub.1, i32* @width, align 4, !tbaa !1
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.then8.1, %for.inc
  %cmp6.2 = icmp eq i8 %9, 32
  br i1 %cmp6.2, label %for.inc.2, label %if.then8.2

if.then8.2:                                       ; preds = %for.inc.1
  %sext1 = shl i32 %8, 24
  %conv.2 = ashr exact i32 %sext1, 24
  %43 = load i32* @width, align 4, !tbaa !1
  %mul.2 = mul nsw i32 %43, 10
  %add.2 = add i32 %conv.2, -48
  %sub.2 = add i32 %add.2, %mul.2
  store i32 %sub.2, i32* @width, align 4, !tbaa !1
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.then8.2, %for.inc.1
  %.mask = and i32 %3, -16777216
  %cmp6.3 = icmp eq i32 %.mask, 536870912
  br i1 %cmp6.3, label %for.inc.3, label %if.then8.3

if.then8.3:                                       ; preds = %for.inc.2
  %conv.3 = ashr i32 %3, 24
  %44 = load i32* @width, align 4, !tbaa !1
  %mul.3 = mul nsw i32 %44, 10
  %add.3 = add i32 %conv.3, -48
  %sub.3 = add i32 %add.3, %mul.3
  store i32 %sub.3, i32* @width, align 4, !tbaa !1
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.then8.3, %for.inc.2
  %call14 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %0, i32 4) #6
  %45 = load i32* %2, align 16
  %46 = trunc i32 %45 to i16
  %47 = trunc i32 %45 to i8
  %cmp22 = icmp eq i8 %47, 32
  %48 = lshr i16 %46, 8
  %49 = trunc i16 %48 to i8
  %50 = lshr i32 %45, 16
  %51 = trunc i32 %50 to i8
  br i1 %cmp22, label %for.inc32, label %if.then24
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

declare i32 @open(i8* nocapture readonly, i32, ...) #5

declare i32 @read(...) #5

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

; Function Attrs: nounwind uwtable
define void @load_weights(i8* %weightfile) #1 {
entry:
  %a = alloca double, align 8
  %call = call %struct._IO_FILE* @fopen(i8* %weightfile, i8* getelementptr inbounds ([2 x i8]* @.str18, i64 0, i64 0)) #6
  %cmp = icmp eq %struct._IO_FILE* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([19 x i8]* @.str19, i64 0, i64 0), i8* %weightfile) #11
  call void @exit(i32 1) #10
  unreachable

if.end:                                           ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str51, i64 0, i64 0))
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([6 x i8]* @.str21, i64 0, i64 0), i32* @lwidth, i32* @lheight) #6
  %1 = load i32* @lwidth, align 4, !tbaa !1
  %2 = load i32* @lheight, align 4, !tbaa !1
  %mul = mul nsw i32 %2, %1
  store i32 %mul, i32* @numinputs, align 4, !tbaa !1
  store i32 %mul, i32* @numf1s, align 4, !tbaa !1
  %3 = load i32* @numpatterns, align 4, !tbaa !1
  %add = add nsw i32 %3, 1
  store i32 %add, i32* @numf2s, align 4, !tbaa !1
  call void @alloc_td_bu()
  %4 = load i32* @numf1s, align 4, !tbaa !1
  %cmp417 = icmp sgt i32 %4, 0
  br i1 %cmp417, label %for.body, label %for.end

for.body:                                         ; preds = %for.body, %if.end
  %i.018 = phi i64 [ %inc, %for.body ], [ 0, %if.end ]
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([4 x i8]* @.str22, i64 0, i64 0), double* %a) #6
  %5 = load double* %a, align 8, !tbaa !10
  %6 = load double*** @tds, align 8, !tbaa !5
  %arrayidx = getelementptr inbounds double** %6, i64 %i.018
  %7 = load double** %arrayidx, align 8, !tbaa !5
  store double %5, double* %7, align 8, !tbaa !10
  %8 = load double*** @bus, align 8, !tbaa !5
  %arrayidx8 = getelementptr inbounds double** %8, i64 %i.018
  %9 = load double** %arrayidx8, align 8, !tbaa !5
  store double %5, double* %9, align 8, !tbaa !10
  %inc = add nsw i64 %i.018, 1
  %10 = load i32* @numf1s, align 4, !tbaa !1
  %conv = sext i32 %10 to i64
  %cmp4 = icmp slt i64 %inc, %conv
  br i1 %cmp4, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %if.end
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #2

; Function Attrs: nounwind uwtable
define void @alloc_td_bu() #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %conv = sext i32 %0 to i64
  %mul = shl nsw i64 %conv, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %1 = bitcast i8* %call to double**
  store double** %1, double*** @bus, align 8, !tbaa !5
  %call3 = tail call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call3 to double**
  store double** %2, double*** @tds, align 8, !tbaa !5
  %cmp = icmp eq i8* %call, null
  %cmp5 = icmp eq i8* %call3, null
  %or.cond = or i1 %cmp, %cmp5
  br i1 %or.cond, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  store i64 0, i64* @i, align 8, !tbaa !22
  %cmp919 = icmp sgt i32 %0, 0
  br i1 %cmp919, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %.pre = load i32* @numf2s, align 4, !tbaa !1
  %conv11 = sext i32 %.pre to i64
  %mul12 = shl nsw i64 %conv11, 3
  %call131 = tail call noalias i8* @malloc(i64 %mul12) #6
  %3 = bitcast i8* %call131 to double*
  store double* %3, double** %1, align 8, !tbaa !5
  %call162 = tail call noalias i8* @malloc(i64 %mul12) #6
  %4 = bitcast i8* %call162 to double*
  store double* %4, double** %2, align 8, !tbaa !5
  store i64 1, i64* @i, align 8, !tbaa !22
  %cmp93 = icmp sgt i32 %0, 1
  br i1 %cmp93, label %for.body.for.body_crit_edge, label %for.end

if.then:                                          ; preds = %entry
  %5 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8]* @.str23, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %5) #8
  tail call void @exit(i32 1) #10
  unreachable

for.body.for.body_crit_edge:                      ; preds = %for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge, %for.body.lr.ph
  %.pre20 = phi double** [ %.pre20.pre, %for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge ], [ %1, %for.body.lr.ph ]
  %inc4 = phi i64 [ %inc, %for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge ], [ 1, %for.body.lr.ph ]
  %call13 = tail call noalias i8* @malloc(i64 %mul12) #6
  %7 = bitcast i8* %call13 to double*
  %arrayidx = getelementptr inbounds double** %.pre20, i64 %inc4
  store double* %7, double** %arrayidx, align 8, !tbaa !5
  %call16 = tail call noalias i8* @malloc(i64 %mul12) #6
  %8 = bitcast i8* %call16 to double*
  %9 = load double*** @tds, align 8, !tbaa !5
  %arrayidx17 = getelementptr inbounds double** %9, i64 %inc4
  store double* %8, double** %arrayidx17, align 8, !tbaa !5
  %inc = add nsw i64 %inc4, 1
  store i64 %inc, i64* @i, align 8, !tbaa !22
  %exitcond = icmp eq i64 %inc, %conv
  br i1 %exitcond, label %for.end, label %for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge

for.body.for.body_crit_edge.for.body.for.body_crit_edge_crit_edge: ; preds = %for.body.for.body_crit_edge
  %.pre20.pre = load double*** @bus, align 8, !tbaa !5
  br label %for.body.for.body_crit_edge

for.end:                                          ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph, %for.cond.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define void @init_td(i32 %start) #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp15 = icmp sgt i32 %0, 0
  br i1 %cmp15, label %for.cond1.preheader.lr.ph, label %for.end8

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = load i32* @numf2s, align 4, !tbaa !1
  %cmp213 = icmp sgt i32 %1, %start
  %2 = load double*** @tds, align 8, !tbaa !5
  %3 = sext i32 %start to i64
  %4 = xor i32 %start, -1
  %5 = add i32 %1, %4
  %6 = zext i32 %5 to i64
  %7 = shl nuw nsw i64 %6, 3
  %8 = add i64 %7, 8
  br i1 %cmp213, label %for.inc6.us, label %for.end8

for.inc6.us:                                      ; preds = %for.inc6.us, %for.cond1.preheader.lr.ph
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us, %for.inc6.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %arrayidx.us = getelementptr inbounds double** %2, i64 %indvars.iv.us
  %9 = load double** %arrayidx.us, align 8, !tbaa !5
  %scevgep.us = getelementptr double* %9, i64 %3
  %scevgep17.us = bitcast double* %scevgep.us to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep17.us, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.us to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %for.end8, label %for.inc6.us

for.end8:                                         ; preds = %for.inc6.us, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @init_bu(i32 %start) #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp16 = icmp sgt i32 %0, 0
  br i1 %cmp16, label %for.cond1.preheader.lr.ph, label %for.end9

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = sext i32 %start to i64
  %.pre = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %for.cond1.preheader.lr.ph
  %2 = phi i32 [ %0, %for.cond1.preheader.lr.ph ], [ %10, %for.inc7 ]
  %3 = phi i32 [ %.pre, %for.cond1.preheader.lr.ph ], [ %11, %for.inc7 ]
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next19, %for.inc7 ]
  %cmp214 = icmp sgt i32 %3, %start
  br i1 %cmp214, label %for.body3, label %for.inc7

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %4 = phi i32 [ %.pre21, %for.body3 ], [ %2, %for.cond1.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %1, %for.cond1.preheader ]
  %5 = load double* @d, align 8, !tbaa !10
  %sub = fsub double 1.000000e+00, %5
  %div = fdiv double 1.000000e+00, %sub
  %conv = sitofp i32 %4 to double
  %call = tail call double @sqrt(double %conv) #6
  %div4 = fdiv double %div, %call
  %6 = load double*** @bus, align 8, !tbaa !5
  %arrayidx = getelementptr inbounds double** %6, i64 %indvars.iv18
  %7 = load double** %arrayidx, align 8, !tbaa !5
  %arrayidx6 = getelementptr inbounds double* %7, i64 %indvars.iv
  store double %div4, double* %arrayidx6, align 8, !tbaa !10
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %8 = load i32* @numf2s, align 4, !tbaa !1
  %9 = trunc i64 %indvars.iv.next to i32
  %cmp2 = icmp slt i32 %9, %8
  %.pre21 = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2, label %for.body3, label %for.inc7

for.inc7:                                         ; preds = %for.body3, %for.cond1.preheader
  %10 = phi i32 [ %2, %for.cond1.preheader ], [ %.pre21, %for.body3 ]
  %11 = phi i32 [ %3, %for.cond1.preheader ], [ %8, %for.body3 ]
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %12 = trunc i64 %indvars.iv.next19 to i32
  %cmp = icmp slt i32 %12, %10
  br i1 %cmp, label %for.cond1.preheader, label %for.end9

for.end9:                                         ; preds = %for.inc7, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @load_train(i8* %trainfile, i32 %mode, i32 %objects) #1 {
entry:
  %buffer = alloca [64 x i8], align 16
  %0 = getelementptr inbounds [64 x i8]* %buffer, i64 0, i64 0
  call void @llvm.lifetime.start(i64 64, i8* %0) #6
  %cmp = icmp eq i32 %mode, 1
  %1 = zext i1 %cmp to i64
  %. = xor i64 %1, 1
  %call = call i32 (i8*, i32, ...)* @open(i8* %trainfile, i32 0) #6
  %cmp1 = icmp eq i32 %call, -1
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %entry
  %2 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([18 x i8]* @.str16, i64 0, i64 0), i8* %trainfile) #11
  call void @exit(i32 1) #10
  unreachable

if.end4:                                          ; preds = %entry
  store i32 0, i32* @lwidth, align 4, !tbaa !1
  store i32 0, i32* @lheight, align 4, !tbaa !1
  %call5 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %0, i32 8) #6
  %call7 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %0, i32 4) #6
  %3 = bitcast [64 x i8]* %buffer to i32*
  %4 = load i32* %3, align 16
  %5 = trunc i32 %4 to i16
  %6 = trunc i32 %4 to i8
  %cmp9 = icmp eq i8 %6, 32
  %7 = lshr i16 %5, 8
  %8 = trunc i16 %7 to i8
  %9 = lshr i32 %4, 16
  %10 = trunc i32 %9 to i8
  br i1 %cmp9, label %for.inc, label %if.then11

if.then11:                                        ; preds = %if.end4
  %sext = shl i32 %4, 24
  %conv = ashr exact i32 %sext, 24
  %11 = load i32* @lwidth, align 4, !tbaa !1
  %mul = mul nsw i32 %11, 10
  %add = add i32 %conv, -48
  %sub = add i32 %add, %mul
  store i32 %sub, i32* @lwidth, align 4, !tbaa !1
  br label %for.inc

for.inc:                                          ; preds = %if.then11, %if.end4
  %cmp9.1 = icmp eq i8 %8, 32
  br i1 %cmp9.1, label %for.inc.1, label %if.then11.1

if.then27:                                        ; preds = %for.inc.3
  %sext3 = shl i32 %34, 24
  %conv24 = ashr exact i32 %sext3, 24
  %12 = load i32* @lheight, align 4, !tbaa !1
  %mul28 = mul nsw i32 %12, 10
  %add32 = add i32 %conv24, -48
  %sub33 = add i32 %add32, %mul28
  store i32 %sub33, i32* @lheight, align 4, !tbaa !1
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc.3, %if.then27
  %cmp25.1 = icmp eq i8 %38, 32
  br i1 %cmp25.1, label %for.inc35.1, label %if.then27.1

if.then40:                                        ; preds = %for.inc35.3
  store i32 %mul41, i32* @numinputs, align 4, !tbaa !1
  store i32 %mul41, i32* @numf1s, align 4, !tbaa !1
  %add42 = add nsw i32 %objects, 1
  store i32 %add42, i32* @numf2s, align 4, !tbaa !1
  store double 2.550000e+02, double* @a, align 8, !tbaa !10
  store double 1.000000e+01, double* @b, align 8, !tbaa !10
  store double 1.100000e-01, double* @c, align 8, !tbaa !10
  store double 9.000000e-01, double* @d, align 8, !tbaa !10
  %conv1.i = sitofp i32 %mul41 to double
  %call2.i = call double @sqrt(double %conv1.i) #6
  %storemerge5.i = fdiv double 1.000000e+00, %call2.i
  store double %storemerge5.i, double* @theta, align 8, !tbaa !10
  store double 7.000000e-01, double* @delta_t, align 8, !tbaa !10
  store double 9.500000e-01, double* @rho, align 8, !tbaa !10
  call void @init_net()
  %.pre106 = load i32* @lwidth, align 4, !tbaa !1
  %.pre107 = load i32* @lheight, align 4, !tbaa !1
  br label %if.end51

if.else43:                                        ; preds = %for.inc35.3
  %13 = load i32* @numf1s, align 4, !tbaa !1
  %cmp45 = icmp eq i32 %mul41, %13
  br i1 %cmp45, label %if.end51, label %if.then47

if.then47:                                        ; preds = %if.else43
  %14 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %15 = call i64 @fwrite(i8* getelementptr inbounds ([39 x i8]* @.str24, i64 0, i64 0), i64 38, i64 1, %struct._IO_FILE* %14) #8
  %16 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([24 x i8]* @.str25, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %16) #8
  call void @exit(i32 1) #10
  unreachable

if.end51:                                         ; preds = %if.else43, %if.then40
  %18 = phi i32 [ %29, %if.else43 ], [ %.pre107, %if.then40 ]
  %19 = phi i32 [ %30, %if.else43 ], [ %.pre106, %if.then40 ]
  %mul52 = mul nsw i32 %19, %18
  %conv53 = sext i32 %mul52 to i64
  %call55 = call noalias i8* @malloc(i64 %conv53) #6
  %cmp56 = icmp eq i8* %call55, null
  br i1 %cmp56, label %if.then58, label %if.end60

if.then58:                                        ; preds = %if.end51
  %20 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([37 x i8]* @.str17, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %20) #8
  call void @exit(i32 1) #10
  unreachable

if.end60:                                         ; preds = %if.end51
  %call62 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %call55, i32 %mul52) #6
  %22 = load i32* @lheight, align 4, !tbaa !1
  %23 = load i32* @lwidth, align 4, !tbaa !1
  %mul6497 = mul i32 %23, %22
  %cmp6598 = icmp sgt i32 %mul6497, 0
  br i1 %cmp6598, label %for.body67.lr.ph, label %for.end77

for.body67.lr.ph:                                 ; preds = %if.end60
  %.pre108 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body67

for.body67:                                       ; preds = %for.body67, %for.body67.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body67.lr.ph ], [ %indvars.iv.next, %for.body67 ]
  %arrayidx69 = getelementptr inbounds i8* %call55, i64 %indvars.iv
  %24 = load i8* %arrayidx69, align 1, !tbaa !21
  %conv70 = uitofp i8 %24 to double
  %I = getelementptr inbounds %struct.f1_neuron* %.pre108, i64 %indvars.iv, i32 0
  %25 = load double** %I, align 8, !tbaa !15
  %arrayidx74 = getelementptr inbounds double* %25, i64 %.
  store double %conv70, double* %arrayidx74, align 8, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %mul6497
  br i1 %exitcond, label %for.end77, label %for.body67

for.end77:                                        ; preds = %for.body67, %if.end60
  call void @free(i8* %call55) #6
  call void @llvm.lifetime.end(i64 64, i8* %0) #6
  ret void

if.then27.1:                                      ; preds = %for.inc35
  %conv24.1 = sext i8 %38 to i32
  %26 = load i32* @lheight, align 4, !tbaa !1
  %mul28.1 = mul nsw i32 %26, 10
  %add32.1 = add i32 %conv24.1, -48
  %sub33.1 = add i32 %add32.1, %mul28.1
  store i32 %sub33.1, i32* @lheight, align 4, !tbaa !1
  br label %for.inc35.1

for.inc35.1:                                      ; preds = %if.then27.1, %for.inc35
  %cmp25.2 = icmp eq i8 %40, 32
  br i1 %cmp25.2, label %for.inc35.2, label %if.then27.2

if.then27.2:                                      ; preds = %for.inc35.1
  %sext4 = shl i32 %39, 24
  %conv24.2 = ashr exact i32 %sext4, 24
  %27 = load i32* @lheight, align 4, !tbaa !1
  %mul28.2 = mul nsw i32 %27, 10
  %add32.2 = add i32 %conv24.2, -48
  %sub33.2 = add i32 %add32.2, %mul28.2
  store i32 %sub33.2, i32* @lheight, align 4, !tbaa !1
  br label %for.inc35.2

for.inc35.2:                                      ; preds = %if.then27.2, %for.inc35.1
  %.mask6 = and i32 %34, -16777216
  %cmp25.3 = icmp eq i32 %.mask6, 536870912
  br i1 %cmp25.3, label %for.inc35.2.for.inc35.3_crit_edge, label %if.then27.3

for.inc35.2.for.inc35.3_crit_edge:                ; preds = %for.inc35.2
  %.pre = load i32* @lheight, align 4, !tbaa !1
  br label %for.inc35.3

if.then27.3:                                      ; preds = %for.inc35.2
  %conv24.3 = ashr i32 %34, 24
  %28 = load i32* @lheight, align 4, !tbaa !1
  %mul28.3 = mul nsw i32 %28, 10
  %add32.3 = add i32 %conv24.3, -48
  %sub33.3 = add i32 %add32.3, %mul28.3
  store i32 %sub33.3, i32* @lheight, align 4, !tbaa !1
  br label %for.inc35.3

for.inc35.3:                                      ; preds = %if.then27.3, %for.inc35.2.for.inc35.3_crit_edge
  %29 = phi i32 [ %.pre, %for.inc35.2.for.inc35.3_crit_edge ], [ %sub33.3, %if.then27.3 ]
  %30 = load i32* @lwidth, align 4, !tbaa !1
  %mul41 = mul nsw i32 %30, %29
  br i1 %cmp, label %if.then40, label %if.else43

if.then11.1:                                      ; preds = %for.inc
  %conv.1 = sext i8 %8 to i32
  %31 = load i32* @lwidth, align 4, !tbaa !1
  %mul.1 = mul nsw i32 %31, 10
  %add.1 = add i32 %conv.1, -48
  %sub.1 = add i32 %add.1, %mul.1
  store i32 %sub.1, i32* @lwidth, align 4, !tbaa !1
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.then11.1, %for.inc
  %cmp9.2 = icmp eq i8 %10, 32
  br i1 %cmp9.2, label %for.inc.2, label %if.then11.2

if.then11.2:                                      ; preds = %for.inc.1
  %sext1 = shl i32 %9, 24
  %conv.2 = ashr exact i32 %sext1, 24
  %32 = load i32* @lwidth, align 4, !tbaa !1
  %mul.2 = mul nsw i32 %32, 10
  %add.2 = add i32 %conv.2, -48
  %sub.2 = add i32 %add.2, %mul.2
  store i32 %sub.2, i32* @lwidth, align 4, !tbaa !1
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.then11.2, %for.inc.1
  %.mask = and i32 %4, -16777216
  %cmp9.3 = icmp eq i32 %.mask, 536870912
  br i1 %cmp9.3, label %for.inc.3, label %if.then11.3

if.then11.3:                                      ; preds = %for.inc.2
  %conv.3 = ashr i32 %4, 24
  %33 = load i32* @lwidth, align 4, !tbaa !1
  %mul.3 = mul nsw i32 %33, 10
  %add.3 = add i32 %conv.3, -48
  %sub.3 = add i32 %add.3, %mul.3
  store i32 %sub.3, i32* @lwidth, align 4, !tbaa !1
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.then11.3, %for.inc.2
  %call17 = call i32 (i32, i8*, i32, ...)* bitcast (i32 (...)* @read to i32 (i32, i8*, i32, ...)*)(i32 %call, i8* %0, i32 4) #6
  %34 = load i32* %3, align 16
  %35 = trunc i32 %34 to i16
  %36 = trunc i32 %34 to i8
  %cmp25 = icmp eq i8 %36, 32
  %37 = lshr i16 %35, 8
  %38 = trunc i16 %37 to i8
  %39 = lshr i32 %34, 16
  %40 = trunc i32 %39 to i8
  br i1 %cmp25, label %for.inc35, label %if.then27
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @sim_other_objects(i32 %low, i32 %high, i32 %stop) #1 {
entry:
  %cmp = icmp sgt i32 %high, %low
  br i1 %cmp, label %for.cond2.preheader.lr.ph, label %for.end56

for.cond2.preheader.lr.ph:                        ; preds = %entry
  tail call void @srand(i32 10) #6
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp388 = icmp sgt i32 %0, 0
  %1 = load double*** @tds, align 8, !tbaa !5
  %2 = load double*** @bus, align 8, !tbaa !5
  %3 = sext i32 %low to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc33, %for.cond2.preheader.lr.ph
  %indvars.iv96 = phi i64 [ %3, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next97, %for.inc33 ]
  br i1 %cmp388, label %for.body4.lr.ph, label %for.inc33

for.body4.lr.ph:                                  ; preds = %for.cond2.preheader
  %4 = trunc i64 %indvars.iv96 to i32
  %rem = srem i32 %4, %low
  %tobool = icmp eq i32 %rem, 0
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv94 = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next95, %for.inc ]
  %arrayidx = getelementptr inbounds double** %1, i64 %indvars.iv94
  %5 = load double** %arrayidx, align 8, !tbaa !5
  br i1 %tobool, label %if.else, label %if.then5

if.then5:                                         ; preds = %for.body4
  %6 = load double* %5, align 8, !tbaa !10
  %arrayidx10 = getelementptr inbounds double* %5, i64 %indvars.iv96
  store double %6, double* %arrayidx10, align 8, !tbaa !10
  %arrayidx12 = getelementptr inbounds double** %2, i64 %indvars.iv94
  %7 = load double** %arrayidx12, align 8, !tbaa !5
  %8 = load double* %7, align 8, !tbaa !10
  store double %8, double* %arrayidx10, align 8, !tbaa !10
  br label %for.inc

if.else:                                          ; preds = %for.body4
  %arrayidx20 = getelementptr inbounds double* %5, i64 1
  %9 = load double* %arrayidx20, align 8, !tbaa !10
  %arrayidx24 = getelementptr inbounds double* %5, i64 %indvars.iv96
  store double %9, double* %arrayidx24, align 8, !tbaa !10
  %arrayidx26 = getelementptr inbounds double** %2, i64 %indvars.iv94
  %10 = load double** %arrayidx26, align 8, !tbaa !5
  %arrayidx27 = getelementptr inbounds double* %10, i64 1
  %11 = load double* %arrayidx27, align 8, !tbaa !10
  store double %11, double* %arrayidx24, align 8, !tbaa !10
  br label %for.inc

for.inc:                                          ; preds = %if.else, %if.then5
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %lftr.wideiv1 = trunc i64 %indvars.iv.next95 to i32
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %0
  br i1 %exitcond2, label %for.inc33, label %for.body4

for.inc33:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv.next97 = add nsw i64 %indvars.iv96, 1
  %12 = trunc i64 %indvars.iv.next97 to i32
  %cmp1 = icmp slt i32 %12, %high
  br i1 %cmp1, label %for.cond2.preheader, label %for.cond39.preheader

for.cond39.preheader:                             ; preds = %for.inc54, %for.inc33
  %13 = phi i32 [ %22, %for.inc54 ], [ %0, %for.inc33 ]
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.inc54 ], [ %3, %for.inc33 ]
  %cmp4084 = icmp sgt i32 %13, 0
  br i1 %cmp4084, label %for.body41, label %for.inc54

for.body41:                                       ; preds = %for.body41, %for.cond39.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body41 ], [ 0, %for.cond39.preheader ]
  %call = tail call i32 @rand() #6
  %and = and i32 %call, 65535
  %conv = sitofp i32 %and to double
  %div = fdiv double %conv, 6.553500e+04
  %14 = load double*** @tds, align 8, !tbaa !5
  %arrayidx44 = getelementptr inbounds double** %14, i64 %indvars.iv
  %15 = load double** %arrayidx44, align 8, !tbaa !5
  %arrayidx45 = getelementptr inbounds double* %15, i64 %indvars.iv92
  %16 = load double* %arrayidx45, align 8, !tbaa !10
  %add = fadd double %div, %16
  store double %add, double* %arrayidx45, align 8, !tbaa !10
  %17 = load double*** @bus, align 8, !tbaa !5
  %arrayidx48 = getelementptr inbounds double** %17, i64 %indvars.iv
  %18 = load double** %arrayidx48, align 8, !tbaa !5
  %arrayidx49 = getelementptr inbounds double* %18, i64 %indvars.iv92
  %19 = load double* %arrayidx49, align 8, !tbaa !10
  %add50 = fadd double %div, %19
  store double %add50, double* %arrayidx49, align 8, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = load i32* @numf1s, align 4, !tbaa !1
  %21 = trunc i64 %indvars.iv.next to i32
  %cmp40 = icmp slt i32 %21, %20
  br i1 %cmp40, label %for.body41, label %for.inc54

for.inc54:                                        ; preds = %for.body41, %for.cond39.preheader
  %22 = phi i32 [ %13, %for.cond39.preheader ], [ %20, %for.body41 ]
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, 1
  %23 = trunc i64 %indvars.iv.next93 to i32
  %cmp37 = icmp slt i32 %23, %high
  br i1 %cmp37, label %for.cond39.preheader, label %for.end56

for.end56:                                        ; preds = %for.inc54, %entry
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @setup_base_pattern(i32 %spot) #1 {
entry:
  %0 = load i32* @numf1s, align 4, !tbaa !1
  %cmp22 = icmp sgt i32 %0, 0
  br i1 %cmp22, label %for.cond1.preheader.lr.ph, label %for.end13

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = sext i32 %spot to i64
  %.pre = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc11, %for.cond1.preheader.lr.ph
  %2 = phi i32 [ %0, %for.cond1.preheader.lr.ph ], [ %12, %for.inc11 ]
  %3 = phi i32 [ %.pre, %for.cond1.preheader.lr.ph ], [ %13, %for.inc11 ]
  %indvars.iv24 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next25, %for.inc11 ]
  %cmp220 = icmp sgt i32 %3, %spot
  br i1 %cmp220, label %for.body3, label %for.inc11

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %4 = phi i32 [ %.pre27, %for.body3 ], [ %2, %for.cond1.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %1, %for.cond1.preheader ]
  %conv = sitofp i32 %4 to double
  %call = tail call double @sqrt(double %conv) #6
  %div = fdiv double 1.000000e+00, %call
  %5 = load double* @d, align 8, !tbaa !10
  %sub = fsub double 1.000000e+00, %5
  %div4 = fdiv double %div, %sub
  %6 = load double*** @bus, align 8, !tbaa !5
  %arrayidx = getelementptr inbounds double** %6, i64 %indvars.iv24
  %7 = load double** %arrayidx, align 8, !tbaa !5
  %arrayidx6 = getelementptr inbounds double* %7, i64 %indvars.iv
  store double %div4, double* %arrayidx6, align 8, !tbaa !10
  %8 = load double*** @tds, align 8, !tbaa !5
  %arrayidx9 = getelementptr inbounds double** %8, i64 %indvars.iv24
  %9 = load double** %arrayidx9, align 8, !tbaa !5
  %arrayidx10 = getelementptr inbounds double* %9, i64 %indvars.iv
  store double %div4, double* %arrayidx10, align 8, !tbaa !10
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %10 = load i32* @numf2s, align 4, !tbaa !1
  %11 = trunc i64 %indvars.iv.next to i32
  %cmp2 = icmp slt i32 %11, %10
  %.pre27 = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2, label %for.body3, label %for.inc11

for.inc11:                                        ; preds = %for.body3, %for.cond1.preheader
  %12 = phi i32 [ %2, %for.cond1.preheader ], [ %.pre27, %for.body3 ]
  %13 = phi i32 [ %3, %for.cond1.preheader ], [ %10, %for.body3 ]
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %14 = trunc i64 %indvars.iv.next25 to i32
  %cmp = icmp slt i32 %14, %12
  br i1 %cmp, label %for.cond1.preheader, label %for.end13

for.end13:                                        ; preds = %for.inc11, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @scan_recognize(i32 %startx, i32 %starty, i32 %endx, i32 %endy, i32 %stride) #1 {
entry:
  %0 = load i32* @height, align 4, !tbaa !1
  %1 = load i32* @lheight, align 4, !tbaa !1
  %sub = sub nsw i32 %0, %1
  %add = add nsw i32 %sub, 1
  %cmp = icmp slt i32 %add, %starty
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* @width, align 4, !tbaa !1
  %3 = load i32* @lwidth, align 4, !tbaa !1
  %sub1 = sub nsw i32 %2, %3
  %add2 = add nsw i32 %sub1, 1
  %cmp3 = icmp slt i32 %add2, %startx
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([40 x i8]* @.str26, i64 0, i64 0), i32 %startx, i32 %starty) #11
  tail call void @exit(i32 1) #10
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %cmp6 = icmp slt i32 %add, %endy
  %cmp10 = icmp slt i32 %add2, %endx
  %or.cond = or i1 %cmp6, %cmp10
  br i1 %or.cond, label %if.then11, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %cmp1486 = icmp slt i32 %starty, %endy
  br i1 %cmp1486, label %for.cond15.preheader.lr.ph, label %for.end51

for.cond15.preheader.lr.ph:                       ; preds = %for.cond.preheader
  %cmp1683 = icmp slt i32 %startx, %endx
  %5 = sext i32 %startx to i64
  %6 = sext i32 %stride to i64
  %7 = sext i32 %starty to i64
  %8 = add i32 %startx, 1
  %9 = xor i32 %startx, -1
  br label %for.cond15.preheader

if.then11:                                        ; preds = %if.end
  %10 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %call12 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([36 x i8]* @.str27, i64 0, i64 0), i32 %endx, i32 %endy) #11
  tail call void @exit(i32 1) #10
  unreachable

for.cond15.preheader:                             ; preds = %for.inc49, %for.cond15.preheader.lr.ph
  %indvars.iv92 = phi i64 [ %7, %for.cond15.preheader.lr.ph ], [ %indvars.iv.next93, %for.inc49 ]
  %j.087 = phi i32 [ %starty, %for.cond15.preheader.lr.ph ], [ %add50, %for.inc49 ]
  br i1 %cmp1683, label %for.cond18.preheader, label %for.inc49

for.cond18.preheader:                             ; preds = %for.inc46, %for.cond15.preheader
  %indvars.iv5 = phi i32 [ %indvars.iv.next6, %for.inc46 ], [ %9, %for.cond15.preheader ]
  %indvars.iv3 = phi i32 [ %indvars.iv.next4, %for.inc46 ], [ %startx, %for.cond15.preheader ]
  %indvars.iv1 = phi i32 [ %indvars.iv.next2, %for.inc46 ], [ %8, %for.cond15.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc46 ], [ %5, %for.cond15.preheader ]
  %11 = load i32* @lheight, align 4, !tbaa !1
  %cmp2080 = icmp sgt i32 %11, 0
  br i1 %cmp2080, label %for.cond22.preheader.lr.ph, label %for.end33

for.cond22.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %.pre = load i32* @lwidth, align 4, !tbaa !1
  %cmp2476 = icmp sgt i32 %.pre, 0
  %add23 = add i32 %.pre, %indvars.iv3
  %add19 = add nsw i32 %11, %j.087
  %12 = icmp sgt i32 %indvars.iv1, %add23
  %smax = select i1 %12, i32 %indvars.iv1, i32 %add23
  %13 = add i32 %smax, %indvars.iv5
  %14 = zext i32 %13 to i64
  %15 = add i64 %14, 1
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.inc31, %for.cond22.preheader.lr.ph
  %indvars.iv94 = phi i64 [ %indvars.iv92, %for.cond22.preheader.lr.ph ], [ %indvars.iv.next95, %for.inc31 ]
  %k.082 = phi i64 [ 0, %for.cond22.preheader.lr.ph ], [ %k.1.lcssa, %for.inc31 ]
  %m.081 = phi i32 [ %j.087, %for.cond22.preheader.lr.ph ], [ %inc32, %for.inc31 ]
  br i1 %cmp2476, label %for.body25.lr.ph, label %for.inc31

for.body25.lr.ph:                                 ; preds = %for.cond22.preheader
  %.pre97 = load i8*** @cimage, align 8, !tbaa !5
  %arrayidx.phi.trans.insert = getelementptr inbounds i8** %.pre97, i64 %indvars.iv94
  %.pre98 = load i8** %arrayidx.phi.trans.insert, align 8, !tbaa !5
  %.pre99 = load %struct.f1_neuron** @f1_layer, align 8, !tbaa !5
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.body25.lr.ph
  %indvars.iv89 = phi i64 [ %indvars.iv, %for.body25.lr.ph ], [ %indvars.iv.next90, %for.body25 ]
  %k.178 = phi i64 [ %k.082, %for.body25.lr.ph ], [ %inc, %for.body25 ]
  %n.077 = phi i32 [ %indvars.iv3, %for.body25.lr.ph ], [ %inc30, %for.body25 ]
  %arrayidx27 = getelementptr inbounds i8* %.pre98, i64 %indvars.iv89
  %16 = load i8* %arrayidx27, align 1, !tbaa !21
  %conv = uitofp i8 %16 to double
  %inc = add nsw i64 %k.178, 1
  %I = getelementptr inbounds %struct.f1_neuron* %.pre99, i64 %k.178, i32 0
  %17 = load double** %I, align 8, !tbaa !15
  store double %conv, double* %17, align 8, !tbaa !10
  %inc30 = add nsw i32 %n.077, 1
  %cmp24 = icmp slt i32 %inc30, %add23
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  br i1 %cmp24, label %for.body25, label %for.inc31.loopexit

for.inc31.loopexit:                               ; preds = %for.body25
  %18 = add i64 %15, %k.082
  br label %for.inc31

for.inc31:                                        ; preds = %for.inc31.loopexit, %for.cond22.preheader
  %k.1.lcssa = phi i64 [ %k.082, %for.cond22.preheader ], [ %18, %for.inc31.loopexit ]
  %inc32 = add nsw i32 %m.081, 1
  %cmp20 = icmp slt i32 %inc32, %add19
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, 1
  br i1 %cmp20, label %for.cond22.preheader, label %for.end33

for.end33:                                        ; preds = %for.inc31, %for.cond18.preheader
  store i32 0, i32* @pass_flag, align 4, !tbaa !1
  tail call void @match()
  %19 = load i32* @pass_flag, align 4, !tbaa !1
  %cmp34 = icmp eq i32 %19, 1
  br i1 %cmp34, label %if.then36, label %for.inc46

if.then36:                                        ; preds = %for.end33
  %20 = load i32* getelementptr inbounds ([2 x i32]* @set_high, i64 0, i64 0), align 4, !tbaa !1
  %cmp37 = icmp eq i32 %20, 1
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.then36
  store i32 %indvars.iv3, i32* getelementptr inbounds ([2 x i32]* @highx, i64 0, i64 0), align 4, !tbaa !1
  store i32 %j.087, i32* getelementptr inbounds ([2 x i32]* @highy, i64 0, i64 0), align 4, !tbaa !1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @set_high, i64 0, i64 0), align 4, !tbaa !1
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.then36
  %21 = load i32* getelementptr inbounds ([2 x i32]* @set_high, i64 0, i64 1), align 4, !tbaa !1
  %cmp41 = icmp eq i32 %21, 1
  br i1 %cmp41, label %if.then43, label %for.inc46

if.then43:                                        ; preds = %if.end40
  store i32 %indvars.iv3, i32* getelementptr inbounds ([2 x i32]* @highx, i64 0, i64 1), align 4, !tbaa !1
  store i32 %j.087, i32* getelementptr inbounds ([2 x i32]* @highy, i64 0, i64 1), align 4, !tbaa !1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @set_high, i64 0, i64 1), align 4, !tbaa !1
  br label %for.inc46

for.inc46:                                        ; preds = %if.then43, %if.end40, %for.end33
  %indvars.iv.next4 = add nsw i32 %indvars.iv3, %stride
  %cmp16 = icmp slt i32 %indvars.iv.next4, %endx
  %indvars.iv.next = add nsw i64 %indvars.iv, %6
  %indvars.iv.next2 = add i32 %indvars.iv1, %stride
  %indvars.iv.next6 = sub i32 %indvars.iv5, %stride
  br i1 %cmp16, label %for.cond18.preheader, label %for.inc49

for.inc49:                                        ; preds = %for.inc46, %for.cond15.preheader
  %add50 = add nsw i32 %j.087, %stride
  %cmp14 = icmp slt i32 %add50, %endy
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, %6
  br i1 %cmp14, label %for.cond15.preheader, label %for.end51

for.end51:                                        ; preds = %for.inc49, %for.cond.preheader
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  %cmp = icmp slt i32 %argc, 2
  br i1 %cmp, label %Usage, label %if.end

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %argc, 2
  br i1 %cmp1, label %if.then2, label %while.cond.preheader

if.then2:                                         ; preds = %if.end
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %0 = load i8** %arrayidx, align 8, !tbaa !5
  %call = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([3 x i8]* @.str28, i64 0, i64 0)) #6
  %cmp3 = icmp eq i32 %call, 0
  br i1 %cmp3, label %Version, label %if.else

if.else:                                          ; preds = %if.then2
  %call6 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([3 x i8]* @.str29, i64 0, i64 0)) #6
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %Usage, label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.else, %if.end
  %sub = add nsw i32 %argc, -1
  %cmp12482 = icmp sgt i32 %sub, 1
  br i1 %cmp12482, label %while.body, label %if.then122

while.body:                                       ; preds = %if.end119, %while.cond.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end119 ], [ 1, %while.cond.preheader ]
  %trainfile2.0493 = phi i8* [ %trainfile2.1, %if.end119 ], [ null, %while.cond.preheader ]
  %trainfile1.0492 = phi i8* [ %trainfile1.1, %if.end119 ], [ null, %while.cond.preheader ]
  %weightfile.0491 = phi i8* [ %weightfile.1, %if.end119 ], [ null, %while.cond.preheader ]
  %scanfile.0490 = phi i8* [ %scanfile.1, %if.end119 ], [ null, %while.cond.preheader ]
  %objects.0488 = phi i32 [ %objects.1, %if.end119 ], [ 0, %while.cond.preheader ]
  %stride.0487 = phi i32 [ %stride.1, %if.end119 ], [ 0, %while.cond.preheader ]
  %endy.0486 = phi i32 [ %endy.1, %if.end119 ], [ 0, %while.cond.preheader ]
  %endx.0485 = phi i32 [ %endx.1, %if.end119 ], [ 0, %while.cond.preheader ]
  %starty.0484 = phi i32 [ %starty.1, %if.end119 ], [ 0, %while.cond.preheader ]
  %startx.0483 = phi i32 [ %startx.1, %if.end119 ], [ 0, %while.cond.preheader ]
  %arrayidx13 = getelementptr inbounds i8** %argv, i64 %indvars.iv
  %1 = load i8** %arrayidx13, align 8, !tbaa !5
  %call14 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([10 x i8]* @.str30, i64 0, i64 0)) #6
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %if.then16, label %if.else19

if.then16:                                        ; preds = %while.body
  %2 = add nsw i64 %indvars.iv, 1
  %arrayidx18 = getelementptr inbounds i8** %argv, i64 %2
  %3 = load i8** %arrayidx18, align 8, !tbaa !5
  br label %if.end119

if.else19:                                        ; preds = %while.body
  %call22 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([12 x i8]* @.str31, i64 0, i64 0)) #6
  %cmp23 = icmp eq i32 %call22, 0
  br i1 %cmp23, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.else19
  %4 = add nsw i64 %indvars.iv, 1
  %arrayidx27 = getelementptr inbounds i8** %argv, i64 %4
  %5 = load i8** %arrayidx27, align 8, !tbaa !5
  br label %if.end119

if.else28:                                        ; preds = %if.else19
  %call31 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([12 x i8]* @.str32, i64 0, i64 0)) #6
  %cmp32 = icmp eq i32 %call31, 0
  br i1 %cmp32, label %if.then33, label %if.else37

if.then33:                                        ; preds = %if.else28
  %6 = add nsw i64 %indvars.iv, 1
  %arrayidx36 = getelementptr inbounds i8** %argv, i64 %6
  %7 = load i8** %arrayidx36, align 8, !tbaa !5
  br label %if.end119

if.else37:                                        ; preds = %if.else28
  %call40 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([12 x i8]* @.str33, i64 0, i64 0)) #6
  %cmp41 = icmp eq i32 %call40, 0
  br i1 %cmp41, label %if.then42, label %if.else46

if.then42:                                        ; preds = %if.else37
  %8 = add nsw i64 %indvars.iv, 1
  %arrayidx45 = getelementptr inbounds i8** %argv, i64 %8
  %9 = load i8** %arrayidx45, align 8, !tbaa !5
  br label %if.end119

if.else46:                                        ; preds = %if.else37
  %call49 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([8 x i8]* @.str34, i64 0, i64 0)) #6
  %cmp50 = icmp eq i32 %call49, 0
  br i1 %cmp50, label %if.then51, label %if.else56

if.then51:                                        ; preds = %if.else46
  %10 = add nsw i64 %indvars.iv, 1
  %arrayidx54 = getelementptr inbounds i8** %argv, i64 %10
  %11 = load i8** %arrayidx54, align 8, !tbaa !5
  %call.i = tail call i64 @strtol(i8* nocapture %11, i8** null, i32 10) #6
  %conv.i = trunc i64 %call.i to i32
  br label %if.end119

if.else56:                                        ; preds = %if.else46
  %call59 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([8 x i8]* @.str35, i64 0, i64 0)) #6
  %cmp60 = icmp eq i32 %call59, 0
  br i1 %cmp60, label %if.then61, label %if.else66

if.then61:                                        ; preds = %if.else56
  %12 = add nsw i64 %indvars.iv, 1
  %arrayidx64 = getelementptr inbounds i8** %argv, i64 %12
  %13 = load i8** %arrayidx64, align 8, !tbaa !5
  %call.i243 = tail call i64 @strtol(i8* nocapture %13, i8** null, i32 10) #6
  %conv.i244 = trunc i64 %call.i243 to i32
  br label %if.end119

if.else66:                                        ; preds = %if.else56
  %call69 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([6 x i8]* @.str36, i64 0, i64 0)) #6
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %if.then71, label %if.else76

if.then71:                                        ; preds = %if.else66
  %14 = add nsw i64 %indvars.iv, 1
  %arrayidx74 = getelementptr inbounds i8** %argv, i64 %14
  %15 = load i8** %arrayidx74, align 8, !tbaa !5
  %call.i245 = tail call i64 @strtol(i8* nocapture %15, i8** null, i32 10) #6
  %conv.i246 = trunc i64 %call.i245 to i32
  br label %if.end119

if.else76:                                        ; preds = %if.else66
  %call79 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([6 x i8]* @.str37, i64 0, i64 0)) #6
  %cmp80 = icmp eq i32 %call79, 0
  br i1 %cmp80, label %if.then81, label %if.else86

if.then81:                                        ; preds = %if.else76
  %16 = add nsw i64 %indvars.iv, 1
  %arrayidx84 = getelementptr inbounds i8** %argv, i64 %16
  %17 = load i8** %arrayidx84, align 8, !tbaa !5
  %call.i247 = tail call i64 @strtol(i8* nocapture %17, i8** null, i32 10) #6
  %conv.i248 = trunc i64 %call.i247 to i32
  br label %if.end119

if.else86:                                        ; preds = %if.else76
  %call89 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([8 x i8]* @.str38, i64 0, i64 0)) #6
  %cmp90 = icmp eq i32 %call89, 0
  br i1 %cmp90, label %if.then91, label %if.else96

if.then91:                                        ; preds = %if.else86
  %18 = add nsw i64 %indvars.iv, 1
  %arrayidx94 = getelementptr inbounds i8** %argv, i64 %18
  %19 = load i8** %arrayidx94, align 8, !tbaa !5
  %call.i249 = tail call i64 @strtol(i8* nocapture %19, i8** null, i32 10) #6
  %conv.i250 = trunc i64 %call.i249 to i32
  br label %if.end119

if.else96:                                        ; preds = %if.else86
  %call99 = tail call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([9 x i8]* @.str39, i64 0, i64 0)) #6
  %cmp100 = icmp eq i32 %call99, 0
  br i1 %cmp100, label %if.then101, label %if.else106

if.then101:                                       ; preds = %if.else96
  %20 = add nsw i64 %indvars.iv, 1
  %arrayidx104 = getelementptr inbounds i8** %argv, i64 %20
  %21 = load i8** %arrayidx104, align 8, !tbaa !5
  %call.i251 = tail call i64 @strtol(i8* nocapture %21, i8** null, i32 10) #6
  %conv.i252 = trunc i64 %call.i251 to i32
  br label %if.end119

if.else106:                                       ; preds = %if.else96
  %22 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %call109 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([29 x i8]* @.str40, i64 0, i64 0), i8* %1) #11
  br label %Usage

if.end119:                                        ; preds = %if.then101, %if.then91, %if.then81, %if.then71, %if.then61, %if.then51, %if.then42, %if.then33, %if.then24, %if.then16
  %startx.1 = phi i32 [ %startx.0483, %if.then16 ], [ %startx.0483, %if.then24 ], [ %startx.0483, %if.then33 ], [ %startx.0483, %if.then42 ], [ %conv.i, %if.then51 ], [ %startx.0483, %if.then61 ], [ %startx.0483, %if.then71 ], [ %startx.0483, %if.then81 ], [ %startx.0483, %if.then91 ], [ %startx.0483, %if.then101 ]
  %starty.1 = phi i32 [ %starty.0484, %if.then16 ], [ %starty.0484, %if.then24 ], [ %starty.0484, %if.then33 ], [ %starty.0484, %if.then42 ], [ %starty.0484, %if.then51 ], [ %conv.i244, %if.then61 ], [ %starty.0484, %if.then71 ], [ %starty.0484, %if.then81 ], [ %starty.0484, %if.then91 ], [ %starty.0484, %if.then101 ]
  %endx.1 = phi i32 [ %endx.0485, %if.then16 ], [ %endx.0485, %if.then24 ], [ %endx.0485, %if.then33 ], [ %endx.0485, %if.then42 ], [ %endx.0485, %if.then51 ], [ %endx.0485, %if.then61 ], [ %conv.i246, %if.then71 ], [ %endx.0485, %if.then81 ], [ %endx.0485, %if.then91 ], [ %endx.0485, %if.then101 ]
  %endy.1 = phi i32 [ %endy.0486, %if.then16 ], [ %endy.0486, %if.then24 ], [ %endy.0486, %if.then33 ], [ %endy.0486, %if.then42 ], [ %endy.0486, %if.then51 ], [ %endy.0486, %if.then61 ], [ %endy.0486, %if.then71 ], [ %conv.i248, %if.then81 ], [ %endy.0486, %if.then91 ], [ %endy.0486, %if.then101 ]
  %stride.1 = phi i32 [ %stride.0487, %if.then16 ], [ %stride.0487, %if.then24 ], [ %stride.0487, %if.then33 ], [ %stride.0487, %if.then42 ], [ %stride.0487, %if.then51 ], [ %stride.0487, %if.then61 ], [ %stride.0487, %if.then71 ], [ %stride.0487, %if.then81 ], [ %conv.i250, %if.then91 ], [ %stride.0487, %if.then101 ]
  %objects.1 = phi i32 [ %objects.0488, %if.then16 ], [ %objects.0488, %if.then24 ], [ %objects.0488, %if.then33 ], [ %objects.0488, %if.then42 ], [ %objects.0488, %if.then51 ], [ %objects.0488, %if.then61 ], [ %objects.0488, %if.then71 ], [ %objects.0488, %if.then81 ], [ %objects.0488, %if.then91 ], [ %conv.i252, %if.then101 ]
  %scanfile.1 = phi i8* [ %3, %if.then16 ], [ %scanfile.0490, %if.then24 ], [ %scanfile.0490, %if.then33 ], [ %scanfile.0490, %if.then42 ], [ %scanfile.0490, %if.then51 ], [ %scanfile.0490, %if.then61 ], [ %scanfile.0490, %if.then71 ], [ %scanfile.0490, %if.then81 ], [ %scanfile.0490, %if.then91 ], [ %scanfile.0490, %if.then101 ]
  %weightfile.1 = phi i8* [ %weightfile.0491, %if.then16 ], [ %5, %if.then24 ], [ %weightfile.0491, %if.then33 ], [ %weightfile.0491, %if.then42 ], [ %weightfile.0491, %if.then51 ], [ %weightfile.0491, %if.then61 ], [ %weightfile.0491, %if.then71 ], [ %weightfile.0491, %if.then81 ], [ %weightfile.0491, %if.then91 ], [ %weightfile.0491, %if.then101 ]
  %trainfile1.1 = phi i8* [ %trainfile1.0492, %if.then16 ], [ %trainfile1.0492, %if.then24 ], [ %7, %if.then33 ], [ %trainfile1.0492, %if.then42 ], [ %trainfile1.0492, %if.then51 ], [ %trainfile1.0492, %if.then61 ], [ %trainfile1.0492, %if.then71 ], [ %trainfile1.0492, %if.then81 ], [ %trainfile1.0492, %if.then91 ], [ %trainfile1.0492, %if.then101 ]
  %trainfile2.1 = phi i8* [ %trainfile2.0493, %if.then16 ], [ %trainfile2.0493, %if.then24 ], [ %trainfile2.0493, %if.then33 ], [ %9, %if.then42 ], [ %trainfile2.0493, %if.then51 ], [ %trainfile2.0493, %if.then61 ], [ %trainfile2.0493, %if.then71 ], [ %trainfile2.0493, %if.then81 ], [ %trainfile2.0493, %if.then91 ], [ %trainfile2.0493, %if.then101 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %23 = trunc i64 %indvars.iv.next to i32
  %cmp12 = icmp slt i32 %23, %sub
  br i1 %cmp12, label %while.body, label %while.end

while.end:                                        ; preds = %if.end119
  %cmp121 = icmp eq i8* %scanfile.1, null
  br i1 %cmp121, label %if.then122, label %if.end124

if.then122:                                       ; preds = %while.end, %while.cond.preheader
  %24 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str41, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %24) #8
  br label %Usage

if.end124:                                        ; preds = %while.end
  %cmp125 = icmp eq i8* %weightfile.1, null
  %cmp126 = icmp eq i8* %trainfile1.1, null
  %or.cond = and i1 %cmp125, %cmp126
  br i1 %or.cond, label %if.then127, label %if.end129

if.then127:                                       ; preds = %if.end124
  %26 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8]* @.str42, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %26) #8
  br label %Usage

if.end129:                                        ; preds = %if.end124
  %cmp130 = icmp ne i8* %weightfile.1, null
  %cmp132 = icmp ne i8* %trainfile1.1, null
  %or.cond183 = and i1 %cmp130, %cmp132
  br i1 %or.cond183, label %if.then133, label %if.end135

if.then133:                                       ; preds = %if.end129
  %28 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8]* @.str43, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %28) #8
  br label %Usage

if.end135:                                        ; preds = %if.end129
  tail call void @loadimage(i8* %scanfile.1)
  br i1 %cmp130, label %if.then137, label %if.else141

if.then137:                                       ; preds = %if.end135
  store i32 1, i32* @numpatterns, align 4, !tbaa !1
  tail call void @load_weights(i8* %weightfile.1)
  store double 2.550000e+02, double* @a, align 8, !tbaa !10
  store double 0.000000e+00, double* @b, align 8, !tbaa !10
  store double 1.100000e-01, double* @c, align 8, !tbaa !10
  store double 9.000000e-01, double* @d, align 8, !tbaa !10
  %30 = load i32* @numf1s, align 4, !tbaa !1
  %conv.i253 = sitofp i32 %30 to double
  %call.i254 = tail call double @sqrt(double %conv.i253) #6
  %storemerge5.i = fdiv double 1.000000e+00, %call.i254
  store double %storemerge5.i, double* @theta, align 8, !tbaa !10
  store double 1.000000e-01, double* @delta_t, align 8, !tbaa !10
  store double 7.000000e-01, double* @rho, align 8, !tbaa !10
  tail call void @init_net()
  br label %if.end167

if.else141:                                       ; preds = %if.end135
  %cmp142 = icmp eq i8* %trainfile2.1, null
  br i1 %cmp142, label %if.else156, label %if.then143

if.then143:                                       ; preds = %if.else141
  store i32 2, i32* @numpatterns, align 4, !tbaa !1
  %cmp144 = icmp slt i32 %objects.1, 2
  %.objects.0 = select i1 %cmp144, i32 2, i32 %objects.1
  tail call void @load_train(i8* %trainfile1.1, i32 1, i32 %.objects.0)
  tail call void @alloc_td_bu()
  %31 = load i32* @numf1s, align 4, !tbaa !1
  %cmp15.i = icmp sgt i32 %31, 0
  br i1 %cmp15.i, label %for.cond1.preheader.lr.ph.i, label %init_bu.exit

for.cond1.preheader.lr.ph.i:                      ; preds = %if.then143
  %32 = load i32* @numf2s, align 4, !tbaa !1
  %cmp213.i = icmp sgt i32 %32, 0
  %33 = load double*** @tds, align 8, !tbaa !5
  %34 = add i32 %32, -1
  %35 = zext i32 %34 to i64
  %36 = shl nuw nsw i64 %35, 3
  %37 = add i64 %36, 8
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc6.i, %for.cond1.preheader.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i ], [ %indvars.iv.next.i, %for.inc6.i ]
  br i1 %cmp213.i, label %for.body3.lr.ph.i, label %for.inc6.i

for.body3.lr.ph.i:                                ; preds = %for.cond1.preheader.i
  %arrayidx.i = getelementptr inbounds double** %33, i64 %indvars.iv.i
  %38 = load double** %arrayidx.i, align 8, !tbaa !5
  %scevgep17.i = bitcast double* %38 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep17.i, i8 0, i64 %37, i32 8, i1 false) #6
  br label %for.inc6.i

for.inc6.i:                                       ; preds = %for.body3.lr.ph.i, %for.cond1.preheader.i
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %lftr.wideiv22 = trunc i64 %indvars.iv.next.i to i32
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %31
  br i1 %exitcond23, label %init_td.exit, label %for.cond1.preheader.i

init_td.exit:                                     ; preds = %for.inc6.i
  %.pr = load i32* @numf1s, align 4, !tbaa !1
  %cmp16.i = icmp sgt i32 %.pr, 0
  br i1 %cmp16.i, label %for.cond1.preheader.lr.ph.i255, label %init_bu.exit

for.cond1.preheader.lr.ph.i255:                   ; preds = %init_td.exit
  %.pre.i = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader.i256

for.cond1.preheader.i256:                         ; preds = %for.inc7.i, %for.cond1.preheader.lr.ph.i255
  %39 = phi i32 [ %.pr, %for.cond1.preheader.lr.ph.i255 ], [ %47, %for.inc7.i ]
  %40 = phi i32 [ %.pre.i, %for.cond1.preheader.lr.ph.i255 ], [ %48, %for.inc7.i ]
  %indvars.iv18.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i255 ], [ %indvars.iv.next19.i, %for.inc7.i ]
  %cmp214.i = icmp sgt i32 %40, 0
  br i1 %cmp214.i, label %for.body3.i, label %for.inc7.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i256
  %41 = phi i32 [ %.pre21.i, %for.body3.i ], [ %39, %for.cond1.preheader.i256 ]
  %indvars.iv.i257 = phi i64 [ %indvars.iv.next.i261, %for.body3.i ], [ 0, %for.cond1.preheader.i256 ]
  %42 = load double* @d, align 8, !tbaa !10
  %sub.i = fsub double 1.000000e+00, %42
  %div.i = fdiv double 1.000000e+00, %sub.i
  %conv.i258 = sitofp i32 %41 to double
  %call.i259 = tail call double @sqrt(double %conv.i258) #6
  %div4.i = fdiv double %div.i, %call.i259
  %43 = load double*** @bus, align 8, !tbaa !5
  %arrayidx.i260 = getelementptr inbounds double** %43, i64 %indvars.iv18.i
  %44 = load double** %arrayidx.i260, align 8, !tbaa !5
  %arrayidx6.i = getelementptr inbounds double* %44, i64 %indvars.iv.i257
  store double %div4.i, double* %arrayidx6.i, align 8, !tbaa !10
  %indvars.iv.next.i261 = add nsw i64 %indvars.iv.i257, 1
  %45 = load i32* @numf2s, align 4, !tbaa !1
  %46 = trunc i64 %indvars.iv.next.i261 to i32
  %cmp2.i = icmp slt i32 %46, %45
  %.pre21.i = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2.i, label %for.body3.i, label %for.inc7.i

for.inc7.i:                                       ; preds = %for.body3.i, %for.cond1.preheader.i256
  %47 = phi i32 [ %39, %for.cond1.preheader.i256 ], [ %.pre21.i, %for.body3.i ]
  %48 = phi i32 [ %40, %for.cond1.preheader.i256 ], [ %45, %for.body3.i ]
  %indvars.iv.next19.i = add nuw nsw i64 %indvars.iv18.i, 1
  %49 = trunc i64 %indvars.iv.next19.i to i32
  %cmp.i262 = icmp slt i32 %49, %47
  br i1 %cmp.i262, label %for.cond1.preheader.i256, label %init_bu.exit

init_bu.exit:                                     ; preds = %for.inc7.i, %init_td.exit, %if.then143
  store i32 0, i32* @resonant, align 4, !tbaa !1
  br label %while.body148

while.body148:                                    ; preds = %while.body148, %init_bu.exit
  tail call void @train_match(i32 0)
  %.pr448 = load i32* @resonant, align 4, !tbaa !1
  %phitmp = icmp eq i32 %.pr448, 0
  br i1 %phitmp, label %while.body148, label %while.end149

while.end149:                                     ; preds = %while.body148
  tail call void @load_train(i8* %trainfile2.1, i32 2, i32 %.objects.0)
  store double 2.550000e+02, double* @a, align 8, !tbaa !10
  store double 1.000000e+01, double* @b, align 8, !tbaa !10
  store double 1.100000e-01, double* @c, align 8, !tbaa !10
  store double 9.000000e-01, double* @d, align 8, !tbaa !10
  %50 = load i32* @numf1s, align 4, !tbaa !1
  %conv1.i = sitofp i32 %50 to double
  %call2.i = tail call double @sqrt(double %conv1.i) #6
  %storemerge5.i263 = fdiv double 1.000000e+00, %call2.i
  store double %storemerge5.i263, double* @theta, align 8, !tbaa !10
  store double 7.000000e-01, double* @delta_t, align 8, !tbaa !10
  store double 9.500000e-01, double* @rho, align 8, !tbaa !10
  %51 = load i32* @numf1s, align 4, !tbaa !1
  %cmp15.i264 = icmp sgt i32 %51, 0
  br i1 %cmp15.i264, label %for.cond1.preheader.lr.ph.i266, label %init_bu.exit312

for.cond1.preheader.lr.ph.i266:                   ; preds = %while.end149
  %52 = load i32* @numf2s, align 4, !tbaa !1
  %cmp213.i265 = icmp sgt i32 %52, 1
  %53 = load double*** @tds, align 8, !tbaa !5
  %54 = add i32 %52, -2
  %55 = zext i32 %54 to i64
  %56 = shl nuw nsw i64 %55, 3
  %57 = add i64 %56, 8
  br label %for.cond1.preheader.i268

for.cond1.preheader.i268:                         ; preds = %for.inc6.i274, %for.cond1.preheader.lr.ph.i266
  %indvars.iv.i267 = phi i64 [ 0, %for.cond1.preheader.lr.ph.i266 ], [ %indvars.iv.next.i272, %for.inc6.i274 ]
  br i1 %cmp213.i265, label %for.body3.lr.ph.i271, label %for.inc6.i274

for.body3.lr.ph.i271:                             ; preds = %for.cond1.preheader.i268
  %arrayidx.i269 = getelementptr inbounds double** %53, i64 %indvars.iv.i267
  %58 = load double** %arrayidx.i269, align 8, !tbaa !5
  %scevgep.i = getelementptr double* %58, i64 1
  %scevgep17.i270 = bitcast double* %scevgep.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep17.i270, i8 0, i64 %57, i32 8, i1 false) #6
  br label %for.inc6.i274

for.inc6.i274:                                    ; preds = %for.body3.lr.ph.i271, %for.cond1.preheader.i268
  %indvars.iv.next.i272 = add nuw nsw i64 %indvars.iv.i267, 1
  %lftr.wideiv19 = trunc i64 %indvars.iv.next.i272 to i32
  %exitcond20 = icmp eq i32 %lftr.wideiv19, %51
  br i1 %exitcond20, label %init_td.exit275, label %for.cond1.preheader.i268

init_td.exit275:                                  ; preds = %for.inc6.i274
  %.pr449 = load i32* @numf1s, align 4, !tbaa !1
  %cmp16.i291 = icmp sgt i32 %.pr449, 0
  br i1 %cmp16.i291, label %for.cond1.preheader.lr.ph.i293, label %init_bu.exit312

for.cond1.preheader.lr.ph.i293:                   ; preds = %init_td.exit275
  %.pre.i292 = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader.i296

for.cond1.preheader.i296:                         ; preds = %for.inc7.i311, %for.cond1.preheader.lr.ph.i293
  %59 = phi i32 [ %.pr449, %for.cond1.preheader.lr.ph.i293 ], [ %67, %for.inc7.i311 ]
  %60 = phi i32 [ %.pre.i292, %for.cond1.preheader.lr.ph.i293 ], [ %68, %for.inc7.i311 ]
  %indvars.iv18.i294 = phi i64 [ 0, %for.cond1.preheader.lr.ph.i293 ], [ %indvars.iv.next19.i309, %for.inc7.i311 ]
  %cmp214.i295 = icmp sgt i32 %60, 1
  br i1 %cmp214.i295, label %for.body3.i308, label %for.inc7.i311

for.body3.i308:                                   ; preds = %for.body3.i308, %for.cond1.preheader.i296
  %61 = phi i32 [ %.pre21.i307, %for.body3.i308 ], [ %59, %for.cond1.preheader.i296 ]
  %indvars.iv.i297 = phi i64 [ %indvars.iv.next.i305, %for.body3.i308 ], [ 1, %for.cond1.preheader.i296 ]
  %62 = load double* @d, align 8, !tbaa !10
  %sub.i298 = fsub double 1.000000e+00, %62
  %div.i299 = fdiv double 1.000000e+00, %sub.i298
  %conv.i300 = sitofp i32 %61 to double
  %call.i301 = tail call double @sqrt(double %conv.i300) #6
  %div4.i302 = fdiv double %div.i299, %call.i301
  %63 = load double*** @bus, align 8, !tbaa !5
  %arrayidx.i303 = getelementptr inbounds double** %63, i64 %indvars.iv18.i294
  %64 = load double** %arrayidx.i303, align 8, !tbaa !5
  %arrayidx6.i304 = getelementptr inbounds double* %64, i64 %indvars.iv.i297
  store double %div4.i302, double* %arrayidx6.i304, align 8, !tbaa !10
  %indvars.iv.next.i305 = add nsw i64 %indvars.iv.i297, 1
  %65 = load i32* @numf2s, align 4, !tbaa !1
  %66 = trunc i64 %indvars.iv.next.i305 to i32
  %cmp2.i306 = icmp slt i32 %66, %65
  %.pre21.i307 = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2.i306, label %for.body3.i308, label %for.inc7.i311

for.inc7.i311:                                    ; preds = %for.body3.i308, %for.cond1.preheader.i296
  %67 = phi i32 [ %59, %for.cond1.preheader.i296 ], [ %.pre21.i307, %for.body3.i308 ]
  %68 = phi i32 [ %60, %for.cond1.preheader.i296 ], [ %65, %for.body3.i308 ]
  %indvars.iv.next19.i309 = add nuw nsw i64 %indvars.iv18.i294, 1
  %69 = trunc i64 %indvars.iv.next19.i309 to i32
  %cmp.i310 = icmp slt i32 %69, %67
  br i1 %cmp.i310, label %for.cond1.preheader.i296, label %init_bu.exit312

init_bu.exit312:                                  ; preds = %for.inc7.i311, %init_td.exit275, %while.end149
  store i32 0, i32* @resonant, align 4, !tbaa !1
  br label %while.body153

while.body153:                                    ; preds = %while.body153, %init_bu.exit312
  tail call void @train_match(i32 1)
  %.pr451 = load i32* @resonant, align 4, !tbaa !1
  %phitmp462 = icmp eq i32 %.pr451, 0
  br i1 %phitmp462, label %while.body153, label %while.end155

while.end155:                                     ; preds = %while.body153
  store double 2.550000e+02, double* @a, align 8, !tbaa !10
  store double 0.000000e+00, double* @b, align 8, !tbaa !10
  store double 1.100000e-01, double* @c, align 8, !tbaa !10
  store double 9.000000e-01, double* @d, align 8, !tbaa !10
  %70 = load i32* @numf1s, align 4, !tbaa !1
  %conv.i313 = sitofp i32 %70 to double
  %call.i314 = tail call double @sqrt(double %conv.i313) #6
  %storemerge5.i315 = fdiv double 1.000000e+00, %call.i314
  store double %storemerge5.i315, double* @theta, align 8, !tbaa !10
  store double 1.000000e-01, double* @delta_t, align 8, !tbaa !10
  store double 7.000000e-01, double* @rho, align 8, !tbaa !10
  %71 = load i32* @numf1s, align 4, !tbaa !1
  %cmp15.i316 = icmp sgt i32 %71, 0
  br i1 %cmp15.i316, label %for.cond1.preheader.lr.ph.i318, label %init_bu.exit372

for.cond1.preheader.lr.ph.i318:                   ; preds = %while.end155
  %72 = load i32* @numf2s, align 4, !tbaa !1
  %cmp213.i317 = icmp sgt i32 %72, %.objects.0
  %73 = load double*** @tds, align 8, !tbaa !5
  %74 = sext i32 %.objects.0 to i64
  %75 = xor i32 %.objects.0, -1
  %76 = add i32 %72, %75
  %77 = zext i32 %76 to i64
  %78 = shl nuw nsw i64 %77, 3
  %79 = add i64 %78, 8
  br label %for.cond1.preheader.i320

for.cond1.preheader.i320:                         ; preds = %for.inc6.i327, %for.cond1.preheader.lr.ph.i318
  %indvars.iv.i319 = phi i64 [ 0, %for.cond1.preheader.lr.ph.i318 ], [ %indvars.iv.next.i325, %for.inc6.i327 ]
  br i1 %cmp213.i317, label %for.body3.lr.ph.i324, label %for.inc6.i327

for.body3.lr.ph.i324:                             ; preds = %for.cond1.preheader.i320
  %arrayidx.i321 = getelementptr inbounds double** %73, i64 %indvars.iv.i319
  %80 = load double** %arrayidx.i321, align 8, !tbaa !5
  %scevgep.i322 = getelementptr double* %80, i64 %74
  %scevgep17.i323 = bitcast double* %scevgep.i322 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep17.i323, i8 0, i64 %79, i32 8, i1 false) #6
  br label %for.inc6.i327

for.inc6.i327:                                    ; preds = %for.body3.lr.ph.i324, %for.cond1.preheader.i320
  %indvars.iv.next.i325 = add nuw nsw i64 %indvars.iv.i319, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i325 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %71
  br i1 %exitcond, label %init_td.exit328, label %for.cond1.preheader.i320

init_td.exit328:                                  ; preds = %for.inc6.i327
  %.pr452 = load i32* @numf1s, align 4, !tbaa !1
  %cmp16.i351 = icmp sgt i32 %.pr452, 0
  br i1 %cmp16.i351, label %for.cond1.preheader.lr.ph.i353, label %init_bu.exit372

for.cond1.preheader.lr.ph.i353:                   ; preds = %init_td.exit328
  %.pre.i352 = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader.i356

for.cond1.preheader.i356:                         ; preds = %for.inc7.i371, %for.cond1.preheader.lr.ph.i353
  %81 = phi i32 [ %.pr452, %for.cond1.preheader.lr.ph.i353 ], [ %89, %for.inc7.i371 ]
  %82 = phi i32 [ %.pre.i352, %for.cond1.preheader.lr.ph.i353 ], [ %90, %for.inc7.i371 ]
  %indvars.iv18.i354 = phi i64 [ 0, %for.cond1.preheader.lr.ph.i353 ], [ %indvars.iv.next19.i369, %for.inc7.i371 ]
  %cmp214.i355 = icmp sgt i32 %82, %.objects.0
  br i1 %cmp214.i355, label %for.body3.i368, label %for.inc7.i371

for.body3.i368:                                   ; preds = %for.body3.i368, %for.cond1.preheader.i356
  %83 = phi i32 [ %.pre21.i367, %for.body3.i368 ], [ %81, %for.cond1.preheader.i356 ]
  %indvars.iv.i357 = phi i64 [ %indvars.iv.next.i365, %for.body3.i368 ], [ %74, %for.cond1.preheader.i356 ]
  %84 = load double* @d, align 8, !tbaa !10
  %sub.i358 = fsub double 1.000000e+00, %84
  %div.i359 = fdiv double 1.000000e+00, %sub.i358
  %conv.i360 = sitofp i32 %83 to double
  %call.i361 = tail call double @sqrt(double %conv.i360) #6
  %div4.i362 = fdiv double %div.i359, %call.i361
  %85 = load double*** @bus, align 8, !tbaa !5
  %arrayidx.i363 = getelementptr inbounds double** %85, i64 %indvars.iv18.i354
  %86 = load double** %arrayidx.i363, align 8, !tbaa !5
  %arrayidx6.i364 = getelementptr inbounds double* %86, i64 %indvars.iv.i357
  store double %div4.i362, double* %arrayidx6.i364, align 8, !tbaa !10
  %indvars.iv.next.i365 = add nsw i64 %indvars.iv.i357, 1
  %87 = load i32* @numf2s, align 4, !tbaa !1
  %88 = trunc i64 %indvars.iv.next.i365 to i32
  %cmp2.i366 = icmp slt i32 %88, %87
  %.pre21.i367 = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2.i366, label %for.body3.i368, label %for.inc7.i371

for.inc7.i371:                                    ; preds = %for.body3.i368, %for.cond1.preheader.i356
  %89 = phi i32 [ %81, %for.cond1.preheader.i356 ], [ %.pre21.i367, %for.body3.i368 ]
  %90 = phi i32 [ %82, %for.cond1.preheader.i356 ], [ %87, %for.body3.i368 ]
  %indvars.iv.next19.i369 = add nuw nsw i64 %indvars.iv18.i354, 1
  %91 = trunc i64 %indvars.iv.next19.i369 to i32
  %cmp.i370 = icmp slt i32 %91, %89
  br i1 %cmp.i370, label %for.cond1.preheader.i356, label %init_bu.exit372

init_bu.exit372:                                  ; preds = %for.inc7.i371, %init_td.exit328, %while.end155
  %92 = load i32* @numpatterns, align 4, !tbaa !1
  tail call void @sim_other_objects(i32 %92, i32 %.objects.0, i32 undef)
  %93 = load i32* @numf1s, align 4, !tbaa !1
  %cmp22.i373 = icmp sgt i32 %93, 0
  br i1 %cmp22.i373, label %for.cond1.preheader.lr.ph.i375, label %if.end167

for.cond1.preheader.lr.ph.i375:                   ; preds = %init_bu.exit372
  %94 = sext i32 %.objects.0 to i64
  %.pre.i374 = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader.i378

for.cond1.preheader.i378:                         ; preds = %for.inc11.i395, %for.cond1.preheader.lr.ph.i375
  %95 = phi i32 [ %93, %for.cond1.preheader.lr.ph.i375 ], [ %105, %for.inc11.i395 ]
  %96 = phi i32 [ %.pre.i374, %for.cond1.preheader.lr.ph.i375 ], [ %106, %for.inc11.i395 ]
  %indvars.iv24.i376 = phi i64 [ 0, %for.cond1.preheader.lr.ph.i375 ], [ %indvars.iv.next25.i393, %for.inc11.i395 ]
  %cmp220.i377 = icmp sgt i32 %96, %.objects.0
  br i1 %cmp220.i377, label %for.body3.i392, label %for.inc11.i395

for.body3.i392:                                   ; preds = %for.body3.i392, %for.cond1.preheader.i378
  %97 = phi i32 [ %.pre27.i391, %for.body3.i392 ], [ %95, %for.cond1.preheader.i378 ]
  %indvars.iv.i379 = phi i64 [ %indvars.iv.next.i389, %for.body3.i392 ], [ %94, %for.cond1.preheader.i378 ]
  %conv.i380 = sitofp i32 %97 to double
  %call.i381 = tail call double @sqrt(double %conv.i380) #6
  %div.i382 = fdiv double 1.000000e+00, %call.i381
  %98 = load double* @d, align 8, !tbaa !10
  %sub.i383 = fsub double 1.000000e+00, %98
  %div4.i384 = fdiv double %div.i382, %sub.i383
  %99 = load double*** @bus, align 8, !tbaa !5
  %arrayidx.i385 = getelementptr inbounds double** %99, i64 %indvars.iv24.i376
  %100 = load double** %arrayidx.i385, align 8, !tbaa !5
  %arrayidx6.i386 = getelementptr inbounds double* %100, i64 %indvars.iv.i379
  store double %div4.i384, double* %arrayidx6.i386, align 8, !tbaa !10
  %101 = load double*** @tds, align 8, !tbaa !5
  %arrayidx9.i387 = getelementptr inbounds double** %101, i64 %indvars.iv24.i376
  %102 = load double** %arrayidx9.i387, align 8, !tbaa !5
  %arrayidx10.i388 = getelementptr inbounds double* %102, i64 %indvars.iv.i379
  store double %div4.i384, double* %arrayidx10.i388, align 8, !tbaa !10
  %indvars.iv.next.i389 = add nsw i64 %indvars.iv.i379, 1
  %103 = load i32* @numf2s, align 4, !tbaa !1
  %104 = trunc i64 %indvars.iv.next.i389 to i32
  %cmp2.i390 = icmp slt i32 %104, %103
  %.pre27.i391 = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2.i390, label %for.body3.i392, label %for.inc11.i395

for.inc11.i395:                                   ; preds = %for.body3.i392, %for.cond1.preheader.i378
  %105 = phi i32 [ %95, %for.cond1.preheader.i378 ], [ %.pre27.i391, %for.body3.i392 ]
  %106 = phi i32 [ %96, %for.cond1.preheader.i378 ], [ %103, %for.body3.i392 ]
  %indvars.iv.next25.i393 = add nuw nsw i64 %indvars.iv24.i376, 1
  %107 = trunc i64 %indvars.iv.next25.i393 to i32
  %cmp.i394 = icmp slt i32 %107, %105
  br i1 %cmp.i394, label %for.cond1.preheader.i378, label %if.end167

if.else156:                                       ; preds = %if.else141
  store i32 1, i32* @numpatterns, align 4, !tbaa !1
  %cmp157 = icmp slt i32 %objects.1, 1
  %.objects.0242 = select i1 %cmp157, i32 1, i32 %objects.1
  tail call void @load_train(i8* %trainfile1.1, i32 1, i32 %.objects.0242)
  tail call void @alloc_td_bu()
  %108 = load i32* @numf1s, align 4, !tbaa !1
  %cmp15.i397 = icmp sgt i32 %108, 0
  br i1 %cmp15.i397, label %for.cond1.preheader.lr.ph.i399, label %init_bu.exit446

for.cond1.preheader.lr.ph.i399:                   ; preds = %if.else156
  %109 = load i32* @numf2s, align 4, !tbaa !1
  %cmp213.i398 = icmp sgt i32 %109, 0
  %110 = load double*** @tds, align 8, !tbaa !5
  %111 = add i32 %109, -1
  %112 = zext i32 %111 to i64
  %113 = shl nuw nsw i64 %112, 3
  %114 = add i64 %113, 8
  br i1 %cmp213.i398, label %for.inc6.i407.us, label %for.cond1.preheader.lr.ph.i427

for.inc6.i407.us:                                 ; preds = %for.inc6.i407.us, %for.cond1.preheader.lr.ph.i399
  %indvars.iv.i400.us = phi i64 [ %indvars.iv.next.i405.us, %for.inc6.i407.us ], [ 0, %for.cond1.preheader.lr.ph.i399 ]
  %arrayidx.i402.us = getelementptr inbounds double** %110, i64 %indvars.iv.i400.us
  %115 = load double** %arrayidx.i402.us, align 8, !tbaa !5
  %scevgep17.i403.us = bitcast double* %115 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep17.i403.us, i8 0, i64 %114, i32 8, i1 false) #6
  %indvars.iv.next.i405.us = add nuw nsw i64 %indvars.iv.i400.us, 1
  %lftr.wideiv26 = trunc i64 %indvars.iv.next.i405.us to i32
  %exitcond27 = icmp eq i32 %lftr.wideiv26, %108
  br i1 %exitcond27, label %init_td.exit408, label %for.inc6.i407.us

init_td.exit408:                                  ; preds = %for.inc6.i407.us
  %.pr454.pre = load i32* @numf1s, align 4, !tbaa !1
  %cmp16.i425 = icmp sgt i32 %.pr454.pre, 0
  br i1 %cmp16.i425, label %for.cond1.preheader.lr.ph.i427, label %init_bu.exit446

for.cond1.preheader.lr.ph.i427:                   ; preds = %init_td.exit408, %for.cond1.preheader.lr.ph.i399
  %.pr45431 = phi i32 [ %.pr454.pre, %init_td.exit408 ], [ %108, %for.cond1.preheader.lr.ph.i399 ]
  %.pre.i426 = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader.i430

for.cond1.preheader.i430:                         ; preds = %for.inc7.i445, %for.cond1.preheader.lr.ph.i427
  %116 = phi i32 [ %.pr45431, %for.cond1.preheader.lr.ph.i427 ], [ %124, %for.inc7.i445 ]
  %117 = phi i32 [ %.pre.i426, %for.cond1.preheader.lr.ph.i427 ], [ %125, %for.inc7.i445 ]
  %indvars.iv18.i428 = phi i64 [ 0, %for.cond1.preheader.lr.ph.i427 ], [ %indvars.iv.next19.i443, %for.inc7.i445 ]
  %cmp214.i429 = icmp sgt i32 %117, 0
  br i1 %cmp214.i429, label %for.body3.i442, label %for.inc7.i445

for.body3.i442:                                   ; preds = %for.body3.i442, %for.cond1.preheader.i430
  %118 = phi i32 [ %.pre21.i441, %for.body3.i442 ], [ %116, %for.cond1.preheader.i430 ]
  %indvars.iv.i431 = phi i64 [ %indvars.iv.next.i439, %for.body3.i442 ], [ 0, %for.cond1.preheader.i430 ]
  %119 = load double* @d, align 8, !tbaa !10
  %sub.i432 = fsub double 1.000000e+00, %119
  %div.i433 = fdiv double 1.000000e+00, %sub.i432
  %conv.i434 = sitofp i32 %118 to double
  %call.i435 = tail call double @sqrt(double %conv.i434) #6
  %div4.i436 = fdiv double %div.i433, %call.i435
  %120 = load double*** @bus, align 8, !tbaa !5
  %arrayidx.i437 = getelementptr inbounds double** %120, i64 %indvars.iv18.i428
  %121 = load double** %arrayidx.i437, align 8, !tbaa !5
  %arrayidx6.i438 = getelementptr inbounds double* %121, i64 %indvars.iv.i431
  store double %div4.i436, double* %arrayidx6.i438, align 8, !tbaa !10
  %indvars.iv.next.i439 = add nsw i64 %indvars.iv.i431, 1
  %122 = load i32* @numf2s, align 4, !tbaa !1
  %123 = trunc i64 %indvars.iv.next.i439 to i32
  %cmp2.i440 = icmp slt i32 %123, %122
  %.pre21.i441 = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2.i440, label %for.body3.i442, label %for.inc7.i445

for.inc7.i445:                                    ; preds = %for.body3.i442, %for.cond1.preheader.i430
  %124 = phi i32 [ %116, %for.cond1.preheader.i430 ], [ %.pre21.i441, %for.body3.i442 ]
  %125 = phi i32 [ %117, %for.cond1.preheader.i430 ], [ %122, %for.body3.i442 ]
  %indvars.iv.next19.i443 = add nuw nsw i64 %indvars.iv18.i428, 1
  %126 = trunc i64 %indvars.iv.next19.i443 to i32
  %cmp.i444 = icmp slt i32 %126, %124
  br i1 %cmp.i444, label %for.cond1.preheader.i430, label %init_bu.exit446

init_bu.exit446:                                  ; preds = %for.inc7.i445, %init_td.exit408, %if.else156
  store i32 0, i32* @resonant, align 4, !tbaa !1
  br label %while.body163

while.body163:                                    ; preds = %while.body163, %init_bu.exit446
  tail call void @train_match(i32 0)
  %.pr456 = load i32* @resonant, align 4, !tbaa !1
  %phitmp463 = icmp eq i32 %.pr456, 0
  br i1 %phitmp463, label %while.body163, label %while.end165

while.end165:                                     ; preds = %while.body163
  store double 2.550000e+02, double* @a, align 8, !tbaa !10
  store double 0.000000e+00, double* @b, align 8, !tbaa !10
  store double 1.100000e-01, double* @c, align 8, !tbaa !10
  store double 9.000000e-01, double* @d, align 8, !tbaa !10
  %127 = load i32* @numf1s, align 4, !tbaa !1
  %conv.i422 = sitofp i32 %127 to double
  %call.i423 = tail call double @sqrt(double %conv.i422) #6
  %storemerge5.i424 = fdiv double 1.000000e+00, %call.i423
  store double %storemerge5.i424, double* @theta, align 8, !tbaa !10
  store double 1.000000e-01, double* @delta_t, align 8, !tbaa !10
  store double 7.000000e-01, double* @rho, align 8, !tbaa !10
  %128 = load i32* @numf1s, align 4, !tbaa !1
  %cmp15.i409 = icmp sgt i32 %128, 0
  br i1 %cmp15.i409, label %for.cond1.preheader.lr.ph.i411, label %if.end167

for.cond1.preheader.lr.ph.i411:                   ; preds = %while.end165
  %129 = load i32* @numf2s, align 4, !tbaa !1
  %cmp213.i410 = icmp sgt i32 %129, 1
  %130 = load double*** @tds, align 8, !tbaa !5
  %131 = add i32 %129, -2
  %132 = zext i32 %131 to i64
  %133 = shl nuw nsw i64 %132, 3
  %134 = add i64 %133, 8
  br i1 %cmp213.i410, label %for.inc6.i420.us, label %for.cond1.preheader.i334

for.inc6.i420.us:                                 ; preds = %for.inc6.i420.us, %for.cond1.preheader.lr.ph.i411
  %indvars.iv.i412.us = phi i64 [ %indvars.iv.next.i418.us, %for.inc6.i420.us ], [ 0, %for.cond1.preheader.lr.ph.i411 ]
  %arrayidx.i414.us = getelementptr inbounds double** %130, i64 %indvars.iv.i412.us
  %135 = load double** %arrayidx.i414.us, align 8, !tbaa !5
  %scevgep.i415.us = getelementptr double* %135, i64 1
  %scevgep17.i416.us = bitcast double* %scevgep.i415.us to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %scevgep17.i416.us, i8 0, i64 %134, i32 8, i1 false) #6
  %indvars.iv.next.i418.us = add nuw nsw i64 %indvars.iv.i412.us, 1
  %lftr.wideiv11 = trunc i64 %indvars.iv.next.i418.us to i32
  %exitcond12 = icmp eq i32 %lftr.wideiv11, %128
  br i1 %exitcond12, label %init_td.exit421, label %for.inc6.i420.us

init_td.exit421:                                  ; preds = %for.inc6.i420.us
  %.pr457.pre = load i32* @numf1s, align 4, !tbaa !1
  %cmp16.i329 = icmp sgt i32 %.pr457.pre, 0
  br i1 %cmp16.i329, label %init_td.exit421.for.cond1.preheader.lr.ph.i331_crit_edge, label %if.end167

init_td.exit421.for.cond1.preheader.lr.ph.i331_crit_edge: ; preds = %init_td.exit421
  %.pre.i330.pre = load i32* @numf2s, align 4, !tbaa !1
  br label %for.cond1.preheader.i334

for.cond1.preheader.i334:                         ; preds = %for.inc7.i349, %init_td.exit421.for.cond1.preheader.lr.ph.i331_crit_edge, %for.cond1.preheader.lr.ph.i411
  %136 = phi i32 [ %.pr459.pr, %for.inc7.i349 ], [ %128, %for.cond1.preheader.lr.ph.i411 ], [ %.pr457.pre, %init_td.exit421.for.cond1.preheader.lr.ph.i331_crit_edge ]
  %137 = phi i32 [ %.pre.i276, %for.inc7.i349 ], [ %129, %for.cond1.preheader.lr.ph.i411 ], [ %.pre.i330.pre, %init_td.exit421.for.cond1.preheader.lr.ph.i331_crit_edge ]
  %indvars.iv18.i332 = phi i64 [ %indvars.iv.next19.i347, %for.inc7.i349 ], [ 0, %init_td.exit421.for.cond1.preheader.lr.ph.i331_crit_edge ], [ 0, %for.cond1.preheader.lr.ph.i411 ]
  %cmp214.i333 = icmp sgt i32 %137, 1
  br i1 %cmp214.i333, label %for.body3.i346, label %for.inc7.i349

for.body3.i346:                                   ; preds = %for.body3.i346, %for.cond1.preheader.i334
  %138 = phi i32 [ %.pre21.i345, %for.body3.i346 ], [ %136, %for.cond1.preheader.i334 ]
  %indvars.iv.i335 = phi i64 [ %indvars.iv.next.i343, %for.body3.i346 ], [ 1, %for.cond1.preheader.i334 ]
  %139 = load double* @d, align 8, !tbaa !10
  %sub.i336 = fsub double 1.000000e+00, %139
  %div.i337 = fdiv double 1.000000e+00, %sub.i336
  %conv.i338 = sitofp i32 %138 to double
  %call.i339 = tail call double @sqrt(double %conv.i338) #6
  %div4.i340 = fdiv double %div.i337, %call.i339
  %140 = load double*** @bus, align 8, !tbaa !5
  %arrayidx.i341 = getelementptr inbounds double** %140, i64 %indvars.iv18.i332
  %141 = load double** %arrayidx.i341, align 8, !tbaa !5
  %arrayidx6.i342 = getelementptr inbounds double* %141, i64 %indvars.iv.i335
  store double %div4.i340, double* %arrayidx6.i342, align 8, !tbaa !10
  %indvars.iv.next.i343 = add nsw i64 %indvars.iv.i335, 1
  %142 = load i32* @numf2s, align 4, !tbaa !1
  %143 = trunc i64 %indvars.iv.next.i343 to i32
  %cmp2.i344 = icmp slt i32 %143, %142
  %.pre21.i345 = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2.i344, label %for.body3.i346, label %for.inc7.i349

for.inc7.i349:                                    ; preds = %for.body3.i346, %for.cond1.preheader.i334
  %.pr459.pr = phi i32 [ %136, %for.cond1.preheader.i334 ], [ %.pre21.i345, %for.body3.i346 ]
  %.pre.i276 = phi i32 [ %137, %for.cond1.preheader.i334 ], [ %142, %for.body3.i346 ]
  %indvars.iv.next19.i347 = add nuw nsw i64 %indvars.iv18.i332, 1
  %144 = trunc i64 %indvars.iv.next19.i347 to i32
  %cmp.i348 = icmp slt i32 %144, %.pr459.pr
  br i1 %cmp.i348, label %for.cond1.preheader.i334, label %init_bu.exit350

init_bu.exit350:                                  ; preds = %for.inc7.i349
  %cmp22.i = icmp sgt i32 %.pr459.pr, 0
  br i1 %cmp22.i, label %for.cond1.preheader.i278, label %if.end167

for.cond1.preheader.i278:                         ; preds = %for.inc11.i, %init_bu.exit350
  %145 = phi i32 [ %155, %for.inc11.i ], [ %.pr459.pr, %init_bu.exit350 ]
  %146 = phi i32 [ %156, %for.inc11.i ], [ %.pre.i276, %init_bu.exit350 ]
  %indvars.iv24.i = phi i64 [ %indvars.iv.next25.i, %for.inc11.i ], [ 0, %init_bu.exit350 ]
  %cmp220.i = icmp sgt i32 %146, 1
  br i1 %cmp220.i, label %for.body3.i289, label %for.inc11.i

for.body3.i289:                                   ; preds = %for.body3.i289, %for.cond1.preheader.i278
  %147 = phi i32 [ %.pre27.i, %for.body3.i289 ], [ %145, %for.cond1.preheader.i278 ]
  %indvars.iv.i279 = phi i64 [ %indvars.iv.next.i287, %for.body3.i289 ], [ 1, %for.cond1.preheader.i278 ]
  %conv.i280 = sitofp i32 %147 to double
  %call.i281 = tail call double @sqrt(double %conv.i280) #6
  %div.i282 = fdiv double 1.000000e+00, %call.i281
  %148 = load double* @d, align 8, !tbaa !10
  %sub.i283 = fsub double 1.000000e+00, %148
  %div4.i284 = fdiv double %div.i282, %sub.i283
  %149 = load double*** @bus, align 8, !tbaa !5
  %arrayidx.i285 = getelementptr inbounds double** %149, i64 %indvars.iv24.i
  %150 = load double** %arrayidx.i285, align 8, !tbaa !5
  %arrayidx6.i286 = getelementptr inbounds double* %150, i64 %indvars.iv.i279
  store double %div4.i284, double* %arrayidx6.i286, align 8, !tbaa !10
  %151 = load double*** @tds, align 8, !tbaa !5
  %arrayidx9.i = getelementptr inbounds double** %151, i64 %indvars.iv24.i
  %152 = load double** %arrayidx9.i, align 8, !tbaa !5
  %arrayidx10.i = getelementptr inbounds double* %152, i64 %indvars.iv.i279
  store double %div4.i284, double* %arrayidx10.i, align 8, !tbaa !10
  %indvars.iv.next.i287 = add nsw i64 %indvars.iv.i279, 1
  %153 = load i32* @numf2s, align 4, !tbaa !1
  %154 = trunc i64 %indvars.iv.next.i287 to i32
  %cmp2.i288 = icmp slt i32 %154, %153
  %.pre27.i = load i32* @numf1s, align 4, !tbaa !1
  br i1 %cmp2.i288, label %for.body3.i289, label %for.inc11.i

for.inc11.i:                                      ; preds = %for.body3.i289, %for.cond1.preheader.i278
  %155 = phi i32 [ %145, %for.cond1.preheader.i278 ], [ %.pre27.i, %for.body3.i289 ]
  %156 = phi i32 [ %146, %for.cond1.preheader.i278 ], [ %153, %for.body3.i289 ]
  %indvars.iv.next25.i = add nuw nsw i64 %indvars.iv24.i, 1
  %157 = trunc i64 %indvars.iv.next25.i to i32
  %cmp.i290 = icmp slt i32 %157, %155
  br i1 %cmp.i290, label %for.cond1.preheader.i278, label %if.end167

if.end167:                                        ; preds = %for.inc11.i, %init_bu.exit350, %init_td.exit421, %while.end165, %for.inc11.i395, %init_bu.exit372, %if.then137
  %cmp168 = icmp eq i32 %endy.1, 0
  br i1 %cmp168, label %if.then169, label %if.end171

if.then169:                                       ; preds = %if.end167
  %158 = load i32* @height, align 4, !tbaa !1
  %159 = load i32* @lheight, align 4, !tbaa !1
  %sub170 = sub nsw i32 %158, %159
  br label %if.end171

if.end171:                                        ; preds = %if.then169, %if.end167
  %endy.2 = phi i32 [ %sub170, %if.then169 ], [ %endy.1, %if.end167 ]
  %cmp172 = icmp eq i32 %endx.1, 0
  br i1 %cmp172, label %if.then173, label %if.end175

if.then173:                                       ; preds = %if.end171
  %160 = load i32* @width, align 4, !tbaa !1
  %161 = load i32* @lwidth, align 4, !tbaa !1
  %sub174 = sub nsw i32 %160, %161
  br label %if.end175

if.end175:                                        ; preds = %if.then173, %if.end171
  %endx.2 = phi i32 [ %sub174, %if.then173 ], [ %endx.1, %if.end171 ]
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([2 x double]* @highest_confidence to i8*), i8 0, i64 16, i32 16, i1 false)
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @highx, i64 0, i64 0), align 4, !tbaa !1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @highx, i64 0, i64 1), align 4, !tbaa !1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @highy, i64 0, i64 0), align 4, !tbaa !1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @highy, i64 0, i64 1), align 4, !tbaa !1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @set_high, i64 0, i64 0), align 4, !tbaa !1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @set_high, i64 0, i64 1), align 4, !tbaa !1
  tail call void @scan_recognize(i32 %startx.1, i32 %starty.1, i32 %endx.2, i32 %endy.2, i32 %stride.1)
  %162 = load %struct._IO_FILE** @stdout, align 8, !tbaa !5
  %163 = load double* getelementptr inbounds ([2 x double]* @highest_confidence, i64 0, i64 0), align 16, !tbaa !10
  %164 = load i32* getelementptr inbounds ([2 x i32]* @highx, i64 0, i64 0), align 4, !tbaa !1
  %165 = load i32* getelementptr inbounds ([2 x i32]* @highy, i64 0, i64 0), align 4, !tbaa !1
  %call176 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %162, i8* getelementptr inbounds ([62 x i8]* @.str44, i64 0, i64 0), double %163, i32 %164, i32 %165) #6
  %166 = load i32* @numpatterns, align 4, !tbaa !1
  %cmp177 = icmp eq i32 %166, 2
  br i1 %cmp177, label %if.then178, label %if.end180

if.then178:                                       ; preds = %if.end175
  %167 = load %struct._IO_FILE** @stdout, align 8, !tbaa !5
  %168 = load double* getelementptr inbounds ([2 x double]* @highest_confidence, i64 0, i64 1), align 8, !tbaa !10
  %169 = load i32* getelementptr inbounds ([2 x i32]* @highx, i64 0, i64 1), align 4, !tbaa !1
  %170 = load i32* getelementptr inbounds ([2 x i32]* @highy, i64 0, i64 1), align 4, !tbaa !1
  %call179 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([62 x i8]* @.str45, i64 0, i64 0), double %168, i32 %169, i32 %170) #6
  br label %if.end180

if.end180:                                        ; preds = %if.then178, %if.end175
  ret i32 0

Usage:                                            ; preds = %if.then133, %if.then127, %if.then122, %if.else106, %if.else, %entry
  %171 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %172 = tail call i64 @fwrite(i8* getelementptr inbounds ([161 x i8]* @.str46, i64 0, i64 0), i64 160, i64 1, %struct._IO_FILE* %171) #8
  tail call void @exit(i32 1) #10
  unreachable

Version:                                          ; preds = %if.then2
  %173 = load %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %174 = tail call i64 @fwrite(i8* getelementptr inbounds ([15 x i8]* @.str47, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %173) #8
  tail call void @exit(i32 1) #10
  unreachable
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #7

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

; Function Attrs: nounwind
declare i32 @putchar(i32) #6

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { cold }
attributes #9 = { nounwind readnone }
attributes #10 = { noreturn nounwind }
attributes #11 = { cold nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"int", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"any pointer", metadata !3, i64 0}
!7 = metadata !{metadata !8, metadata !9, i64 0}
!8 = metadata !{metadata !"", metadata !9, i64 0, metadata !2, i64 8}
!9 = metadata !{metadata !"double", metadata !3, i64 0}
!10 = metadata !{metadata !9, metadata !9, i64 0}
!11 = metadata !{metadata !12, metadata !9, i64 40}
!12 = metadata !{metadata !"", metadata !6, i64 0, metadata !9, i64 8, metadata !9, i64 16, metadata !9, i64 24, metadata !9, i64 32, metadata !9, i64 40, metadata !9, i64 48, metadata !9, i64 56}
!13 = metadata !{metadata !12, metadata !9, i64 32}
!14 = metadata !{metadata !12, metadata !9, i64 56}
!15 = metadata !{metadata !12, metadata !6, i64 0}
!16 = metadata !{metadata !8, metadata !2, i64 8}
!17 = metadata !{metadata !12, metadata !9, i64 8}
!18 = metadata !{metadata !12, metadata !9, i64 16}
!19 = metadata !{metadata !12, metadata !9, i64 48}
!20 = metadata !{metadata !12, metadata !9, i64 24}
!21 = metadata !{metadata !3, metadata !3, i64 0}
!22 = metadata !{metadata !23, metadata !23, i64 0}
!23 = metadata !{metadata !"long", metadata !3, i64 0}
