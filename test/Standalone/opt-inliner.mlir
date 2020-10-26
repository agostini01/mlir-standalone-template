// RUN: stda-opt --inline %s | FileCheck %s
  
func @multiply_transpose(%arg0: tensor<*xf64>, %arg1: tensor<*xf64>) -> tensor<*xf64> attributes {sym_visibility = "private"} {
// CHECK-NOT: func @multiply_transpose
  %0 = stda.transpose(%arg0 : tensor<*xf64>) to tensor<*xf64>
  %1 = stda.transpose(%arg1 : tensor<*xf64>) to tensor<*xf64>
  %2 = stda.mul %0, %1 : tensor<*xf64>
  stda.return %2 : tensor<*xf64>
}
func @main() {
// CHECK-LABEL: func @main()
  %0 = stda.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>
  %1 = stda.reshape(%0 : tensor<2x3xf64>) to tensor<2x3xf64>
  %2 = stda.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00]> : tensor<6xf64>
  %3 = stda.reshape(%2 : tensor<6xf64>) to tensor<2x3xf64>
  %4 = stda.generic_call @multiply_transpose(%1, %3) : (tensor<2x3xf64>, tensor<2x3xf64>) -> tensor<*xf64>
  %5 = stda.generic_call @multiply_transpose(%3, %1) : (tensor<2x3xf64>, tensor<2x3xf64>) -> tensor<*xf64>
  stda.print %5 : tensor<*xf64>
  stda.return

// CHECK-NEXT:  [[VAL_0:%.*]] = stda.constant dense<{{.*}}> : tensor<2x3xf64>
// CHECK-NEXT:  [[VAL_1:%.*]] = stda.constant dense<{{.*}}> : tensor<2x3xf64>
// CHECK-NEXT:  [[VAL_2:%.*]] = stda.cast [[VAL_1]] : tensor<2x3xf64> to tensor<*xf64>
// CHECK-NEXT:  [[VAL_3:%.*]] = stda.cast [[VAL_0]] : tensor<2x3xf64> to tensor<*xf64>
// CHECK-NEXT:  [[VAL_4:%.*]] = stda.transpose([[VAL_2]] : tensor<*xf64>) to tensor<*xf64>
// CHECK-NEXT:  [[VAL_5:%.*]] = stda.transpose([[VAL_3]] : tensor<*xf64>) to tensor<*xf64>
// CHECK-NEXT:  [[VAL_6:%.*]] = stda.mul [[VAL_4]], [[VAL_5]] : tensor<*xf64>
}
