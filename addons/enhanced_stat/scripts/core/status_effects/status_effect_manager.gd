@icon("res://addons/enhanced_stat/icons/icons8-system-task-24.png")
extends Node
class_name StatusEffectManager

signal _status_effect_added(status_effect: StatusEffect)
signal _status_effect_removed(status_effect: StatusEffect)


var status_effects: Dictionary = {}

func add_status_effect(status_effect: StatusEffect) -> void:
	if status_effect == null:
		return

	if status_effects.has(status_effect.id):
		var current_status_effect = status_effects[status_effect.id]

		if status_effect.intensity == current_status_effect.intensity:
			status_effects[status_effect.id].reset()
			return
		
		if status_effect.intensity < current_status_effect.intensity:
			return
		
		remove_status_effect(current_status_effect)

	status_effects[status_effect.id] = status_effect
	status_effect.enable()
	status_effect._disabled.connect(remove_status_effect.bind(status_effect), CONNECT_ONE_SHOT)
	_status_effect_added.emit(status_effect)
  
func remove_status_effect(status_effect: StatusEffect) -> void:
	if status_effect == null:
		return

	if not status_effects.has(status_effect.id):
		return

	status_effect.disable()
	status_effects.erase(status_effect.id)
	_status_effect_removed.emit(status_effect)

func clear_status_effects() -> void:
	for status_effect in status_effects.values():
		remove_status_effect(status_effect)


func _physics_process(delta: float) -> void:
	for status_effect in status_effects.values():
		status_effect.tick(delta)
