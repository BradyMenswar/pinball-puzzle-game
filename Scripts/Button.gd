extends Node2D

@export var active = false
@export var destroy_self = false
@export var destroy_ball = true
signal change_status
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouth_body_entered(body):
	if active == false:
		emit_signal("change_status")
		if destroy_ball:
			body.queue_free()
			var sprite_ball = Sprite2D.new()
			sprite_ball.texture = load("res://Assets/pinball.png")
			add_child(sprite_ball)
			Events.emit_signal("spawn_new_ball",1160,0,0,0)
		active = true;
		if destroy_self:
			queue_free()
		
