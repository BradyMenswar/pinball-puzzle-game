extends Node2D
@onready var sprite = $Sprite

func _ready():
	sprite.z_index = 11

func _on_track_area_body_entered(body):
	if(body.is_in_group("Ball") and body is CollisionObject2D):
		body.set_collision_layer_value(1, false)
		body.set_collision_mask_value(1, false)
		body.set_collision_layer_value(9, true)
		body.set_collision_mask_value(9, true)
		sprite.z_index = 9

func _on_track_exit_body_entered(body):
	if(body.is_in_group("Ball") and body is CollisionObject2D):
		print("exited")
		body.set_collision_layer_value(9, false)
		body.set_collision_mask_value(9, false)
		body.set_collision_layer_value(1, true)
		body.set_collision_mask_value(1, true)
		sprite.z_index = 11


func _on_track_front_exit_body_entered(body):
	if(body.is_in_group("Ball") and body is CollisionObject2D):
		body.set_collision_layer_value(9, false)
		body.set_collision_mask_value(9, false)
		body.set_collision_layer_value(1, true)
		body.set_collision_mask_value(1, true)
		sprite.z_index = 11
