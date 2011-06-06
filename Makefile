all: gridsforkids

install:
	echo 'nothing to install, just run 'make' then open index.html in a browser!'

gridsforkids:
	mkdir -p ext/
	curl -o ext/OpenLayers.js https://raw.github.com/mapbox/wax/master/ext/OpenLayers.js
	curl -o ext/modestmaps.js https://raw.github.com/mapbox/wax/master/ext/modestmaps.min.js
	curl -o ext/reqwest.min.js https://raw.github.com/mapbox/wax/master/ext/reqwest.min.js
	mkdir -p dist
	curl -o dist/wax.ol.min.js https://raw.github.com/mapbox/wax/master/dist/wax.ol.min.js
	curl -o dist/wax.ol.js https://raw.github.com/mapbox/wax/master/dist/wax.ol.js
	curl -o dist/wax.mm.min.js https://raw.github.com/mapbox/wax/master/dist/wax.mm.min.js

tiles:
	mkdir -p tiles/1.0.0/world/
	cp layer.json tiles/1.0.0/world/
	export MAPNIK_MAP_FILE=stylesheet.xml && export MAPNIK_TILE_DIR=tiles/1.0.0/world/ && ./generate_tiles.py
	echo 'now you can open the index.html!'

clean:
	if test -e "./tiles"; then rm -r "./tiles"; fi
	if test -e "./ext/"; then rm -r "./ext/"; fi
	if test -e "./dist/"; then rm -r "./dist/"; fi

test:
	open -a Safari index.html