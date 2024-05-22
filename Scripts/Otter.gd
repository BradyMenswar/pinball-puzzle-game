extends PathFollow2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("Ball"):
		var ball_velocity = body.get_linear_velocity()
		
		#resist horizontal motion
		var force_x = 100
		if ball_velocity.x > 0:
			force_x = -100
			
		#enchance vertical motion	
		var force_y = -200
		if ball_velocity.y > 0:
			force_y = 200
			
			body.apply_central_impulse(Vector2(force_x,force_y))
