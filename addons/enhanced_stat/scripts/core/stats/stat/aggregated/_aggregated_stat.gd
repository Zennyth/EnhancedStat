extends Stat
class_name AggregatedStat


###
# CORE
###
var _value:
	set = set_value

func get_value():
	return _value

func set_value(new_value):
	var is_different: bool = new_value != _value
	_value = new_value

	if is_different:
		value_changed.emit()


###
# STAT MODIFIERS
###
var internal_stats: Array[Stat]:
	get = get_internal_stats

func get_internal_stats() -> Array[Stat]:
	var res: Array[Stat] = []

	for property in get_property_list():
		if property.usage == 4102 and get(property.name) is Stat:
			res.append(get(property.name) as Stat)
	
	return res


func add_stat_modifier(stat_modifier: StatModifier) -> void:
	for property in stat_modifier.get_property_list():
		if !property.name in self or !get(property.name) is Stat or stat_modifier.get(property.name) == null:
			continue
		
		get(property.name).add_stat_modifier(stat_modifier.get(property.name))
		
func remove_stat_modifier(stat_modifier: StatModifier) -> void:
	for property in stat_modifier.get_property_list():
		if !property.name in self or !get(property.name) is Stat:
			continue
		
		get(property.name).remove_stat_modifier(stat_modifier.get(property.name))

func clear_stat_modifiers() -> void:
	for internal_stat in internal_stats:
		internal_stat.clear_stat_modifiers()
