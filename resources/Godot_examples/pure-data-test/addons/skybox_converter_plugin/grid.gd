tool
extends Control

var mode = 0

func set_mode(v=0):
	mode = v
	update()

func _draw():
	var rf = get_node("../")
	if mode==0:
		var xs = float(rf.get_size().width) / 3.0
		var ys = float(rf.get_size().height) / 2.0
		draw_line( Vector2(0,ys+1), Vector2(xs*3,ys+1), Color(0,0,0,0.6), 1)
		draw_line( Vector2(0,ys), Vector2(xs*3,ys), Color(255,255,0,1), 1)
		draw_line( Vector2(xs+1,0), Vector2(xs+1,ys*2), Color(0,0,0,0.6), 1)
		draw_line( Vector2(xs,0), Vector2(xs,ys*2), Color(255,255,0,1), 1)
		draw_line( Vector2(xs*2+1,0), Vector2(xs*2+1,ys*2), Color(0,0,0,0.6), 1)
		draw_line( Vector2(xs*2,0), Vector2(xs*2,ys*2), Color(255,255,0,1), 1)
	else:
		var xs = float(rf.get_size().width) / 4.0
		var ys = float(rf.get_size().height) / 3.0
		draw_line( Vector2(0,ys+1), Vector2(xs*4,ys+1), Color(0,0,0,0.6), 1)
		draw_line( Vector2(0,ys), Vector2(xs*4,ys), Color(255,255,0,1), 1)
		draw_line( Vector2(0,ys*2+1), Vector2(xs*4,ys*2+1), Color(0,0,0,0.6), 1)
		draw_line( Vector2(0,ys*2), Vector2(xs*4,ys*2), Color(255,255,0,1), 1)
		draw_line( Vector2(xs+1,0), Vector2(xs+1,ys*3), Color(0,0,0,0.6), 1)
		draw_line( Vector2(xs,0), Vector2(xs,ys*3), Color(255,255,0,1), 1)
		draw_line( Vector2(xs*2+1,0), Vector2(xs*2+1,ys*3), Color(0,0,0,0.6), 1)
		draw_line( Vector2(xs*2,0), Vector2(xs*2,ys*3), Color(255,255,0,1), 1)
		draw_line( Vector2(xs*3+1,0), Vector2(xs*3+1,ys*3), Color(0,0,0,0.6), 1)
		draw_line( Vector2(xs*3,0), Vector2(xs*3,ys*3), Color(255,255,0,1), 1)

func _ready():
	update()


