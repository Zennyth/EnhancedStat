@tool
extends Node2D
class_name HitboxComponent

@onready var hitbox: Hitbox = get_parent()

func _ready() -> void:
	if !is_multiplayer_authority():
		return

	hitbox.register_component(self)
	hitbox._hit_hurtbox.connect(_hit_hurtbox)
	hitbox._hit_body.connect(_hit_body)
	hitbox._hit.connect(_hit)


func is_hit_valid(_hitted: Node2D) -> bool:
	return true

func _hit_hurtbox(_hutbox: Hurtbox) -> void:
	pass

func _hit_body(_body: Node2D) -> void:
	pass

func _hit(_hitted: Node2D) -> void:
	pass

func enable() -> void:
	pass

func disable() -> void:
	pass


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []

	if not get_parent() is Hitbox:
		warnings.append("This node is not a child of a Hitbox node.")

	return warnings
