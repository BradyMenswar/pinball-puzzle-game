extends Node2D

@onready var animation_player = $AnimationPlayer

func _ready():
	Events.emit_signal("spawn_new_ball", 150, 400, 0, 0)
	Events.emit_signal("lives_changed", GameManager.lives)
	Events.connect("ball_lost", _on_ball_lost)
	
func _on_ball_lost(_lose_life):
	#Play animation for respawning the ball
	pass
	
