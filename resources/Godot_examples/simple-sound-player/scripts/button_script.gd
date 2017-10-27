extends Button

var player #sample_player
var library #sample_library
var sample #sample
var list

func _ready():
	print("Button 'start': ready!")
	player = get_node("button_sound")
	library = player.get_sample_library()
	list = library.get_sample_list()
	print("Elenco dei samples in library:\n", list)
	sample = list[0]

func _on_start_pressed():
	player.play(sample)
