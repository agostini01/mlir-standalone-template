# An out-of-tree dialect template for MLIR

Original author: https://github.com/jmgorius/mlir-standalone-template

This repository contains a template for an out-of-tree [MLIR](https://mlir.llvm.org/) dialect as well as a
standalone `opt`-like tool to operate on that dialect.

## How to build

This setup assumes that you have built LLVM and MLIR in `$BUILD_DIR` and installed them to `$PREFIX`. To build and launch the tests, run
```sh
mkdir build && cd build
cmake -G Ninja .. \
    -DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit \
    -DMLIR_DIR=$PREFIX/lib/cmake/mlir

cmake --build . --target check-standalone-opt
```

**Note**: Make sure to pass `-DLLVM_INSTALL_UTILS=ON` when building LLVM with
CMake so that it installs `FileCheck` to the chosen installation prefix.

Alternatively it is possible to use the build helper: `build_tools/build_proj.sh`
```sh
./build_tools/build_proj.sh <source_dir> <build_dir> <path/to/llvm/build/dir> <path/to/llvm/install/dir>
```

### How to generate docs?

To build the documentation from the TableGen description of the dialect
operations, run
```sh
cmake --build . --target mlir-doc
```

### Building LLVM with Helper Script

LLVM can be build with the helper `build_tools/build_mlir.sh`

```bash
# To configure and build
./build_mlir.sh <path/to/llvm> <llvm_build_dir> <llvm_install_dir>

# To install
cmake --build <llvm_build_dir> --target install
```

## License

This dialect template is made available under the Apache License 2.0 with LLVM Exceptions. See the `LICENSE.txt` file for more details.
