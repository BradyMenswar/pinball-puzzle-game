extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_deferred("disabled", true)
	print("Bottom Disabled? " + str(disabled))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_change_status():
	set_deferred("disabled", false)
	print("Bottom Disabled? " + str(disabled))
	pass # Replace with function body.
