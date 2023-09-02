extends RefCounted
class_name HitData

var damage: int = 0

var knockback_force: int = 300
var knockback_direction: Vector2 = Vector2.ZERO

var source_entity: Node2D

func _init(_knockback_force: int, _knockback_direction: Vector2, _source_entity: Node2D, _damage: int) -> void:
	knockback_force = _knockback_force
	knockback_direction = _knockback_direction
	source_entity = _source_entity
	damage = _damage



###
# NETWORKING
###
func to_dictionary() -> Dictionary:
	return {
		"damage": damage,
		"knockback_force": knockback_force,
		"knockback_direction": knockback_direction,
		"source_entity_path": source_entity.get_path(),
	}

static func from_dictionary(owner: Node, dict: Dictionary) -> HitData:
	return HitData.new(dict.knockback_force, dict.knockback_direction, owner.get_node_or_null(dict.source_entity_path), dict.damage) 
