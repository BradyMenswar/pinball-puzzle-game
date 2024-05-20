extends Camera2D

func _process(_delta):
	var balls = get_tree().get_nodes_in_group("Ball")
	if balls.size() > 0:
		global_position.y = balls[0].global_position.y
	
