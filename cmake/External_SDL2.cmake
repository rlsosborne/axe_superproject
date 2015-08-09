set(SDL2_configure_args --disable-shared)
if (APPLE)
  set(SDL2_configure_args ${SDL2_configure_args} --without-x)
endif()

ExternalProject_Add(SDL2
  PREFIX external
  URL http://www.libsdl.org/release/SDL2-2.0.3.tar.gz
  URL_MD5 fe6c61d2e9df9ef570e7e80c6e822537
  CONFIGURE_COMMAND <SOURCE_DIR>/configure ${SDL2_configure_args} --prefix=<INSTALL_DIR>
  INSTALL_COMMAND make install
)
