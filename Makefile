VERSION = $(shell grep ^VERSION radio | cut -d= -f2)


all:
	@echo 'try: '
	@echo '  make install'
	@echo '  make install-stations'

dist:
	tar czf radio-$(VERSION).tgz radio README

install:
	install -m 755 radio /usr/local/bin/radio
	@echo "Don't forget to install stations, see README"

install-stations:
	mkdir -p /etc/radio && \
	cd /etc/radio && \
	wget --quiet -R 'robots.*' -R 'index.html*' --mirror --no-parent --no-directories http://strk.keybit.net/code/radio/stations/ && \
	rm -f robots.txt
