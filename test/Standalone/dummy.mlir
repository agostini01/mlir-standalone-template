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
