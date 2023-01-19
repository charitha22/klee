; ModuleID = '<stdin>'
source_filename = "gcd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"n1\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"n2\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 %n1, i32 %n2) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %n2.addr.0 = phi i32 [ %n2, %entry ], [ %n2.addr.1, %if.end ]
  %n1.addr.0 = phi i32 [ %n1, %entry ], [ %n1.addr.1, %if.end ]
  %cmp = icmp ne i32 %n1.addr.0, %n2.addr.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %cmp1 = icmp sgt i32 %n1.addr.0, %n2.addr.0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %sub = sub nsw i32 %n1.addr.0, %n2.addr.0
  br label %if.end

if.else:                                          ; preds = %while.body
  %sub2 = sub nsw i32 %n2.addr.0, %n1.addr.0
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %n2.addr.1 = phi i32 [ %n2.addr.0, %if.then ], [ %sub2, %if.else ]
  %n1.addr.1 = phi i32 [ %sub, %if.then ], [ %n1.addr.0, %if.else ]
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
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %3 = load i32, i32* %n1, align 4
  %cmp1 = icmp sle i32 %3, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  %conv = sext i32 %land.ext to i64
  call void @klee_assume(i64 %conv)
  %5 = load i32, i32* %n2, align 4
  %cmp2 = icmp sgt i32 %5, 0
  br i1 %cmp2, label %land.rhs4, label %land.end7

land.rhs4:                                        ; preds = %land.end
  %6 = load i32, i32* %n2, align 4
  %cmp5 = icmp sle i32 %6, 10
  br label %land.end7

land.end7:                                        ; preds = %land.rhs4, %land.end
  %7 = phi i1 [ false, %land.end ], [ %cmp5, %land.rhs4 ]
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
!3 = !{!"clang version 14.0.0 (https://github.com/charitha22/llvm-project-rocm.git 9faadd4db8190edaeb2baea2daf2477a1259fa88)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
