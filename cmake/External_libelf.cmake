ExternalProject_Add(libelf
  PREFIX external
  URL http://www.mr511.de/software/libelf-0.8.13.tar.gz
  CONFIGURE_COMMAND ../libelf/configure --prefix=${CMAKE_CURRENT_BINARY_DIR}/external
  INSTALL_COMMAND make install
)

set(LIBELF_INCLUDE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/external/include/libelf)
set(LIBELF_LIBRARIES ${CMAKE_CURRENT_BINARY_DIR}/external/lib/libelf.a)
