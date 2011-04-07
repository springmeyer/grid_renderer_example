# Grids for kids

An illustrative sample that shows simple usage of the mapnik grid_renderer output.

For more info on the grid_renderer see: http://trac.mapnik.org/wiki/MapnikRenderers#grid_renderer


## Background

  The grid_renderer and its output is to support the mbtiles spec. Learn more here:
  
  https://github.com/mapbox/mbtiles-spec/
  

## Depends
  
  Mapnik branch (http://svn.mapnik.org/branches/grid_renderer/)
  
  subversion (to checkout generate_tiles.py)
  
  patch (to patch generate_tiles.py)
  
  >= python 2.6 (for built in json module)
  

## Installation
  
  Install Mapnik from the above svn repo as if you are installing Mapnik2 (http://trac.mapnik.org/wiki/Mapnik2)


## Setup

  Get a few external dependencies for the demo by running
  
  $ make
  

## Usage

  Then generate some tiles
  
  $ make tiles

  Then open the index.html in a web browser and you should be able to hover over polygons and get the country names.