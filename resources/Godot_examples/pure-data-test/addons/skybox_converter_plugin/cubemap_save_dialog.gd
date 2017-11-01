
extends FileDialog

var callback
var callback_obj


# call the registed handle function from caller
func select_file_act(path):
	if callback_obj:
		if callback:
			callback_obj.call(callback,path)

# destroy all content
func hide_elements():
	set_process(false)
	queue_free()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _init(callback_obj,callback=null):
	set_mode(MODE_SAVE_FILE)
	set_access(ACCESS_FILESYSTEM)

	add_filter('*.cube;Cubemap text file')
	
	connect("file_selected",self,"select_file_act")
	connect("popup_hide",self,"hide_elements")
	
	self.callback_obj = callback_obj
	self.callback = callback
