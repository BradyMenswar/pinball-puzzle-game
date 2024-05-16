extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("frog_at_end",clear_self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball"):
		if body.is_frog == false:
			body.change_to_frog()
			call_deferred('queue_free')
			
	pass # Replace with function body.
	
func clear_self():
	queue_free()
