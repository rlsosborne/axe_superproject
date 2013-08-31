if(MINGW)
  include(Platform/Windows-GNU-C)
else()
  # Chain to generic Windows configuration
  include(Platform/Windows)
endif()
