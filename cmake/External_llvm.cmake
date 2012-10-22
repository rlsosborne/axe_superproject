ExternalProject_Add(clang
  PREFIX external
  URL http://llvm.org/releases/3.1/clang-3.1.src.tar.gz
  URL_MD5 59bf2d3120a3805f27cafda3823caaf8
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

list(APPEND llvm_build_vars
  "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}"
  "-DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CURRENT_BINARY_DIR}/external"
  "-DLLVM_CLANG_SOURCE_DIR:PATH=${CMAKE_CURRENT_BINARY_DIR}/external/src/clang")

ExternalProject_Add(llvm
  DEPENDS clang
  PREFIX external
  URL http://llvm.org/releases/3.1/llvm-3.1.src.tar.gz
  URL_MD5 16eaa7679f84113f65b12760fdfe4ee1
  CMAKE_CACHE_ARGS ${llvm_build_vars}
)

set(LLVM_CONFIG_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/llvm-config)
set(CLANG_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang${CMAKE_EXECUTABLE_SUFFIX})
set(CLANGPLUSPLUS_EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang++${CMAKE_EXECUTABLE_SUFFIX})
