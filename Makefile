CC = gcc
DESTDIR = /usr/bin
SHAREDIR = /usr/share
CFLAGS = -Wall -Wextra -g
PKG_CONFIG = pkg-config
GTK_LIBS = $(shell $(PKG_CONFIG) --libs gtk+-3.0)
WEBKIT_LIBS = $(shell $(PKG_CONFIG) --libs webkit2gtk-4.1)
LIBS = $(GTK_LIBS) $(WEBKIT_LIBS)
INCLUDES = $(shell $(PKG_CONFIG) --cflags gtk+-3.0 webkit2gtk-4.1)

SRCS = burgernotes.c
OBJS = $(SRCS:.c=.o)
TARGET = burgernotes

.PHONY: all clean

all: burgernotes

burgernotes: $(TARGET)
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET) $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

install: burgernotes
	mkdir -p $(DESTDIR)
	mkdir -p $(SHAREDIR)/burgernotes
	cp burgernotes $(SHAREDIR)/burgernotes/
	ln -sf $(SHAREDIR)/burgernotes/burgernotes $(DESTDIR)/burgernotes
	mkdir -p $(SHAREDIR)/icons/hicolor/scalable/apps/
	mkdir -p $(SHAREDIR)/applications/
	mkdir -p $(SHAREDIR)/metainfo/
	cp org.hectabit.Burgernotes.svg $(SHAREDIR)/icons/hicolor/scalable/apps/
	cp org.hectabit.Burgernotes.desktop $(SHAREDIR)/applications/
	cp org.hectabit.Burgernotes.metainfo.xml $(SHAREDIR)/metainfo/
	cp -r website $(SHAREDIR)/burgernotes/website
