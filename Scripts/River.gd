extends Node2D

func _on_full_river_body_entered(body):
	#if body.is_in_group("Ball"):
		#body.gravity_changer = -1 * (body.base_gravity / 100)
		#body.max_speed_changer = -1 * ((body.base_max_speed) / 100)
	pass # Replace with function body.


func _on_full_river_body_exited(body):
	if body.is_in_group("Ball"):
		body.gravity_changer = 0
		body.max_speed_changer = 0
		body.update_gravity(body.base_gravity)
		body.update_max_speed(body.base_max_speed)

func _on_top_section_2_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -1
		body.external_force[1] += 0

func _on_top_section_2_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -1
		body.external_force[1] -= 0

func _on_top_section_1_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -1
		body.external_force[1] += 0

func _on_top_section_1_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -1
		body.external_force[1] -= 0

func _on_mid_section_2_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -1
		body.external_force[1] += 0

func _on_mid_section_2_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -1
		body.external_force[1] -= 0

func _on_mid_section_1_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -1
		body.external_force[1] += 0

func _on_mid_section_1_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -1
		body.external_force[1] -= 0

func _on_bottom_section_2_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -1
		body.external_force[1] += 0

func _on_bottom_section_2_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -1
		body.external_force[1] -= 0

func _on_bottom_section_1_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -1
		body.external_force[1] += 0

func _on_bottom_section_1_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -1
		body.external_force[1] -= 0

func _on_spit_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += 0
		body.external_force[1] += 3

func _on_spit_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= 0
		body.external_force[1] -= 3
