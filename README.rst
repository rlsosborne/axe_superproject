CMake superproject for AXE
..........................

:Stable release: Unreleased

:Status: Experimental

:Maintainer: https://github.com/rlsosborne

:Description: CMake superproject for AXE

A CMake superproject for AXE_. This project contains no code itself. It uses
CMake's ExternalProject module to download and build AXE and its
dependencies.

Dependencies
============

The only required external dependencies are:

* CMake_ (2.8 or later)
* Python_

On Linux you may need to install the X11 headers to get SDL video to work. On Ubuntu run::

  apt-get install libx11-dev libxext-dev

Building
========

Make a directory for the build and in that directory run::

  cmake -DCMAKE_BUILD_TYPE=Release <path-to-src>
  make

The resulting axe binary can be found in the axe/src/axe-build subdirectory.

.. _AXE: https://github.com/rlsosborne/tool_axe
.. _CMake: http://www.cmake.org
.. _Python: http://www.python.org
