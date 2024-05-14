extends Node2D

@export var impulse_strength: float = 6000.0

@onready var shape_cast: ShapeCast2D = $ShapeCast2D

func _process(_delta):
	if shape_cast.is_colliding():
		var collider = shape_cast.get_collider(0)
		if collider and collider.has_method("apply_impulse"):
			var collision_normal = shape_cast.get_collision_normal(0)
			var impulse = collision_normal * impulse_strength
			#collider.linear_velocity = Vector2.ZERO
			collider.apply_impulse(-impulse)
