ExternalProject_Add(clang
  PREFIX external
  URL http://llvm.org/releases/3.3/cfe-3.3.src.tar.gz
  URL_MD5 8284891e3e311829b8e44ac813d0c9ef
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

list(APPEND llvm_build_vars
  "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}"
  "-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>"
  "-DLLVM_EXTERNAL_CLANG_SOURCE_DIR:PATH=${CMAKE_CURRENT_BINARY_DIR}/external/src/clang")

# Workaround LLVM bug #16246 by avoiding AArch64 backend.
list(APPEND llvm_build_vars "-DLLVM_TARGETS_TO_BUILD:STRING=X86")

ExternalProject_Add(llvm
  DEPENDS clang
  PREFIX external
  URL http://llvm.org/releases/3.3/llvm-3.3.src.tar.gz
  URL_MD5 40564e1dc390f9844f1711c08b08e391
  CMAKE_CACHE_ARGS ${llvm_build_vars}
)
