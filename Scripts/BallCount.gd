extends Label

func _ready():
	Events.connect("lives_changed", on_change_lives)

	
func on_change_lives(lives):
	text = "Lives left: " + str(lives)
