ExternalProject_Add(clang
  PREFIX external
  URL http://llvm.org/releases/3.1/clang-3.1.src.tar.gz
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

set(LLVM_CONFIGURE_ARGS --with-clang-srcdir=${CMAKE_CURRENT_BINARY_DIR}/external/src/clang)

ExternalProject_Add(llvm
  DEPENDS clang
  PREFIX external
  URL http://llvm.org/releases/3.1/llvm-3.1.src.tar.gz
  PATCH_COMMAND ${LLVM_PATCH_COMMAND}
  CONFIGURE_COMMAND ../llvm/configure ${LLVM_CONFIGURE_ARGS} --prefix=${CMAKE_CURRENT_BINARY_DIR}/external
  INSTALL_COMMAND make install
)

set(LLVM_CONFIG_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/llvm-config)
set(CLANG_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang)
set(CLANGPLUSPLUS_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang++)
