set(Boost_build_args --prefix=<INSTALL_DIR> link=static)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  list(APPEND Boost_build_args variant=debug)
else()
  list(APPEND Boost_build_args variant=release)
endif()

if("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
  set(BOOST_BUILD_TOOLSET clang)
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  set(BOOST_BUILD_TOOLSET msvc)
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  set(BOOST_BUILD_TOOLSET gcc)
else()
  message(FATAL_ERROR "unsupported compiler \"${CMAKE_CXX_COMPILER_ID}\"")
endif()

list(APPEND Boost_build_args toolset=${BOOST_BUILD_TOOLSET})

if(MINGW)
  if(${CMAKE_GENERATOR} STREQUAL "MSYS Makefiles")
    set(Boost_CONFIGURE_COMMAND cmd /Cbootstrap.bat mingw)
  else()
    set(Boost_CONFIGURE_COMMAND bootstrap.bat mingw)
  endif()
elseif(MSVC)
  set(Boost_CONFIGURE_COMMAND bootstrap.bat msvc)
else()
  set(Boost_CONFIGURE_COMMAND ./bootstrap.sh --with-toolset=${BOOST_BUILD_TOOLSET})
endif()

if(APPLE)
  # Workaround build issues with XCode 5 (see Boost Ticket #8507)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftemplate-depth=256")
endif()

if(${CMAKE_CXX_FLAGS})
  list(APPEND Boost_build_args "cxxflags=${CMAKE_CXX_FLAGS}")
endif()

# Avoid building libraries with external dependencies.
list(APPEND Boost_build_args
     --without-context --without-coroutine --without-iostreams --without-python)

ExternalProject_Add(Boost
  PREFIX external
  URL http://downloads.sourceforge.net/project/boost/boost/1.58.0/boost_1_58_0.tar.bz2
  URL_MD5 b8839650e61e9c1c0a89f371dd475546
  CONFIGURE_COMMAND
    ${CMAKE_COMMAND} -E chdir <SOURCE_DIR> ${Boost_CONFIGURE_COMMAND}
  BUILD_COMMAND ""
  INSTALL_COMMAND
    ${CMAKE_COMMAND} -E chdir <SOURCE_DIR>
    ./b2 --build-dir=<BINARY_DIR> ${Boost_build_args} install
)
