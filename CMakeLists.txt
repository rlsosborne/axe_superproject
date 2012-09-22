cmake_minimum_required(VERSION 2.8)
project(AXE_SUPERPROJECT)

# Add path for custom modules
set(CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH}
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
  )

include(ExternalProject)

include(External_libxml2)
list(APPEND axe_build_vars
  "-DLIBXML2_INCLUDE_DIR:PATH=${LIBXML2_INCLUDE_DIR}"
  "-DLIBXML2_LIBRARIES:PATH=${LIBXML2_LIBRARIES}")
include(External_libelf)
list(APPEND axe_build_vars
  "-DLIBELF_INCLUDE_DIR:PATH=${LIBELF_INCLUDE_DIR}"
  "-DLIBELF_INCLUDE_DIRS:PATH=${LIBELF_INCLUDE_DIRS}"
  "-DLIBELF_LIBRARIES:PATH=${LIBELF_LIBRARIES}")
include(External_llvm)
list(APPEND axe_build_vars
  "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}"
  "-DLLVM_CONFIG_EXECUTABLE:PATH=${LLVM_CONFIG_EXECUTABLE}"
  "-DCLANG_EXECUTABLE:PATH=${CLANG_EXECUTABLE}"
  "-DCLANGPLUSPLUS_EXECUTABLE:PATH=${CLANGPLUSPLUS_EXECUTABLE}")

ExternalProject_Add(axe
  DEPENDS libxml2 libelf llvm
  CMAKE_CACHE_ARGS ${axe_build_vars}
  PREFIX axe
  GIT_REPOSITORY git://github.com/rlsosborne/tool_axe.git
  INSTALL_COMMAND ""
)
