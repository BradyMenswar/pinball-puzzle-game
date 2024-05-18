extends RigidBody2D

var reset_state = false
var reset_location
var is_frog = false
@export var max_speed = 10000
var base_gravity := 5.0

func _ready():
	update_gravity(base_gravity)
	
func update_gravity(new_gravity):
	gravity_scale = new_gravity

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
	
func change_to_frog():
	is_frog = true
	get_node("Sprite2D").self_modulate = Color(0,1,0)
	
