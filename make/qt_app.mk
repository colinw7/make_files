#include($$(MAKE_DIR)/qt_app.mk)

MAKEFILE_GENERATOR = UNIX

QT += widgets x11extras

QMAKE_CXX = g++
#QMAKE_CXX = clang++-3.8

QMAKE_LINK = g++

#QMAKE_CXXFLAGS += -std=c++14 -fsanitize=address $(EXTRA_CXXFLAGS)
QMAKE_CXXFLAGS += -std=c++14 $(EXTRA_CXXFLAGS)

CDEBUG = -g
LDEBUG = -g

QMAKE_CXXFLAGS += $$EXTRA_INC_DIR

CONFIG += debug
CONFIG -= app_bundle
CONFIG += silent

TEMPLATE = app

DEPENDPATH += .

INCLUDEPATH += $(INC_DIR)

MOC_DIR = .moc
UI_DIR = .ui

REGEXP_LIBS = -lCRegExp -ltre

IMAGE_LIBS = -ljpeg -lpng -lX11

CIMAGE_LIBS = \
-lCImageLib -lCFont -lCFileParse -lCFileUtil -lCTempFile -lCFile -lCEnv -lCMath \
-lCOS -lCStrUtil -lCPrintF $$REGEXP_LIBS $$IMAGE_LIBS

PIXEL_RENDERER_LIBS = \
-lCPixelRenderer -lCImagePixelRenderer -lCImageDraw -lCPixelClip \
-lCFreeType -lCConfig -lfreetype

RENDERER_2D_LIBS = \
-lCRenderer2D -lCImageRenderer2D -lCPath2D -lCAxis2D \
$$PIXEL_RENDERER_LIBS

QPIXEL_RENDERER_LIBS = \
-lCQWidgetPixelRenderer -lCQPixelRenderer -lCQImagePixelRenderer

#GL_LIBS = \
#-framework GLUT \
#-Wl,-dylib_file,$(LIB_DIR)/libGL.dylib:$(LIB_DIR)/libGL.dylib \
#-framework OpenGL

GL_LIBS = \
-lglut -lGL

QT_OBJ_EDIT_APP_LIBS = \
-lCQStyle -lCQApp -lCQObjEdit -lCQPicker \
-lCQColorChooser -lCQFontChooser -lCQPaletteChooser -lCQFontDialog \
-lCQWindow -lCWindow -lCQStyle -lCQPixmapCache \
$$QPIXEL_RENDERER_LIBS \
$$RENDERER_2D_LIBS \
-lCQUtil -lCQFont -lCQImage

QT_APP_LIBS = \
-lCQStyle -lCQApp -lCQMetaEdit -lCQPicker -lCQLinkLabel -lCQToolTip \
-lCQTreeView -lCQHeaderView \
-lCQColorChooser -lCQFontChooser -lCQPaletteChooser -lCQFontDialog \
-lCQWindow -lCWindow -lCQStyle -lCQPixmapCache \
$$QPIXEL_RENDERER_LIBS \
$$RENDERER_2D_LIBS \
-lCQUtil -lCQFont -lCQImage

QT_OBJ_EDIT_LIBS = \
-lCQObjEdit -lCQColorChooser -lCQFontChooser -lCQPaletteChooser -lCQFontDialog \
-lCQPicker

TARGET = $$APPNAME

OBJECTS_DIR = $(OBJ_DIR)/$$TARGET

DESTDIR = $(BIN_DIR)

#unix:LIBS += -L$(LIB_DIR) -lasan
unix:LIBS += -L$(LIB_DIR)

tags.target = tags
tags.commands = ctags $(SOURCES)
tags.depends = $(SOURCES)

QMAKE_EXTRA_TARGETS += tags
