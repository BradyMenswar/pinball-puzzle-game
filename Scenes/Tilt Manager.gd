extends Node2D

@export var impulse_strength: float = 1000.0
@export var internal_cooldown := 0.5
var cooldown_available = true
@onready var cooldown_timer = $"Internal Cooldown"

func _input(event):
	if event.is_action_pressed("bump_left") and cooldown_available:
		var balls = get_tree().get_nodes_in_group("Ball")
		for ball in balls:
			if ball is RigidBody2D:
				var impulse = Vector2(-impulse_strength, 0)
				ball.apply_impulse(impulse)
				cooldown_available = false
				cooldown_timer.start(internal_cooldown)
	elif event.is_action_pressed("bump_right") and cooldown_available:
		var balls = get_tree().get_nodes_in_group("Ball")
		for ball in balls:
			if ball is RigidBody2D:
				var impulse = Vector2(impulse_strength, 0)
				ball.apply_impulse(impulse)
				cooldown_available = false
				cooldown_timer.start(internal_cooldown)
	elif event.is_action_pressed("bump_up") and cooldown_available:
		var balls = get_tree().get_nodes_in_group("Ball")
		for ball in balls:
			if ball is RigidBody2D:
				var impulse = Vector2(0, -impulse_strength * 2)
				ball.apply_impulse(impulse)
				cooldown_available = false
				cooldown_timer.start(internal_cooldown)


func _on_internal_cooldown_timeout():
	cooldown_available = true;
