#  CMakeLists.txt
#  
#  Copyright 2021 Pedro Luis Castedo Cepeda <pedroluis.castedo@upm.es>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
cmake_minimum_required(VERSION 3.13...3.20)

project(SOFA VERSION 0.17.0 LANGUAGES C)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    include(CMakeDependentOption)

    ###########################################################################
    # Snippet from https://blog.kitware.com/cmake-and-the-default-build-type/
    # Set a default build type if none was specified
    set(DEFAULT_BUILD_TYPE "Release")
    if(EXISTS "${CMAKE_SOURCE_DIR}/.git")
      set(DEFAULT_BUILD_TYPE "Debug")
    endif()

    if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
      message(STATUS "Setting build type to '${DEFAULT_BUILD_TYPE}' as none was specified.")
      set(CMAKE_BUILD_TYPE "${DEFAULT_BUILD_TYPE}" CACHE
          STRING "Choose the type of build." FORCE)
      # Set the possible values of build type for cmake-gui
      set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
        "MinSizeRel" "RelWithDebInfo")
    endif()
    # Snippet from https://blog.kitware.com/cmake-and-the-default-build-type/
    ###########################################################################

    find_program(CCACHE_PROGRAM ccache)
    mark_as_advanced(CCACHE_PROGRAM)

    CMAKE_DEPENDENT_OPTION(BUILD_USING_CCACHE
        "Enable using ccache for speed up compilation." ON
        "CCACHE_PROGRAM" OFF
    )
    if(BUILD_USING_CCACHE)
        set(CMAKE_C_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
    endif(BUILD_USING_CCACHE)

    option(BUILD_SHARED_LIBS "Build libnova as a shared library." ON)
    option(SOFA_REGISTER_PKG "Enable registering package in CMake registry." OFF)

else(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    if(NOT DEFINED BUILD_SHARED_LIBS)
        set(BUILD_SHARED_LIBS ON)
    endif(NOT DEFINED BUILD_SHARED_LIBS)
    set(SOFA_REGISTER_PKG OFF)
endif()

find_library(MATH_LIBRARY m)
mark_as_advanced(MATH_LIBRARY)

# Allow in-tree target execution for PE/COFF systems
if(NOT DEFINED CMAKE_RUNTIME_OUTPUT_DIRECTORY)
    file(MAKE_DIRECTORY bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")
endif()

# traverse the sub directories
add_subdirectory(libsofa)

# Export stuff
write_basic_package_version_file(
    SOFAConfigVersion.cmake
    VERSION ${SOFA_VERSION}
    COMPATIBILITY AnyNewerVersion
)

export(
    EXPORT SOFATargets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/SOFATargets.cmake"
    NAMESPACE SOFA::
)
configure_file(
    SOFAConfig.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/SOFAConfig.cmake"
    COPYONLY
)

install(EXPORT SOFATargets
    FILE
        SOFATargets.cmake
    NAMESPACE
        SOFA::
    DESTINATION
        "${CMAKE_INSTALL_LIBDIR}/cmake/SOFA"
)
install(
    FILES
        "${CMAKE_CURRENT_BINARY_DIR}/SOFAConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/SOFAConfigVersion.cmake"
    DESTINATION
        "${CMAKE_INSTALL_LIBDIR}/cmake/SOFA"
)

if(SOFA_REGISTER_PKG)
    set(CMAKE_EXPORT_NO_PACKAGE_REGISTRY OFF)
else()
    set(CMAKE_EXPORT_NO_PACKAGE_REGISTRY ON)
endif()
export(PACKAGE SOFA)
