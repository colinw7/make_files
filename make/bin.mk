ifndef MKECHO
.SILENT:
endif

ifdef MKTRACE
OLD_SHELL := $(SHELL)
SHELL = $(warning [$@])$(OLD_SHELL) -x
endif

ifndef CDEBUG
  CDEBUG = -g
endif

ifndef LDEBUG
  LDEBUG = -g
endif

BIN  = $(BIN_DIR)/$(PROG)
BIN1 = $(BIN_DIR)/$(PROG1)
BIN2 = $(BIN_DIR)/$(PROG2)
BIN3 = $(BIN_DIR)/$(PROG3)
BIN4 = $(BIN_DIR)/$(PROG4)
BIN5 = $(BIN_DIR)/$(PROG5)
BIN6 = $(BIN_DIR)/$(PROG6)

ifeq ($(PROG_OBJ),)
PROG_OBJ = $(OBJ_DIR)/$(PROG)
endif

CPP_OBJ = $(patsubst %.cpp,$(PROG_OBJ)/%.o,$(CPP_SRC))
C_OBJ   = $(patsubst %.c,$(PROG_OBJ)/%.o,$(C_SRC))
K_FILES = $(patsubst %.tcl,%.k,$(TCL_FILES))

CPP_OBJ1 = $(patsubst %.cpp,$(PROG_OBJ)/%.o,$(CPP_SRC1))
C_OBJ1   = $(patsubst %.c,$(PROG_OBJ)/%.o,$(C_SRC1))
K_FILES1 = $(patsubst %.tcl,%.k,$(TCL_FILES1))

CPP_OBJ2 = $(patsubst %.cpp,$(PROG_OBJ)/%.o,$(CPP_SRC2))
C_OBJ2   = $(patsubst %.c,$(PROG_OBJ)/%.o,$(C_SRC2))
K_FILES2 = $(patsubst %.tcl,%.k,$(TCL_FILES2))

CPP_OBJ3 = $(patsubst %.cpp,$(PROG_OBJ)/%.o,$(CPP_SRC3))
C_OBJ3   = $(patsubst %.c,$(PROG_OBJ)/%.o,$(C_SRC3))
K_FILES3 = $(patsubst %.tcl,%.k,$(TCL_FILES3))

CPP_OBJ4 = $(patsubst %.cpp,$(PROG_OBJ)/%.o,$(CPP_SRC4))
C_OBJ4   = $(patsubst %.c,$(PROG_OBJ)/%.o,$(C_SRC4))
K_FILES4 = $(patsubst %.tcl,%.k,$(TCL_FILES4))

CPP_OBJ5 = $(patsubst %.cpp,$(PROG_OBJ)/%.o,$(CPP_SRC5))
C_OBJ5   = $(patsubst %.c,$(PROG_OBJ)/%.o,$(C_SRC5))
K_FILES5 = $(patsubst %.tcl,%.k,$(TCL_FILES5))

CPP_OBJ6 = $(patsubst %.cpp,$(PROG_OBJ)/%.o,$(CPP_SRC6))
C_OBJ6   = $(patsubst %.c,$(PROG_OBJ)/%.o,$(C_SRC6))
K_FILES6 = $(patsubst %.tcl,%.k,$(TCL_FILES6))

include $(MAKE_DIR)/rules.mk

all: $(PROG_OBJ) $(BIN) $(BIN1) $(BIN2) $(BIN3) $(BIN4) $(BIN5) $(BIN6);

$(PROG_OBJ):
	@mkdir -p $(PROG_OBJ)

$(CPP_OBJ): $(PROG_OBJ)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(PROG_OBJ)/$*.o $(CPPFLAGS)

$(CPP_OBJ1): $(PROG_OBJ)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(PROG_OBJ)/$*.o $(CPPFLAGS)

$(CPP_OBJ2): $(PROG_OBJ)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(PROG_OBJ)/$*.o $(CPPFLAGS)

$(CPP_OBJ3): $(PROG_OBJ)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(PROG_OBJ)/$*.o $(CPPFLAGS)

$(CPP_OBJ4): $(PROG_OBJ)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(PROG_OBJ)/$*.o $(CPPFLAGS)

