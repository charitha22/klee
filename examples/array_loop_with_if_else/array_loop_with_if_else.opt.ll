; ModuleID = '<stdin>'
source_filename = "array_loop_with_if_else.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"arr\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32* %arr) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc8, %for.inc ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %arr, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp sle i32 %0, 2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %idxprom2 = sext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %arr, i64 %idxprom2
  %1 = load i32, i32* %arrayidx3, align 4
  %inc = add nsw i32 %1, 1
  %mul = mul nsw i32 %inc, 10
  %sub = sub nsw i32 %mul, 15
  br label %if.end

if.else:                                          ; preds = %for.body
  %idxprom4 = sext i32 %i.0 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %arr, i64 %idxprom4
  %2 = load i32, i32* %arrayidx5, align 4
  %add = add nsw i32 %2, 50
  %mul6 = mul nsw i32 %add, 20
  %sub7 = sub nsw i32 %mul6, -5
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc8 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %arr = alloca [10 x i32], align 16
  %0 = bitcast [10 x i32]* %arr to i8*
  call void @klee_make_symbolic(i8* %0, i64 40, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 0
  call void @foo(i32* %arraydecay)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.0 (git@github.com:charitha22/llvm-project-rocm.git 975f62f2320a93533180ef66f9e279e3bd40e6e9)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
