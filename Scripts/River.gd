extends Area2D
@onready var path = $Current
@onready var path_follow = $Current/PathFollow2D
var current_speed := 1000.0
var river_gravity_scale := 0.0
var is_moving := false

func _on_body_entered(body):
	if(body.is_in_group("Ball") and body is RigidBody2D and !is_moving):
		is_moving = true
		#body.linear_velocity = body.linear_velocity / 2
		var collision_point = body.global_position
		var local_collision_point = path.to_local(collision_point)
		var closest_offset = path.curve.get_closest_offset(local_collision_point)
		path_follow.progress = closest_offset
		#body.update_gravity(body.base_gravity * river_gravity_scale)

func _process(delta):
	if(is_moving):
		path_follow.progress += current_speed * delta
		if path_follow.progress_ratio == 1:
			path_follow.progress = 0
			is_moving = false

#func _on_body_exited(body):
	#if(body.is_in_group("Ball") and body is RigidBody2D and is_moving):
		#body.update_gravity(body.base_gravity)

