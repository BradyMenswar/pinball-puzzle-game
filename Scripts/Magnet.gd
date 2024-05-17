extends Area2D
var pull_strength := 14000.0


func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Ball"):
			var direction = (global_position - body.global_position).normalized()
			body.apply_force(direction * pull_strength)


func _on_body_entered(body):
	if(body.is_in_group("Ball") and body is RigidBody2D):
		set_physics_process(true)


func _on_body_exited(body):
	if(body.is_in_group("Ball") and body is RigidBody2D):
		set_physics_process(false)
