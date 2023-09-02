extends ComputedStatModifier
class_name BoolStatModifier

@export var new_value: bool = false

func apply(_value: bool, _stat: BoolStat):
	return new_value