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
	wget http://strk.keybit.net/code/radio/MiscStations.tgz && \
	tar xzf MiscStations.tgz && \
	rm MiscStations.tgz && \
	wget http://strk.keybit.net/code/radio/JazzRadioStations.tgz && \
	tar xzf JazzRadioStations.tgz && \
	rm JazzRadioStations.tgz 
