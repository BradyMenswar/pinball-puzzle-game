extends PathFollow2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball"):
		var ball_velocity = body.get_linear_velocity()
		if ball_velocity.y > 0:
			body.apply_central_impulse(Vector2(rng.randi_range(-50,50),rng.randi_range(150,250)))
		else:
			body.apply_central_impulse(Vector2(rng.randi_range(-50,50),rng.randi_range(-250,-150)))
	pass # Replace with function body.
