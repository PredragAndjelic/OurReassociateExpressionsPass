; ModuleID = '1.c'
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
  %2 = add nsw i32 %1, 1
  store i32 %2, ptr @x, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f() #0 {
  %1 = call i32 @next()
  %2 = call i32 @next()
  %3 = add nsw i32 %1, %2
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @p() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = load i32, ptr %2, align 4
  %5 = load i32, ptr %3, align 4
  %6 = mul nsw i32 %4, %5
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = mul nsw i32 %7, %8
  %10 = add nsw i32 %6, %9
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %10, %11
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %1, align 4
  ret i32 5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @q() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  store i32 17, ptr %1, align 4
  %3 = load i32, ptr %1, align 4
  %4 = mul nsw i32 4, %3
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
  %15 = call i32 @p()
  %16 = add nsw i32 %14, %15
  %17 = call i32 @p()
  %18 = add nsw i32 %16, %17
  %19 = call i32 @p()
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %2, align 4
  %21 = call double @q()
  %22 = call double @q()
  %23 = fadd double %21, %22
  %24 = load i32, ptr %2, align 4
  %25 = sitofp i32 %24 to double
  %26 = fadd double %23, %25
  %27 = fadd double %26, 1.000000e+00
  %28 = load i32, ptr %2, align 4
  %29 = sitofp i32 %28 to double
  %30 = fadd double %27, %29
  %31 = load i32, ptr %2, align 4
  %32 = sitofp i32 %31 to double
  %33 = call double @pow(double noundef %32, double noundef 4.000000e+00) #3
  %34 = fadd double %30, %33
  %35 = call double @q()
  %36 = fadd double %34, %35
  %37 = load i32, ptr %2, align 4
  %38 = sitofp i32 %37 to double
  %39 = call double @pow(double noundef %38, double noundef 4.000000e+00) #3
  %40 = fadd double %36, %39
  %41 = fptosi double %40 to i32
  store i32 %41, ptr %3, align 4
  %42 = load i32, ptr %4, align 4
  %43 = sitofp i32 %42 to double
  %44 = load i32, ptr %5, align 4
  %45 = sitofp i32 %44 to double
  %46 = call double @pow(double noundef %43, double noundef %45) #3
  %47 = load i32, ptr %4, align 4
  %48 = sitofp i32 %47 to double
  %49 = load i32, ptr %5, align 4
  %50 = sitofp i32 %49 to double
  %51 = call double @pow(double noundef %48, double noundef %50) #3
  %52 = fadd double %46, %51
  %53 = fptosi double %52 to i32
  store i32 %53, ptr %7, align 4
  %54 = call i32 @next()
  %55 = load i32, ptr %4, align 4
  %56 = add nsw i32 %54, %55
  %57 = load i32, ptr %5, align 4
  %58 = add nsw i32 %56, %57
  %59 = call i32 @next()
  %60 = load i32, ptr %4, align 4
  %61 = mul nsw i32 %59, %60
  %62 = add nsw i32 %58, %61
  %63 = load i32, ptr %4, align 4
  %64 = mul nsw i32 3, %63
  %65 = add nsw i32 %62, %64
  %66 = call i32 @next()
  %67 = add nsw i32 %65, %66
  %68 = call i32 @next()
  %69 = add nsw i32 %67, %68
  %70 = add nsw i32 %69, 0
  %71 = call i32 @next()
  %72 = load i32, ptr %4, align 4
  %73 = mul nsw i32 %71, %72
  %74 = add nsw i32 %70, %73
  store i32 %74, ptr %8, align 4
  %75 = load i32, ptr %4, align 4
  %76 = sitofp i32 %75 to double
  %77 = call double @pow(double noundef %76, double noundef 3.000000e+00) #3
  %78 = load i32, ptr %4, align 4
  %79 = sitofp i32 %78 to double
  %80 = call double @pow(double noundef %79, double noundef 3.000000e+00) #3
  %81 = fadd double %77, %80
  %82 = load i32, ptr %4, align 4
  %83 = sitofp i32 %82 to double
  %84 = call double @pow(double noundef %83, double noundef 3.000000e+00) #3
  %85 = fadd double %81, %84
  %86 = fptosi double %85 to i32
  store i32 %86, ptr %9, align 4
  %87 = load i32, ptr %4, align 4
  %88 = sitofp i32 %87 to double
  %89 = load i32, ptr %5, align 4
  %90 = sitofp i32 %89 to double
  %91 = load i32, ptr %6, align 4
  %92 = sitofp i32 %91 to double
  %93 = call double @pow(double noundef %90, double noundef %92) #3
  %94 = call double @pow(double noundef %88, double noundef %93) #3
  %95 = fptosi double %94 to i32
  %96 = mul nsw i32 0, %95
  %97 = mul nsw i32 %96, 7000
  %98 = load i32, ptr %4, align 4
  %99 = mul nsw i32 %97, %98
  %100 = load i32, ptr %4, align 4
  %101 = mul nsw i32 %99, %100
  %102 = load i32, ptr %6, align 4
  %103 = or i32 %101, %102
  store i32 %103, ptr %10, align 4
  %104 = load i32, ptr %4, align 4
  %105 = load i32, ptr %5, align 4
  %106 = add nsw i32 %104, %105
  %107 = add nsw i32 %106, 7
  %108 = load i32, ptr %4, align 4
  %109 = load i32, ptr %5, align 4
  %110 = add nsw i32 %108, %109
  %111 = add nsw i32 %107, %110
  store i32 %111, ptr %11, align 4
  %112 = call double @log(double noundef 1.000000e+01) #3
  %113 = load i32, ptr %6, align 4
  %114 = sitofp i32 %113 to double
  %115 = fadd double %112, %114
  %116 = load i32, ptr %5, align 4
  %117 = sitofp i32 %116 to double
  %118 = fadd double %115, %117
  %119 = load i32, ptr %6, align 4
  %120 = sitofp i32 %119 to double
  %121 = fadd double %118, %120
  %122 = fadd double %121, 4.000000e+00
  %123 = load i32, ptr %5, align 4
  %124 = sitofp i32 %123 to double
  %125 = fadd double %122, %124
  %126 = load i32, ptr %6, align 4
  %127 = sitofp i32 %126 to double
  %128 = fadd double %125, %127
  %129 = fadd double %128, 2.000000e+00
  %130 = fadd double %129, 3.000000e+00
  %131 = fptosi double %130 to i32
  store i32 %131, ptr %4, align 4
  %132 = load i32, ptr %5, align 4
  %133 = load i32, ptr %4, align 4
  %134 = mul nsw i32 %132, %133
  %135 = load i32, ptr %5, align 4
  %136 = mul nsw i32 %134, %135
  %137 = load i32, ptr %4, align 4
  %138 = mul nsw i32 %136, %137
  %139 = load i32, ptr %5, align 4
  %140 = mul nsw i32 %138, %139
  %141 = load i32, ptr %5, align 4
  %142 = mul nsw i32 %140, %141
  %143 = load i32, ptr %5, align 4
  %144 = mul nsw i32 %142, %143
  %145 = mul nsw i32 %144, 1
  %146 = add nsw i32 2, %145
  %147 = load i32, ptr %4, align 4
  %148 = add nsw i32 %146, %147
  %149 = add nsw i32 %148, 2
  %150 = load i32, ptr %4, align 4
  %151 = add nsw i32 %149, %150
  %152 = load i32, ptr %5, align 4
  %153 = mul nsw i32 4, %152
  %154 = load i32, ptr %10, align 4
  %155 = mul nsw i32 %153, %154
  %156 = mul nsw i32 %155, 16
  %157 = add nsw i32 %151, %156
  %158 = and i32 %157, -1
  store i32 %158, ptr %5, align 4
  %159 = load i32, ptr %4, align 4
  %160 = load i32, ptr %5, align 4
  %161 = mul nsw i32 %159, %160
  %162 = load i32, ptr %4, align 4
  %163 = mul nsw i32 %161, %162
  %164 = load i32, ptr %5, align 4
  %165 = mul nsw i32 %163, %164
  %166 = mul nsw i32 %165, 5
  %167 = mul nsw i32 %166, 0
  store i32 %167, ptr %6, align 4
  %168 = load i32, ptr %6, align 4
  %169 = sitofp i32 %168 to double
  %170 = load i32, ptr %4, align 4
  %171 = sitofp i32 %170 to double
  %172 = call double @pow(double noundef %169, double noundef %171) #3
  %173 = fptosi double %172 to i32
  %174 = mul nsw i32 4, %173
  %175 = mul nsw i32 %174, 1
  %176 = or i32 %175, -1
  store i32 %176, ptr %12, align 4
  %177 = load i32, ptr %4, align 4
  %178 = mul nsw i32 3, %177
  %179 = mul nsw i32 %178, 400
  %180 = add nsw i32 %179, 0
  %181 = add nsw i32 %180, 1
  %182 = add nsw i32 %181, 0
  %183 = add nsw i32 %182, 0
  store i32 %183, ptr %13, align 4
  %184 = load i32, ptr %4, align 4
  %185 = add nsw i32 %184, 0
  %186 = load i32, ptr %6, align 4
  %187 = icmp slt i32 %185, %186
  br i1 %187, label %188, label %190

188:                                              ; preds = %0
  %189 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %190

190:                                              ; preds = %188, %0
  %191 = call i32 @f()
  %192 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %191)
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
