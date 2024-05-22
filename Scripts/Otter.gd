extends PathFollow2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball"):
		var ball_velocity = body.get_linear_velocity()
		if ball_velocity.y > 0:
			body.apply_central_impulse(Vector2(randi_range(-50,50),randi_range(150,250)))
		else:
			body.apply_central_impulse(Vector2(randi_range(-50,50),randi_range(-250,-150)))
