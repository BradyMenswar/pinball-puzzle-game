extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("frog_at_end",clear_self)


func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball"):
		if body.is_frog == false:
			body.change_to_frog()
			call_deferred('queue_free')
	
func clear_self():
	queue_free()
