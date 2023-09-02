@icon("res://assets/icons/materials/accuracy_icon.png")
extends Area2D
class_name Hitbox

signal _hit(hitted: Node2D)
signal _hit_hurtbox(hurtbox: Hurtbox)
signal _hit_body(body: Node2D)


var hitbox_components: Array[HitboxComponent] = []

func register_component(hitbox_component: HitboxComponent) -> void:
	hitbox_components.append(hitbox_component)

func is_hit_valid(hitted: Node2D) -> bool:
	for hitbox_component in hitbox_components:
		if !hitbox_component.is_hit_valid(hitted):
			return false
	return true


func _init():
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)

func _on_area_entered(hurtbox: Area2D) -> void:
	if !hurtbox is Hurtbox:
		return

	if !is_hit_valid(hurtbox.owner):
		return

	_hit_hurtbox.emit(hurtbox)
	_hit.emit(hurtbox)

func _on_body_entered(body: Node2D) -> void:
	if !is_hit_valid(body):
		return

	_hit_body.emit(body)
	_hit.emit(body)


@onready var collision_shape = $CollisionShape2D

func _ready() -> void:
	collision_shape.disabled = !is_multiplayer_authority()

func disable() -> void:
	collision_shape.disabled = true

func enable() -> void:
	collision_shape.disabled = false
