extends RigidBody2D

var reset_state = false
var reset_location
var is_frog = false
@export var base_max_speed = 1000
var max_speed = 0
var max_speed_changer = 0
var base_gravity := 0.75
var gravity_changer = 0
var external_force = [0,0]

func _ready():
	update_gravity(base_gravity)
	max_speed = base_max_speed
	
func update_gravity(new_gravity):
	gravity_scale = new_gravity
	
func update_max_speed(new_max_speed):
	max_speed = new_max_speed	

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, reset_location)
		reset_state = false
		angular_velocity = 0
		linear_velocity = Vector2.ZERO
		
func _physics_process(_delta):
	#updating gravity
	gravity_scale += gravity_changer
	if gravity_scale < 0:
		gravity_scale = 0
	
	#updating maxspeed with limit
	max_speed += max_speed_changer
	if max_speed < base_max_speed/4:
		max_speed = base_max_speed/4
	
	#updating external_impulse
	apply_central_impulse(Vector2(external_force[0],external_force[1]))
		
	if(linear_velocity.length() > max_speed):
		linear_velocity = linear_velocity.normalized() * max_speed

func move_body(target_location: Vector2):
	reset_location = target_location
	reset_state = true
	
func change_to_frog():
	is_frog = true
	get_node("Sprite2D").self_modulate = Color(0,1,0)
	
