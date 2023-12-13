CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

OUTPUT_FILE = $(BIN_DIR)/matop

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OUTPUT_FILE): $(OBJ_FILES)
	$(CC) $(CFLAGS) $^ -o $@

.PHONY: clean run

run: $(OUTPUT_FILE)
	./$(OUTPUT_FILE) -s -x 5 -y 5
	./$(OUTPUT_FILE) -m -x 5 -y 5
	./$(OUTPUT_FILE) -t -x 5 -y 5

clean:
	rm -f $(OBJ_DIR)/*.o $(OUTPUT_FILE)
