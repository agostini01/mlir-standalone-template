// RUN: stda-opt %s --lower-stda-to-affine  --lower-stda-to-llvm | FileCheck %s
func @main() {
  //CHECK: func @main()
  %0 = stda.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>
  stda.print %0 : tensor<2x3xf64>
  stda.return

  //CHECK-NOT: stda.print
  //CHECK:     llvm.call @printf
}