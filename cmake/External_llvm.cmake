ExternalProject_Add(clang
  PREFIX external
  URL http://llvm.org/releases/3.2/clang-3.2.src.tar.gz
  URL_MD5 3896ef4334df08563b05d0848ba80582
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

list(APPEND llvm_build_vars
  "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}"
  "-DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CURRENT_BINARY_DIR}/external"
  "-DLLVM_EXTERNAL_CLANG_SOURCE_DIR:PATH=${CMAKE_CURRENT_BINARY_DIR}/external/src/clang")
ExternalProject_Add(llvm
  DEPENDS clang
  PREFIX external
  URL http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz
  URL_MD5 71610289bbc819e3e15fdd562809a2d7
  CMAKE_CACHE_ARGS ${llvm_build_vars}
)
