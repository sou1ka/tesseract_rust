set(WebP_VERSION 1.2.4)
set(WEBP_VERSION ${WebP_VERSION})


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was WebPConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include(CMakeFindDependencyMacro)
find_dependency(Threads)
include ("${CMAKE_CURRENT_LIST_DIR}/WebPTargets.cmake")

get_filename_component(_vcpkg_libwebp_root "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)
set(WebP_INCLUDE_DIRS "${_vcpkg_libwebp_root}/include")
set(WEBP_INCLUDE_DIRS ${WebP_INCLUDE_DIRS})
set(WebP_LIBRARIES "")
include(SelectLibraryConfigurations)
foreach(_vcpkg_libwebp_lib IN ITEMS webpdecoder;webp;webpdemux;webpmux)
    string(REPLACE "libwebpmux" "webpmux" _vcpkg_libwebp_lib "${_vcpkg_libwebp_lib}") # offical OUTPUT_NAME
    find_library(_vcpkg_${_vcpkg_libwebp_lib}_LIBRARY_RELEASE NAMES ${_vcpkg_libwebp_lib} NAMES_PER_DIR PATHS "${_vcpkg_libwebp_root}/lib" NO_DEFAULT_PATH)
    find_library(_vcpkg_${_vcpkg_libwebp_lib}_LIBRARY_DEBUG NAMES ${_vcpkg_libwebp_lib}d ${_vcpkg_libwebp_lib} NAMES_PER_DIR PATHS "${_vcpkg_libwebp_root}/debug/lib" NO_DEFAULT_PATH)
    select_library_configurations(_vcpkg_${_vcpkg_libwebp_lib})
    list(APPEND WebP_LIBRARIES ${_vcpkg_${_vcpkg_libwebp_lib}_LIBRARIES})
endforeach()
set(WEBP_LIBRARIES "${WebP_LIBRARIES}")
unset(_vcpkg_libwebp_root)
