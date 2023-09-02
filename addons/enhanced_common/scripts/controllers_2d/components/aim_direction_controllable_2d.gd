@icon("res://assets/icons/materials/icons8-3d-rotate-24.png")
extends Node2D
class_name AimDirectionControllable2D

@export var controller: Controller2D
@export var target: Node2D

func _ready() -> void:
	controller.aim_direction_changed.connect(_on_aim_direction_changed)

func _on_aim_direction_changed(direction: Vector2) -> void:
	var angle := direction.angle()
	
	target.rotation = angle
	if target != null:
		var needs_reversing: bool = abs(angle) > 1.5708
		target.scale.y = -1 if needs_reversing else 1