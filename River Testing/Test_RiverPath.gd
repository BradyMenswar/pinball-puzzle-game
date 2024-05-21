extends Node2D


@onready var path = $Path2D
@onready var spawn_timer = $Spawn

@export var move_speed = 0.08
@export var min_spawn_interval := 10.0
@export var max_spawn_interval := 20.0

enum SpawnableObject {Path, Rotation}

@export var spawnable_objects := {
	"Frog": ["res://River Testing/Test_Frog.tscn", 180],
	"Log": ["res://River Testing/Test_Log.tscn", 90]
}

var has_frog = false

func _ready():
	spawn_timer.start(1)

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
	var river_object = null
	if selection_chance < 25 and !has_frog:
		has_frog = true
		river_object = spawnable_objects["Frog"]
	else:
		river_object = spawnable_objects["Log"]
	spawn_object(river_object[SpawnableObject.Path], river_object[SpawnableObject.Rotation])
	spawn_timer.start(randf_range(min_spawn_interval, max_spawn_interval))
