// RUN: stda-opt %s | stda-opt | FileCheck %s

module {
    // CHECK-LABEL: func @bar()
    func @bar() {
        %0 = constant 1 : i32
        // CHECK: %{{.*}} = stda.foo %{{.*}} : i32
        %res = stda.foo %0 : i32
        return
    }
}

module {
  func @multiply_transpose(%arg0: tensor<*xf64>, %arg1: tensor<*xf64>) -> tensor<*xf64> {
    %0 = stda.transpose(%arg0 : tensor<*xf64>) to tensor<*xf64>
    %1 = stda.transpose(%arg1 : tensor<*xf64>) to tensor<*xf64>
    // CHECK: %{{.*}} = stda.mul %{{.*}} : tensor<*xf64>
    %2 = stda.mul %0, %1 : tensor<*xf64>
    stda.return %2 : tensor<*xf64>
  }
  func @secondmain() {
    %0 = stda.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>
    %1 = stda.reshape(%0 : tensor<2x3xf64>) to tensor<2x3xf64>
    %2 = stda.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00]> : tensor<6xf64>
    %3 = stda.reshape(%2 : tensor<6xf64>) to tensor<2x3xf64>
    %4 = stda.generic_call @multiply_transpose(%1, %3) : (tensor<2x3xf64>, tensor<2x3xf64>) -> tensor<*xf64>
    %5 = stda.generic_call @multiply_transpose(%3, %1) : (tensor<2x3xf64>, tensor<2x3xf64>) -> tensor<*xf64>
    stda.print %5 : tensor<*xf64>
    stda.return
  }
  func @main() {
    %0 = stda.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>
    %1 = stda.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00]> : tensor<6xf64>
    %2 = stda.reshape(%1 : tensor<6xf64>) to tensor<2x3xf64>
    %3 = stda.transpose(%0 : tensor<2x3xf64>) to tensor<*xf64>
    %4 = stda.transpose(%2 : tensor<2x3xf64>) to tensor<*xf64>
    // CHECK: %{{.*}} = stda.mul %{{.*}} : tensor<*xf64>
    %5 = stda.mul %3, %4 : tensor<*xf64>
    stda.print %5 : tensor<*xf64>
    stda.return
  }
}