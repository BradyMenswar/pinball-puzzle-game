extends Node2D

@export var impulse_strength: float = 200.0

@onready var shape_cast: ShapeCast2D = $BounceComponent

func _physics_process(_delta):
	if shape_cast.is_colliding():
		var collider = shape_cast.get_collider(0)
		if collider and collider.has_method("apply_impulse"):
			var collision_normal = shape_cast.get_collision_normal(0)
			var impulse = collision_normal * impulse_strength
			collider.apply_impulse(-impulse)
