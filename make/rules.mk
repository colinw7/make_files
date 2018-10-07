.SUFFIXES: .cpp .i .dep

CC_CPP = g++
#CC_CPP = clang++-3.5

CC_C = gcc
#CC_C = clang-3.5

AR = ar

CTAGS = ctags

FULLWARN = \
-Wall -Werror -Wextra -Wuninitialized -Wpointer-arith -pedantic \

FULLWARN1 = \
-Wall -Werror -Wextra -Wpointer-arith \
-Werror -Wextra -Wmissing-declarations \
-Wunsafe-loop-optimizations -Wwrite-strings \
-Wabi -Wctor-dtor-privacy -Woverloaded-virtual \
-Weffc++ -pedantic -Wall

ifdef NO_WARN_PEDANTIC
FULLWARN = -Wall -Werror -Wextra -Wuninitialized -Wpointer-arith
endif

ifeq "$(MACHINE_TYPE)" "osx"
CTAGS_FLAGS = -w
else
CTAGS_FLAGS = --extra=+q
endif

X11_LIBS = \
-lXt -lX11 -lXext

ifeq "$(MACHINE_TYPE)" "osx"
READLINE_LIBS = \
-lmy_readline -lcurses
else
READLINE_LIBS = \
-lreadline -lcurses
endif

TCL_LIBS = -ltk -ltcl

TIX_LIBS = -ltix $(TCL_LIBS)

ifeq "$(MACHINE_TYPE)" "osx"
GL_LIBS = \
-framework GLUT \
-Wl,-dylib_file,$(LIB_DIR)/libGL.dylib:$(LIB_DIR)/libGL.dylib \
-framework OpenGL
else
GL_LIBS = -lglut -lGLU -lGL
endif

PIXEL_RENDERER_LIBS = \
-lCPixelRenderer -lCImagePixelRenderer -lCImageDraw -lCPixelClip -lCSymbol2D \
-lCFreeType -lCConfig -lfreetype

RENDERER_2D_LIBS = \
-lCRenderer2D -lCImageRenderer2D -lCPath2D \
$(PIXEL_RENDERER_LIBS)

X_RENDERER_2D_LIBS = \
-lCXLibRenderer2D -lCXLibPixelRenderer -lCXLib -lCXrtFont \
$(RENDERER_2D_LIBS)

IMAGE_LIBS = \
-lpng -lz -ljpeg

STD_LIBS = \
-lm -lc

QT_INC_PATH = \
-I/usr/include/qt5/Qt -I/usr/include/qt5/QtCore -I/usr/include/qt5/QtGui -I/usr/include/qt5

QT_LIB_PATH = \
-L/usr/lib

QT_LIBS = \
-lQtGui -lQtCore -lpthread

ifdef QT
INC_PATH = \
-I$(INC_DIR) \
$(QT_INC_PATH) \
-I../../include \
-I..
else
INC_PATH = \
-I$(INC_DIR) \
-I$(OLD_INC_DIR) \
-I$(TCL_INC_DIR) \
-I$(TK_INC_DIR) \
-I$(X11_INC_DIR) \
-I$(XM_INC_DIR) \
-I/usr/include/freetype2 \
-I../../include \
-I.. \
-I.
endif

ifdef QT
LIB_PATH = \
-L$(LIB_DIR) \
-L/usr/local/lib \
$(QT_LIB_PATH)
else
LIB_PATH = \
-L$(LIB_DIR) \
-L$(TCL_LIB_DIR) \
-L$(TK_LIB_DIR) \
-L$(X11_LIB_DIR) \
-L$(XM_LIB_DIR) \
-L/usr/local/lib
endif

CFLAGS = \
$(CDEBUG) \
-D_FILE_OFFSET_BITS=64 \
-D_HAS_LONG_LONG \
$(INC_PATH) \
$(EXTRA_CFLAGS)

CPPFLAGS = \
$(CDEBUG) \
$(FULLWARN) \
-std=c++14 \
-D_FILE_OFFSET_BITS=64 \
$(INC_PATH) \
$(EXTRA_CFLAGS)

LFLAGS = \
$(LDEBUG) \
$(FULLWARN) \
$(LIB_PATH) \
$(EXTRA_LFLAGS)

DLIBS = $(patsubst %,-l%,$(LIBNAMES))

.PHONY: clean

.PHONY: modernize

ifdef PROG
.cpp.o:
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CPPFLAGS)
else
.cpp.o:
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $*.o $(CPPFLAGS)
endif

ifdef PROG
.c.o:
	echo "Compiling $<"
	$(CC_C) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CFLAGS)
else
.c.o:
	echo "Compiling $<"
	$(CC_C) -c $< -o $*.o $(CFLAGS)
endif

.tcl.k:
	echo "Preprocessing $<"
	my_tk_to_k $<

.cpp.i:
	echo "Compiling $<"
	$(CC_CPP) -E -c $< -o $*.i $(CPPFLAGS)

.cpp.dep:
	echo "Compiling $<"
	$(CC_CPP) -E -MM -MG -MP -c $< -o $*.dep $(CPPFLAGS)

print-%: ; @$(error $* is $($*) ($(value $*)) (from $(origin $*)))
