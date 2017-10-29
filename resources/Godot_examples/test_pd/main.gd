extends Node2D

onready var PD_server = get_node("PDPlayer")

var slider_l
var slider_r
var prev_value_l
var prev_value_r

var button
var check_l
var check_r

func _ready():
	pass
	


func _on_bang_pressed():
	PD_server.pd_bang("ping")

func _on_slider_l_value_changed( value ):
	#var actual_val = get_val()
	if value != prev_value_l:
		prev_value_l = value
		PD_server.pd_float("left_freq", value)

func _on_slider_r_value_changed( value ):
	#var actual_val = get_val()
	if value != prev_value_r:
		prev_value_r = value
		PD_server.pd_float("right_freq", value)

func _on_CheckButtonL_toggled( pressed ):
	print("left: ", pressed)
	PD_server.pd_float("left_toggle", pressed)
	
func _on_CheckButtonR_toggled( pressed ):
	print("right: ", pressed)
	PD_server.pd_float("right_toggle", pressed)


