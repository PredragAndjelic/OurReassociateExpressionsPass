; ModuleID = '/home/strahinjas/llvm-project/llvm/lib/Transforms/OurReassociateExpressionsPass/1.ll'
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
  %15 = load i32, ptr %2, align 4
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, %16
  %18 = fmul double %17, %16
  %19 = load i32, ptr %2, align 4
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, %20
  %22 = fmul double %21, %20
  %23 = fptosi double %14 to i32
  store i32 %23, ptr %5, align 4
  %24 = load i32, ptr %2, align 4
  %25 = sitofp i32 %24 to double
  %26 = load i32, ptr %3, align 4
  %27 = sitofp i32 %26 to double
  %28 = load i32, ptr %4, align 4
  %29 = sitofp i32 %28 to double
  %30 = call double @pow(double noundef %27, double noundef %29) #3
  %31 = call double @pow(double noundef %25, double noundef %30) #3
  %32 = fptosi double %31 to i32
  %33 = load i32, ptr %2, align 4
  %34 = load i32, ptr %2, align 4
  %35 = mul i32 %32, %33
  %36 = mul i32 %35, %34
  %37 = mul i32 %36, 0
  %38 = load i32, ptr %4, align 4
  %39 = or i32 %37, %38
  store i32 %39, ptr %6, align 4
  %40 = load i32, ptr %2, align 4
  %41 = shl i32 %40, 1
  %42 = load i32, ptr %3, align 4
  %43 = shl i32 %42, 1
  %44 = load i32, ptr %2, align 4
  %45 = load i32, ptr %3, align 4
  %46 = add i32 %43, %41
  %47 = add i32 %46, 7
  store i32 %47, ptr %7, align 4
  %48 = call double @log(double noundef 1.000000e+01) #3
  %49 = load i32, ptr %4, align 4
  %50 = sitofp i32 %49 to double
  %51 = fmul double %50, 3.000000e+00
  %52 = load i32, ptr %3, align 4
  %53 = sitofp i32 %52 to double
  %54 = fmul double %53, 2.000000e+00
  %55 = load i32, ptr %4, align 4
  %56 = sitofp i32 %55 to double
  %57 = load i32, ptr %3, align 4
  %58 = sitofp i32 %57 to double
  %59 = load i32, ptr %4, align 4
  %60 = sitofp i32 %59 to double
  %61 = fadd double %54, %51
  %62 = fadd double %61, %48
  %63 = fadd double %62, 9.000000e+00
  %64 = fptosi double %63 to i32
  store i32 %64, ptr %2, align 4
  %65 = load i32, ptr %3, align 4
  %66 = load i32, ptr %2, align 4
  %67 = load i32, ptr %3, align 4
  %68 = load i32, ptr %2, align 4
  %69 = load i32, ptr %3, align 4
  %70 = load i32, ptr %3, align 4
  %71 = load i32, ptr %3, align 4
  %72 = mul i32 %65, %66
  %73 = mul i32 %72, %67
  %74 = mul i32 %73, %68
  %75 = mul i32 %74, %69
  %76 = mul i32 %75, %70
  %77 = mul i32 %76, %71
  %78 = mul i32 %77, 1
  %79 = load i32, ptr %2, align 4
  %80 = shl i32 %79, 1
  %81 = load i32, ptr %2, align 4
  %82 = load i32, ptr %3, align 4
  %83 = load i32, ptr %6, align 4
  %84 = mul i32 %82, %83
  %85 = shl i32 %84, 6
  %86 = add i32 %80, %78
  %87 = add i32 %86, %85
  %88 = add i32 %87, 4
  %89 = and i32 %88, -1
  store i32 %89, ptr %3, align 4
  %90 = load i32, ptr %2, align 4
  %91 = load i32, ptr %3, align 4
  %92 = load i32, ptr %2, align 4
  %93 = load i32, ptr %3, align 4
  %94 = mul i32 %90, %91
  %95 = mul i32 %94, %92
  %96 = mul i32 %95, %93
  %97 = mul i32 %96, 0
  store i32 %97, ptr %4, align 4
  %98 = load i32, ptr %4, align 4
  %99 = sitofp i32 %98 to double
  %100 = load i32, ptr %2, align 4
  %101 = sitofp i32 %100 to double
  %102 = call double @pow(double noundef %99, double noundef %101) #3
  %103 = fptosi double %102 to i32
  %104 = shl i32 %103, 2
  %105 = or i32 %104, -1
  store i32 %105, ptr %8, align 4
  %106 = load i32, ptr %2, align 4
  %107 = mul i32 %106, 1200
  %108 = add i32 %107, 1
  store i32 %108, ptr %9, align 4
  %109 = load i32, ptr %2, align 4
  %110 = add i32 %109, 0
  %111 = load i32, ptr %4, align 4
  %112 = icmp slt i32 %110, %111
  br i1 %112, label %113, label %115

113:                                              ; preds = %0
  %114 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %115

115:                                              ; preds = %113, %0
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
