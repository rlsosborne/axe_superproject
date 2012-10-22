set(libelf_configure_args --disable-shared)

ExternalProject_Add(libelf
  PREFIX external
  URL http://www.mr511.de/software/libelf-0.8.13.tar.gz
  URL_MD5 4136d7b4c04df68b686570afa26988ac
  CONFIGURE_COMMAND ../libelf/configure ${libelf_configure_args} --prefix=${CMAKE_CURRENT_BINARY_DIR}/external
  INSTALL_COMMAND make install
)
