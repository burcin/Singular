libreporter_LIBRARIES=libreporter.a libreporter_g.a
libreporterdir = $(libdir)/singular

CXXTEMPLFLAGS =  --no-exceptions ## -fno-implicit-templates

libreporter_a_CFLAGS   = -O3 -fomit-frame-pointer ${PIPE}
libreporter_g_a_CFLAGS = ${PIPE}

libreporter_a_CXXFLAGS   = -O3 -fomit-frame-pointer --no-rtti ${PIPE} ${CXXTEMPLFLAGS}
libreporter_g_a_CXXFLAGS = -g -Wextra -Wall -pedantic -Wno-long-long ${PIPE} ${CXXTEMPLFLAGS}
# -fdiagnostics-show-option 

libreporter_a_CPPFLAGS   = -DNDEBUG -DOM_NDEBUG -DHAVE_CONFIG_H
libreporter_g_a_CPPFLAGS = -DHAVE_CONFIG_H

INCLUDES = -I${top_srcdir} -I${top_srcdir}/.. -I${top_builddir} -I${top_builddir}/..

SOURCES  = dError.c reporter.cc
libreporter_a_SOURCES   = $(SOURCES)
libreporter_g_a_SOURCES = $(SOURCES)

libreporter_includedir  =$(includedir)/singular/reporter

libreporter_include_HEADERS   = reporter.h 



