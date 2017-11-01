extends RigidBody

# spring
var mySpring = load("door-scene/script/Spring.gd")
var spring
# the lenght of the door (meters)
var l = 0.9
# the mass of the door (Kg)
var mass = 45
var losses = 0.03

var acceleration
var velocity
var angle
var aMax = PI*0.5
var aMin = -PI*0.5

# variables to keep track of
# the potential energy
var Uk
var Ue
var U
# Inertia momentum
var I
# this boolean is used to turn the
# physics calculation on or off
var sleeping
# a boolean to turn on/off
# the spring contribute to the
# physics calculation
var useSpring

#procedural generated sound
var PD_server


func _ready():
	PD_server = get_node("../PDPlayer")
	print( PD_server )
	spring = mySpring.new()
	useSpring = true
	acceleration = 0.0
	velocity = 0.0
	angle = 0.0
	Uk = 0.0
	Ue = 0.0
	U = Uk + Ue
	I = 0.0
	sleeping = false
	set_sleeping( sleeping )
	set_use_custom_integrator( true )


# a custom integrator
func _integrate_forces( state ):
	if( !sleeping ):
		if( useSpring ):
			applySpringForce()
		velocity += acceleration
		angle += velocity

		if( angle > aMax ):
			print(" + SBAAAM !")
			angle = aMax
			velocity = 0.0
		elif( angle < aMin ):
			print(" - SBAAAM !")
			angle = aMin
			velocity = 0.0
		else:
			velocity *= (1.0-losses)

		if( useSpring ):
			Ue = spring.getPotential( angle );
		else:
			Ue = 0.0
		Uk = 0.5 * mass * velocity * velocity;
		U = Ue + Uk;

		if( U < 0.00001 ):
			# potential energy is now very little
			# so we can stop the physic simulation an
			# put the door at rest.
			print( "sleep");
			sleeping = true;
			velocity = 0.0;
			acceleration = 0.0;
			U = 0.0
			#angle = 0.0;
	
		# procedural animation
		#rotate( angle );
		#set_angular_velocity( Vector3(0.0, velocity, 0.0) )
		set_rotation( Vector3(0.0, angle, 0.0) )
		
		# procedural sound
		#print( "door is not sleeping (vel: ", velocity, ", U: ", U*100, ")" )
		PD_server.pd_float("velocity", velocity * 10)
		PD_server.pd_float("U", (U * 1000))

		acceleration = 0.0;
	set_sleeping( sleeping )


func applySpringForce():
	# do necessary computation only if the door is active
	if( !sleeping ):
		var rSpring = l*0.1
		calculateI();
		acceleration += rSpring * spring.getForce( angle ) / I;


func applyForce( magnitude ):
	acceleration += magnitude / mass
	calculateI();
	sleeping = false
	set_sleeping( sleeping )


# I moved the calculation of the iniertia momentum
# here in order to calculat it in run time.
# This gave me the possibility to tweak mass parameter
# in run time!
func calculateI():
	I = mass * l * l / 3;


# uncomment this function if you want to interact
# with the door usign the mouse instead of the GUI
#func _input_event(camera, event, pos, normal, shape):
#	if (event.type==InputEvent.MOUSE_BUTTON and event.pressed):
#		print( "picked")
#		applyForce( 1.0 )

#func _mouse_enter():
#	get_node("mesh").set_scale(Vector3(1.1, 1.1, 1.1))

#func _mouse_exit():
#	get_node("mesh").set_scale(Vector3(1, 1, 1))

func _on_CheckButton_toggled( pressed ):
	print( "check button toggled" )
	useSpring = pressed
	if( useSpring ):
		sleeping = false
		set_sleeping( sleeping )


func _on_Button_button_down():
	print( "button down" )
	applyForce( 1.0 )
