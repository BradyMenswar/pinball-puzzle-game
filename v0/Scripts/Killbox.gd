extends Area2D

signal change_ballcount
var balls_lost = 0


func _on_body_entered(body):
	if body.has_method("is_ball"):
		body.queue_free()
		balls_lost += 1
		emit_signal("change_ballcount",balls_lost)
		

