get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
set(LIBS
        ${dialect_libs}
        ${conversion_libs}
        MLIROptLib
        MLIRSTDA
        )
add_llvm_executable(stda-opt stda-opt.cpp)

llvm_update_compile_flags(stda-opt)
target_link_libraries(stda-opt PRIVATE ${LIBS})

mlir_check_link_libraries(stda-opt)