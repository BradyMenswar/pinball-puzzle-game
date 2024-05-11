extends RigidBody2D

var reset_state = false
var moveVector: Vector2

func _input(event):
	if event.is_action_pressed("reset_ball"):
		move_body(Vector2(400, 0))

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, moveVector)
		reset_state = false
		angular_velocity = 0
		linear_velocity = Vector2.ZERO

func move_body(targetPos: Vector2):
	moveVector = targetPos;
	reset_state = true;
