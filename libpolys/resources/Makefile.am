libresources_LIBRARIES=libresources.a libresources_g.a
libresourcesdir = $(libdir)/singular

CXXTEMPLFLAGS      =  --no-exceptions ## -fno-implicit-templates

libresources_a_CFLAGS   = -O3 -fomit-frame-pointer ${PIPE}
libresources_g_a_CFLAGS = ${PIPE}

libresources_a_CXXFLAGS   = -O3 -fomit-frame-pointer --no-rtti ${PIPE} ${CXXTEMPLFLAGS}
libresources_g_a_CXXFLAGS = -g -Wextra -Wall -pedantic -Wno-long-long ${PIPE} ${CXXTEMPLFLAGS}
# -fdiagnostics-show-option 

libresources_a_CPPFLAGS   = -DNDEBUG -DOM_NDEBUG
#libresources_g_a_CPPFLAGS =

INCLUDES = -I${top_srcdir} -I${top_srcdir}/.. -I${top_builddir} -I${top_builddir}/..

SOURCES = feFopen.cc feResource.cc
libresources_a_SOURCES   = $(SOURCES)
libresources_g_a_SOURCES = $(SOURCES)

libresources_includedir  =$(includedir)/singular/resources

libresources_include_HEADERS   = feFopen.h feResource.h



