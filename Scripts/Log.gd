extends Node2D
var shroom_chance = 35

func _ready():
	var shroom_rand = randi_range(0,100)
	if shroom_rand < shroom_chance:
		var shroom_placement = randi_range(-40,40)
		var shroom_direction = randi_range(0,1)
		var shroom_rotation = 180
		if shroom_direction == 0:
			shroom_rotation = 0
		var scene = load("res://Scenes/Mushroom.tscn")
		var instance = scene.instantiate()
		instance.position.y = shroom_placement
		instance.rotation_degrees = shroom_rotation
		add_child(instance)