$(CPP_OBJ5): $(PROG_OBJ)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(PROG_OBJ)/$*.o $(CPPFLAGS)

$(CPP_OBJ6): $(PROG_OBJ)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(PROG_OBJ)/$*.o $(CPPFLAGS)

$(C_OBJ): $(PROG_OBJ)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(PROG_OBJ)/$*.o $(CFLAGS)

$(C_OBJ1): $(PROG_OBJ)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(PROG_OBJ)/$*.o $(CFLAGS)

$(C_OBJ2): $(PROG_OBJ)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(PROG_OBJ)/$*.o $(CFLAGS)

$(C_OBJ3): $(PROG_OBJ)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(PROG_OBJ)/$*.o $(CFLAGS)

$(C_OBJ4): $(PROG_OBJ)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(PROG_OBJ)/$*.o $(CFLAGS)

$(C_OBJ5): $(PROG_OBJ)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(PROG_OBJ)/$*.o $(CFLAGS)

$(C_OBJ6): $(PROG_OBJ)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(PROG_OBJ)/$*.o $(CFLAGS)

$(K_FILES): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(K_FILES1): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(K_FILES2): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(K_FILES3): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(K_FILES4): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(K_FILES5): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(K_FILES6): %.k: %.tcl
	echo "Preprocessing $<"
	my_tk_to_k $<

$(BIN): $(K_FILES) $(CPP_OBJ) $(C_OBJ) $(EXTRA_DEPS)
	@echo "Linking $(PROG)"
	$(CC_CPP) -o $(BIN) $(CPP_OBJ) $(C_OBJ) $(LFLAGS) $(LIBS)

ifneq ($(PROG1),)
$(BIN1): $(K_FILES1) $(CPP_OBJ1) $(C_OBJ1) $(EXTRA_DEPS)
	@echo "Linking $(PROG1)"
	$(CC_CPP) -o $(BIN1) $(CPP_OBJ1) $(C_OBJ1) $(LFLAGS) $(LIBS)
endif

ifneq ($(PROG2),)
$(BIN2): $(K_FILES2) $(CPP_OBJ2) $(C_OBJ2) $(EXTRA_DEPS)
	@echo "Linking $(PROG2)"
	$(CC_CPP) -o $(BIN2) $(CPP_OBJ2) $(C_OBJ2) $(LFLAGS) $(LIBS)
endif

ifneq ($(PROG3),)
$(BIN3): $(K_FILES3) $(CPP_OBJ3) $(C_OBJ3) $(EXTRA_DEPS)
	@echo "Linking $(PROG3)"
	$(CC_CPP) -o $(BIN3) $(CPP_OBJ3) $(C_OBJ3) $(LFLAGS) $(LIBS)
endif

ifneq ($(PROG4),)
$(BIN4): $(K_FILES4) $(CPP_OBJ4) $(C_OBJ4) $(EXTRA_DEPS)
	@echo "Linking $(PROG4)"
	$(CC_CPP) -o $(BIN4) $(CPP_OBJ4) $(C_OBJ4) $(LFLAGS) $(LIBS)
endif

ifneq ($(PROG5),)
$(BIN5): $(K_FILES5) $(CPP_OBJ5) $(C_OBJ5) $(EXTRA_DEPS)
	@echo "Linking $(PROG5)"
	$(CC_CPP) -o $(BIN5) $(CPP_OBJ5) $(C_OBJ5) $(LFLAGS) $(LIBS)
endif

ifneq ($(PROG6),)
$(BIN6): $(K_FILES6) $(CPP_OBJ6) $(C_OBJ6) $(EXTRA_DEPS)
	@echo "Linking $(PROG6)"
	$(CC_CPP) -o $(BIN6) $(CPP_OBJ6) $(C_OBJ6) $(LFLAGS) $(LIBS)
endif

clean:
	rm -f $(CPP_OBJ) $(C_OBJ) $(K_FILES)

clean-bin:
	rm -f $(BIN)

all_libs:
	make_libs $(LIBNAMES)

all_clean_libs:
	make_libs -clean $(LIBNAMES)
