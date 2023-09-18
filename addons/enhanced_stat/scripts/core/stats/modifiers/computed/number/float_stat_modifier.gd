extends NumberStatModifier
class_name FloatStatModifier

@export var operation_value: float = 0

func get_operation_value() -> float:
	return operation_value

func apply(value: float, stat: FloatStat):
	return super(value, stat)