set(Boost_bootstrap_args --prefix=${CMAKE_CURRENT_BINARY_DIR}/external)
set(Boost_build_args link=static)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(Boost_build_args ${Boost_build_args} variant=debug)
else()
  set(Boost_build_args ${Boost_build_args} variant=release)
endif()

if(APPLE)
  set(Boost_bootstrap_args ${Boost_bootstrap_args} --with-toolset=clang)
  set(Boost_build_args ${Boost_build_args} toolset=clang)
endif()

ExternalProject_Add(Boost
  PREFIX external
  URL http://downloads.sourceforge.net/project/boost/boost/1.54.0/boost_1_54_0.tar.bz2
  CONFIGURE_COMMAND ./bootstrap.sh ${Boost_bootstrap_args}
  BUILD_COMMAND ""
  INSTALL_COMMAND ./b2 ${Boost_build_args} install
  BUILD_IN_SOURCE 1
)
