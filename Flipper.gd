extends RigidBody2D

@export var rest_rotation = 30.0
@export var flip_force = 2000
@export var scale_factor = 1000
var is_right: bool
var is_active = false;
var flip_action = "paddle_left"

func _ready():
	if is_right:
		flip_action = "paddle_right"
	rotation_degrees = rest_rotation

func _input(event):
	if Input.is_action_just_pressed(flip_action) && !is_active:
		angular_velocity = 0
		linear_velocity = Vector2.ZERO
		apply_torque_impulse(-flip_force * scale_factor)
	if event.is_action_released(flip_action) && is_active:
		apply_torque_impulse(flip_force * scale_factor)

func _on_flipper_limiter_top_body_entered(body):
	is_active = true;
	angular_velocity = 0
	linear_velocity = Vector2.ZERO
	if !Input.is_action_pressed(flip_action):
		apply_torque_impulse(flip_force * scale_factor)

func _on_flipper_limiter_top_body_exited(body):
	is_active = false;


func _on_flipper_limiter_bottom_body_entered(body):
	angular_velocity = 0
	linear_velocity = Vector2.ZERO
