extends Node2D
#
@export var is_right = false

@onready var flipper_body = $"Flipper Collision"

func _ready():
	configure_flipper()

func configure_flipper():
	flipper_body.is_right = is_right
	flipper_body.configure_flipper()
