ExternalProject_Add(clang
  PREFIX external
  GIT_REPOSITORY http://llvm.org/git/clang.git
  GIT_TAG release_37
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

ExternalProject_Get_Property(clang source_dir)

list(APPEND llvm_build_vars
  "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}"
  "-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>"
  "-DLLVM_EXTERNAL_CLANG_SOURCE_DIR:PATH=${source_dir}")

# Workaround LLVM bug #16246 by avoiding AArch64 backend.
list(APPEND llvm_build_vars "-DLLVM_TARGETS_TO_BUILD:STRING=X86")

set(llvm_dependencies clang)

if(APPLE)
  # Install libc++ headers in the directory that clang expects to find them in.
  # This matches what macports does, see https://trac.macports.org/ticket/34288.
  ExternalProject_Add(libcxx
    PREFIX external
    URL http://llvm.org/releases/3.3/libcxx-3.3.src.tar.gz
    URL_MD5 59006e659ffb33f5222a7b79d4cd071e
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND
    ${CMAKE_COMMAND} -E make_directory <INSTALL_DIR>/lib/c++ &&
    ${CMAKE_COMMAND} -E copy_directory <SOURCE_DIR>/include <INSTALL_DIR>/include/c++/v1
  )
  list(APPEND llvm_dependencies libcxx)
endif()

ExternalProject_Add(llvm
  DEPENDS ${llvm_dependencies}
  PREFIX external
  GIT_REPOSITORY http://llvm.org/git/llvm.git
  GIT_TAG release_37
  CMAKE_CACHE_ARGS ${llvm_build_vars}
)
