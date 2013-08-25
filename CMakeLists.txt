cmake_minimum_required(VERSION 2.8)
project(AXE_SUPERPROJECT)

# Add path for custom modules
set(CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH}
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
  )

include(ExternalProject)

include(External_Boost)
include(External_libxml2)
include(External_libxslt)
include(External_libelf)
include(External_llvm)
include(External_SDL2)
list(APPEND axe_build_vars
  "-DCMAKE_C_COMPILER:PATH=${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang${CMAKE_EXECUTABLE_SUFFIX}"
  "-DCMAKE_CXX_COMPILER:PATH=${CMAKE_CURRENT_BINARY_DIR}/external/bin/clang++${CMAKE_EXECUTABLE_SUFFIX}"
  "-DCMAKE_PREFIX_PATH:PATH=${CMAKE_CURRENT_BINARY_DIR}/external"
  "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}")

ExternalProject_Add(axe
  DEPENDS Boost libxml2 libxslt libelf llvm SDL2
  CMAKE_CACHE_ARGS ${axe_build_vars}
  PREFIX axe
  GIT_REPOSITORY git://github.com/rlsosborne/tool_axe.git
  INSTALL_COMMAND ""
)
