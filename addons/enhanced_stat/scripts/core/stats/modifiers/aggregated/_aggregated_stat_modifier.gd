extends StatModifier
class_name AggregatedStatModifier


func set_apply_count(value: int) -> void:
	super(value)

	for stat_modifier in stat_modifiers:
		stat_modifier.apply_count = apply_count



var stat_modifiers: Array[StatModifier]:
	get = get_stat_modifiers

func get_stat_modifiers() -> Array[StatModifier]:
	var res: Array[StatModifier] = []

	for property in get_property_list():
		if property.usage == 4102 and get(property.name) is StatModifier:
			res.append(get(property.name) as StatModifier)
	
	return res