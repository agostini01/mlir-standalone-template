file(GLOB globbed *.cpp)

add_mlir_dialect_library(MLIRSTDA
        ${globbed}

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/Standalone/Dialect/Standalone
        ${PROJECT_SOURCE_DIR}/include/Standalone/Parser

        DEPENDS
        MLIRSTDAEnumsIncGen

	LINK_LIBS PUBLIC
	MLIRIR
	)
