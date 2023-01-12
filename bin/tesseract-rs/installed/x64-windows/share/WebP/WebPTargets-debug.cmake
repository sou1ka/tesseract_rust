#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "WebP::webpdecoder" for configuration "Debug"
set_property(TARGET WebP::webpdecoder APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(WebP::webpdecoder PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/webpdecoder.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/webpdecoder.dll"
  )

list(APPEND _cmake_import_check_targets WebP::webpdecoder )
list(APPEND _cmake_import_check_files_for_WebP::webpdecoder "${_IMPORT_PREFIX}/debug/lib/webpdecoder.lib" "${_IMPORT_PREFIX}/debug/bin/webpdecoder.dll" )

# Import target "WebP::webp" for configuration "Debug"
set_property(TARGET WebP::webp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(WebP::webp PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/webp.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/webp.dll"
  )

list(APPEND _cmake_import_check_targets WebP::webp )
list(APPEND _cmake_import_check_files_for_WebP::webp "${_IMPORT_PREFIX}/debug/lib/webp.lib" "${_IMPORT_PREFIX}/debug/bin/webp.dll" )

# Import target "WebP::webpdemux" for configuration "Debug"
set_property(TARGET WebP::webpdemux APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(WebP::webpdemux PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/webpdemux.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/webpdemux.dll"
  )

list(APPEND _cmake_import_check_targets WebP::webpdemux )
list(APPEND _cmake_import_check_files_for_WebP::webpdemux "${_IMPORT_PREFIX}/debug/lib/webpdemux.lib" "${_IMPORT_PREFIX}/debug/bin/webpdemux.dll" )

# Import target "WebP::libwebpmux" for configuration "Debug"
set_property(TARGET WebP::libwebpmux APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(WebP::libwebpmux PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/webpmux.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/webpmux.dll"
  )

list(APPEND _cmake_import_check_targets WebP::libwebpmux )
list(APPEND _cmake_import_check_files_for_WebP::libwebpmux "${_IMPORT_PREFIX}/debug/lib/webpmux.lib" "${_IMPORT_PREFIX}/debug/bin/webpmux.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
