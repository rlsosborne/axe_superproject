CMake superproject for AXE
..........................

:Stable release: Unreleased

:Status: Experimental

:Maintainer: https://github.com/rlsosborne

:Description: CMake superproject for AXE

A CMake superproject for AXE_. This project contains no code itself. It uses
CMake's ExternalProject module to download and build AXE and all its
dependencies.

Building
========

Make a directory for the build and in that directory run::

  cmake -DCMAKE_BUILD_TYPE=Release <path-to-src>
  make

The resulting axe binary can be found in the axe/src/axe-build subdirectory.

_.
.. _AXE: https://github.com/rlsosborne/tool_axe
