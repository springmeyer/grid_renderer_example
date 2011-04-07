all: gridsforkids

install:
	echo 'nothing to install, just run 'make' then open index.html in a browser!'

gridsforkids:
	curl -o wax.ol.js https://github.com/mapbox/wax/raw/master/build/wax.ol.js
	curl -o generate_tiles.py http://svn.openstreetmap.org/applications/rendering/mapnik/generate_tiles.py
	patch -p0 < generate_tiles.diff

clean:
	if test -e "generate_tiles.py"; then rm "generate_tiles.py"; fi
	if test -e "wax.ol.js"; then rm "wax.ol.js"; fi
