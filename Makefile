VERSION = $(shell grep ^VERSION radio | cut -d= -f2)


all:
	@echo 'try make install'

dist:
	tar czf radio-$(VERSION).tgz radio README

install:
	install -m 755 radio /usr/local/bin/radio
	@echo "Don't forget to install stations, see README"
