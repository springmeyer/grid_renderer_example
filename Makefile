all: gridsforkids

install:
	echo 'nothing to install, just run 'make' then open index.html in a browser!'

gridsforkids:
	mkdir -p ext/
	curl -o ext/OpenLayers.js https://github.com/mapbox/wax/raw/master/ext/OpenLayers.js
	curl -o ext/modestmaps.js https://github.com/mapbox/wax/raw/master/ext/modestmaps.js
	curl -o ext/jquery-1.5.min.js https://github.com/mapbox/wax/raw/master/ext/jquery-1.5.min.js
	curl -o ext/reqwest.min.js https://github.com/mapbox/wax/raw/master/ext/reqwest.min.js
	mkdir -p build
	curl -o build/wax.ol.min.js https://github.com/mapbox/wax/raw/master/build/wax.ol.min.js
	curl -o build/wax.ol.js https://github.com/mapbox/wax/raw/master/build/wax.ol.js
	curl -o build/wax.mm.min.js https://github.com/mapbox/wax/raw/master/build/wax.mm.min.js
	#curl -o generate_tiles.py http://svn.openstreetmap.org/applications/rendering/mapnik/generate_tiles.py
	#patch -p0 < generate_tiles.diff
	#chmod +x generate_tiles.py

tiles:
	mkdir -p tiles/1.0.0/world/
	cp layer.json tiles/1.0.0/world/
	export MAPNIK_MAP_FILE=stylesheet.xml && export MAPNIK_TILE_DIR=tiles/1.0.0/world/ && ./generate_tiles.py
	echo 'now you can open the index.html!'

clean:
	if test -e "./tiles"; then rm -r "./tiles"; fi
	if test -e "./ext/"; then rm -r "./ext/"; fi
	if test -e "./build/"; then rm -r "./build/"; fi
	#if test -e "generate_tiles.py"; then rm "generate_tiles.py"; fi

test:
	open -a Safari index.html