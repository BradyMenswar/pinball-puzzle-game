extends RigidBody2D
@export var flip_force = 375
@export var scale_factor = 1000
@export var is_right = false
var rest_rotation = 30
var side_bias = 1
var is_active = false
var flip_action = "paddle_left"

func configure_flipper():
	if is_right:
		flip_action = "paddle_right"
		side_bias = -1
	else:
		flip_action = "paddle_left"
		side_bias = 1
	rotation_degrees = rest_rotation
	
func _ready():
	configure_flipper()

func _input(event):
	if Input.is_action_just_pressed(flip_action) && !is_active:
		# Resets velocity and then applys torque to flip when pressed.
		angular_velocity = 0
		linear_velocity = Vector2.ZERO
		apply_torque_impulse(-flip_force * side_bias * scale_factor)
	if event.is_action_released(flip_action) && is_active:
		# If you were holding the button and then decide to let go, this pulls it down.
		apply_torque_impulse(flip_force * side_bias * scale_factor)

func _on_flipper_limiter_top_body_entered(body):
	is_active = true;
	# Stops the flipper absolutely when it hits the stopper with no bounce back.
	angular_velocity = 0
	linear_velocity = Vector2.ZERO
	# If you are not holding the button at the time it hits the stopper, this pulls it down.
	if !Input.is_action_pressed(flip_action):
		apply_torque_impulse(flip_force * side_bias * scale_factor)

func _on_flipper_limiter_top_body_exited(body):
	is_active = false;


func _on_flipper_limiter_bottom_body_entered(body):
	angular_velocity = 0
	linear_velocity = Vector2.ZERO
