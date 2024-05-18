extends TextureProgressBar

@export var gradient: Gradient

func _on_value_changed(_value):
	tint_progress = gradient.sample(ratio)
