set(libxslt_configure_args --disable-shared --without-crypto --without-python --without-debug --without-debugger --without-plugins --with-libxml-prefix=<INSTALL_DIR>)

ExternalProject_Add(libxslt
  DEPENDS libxml2
  PREFIX external
  URL ftp://xmlsoft.org/libxslt/libxslt-1.1.27.tar.gz
  URL_MD5 4d01ff464b9ea7236925a1adf147c7f8
  CONFIGURE_COMMAND <SOURCE_DIR>/configure ${libxslt_configure_args} --prefix=<INSTALL_DIR>
  INSTALL_COMMAND make install
)
