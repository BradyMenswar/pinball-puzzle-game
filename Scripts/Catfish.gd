extends PathFollow2D

var sprite_ball = Sprite2D.new()
var under_water = Sprite2D.new()
var above_water = Sprite2D.new()

func _ready():
	add_child(sprite_ball)
	under_water = get_node("Node2D/Above")
	above_water = get_node("Node2D/Below")


func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball"):
		sprite_ball.texture = load("res://Assets/pinball.png")
		sprite_ball.scale = Vector2(0.07,0.07)
		if body.is_frog == true:
			sprite_ball.self_modulate = Color(0,0.5,0)
		body.remove_self()
		Events.emit_signal("ball_lost")
		under_water.visible = false
		above_water.visible = true
