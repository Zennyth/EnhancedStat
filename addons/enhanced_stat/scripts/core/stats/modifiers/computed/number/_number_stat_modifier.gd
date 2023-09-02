extends ComputedStatModifier
class_name NumberStatModifier


var _add_value:
	get = get_add_value

func get_add_value():
	return 0

func apply(value, _stat):
	return value + (_add_value * apply_count)