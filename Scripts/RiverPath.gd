extends Node2D


@onready var path = $Path2D
@onready var spawn_timer = $Spawn

@export var move_speed = 0.08
@export var min_spawn_interval := 5.0
@export var max_spawn_interval := 10.0

@export var spawnable_objects : Dictionary

var has_frog = false

func _ready():
	spawn_timer.start(1)
	Events.connect("head_two_activated", _on_head_two_activated)
	Events.connect("ball_lost", _on_ball_lost)

func _process(delta):
	for follow in path.get_children():
		if follow is PathFollow2D:
			follow.progress_ratio += move_speed * delta
			if follow.progress_ratio >= 1:
				if follow.is_in_group("Frog"):
					has_frog = false
				follow.queue_free()

func spawn_object(object_path, new_rotation):
	var object_scene = load(object_path)
	var instance = object_scene.instantiate()
	instance.get_node("Node2D").rotation_degrees = new_rotation
	path.add_child(instance)
	
func _on_spawn_timeout():
	var selection_chance = randi_range(0, 100)
	var river_object: RiverObject = null
	if selection_chance < 20 and !has_frog:
		has_frog = true
		river_object = spawnable_objects["Frog"]
	elif selection_chance < 40:
		river_object = spawnable_objects["Log"]
	elif selection_chance < 60:
		river_object = spawnable_objects["Otter"]
	elif selection_chance < 80:
		river_object = spawnable_objects["Turtle"]
	else:
		river_object = spawnable_objects["Catfish"]
		
	spawn_object(river_object.path, river_object.rotation)
	spawn_timer.start(randf_range(min_spawn_interval, max_spawn_interval))
	
func _on_head_two_activated():
	has_frog = true
	
func _on_ball_lost():
	if(!GameManager.is_head_two_activated):
		has_frog = false
