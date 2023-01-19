; ModuleID = 'gcd.ll'
source_filename = "gcd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"n1\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"n2\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 %n1, i32 %n2) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %n2.addr.0 = phi i32 [ %n2, %entry ], [ %n2.addr.1, %while.body ]
  %n1.addr.0 = phi i32 [ %n1, %entry ], [ %n1.addr.1, %while.body ]
  %cmp = icmp ne i32 %n1.addr.0, %n2.addr.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %cmp1 = icmp sgt i32 %n1.addr.0, %n2.addr.0
  %sub = sub nsw i32 %n1.addr.0, %n2.addr.0
  %sub2 = sub nsw i32 %n2.addr.0, %n1.addr.0
  %n2.addr.1 = select i1 %cmp1, i32 %n2.addr.0, i32 %sub2
  %n1.addr.1 = select i1 %cmp1, i32 %sub, i32 %n1.addr.0
  br label %while.cond, !llvm.loop !4

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %n1 = alloca i32, align 4
  %n2 = alloca i32, align 4
  %0 = bitcast i32* %n1 to i8*
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0))
  %1 = bitcast i32* %n2 to i8*
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  %2 = load i32, i32* %n1, align 4
  %cmp = icmp sgt i32 %2, 0
  %3 = load i32, i32* %n1, align 4
  %cmp1 = icmp sle i32 %3, 10
  %4 = select i1 %cmp, i1 %cmp1, i1 false
  %land.ext = zext i1 %4 to i32
  %conv = sext i32 %land.ext to i64
  call void @klee_assume(i64 %conv)
  %5 = load i32, i32* %n2, align 4
  %cmp2 = icmp sgt i32 %5, 0
  %6 = load i32, i32* %n2, align 4
  %cmp5 = icmp sle i32 %6, 10
  %7 = select i1 %cmp2, i1 %cmp5, i1 false
  %land.ext8 = zext i1 %7 to i32
  %conv9 = sext i32 %land.ext8 to i64
  call void @klee_assume(i64 %conv9)
  %8 = load i32, i32* %n1, align 4
  %9 = load i32, i32* %n2, align 4
  call void @foo(i32 %8, i32 %9)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

declare dso_local void @klee_assume(i64) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 7685a3d5f4f0b5e87af11222c9de19ce6b0c4477)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
