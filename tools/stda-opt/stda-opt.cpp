//===- stda-opt.cpp ---------------------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/IR/Dialect.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Support/MlirOptMain.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"

#include "Standalone/Dialect/Standalone/Dialect.h"
#include "Standalone/Dialect/Standalone/Passes.h"

int main(int argc, char **argv) {
  // mlir::registerAllDialects();
  // mlir::registerAllPasses();

  //===--------------------------------------------------------------------===//
  // Register mlir dialect and passes
  //===--------------------------------------------------------------------===//
  mlir::registerInlinerPass();
  mlir::registerCanonicalizerPass();
  mlir::registerCSEPass();
  mlir::registerAffineLoopFusionPass();
  mlir::registerMemRefDataFlowOptPass();

  //===--------------------------------------------------------------------===//
  // Register STDA dialect and passes
  //===--------------------------------------------------------------------===//
  mlir::DialectRegistry registry;
  registry.insert<mlir::stda::STDADialect>();

  // Optimization passes
  mlir::stda::registerShapeInferencePass();

  // Conversion passes
  mlir::stda::registerSTDAToAffinePass();

  registry.insert<mlir::StandardOpsDialect>();
  // Add the following to include *all* MLIR Core dialects, or selectively
  // include what you need like above. You only need to register dialects that
  // will be *parsed* by the tool, not the one generated
  // registerAllDialects(registry);

  return failed(
      mlir::MlirOptMain(argc, argv, "STDA optimizer driver\n", registry));
}
