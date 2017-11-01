extends PDPlayer

var accum = 0

func _ready():
	print( "now loading the patch" )
	# NOTE: in future implementation this path will be customizable
	# directly from the editor.
	load_patch("_main.pd", "/home/nicola/Documents/PureData/creaking-door/for-godot")
	play()
	
func _exit_tree():
	print( "now unloading the patch" )
	unload_patch()