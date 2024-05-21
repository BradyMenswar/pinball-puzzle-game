extends Node2D
# Called when the node enters the scene tree for the first time.

var max_lives = 3
@export var tilt_lockout := 5.0
var lives = max_lives
@export var is_head_one_activated := false
@export var is_head_two_activated := false

func _ready():
	Events.connect("ball_lost", on_ball_lost)
	Events.connect("game_over", _on_game_over)
	Events.connect("spawn_new_ball",spawn_ball)
	Events.connect("head_one_activated", _on_head_one_activated)	
	Events.connect("head_two_activated", _on_head_two_activated)
	Events.emit_signal("lives_changed", lives)

func on_ball_lost():
	var balls = get_tree().get_nodes_in_group("Ball")
	if balls.size() <= 1:
		lives -= 1
		if(lives <= 0):
			Events.emit_signal("game_over")
		Events.emit_signal("lives_changed", lives)
	
func _on_game_over():
	lives = max_lives
	get_tree().call_deferred("reload_current_scene")

func _input(event):	
	if event.is_action_pressed("reset_ball"):
		spawn_ball(150,400,0,0)
		
func spawn_ball(pos_x, pos_y, force_x, force_y):
	var scene = load("res://Scenes/Ball.tscn")
	var instance = scene.instantiate()
	call_deferred("add_child", instance)
	instance.position = Vector2(pos_x,pos_y)
	instance.apply_central_impulse(Vector2(force_x,force_y))
	
func _on_head_two_activated():
	is_head_two_activated = true
	
func _on_head_one_activated():
	is_head_one_activated = true
	
	
