add_mlir_conversion_library(MLIRSTDAToAffine
  STDAToAffine.cpp

  #DEPENDS
  #MLIRSTDAPassIncGen

  #LINK_COMPONENTS
  #Core

  LINK_LIBS PUBLIC
  #MLIRAffine
  #MLIRSupport
)
