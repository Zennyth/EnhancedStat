extends PoolStat
class_name FloatPoolStat


@export var max: FloatStat = FloatStat.new():
	set(_max_value):
		max = _max_value
		_max = max
		set_default_value(default_value)

@export var min: FloatStat = FloatStat.new():
	set(_min_value):
		min = _min_value
		_min = min
		set_default_value(default_value)

@export var default_value: float = 0:
	set(_default_value):
		default_value = _default_value
		set_default_value(default_value)