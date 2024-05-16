extends Node2D
# Called when the node enters the scene tree for the first time.
var sprite_ball = Sprite2D.new()
var on_cooldown = false
var rng = RandomNumberGenerator.new()

func _ready():
	add_child(sprite_ball)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _process(delta):
	pass

	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball") and on_cooldown == false:
		body.queue_free()
		sprite_ball.texture = load("res://Assets/pinball.png")
		var timer = get_node("Timer")
		timer.start()
		
	pass # Replace with function body.

func _on_timer_timeout():
	on_cooldown = true
	var timer = get_node("Cooldown")
	timer.start()
	sprite_ball.texture = null
	var rand_x = rng.randf_range(-2000.0, 2000.0)
	var rand_y = rng.randf_range(3000.0, 5000.0)
	Events.emit_signal("spawn_new_ball",global_position.x,global_position.y,rand_x,rand_y)
	pass # Replace with function body.


func _on_cooldown_timeout():
	on_cooldown = false
	pass # Replace with function body.
