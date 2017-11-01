tool
extends Control

const FILE_DIALOG = preload("./image_open_dialog.gd")
const SAVE_DIALOG = preload("./cubemap_save_dialog.gd")

var mode = 0
var faces = [0,1,2,3,4,5]
var regions = []

func _ready():
	print(get_node("ImagePreview/file_open_dialog"))
	get_node("ImagePreview/file_open_dialog").connect("pressed",self,"_on_file_open_dialog_released")
	get_node("ImagePreview/save").connect("pressed",self, "_on_cubemap_save_dialog_released")
	get_node("ImagePreview/matrix1").connect("pressed",self,"_on_matrix1_released")
	get_node("ImagePreview/matrix2").connect("pressed",self,"_on_matrix2_released")
	get_node("ImagePreview/resolutions").connect("item_selected",self,"_on_resolutions_item_selected")
	get_node("ImagePreview/preview/0/face").connect("item_selected",self,"_on_face0_change")
	get_node("ImagePreview/preview/1/face").connect("item_selected",self,"_on_face1_change")
	get_node("ImagePreview/preview/2/face").connect("item_selected",self,"_on_face2_change")
	get_node("ImagePreview/preview/3/face").connect("item_selected",self,"_on_face3_change")
	get_node("ImagePreview/preview/4/face").connect("item_selected",self,"_on_face4_change")
	get_node("ImagePreview/preview/5/face").connect("item_selected",self,"_on_face5_change")
	
	var resolutions = get_node("ImagePreview/resolutions")
	resolutions.clear()
	resolutions.add_item("256 x 256")
	resolutions.add_item("512 x 512")
	resolutions.add_item("1024 x 1024")
	resolutions.add_item("2048 x 2048")
	resolutions.select(0)
	for i in range(6):
		var nd = get_node("ImagePreview/preview/"+str(i)+"/face")
		nd.clear()
		nd.add_item(tr("left"))
		nd.add_item(tr("right"))
		nd.add_item(tr("bottom"))
		nd.add_item(tr("up"))
		nd.add_item(tr("front"))
		nd.add_item(tr("back"))
		nd.select(i)
	
func swap_faces(index,order):
	var old = faces[index]
	var pos = 0
	for i in range(6):
		if faces[i]==order:
			pos = i
			break
	faces[index] = order
	faces[pos] = old
	
	for i in range(6):
		get_node("ImagePreview/preview/"+str(i)+"/face").select(faces[i])
		get_node("ViewportSprite").set_image(i, get_node("ImagePreview/preview/"+str(faces[i])).get_texture() )
	
func _file_open(file_path):
	var res = load(file_path)
	if res:
		get_node("ImagePreview/TextureFrame").set_texture(res)
		make_images()
		get_node("ImagePreview/save").set_disabled(false)

func _file_save(file_path):
	if not file_path.is_abs_path():
		return
		
	if file_path.find(".cube")>-1:
		file_path = file_path.substr( 0,file_path.find_last(".cube") )

	var dir = file_path.get_base_dir()
	var name = file_path.get_file()
	
	# write some files
	var file = File.new()
	file.open( dir + "/" + name + ".cube", File.WRITE)
	file.store_line( name + ".left.png" )
	file.store_line( name + ".right.png" )
	file.store_line( name + ".bottom.png" )
	file.store_line( name + ".top.png" )
	file.store_line( name + ".front.png" )
	file.store_line( name + ".back.png" )
	file.close()

	var size = int(get_node("ImagePreview/resolutions").get_text().split("x")[0])
	regions[faces[0]].resized(size,size,Image.INTERPOLATE_CUBIC).save_png( dir + "/" + name + ".left.png" )
	regions[faces[1]].resized(size,size,Image.INTERPOLATE_CUBIC).save_png( dir + "/" + name + ".right.png" )
	regions[faces[2]].resized(size,size,Image.INTERPOLATE_CUBIC).save_png( dir + "/" + name + ".bottom.png" )
	regions[faces[3]].resized(size,size,Image.INTERPOLATE_CUBIC).save_png( dir + "/" + name + ".top.png" )
	regions[faces[4]].resized(size,size,Image.INTERPOLATE_CUBIC).save_png( dir + "/" + name + ".front.png" )
	regions[faces[5]].resized(size,size,Image.INTERPOLATE_CUBIC).save_png( dir + "/" + name + ".back.png" )


