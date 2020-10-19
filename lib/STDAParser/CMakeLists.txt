file(GLOB globbed *.cpp)

add_mlir_library(STDAParser
  ${globbed}
  
  ADDITIONAL_HEADER_DIRS

  LINK_LIBS PUBLIC
  MLIRSTDA
  )
