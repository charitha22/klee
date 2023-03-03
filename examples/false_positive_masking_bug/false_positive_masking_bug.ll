; ModuleID = '<stdin>'
source_filename = "./false_positive_masking_bug/false_positive_masking_bug.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"y\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %arr = alloca [10 x i32], align 16
  %arr2 = alloca [10 x i32], align 16
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %arr, metadata !14, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %arr2, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* undef, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %y, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = bitcast i32* %y to i8*, !dbg !25
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !26
  call void @llvm.dbg.value(metadata i32 0, metadata !27, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %j1.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc ], !dbg !29
  call void @llvm.dbg.value(metadata i32 %j1.0, metadata !27, metadata !DIExpression()), !dbg !29
  %cmp = icmp slt i32 %j1.0, 10, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %y, align 4, !dbg !34
  %cmp2 = icmp slt i32 %1, 10, !dbg !37
  br i1 %cmp2, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 8, metadata !39, metadata !DIExpression()), !dbg !40
  %inc = add nsw i32 8, 1, !dbg !41
  call void @llvm.dbg.value(metadata i32 %inc, metadata !39, metadata !DIExpression()), !dbg !40
  %idxprom = sext i32 %inc to i64, !dbg !43
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 %idxprom, !dbg !43
  store i32 10, i32* %arrayidx, align 4, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 9, metadata !39, metadata !DIExpression()), !dbg !40
  %inc3 = add nsw i32 9, 1, !dbg !46
  call void @llvm.dbg.value(metadata i32 %inc3, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata i32 9, metadata !27, metadata !DIExpression()), !dbg !29
  %inc4 = add nsw i32 9, 1, !dbg !48
  call void @llvm.dbg.value(metadata i32 %inc4, metadata !27, metadata !DIExpression()), !dbg !29
  %idxprom5 = sext i32 %inc4 to i64, !dbg !49
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %arr2, i64 0, i64 %idxprom5, !dbg !49
  store i32 10, i32* %arrayidx6, align 4, !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %j1.1 = phi i32 [ %j1.0, %if.then ], [ %inc4, %if.else ], !dbg !29
  call void @llvm.dbg.value(metadata i32 %j1.1, metadata !27, metadata !DIExpression()), !dbg !29
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %inc7 = add nsw i32 %j1.1, 1, !dbg !52
  call void @llvm.dbg.value(metadata i32 %inc7, metadata !27, metadata !DIExpression()), !dbg !29
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 97e818afe825af8b64867948a8d82c43ad8ab1eb)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "false_positive_masking_bug/false_positive_masking_bug.c", directory: "/home/shay/a/rgangar/PLCL/klee/examples")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 97e818afe825af8b64867948a8d82c43ad8ab1eb)"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./false_positive_masking_bug/false_positive_masking_bug.c", directory: "/home/shay/a/rgangar/PLCL/klee/examples")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "arr", scope: !9, file: !10, line: 5, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 10)
!18 = !DILocation(line: 5, column: 7, scope: !9)
!19 = !DILocalVariable(name: "arr2", scope: !9, file: !10, line: 5, type: !15)
!20 = !DILocation(line: 5, column: 20, scope: !9)
!21 = !DILocalVariable(name: "j", scope: !9, file: !10, line: 7, type: !13)
!22 = !DILocation(line: 7, column: 7, scope: !9)
!23 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 8, type: !13)
!24 = !DILocation(line: 8, column: 7, scope: !9)
!25 = !DILocation(line: 9, column: 22, scope: !9)
!26 = !DILocation(line: 9, column: 3, scope: !9)
!27 = !DILocalVariable(name: "j", scope: !28, file: !10, line: 11, type: !13)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 3)
!29 = !DILocation(line: 0, scope: !28)
!30 = !DILocation(line: 11, column: 7, scope: !28)
!31 = !DILocation(line: 11, column: 20, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 11, column: 3)
!33 = !DILocation(line: 11, column: 3, scope: !28)
!34 = !DILocation(line: 12, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !10, line: 12, column: 9)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 11, column: 31)
!37 = !DILocation(line: 12, column: 11, scope: !35)
!38 = !DILocation(line: 12, column: 9, scope: !36)
!39 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 6, type: !13)
!40 = !DILocation(line: 0, scope: !9)
!41 = !DILocation(line: 13, column: 15, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !10, line: 12, column: 16)
!43 = !DILocation(line: 13, column: 19, scope: !42)
!44 = !DILocation(line: 13, column: 26, scope: !42)
!45 = !DILocation(line: 14, column: 5, scope: !42)
!46 = !DILocation(line: 15, column: 15, scope: !47)
!47 = distinct !DILexicalBlock(scope: !35, file: !10, line: 14, column: 12)
!48 = !DILocation(line: 16, column: 15, scope: !47)
!49 = !DILocation(line: 16, column: 19, scope: !47)
!50 = !DILocation(line: 16, column: 27, scope: !47)
!51 = !DILocation(line: 18, column: 3, scope: !36)
!52 = !DILocation(line: 11, column: 27, scope: !32)
!53 = !DILocation(line: 11, column: 3, scope: !32)
!54 = distinct !{!54, !33, !55, !56}
!55 = !DILocation(line: 18, column: 3, scope: !28)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 21, column: 3, scope: !9)
