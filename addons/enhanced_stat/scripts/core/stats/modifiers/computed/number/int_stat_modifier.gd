extends NumberStatModifier
class_name IntStatModifier

@export var operation_value: int = 0

func get_operation_value() -> int:
	return operation_value

func apply(value: int, stat: IntStat):
	return super(value, stat)