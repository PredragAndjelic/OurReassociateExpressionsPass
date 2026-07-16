; ModuleID = '1.c'
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
  %15 = load i32, ptr @x, align 4
  %16 = add nsw i32 5, %15
  ret i32 %16
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
  %9 = mul nsw i32 %7, %8
  %10 = load i32, ptr @x, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr @x, align 4
  %12 = mul nsw i32 %9, %11
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %5, align 4
  %16 = load i32, ptr %1, align 4
  %17 = load i32, ptr %2, align 4
  %18 = mul nsw i32 %16, %17
  %19 = load i32, ptr @x, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr @x, align 4
  %21 = mul nsw i32 %18, %19
  %22 = load i32, ptr %1, align 4
  %23 = load i32, ptr %2, align 4
  %24 = mul nsw i32 %22, %23
  %25 = load i32, ptr @x, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr @x, align 4
  %27 = mul nsw i32 %24, %25
  %28 = add nsw i32 %21, %27
  store i32 %28, ptr %6, align 4
  %29 = load i32, ptr @x, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr @x, align 4
  %31 = add nsw i32 5, %30
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @new_f() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 7, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr %1, align 4
  %6 = add nsw i32 %4, %5
  store i32 %6, ptr %2, align 4
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %1, align 4
  %9 = add nsw i32 %7, %8
  ret i32 %9
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @q() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  store i32 17, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  %5 = mul nsw i32 4, %4
  %6 = sitofp i32 %5 to double
  store double %6, ptr %2, align 8
  %7 = load i32, ptr @x, align 4
  store i32 %7, ptr %3, align 4
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 2
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
  %18 = call i32 @q()
  %19 = add nsw i32 %17, %18
  %20 = call i32 @p()
  %21 = add nsw i32 %19, %20
  %22 = call i32 @q()
  %23 = add nsw i32 %21, %22
  store i32 %23, ptr %2, align 4
  %24 = call i32 @new_p()
  %25 = call i32 @p()
  %26 = add nsw i32 %24, %25
  %27 = call i32 @new_p()
  %28 = add nsw i32 %26, %27
  %29 = call i32 @p()
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %3, align 4
  %31 = call i32 @q()
  %32 = call i32 @q()
  %33 = add nsw i32 %31, %32
  %34 = load i32, ptr %2, align 4
  %35 = add nsw i32 %33, %34
  %36 = add nsw i32 %35, 1
  %37 = load i32, ptr %2, align 4
  %38 = add nsw i32 %36, %37
  %39 = call i32 @q()
  %40 = add nsw i32 %38, %39
  %41 = sitofp i32 %40 to double
  %42 = load i32, ptr %2, align 4
  %43 = sitofp i32 %42 to double
  %44 = call double @pow(double noundef %43, double noundef 4.000000e+00) #3
  %45 = fadd double %41, %44
  %46 = load i32, ptr %2, align 4
  %47 = sitofp i32 %46 to double
  %48 = call double @pow(double noundef %47, double noundef 4.000000e+00) #3
  %49 = fadd double %45, %48
  %50 = fptosi double %49 to i32
  store i32 %50, ptr %4, align 4
  %51 = call i32 @new_f()
  %52 = call i32 @p()
  %53 = add nsw i32 %51, %52
  %54 = call i32 @p()
  %55 = add nsw i32 %53, %54
  %56 = add nsw i32 %55, 4
  %57 = load i32, ptr %2, align 4
  %58 = load i32, ptr %4, align 4
  %59 = mul nsw i32 %57, %58
  %60 = add nsw i32 %56, %59
  %61 = call i32 @p()
  %62 = add nsw i32 %60, %61
  %63 = call i32 @new_f()
  %64 = add nsw i32 %62, %63
  %65 = call i32 @p()
  %66 = add nsw i32 %64, %65
  store i32 %66, ptr %5, align 4
  %67 = load i32, ptr %8, align 4
  %68 = sitofp i32 %67 to double
  %69 = load i32, ptr %7, align 4
  %70 = sitofp i32 %69 to double
  %71 = call double @pow(double noundef %68, double noundef %70) #3
  %72 = call i32 @p()
  %73 = sitofp i32 %72 to double
  %74 = fadd double %71, %73
  %75 = load i32, ptr %8, align 4
  %76 = sitofp i32 %75 to double
  %77 = load i32, ptr %7, align 4
  %78 = sitofp i32 %77 to double
  %79 = call double @pow(double noundef %76, double noundef %78) #3
  %80 = fadd double %74, %79
  %81 = call i32 @p()
  %82 = sitofp i32 %81 to double
  %83 = fadd double %80, %82
  %84 = call i32 @p()
  %85 = sitofp i32 %84 to double
  %86 = fadd double %83, %85
  %87 = call i32 @p()
  %88 = sitofp i32 %87 to double
  %89 = fadd double %86, %88
  %90 = fptosi double %89 to i32
  store i32 %90, ptr %9, align 4
  %91 = load i32, ptr %6, align 4
  %92 = sitofp i32 %91 to double
  %93 = load i32, ptr %7, align 4
  %94 = sitofp i32 %93 to double
  %95 = call double @pow(double noundef %92, double noundef %94) #3
  %96 = load i32, ptr %6, align 4
  %97 = sitofp i32 %96 to double
  %98 = load i32, ptr %7, align 4
  %99 = sitofp i32 %98 to double
  %100 = call double @pow(double noundef %97, double noundef %99) #3
  %101 = fadd double %95, %100
  %102 = fptosi double %101 to i32
  store i32 %102, ptr %10, align 4
  %103 = call i32 @next()
  %104 = load i32, ptr %6, align 4
  %105 = add nsw i32 %103, %104
  %106 = load i32, ptr %7, align 4
  %107 = add nsw i32 %105, %106
  %108 = call i32 @next()
  %109 = load i32, ptr %6, align 4
  %110 = mul nsw i32 %108, %109
  %111 = add nsw i32 %107, %110
  %112 = load i32, ptr %6, align 4
  %113 = mul nsw i32 3, %112
  %114 = add nsw i32 %111, %113
  %115 = call i32 @next()
  %116 = add nsw i32 %114, %115
  %117 = call i32 @next()
  %118 = add nsw i32 %116, %117
  %119 = add nsw i32 %118, 0
  %120 = call i32 @next()
  %121 = load i32, ptr %6, align 4
  %122 = mul nsw i32 %120, %121
  %123 = add nsw i32 %119, %122
  store i32 %123, ptr %11, align 4
  %124 = load i32, ptr %6, align 4
  %125 = sitofp i32 %124 to double
  %126 = call double @pow(double noundef %125, double noundef 3.000000e+00) #3
  %127 = load i32, ptr %6, align 4
  %128 = sitofp i32 %127 to double
  %129 = call double @pow(double noundef %128, double noundef 3.000000e+00) #3
  %130 = fadd double %126, %129
  %131 = load i32, ptr %6, align 4
  %132 = sitofp i32 %131 to double
  %133 = call double @pow(double noundef %132, double noundef 3.000000e+00) #3
  %134 = fadd double %130, %133
  %135 = fptosi double %134 to i32
  store i32 %135, ptr %12, align 4
  %136 = load i32, ptr %6, align 4
  %137 = sitofp i32 %136 to double
  %138 = load i32, ptr %7, align 4
  %139 = sitofp i32 %138 to double
  %140 = load i32, ptr %8, align 4
  %141 = sitofp i32 %140 to double
  %142 = call double @pow(double noundef %139, double noundef %141) #3
  %143 = call double @pow(double noundef %137, double noundef %142) #3
  %144 = fptosi double %143 to i32
  %145 = mul nsw i32 0, %144
  %146 = mul nsw i32 %145, 7000
  %147 = load i32, ptr %6, align 4
  %148 = mul nsw i32 %146, %147
  %149 = load i32, ptr %6, align 4
  %150 = mul nsw i32 %148, %149
  %151 = load i32, ptr %8, align 4
  %152 = or i32 %150, %151
  store i32 %152, ptr %13, align 4
  %153 = load i32, ptr %6, align 4
  %154 = load i32, ptr %7, align 4
  %155 = add nsw i32 %153, %154
  %156 = add nsw i32 %155, 7
  %157 = load i32, ptr %6, align 4
  %158 = load i32, ptr %7, align 4
  %159 = add nsw i32 %157, %158
  %160 = add nsw i32 %156, %159
  store i32 %160, ptr %14, align 4
  %161 = call double @log(double noundef 1.000000e+01) #3
  %162 = load i32, ptr %8, align 4
  %163 = sitofp i32 %162 to double
  %164 = fadd double %161, %163
  %165 = load i32, ptr %7, align 4
  %166 = sitofp i32 %165 to double
  %167 = fadd double %164, %166
  %168 = load i32, ptr %8, align 4
  %169 = sitofp i32 %168 to double
  %170 = fadd double %167, %169
  %171 = fadd double %170, 4.000000e+00
  %172 = load i32, ptr %7, align 4
  %173 = sitofp i32 %172 to double
  %174 = fadd double %171, %173
  %175 = load i32, ptr %8, align 4
  %176 = sitofp i32 %175 to double
  %177 = fadd double %174, %176
  %178 = fadd double %177, 2.000000e+00
  %179 = fadd double %178, 3.000000e+00
  %180 = fptosi double %179 to i32
  store i32 %180, ptr %6, align 4
  %181 = load i32, ptr %7, align 4
  %182 = load i32, ptr %6, align 4
  %183 = mul nsw i32 %181, %182
  %184 = load i32, ptr %7, align 4
  %185 = mul nsw i32 %183, %184
  %186 = load i32, ptr %6, align 4
  %187 = mul nsw i32 %185, %186
  %188 = load i32, ptr %7, align 4
  %189 = mul nsw i32 %187, %188
  %190 = load i32, ptr %7, align 4
  %191 = mul nsw i32 %189, %190
  %192 = load i32, ptr %7, align 4
  %193 = mul nsw i32 %191, %192
  %194 = mul nsw i32 %193, 1
  %195 = add nsw i32 2, %194
  %196 = load i32, ptr %6, align 4
  %197 = add nsw i32 %195, %196
  %198 = add nsw i32 %197, 2
  %199 = load i32, ptr %6, align 4
  %200 = add nsw i32 %198, %199
  %201 = load i32, ptr %7, align 4
  %202 = mul nsw i32 4, %201
  %203 = load i32, ptr %13, align 4
  %204 = mul nsw i32 %202, %203
  %205 = mul nsw i32 %204, 16
  %206 = add nsw i32 %200, %205
  %207 = and i32 %206, -1
  store i32 %207, ptr %7, align 4
  %208 = load i32, ptr %6, align 4
  %209 = load i32, ptr %7, align 4
  %210 = mul nsw i32 %208, %209
  %211 = load i32, ptr %6, align 4
  %212 = mul nsw i32 %210, %211
  %213 = load i32, ptr %7, align 4
  %214 = mul nsw i32 %212, %213
  %215 = mul nsw i32 %214, 5
  %216 = mul nsw i32 %215, 0
  store i32 %216, ptr %8, align 4
  %217 = load i32, ptr %8, align 4
  %218 = sitofp i32 %217 to double
  %219 = load i32, ptr %6, align 4
  %220 = sitofp i32 %219 to double
  %221 = call double @pow(double noundef %218, double noundef %220) #3
  %222 = fptosi double %221 to i32
  %223 = mul nsw i32 4, %222
  %224 = mul nsw i32 %223, 1
  %225 = or i32 %224, -1
  store i32 %225, ptr %15, align 4
  %226 = load i32, ptr %6, align 4
  %227 = mul nsw i32 3, %226
  %228 = mul nsw i32 %227, 400
  %229 = add nsw i32 %228, 0
  %230 = add nsw i32 %229, 1
  %231 = add nsw i32 %230, 0
  %232 = add nsw i32 %231, 0
  store i32 %232, ptr %16, align 4
  %233 = load i32, ptr %6, align 4
  %234 = add nsw i32 %233, 0
  %235 = load i32, ptr %8, align 4
  %236 = icmp slt i32 %234, %235
  br i1 %236, label %237, label %239

237:                                              ; preds = %0
  %238 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %239

239:                                              ; preds = %237, %0
  %240 = call i32 @f()
  %241 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %240)
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
