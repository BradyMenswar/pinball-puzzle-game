extends Control

@onready var lives_label = $Lives
@onready var head_one_label = $"Head 1"

func _ready():
	Events.connect("lives_changed", _on_lives_changed)
	Events.connect("head_one_activated", _on_head_one_activated)
	
	
func _on_lives_changed(lives):
	lives_label.text = "Lives Left: " + str(lives)
	
	
func _on_head_one_activated():
	head_one_label.text = "Head One: Activated"
