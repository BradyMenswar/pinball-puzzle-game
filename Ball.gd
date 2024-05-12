extends RigidBody2D

var reset_state = false
var reset_location
@export var max_speed = 100


func _input(event):
	if event.is_action_pressed("reset_ball"):
		move_body(Vector2(400, 0))

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, reset_location)
		reset_state = false
		angular_velocity = 0
		linear_velocity = Vector2.ZERO
		
func _physics_process(delta):
	print("Velocity: ", linear_velocity)
	if(linear_velocity.length() > max_speed):
		linear_velocity = linear_velocity.normalized() * max_speed

func move_body(target_location: Vector2):
	reset_location = target_location
	reset_state = true
