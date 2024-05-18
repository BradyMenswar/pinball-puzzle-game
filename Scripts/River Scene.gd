extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_full_river_body_entered(body):
	if body.is_in_group("Ball"):
		body.gravity_changer = -1 * (body.base_gravity / 75)
		body.max_speed_changer = -1 * ((0.75*body.base_max_speed) / 60)
	pass # Replace with function body.


func _on_full_river_body_exited(body):
	if body.is_in_group("Ball"):
		body.gravity_changer = 0
		body.max_speed_changer = 0
		body.update_gravity(body.base_gravity)
		body.update_max_speed(body.base_max_speed)
	pass # Replace with function body.


func _on_top_section_2_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -30
		body.external_force[1] += 50
	pass # Replace with function body.


func _on_top_section_2_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -30
		body.external_force[1] -= 50
	pass # Replace with function body.
	



func _on_top_section_1_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += 5
		body.external_force[1] += 50
	pass # Replace with function body.


func _on_top_section_1_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= 5
		body.external_force[1] -= 50
	pass # Replace with function body.
	
	


func _on_mid_section_2_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -70
		body.external_force[1] += -15
	pass # Replace with function body.


func _on_mid_section_2_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -70
		body.external_force[1] -= -15
	pass # Replace with function body.


func _on_mid_section_1_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -20
		body.external_force[1] += 5
	pass # Replace with function body.


func _on_mid_section_1_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -20
		body.external_force[1] -= 5
	pass # Replace with function body.


func _on_bottom_section_2_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -80
		body.external_force[1] += -40
	pass # Replace with function body.


func _on_bottom_section_2_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -80
		body.external_force[1] -= -40
	pass # Replace with function body.


func _on_bottom_section_1_body_entered(body):
	if body.is_in_group("Ball"):
		body.external_force[0] += -60
		body.external_force[1] += 20
	pass # Replace with function body.


func _on_bottom_section_1_body_exited(body):
	if body.is_in_group("Ball"):
		body.external_force[0] -= -60
		body.external_force[1] -= 20
	pass # Replace with function body.
