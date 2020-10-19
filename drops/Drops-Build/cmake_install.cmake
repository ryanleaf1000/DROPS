# Install script for directory: /home/qi/Drops/drops/drops/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/qi/Drops/drops/Drops-Build/parallel/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/levelset/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/poisson/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/DiST/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/geom/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/num/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/out/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/misc/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/osmosis/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/stokes/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/navstokes/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/surfactant/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/spacetimetransp/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/transport/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/partests/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/tests/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/surfnavierstokes/cmake_install.cmake")
  include("/home/qi/Drops/drops/Drops-Build/surfphasesep/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/qi/Drops/drops/Drops-Build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
