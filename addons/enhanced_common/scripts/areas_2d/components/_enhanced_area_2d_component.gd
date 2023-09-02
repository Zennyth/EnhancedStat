@tool
extends Node2D
class_name EnhancedArea2DComponent

@onready var area: EnhancedArea2D = get_parent()

func _ready() -> void:
	area.register_component(self)


func is_node_valid(node: Node2D) -> bool:
	return true


func enable() -> void:
	pass

func disable() -> void:
	pass


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []

	if not get_parent() is EnhancedArea2D:
		warnings.append("This node is not a child of a EnhancedArea2D node.")

	return warnings
