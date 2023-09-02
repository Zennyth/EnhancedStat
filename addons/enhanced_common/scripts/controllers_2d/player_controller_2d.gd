extends Controller2D
class_name PlayerController2D

func _input(_event: InputEvent) -> void:
	aim_direction = (get_global_mouse_position() - global_position).normalized()
	move_direction = Vector2(
		Input.get_action_strength("ctrl_right") - Input.get_action_strength("ctrl_left"), 
		Input.get_action_strength("ctrl_down") - Input.get_action_strength("ctrl_up")
	).normalized()