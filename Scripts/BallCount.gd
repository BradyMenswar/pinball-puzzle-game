extends Label

#Updates Ball Count
func _on_killbox_change_ballcount(ballcount):
	text = "Balls Lost: " + str(ballcount)
	pass # Replace with function body.
