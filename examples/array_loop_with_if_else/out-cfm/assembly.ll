; ModuleID = 'array_loop_with_if_else.merged.ll'
source_filename = "array_loop_with_if_else.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"arr\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32* %arr) #0 {
entry:
  br label %for.cond, !mergedLineNum !9, !sourceFile !10

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc8, %for.body ], !mergedLineNum !11, !sourceFile !10
  %cmp = icmp slt i32 %i.0, 10, !mergedLineNum !9, !sourceFile !10
  br i1 %cmp, label %for.body, label %for.end, !mergedLineNum !9, !sourceFile !10

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64, !mergedLineNum !12, !sourceFile !10
  %arrayidx = getelementptr inbounds i32, i32* %arr, i64 %idxprom, !mergedLineNum !12, !sourceFile !10
  %0 = load i32, i32* %arrayidx, align 4, !mergedLineNum !12, !sourceFile !10
  %cmp1 = icmp sle i32 %0, 2, !mergedLineNum !12, !sourceFile !10
  %1 = sext i32 %i.0 to i64, !mergedLineNum !13, !sourceFile !10
  %2 = getelementptr inbounds i32, i32* %arr, i64 %1, !mergedLineNum !13, !sourceFile !10
  %3 = load i32, i32* %2, align 4, !mergedLineNum !13, !sourceFile !10
  %merged.select = select i1 %cmp1, i32 1, i32 50, !mergedLineNum !14, !sourceFile !10
  %4 = add nsw i32 %3, %merged.select, !mergedLineNum !14, !sourceFile !10
  %merged.select1 = select i1 %cmp1, i32 10, i32 20, !mergedLineNum !15, !sourceFile !10
  %5 = mul nsw i32 %4, %merged.select1, !mergedLineNum !15, !sourceFile !10
  %merged.select2 = select i1 %cmp1, i32 15, i32 -5, !mergedLineNum !16, !sourceFile !10
  %6 = sub nsw i32 %5, %merged.select2, !mergedLineNum !16, !sourceFile !10
  %inc8 = add nsw i32 %i.0, 1, !mergedLineNum !9, !sourceFile !10
  br label %for.cond, !llvm.loop !17, !mergedLineNum !9, !sourceFile !10

for.end:                                          ; preds = %for.cond
  ret void, !mergedLineNum !19, !sourceFile !10
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %arr = alloca [10 x i32], align 16, !mergedLineNum !20, !sourceFile !10
  %0 = bitcast [10 x i32]* %arr to i8*, !mergedLineNum !21, !sourceFile !10
  call void @klee_make_symbolic(i8* %0, i64 40, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !mergedLineNum !21, !sourceFile !10
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 0, !mergedLineNum !22, !sourceFile !10
  call void @foo(i32* %arraydecay), !mergedLineNum !22, !sourceFile !10
  ret i32 0, !mergedLineNum !23, !sourceFile !10
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 32be09d212e0925a92454a71418258bf14b57673)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "array_loop_with_if_else.c", directory: "/home/shay/a/rgangar/PLCL/klee/examples/array_loop_with_if_else")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 32be09d212e0925a92454a71418258bf14b57673)"}
!9 = !{!"27"}
!10 = !{!"array_loop_with_if_else.c"}
!11 = !{!"0"}
!12 = !{!"28"}
!13 = !{!"29_34"}
!14 = !{!"30_35"}
!15 = !{!"31_36"}
!16 = !{!"32_37"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"44"}
!20 = !{!"46"}
!21 = !{!"53"}
!22 = !{!"55"}
!23 = !{!"56"}
