extends NumberStat
class_name IntStat

@export var default_value: int = 0:
	set(_default_value):
		default_value = _default_value
		base_value = default_value
		_value = default_value
