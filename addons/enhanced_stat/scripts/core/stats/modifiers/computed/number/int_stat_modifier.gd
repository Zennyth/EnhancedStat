extends NumberStatModifier
class_name IntStatModifier

@export var add_value: int = 0

func get_add_value() -> int:
	return add_value

func apply(value: int, stat: IntStat):
	return super(value, stat)