var k = 0.5
var Fe
var Ue
var angle 
var rest
var anchor

func _init():
	anchor = 0.0
	rest = 0.0
	
func getForce( var _aCurrent ):
	angle = (_aCurrent - anchor) - rest
	Fe = -1*k*angle
	Ue = getPotential( angle )
	#print("spring: ", Fe)
	return Fe  

func getPotential( var a ):
	return 0.5 * k * a * a;