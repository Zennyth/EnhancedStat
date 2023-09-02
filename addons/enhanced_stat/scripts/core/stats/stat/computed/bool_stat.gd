extends ComputedStat
class_name BoolStat

@export var default_value: bool = false:
	set(_default_value):
		default_value = _default_value
		base_value = default_value
		_value = default_value
