#include($$(MAKE_DIR)/qt_lib.mk)

MAKEFILE_GENERATOR = UNIX

QT += widgets x11extras

QMAKE_CXX = g++
#QMAKE_CXX = clang++-3.8

#QMAKE_CXXFLAGS += -std=c++14 -fsanitize=address $(EXTRA_CXXFLAGS)
QMAKE_CXXFLAGS += -std=c++14 $(EXTRA_CXXFLAGS)

CONFIG += debug
CONFIG += staticlib
CONFIG += silent
CONFIG += c++14

TEMPLATE = lib

DEPENDPATH += .

INCLUDEPATH += $(INC_DIR)

OBJECTS_DIR = $(OBJ_DIR)/$$LIBNAME

DESTDIR = $(LIB_DIR)

MOC_DIR = .moc
UI_DIR = .ui

cppcheck_target.target = cppcheck
cppcheck_target.commands = cppcheck $(EXPORT_CPP_SOURCES) $(INCPATH) -D__PIC__
cppcheck_target.depends =

tidy_target.target = tidy
tidy_target.commands = clang-tidy $(EXPORT_CPP_SOURCES) -- $(INCPATH) -std=c++14 -D__PIC__
tidy_target.depends =

clazy_target.target = clazy
clazy_target.commands = clazy $(EXPORT_CPP_SOURCES) $(INCPATH) -std=c++14 -D__PIC__
clazy_target.depends =

QMAKE_EXTRA_TARGETS += cppcheck_target tidy_target clazy_target
