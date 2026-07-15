; ModuleID = '1.ll'
source_filename = "1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"da\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @next() #0 {
  %1 = load i32, ptr @x, align 4
  %2 = add i32 %1, 1
  store i32 %2, ptr @x, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f() #0 {
  %1 = call i32 @next()
  %2 = call i32 @next()
  %3 = add i32 %1, %2
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @p() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  ret i32 5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @q() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  store i32 17, ptr %1, align 4
  %3 = load i32, ptr %1, align 4
  %4 = shl i32 %3, 2
  %5 = sitofp i32 %4 to double
  store double %5, ptr %2, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %7 = load double, ptr %2, align 8
  ret double %7
}

declare i32 @printf(ptr noundef, ...) #1

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
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %14 = call i32 @p()
  %15 = shl i32 %14, 2
  store i32 %15, ptr %2, align 4
  %16 = call double @q()
  %17 = call double @q()
  %18 = load i32, ptr %2, align 4
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 2.000000e+00
  %21 = load i32, ptr %2, align 4
  %22 = sitofp i32 %21 to double
  %23 = fmul double %22, %22
  %24 = fmul double %23, %22
  %25 = fmul double %24, %22
  %26 = call double @q()
  %27 = load i32, ptr %2, align 4
  %28 = sitofp i32 %27 to double
  %29 = fmul double %28, %28
  %30 = fmul double %29, %28
  %31 = fmul double %30, %28
  %32 = fadd double %20, %16
  %33 = fadd double %32, %17
  %34 = fadd double %33, %25
  %35 = fadd double %34, %26
  %36 = fadd double %35, %31
  %37 = fadd double %36, 1.000000e+00
  %38 = fptosi double %37 to i32
  store i32 %38, ptr %3, align 4
  %39 = load i32, ptr %4, align 4
  %40 = sitofp i32 %39 to double
  %41 = load i32, ptr %5, align 4
  %42 = sitofp i32 %41 to double
  %43 = call double @pow(double noundef %40, double noundef %42) #3
  %44 = load i32, ptr %4, align 4
  %45 = sitofp i32 %44 to double
  %46 = load i32, ptr %5, align 4
  %47 = sitofp i32 %46 to double
  %48 = call double @pow(double noundef %45, double noundef %47) #3
  %49 = fadd double %43, %48
  %50 = fptosi double %49 to i32
  store i32 %50, ptr %7, align 4
  %51 = call i32 @next()
  %52 = load i32, ptr %4, align 4
  %53 = load i32, ptr %5, align 4
  %54 = call i32 @next()
  %55 = load i32, ptr %4, align 4
  %56 = mul i32 %54, %55
  %57 = load i32, ptr %4, align 4
  %58 = mul i32 %57, 3
  %59 = call i32 @next()
  %60 = call i32 @next()
  %61 = call i32 @next()
  %62 = load i32, ptr %4, align 4
  %63 = mul i32 %61, %62
  %64 = add i32 %56, %58
  %65 = add i32 %64, %63
  %66 = add i32 %65, %51
  %67 = add i32 %66, %52
  %68 = add i32 %67, %53
  %69 = add i32 %68, %59
  %70 = add i32 %69, %60
  store i32 %70, ptr %8, align 4
  %71 = load i32, ptr %4, align 4
  %72 = sitofp i32 %71 to double
  %73 = fmul double %72, %72
  %74 = fmul double %73, %72
  %75 = load i32, ptr %4, align 4
  %76 = sitofp i32 %75 to double
  %77 = fmul double %76, %76
  %78 = fmul double %77, %76
  %79 = load i32, ptr %4, align 4
  %80 = sitofp i32 %79 to double
  %81 = fmul double %80, %80
  %82 = fmul double %81, %80
  %83 = fadd double %74, %78
  %84 = fadd double %83, %82
  %85 = fptosi double %84 to i32
  store i32 %85, ptr %9, align 4
  %86 = load i32, ptr %6, align 4
  store i32 %86, ptr %10, align 4
  %87 = load i32, ptr %4, align 4
  %88 = shl i32 %87, 1
  %89 = load i32, ptr %5, align 4
  %90 = shl i32 %89, 1
  %91 = add i32 %90, %88
  %92 = add i32 %91, 7
  store i32 %92, ptr %11, align 4
  %93 = call double @log(double noundef 1.000000e+01) #3
  %94 = load i32, ptr %6, align 4
  %95 = sitofp i32 %94 to double
  %96 = fmul double %95, 3.000000e+00
  %97 = load i32, ptr %5, align 4
  %98 = sitofp i32 %97 to double
  %99 = fmul double %98, 2.000000e+00
  %100 = fadd double %99, %96
  %101 = fadd double %100, %93
  %102 = fadd double %101, 9.000000e+00
  %103 = fptosi double %102 to i32
  store i32 %103, ptr %4, align 4
  %104 = load i32, ptr %5, align 4
  %105 = load i32, ptr %4, align 4
  %106 = load i32, ptr %5, align 4
  %107 = load i32, ptr %4, align 4
  %108 = load i32, ptr %5, align 4
  %109 = load i32, ptr %5, align 4
  %110 = load i32, ptr %5, align 4
  %111 = mul i32 %104, %105
  %112 = mul i32 %111, %106
  %113 = mul i32 %112, %107
  %114 = mul i32 %113, %108
  %115 = mul i32 %114, %109
  %116 = mul i32 %115, %110
  %117 = load i32, ptr %4, align 4
  %118 = shl i32 %117, 1
  %119 = load i32, ptr %5, align 4
  %120 = load i32, ptr %10, align 4
  %121 = mul i32 %119, %120
  %122 = shl i32 %121, 6
  %123 = add i32 %118, %116
  %124 = add i32 %123, %122
  %125 = add i32 %124, 4
  store i32 %125, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 -1, ptr %12, align 4
  %126 = load i32, ptr %4, align 4
  %127 = mul i32 %126, 1200
  %128 = add i32 %127, 1
  store i32 %128, ptr %13, align 4
  %129 = load i32, ptr %4, align 4
  %130 = load i32, ptr %6, align 4
  %131 = icmp slt i32 %129, %130
  br i1 %131, label %132, label %134

132:                                              ; preds = %0
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %134

134:                                              ; preds = %132, %0
  %135 = call i32 @f()
  %136 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %135)
  ret i32 0
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #2

; Function Attrs: nounwind
declare double @log(double noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0"}
