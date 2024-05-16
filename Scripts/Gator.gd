extends Node2D
# Called when the node enters the scene tree for the first time.
var sprite_ball = Sprite2D.new()
var on_cooldown = false
var rng = RandomNumberGenerator.new()
var was_ball_frog = false

func _ready():
	add_child(sprite_ball)
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball") and on_cooldown == false:
		sprite_ball.texture = load("res://Assets/pinball.png")
		if body.is_frog == true:
			sprite_ball.self_modulate = Color(0,1,0)
			was_ball_frog = true
		body.queue_free()
		var timer = get_node("Timer")
		timer.start()

func _on_timer_timeout():
	on_cooldown = true
	var timer = get_node("Cooldown")
	timer.start()
	sprite_ball.texture = null
	sprite_ball.self_modulate = Color(1,1,1)
	if was_ball_frog == false:
		var rand_x = rng.randf_range(-2000.0, 2000.0)
		var rand_y = rng.randf_range(3000.0, 5000.0)
		Events.emit_signal("spawn_new_ball",global_position.x,global_position.y,rand_x,rand_y)
	if was_ball_frog == true:
		Events.emit_signal("spawn_new_ball",global_position.x,global_position.y,0,-8000)
		was_ball_frog = false


func _on_cooldown_timeout():
	on_cooldown = false
