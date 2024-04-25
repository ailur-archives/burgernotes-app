DESTDIR = /usr/bin
SHAREDIR = /usr/share
GO = /usr/bin/go

.PHONY: all clean

all: burgernotes

burgernotes:
	$(GO) build

clean:
	rm -f burgernotes-app

install: burgernotes
	mkdir -p $(DESTDIR)
	mkdir -p $(SHAREDIR)/burgernotes
	cp burgernotes-app $(SHAREDIR)/burgernotes/burgernotes
	ln -sf $(SHAREDIR)/burgernotes/burgernotes $(DESTDIR)/burgernotes
	mkdir -p $(SHAREDIR)/icons/hicolor/scalable/apps/
	mkdir -p $(SHAREDIR)/applications/
	mkdir -p $(SHAREDIR)/metainfo/
	cp org.hectabit.Burgernotes.svg $(SHAREDIR)/icons/hicolor/scalable/apps/
	cp org.hectabit.Burgernotes.desktop $(SHAREDIR)/applications/
	cp org.hectabit.Burgernotes.metainfo.xml $(SHAREDIR)/metainfo/
	cp -r website $(SHAREDIR)/burgernotes/website
	cp createwebsite.sh $(SHAREDIR)/burgernotes/
