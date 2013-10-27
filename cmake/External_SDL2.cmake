set(SDL2_configure_args --disable-shared)
if (APPLE)
  set(SDL2_configure_args ${SDL2_configure_args} --without-x)
endif()

ExternalProject_Add(SDL2
  PREFIX external
  URL http://www.libsdl.org/release/SDL2-2.0.0.tar.gz
  URL_MD5 beec89afb6edcc6f0abc4114f2e6bcf7
  CONFIGURE_COMMAND <SOURCE_DIR>/configure ${SDL2_configure_args} --prefix=<INSTALL_DIR>
  INSTALL_COMMAND make install
)
