add_mlir_dialect(STDA stda STDA)

set(LLVM_TARGET_DEFINITIONS STDA.td)
mlir_tablegen(STDAEnums.h.inc -gen-enum-decls)
mlir_tablegen(STDAEnums.cpp.inc -gen-enum-defs)
add_public_tablegen_target(MLIRSTDAEnumsIncGen)

set(LLVM_TARGET_DEFINITIONS Passes.td)
mlir_tablegen(STDAPasses.inc -gen-rewriters)
add_public_tablegen_target(MLIRSTDAPassesIncGen)

#add_mlir_doc(STDADialect -gen-dialect-doc STDADialect STDA/)
#add_mlir_doc(STDAOps -gen-op-doc STDA STDA/)