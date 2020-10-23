// RUN: stda-opt --allow-unregistered-dialect --canonicalize --shape-inference %s | FileCheck %s
func @main() {
  //CHECK: func @main()
  %0 = "stda.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>} : () -> tensor<2x3xf64>
  %1 = "stda.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>} : () -> tensor<2x3xf64>
  %2 = "stda.cast"(%1) : (tensor<2x3xf64>) -> tensor<*xf64>
  %3 = "stda.cast"(%0) : (tensor<2x3xf64>) -> tensor<*xf64>
  %4 = "stda.transpose"(%2) : (tensor<*xf64>) -> tensor<*xf64>
  %5 = "stda.transpose"(%3) : (tensor<*xf64>) -> tensor<*xf64>
  %6 = "stda.mul"(%4, %5) : (tensor<*xf64>, tensor<*xf64>) -> tensor<*xf64>
  stda.print %6 : tensor<*xf64>
  stda.return
  //CHECK: %{{.*}} = stda.constant
  //CHECK  %{{.*}} = stda.transpose(%{{.*}} : tensor<2x3xf64>) to tensor<3x2xf64>
  //CHECK  %{{.*}} = stda.transpose(%{{.*}} : tensor<2x3xf64>) to tensor<3x2xf64>
  //CHECK  %{{.*}} = stda.mul %{{.*}}, %{{.*}} : tensor<3x2xf64>
  //CHECK  stda.print %4 : tensor<3x2xf64>
  //CHECK: stda.return
}
  
