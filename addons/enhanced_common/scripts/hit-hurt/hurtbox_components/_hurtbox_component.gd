@tool
extends Node
class_name HurtboxComponent

@onready var hurtbox: Hurtbox = get_parent()

func _ready() -> void:
	if !is_multiplayer_authority():
		return
	
	hurtbox.register_component(self)


func enable() -> void:
	pass

func disable() -> void:
	pass


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []

	if not get_parent() is Hurtbox:
		warnings.append("This node is not a child of a Hurtbox node.")

	return warnings