extends PathFollow2D

var sprite_ball = Sprite2D.new()
var under_water = Sprite2D.new()
var above_water = Sprite2D.new()
var timer = Timer.new()
@export var wait_no_frog = 3
@export var wait_yes_frog = 5
var ate_ball = false
func _ready():
	add_child(sprite_ball)
	under_water = get_node("Node2D/Above")
	above_water = get_node("Node2D/Below")
	timer = get_node("Node2D/Timer")

func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball") and ate_ball == false:
		ate_ball = true
		sprite_ball.texture = load("res://Assets/pinball.png")
		sprite_ball.scale = Vector2(0.07,0.07)
		if body.is_frog == true:
			sprite_ball.self_modulate = Color(0,0.5,0)
			timer.start(wait_yes_frog)
		else:
			timer.start(wait_no_frog)
			
		body.remove_self()
		under_water.visible = false
		above_water.visible = true


func _on_timer_timeout():
	if progress_ratio < 0.9:
		Events.emit_signal("spawn_new_ball",position.x,position.y,75,-200)
	else:
		Events.emit_signal("ball_lost")
	sprite_ball.texture = null
	under_water.visible = true
	above_water.visible = false
	pass # Replace with function body.
