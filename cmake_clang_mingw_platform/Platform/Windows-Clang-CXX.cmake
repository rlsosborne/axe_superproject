if(MINGW)
  include(Platform/Windows-GNU-CXX)
else()
  # Chain to generic Windows configuration
  include(Platform/Windows)
endif()
