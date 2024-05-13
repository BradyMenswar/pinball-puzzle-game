extends StaticBody2D

@export var bounce_factor := 10

func _ready():
	physics_material_override.bounce = bounce_factor
