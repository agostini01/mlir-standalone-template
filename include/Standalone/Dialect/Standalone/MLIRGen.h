//===- MLIRGen.h - MLIR Generation from a STDA AST ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares a simple interface to perform IR generation targeting MLIR
// from a Module AST for the STDA language.
//
//===----------------------------------------------------------------------===//

#ifndef STANDALONE_MLIRGEN_H_
#define STANDALONE_MLIRGEN_H_

#include <memory>

namespace mlir {
class MLIRContext;
class OwningModuleRef;
} // namespace mlir

namespace stda {
class ModuleAST;

/// Emit IR for the given STDA moduleAST, returns a newly created MLIR module
/// or nullptr on failure.
mlir::OwningModuleRef mlirGen(mlir::MLIRContext &context, ModuleAST &moduleAST);
} // namespace stda

#endif // STANDALONE_MLIRGEN_H_