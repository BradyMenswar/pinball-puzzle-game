extends Node2D
var path_follow = Path2D.new()
var movespeed = 0.08
var frog_present = false
var timer = Timer.new()
var river_obj_array = [];
var removal_queue = [];
var rng = RandomNumberGenerator.new()
var spawn_timer = [3,6]
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.one_shot = true
	timer.autostart = false
	path_follow = get_node("Path2D")
	spawn_object()
	Events.connect("frog_not_present",set_frog_bool)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var i = 0
	while i < river_obj_array.size():
		river_obj_array[i].progress_ratio += delta * movespeed
		#resets path progress if at end
		if river_obj_array[i].progress_ratio >= 0.99:
			var node = river_obj_array[i]
			if river_obj_array[i].get_node("Frog"):
				set_frog_bool()
			removal_queue.append(i)
			node.queue_free()
		i += 1
	if removal_queue.size() > 0:
		removal_queue.reverse() 
		for j in range(0,removal_queue.size()):
			river_obj_array.remove_at(j)
		removal_queue = []
	if timer.time_left == 0:
		spawn_object()	
			


func spawn_frog():
	river_obj_array.append(PathFollow2D.new())
	var scene = load("res://Scenes/Frog.tscn")
	var instance = scene.instantiate()
	instance.rotation_degrees = 180
	river_obj_array[-1].add_child(instance)
	path_follow.add_child(river_obj_array[-1])
	
func spawn_log():
	river_obj_array.append(PathFollow2D.new())
	var scene = load("res://Scenes/Log.tscn")
	var instance = scene.instantiate()
	instance.rotation_degrees = 90
	river_obj_array[-1].add_child(instance)
	path_follow.add_child(river_obj_array[-1])
	
func spawn_object():
	var pick_object = rng.randi_range(0,100)
	if pick_object < 25 and frog_present == false:
		spawn_frog()
		frog_present = true
	elif pick_object >= 25:
		spawn_log()
	timer.wait_time = rng.randi_range(spawn_timer[0],spawn_timer[1])
	timer.start(timer.wait_time)
	
func set_frog_bool():
	frog_present = false
	
