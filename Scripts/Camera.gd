extends Camera2D

@onready var animation_player = $AnimationPlayer

func _ready():
	Events.connect("ball_lost", _on_ball_lost)

func _process(_delta):
	var balls = get_tree().get_nodes_in_group("Ball")
	if balls.size() > 0:
		global_position.y = balls[0].global_position.y
		
func _on_ball_lost(_lose_life):
	var animation = animation_player.get_animation("reset_ball")
	var track = 0
	animation.track_set_key_value(track, 0, position)
	animation_player.play("reset_ball")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "reset_ball":
		Events.emit_signal("spawn_new_ball", GameManager.ball_spawn_location.x, GameManager.ball_spawn_location.y, 0, 0)
