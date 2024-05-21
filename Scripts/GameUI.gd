extends CanvasLayer

@onready var lives_label = $Control/Lives
@onready var head_one_label = $"Control/Head 1"
@onready var head_two_label = $"Control/Head 2"
@onready var tilt_bar = $"Bottom UI/Tilt Bar"
@onready var bottom_ui = $"Bottom UI"

func _ready():
	Events.connect("lives_changed", _on_lives_changed)
	Events.connect("head_one_activated", _on_head_one_activated)
	Events.connect("head_two_activated", _on_head_two_activated)	
	Events.connect("tilt_changed", _on_tilt_changed)
	tilt_bar.max_value = %"Tilt Manager".max_tilt
	
func _on_lives_changed(lives):
	lives_label.text = "Lives Left: " + str(lives)
	bottom_ui.position.x = 504 - (16 * lives)
	bottom_ui.size.x = 102 + (16 * lives)
	
func _on_tilt_changed(tilt):
	tilt_bar.value = tilt
	
func _on_head_one_activated():
	head_one_label.text = "Head One: Activated"
	
func _on_head_two_activated():
	head_two_label.text = "Head Two: Activated"
