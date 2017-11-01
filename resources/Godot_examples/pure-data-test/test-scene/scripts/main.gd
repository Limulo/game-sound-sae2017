extends Node2D

var PD_server
var prev_value_A
var prev_value_B

func _ready():
	PD_server = get_node("PDPlayer")
	prev_value_A = 0.0
	prev_value_B = 0.0
	PD_server.pd_float("velocity", 0.0)
	PD_server.pd_float("U", 10.0)
	

func _on_sliderA_value_changed( value ):
	if value != prev_value_A:
		prev_value_A = value
		PD_server.pd_float("velocity", value)

func _on_sliderB_value_changed( value ):
	if value != prev_value_B:
		prev_value_B = value
		PD_server.pd_float("U", value)
