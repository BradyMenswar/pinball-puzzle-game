extends Node2D

func _input(event):
	
	if event.is_action_pressed("reset_ball"):
		#Should make a new ball scene, turn it into a node (instance) then make that node a child of main
		var scene = load("res://Scenes/Ball.tscn")
		var instance = scene.instantiate()
		add_child(instance)
		#Attempting to move ball
		instance.move_body(Vector2(1160, 0))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

