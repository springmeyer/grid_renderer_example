all: gridsforkids

install:
	echo 'nothing to install, just run 'make' then open index.html in a browser!'

gridsforkids:
	curl -o OpenLayers.js http://openlayers.org/api/OpenLayers.js
	curl -o jquery-1.5.2.min.js http://code.jquery.com/jquery-1.5.2.min.js
	curl -o wax.ol.js https://github.com/mapbox/wax/raw/master/build/wax.ol.js
	curl -o generate_tiles.py http://svn.openstreetmap.org/applications/rendering/mapnik/generate_tiles.py
	patch -p0 < generate_tiles.diff
	chmod +x generate_tiles.py

tiles:
	mkdir -p tiles/1.0.0/world/
	export MAPNIK_MAP_FILE=stylesheet.xml && export MAPNIK_TILE_DIR=tiles/1.0.0/world/ && ./generate_tiles.py
	cp layer.json tiles/1.0.0/world/
	echo 'now you can open the index.html!'

clean:
	if test -e "tiles"; then rm -r "tiles"; fi
	if test -e "generate_tiles.py"; then rm "generate_tiles.py"; fi
	if test -e "jquery-1.5.2.min.js"; then rm "jquery-1.5.2.min.js"; fi
	if test -e "OpenLayers.js"; then rm "OpenLayers.js"; fi
	if test -e "wax.ol.js"; then rm "wax.ol.js"; fi

test:
	open -a Safari index.html