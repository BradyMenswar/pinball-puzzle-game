extends Node2D

@export var animation_name: String = "flip"
@export var flipper_speed := 5.0
var is_right := false
var flip_action := "paddle_left"
var is_reversed: bool = false
var is_active: bool = false
var tilt_maxed := false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var tilt_timer = $"../Tilt Maxed"

func configure_flipper():
	animation_player.speed_scale = flipper_speed
	if is_right:
		flip_action = "paddle_right"
		
func _ready():
	Events.connect("tilt_maxed", _on_tilt_maxed)
	Events.connect("ball_lost", _on_ball_lost)
	configure_flipper()

func _input(event):
	if Input.is_action_pressed(flip_action) && !is_active && !tilt_maxed:
		play_animation()
	if event.is_action_released(flip_action) && is_active && !tilt_maxed:
		reverse_animation()

func play_animation():
	animation_player.play(animation_name)
	is_reversed = false

func reverse_animation():
	animation_player.play_backwards(animation_name)
	is_reversed = true

func _on_animation_player_animation_finished(_anim_name):
	if(!is_reversed):
		is_active = true
		if !Input.is_action_pressed(flip_action):
			reverse_animation()
			
func _on_tilt_maxed():
	tilt_maxed = true
	if !is_reversed:
		reverse_animation()
	tilt_timer.start(GameManager.tilt_lockout)
	
func _on_ball_lost():
	tilt_maxed = false

func _on_animation_player_animation_started(_anim_name):
	is_active = false

func _on_tilt_maxed_timeout():
	tilt_maxed = false
