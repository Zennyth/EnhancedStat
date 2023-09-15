@icon("res://addons/enhanced_stat/icons/ecg_icon.png")
extends Node
class_name StatusEffectApplier

@export var status_effects: Array[StatusEffect] = []

func apply(target: Node) -> void:
	var status_effect_manager: StatusEffectManager = NodeUtils.find_node(target, StatusEffectManager)

	if status_effect_manager == null or status_effects == null:
		return

	for status_effect in status_effects:
		var instance: StatusEffect = status_effect.duplicate()
		instance.target = target
		
		status_effect_manager.add_status_effect(instance)



func remove(target: Node) -> void:
	var status_effect_manager: StatusEffectManager = NodeUtils.find_node(target, StatusEffectManager)

	if status_effect_manager == null or status_effects == null:
		return
	
	for status_effect in status_effects:
		var instance: StatusEffect = status_effect.duplicate()
		
		status_effect_manager.remove_status_effect(instance)
