ifndef MKECHO
.SILENT:
endif

LIBNAME = lib$(PROG).so

LIB = $(LIB_DIR)/$(LIBNAME)

CPP_OBJ = $(patsubst %.cpp,$(OBJ_DIR)/$(PROG)/%.o,$(CPP_SRC))
C_OBJ   = $(patsubst %.c,$(OBJ_DIR)/$(PROG)/%.o,$(C_SRC))

include $(MAKE_DIR)/rules.mk

CFLAGS += -fPIC

all: $(OBJ_DIR)/$(PROG) $(LIB)

$(OBJ_DIR)/$(PROG):
	@mkdir -p $(OBJ_DIR)/$(PROG)

$(CPP_OBJ): $(OBJ_DIR)/$(PROG)/%.o: %.cpp
	echo "Compiling $<"
	$(CC_CPP) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CFLAGS)

$(C_OBJ): $(OBJ_DIR)/$(PROG)/%.o: %.c
	echo "Compiling $<"
	$(CC_C) -c $< -o $(OBJ_DIR)/$(PROG)/$*.o $(CFLAGS)

$(LIB): $(CPP_OBJ) $(C_OBJ)
	echo "Creating Shared Lib $(LIBNAME)"
	rm -f $(LIB)
	$(CC_CPP) -shared -o $(LIB) $(CPP_OBJ) $(C_OBJ)

clean:
	rm -f $(CPP_OBJ) $(C_OBJ)
