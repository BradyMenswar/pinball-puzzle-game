extends RigidBody2D

var rest_rotation = 30.0
var active_rotation = -30.0
@export var flip_force = 1000;

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = rest_rotation
	

func _integrate_forces(_state):
	var target_rotation = rest_rotation
	if Input.is_action_pressed("paddle_left"):
		target_rotation = active_rotation
	var torque = target_rotation  * flip_force
	apply_torque(torque)
