.RECIPEPREFIX +=

BIN = bin
SRC = src
CC = gcc
AR = ar
CFLAGS = -Wall -I. -g -O2

$(BIN)/libmcpp.a: \
        $(SRC)/main.o $(SRC)/directive.o $(SRC)/eval.o $(SRC)/expand.o \
        $(SRC)/mbchar.o $(SRC)/support.o $(SRC)/system.o
    @mkdir -p $(BIN)
    @echo "  AR  $(BIN)/libmcpp.a"
    @$(AR) cr $(BIN)/libmcpp.a \
        $(SRC)/main.o $(SRC)/directive.o $(SRC)/eval.o $(SRC)/expand.o \
        $(SRC)/mbchar.o $(SRC)/support.o $(SRC)/system.o

$(SRC)/%.o: $(SRC)/%.c
    @echo "  CC  $<"
    @$(CC) $(CFLAGS) -o $@ -c $<

win32:
    "$(MAKE)" CC=i686-w64-mingw32-gcc AR=i686-w64-mingw32-ar

win64:
    "$(MAKE)" CC=x86_64-w64-mingw32-gcc AR=x86_64-w64-mingw32-ar

clean:
    rm -rf $(BIN) $(SRC)/*.o
