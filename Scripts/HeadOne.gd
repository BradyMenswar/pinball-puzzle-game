extends Node2D

@export var active = false
@export var destroy_self = false
@export var destroy_ball = true
@onready var bottom_collision = $Collision/Bottom

func _on_mouth_body_entered(body):
	if active == false and body.is_in_group("Ball"):
		bottom_collision.set_deferred("disabled", false)
		Events.emit_signal("head_one_activated")
		if destroy_ball:
			body.queue_free()
			var sprite_ball = Sprite2D.new()
			sprite_ball.texture = load("res://Assets/pinball.png")
			add_child(sprite_ball)
			Events.emit_signal("spawn_new_ball",1160,0,0,0)
		active = true;
		if destroy_self:
			queue_free()
