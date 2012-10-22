set(libxml2_configure_args --disable-shared --without-iconv --without-zlib --without-threads --without-ftp --without-http)

ExternalProject_Add(libxml2
  PREFIX external
  URL ftp://xmlsoft.org/libxml2/libxml2-2.7.8.tar.gz
  URL_MD5 8127a65e8c3b08856093099b52599c86
  CONFIGURE_COMMAND ../libxml2/configure ${libxml2_configure_args} --prefix=${CMAKE_CURRENT_BINARY_DIR}/external
  INSTALL_COMMAND make install
)
