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

if(APPLE)
  # Try to determine if libc++ or libstdc++ is the default.
  include(CheckCXXSourceCompiles)
  check_cxx_source_compiles(
    "#include <cstddef>
     #ifndef _LIBCPP_VERSION
     #error
     #endif
     int main() { return 0; }"
    LIBCXX_IS_DEFAULT
  )
  # Explicitly set the standard library version. If we don't do this the clang
  # executable we build might default to a different standard library to the one
  # used by the system compiler, causing link errors.
  if (${LIBCXX_IS_DEFAULT})
    set(stdlib libc++)
  else()
    set(stdlib libstdc++)
  endif()
  list(APPEND axe_build_vars
       "-DCMAKE_CXX_FLAGS:STRING=-stdlib=${stdlib} ${CMAKE_CXX_FLAGS}"
       "-DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=${stdlib} ${CMAKE_EXE_LINKER_FLAGS}")
endif()

# Workaround lack a platform file for clang, see cmake bug #13035
if (MINGW)
  list(APPEND axe_build_vars
       "-DCMAKE_MODULE_PATH:PATH=${CMAKE_CURRENT_SOURCE_DIR}/cmake_clang_mingw_platform"
       )
endif()

ExternalProject_Add(axe
  DEPENDS Boost libxml2 libxslt libelf llvm SDL2
  CMAKE_CACHE_ARGS ${axe_build_vars}
  PREFIX axe
  GIT_REPOSITORY git://github.com/rlsosborne/tool_axe.git
  INSTALL_COMMAND ""
)
