extends Node2D
var rng = RandomNumberGenerator.new()
var shroom_chance = 35
# Called when the node enters the scene tree for the first time.
func _ready():
	var shroom_rand = rng.randi_range(0,100)
	if shroom_rand < shroom_chance:
		var shroom_placement = rng.randi_range(-40,40)
		var shroom_direction = randi_range(0,1)
		var shroom_rotation = -90
		if shroom_direction == 0:
			shroom_rotation = 90
		var scene = load("res://Scenes/Mushroom.tscn")
		var instance = scene.instantiate()
		instance.position.y = shroom_placement
		instance.rotation_degrees = shroom_rotation
		add_child(instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
