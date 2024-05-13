extends Area2D

signal change_ballcount
var balls_lost = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method("is_ball"):
		body.queue_free()
		balls_lost += 1
		emit_signal("change_ballcount",balls_lost)
		

