set(LLVM_LINK_COMPONENTS
  Support
  )

include_directories(include/)

#get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
#get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
set(LIBS
# Original standalone libs
#        ${dialect_libs}
#        ${conversion_libs}
#        MLIROptLib
#        MLIRStandalone
# Original Toy1 libs
#    MLIRAnalysis
#    MLIRIR
#    MLIRParser
#    MLIRSideEffectInterfaces
#    MLIRTransforms
    MLIRSupport
    )

set(SOURCES
  standalone-compiler.cpp
  parser/AST.cpp
)
add_llvm_executable(standalone-compiler ${SOURCES})

#llvm_update_compile_flags(standalone-compiler)
target_link_libraries(standalone-compiler PRIVATE ${LIBS})

#mlir_check_link_libraries(standalone-compiler)