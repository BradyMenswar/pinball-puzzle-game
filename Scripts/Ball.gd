extends RigidBody2D

var reset_state = false
var reset_location
@export var max_speed = 10000

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, reset_location)
		reset_state = false
		angular_velocity = 0
		linear_velocity = Vector2.ZERO
		
func _physics_process(_delta):
	if(linear_velocity.length() > max_speed):
		linear_velocity = linear_velocity.normalized() * max_speed

func move_body(target_location: Vector2):
	reset_location = target_location
	reset_state = true

#Used in main.gd for killbox confirmation	
func is_ball():
	pass
