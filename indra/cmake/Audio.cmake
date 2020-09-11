# -*- cmake -*-
include(Prebuilt)

if (USESYSTEMLIBS)
  include(FindPkgConfig)
  pkg_check_modules(OGG REQUIRED ogg)
  pkg_check_modules(VORBIS REQUIRED vorbis)
  pkg_check_modules(VORBISENC REQUIRED vorbisenc)
  pkg_check_modules(VORBISFILE REQUIRED vorbisfile)
else (USESYSTEMLIBS)
  use_prebuilt_binary(ogg_vorbis)
  set(VORBIS_INCLUDE_DIRS ${LIBS_PREBUILT_DIR}/include)
  set(VORBISFILE_INCLUDE_DIRS ${VORBIS_INCLUDE_DIRS})

  if (WINDOWS)
    set(OGG_LIBRARIES
        optimized libogg
        debug libogg)
    set(VORBIS_LIBRARIES
        optimized libvorbis
        debug libvorbis)
    set(VORBISFILE_LIBRARIES
        optimized libvorbisfile
        debug libvorbisfile)
  else (WINDOWS)
    set(OGG_LIBRARIES ogg)
    set(VORBIS_LIBRARIES vorbis)
    set(VORBISFILE_LIBRARIES vorbisfile)
  endif (WINDOWS)
endif (USESYSTEMLIBS)

link_directories(
    ${VORBIS_LIBRARY_DIRS}
    ${VORBISFILE_LIBRARY_DIRS}
    ${OGG_LIBRARY_DIRS}
    )
