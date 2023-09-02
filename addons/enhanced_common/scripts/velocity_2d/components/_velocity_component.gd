@tool
@icon("res://assets/icons/materials/forward_icon.png")
extends Node
class_name Velocity2DComponent

@onready var velocity: Velocity2D = get_parent():
    set = set_velocity



func set_velocity(value) -> void:
    velocity = value
    update_configuration_warnings()

func _get_configuration_warnings() -> PackedStringArray:
    var warnings: PackedStringArray = []

    if not get_parent() is Velocity2D:
        warnings.append("This node is not a child of a State node.")

    return warnings
