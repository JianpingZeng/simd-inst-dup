; ModuleID = 'test.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i32, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type { i32 (...)**, i32 }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type { %"class.std::locale::facet", %struct.__locale_struct*, i8, i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8 }
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet" }
%"class.std::num_get" = type { %"class.std::locale::facet" }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZZ4testvE1A = private unnamed_addr constant [100 x double] [double 1.100000e+00, double 2.000000e+00, double 3.300000e+00, double 4.000000e+00, double 5.500000e+00, double 6.000000e+00, double 7.700000e+00, double 8.000000e+00, double 9.900000e+00, double 1.000000e+01, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00], align 4
@_ZSt4cout = external global %"class.std::basic_ostream"
@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 65535, void ()* @_GLOBAL__I_a }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

define void @_Z4testv() #0 {
entry:
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %entry
  %i3.028 = phi i32 [ 0, %entry ], [ %inc10, %for.body6 ]
  %arrayidx7 = getelementptr inbounds [100 x double]* @_ZZ4testvE1A, i32 0, i32 %i3.028
  %0 = load double* %arrayidx7, align 4, !tbaa !0
  %call.i = tail call %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"* @_ZSt4cout, double %0)
  %call1.i = tail call %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"class.std::basic_ostream"* %call.i, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i32 1)
  %inc10 = add nsw i32 %i3.028, 1
  %exitcond = icmp eq i32 %inc10, 100
  br i1 %exitcond, label %for.end11, label %for.body6

for.end11:                                        ; preds = %for.body6
  %vtable.i = load i8** bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8**), align 4, !tbaa !3
  %vbase.offset.ptr.i = getelementptr i8* %vtable.i, i32 -12
  %1 = bitcast i8* %vbase.offset.ptr.i to i32*
  %vbase.offset.i = load i32* %1, align 4
  %add.ptr.i.sum = add i32 %vbase.offset.i, 124
  %_M_ctype.i = getelementptr inbounds i8* bitcast (%"class.std::basic_ostream"* @_ZSt4cout to i8*), i32 %add.ptr.i.sum
  %2 = bitcast i8* %_M_ctype.i to %"class.std::ctype"**
  %3 = load %"class.std::ctype"** %2, align 4, !tbaa !4
  %tobool.i25 = icmp eq %"class.std::ctype"* %3, null
  br i1 %tobool.i25, label %if.then.i26, label %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit

if.then.i26:                                      ; preds = %for.end11
  tail call void @_ZSt16__throw_bad_castv() #3
  unreachable

_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit:    ; preds = %for.end11
  %_M_widen_ok.i = getelementptr inbounds %"class.std::ctype"* %3, i32 0, i32 6
  %4 = load i8* %_M_widen_ok.i, align 1, !tbaa !1
  %tobool.i = icmp eq i8 %4, 0
  br i1 %tobool.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  %arrayidx.i = getelementptr inbounds %"class.std::ctype"* %3, i32 0, i32 7, i32 10
  %5 = load i8* %arrayidx.i, align 1, !tbaa !1
  br label %_ZNKSt5ctypeIcE5widenEc.exit

if.end.i:                                         ; preds = %_ZSt13__check_facetISt5ctypeIcEERKT_PS3_.exit
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"* %3)
  %6 = bitcast %"class.std::ctype"* %3 to i8 (%"class.std::ctype"*, i8)***
  %vtable.i23 = load i8 (%"class.std::ctype"*, i8)*** %6, align 4, !tbaa !3
  %vfn.i = getelementptr inbounds i8 (%"class.std::ctype"*, i8)** %vtable.i23, i32 6
  %7 = load i8 (%"class.std::ctype"*, i8)** %vfn.i, align 4
  %call.i24 = tail call signext i8 %7(%"class.std::ctype"* %3, i8 signext 10)
  br label %_ZNKSt5ctypeIcE5widenEc.exit

_ZNKSt5ctypeIcE5widenEc.exit:                     ; preds = %if.end.i, %if.then.i
  %retval.0.i = phi i8 [ %5, %if.then.i ], [ %call.i24, %if.end.i ]
  %call1.i20 = tail call %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"* @_ZSt4cout, i8 signext %retval.0.i)
  %call.i21 = tail call %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"* %call1.i20)
  ret void
}

define i32 @main() #0 {
entry:
  tail call void @_Z4testv()
  ret i32 0
}

declare %"class.std::basic_ostream"* @_ZNSo3putEc(%"class.std::basic_ostream"*, i8 signext) #0

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(%"class.std::ctype"*) #0

; Function Attrs: noreturn
declare void @_ZSt16__throw_bad_castv() #2

declare %"class.std::basic_ostream"* @_ZNSo5flushEv(%"class.std::basic_ostream"*) #0

declare %"class.std::basic_ostream"* @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i(%"class.std::basic_ostream"*, i8*, i32) #0

declare %"class.std::basic_ostream"* @_ZNSo9_M_insertIdEERSoT_(%"class.std::basic_ostream"*, double) #0

define internal void @_GLOBAL__I_a() section ".text.startup" {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1
  ret void
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA"}
!3 = metadata !{metadata !"vtable pointer", metadata !2}
!4 = metadata !{metadata !"any pointer", metadata !1}
