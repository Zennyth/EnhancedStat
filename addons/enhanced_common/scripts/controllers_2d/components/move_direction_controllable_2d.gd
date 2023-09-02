@icon("res://addons/enhanced_common/icons/icons8-left-and-right-arrows-24-blue.png")
extends Node2D
class_name MoveDirectionControllable2D

@export var controller: Controller2D
@export var target: Node2D
@export var inverse_rotation: bool = false


func _ready() -> void:
	controller.moving.connect(_on_moving)

func _on_moving() -> void:
	target.scale.x = -1 if get_orientation_from_direction(controller.move_direction) else 1


func get_orientation_from_direction(direction: Vector2) -> bool:
	return direction.x > 0 if inverse_rotation else direction.x < 0


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []

	if controller == null:
		warnings.append("MoveDirectionControllable2D must have a controller configured.")
	
	if controller == null:
		warnings.append("MoveDirectionControllable2D must have a target to apply rotation to.")

	return warnings
