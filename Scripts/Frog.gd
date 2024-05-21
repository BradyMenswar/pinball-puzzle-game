extends Node2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball"):
		if body.is_frog == false:
			body.change_to_frog()
			call_deferred('queue_free')
