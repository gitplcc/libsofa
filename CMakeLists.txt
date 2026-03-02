#  CMakeLists.txt
#  
#  Copyright (c) 2021-2026, Pedro Luis Castedo Cepeda
#  SPDX-License-Identifier: BSD-3-Clause 

cmake_minimum_required(VERSION 3.28...4.2)

include(FetchContent)
FetchContent_Declare(
  sofa
  URL  https://www.iausofa.org/s/sofa_c-20231011tar.gz
)
FetchContent_MakeAvailable(sofa)
 
project(SOFA VERSION 0.19.0 LANGUAGES C)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)
include(CMakeDependentOption)
include(CheckPIESupported)

check_pie_supported(LANGUAGES C)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
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
