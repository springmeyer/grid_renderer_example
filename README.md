# Grids for kids

An illustrative sample that shows simple usage of Wax and Mapnik's grid_renderer output.


## Background

  The grid_renderer targets the mbtiles spec. Learn more here:
  
    https://github.com/mapbox/mbtiles-spec/
  
  For more about the grid_renderer:
  
    http://trac.mapnik.org/wiki/MapnikRenderers#grid_renderer


## Depends
  
  Mapnik trunk >= r 2957
  
  python >= 2.6 (for built in json module)
  

## Installation
  
  Install Mapnik from >= r2957. More details about installing the latest mapnik at: http://trac.mapnik.org/wiki/Mapnik2


## Setup

  Get a few external dependencies for the demo by running
  
   $ make
  

## Usage

  Then generate some tiles
  
   $ make tiles

  Then open the index.html in a web browser and you should be able to hover over polygons and get the country names and population.