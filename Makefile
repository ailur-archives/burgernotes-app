CC = gcc
CFLAGS = -Wall -Wextra -g
PKG_CONFIG = pkg-config
GTK_LIBS = $(shell $(PKG_CONFIG) --libs gtk+-3.0)
WEBKIT_LIBS = $(shell $(PKG_CONFIG) --libs webkit2gtk-4.1
LIBS = $(GTK_LIBS) $(WEBKIT_LIBS)
INCLUDES = $(shell $(PKG_CONFIG) --cflags gtk+-3.0 webkit2gtk-4.1

SRCS = pageburger.c
OBJS = $(SRCS:.c=.o)
TARGET = pageburger

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET) $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
