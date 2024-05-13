extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Updates Ball Count
func _on_killbox_change_ballcount(ballcount):
	text = "Balls Lost: " + str(ballcount)
	pass # Replace with function body.
