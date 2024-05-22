extends Node2D

@onready var cooldown_timer = $"Internal Cooldown"
@onready var decay_timer = $Decay

@export var impulse_strength: float = 65
@export var internal_cooldown := 1.0
@export var decay_debounce := 3.0
@export var max_tilt := 100.0
@export var tilt_decay := 10.0
@export var tilt_cost := 20.0

var tilt_maxed = false
var cooldown_available = true
var is_decay := false
var current_tilt := 0.0

func _ready():
	Events.connect("ball_lost", _on_ball_lost)

func _process(delta):
	if current_tilt > 0 and is_decay:
		current_tilt -= tilt_decay * delta
		if current_tilt <= 0:
			current_tilt = 0
		Events.emit_signal("tilt_changed", current_tilt)

func _input(event):
	if event.is_action_pressed("bump_left") and cooldown_available and !tilt_maxed:
		apply_bump(-impulse_strength, -impulse_strength)
	elif event.is_action_pressed("bump_right") and cooldown_available and !tilt_maxed:
		apply_bump(impulse_strength, -impulse_strength)
	elif event.is_action_pressed("bump_up") and cooldown_available and !tilt_maxed:
		apply_bump(0, -impulse_strength * 2)

func _on_ball_lost(_lose_life):
	current_tilt = 0
	tilt_maxed = false
	Events.emit_signal("tilt_changed", current_tilt)
	
func _on_decay_timeout():
	is_decay = true
	tilt_maxed = false

func _on_internal_cooldown_timeout():
	cooldown_available = true
	
func apply_bump(h_strength: float, v_strength: float):
	var balls = get_tree().get_nodes_in_group("Ball")
	for ball in balls:
		if ball is RigidBody2D:
			var impulse = Vector2(h_strength, v_strength)
			ball.apply_impulse(impulse)
			cooldown_available = false
			current_tilt += tilt_cost
			if current_tilt >= max_tilt:
				current_tilt = max_tilt
				Events.emit_signal("tilt_maxed")
				tilt_maxed = true
				decay_timer.start(GameManager.tilt_lockout)
			else:
				decay_timer.start(decay_debounce)
				
			Events.emit_signal("tilt_changed", current_tilt)
			is_decay = false 
			cooldown_timer.start(internal_cooldown)

