; ModuleID = '1.c'
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
  %12 = call double @pow(double noundef %11, double noundef 3.000000e+00) #3
  %13 = load i32, ptr %2, align 4
  %14 = sitofp i32 %13 to double
  %15 = call double @pow(double noundef %14, double noundef 3.000000e+00) #3
  %16 = fadd double %12, %15
  %17 = load i32, ptr %2, align 4
  %18 = sitofp i32 %17 to double
  %19 = call double @pow(double noundef %18, double noundef 3.000000e+00) #3
  %20 = fadd double %16, %19
  %21 = fptosi double %20 to i32
  store i32 %21, ptr %5, align 4
  %22 = load i32, ptr %2, align 4
  %23 = sitofp i32 %22 to double
  %24 = load i32, ptr %3, align 4
  %25 = sitofp i32 %24 to double
  %26 = load i32, ptr %4, align 4
  %27 = sitofp i32 %26 to double
  %28 = call double @pow(double noundef %25, double noundef %27) #3
  %29 = call double @pow(double noundef %23, double noundef %28) #3
  %30 = fptosi double %29 to i32
  %31 = mul nsw i32 0, %30
  %32 = mul nsw i32 %31, 7000
  %33 = load i32, ptr %2, align 4
  %34 = mul nsw i32 %32, %33
  %35 = load i32, ptr %2, align 4
  %36 = mul nsw i32 %34, %35
  %37 = load i32, ptr %4, align 4
  %38 = or i32 %36, %37
  store i32 %38, ptr %6, align 4
  %39 = load i32, ptr %2, align 4
  %40 = load i32, ptr %3, align 4
  %41 = add nsw i32 %39, %40
  %42 = add nsw i32 %41, 7
  %43 = load i32, ptr %2, align 4
  %44 = load i32, ptr %3, align 4
  %45 = add nsw i32 %43, %44
  %46 = add nsw i32 %42, %45
  store i32 %46, ptr %7, align 4
  %47 = call double @log(double noundef 1.000000e+01) #3
  %48 = load i32, ptr %4, align 4
  %49 = sitofp i32 %48 to double
  %50 = fadd double %47, %49
  %51 = load i32, ptr %3, align 4
  %52 = sitofp i32 %51 to double
  %53 = fadd double %50, %52
  %54 = load i32, ptr %4, align 4
  %55 = sitofp i32 %54 to double
  %56 = fadd double %53, %55
  %57 = fadd double %56, 4.000000e+00
  %58 = load i32, ptr %3, align 4
  %59 = sitofp i32 %58 to double
  %60 = fadd double %57, %59
  %61 = load i32, ptr %4, align 4
  %62 = sitofp i32 %61 to double
  %63 = fadd double %60, %62
  %64 = fadd double %63, 2.000000e+00
  %65 = fadd double %64, 3.000000e+00
  %66 = fptosi double %65 to i32
  store i32 %66, ptr %2, align 4
  %67 = load i32, ptr %3, align 4
  %68 = load i32, ptr %2, align 4
  %69 = mul nsw i32 %67, %68
  %70 = load i32, ptr %3, align 4
  %71 = mul nsw i32 %69, %70
  %72 = load i32, ptr %2, align 4
  %73 = mul nsw i32 %71, %72
  %74 = load i32, ptr %3, align 4
  %75 = mul nsw i32 %73, %74
  %76 = load i32, ptr %3, align 4
  %77 = mul nsw i32 %75, %76
  %78 = load i32, ptr %3, align 4
  %79 = mul nsw i32 %77, %78
  %80 = mul nsw i32 %79, 1
  %81 = add nsw i32 2, %80
  %82 = load i32, ptr %2, align 4
  %83 = add nsw i32 %81, %82
  %84 = add nsw i32 %83, 2
  %85 = load i32, ptr %2, align 4
  %86 = add nsw i32 %84, %85
  %87 = load i32, ptr %3, align 4
  %88 = mul nsw i32 4, %87
  %89 = load i32, ptr %6, align 4
  %90 = mul nsw i32 %88, %89
  %91 = mul nsw i32 %90, 16
  %92 = add nsw i32 %86, %91
  %93 = and i32 %92, -1
  store i32 %93, ptr %3, align 4
  %94 = load i32, ptr %2, align 4
  %95 = load i32, ptr %3, align 4
  %96 = mul nsw i32 %94, %95
  %97 = load i32, ptr %2, align 4
  %98 = mul nsw i32 %96, %97
  %99 = load i32, ptr %3, align 4
  %100 = mul nsw i32 %98, %99
  %101 = mul nsw i32 %100, 5
  %102 = mul nsw i32 %101, 0
  store i32 %102, ptr %4, align 4
  %103 = load i32, ptr %4, align 4
  %104 = sitofp i32 %103 to double
  %105 = load i32, ptr %2, align 4
  %106 = sitofp i32 %105 to double
  %107 = call double @pow(double noundef %104, double noundef %106) #3
  %108 = fptosi double %107 to i32
  %109 = mul nsw i32 4, %108
  %110 = mul nsw i32 %109, 1
  %111 = or i32 %110, -1
  store i32 %111, ptr %8, align 4
  %112 = load i32, ptr %2, align 4
  %113 = mul nsw i32 3, %112
  %114 = mul nsw i32 %113, 400
  %115 = add nsw i32 %114, 0
  %116 = add nsw i32 %115, 1
  %117 = add nsw i32 %116, 0
  %118 = add nsw i32 %117, 0
  store i32 %118, ptr %9, align 4
  %119 = load i32, ptr %2, align 4
  %120 = add nsw i32 %119, 0
  %121 = load i32, ptr %4, align 4
  %122 = icmp slt i32 %120, %121
  br i1 %122, label %123, label %125

123:                                              ; preds = %0
  %124 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %125

125:                                              ; preds = %123, %0
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
