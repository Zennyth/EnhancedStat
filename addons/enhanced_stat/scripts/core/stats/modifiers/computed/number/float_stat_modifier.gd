extends NumberStatModifier
class_name FloatStatModifier

@export var add_value: float = 0

func get_add_value() -> float:
	return add_value

func apply(value: float, stat: FloatStat):
	return super(value, stat)