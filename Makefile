.RECIPEPREFIX +=

BIN = bin
SRC = src
CC = gcc
CFLAGS = -Wall -I. -g -O2

$(BIN)/libmcpp.a: \
        $(SRC)/main.o $(SRC)/directive.o $(SRC)/eval.o $(SRC)/expand.o \
        $(SRC)/mbchar.o $(SRC)/support.o $(SRC)/system.o
    @mkdir -p $(BIN)
    @echo "  AR  $(BIN)/libmcpp.a"
    @ar cr $(BIN)/libmcpp.a \
        $(SRC)/main.o $(SRC)/directive.o $(SRC)/eval.o $(SRC)/expand.o \
        $(SRC)/mbchar.o $(SRC)/support.o $(SRC)/system.o

$(SRC)/%.o: $(SRC)/%.c
    @echo "  CC  $<"
    @$(CC) $(CFLAGS) -o $@ -c $<

clean:
    rm -rf $(BIN) $(SRC)/*.o
