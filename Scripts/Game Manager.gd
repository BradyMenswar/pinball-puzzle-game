extends Node2D
# Called when the node enters the scene tree for the first time.

var max_lives = 3
var lives

func _ready():
	Events.connect("ball_lost", on_ball_lost)
	Events.connect("game_over", on_game_over)
	lives = max_lives
	Events.emit_signal("lives_changed", lives)

func on_ball_lost():
	lives -= 1
	if(lives <= 0):
		Events.emit_signal("game_over")
	Events.emit_signal("lives_changed", lives)
	
func on_game_over():
	get_tree().reload_current_scene()
	pass

func _input(event):
	if event.is_action_pressed("reset_ball"):
		#Should make a new ball scene, turn it into a node (instance) then make that node a child of main
		var scene = load("res://Scenes/Ball.tscn")
		var instance = scene.instantiate()
		#Attempting to move ball
		instance.move_body(Vector2(1160, 0))
