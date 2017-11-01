extends Spatial

var slider_mass
var slider_losses
var slider_spring
var door

func _ready():
	door = get_node("door")
	slider_mass = get_node("controls/slider_mass")
	slider_losses = get_node("controls/slider_losses")
	slider_spring = get_node("controls/slider_spring")

	slider_mass.set_value( door.mass )
	slider_losses.set_value( door.losses )
	slider_spring.set_value( door.spring.k )
	
	var label = get_node("controls/slider_mass/value")
	label.set_text( str( door.mass ) )
	label = get_node("controls/slider_losses/value")
	label.set_text( str( door.losses ) )
	label = get_node("controls/slider_spring/value")
	label.set_text( str( door.spring.k ) )
	
	
func _on_slider_lenght_value_changed( value ):
	var a = get_node("controls/slider_lenght/value")
	a.set_text( str( value ) )
	door.l = value
	#door.sprite.scale( Vector2(value, 1.0) )
	
func _on_slider_mass_value_changed( value ):
	var a = get_node("controls/slider_mass/value")
	a.set_text( str( value ) )
	door.mass = value

func _on_slider_losses_value_changed( value ):
	var a = get_node("controls/slider_losses/value")
	a.set_text( str( value ) )
	door.losses = value

func _on_slider_spring_value_changed( value ):
	var a = get_node("controls/slider_spring/value")
	a.set_text( str( value ) )
	door.spring.k = value

func _on_CheckButton_toggled( pressed ):
	var slider = get_node("controls/slider_spring")
	if( !pressed ):
		slider.set_ignore_mouse( true )
		slider.set_opacity( 0.1 )
	else:
		slider.set_ignore_mouse( false )
		slider.set_opacity( 1.0 )
