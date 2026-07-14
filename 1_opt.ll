; ModuleID = '1.ll'
source_filename = "1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %10 = load i32, ptr %2, align 4
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, %11
  %13 = fmul double %12, %11
  %14 = fmul double %13, 3.000000e+00
  %15 = fptosi double %14 to i32
  store i32 %15, ptr %5, align 4
  %16 = load i32, ptr %4, align 4
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %2, align 4
  %18 = shl i32 %17, 1
  %19 = load i32, ptr %3, align 4
  %20 = shl i32 %19, 1
  %21 = add i32 %20, %18
  %22 = add i32 %21, 7
  store i32 %22, ptr %7, align 4
  %23 = call double @log(double noundef 1.000000e+01) #3
  %24 = load i32, ptr %4, align 4
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 3.000000e+00
  %27 = load i32, ptr %3, align 4
  %28 = sitofp i32 %27 to double
  %29 = fmul double %28, 2.000000e+00
  %30 = fadd double %29, %26
  %31 = fadd double %30, %23
  %32 = fadd double %31, 9.000000e+00
  %33 = fptosi double %32 to i32
  store i32 %33, ptr %2, align 4
  %34 = load i32, ptr %3, align 4
  %35 = load i32, ptr %2, align 4
  %36 = load i32, ptr %3, align 4
  %37 = load i32, ptr %2, align 4
  %38 = load i32, ptr %3, align 4
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %3, align 4
  %41 = mul i32 %34, %35
  %42 = mul i32 %41, %36
  %43 = mul i32 %42, %37
  %44 = mul i32 %43, %38
  %45 = mul i32 %44, %39
  %46 = mul i32 %45, %40
  %47 = load i32, ptr %2, align 4
  %48 = shl i32 %47, 1
  %49 = load i32, ptr %3, align 4
  %50 = load i32, ptr %6, align 4
  %51 = mul i32 %49, %50
  %52 = shl i32 %51, 6
  %53 = add i32 %48, %46
  %54 = add i32 %53, %52
  %55 = add i32 %54, 4
  store i32 %55, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 -1, ptr %8, align 4
  %56 = load i32, ptr %2, align 4
  %57 = mul i32 %56, 1200
  %58 = add i32 %57, 1
  store i32 %58, ptr %9, align 4
  %59 = load i32, ptr %2, align 4
  %60 = load i32, ptr %4, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %64

62:                                               ; preds = %0
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %64

64:                                               ; preds = %62, %0
  ret i32 0
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @log(double noundef) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0"}
