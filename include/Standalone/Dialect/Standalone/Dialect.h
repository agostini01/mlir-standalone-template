//===- STDADialect.h - STDA dialect -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef STANDALONE_STANDALONEDIALECT_H
#define STANDALONE_STANDALONEDIALECT_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/Function.h"
#include "mlir/IR/StandardTypes.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

#include "Standalone/Dialect/Standalone/ShapeInferenceInterface.h"

namespace mlir {
namespace stda {

/// This is the definition of the STDA dialect. A dialect inherits from
/// mlir::Dialect and registers custom attributes, operations, and types (in its
/// constructor). It can also override some general behavior exposed via virtual
/// methods.
class STDADialect : public mlir::Dialect {
public:
  explicit STDADialect(mlir::MLIRContext *ctx);

  /// Provide a utility accessor to the dialect namespace. This is used by
  /// several utilities for casting between dialects.
  static llvm::StringRef getDialectNamespace() { return "stda"; }
};

} // end namespace stda
} // end namespace mlir

/// Include the auto-generated header file containing the declarations of the
/// stda operations.
#define GET_OP_CLASSES
#include "Standalone/Dialect/Standalone/STDA.h.inc"

#endif // STANDALONE_STANDALONEDIALECT_H