extends Node2D

func _ready():
	Events.emit_signal("spawn_new_ball", 150, 400, 0, 0)
	Events.emit_signal("lives_changed", GameManager.lives)
