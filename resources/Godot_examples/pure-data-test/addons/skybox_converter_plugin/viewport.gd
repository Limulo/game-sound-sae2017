tool
extends ViewportSprite

var is_pressed = false
var ang = Vector2(0,0)
var cube = MeshInstance.new()
var faces = {
	"top": null,
	"bottom": null,
	"left": null,
	"right": null,
	"front": null,
	"back": null
}


func set_image(index,image):
	if index==0:
		faces.left.set_shader_param("imagem",image)
	if index==1:
		faces.right.set_shader_param("imagem",image)
	if index==2:
		faces.bottom.set_shader_param("imagem",image)
	if index==3:
		faces.top.set_shader_param("imagem",image)
	if index==4:
		faces.front.set_shader_param("imagem",image)
	if index==5:
		faces.back.set_shader_param("imagem",image)

func make_cube(l=1):
	var st = SurfaceTool.new()
	var mesh = Mesh.new()
	
	faces.left = load("res://addons/skybox_converter_plugin/left.mtl")
	faces.right = load("res://addons/skybox_converter_plugin/right.mtl")
	faces.bottom = load("res://addons/skybox_converter_plugin/bottom.mtl")
	faces.top = load("res://addons/skybox_converter_plugin/top.mtl")
	faces.front = load("res://addons/skybox_converter_plugin/front.mtl")
	faces.back = load("res://addons/skybox_converter_plugin/back.mtl")
	
	# top
	st.clear()
	st.set_material(faces.top)
	st.begin( VisualServer.PRIMITIVE_TRIANGLES )
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(-l,l,-l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(l,l,-l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(l,l,l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(l,l,l))
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(-l,l,l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(-l,l,-l))
	st.generate_normals()
	st.commit(mesh)
	
	# bottom
	st.clear()
	st.set_material(faces.bottom)
	st.begin( VisualServer.PRIMITIVE_TRIANGLES )
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(-l,-l,-l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(l,-l,-l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(l,-l,l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(l,-l,l))
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(-l,-l,l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(-l,-l,-l))
	st.generate_normals()
	st.commit(mesh)
	
	# left
	st.clear()
	st.set_material(faces.left)
	st.begin( VisualServer.PRIMITIVE_TRIANGLES )
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(l,l,-l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(l,-l,-l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(l,-l,l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(l,-l,l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(l,l,l))
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(l,l,-l))
	st.generate_normals()
	st.commit(mesh)
	
	# right
	st.clear()
	st.set_material(faces.right)
	st.begin( VisualServer.PRIMITIVE_TRIANGLES )
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(-l,l,l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(-l,-l,l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(-l,-l,-l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(-l,-l,-l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(-l,l,-l))
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(-l,l,l))
	st.generate_normals()
	st.commit(mesh)
	
	# front
	st.clear()
	st.set_material(faces.front)
	st.begin( VisualServer.PRIMITIVE_TRIANGLES )
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(-l,l,l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(-l,-l,l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(l,-l,l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(l,-l,l))
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(l,l,l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(-l,l,l))
	st.generate_normals()
	st.commit(mesh)
	
	# back
	st.clear()
	st.set_material(faces.back)
	st.begin( VisualServer.PRIMITIVE_TRIANGLES )
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(l,l,-l))
	st.add_uv(Vector2(0,1))
	st.add_vertex(Vector3(l,-l,-l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(-l,-l,-l))
	st.add_uv(Vector2(1,1))
	st.add_vertex(Vector3(-l,-l,-l))
	st.add_uv(Vector2(1,0))
	st.add_vertex(Vector3(-l,l,-l))
	st.add_uv(Vector2(0,0))
	st.add_vertex(Vector3(l,l,-l))
	st.generate_normals()
	st.commit(mesh)
	
	cube.set_mesh(mesh)
	
	get_node("Viewport").add_child(cube)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index==1:
			var box = Rect2(get_global_pos(),Vector2(346,250))
			if  box.has_point(event.global_pos):
				is_pressed = event.is_pressed()
			else:
				is_pressed = false
	if event.type == InputEvent.MOUSE_MOTION and is_pressed:
		var s = get_viewport().get_rect().size
		var x = float(event.speed_x) / s.width
		var y = float(event.speed_y) / s.height
		ang.x += x
		ang.y += y
		if ang.x>PI:
			ang.x = -PI
		elif ang.x<-PI:
			ang.x = PI
		if ang.y>PI:
			ang.y = -PI
		elif ang.y<-PI:
			ang.y = PI
		
		get_node("Viewport/Camera").set_rotation(Vector3(ang.y,0,ang.x))

func _process(delta):
	cube.set_rotation(cube.get_rotation() + Vector3(0.8*delta, 1.2*delta, 0.2*delta))

func _ready():
	#set_process_input(true)
	set_process(true)
	make_cube()


