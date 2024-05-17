extends Area2D
var is_pulling
var ball: RigidBody2D
var pull_strength := 10000.0


func _physics_process(delta):
	if(is_pulling):
		var direction = (ball.position - position).normalized()
		ball.apply_force(direction * pull_strength * delta)


func _on_body_entered(body):
	if(body.is_in_group("Ball") and body is RigidBody2D):
		is_pulling = true
		ball = body


func _on_body_exited(body):
	if(body.is_in_group("Ball") and body is RigidBody2D):
		is_pulling = false
