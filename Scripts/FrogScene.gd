extends Node2D
var path_follow = PathFollow2D.new()
var movespeed = 0.05
# Called when the node enters the scene tree for the first time.
func _ready():
	path_follow = get_node("Path2D/PathFollow2D")
	spawn_frog()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress_ratio += delta * movespeed
	#resets path progress if at end
	if path_follow.progress_ratio >= 0.99:
		path_follow.progress = 0;
		Events.emit_signal("frog_at_end")
		spawn_frog()


func spawn_frog():
	var scene = load("res://Scenes/Frog.tscn")
	var instance = scene.instantiate()
	path_follow.add_child(instance)
	path_follow.progress = 0
