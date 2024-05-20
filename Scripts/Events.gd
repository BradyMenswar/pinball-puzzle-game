extends Node

signal ball_lost
signal lives_changed(lives)
signal game_over
signal spawn_new_ball
signal head_one_activated
signal tilt_changed(tilt)
signal tilt_maxed()
signal tilt_restored()
# Probably could move this into the frog scene because I doubt anything else will need this signal
signal frog_not_present
