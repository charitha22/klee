; ModuleID = '<stdin>'
source_filename = "merge_sort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"arr\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @merge(i32* %arr, i32 %l, i32 %m, i32 %r) #0 {
entry:
  %sub = sub nsw i32 %m, %l
  %add = add nsw i32 %sub, 1
  %sub1 = sub nsw i32 %r, %m
  %0 = zext i32 %add to i64
  %vla = alloca i32, i64 %0, align 16
  %1 = zext i32 %sub1 to i64
  %vla2 = alloca i32, i64 %1, align 16
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %add
  br i1 %cmp, label %for.body, label %for.cond6

for.body:                                         ; preds = %for.cond
  %add3 = add nsw i32 %l, %i.0
  %idxprom = sext i32 %add3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %arr, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4
  %idxprom4 = sext i32 %i.0 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %vla, i64 %idxprom4
  store i32 %2, i32* %arrayidx5, align 4
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !4

for.cond6:                                        ; preds = %for.body8, %for.cond
  %j.0 = phi i32 [ %inc16, %for.body8 ], [ 0, %for.cond ]
  %cmp7 = icmp slt i32 %j.0, %sub1
  br i1 %cmp7, label %for.body8, label %while.cond

for.body8:                                        ; preds = %for.cond6
  %add9 = add nsw i32 %m, 1
  %add10 = add nsw i32 %add9, %j.0
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds i32, i32* %arr, i64 %idxprom11
  %3 = load i32, i32* %arrayidx12, align 4
  %idxprom13 = sext i32 %j.0 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %vla2, i64 %idxprom13
  store i32 %3, i32* %arrayidx14, align 4
  %inc16 = add nsw i32 %j.0, 1
  br label %for.cond6, !llvm.loop !6

while.cond:                                       ; preds = %while.body, %for.cond6
  %i.1 = phi i32 [ %moved.sel, %while.body ], [ 0, %for.cond6 ]
  %j.1 = phi i32 [ %moved.sel4, %while.body ], [ 0, %for.cond6 ]
  %k.0 = phi i32 [ %inc35, %while.body ], [ %l, %for.cond6 ]
  %cmp18 = icmp slt i32 %i.1, %add
  %cmp19 = icmp slt i32 %j.1, %sub1
  %spec.select = select i1 %cmp18, i1 %cmp19, i1 false
  br i1 %spec.select, label %while.body, label %while.cond36

while.body:                                       ; preds = %while.cond
  %idxprom20 = sext i32 %i.1 to i64
  %arrayidx21 = getelementptr inbounds i32, i32* %vla, i64 %idxprom20
  %4 = load i32, i32* %arrayidx21, align 4
  %idxprom22 = sext i32 %j.1 to i64
  %arrayidx23 = getelementptr inbounds i32, i32* %vla2, i64 %idxprom22
  %5 = load i32, i32* %arrayidx23, align 4
  %cmp24 = icmp sle i32 %4, %5
  %merged.select = select i1 %cmp24, i32 %i.1, i32 %j.1
  %6 = sext i32 %merged.select to i64
  ; %merged.select1 = select i1 %cmp24, i32* %vla, i32* %vla2
  %7 = select i1 %cmp24, i32 1, i32 0
  %8 = load i32, i32* %vla, align 4
  %ld.8 = load i32, i32* %vla2, align 4
  %9 = sext i32 %k.0 to i64
  %10 = getelementptr inbounds i32, i32* %arr, i64 %9
  %merged.select1 = select i1 %cmp24, i32 %8, i32 %ld.8
  store i32 %merged.select1 , i32* %10, align 4
  %merged.select2 = select i1 %cmp24, i32 %i.1, i32 %j.1
  %11 = add nsw i32 %merged.select2, 1
  %moved.sel = select i1 %cmp24, i32 %11, i32 %i.1
  %moved.sel4 = select i1 %cmp24, i32 %j.1, i32 %11
  %inc35 = add nsw i32 %k.0, 1
  br label %while.cond, !llvm.loop !7

while.cond36:                                     ; preds = %while.body38, %while.cond
  %i.3 = phi i32 [ %inc43, %while.body38 ], [ %i.1, %while.cond ]
  %k.1 = phi i32 [ %inc44, %while.body38 ], [ %k.0, %while.cond ]
  %cmp37 = icmp slt i32 %i.3, %add
  br i1 %cmp37, label %while.body38, label %while.cond46

while.body38:                                     ; preds = %while.cond36
  %idxprom39 = sext i32 %i.3 to i64
  %arrayidx40 = getelementptr inbounds i32, i32* %vla, i64 %idxprom39
  %12 = load i32, i32* %arrayidx40, align 4
  %idxprom41 = sext i32 %k.1 to i64
  %arrayidx42 = getelementptr inbounds i32, i32* %arr, i64 %idxprom41
  store i32 %12, i32* %arrayidx42, align 4
  %inc43 = add nsw i32 %i.3, 1
  %inc44 = add nsw i32 %k.1, 1
  br label %while.cond36, !llvm.loop !8

while.cond46:                                     ; preds = %while.body48, %while.cond36
  %j.3 = phi i32 [ %inc53, %while.body48 ], [ %j.1, %while.cond36 ]
  %k.2 = phi i32 [ %inc54, %while.body48 ], [ %k.1, %while.cond36 ]
  %cmp47 = icmp slt i32 %j.3, %sub1
  br i1 %cmp47, label %while.body48, label %while.end55

while.body48:                                     ; preds = %while.cond46
  %idxprom49 = sext i32 %j.3 to i64
  %arrayidx50 = getelementptr inbounds i32, i32* %vla2, i64 %idxprom49
  %13 = load i32, i32* %arrayidx50, align 4
  %idxprom51 = sext i32 %k.2 to i64
  %arrayidx52 = getelementptr inbounds i32, i32* %arr, i64 %idxprom51
  store i32 %13, i32* %arrayidx52, align 4
  %inc53 = add nsw i32 %j.3, 1
  %inc54 = add nsw i32 %k.2, 1
  br label %while.cond46, !llvm.loop !9

while.end55:                                      ; preds = %while.cond46
  ret void
}

; Function Attrs: nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @mergeSort(i32* %arr, i32 %l, i32 %r) #0 {
entry:
  %cmp = icmp slt i32 %l, %r
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sub = sub nsw i32 %r, %l
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %l, %div
  call void @mergeSort(i32* %arr, i32 %l, i32 %add)
  %add1 = add nsw i32 %add, 1
  call void @mergeSort(i32* %arr, i32 %add1, i32 %r)
  call void @merge(i32* %arr, i32 %l, i32 %add, i32 %r)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printArray(i32* %A, i32 %size) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %size
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %A, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0)
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  ret void
}

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %arr = alloca [10 x i32], align 16
  %0 = bitcast [10 x i32]* %arr to i8*
  call void @klee_make_symbolic(i8* %0, i64 40, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %arr, i64 0, i64 0
  %sub = sub nsw i32 10, 1
  call void @mergeSort(i32* %arraydecay, i32 0, i32 %sub)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.0 (git@github.com:charitha22/llvm-project-rocm.git dcfabd0f24a7c398cfacab1ec8dbe6cf1eaf9885)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}
