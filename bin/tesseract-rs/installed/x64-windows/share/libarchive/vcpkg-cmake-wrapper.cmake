cmake_policy(PUSH)
cmake_policy(SET CMP0012 NEW)
cmake_policy(SET CMP0057 NEW)
set(z_vcpkg_libarchive_args "")
if("REQUIRED" IN_LIST ARGS)
    list(APPEND z_vcpkg_libarchive_args "REQUIRED")
endif()
if("QUIET" IN_LIST ARGS)
    list(APPEND z_vcpkg_libarchive_args "QUIET")
endif()

_find_package(${ARGS})

if(LibArchive_FOUND AND "dynamic" STREQUAL "static")
    set(z_vcpkg_libarchive_libs "")
    find_package(ZLIB ${z_vcpkg_libarchive_args})
    list(APPEND z_vcpkg_libarchive_libs ZLIB::ZLIB)
    if(ON)
        find_package(BZip2 ${z_vcpkg_libarchive_args})
        list(APPEND z_vcpkg_libarchive_libs BZip2::BZip2)
    endif()
    if(ON)
        find_package(LibXml2 ${z_vcpkg_libarchive_args})
        list(APPEND z_vcpkg_libarchive_libs LibXml2::LibXml2)
    endif()
    if(ON)
        find_package(lz4 CONFIG ${z_vcpkg_libarchive_args})
        list(APPEND z_vcpkg_libarchive_libs lz4::lz4)
    endif()
    if(ON)
        find_package(LibLZMA ${z_vcpkg_libarchive_args})
        list(APPEND z_vcpkg_libarchive_libs LibLZMA::LibLZMA)
    endif()
    if(OFF)
        include(SelectLibraryConfigurations)
        find_library(Z_VCPKG_LZO_LIBRARY_DEBUG NAMES lzo2d lzo2 NAMES_PER_DIR PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug/lib" NO_DEFAULT_PATH)
        find_library(Z_VCPKG_LZO_LIBRARY_RELEASE NAMES lzo2 NAMES_PER_DIR PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib" NO_DEFAULT_PATH)
        select_library_configurations(Z_VCPKG_LZO)
        if(Z_VCPKG_LZO_LIBRARY)
            list(APPEND z_vcpkg_libarchive_libs ${Z_VCPKG_LZO_LIBRARY})
        else()
            set(LibArchive_FOUND FALSE)
        endif()
    endif()
    if(ON)
        find_package(zstd ${z_vcpkg_libarchive_args})
        if(TARGET zstd::libzstd_shared)
            list(APPEND z_vcpkg_libarchive_libs zstd::libzstd_shared)
        else(TARGET zstd::libzstd_shared)
            list(APPEND z_vcpkg_libarchive_libs zstd::libzstd_static)
        endif(TARGET zstd::libzstd_shared)
    endif()
    if(ON AND NOT CMAKE_SYSTEM_NAME MATCHES "Darwin")
        find_package(OpenSSL ${z_vcpkg_libarchive_args})
        list(APPEND z_vcpkg_libarchive_libs OpenSSL::Crypto)
    endif()

    list(APPEND LibArchive_LIBRARIES ${z_vcpkg_libarchive_libs})
    if(TARGET LibArchive::LibArchive)
        if(Z_VCPKG_LZO_LIBRARY AND Z_VCPKG_LZO_LIBRARY_DEBUG)
            list(REMOVE_ITEM z_vcpkg_libarchive_libs ${Z_VCPKG_LZO_LIBRARY})
            list(APPEND z_vcpkg_libarchive_libs
                "\$<\$<NOT:\$<CONFIG:DEBUG>>:${Z_VCPKG_LZO_LIBRARY_RELEASE}>"
                "\$<\$<CONFIG:DEBUG>:${Z_VCPKG_LZO_LIBRARY_DEBUG}>"
            )
        endif()
        set_property(TARGET LibArchive::LibArchive APPEND PROPERTY INTERFACE_LINK_LIBRARIES ${z_vcpkg_libarchive_libs})
    endif()
    unset(z_vcpkg_libarchive_libs)
endif()
unset(z_vcpkg_libarchive_args)
cmake_policy(POP)
