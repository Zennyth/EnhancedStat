extends NumberStat
class_name FloatStat

@export var default_value: float = .0:
	set(_default_value):
		default_value = _default_value
		base_value = default_value
		_value = default_value
