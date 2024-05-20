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
		sprite_ball.scale = Vector2(0.07,0.07)
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
		var rand_x = rng.randf_range(-100.0, 100.0)
		var rand_y = rng.randf_range(150.0, 250.0)
		Events.emit_signal("spawn_new_ball",global_position.x,global_position.y,rand_x,rand_y)
	if was_ball_frog == true:
		Events.emit_signal("spawn_new_ball",global_position.x,global_position.y,400,-400)
		was_ball_frog = false


func _on_cooldown_timeout():
	on_cooldown = false
