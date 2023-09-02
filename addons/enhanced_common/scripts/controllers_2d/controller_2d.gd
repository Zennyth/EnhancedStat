@icon("res://addons/enhanced_common/icons/icons8-puppet-24-blue.png")
extends Node2D
class_name Controller2D

signal move_direction_changed(direction: Vector2)
signal standing
signal moving

signal aim_direction_changed(direction: Vector2)


@export var directional_strength_threshold: float = .0
@export var is_controllable: bool = true



var move_direction: Vector2 = Vector2.ZERO:
	set = set_move_direction

func set_move_direction(value) -> void:
	if !is_controllable:
		value = Vector2.ZERO

	var has_changed: bool = move_direction != value
	move_direction = value

	if !has_changed:
		return
	
	move_direction_changed.emit(move_direction)
	
	if is_above_threshold(move_direction) and is_controllable:
		moving.emit()
	else:
		standing.emit()


var aim_direction: Vector2 = Vector2.ZERO:
	set = set_aim_direction

func set_aim_direction(value) -> void:
	if !is_controllable:
		return

	var has_changed: bool = aim_direction != value
	aim_direction = value

	if !has_changed:
		return
	
	aim_direction_changed.emit(aim_direction)


func is_above_threshold(vector: Vector2) -> bool:
	return vector.length_squared() > directional_strength_threshold