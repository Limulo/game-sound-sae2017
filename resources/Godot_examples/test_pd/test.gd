extends PDPlayer

var accum = 0

func _ready():
	load_patch("test.pd", "/home/v1a1l1e1/Documents/repos/godot/bin")
	#subscribe("foo", "manage_foo")
	play()
	set_process(true)
	
func _process(delta):
	#accum += delta
	#print( accum )
	#if( accum > 1):
	#	stop()
	#	set_process(false)
	pass
	
func _exit_tree():
	unload_patch()
	
func manage_foo( parmater ):
	pass
