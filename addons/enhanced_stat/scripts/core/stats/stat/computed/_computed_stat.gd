extends Stat
class_name ComputedStat


###
# CORE
###
var _value

func get_value():
	return _value

func compute() -> void:
	var computed = base_value

	for stat_modifier in stat_modifiers:
		computed = stat_modifier.apply(computed, self)
	
	_value = computed
	value_changed.emit()


###
# STAT MODIFIERS
###
var stat_modifiers: Array[StatModifier] = []

func add_stat_modifier(stat_modifier: StatModifier) -> void:
	stat_modifiers.append(stat_modifier)
	stat_modifier.apply_count_changed.connect(compute)
	compute()

func remove_stat_modifier(stat_modifier: StatModifier) -> void:
	stat_modifiers.erase(stat_modifier)
	stat_modifier.apply_count_changed.disconnect(compute)
	compute()

func clear_stat_modifiers() -> void:
	for stat_modifier in stat_modifiers:
		stat_modifier.apply_count_changed.disconnect(compute)

	stat_modifiers = []
	compute()



###
# CONSTRUCTOR
###
func _init(_base_value = base_value) -> void:
	base_value = _base_value
	compute()
