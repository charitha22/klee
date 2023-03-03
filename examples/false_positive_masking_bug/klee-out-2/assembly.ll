; ModuleID = './false_positive_masking_bug/false_positive_masking_bug.ll'
source_filename = "./false_positive_masking_bug/false_positive_masking_bug.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"y\00", align 1
@cfmse.dci_gv = private global [8 x i8] zeroinitializer

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !8 {
entry:
  %arr = alloca [10 x i32], align 16
  %arr2 = alloca [10 x i32], align 16
  %y = alloca i32, align 4
  %0 = bitcast i32* %y to i8*, !dbg !12
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !13
  %cfmse.dci_gep = getelementptr [8 x i8], [8 x i8]* @cfmse.dci_gv, i64 0, i64 0
  br label %for.cond, !dbg !14

for.cond:                                         ; preds = %for.inc, %entry
  %j1.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc ], !dbg !15
  %cmp = icmp slt i32 %j1.0, 10, !dbg !16
  br i1 %cmp, label %for.body, label %for.end, !dbg !17

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %y, align 4, !dbg !18
  %cmp2 = icmp slt i32 %1, 10, !dbg !19
  br i1 %cmp2, label %if.then, label %if.else, !dbg !18

if.then:                                          ; preds = %for.body
  %inc = add nsw i32 8, 1, !dbg !20
  %idxprom = sext i32 %inc to i64, !dbg !21
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 %idxprom, !dbg !21
  store i32 10, i32* %arrayidx, align 4, !dbg !22
  br label %for.inc, !dbg !23

if.else:                                          ; preds = %for.body
  %inc3 = add nsw i32 9, 1, !dbg !24
  %inc4 = add nsw i32 9, 1, !dbg !25
  %idxprom5 = sext i32 %inc4 to i64, !dbg !26
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %arr2, i64 0, i64 %idxprom5, !dbg !26
  store i32 10, i32* %arrayidx6, align 4, !dbg !27
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %j1.1 = phi i32 [ %j1.0, %if.then ], [ %inc4, %if.else ], !dbg !15
  %inc7 = add nsw i32 %j1.1, 1, !dbg !28
  br label %for.cond, !dbg !17, !llvm.loop !29

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !32
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 97e818afe825af8b64867948a8d82c43ad8ab1eb)", isOptimized: false, runtimeVersion: 0, emissionKind: LineTablesOnly, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "false_positive_masking_bug/false_positive_masking_bug.c", directory: "/home/shay/a/rgangar/PLCL/klee/examples")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"uwtable", i32 1}
!6 = !{i32 7, !"frame-pointer", i32 2}
!7 = !{!"clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 97e818afe825af8b64867948a8d82c43ad8ab1eb)"}
!8 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 4, type: !10, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0)
!9 = !DIFile(filename: "./false_positive_masking_bug/false_positive_masking_bug.c", directory: "/home/shay/a/rgangar/PLCL/klee/examples")
!10 = !DISubroutineType(types: !11)
!11 = !{}
!12 = !DILocation(line: 9, column: 22, scope: !8)
!13 = !DILocation(line: 9, column: 3, scope: !8)
!14 = !DILocation(line: 11, column: 7, scope: !8)
!15 = !DILocation(line: 0, scope: !8)
!16 = !DILocation(line: 11, column: 20, scope: !8)
!17 = !DILocation(line: 11, column: 3, scope: !8)
!18 = !DILocation(line: 12, column: 9, scope: !8)
!19 = !DILocation(line: 12, column: 11, scope: !8)
!20 = !DILocation(line: 13, column: 15, scope: !8)
!21 = !DILocation(line: 13, column: 19, scope: !8)
!22 = !DILocation(line: 13, column: 26, scope: !8)
!23 = !DILocation(line: 14, column: 5, scope: !8)
!24 = !DILocation(line: 15, column: 15, scope: !8)
!25 = !DILocation(line: 16, column: 15, scope: !8)
!26 = !DILocation(line: 16, column: 19, scope: !8)
!27 = !DILocation(line: 16, column: 27, scope: !8)
!28 = !DILocation(line: 11, column: 27, scope: !8)
!29 = distinct !{!29, !17, !30, !31}
!30 = !DILocation(line: 18, column: 3, scope: !8)
!31 = !{!"llvm.loop.mustprogress"}
!32 = !DILocation(line: 21, column: 3, scope: !8)
