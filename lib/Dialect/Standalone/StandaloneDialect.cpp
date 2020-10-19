//===- STDADialect.cpp - STDA dialect ---------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Standalone/Dialect/Standalone/Dialect.h"
//#include "STDA/STDAOps.h"

using namespace mlir;
using namespace mlir::stda;

//===----------------------------------------------------------------------===//
// STDA dialect.
//===----------------------------------------------------------------------===//

/// Dialect creation, the instance will be owned by the context. This is the
/// point of registration of custom types and operations for the dialect.
STDADialect::STDADialect(mlir::MLIRContext *ctx)
    : mlir::Dialect(getDialectNamespace(), ctx, TypeID::get<STDADialect>()) {
  addOperations<
#define GET_OP_LIST
#include "Standalone/Dialect/Standalone/STDAEnums.cpp.inc"
      >();
}