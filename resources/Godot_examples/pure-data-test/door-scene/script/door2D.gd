extends RigidBody2D

var mySpring = load("Spring.gd")
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


func _ready():
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
			#angle = 0.0;
		rotate( angle );
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

func _on_Button_pressed():
	applyForce( 10.0 )


func _on_CheckButton_toggled( pressed ):
	useSpring = pressed
	if( useSpring ):
		sleeping = false
		set_sleeping( sleeping )
