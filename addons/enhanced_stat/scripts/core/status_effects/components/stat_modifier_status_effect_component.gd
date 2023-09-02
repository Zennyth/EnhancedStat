extends StatusEffectComponent
class_name StatModifierStatusEffectComponent

@export var stat_modifiers: Array[StatModifier] = []


var stat_manager: StatsManager

func _enable() -> void:
	stat_manager = get_target_component(StatsManager)
	
	if stat_manager == null:
		return

	for stat_modifier in stat_modifiers:
		stat_manager.add_stat_modifier(stat_modifier)

func _disable() -> void:
	if stat_manager == null:
		return

	for stat_modifier in stat_modifiers:
		stat_manager.remove_stat_modifier(stat_modifier)