extends Node2D

func _input(event):
	
	if event.is_action_pressed("reset_ball"):
		#Should make a new ball scene, turn it into a node (instance) then make that node a child of main
		var scene = load("res://Scenes/Ball.tscn")
		var instance = scene.instantiate()
		add_child(instance)
		#Attempting to move ball
		instance.move_body(Vector2(1300, 0))

