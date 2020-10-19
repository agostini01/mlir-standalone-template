// RUN: stda-opt --canonicalize %s | FileCheck %s
  func @main() {
    %0 = stda.constant dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf64>
    %1 = stda.reshape(%0 : tensor<2xf64>) to tensor<2x1xf64>
    %2 = stda.reshape(%1 : tensor<2x1xf64>) to tensor<2x1xf64>
    %3 = stda.reshape(%2 : tensor<2x1xf64>) to tensor<2x1xf64>
    stda.print %3 : tensor<2x1xf64>
    stda.return
  
    //CHECK: func @main() {
    //CHECK:     stda.constant
    //CHECK-NOT: stda.reshape
    //CHECK-NOT: stda.reshape
    //CHECK-NOT: stda.reshape
    //CHECK:     stda.print %0 : tensor<2x1xf64>
    //CHECK:     stda.return
    //CHECK: }
  }
