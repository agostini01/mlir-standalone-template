// RUN: stda-opt --canonicalize %s | FileCheck %s
func @dead_transpose(%arg0: tensor<*xf64>) -> tensor<*xf64> {
  %0 = stda.transpose(%arg0 : tensor<*xf64>) to tensor<*xf64>
  stda.return %arg0 : tensor<*xf64>

// CHECK: func @dead_transpose(%arg0: tensor<*xf64>) -> tensor<*xf64> {
// CHECK-NOT: stda.transpose
// CHECK:   stda.return %arg0 : tensor<*xf64>
// CHECK: }
}


func @transpose_transpose(%arg0: tensor<*xf64>) -> tensor<*xf64> {
  %0 = stda.transpose(%arg0 : tensor<*xf64>) to tensor<*xf64>
  %1 = stda.transpose(%0 : tensor<*xf64>) to tensor<*xf64>
  stda.return %1 : tensor<*xf64>
// CHECK: func @transpose_transpose(%arg0: tensor<*xf64>) -> tensor<*xf64> {
// CHECK-NOT: stda.transpose
// CHECK-NOT: stda.transpose
// CHECK:   stda.return %arg0 : tensor<*xf64>
// CHECK: }
}