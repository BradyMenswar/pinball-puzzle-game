extends CanvasLayer

@onready var lives_label = $Control/Lives
@onready var head_one_label = $"Control/Head 1"
@onready var tilt_bar = $"Control/Tilt Bar"

func _ready():
	Events.connect("lives_changed", _on_lives_changed)
	Events.connect("head_one_activated", _on_head_one_activated)
	Events.connect("tilt_changed", _on_tilt_changed)
	tilt_bar.max_value = %"Tilt Manager".max_tilt
	
func _on_lives_changed(lives):
	lives_label.text = "Lives Left: " + str(lives)
	
func _on_tilt_changed(tilt):
	tilt_bar.value = tilt
	
func _on_head_one_activated():
	head_one_label.text = "Head One: Activated"
