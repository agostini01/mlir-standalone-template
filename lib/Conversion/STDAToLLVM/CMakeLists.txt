add_mlir_conversion_library(MLIRSTDAToLLVM
  STDAToLLVM.cpp

  #DEPENDS
  #MLIRSTDAPassIncGen

  #LINK_COMPONENTS
  #Core

  LINK_LIBS PUBLIC
  #MLIRAffine
  #MLIRSupport
)
