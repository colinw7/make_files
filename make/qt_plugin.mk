#include($$(MAKE_DIR)/qt_plugin.mk)

MAKEFILE_GENERATOR = UNIX

QMAKE_CXX = g++

QMAKE_CXXFLAGS += -std=c++14

CONFIG += plugin
CONFIG += silent

TEMPLATE = lib

DEPENDPATH += .

INCLUDEPATH += $(INC_DIR)

OBJECTS_DIR = $(OBJ_DIR)/$$LIBNAME

DESTDIR = $(LIB_DIR)
