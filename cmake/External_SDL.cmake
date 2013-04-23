set(SDL_configure_args --disable-shared)
if (APPLE)
  set(SDL_configure_args ${SDL_configure_args} --without-x)
endif()

ExternalProject_Add(SDL
  PREFIX external
  URL http://www.libsdl.org/release/SDL-1.2.15.tar.gz
  CONFIGURE_COMMAND ../SDL/configure ${SDL_configure_args} --prefix=${CMAKE_CURRENT_BINARY_DIR}/external
  INSTALL_COMMAND make install
)
