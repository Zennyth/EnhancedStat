@icon("res://assets/icons/materials/goal_icon.png")
extends Area2D
class_name Hurtbox

signal _hurt(hit_data: HitData)

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@export var stats: StatsManager

@export var is_invincible: bool = false:
	set(value):
		is_invincible = value
		if collision_shape:
			collision_shape.disabled = is_invincible

func _ready():
	assert(collision_shape != null, "collision_shape:CollisionShape2D cannot be null")
	assert(stats != null, "stats:StatsManager cannot be null")
	collision_shape.disabled = is_invincible

@rpc("call_local", "any_peer")
func hurt(hit_data_dict: Dictionary):
	var hit_data: HitData = HitData.from_dictionary(self, hit_data_dict)
	_hurt.emit(hit_data)


var hurtbox_components: Array[HurtboxComponent] = []

func register_component(hurtbox_component: HurtboxComponent) -> void:
	hurtbox_components.append(hurtbox_component)
