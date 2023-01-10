; ModuleID = 'array_loop_with_if_else.ll'
source_filename = "array_loop_with_if_else.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"arr\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32* %arr) #0 !dbg !9 {
entry:
  %arr.addr = alloca i32*, align 8
  %temp = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %arr, i32** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %arr.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %i, align 4, !dbg !20
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %cmp = icmp slt i32 %0, 10, !dbg !24
  br i1 %cmp, label %for.body, label %for.end, !dbg !25

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %arr.addr, align 8, !dbg !26
  %2 = load i32, i32* %i, align 4, !dbg !29
  %idxprom = sext i32 %2 to i64, !dbg !26
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !26
  %3 = load i32, i32* %arrayidx, align 4, !dbg !26
  %cmp1 = icmp sle i32 %3, 2, !dbg !30
  br i1 %cmp1, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %for.body
  %4 = load i32*, i32** %arr.addr, align 8, !dbg !32
  %5 = load i32, i32* %i, align 4, !dbg !34
  %idxprom2 = sext i32 %5 to i64, !dbg !32
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 %idxprom2, !dbg !32
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !32
  store i32 %6, i32* %temp, align 4, !dbg !35
  %7 = load i32, i32* %temp, align 4, !dbg !36
  %inc = add nsw i32 %7, 1, !dbg !36
  store i32 %inc, i32* %temp, align 4, !dbg !36
  %8 = load i32, i32* %temp, align 4, !dbg !37
  %mul = mul nsw i32 %8, 10, !dbg !37
  store i32 %mul, i32* %temp, align 4, !dbg !37
  %9 = load i32, i32* %temp, align 4, !dbg !38
  %sub = sub nsw i32 %9, 15, !dbg !38
  store i32 %sub, i32* %temp, align 4, !dbg !38
  br label %for.inc, !dbg !39

if.else:                                          ; preds = %for.body
  %10 = load i32*, i32** %arr.addr, align 8, !dbg !40
  %11 = load i32, i32* %i, align 4, !dbg !42
  %idxprom4 = sext i32 %11 to i64, !dbg !40
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %idxprom4, !dbg !40
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !40
  store i32 %12, i32* %temp, align 4, !dbg !43
  %13 = load i32, i32* %temp, align 4, !dbg !44
  %add = add nsw i32 %13, 50, !dbg !44
  store i32 %add, i32* %temp, align 4, !dbg !44
  %14 = load i32, i32* %temp, align 4, !dbg !45
  %mul6 = mul nsw i32 %14, 20, !dbg !45
  store i32 %mul6, i32* %temp, align 4, !dbg !45
  %15 = load i32, i32* %temp, align 4, !dbg !46
  %sub7 = sub nsw i32 %15, -5, !dbg !46
  store i32 %sub7, i32* %temp, align 4, !dbg !46
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %16 = load i32, i32* %i, align 4, !dbg !47
  %inc8 = add nsw i32 %16, 1, !dbg !47
  store i32 %inc8, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !53 {
entry:
  %arr = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata [10 x i32]* %arr, metadata !56, metadata !DIExpression()), !dbg !60
  %0 = bitcast [10 x i32]* %arr to i8*, !dbg !61
  call void @klee_make_symbolic(i8* %0, i64 40, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !62
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 0, !dbg !63
  call void @foo(i32* %arraydecay), !dbg !64
  ret i32 0, !dbg !65
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

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
!9 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!15 = !DILocation(line: 4, column: 15, scope: !9)
!16 = !DILocalVariable(name: "temp", scope: !9, file: !1, line: 6, type: !13)
!17 = !DILocation(line: 6, column: 7, scope: !9)
!18 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 27, type: !13)
!19 = distinct !DILexicalBlock(scope: !9, file: !1, line: 27, column: 3)
!20 = !DILocation(line: 27, column: 11, scope: !19)
!21 = !DILocation(line: 27, column: 7, scope: !19)
!22 = !DILocation(line: 27, column: 18, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !1, line: 27, column: 3)
!24 = !DILocation(line: 27, column: 20, scope: !23)
!25 = !DILocation(line: 27, column: 3, scope: !19)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 28, column: 8)
!28 = distinct !DILexicalBlock(scope: !23, file: !1, line: 27, column: 31)
!29 = !DILocation(line: 28, column: 12, scope: !27)
!30 = !DILocation(line: 28, column: 15, scope: !27)
!31 = !DILocation(line: 28, column: 8, scope: !28)
!32 = !DILocation(line: 29, column: 14, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 28, column: 21)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 12, scope: !33)
!36 = !DILocation(line: 30, column: 11, scope: !33)
!37 = !DILocation(line: 31, column: 11, scope: !33)
!38 = !DILocation(line: 32, column: 11, scope: !33)
!39 = !DILocation(line: 33, column: 5, scope: !33)
!40 = !DILocation(line: 34, column: 14, scope: !41)
!41 = distinct !DILexicalBlock(scope: !27, file: !1, line: 33, column: 12)
!42 = !DILocation(line: 34, column: 18, scope: !41)
!43 = !DILocation(line: 34, column: 12, scope: !41)
!44 = !DILocation(line: 35, column: 11, scope: !41)
!45 = !DILocation(line: 36, column: 11, scope: !41)
!46 = !DILocation(line: 37, column: 11, scope: !41)
!47 = !DILocation(line: 27, column: 27, scope: !23)
!48 = !DILocation(line: 27, column: 3, scope: !23)
!49 = distinct !{!49, !25, !50, !51}
!50 = !DILocation(line: 39, column: 3, scope: !19)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 44, column: 1, scope: !9)
!53 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 46, type: !54, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!13}
!56 = !DILocalVariable(name: "arr", scope: !53, file: !1, line: 47, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 10)
!60 = !DILocation(line: 47, column: 7, scope: !53)
!61 = !DILocation(line: 53, column: 22, scope: !53)
!62 = !DILocation(line: 53, column: 3, scope: !53)
!63 = !DILocation(line: 55, column: 7, scope: !53)
!64 = !DILocation(line: 55, column: 3, scope: !53)
!65 = !DILocation(line: 56, column: 1, scope: !53)
