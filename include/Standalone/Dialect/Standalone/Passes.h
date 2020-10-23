//===- Passes.h - Standalone pass entry points ------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This header file defines prototypes that expose pass constructors.
//
//===----------------------------------------------------------------------===//

#ifndef STANDALONE_DIALECT_STDA_PASSES_H
#define STANDALONE_DIALECT_STDA_PASSES_H

#include "mlir/Pass/PassRegistry.h"
#include <memory>

namespace mlir {
class Pass;
} // namespace mlir

namespace mlir {
namespace stda {

std::unique_ptr<mlir::Pass> createShapeInferencePass();

inline void registerShapeInferencePass() {
  ::mlir::registerPass("shape-inference", "Shape Inference",
                       []() -> std::unique_ptr<::mlir::Pass> {
                         return mlir::stda::createShapeInferencePass();
                       });
}

} // namespace stda
} // namespace mlir

#endif // STANDALONE_DIALECT_STDA_PASSES_H
