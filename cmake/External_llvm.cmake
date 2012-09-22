ExternalProject_Add(clang
  PREFIX external
  URL http://llvm.org/releases/3.1/clang-3.1.src.tar.gz
  URL_MD5 59bf2d3120a3805f27cafda3823caaf8
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

set(LLVM_CONFIGURE_ARGS --with-clang-srcdir=${CMAKE_CURRENT_BINARY_DIR}/external/src/clang)

ExternalProject_Add(llvm
  DEPENDS clang
  PREFIX external
  URL http://llvm.org/releases/3.1/llvm-3.1.src.tar.gz
  URL_MD5 16eaa7679f84113f65b12760fdfe4ee1
  PATCH_COMMAND ${LLVM_PATCH_COMMAND}
  CONFIGURE_COMMAND ../llvm/configure ${LLVM_CONFIGURE_ARGS} --prefix=${CMAKE_CURRENT_BINARY_DIR}/external
  INSTALL_COMMAND make install
)

set(LLVM_CONFIG_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/llvm-config)
set(CLANG_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang)
set(CLANGPLUSPLUS_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang++)
