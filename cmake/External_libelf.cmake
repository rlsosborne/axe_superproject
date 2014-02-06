set(libelf_configure_args --disable-shared)

ExternalProject_Add(libelf
  PREFIX external
  URL http://www.mr511.de/software/libelf-0.8.13.tar.gz
  URL_MD5 4136d7b4c04df68b686570afa26988ac
  CONFIGURE_COMMAND <SOURCE_DIR>/configure ${libelf_configure_args} --prefix=<INSTALL_DIR>
  INSTALL_COMMAND make install
)
