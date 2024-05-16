extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Ball"):
		body.queue_free()
		Events.emit_signal("ball_lost")
