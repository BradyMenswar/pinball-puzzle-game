extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Ball"):
		body.remove_self()
		Events.emit_signal("ball_lost", true)
