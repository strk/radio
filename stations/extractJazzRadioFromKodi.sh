#!/bin/sh

me=`basename $0`
grep http \
  ~/.kodi/userdata/addon_data/plugin.audio.jazzradio.com/cacheChannels.json \
  | cut -d"'" -f2 | 
while read R; do
 sn=`echo "${R}" | sed 's/.*jr_\(.*\)/JazzRadio_\1/'`
 echo "# Extracted whith ${me}"> $sn
 echo "$R" >> $sn
done
