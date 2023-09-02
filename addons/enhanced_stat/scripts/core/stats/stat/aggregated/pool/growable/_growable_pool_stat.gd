extends PoolStat
class_name GrowablePoolStat

signal leveled_up

@export var level: int = 1

func grow() -> void:
	pass

func set_value(new_value) -> void:
	if _value == null or new_value < _max.value:
		return super(new_value)
	
	var difference = new_value - _max.value
	grow()
	level += 1
	value_changed.emit()
	leveled_up.emit()
	set_value(difference)
