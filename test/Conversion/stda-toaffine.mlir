// RUN: stda-opt %s --shape-inference --canonicalize --cse --lower-stda-to-affine | FileCheck %s
func @main() {
  //CHECK: func @main()
  %0 = stda.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>
  %1 = stda.transpose(%0 : tensor<2x3xf64>) to tensor<3x2xf64>
  %2 = stda.mul %1, %1 : tensor<3x2xf64>
  stda.print %2 : tensor<3x2xf64>
  stda.return

  //CHECK:    affine.for %{{.*}} = 0 to 3 {
  //CHECK:    affine.for %{{.*}} = 0 to 2 {
  //CHECK:      %{{.*}} = affine.load 
  //CHECK:      %{{.*}} = affine.load
  //CHECK:      %{{.*}} = mulf %{{.*}}, %{{.*}} : f64
  //CHECK:      affine.store
  //CHECK:    }
  //CHECK:  }
}