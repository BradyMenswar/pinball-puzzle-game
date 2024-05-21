extends CanvasLayer

@onready var max_speed_label = $"Control/HFlowContainer/Max Speed"
@onready var gravity_scale_label = $"Control/HFlowContainer/Gravity Scale"
@onready var ball = $".."

func _process(_delta):
	max_speed_label.text = "Max Speed: " + str(ball.max_speed)
	gravity_scale_label.text = "Gravity Scale:" + str(ball.gravity_scale)
	
