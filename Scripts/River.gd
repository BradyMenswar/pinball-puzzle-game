extends Area2D
@onready var path = $Current
@onready var magnet_point = $Current/PathFollow2D
var current_speed := 1000.0
var is_moving := false

func _on_body_entered(body):
	if(body.is_in_group("Ball") and body is RigidBody2D):
		is_moving = true
		body.linear_velocity = body.linear_velocity / 2
		var collision_point = body.global_position
		var local_collision_point = path.to_local(collision_point)
		var closest_offset = path.curve.get_closest_offset(local_collision_point)
		magnet_point.progress = closest_offset

func _process(delta):
	if(is_moving):
		magnet_point.progress += current_speed * delta
		if magnet_point.progress_ratio == 1:
			magnet_point.progress = 0
			is_moving = false
