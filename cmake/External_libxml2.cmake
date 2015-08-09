set(libxml2_configure_args --disable-shared --without-iconv --without-zlib
    --without-threads --without-ftp --without-http --without-python)

ExternalProject_Add(libxml2
  PREFIX external
  URL ftp://xmlsoft.org/libxml2/libxml2-2.9.2.tar.gz
  URL_MD5 9e6a9aca9d155737868b3dc5fd82f788
  CONFIGURE_COMMAND
    <SOURCE_DIR>/configure ${libxml2_configure_args} --prefix=<INSTALL_DIR>
  INSTALL_COMMAND make install
)
