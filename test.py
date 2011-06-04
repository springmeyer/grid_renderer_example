#!/usr/bin/env python

import os
import json
import mapnik2

m = mapnik2.Map(256,256)
mapnik2.load_map(m,'stylesheet.xml')

# tile with south america
tile = mapnik2.Box2d(-10018754.171394622,-10018754.171394622,0,0)
m.zoom_to_box(tile)

# render image
im = mapnik2.Image(m.width, m.height)
mapnik2.render(m,im)
im.save("test.png")
# render grid
grid = mapnik2.Grid(m.width, m.height)
mapnik2.render_layer(m,grid,layer=0,fields=['POP2005','NAME'])
grid_utf = grid.encode()
open('test.json','w').write(json.dumps(grid_utf))
