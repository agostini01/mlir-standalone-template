set(LLVM_LINK_COMPONENTS
  Support
  )

include_directories(${PROJ_SOURCE_DIR}/include)

get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
set(LIBS
# Original stda libs
#        ${dialect_libs}
#        ${conversion_libs}
#        MLIROptLib
#        MLIRSTDA
# Original Toy1 libs
#    MLIRAnalysis
#    MLIRIR
#    MLIRParser
#    MLIRSideEffectInterfaces
#    MLIRTransforms
    MLIRSupport
    STDAParser
    )

set(SOURCES
  stda-compiler.cpp
)
add_llvm_executable(stda-compiler ${SOURCES})

#llvm_update_compile_flags(stda-compiler)
target_link_libraries(stda-compiler PRIVATE ${LIBS})

#mlir_check_link_libraries(stda-compiler)