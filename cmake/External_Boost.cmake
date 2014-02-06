set(Boost_build_args --prefix=<INSTALL_DIR> link=static)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(Boost_build_args ${Boost_build_args} variant=debug)
else()
  set(Boost_build_args ${Boost_build_args} variant=release)
endif()

if(MINGW)
  if(${CMAKE_GENERATOR} STREQUAL "MSYS Makefiles")
    set(Boost_CONFIGURE_COMMAND cmd /Cbootstrap.bat mingw)
  else()
    set(Boost_CONFIGURE_COMMAND bootstrap.bat mingw)
  endif()
  set(Boost_build_args ${Boost_build_args} toolset=gcc)
elseif(APPLE)
  set(Boost_CONFIGURE_COMMAND ./bootstrap.sh --with-toolset=clang)
  set(Boost_build_args ${Boost_build_args} toolset=clang)
  # Workaround build issues with XCode 5 (see Boost Ticket #8507)
  set(Boost_build_args ${Boost_build_args} cxxflags='-ftemplate-depth=256')
else()
  set(Boost_CONFIGURE_COMMAND ./bootstrap.sh)
endif()

# Avoid building libraries with external dependencies.
set(Boost_build_args ${Boost_build_args} --without-context --without-coroutine --without-iostreams --without-python)

ExternalProject_Add(Boost
  PREFIX external
  URL http://downloads.sourceforge.net/project/boost/boost/1.54.0/boost_1_54_0.tar.bz2
  CONFIGURE_COMMAND ${Boost_CONFIGURE_COMMAND}
  BUILD_COMMAND ""
  INSTALL_COMMAND ./b2 ${Boost_build_args} install
  BUILD_IN_SOURCE 1
)
