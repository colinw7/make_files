ifndef MKECHO
.SILENT:
endif

ifdef MKTRACE
OLD_SHELL := $(SHELL)
SHELL = $(warning [$@])$(OLD_SHELL) -x
endif

ifdef CDEBUG
  CDEBUG = -g
endif

LIBNAME = lib$(PROG).a

LIB = $(LIB_DIR)/$(LIBNAME)

CPP_OBJ   = $(patsubst %.cpp,$(OBJ_DIR)/$(PROG)/%.o,$(CPP_SRC))
CXX_OBJ   = $(patsubst %.cxx,$(OBJ_DIR)/$(PROG)/%.o,$(CXX_SRC))
C_OBJ     = $(patsubst %.c,$(OBJ_DIR)/$(PROG)/%.o,$(C_SRC))
K_FILES   = $(patsubst %.tcl,%.k,$(TCL_FILES))
MOC_CPP   = $(patsubst %.h,moc_%.cpp,$(MOC_HEADERS))
MOC_OBJ   = $(patsubst %.h,$(OBJ_DIR)/$(PROG)/moc_%.o,$(MOC_HEADERS))

ifneq ($(PROG1),)
LIBNAME1 = lib$(PROG1).a

LIB1 = $(LIB_DIR)/$(LIBNAME1)

CPP_OBJ1 = $(patsubst %.cpp,$(OBJ_DIR)/$(PROG)/%.o,$(CPP_SRC1))
CXX_OBJ1 = $(patsubst %.cxx,$(OBJ_DIR)/$(PROG)/%.o,$(CXX_SRC1))
C_OBJ1   = $(patsubst %.c,$(OBJ_DIR)/$(PROG)/%.o,$(C_SRC1))
K_FILES1 = $(patsubst %.tcl,%.k,$(TCL_FILES1))
endif

include $(MAKE_DIR)/rules.mk

MOC_FLAGS = \
-DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED \
-I/usr/share/qt5/mkspecs/linux-g++ -I. \
-I/usr/include/qt5/QtCore \
-I/usr/include/qt5/QtGui \
-I/usr/include/qt5 \
-I/home/colinw/progs/include -I.

all: $(OBJ_DIR)/$(PROG) $(LIB) $(LIB1) tags

$(OBJ_DIR)/$(PROG):
	@mkdir -p $(OBJ_DIR)/$(PROG)

$(CPP_OBJ): $(OBJ_DIR)/$(PROG)/%.o: %.cpp %.h
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CPPFLAGS)

$(CXX_OBJ): $(OBJ_DIR)/$(PROG)/%.o: %.cxx %.h
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CPPFLAGS)

$(C_OBJ): $(OBJ_DIR)/$(PROG)/%.o: %.c %.h
	echo "Compiling $<"
	$(CC_C) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CFLAGS)

$(K_FILES): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(MOC_CPP): moc_%.cpp: %.h
	echo "moc $<"
	/usr/bin/moc-qt5 $(MOC_FLAGS) $< -o moc_$*.cpp

$(MOC_OBJ): $(OBJ_DIR)/$(PROG)/moc_%.o: %.h
	echo "Compiling $<"
	$(CC_CPP) -c moc_$*.cpp -o $(OBJ_DIR)/$(PROG)/moc_$*.o $(CPPFLAGS)

$(LIB): $(K_FILES) $(MOC_CPP) $(MOC_OBJ) $(CPP_OBJ) $(CXX_OBJ) $(C_OBJ) $(EXTRA_DEPS)
	echo "Archiving $(LIBNAME)"
	rm -f $(LIB)
	ar crv $(LIB) $(CPP_OBJ) $(CXX_OBJ) $(C_OBJ) $(MOC_OBJ) > /dev/null

ifneq ($(PROG1),)
$(CPP_OBJ1): $(OBJ_DIR)/$(PROG)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CPPFLAGS)

$(CXX_OBJ1): $(OBJ_DIR)/$(PROG)/%.o: %.cxx
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CPPFLAGS)

$(C_OBJ1): $(OBJ_DIR)/$(PROG)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CFLAGS)

$(K_FILES1): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(LIB1): $(K_FILES1) $(CPP_OBJ1) $(CXX_OBJ1) $(C_OBJ1) $(EXTRA_DEPS)
	echo "Archiving $(LIBNAME1)"
	rm -f $(LIB1)
	ar crv $(LIB1) $(CPP_OBJ1) $(CXX_OBJ1) $(C_OBJ1) > /dev/null
endif

clean:
	rm -f $(CPP_OBJ) $(CXX_OBJ) $(C_OBJ) $(K_FILES) $(MOC_CPP) $(MOC_OBJ) \
              $(CPP_OBJ1) $(CXX_OBJ1) $(C_OBJ1) $(K_FILES1)

tags: $(CPP_SRC) $(CXX_SRC) $(C_SRC) $(CPP_SRC1) $(CXX_SRC1) $(C_SRC1)
	$(CTAGS) $(CTAGS_FLAGS) \
          $(CPP_SRC) $(CXX_SRC) $(C_SRC) \
          $(CPP_SRC1) $(CXX_SRC1) $(C_SRC1)

modernize:
	clang-modernize-3.7 $(CPP_SRC) -- $(INC_PATH) $(EXTRA_CFLAGS) -std=c++14

tidy:
	clang-tidy-3.8 $(CPP_SRC) -- $(INC_PATH) $(EXTRA_CFLAGS) -std=c++14
