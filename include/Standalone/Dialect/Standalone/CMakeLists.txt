add_mlir_dialect(STDA stda STDA)

set(LLVM_TARGET_DEFINITIONS STDA.td)
mlir_tablegen(STDAEnums.h.inc -gen-enum-decls)
mlir_tablegen(STDAEnums.cpp.inc -gen-enum-defs)
add_public_tablegen_target(MLIRSTDAEnumsIncGen)

set(LLVM_TARGET_DEFINITIONS Passes.td)
mlir_tablegen(STDAPasses.inc -gen-rewriters)
add_public_tablegen_target(MLIRSTDAPassesIncGen)

# Most dialects should use add_mlir_interfaces().
set(LLVM_TARGET_DEFINITIONS ShapeInferenceInterface.td)
mlir_tablegen(ShapeInferenceOpInterfaces.h.inc -gen-op-interface-decls)
mlir_tablegen(ShapeInferenceOpInterfaces.cpp.inc -gen-op-interface-defs)
add_public_tablegen_target(MLIRSTDAShapeInferenceInterfaceIncGen)

#add_mlir_doc(STDADialect -gen-dialect-doc STDADialect STDA/)
#add_mlir_doc(STDAOps -gen-op-doc STDA STDA/)