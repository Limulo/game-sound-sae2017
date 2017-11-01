extends Spatial

var tile
var tiles=[]
var H = 4
var W = 3

func _ready():
	tile = get_node("tile")
	#w = tile
	#h
	for i in range(W*H):
		#print( i )
		tiles.append( tile.duplicate() )
		var x = (i % W) - int(W*0.5)
		var z = (i / W) - H+2
		#print( i, " - (", x, ", ", z , ")")
		var tilePos = Vector3( x*2, 0.0, z*2)
		tiles.back().set_translation( tilePos )
		tiles.back().set_hidden(false)
		add_child( tiles.back() )
	#print( get_child_count() )
