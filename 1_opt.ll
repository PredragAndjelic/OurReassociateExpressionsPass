; ModuleID = '1.ll'
source_filename = "1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
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
  %4 = load i32, ptr %2, align 4
  %5 = load i32, ptr %3, align 4
  %6 = mul i32 %4, %5
  %7 = shl i32 %6, 1
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add i32 %7, %8
  %11 = add i32 %10, %9
  store i32 %11, ptr %1, align 4
  %12 = load i32, ptr @x, align 4
  %13 = add i32 %12, 5
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @new_p() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = load i32, ptr %1, align 4
  %8 = load i32, ptr %2, align 4
  %9 = load i32, ptr @x, align 4
  %10 = add i32 %9, 1
  store i32 %10, ptr @x, align 4
  %11 = mul i32 %10, %7
  %12 = mul i32 %11, %8
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %4, align 4
  %14 = shl i32 %13, 1
  store i32 %14, ptr %5, align 4
  %15 = load i32, ptr %1, align 4
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr @x, align 4
  %18 = add i32 %17, 1
  store i32 %18, ptr @x, align 4
  %19 = mul i32 %15, %16
  %20 = mul i32 %19, %17
  %21 = load i32, ptr %1, align 4
  %22 = load i32, ptr %2, align 4
  %23 = load i32, ptr @x, align 4
  %24 = add i32 %23, 1
  store i32 %24, ptr @x, align 4
  %25 = mul i32 %21, %22
  %26 = mul i32 %25, %23
  %27 = add i32 %20, %26
  store i32 %27, ptr %6, align 4
  %28 = load i32, ptr @x, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr @x, align 4
  %30 = add i32 %29, 5
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @new_f() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 7, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  %5 = shl i32 %4, 1
  store i32 %5, ptr %2, align 4
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %1, align 4
  %8 = add i32 %6, %7
  ret i32 %8
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @q() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  store i32 17, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  %5 = shl i32 %4, 2
  %6 = sitofp i32 %5 to double
  store double %6, ptr %2, align 8
  %7 = load i32, ptr @x, align 4
  store i32 %7, ptr %3, align 4
  %8 = load i32, ptr %3, align 4
  %9 = add i32 %8, 2
  ret i32 %9
}

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
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %17 = call i32 @p()
  %18 = shl i32 %17, 1
  %19 = call i32 @q()
  %20 = shl i32 %19, 1
  %21 = add i32 %20, %18
  store i32 %21, ptr %2, align 4
  %22 = call i32 @new_p()
  %23 = call i32 @p()
  %24 = call i32 @new_p()
  %25 = call i32 @p()
  %26 = add i32 %22, %23
  %27 = add i32 %26, %24
  %28 = add i32 %27, %25
  store i32 %28, ptr %3, align 4
  %29 = call i32 @q()
  %30 = mul i32 %29, 3
  %31 = load i32, ptr %2, align 4
  %32 = shl i32 %31, 1
  %33 = add i32 %32, %30
  %34 = add i32 %33, 1
  %35 = sitofp i32 %34 to double
  %36 = load i32, ptr %2, align 4
  %37 = sitofp i32 %36 to double
  %38 = fmul double %37, %37
  %39 = fmul double %38, %37
  %40 = fmul double %39, %37
  %41 = load i32, ptr %2, align 4
  %42 = sitofp i32 %41 to double
  %43 = fmul double %42, %42
  %44 = fmul double %43, %42
  %45 = fmul double %44, %42
  %46 = fadd double %35, %40
  %47 = fadd double %46, %45
  %48 = fptosi double %47 to i32
  store i32 %48, ptr %4, align 4
  %49 = call i32 @new_f()
  %50 = call i32 @p()
  %51 = shl i32 %50, 2
  %52 = load i32, ptr %2, align 4
  %53 = load i32, ptr %4, align 4
  %54 = mul i32 %52, %53
  %55 = call i32 @new_f()
  %56 = add i32 %51, %54
  %57 = add i32 %56, %49
  %58 = add i32 %57, %55
  %59 = add i32 %58, 4
  store i32 %59, ptr %5, align 4
  %60 = load i32, ptr %8, align 4
  %61 = sitofp i32 %60 to double
  %62 = load i32, ptr %7, align 4
  %63 = sitofp i32 %62 to double
  %64 = call double @pow(double noundef %61, double noundef %63) #3
  %65 = call i32 @p()
  %66 = sitofp i32 %65 to double
  %67 = fmul double %66, 4.000000e+00
  %68 = load i32, ptr %8, align 4
  %69 = sitofp i32 %68 to double
  %70 = load i32, ptr %7, align 4
  %71 = sitofp i32 %70 to double
  %72 = call double @pow(double noundef %69, double noundef %71) #3
  %73 = fadd double %67, %64
  %74 = fadd double %73, %72
  %75 = fptosi double %74 to i32
  store i32 %75, ptr %9, align 4
  %76 = load i32, ptr %6, align 4
  %77 = sitofp i32 %76 to double
  %78 = load i32, ptr %7, align 4
  %79 = sitofp i32 %78 to double
  %80 = call double @pow(double noundef %77, double noundef %79) #3
  %81 = load i32, ptr %6, align 4
  %82 = sitofp i32 %81 to double
  %83 = load i32, ptr %7, align 4
  %84 = sitofp i32 %83 to double
  %85 = call double @pow(double noundef %82, double noundef %84) #3
  %86 = fadd double %80, %85
  %87 = fptosi double %86 to i32
  store i32 %87, ptr %10, align 4
  %88 = call i32 @next()
  %89 = load i32, ptr %6, align 4
  %90 = load i32, ptr %7, align 4
  %91 = call i32 @next()
  %92 = load i32, ptr %6, align 4
  %93 = mul i32 %91, %92
  %94 = load i32, ptr %6, align 4
  %95 = mul i32 %94, 3
  %96 = call i32 @next()
  %97 = call i32 @next()
  %98 = call i32 @next()
  %99 = load i32, ptr %6, align 4
  %100 = mul i32 %98, %99
  %101 = add i32 %93, %95
  %102 = add i32 %101, %100
  %103 = add i32 %102, %88
  %104 = add i32 %103, %89
  %105 = add i32 %104, %90
  %106 = add i32 %105, %96
  %107 = add i32 %106, %97
  store i32 %107, ptr %11, align 4
  %108 = load i32, ptr %6, align 4
  %109 = sitofp i32 %108 to double
  %110 = fmul double %109, %109
  %111 = fmul double %110, %109
  %112 = load i32, ptr %6, align 4
  %113 = sitofp i32 %112 to double
  %114 = fmul double %113, %113
  %115 = fmul double %114, %113
  %116 = load i32, ptr %6, align 4
  %117 = sitofp i32 %116 to double
  %118 = fmul double %117, %117
  %119 = fmul double %118, %117
  %120 = fadd double %111, %115
  %121 = fadd double %120, %119
  %122 = fptosi double %121 to i32
  store i32 %122, ptr %12, align 4
  %123 = load i32, ptr %8, align 4
  store i32 %123, ptr %13, align 4
  %124 = load i32, ptr %6, align 4
  %125 = shl i32 %124, 1
  %126 = load i32, ptr %7, align 4
  %127 = shl i32 %126, 1
  %128 = add i32 %127, %125
  %129 = add i32 %128, 7
  store i32 %129, ptr %14, align 4
  %130 = call double @log(double noundef 1.000000e+01) #3
  %131 = load i32, ptr %8, align 4
  %132 = sitofp i32 %131 to double
  %133 = fmul double %132, 3.000000e+00
  %134 = load i32, ptr %7, align 4
  %135 = sitofp i32 %134 to double
  %136 = fmul double %135, 2.000000e+00
  %137 = fadd double %136, %133
  %138 = fadd double %137, %130
  %139 = fadd double %138, 9.000000e+00
  %140 = fptosi double %139 to i32
  store i32 %140, ptr %6, align 4
  %141 = load i32, ptr %7, align 4
  %142 = load i32, ptr %6, align 4
  %143 = load i32, ptr %7, align 4
  %144 = load i32, ptr %6, align 4
  %145 = load i32, ptr %7, align 4
  %146 = load i32, ptr %7, align 4
  %147 = load i32, ptr %7, align 4
  %148 = mul i32 %141, %142
  %149 = mul i32 %148, %143
  %150 = mul i32 %149, %144
  %151 = mul i32 %150, %145
  %152 = mul i32 %151, %146
  %153 = mul i32 %152, %147
  %154 = load i32, ptr %6, align 4
  %155 = shl i32 %154, 1
  %156 = load i32, ptr %7, align 4
  %157 = load i32, ptr %13, align 4
  %158 = mul i32 %156, %157
  %159 = shl i32 %158, 6
  %160 = add i32 %155, %153
  %161 = add i32 %160, %159
  %162 = add i32 %161, 4
  store i32 %162, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 -1, ptr %15, align 4
  %163 = load i32, ptr %6, align 4
  %164 = mul i32 %163, 1200
  %165 = add i32 %164, 1
  store i32 %165, ptr %16, align 4
  %166 = load i32, ptr %6, align 4
  %167 = load i32, ptr %8, align 4
  %168 = icmp slt i32 %166, %167
  br i1 %168, label %169, label %171

169:                                              ; preds = %0
  %170 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %171

171:                                              ; preds = %169, %0
  %172 = call i32 @f()
  %173 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %172)
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