func make_images():
	var rf = get_node("ImagePreview/TextureFrame").get_texture()
	var texture = get_node("ImagePreview/TextureFrame").get_texture()
	if texture != null and texture.get_data() != null:
		var image = texture.get_data()
		regions.clear()
		
		if mode==0:
			var xs = float(rf.get_width()) / 3.0
			var ys = float(rf.get_height()) / 2.0
			var sz = Vector2(int(ceil(xs)),int(ceil(ys)))
			regions.append( image.get_rect( Rect2( Vector2(xs*0,ys*0), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*2,ys*0), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*0,ys*1), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*1,ys*1), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*1,ys*0), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*2,ys*1), sz )) )
		else:
			var xs = float(rf.get_width()) / 4.0
			var ys = float(rf.get_height()) / 3.0
			var sz = Vector2(int(ceil(xs)),int(ceil(ys)))
			regions.append( image.get_rect( Rect2( Vector2(xs*0,ys*1), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*2,ys*1), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*1,ys*2), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*1,ys*0), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*3,ys*1), sz )) )
			regions.append( image.get_rect( Rect2( Vector2(xs*1,ys*1), sz )) )
		
		var size = int(get_node("ImagePreview/resolutions").get_text().split("x")[0])
		var tex
		for i in range(6):
			tex = ImageTexture.new()
			tex.create_from_image(regions[i])
			var n_tex = ImageTexture.new()
			n_tex.create_from_image(tex.get_data().resized(256,256,Image.INTERPOLATE_NEAREST))
			get_node("ViewportSprite").set_image(faces[i],n_tex)
			get_node("ImagePreview/preview/"+str(faces[i])).set_texture( n_tex )
		
		faces = [0,1,2,3,4,5]
		for i in range(6):
			get_node("ImagePreview/preview/"+str(i)+"/face").select(i)
		
			

func _on_resolutions_item_selected(item):
	make_images()

func _on_matrix1_released():
	get_node("ImagePreview/matrix2").set_pressed(false)
	mode = 0
	get_node("ImagePreview/TextureFrame/grid").set_mode(mode)
	make_images()

func _on_matrix2_released():
	get_node("ImagePreview/matrix1").set_pressed(false)
	mode = 1
	get_node("ImagePreview/TextureFrame/grid").set_mode(mode)
	make_images()

func _on_file_open_dialog_released():
	var o = FILE_DIALOG.new(self,"_file_open")
	o.set_size(Vector2(450,400))
	if get_tree().get_current_scene()==null:
		get_node("/root/EditorNode").get_gui_base().add_child(o)
	else:
		get_tree().get_current_scene().add_child(o)
	o.popup_centered()

func _on_cubemap_save_dialog_released():
	var o = SAVE_DIALOG.new(self,"_file_save")
	o.set_size(Vector2(450,400))
	if get_tree().get_current_scene()==null:
		get_node("/root/EditorNode").get_gui_base().add_child(o)
	else:
		get_tree().get_current_scene().add_child(o)
	o.popup_centered()


func _on_face0_change(item):
	swap_faces(0,item)

func _on_face1_change(item):
	swap_faces(1,item)

func _on_face2_change(item):
	swap_faces(2,item)

func _on_face3_change(item):
	swap_faces(3,item)

func _on_face4_change(item):
	swap_faces(4,item)

func _on_face5_change(item):
	swap_faces(5,item)


