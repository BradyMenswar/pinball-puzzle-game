extends Area2D
@onready var path = $Current
@onready var magnet_point = $Current/PathFollow2D
var current_speed := 1000.0
var is_moving := false

func _on_body_entered(body):
	if(body.is_in_group("Ball")):
		is_moving = true


func _process(delta):
	if(is_moving):
		magnet_point.progress += current_speed * delta
